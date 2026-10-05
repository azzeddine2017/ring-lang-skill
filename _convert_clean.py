"""
RST → Markdown converter for Ring documentation source files.
Handles: .. index::, .. code-block::, .. note::, .. tip::, titles (==== / ---- / ~~~~),
lists (* / -), inline formatting, and code preservation.
"""

import re
from pathlib import Path


def convert_rst_to_md(text: str) -> str:
    lines = text.split("\n")
    out = []
    i = 0
    n = len(lines)

    while i < n:
        raw = lines[i]
        line = raw.strip()

        # 1. السطور الفارغة
        if not line:
            if out and out[-1] != "":
                out.append("")
            i += 1
            continue

        if re.match(r"^(single|pair|triple):", line):
            i += 1
            continue
        # 2. كتل الفهارس (.. index::) مع الأسطر التابعة لها
        if re.match(r"^\.\.\s+index::", line) or re.match(r"^(single|pair|triple):", line):
            i += 1
            while i < n and (
                lines[i].startswith(" ")
                or lines[i].startswith("\t")
                or re.match(r"^\s*(single|pair|triple):", lines[i])
            ):
                i += 1
            continue

        # 3. كتل الأكواد عبر .. code-block::
        m_cb = re.match(r"^\.\.\s+code-block::\s*(\w+)?", line)
        if m_cb:
            lang = m_cb.group(1) or "ring"
            if lang in ("ring", "none"):
                lang = "ring"

            i += 1
            code_lines, i = _extract_indented_block(lines, i)
            out.append(f"```{lang}")
            out.extend(code_lines)
            out.append("```\n")
            continue

        # 4. الملاحظات والتنبيهات (.. note:: / .. tip::)
        m_admonition = re.match(r"^\.\.\s+(note|tip|warning|important)::", line)
        if m_admonition:
            adm_type = m_admonition.group(1).capitalize()
            i += 1
            adm_lines, i = _extract_indented_block(lines, i)
            if adm_lines:
                out.append(f"> **{adm_type}:**")
                for al in adm_lines:
                    out.append(f"> {al}")
                out.append("")
            continue

        # 5. تجاهل توجيهات RST الأخرى (مثل :ref:, إلخ)
        if (
            line.startswith("..")
            or (line.startswith(":") and line.endswith(":"))
            or re.match(r"^:(field|param|type|return):", line)
        ):
            i += 1
            continue

        # 6. العناوين السفلية (Underline Titles: ===, ---, ~~~)
        if (
            i + 1 < n
            and lines[i + 1].strip()
            and re.match(r"^([=\-~^])\1{2,}$", lines[i + 1].strip())
        ):
            underline_char = lines[i + 1].strip()[0]
            heading_levels = {"=": "#", "-": "##", "~": "###", "^": "####"}
            level = heading_levels.get(underline_char, "##")
            out.append(f"{level} {line}")
            i += 2
            continue

        # 7. العناوين المحاطة (= Title = أو - Title -)
        m_enc_h1 = re.match(r"^=+\s*(.+?)\s*=+$", line)
        if m_enc_h1:
            out.append(f"# {m_enc_h1.group(1).strip()}")
            i += 1
            continue

        m_enc_h2 = re.match(r"^-+\s*(.+?)\s*-+$", line)
        if m_enc_h2:
            out.append(f"## {m_enc_h2.group(1).strip()}")
            i += 1
            continue

        # 8. القوائم النقطية (Lists)
        if line.startswith(("* ", "- ", "+ ")):
            content = line[2:].strip()
            if not re.match(r"^(pair:|single:|index::)", content):
                out.append(f"- {_clean_inline_rst(content)}")
            i += 1
            continue

        # 9. أسطر النص العادية مع تنظيف التنسيق الداخلي
        out.append(_clean_inline_rst(line))
        i += 1

    return "\n".join(out)


def _extract_indented_block(lines: list, start_idx: int) -> tuple:
    """استخراج الكتلة ذات المسافة البادئة مع الحفاظ على التنسيق الداخلي"""
    block_lines = []
    base_indent = None
    i = start_idx
    n = len(lines)

    # تخطي الأسطر الفارغة في البداية
    while i < n and not lines[i].strip():
        i += 1

    while i < n:
        raw_line = lines[i]
        stripped = raw_line.strip()

        # سطر فارغ داخل الكتلة
        if not stripped:
            block_lines.append("")
            i += 1
            continue

        # حساب المسافة البادئة
        indent = len(raw_line) - len(raw_line.lstrip())

        # إذا لم يكن مسافة بادئة (انتهت الكتلة)
        if indent == 0 and not raw_line.startswith("\t"):
            break

        if base_indent is None:
            base_indent = indent

        # إزالة المسافة البادئة الأساسية فقط
        if len(raw_line) >= base_indent:
            clean_line = raw_line[base_indent:]
        else:
            clean_line = stripped

        block_lines.append(clean_line.rstrip())
        i += 1

    # إزالة الأسطر الفارغة الزائدة في نهاية الكتلة
    while block_lines and block_lines[-1] == "":
        block_lines.pop()

    return block_lines, i


def _clean_inline_rst(text: str) -> str:
    """تحويل التنسيق الداخلي لـ RST إلى Markdown"""
    # تحويل ``code`` إلى `code`
    text = re.sub(r"``(.+?)``", r"`\1`", text)
    # تحويل :ref:`Title <target>` إلى Title
    text = re.sub(r":ref:`([^<`]+)<[^>]+>`", r"\1", text)
    text = re.sub(r":ref:`([^`]+)`", r"\1", text)
    # تحويل :doc:`Title <target>` إلى Title
    text = re.sub(r":doc:`([^<`]+)<[^>]+>`", r"\1", text)
    text = re.sub(r":doc:`([^`]+)`", r"\1", text)
    return text


