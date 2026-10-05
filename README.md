# Ring Language AI Skill & Reference (Ring 1.27)

A modular, production-ready AI Skill and comprehensive knowledge base for the **Ring programming language (v1.27)**. Designed specifically for Large Language Models (LLMs), AI pair programmers, and agentic workflows (e.g., Google Antigravity, Claude Code, Cursor, Hermes, Copilot).

---

## 🌟 Key Features

- **⚡ Fast Built-in Cheatsheet**: Immediate in-context access to Ring's most common built-in functions, types, I/O, and string/list operations.
- **🛡️ Session-Hardened Pitfalls**: Battle-tested edge cases and gotchas documented from real-world execution sessions (e.g., 1-based indexing, no `main()` wrapper, `{ else }` placement, silent top-level code swallowing, `new Class()` constructor dynamics).
- **📚 Categorized Built-in Reference**: Complete catalog of all 258 native C functions grouped by domain (Strings, Lists, Files/IO, Math, System, Reflection).
- **🚨 Error Codes Catalog**: Detailed compiler (`C1–C31`), runtime (`R1–R54`), environment (`E1–E14`), and scanner warning lookup tables with causes and fixes.
- **🧵 Concurrency & Extensions Guide**: Complete breakdown of all 5 threading libraries in Ring (`ringthreads`, `ringlibuv`, `ringallegro`, `ringsdl`, `ringqt`) and low-level C bindings.
- **📦 Ready-to-Use Templates**: Clean Style 3 (Brace-style `{}`) application boilerplate for CLI, RingQt Desktop GUI, and Web apps.

---

## 📁 Repository Structure

```text
ring-lang-skill/
├── SKILL.md                  # Main AI Skill definition, coding standard, and cheatsheet
├── README.md                 # Project documentation and setup guide
├── references/               # Modular, high-signal reference manuals
│   ├── builtins.md           # Categorized lookup of all 258 built-in functions
│   ├── core.md               # Grammar, keywords, scanner commands, and syntax styles
│   ├── errors.md             # Compiler, Runtime, and Environment error codes
│   ├── functions.md          # Function declaration, scope, recursion, and pass-by-reference
│   ├── lists.md              # 1-based lists, multi-dimensional matrices, and hash tables
│   ├── oop.md                # Classes, declarative braces {}, getters/setters, and inheritance
│   ├── strings.md            # String literals, transformations, and methods
│   ├── vm.md                 # Bytecode instruction set (ICO_*)
│   ├── ring_execution_pitfalls.md       # Execution model and top-level code order
│   ├── ring_syntax_pitfalls_session.md  # Style 3 brace-syntax gotchas
│   ├── ring_qt_gui_pitfalls.md          # RingQt event-handling and Qt GUI traps
│   └── ring_threads_libraries.md        # Concurrency libraries & performance comparison
├── templates/                # Starter boilerplate applications
│   ├── console_app.ring      # Interactive CLI application template
│   ├── gui_app.ring          # Modern RingQt desktop GUI template
│   └── web_app.ring          # Web application template
└── convert_clean.ring        # Documentation converter and markdown cleaner
```

---

## 🚀 Installation & Usage

### 1. Antigravity AI Agent
Place this repository in your workspace or global skills directory:
- **Workspace Skills**: Copy to `.agents/skills/ring-lang/` inside your project root.
- **Global Skills**: Copy to `~/.gemini/config/skills/ring-lang/` (or `~/.gemini/antigravity-ide/builtin/skills/ring-lang/`).

The agent will automatically discover the `ring-lang` skill when reading or writing Ring code.

### 2. Cursor / Claude Code / Custom Agents
Add this repository to your project's rules, context folder, or system prompt references so the agent loads `SKILL.md` when processing `.ring` files.

---

## 📝 Coding Standard: Style 3 (Brace-Style `{}`)

Ring supports multiple syntax styles. By default, write all new code in **Style 3 (Brace-Style)**:

```ring
# Simple Console Example in Ring
load "stdlibcore.ring"

func main {
    aUsers = ["Alice", "Bob", "Charlie"]
    
    for cName in aUsers {
        greetUser(cName)
    }
}

func greetUser cName {
    if trim(cName) = "" {
        ? "Hello, Anonymous!"
    else
        ? "Hello, " + cName + "!"
    }
}
```

> **⚠️ Critical Syntax Rule:** `else` and `elseif` must be placed **INSIDE** the closing brace (`if cond { ... else ... }`). Writing `} else {` causes Runtime Error **R24** (`Using uninitialized variable: else`).

---

## 🔍 Dry-Run & Verification Protocol

Agents should verify generated Ring scripts using the compiler's dry-run flag before execution:

```bash
# Verify syntax without executing side effects
ring script.ring -norun

# Inspect token stream
ring script.ring -tokens
```

---

## 📄 License

This skill and documentation package is open source and distributed under the **MIT License**.