def process_file(src: Path, dst: Path, append: bool = False):
    if not src.exists():
        print(f"  ⚠️  skip (not found): {src.name}")
        return
    content = src.read_text(encoding="utf-8", errors="replace")
    md = convert_rst_to_md(content)
    if append and dst.exists():
        existing = dst.read_text(encoding="utf-8", errors="replace").rstrip()
        dst.write_text(existing + "\n\n---\n\n" + md.strip(), encoding="utf-8")
        print(
            f"  🔗 combined {len(md)} chars → {dst.name} (total {len(existing + md)} chars)"
        )
    else:
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_text(md, encoding="utf-8")
        print(f"  ✅ {len(md)} chars → {dst.name}")


import sys

# ── 1. Primary reference files ──────────────────────────────────────────
SRC_DIR = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("C:/ring/documents/build/html/_sources")
OUT_DIR = Path(sys.argv[2]) if len(sys.argv) > 2 else Path(__file__).parent

primary = [
    ("reference.txt", "reference/core.md"),
    ("strings.txt", "reference/strings.md"),
    ("functions.txt", "reference/functions.md"),
    ("lists.txt", "reference/lists.md"),
    ("oop.txt", "reference/oop.md"),
]
for src_name, dst_rel in primary:
    process_file(SRC_DIR / src_name, OUT_DIR / dst_rel, append=False)

# ── 2. other.md — key additional chapters ──────────────────────────────
key_other = [
    "scope.txt",
    "scope2.txt",
    "metaprog.txt",
    "declarative.txt",
    "natural.txt",
    "naturallibrary.txt",
    "syntaxflexibility.txt",
    "typehints.txt",
    "debug.txt",
    "ringemb.txt",
    "extension.txt",
    "extension_tutorial.txt",
    "embedding.txt",
    "codegenerator.txt",
    "compiler.txt",
    "distribute.txt",
    "distribute_ring2exe.txt",
    "sourcecode.txt",
    "faq.txt",
    "introduction.txt",
    "getting_started.txt",
    "getting_started2.txt",
    "getting_started3.txt",
    "controlstructures.txt",
    "controlstructures2.txt",
    "controlstructures3.txt",
    "getinput.txt",
    "functions2.txt",
    "functions3.txt",
    "programstructure.txt",
    "dateandtime.txt",
    "checkandconvert.txt",
    "mathfunc.txt",
    "files.txt",
    "systemfunc.txt",
    "evaldebug.txt",
    "fp.txt",
    "mysql.txt",
    "sqlite.txt",
    "postgresql.txt",
    "secfunc.txt",
    "web.txt",
    "csvlib.txt",
    "jsonlib.txt",
    "httplib.txt",
]
other_parts = []
for fname in key_other:
    src = SRC_DIR / fname
    if not src.exists():
        continue
    content = src.read_text(encoding="utf-8", errors="replace")
    md = convert_rst_to_md(content)
    other_parts.append(f"## {fname.replace('.txt','')}\n\n{md.strip()}\n\n")

dst = OUT_DIR / "reference/other.md"
dst.parent.mkdir(parents=True, exist_ok=True)
dst.write_text("\n".join(other_parts), encoding="utf-8")
print(f"  ✅ other.md → {len(''.join(other_parts))} chars")

# ── 3. archive/ — split into categorized files ──────────────────────
if SRC_DIR.exists():
    all_src = list(SRC_DIR.glob("*.txt"))
    seen = set(n.replace(".txt", "") for n in key_other + [p[0] for p in primary])
    
    categories = {
        "gui_qt.md": ["qt", "qtclassesdoc", "qt3d", "qtmobile", "qtwebassembly", "formdesigner"],
        "games.md": ["gameengine", "gameengineandorid", "allegro", "libsdl", "goldmagic800"],
        "c_extensions.md": ["lowlevel", "libcurl", "libui", "libuv", "operators", "foxringfuncsdoc"],
        "databases.md": ["odbc"],
        "tools_cloud.md": ["ring_cloud", "ring_cloud_cgi", "deployincloud", "codeeditors", 
                           "demo", "contribute", "generalinfo", "languagedesign", 
                           "performancetips", "resources", "bignumber", "multilanguage"]
    }
    sec_to_cat = {}
    for cat_file, secs in categories.items():
        for sec in secs:
            sec_to_cat[sec] = cat_file

    cat_parts = {cat: [] for cat in categories.keys()}
    cat_parts["misc.md"] = []

    for src in sorted(all_src):
        name = src.stem
        if name in seen:
            continue
        content = src.read_text(encoding="utf-8", errors="replace")
        md = convert_rst_to_md(content)
        cat_file = sec_to_cat.get(name.lower(), "misc.md")
        cat_parts[cat_file].append(f"## {name}\n\n{md.strip()}\n\n")

    for cat_file, parts in cat_parts.items():
        if not parts:
            continue
        dst = OUT_DIR / f"archive/{cat_file}"
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_text("\n".join(parts), encoding="utf-8")
        print(f"  ✅ archive/{cat_file} → {len(''.join(parts))} chars ({len(parts)} files)")

    # Clean up old single archive.md if present
    old_archive = OUT_DIR / "archive/archive.md"
    if old_archive.exists():
        old_archive.unlink()
        print("  🗑️  Removed legacy monolithic archive.md")

print("\n🎉 All reference files regenerated cleanly.")