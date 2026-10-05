## allegro

# Graphics and 2D Games programming using RingAllegro

In this chapter we will learn how to use the allegro game programming library
in our Ring applications.

We have the file gamelib.ring that load the DLL library that contains wrappers for the Allegro functions

```ring
Load "allegro.rh"
if iswindows()
	LoadLib("ring_allegro.dll")
but ismacosx()
	LoadLib("libringallegro.dylib")
else
	LoadLib("libringallegro.so")
ok
```

The file gamelib.ring uses the Load instruction to execute the file allegro.rh which is a ring source
code file contains constants to be used in our programs.
Then using the function LoadLib() we can load the DLL library "ring_allegro.dll".

To write portable code we can change the gamelib.ring to check the platform before
loading the DLL/So file.

# Drawing, Animation and Input

The next example uses the Allegro library for drawing, moving objects on the screen and getting
input from the keyboard and the mouse.

```ring
Load "gamelib.ring"

al_init()
al_init_image_addon()

display = al_create_display(640,480)

al_show_native_message_box(display, "Hello", "Welcome",
			"Using Allegro from the Ring programming language",
			"", 0);

al_clear_to_color(al_map_rgb(0,0,255))

BOUNCER_SIZE = 40
bouncer_x = 10
bouncer_y = 20
bouncer = al_create_bitmap(BOUNCER_SIZE, BOUNCER_SIZE)
al_set_target_bitmap(bouncer)
al_clear_to_color(al_map_rgb(255,0,255))

for x = 1 to 30
	bouncer_x += x
	bouncer_y += x
	al_set_target_bitmap(al_get_backbuffer(display))
	al_clear_to_color(al_map_rgb(0,0,0))
	al_draw_bitmap(bouncer, bouncer_x, bouncer_y, 0)
	al_draw_bitmap(bouncer, 200+bouncer_x,200+ bouncer_y, 0)
	al_flip_display()
	al_rest(0.1)
next

al_clear_to_color(al_map_rgb(255,255,255))
image = al_load_bitmap("man2.jpg")
al_draw_bitmap(image,200,200,0)
al_flip_display()
al_rest(2)

event_queue = al_create_event_queue()
al_register_event_source(event_queue, al_get_display_event_source(display))

ev = al_new_allegro_event()
timeout = al_new_allegro_timeout()
al_init_timeout(timeout, 0.06)

FPS = 60
timer = al_create_timer(1.0 / FPS)
al_register_event_source(event_queue, al_get_timer_event_source(timer))
al_start_timer(timer)
redraw = true

SCREEN_W = 640
SCREEN_H = 480
BOUNCER_SIZE = 32
bouncer_x = SCREEN_W / 2.0 - BOUNCER_SIZE / 2.0
bouncer_y = SCREEN_H / 2.0 - BOUNCER_SIZE / 2.0
bouncer_dx = -4.0
bouncer_dy = 4.0

al_install_mouse()
al_register_event_source(event_queue, al_get_mouse_event_source())

al_install_keyboard()
al_register_event_source(event_queue, al_get_keyboard_event_source())

KEY_UP = 1
KEY_DOWN = 2
KEY_LEFT = 3
KEY_RIGHT = 4
Key = [false,false,false,false]

while true
	al_init_timeout(timeout, 0.06)
	al_wait_for_event_until(event_queue, ev, timeout)
	switch al_get_allegro_event_type(ev)
	on ALLEGRO_EVENT_DISPLAY_CLOSE
		exit
	on ALLEGRO_EVENT_TIMER

		# Animation
		if bouncer_x < 0 or bouncer_x > SCREEN_W - BOUNCER_SIZE
			bouncer_dx = -bouncer_dx
		ok

		if bouncer_y < 0 or bouncer_y > SCREEN_H - BOUNCER_SIZE
			bouncer_dy = -bouncer_dy
		ok

		bouncer_x += bouncer_dx
		bouncer_y += bouncer_dy

		# Keyboard
		if key[KEY_UP] and bouncer_y >= 4.0
			bouncer_y -= 4.0
		ok
		if key[KEY_DOWN] and bouncer_y <= SCREEN_H - BOUNCER_SIZE - 4.0
			bouncer_y += 4.0
		ok
		if key[KEY_LEFT] and bouncer_x >= 4.0
			bouncer_x -= 4.0
		ok
		if key[KEY_RIGHT] and bouncer_x <= SCREEN_W - BOUNCER_SIZE - 4.0
			bouncer_x += 4.0
		ok

		redraw = true

	on ALLEGRO_EVENT_MOUSE_AXES
		bouncer_x = al_get_allegro_event_mouse_x(ev)
		bouncer_y = al_get_allegro_event_mouse_y(ev)
	on ALLEGRO_EVENT_MOUSE_ENTER_DISPLAY
		bouncer_x = al_get_allegro_event_mouse_x(ev)
		bouncer_y = al_get_allegro_event_mouse_y(ev)
	on ALLEGRO_EVENT_MOUSE_BUTTON_UP
		exit
	on ALLEGRO_EVENT_KEY_DOWN
		switch al_get_allegro_event_keyboard_keycode(ev)
			on ALLEGRO_KEY_UP
				key[KEY_UP] = true
			on ALLEGRO_KEY_DOWN
				key[KEY_DOWN] = true
			on ALLEGRO_KEY_LEFT
				key[KEY_LEFT] = true
			on ALLEGRO_KEY_RIGHT
				key[KEY_RIGHT] = true
		off
	on ALLEGRO_EVENT_KEY_UP
		switch al_get_allegro_event_keyboard_keycode(ev)
			on ALLEGRO_KEY_UP
				key[KEY_UP] = false
			on ALLEGRO_KEY_DOWN
				key[KEY_DOWN] = false
			on ALLEGRO_KEY_LEFT
				key[KEY_LEFT] = false
			on ALLEGRO_KEY_RIGHT
				key[KEY_RIGHT] = false
			on ALLEGRO_KEY_ESCAPE
				exit
		off
	off
	if redraw and al_is_event_queue_empty(event_queue)
		redraw = false
		al_clear_to_color(al_map_rgb(0,0,0))
		al_draw_bitmap(bouncer, bouncer_x, bouncer_y, 0)
		al_flip_display()
	ok
	callgc()
end

al_destroy_timer(timer)
al_destroy_allegro_event(ev)
al_destroy_allegro_timeout(timeout)
al_destroy_event_queue(event_queue)
al_destroy_bitmap(bouncer)
al_destroy_bitmap(image)
al_destroy_display(display)
```

> **Note:**

Program Output:

At first the program display a messagebox

:alt: Displaying a messagebox from our program

Then we see two rectangles are moving on the screen

:alt: Animation - Moving two rectangles in the screen

Then we see an image displayed on the screen

:alt: Displaying an image on the screen

Finally we have one rectangle, and we see it moving all of the time on
the screen but we can control it using the Mouse and/or the Keyboard

:alt: Animation and Getting Input from keyboard and the mouse to move the object

# Using TrueType Fonts

In this example we will see how to use TrueType Fonts *.ttf in our Games using Allegro

```ring
Load "gamelib.ring"

al_init()
al_init_font_addon()
al_init_ttf_addon()

display = al_create_display(800,600)

al_clear_to_color(al_map_rgb(0,0,255))
font = al_load_ttf_font("pirulen.ttf",14,0 )
al_draw_text(font, al_map_rgb(255,255,255), 10, 10,ALLEGRO_ALIGN_LEFT,
	 "Welcome to the Ring programming language")
al_flip_display()
al_rest(2)

al_destroy_display(display)
```

Screen Shot:

:alt: Using TrueType Fonts

# Playing Sound Files

The next example play a sound file

```ring
Load "gamelib.ring"

al_init()
al_install_audio()
al_init_acodec_addon()
al_reserve_samples(1)

sample = al_load_sample( "footstep.wav" )

sampleid = al_new_allegro_sample_id()
al_play_sample(sample, 1.0, 0.0,1.0,ALLEGRO_PLAYMODE_LOOP,sampleid)

display = al_create_display(640,480)
al_clear_to_color(al_map_rgb(0,0,255))
al_flip_display()
al_rest(10)

al_destroy_allegro_sample_id(sampleid)
al_destroy_sample(sample)
al_destroy_display(display)

al_exit()
```


# Scaling and Rotating Images

The next example display and rotate an image

```ring
Load "gamelib.ring"

al_init()
al_init_image_addon()

display = al_create_display(640,480)
al_set_target_bitmap(al_get_backbuffer(display))
al_clear_to_color(al_map_rgb(255,255,255))

image = al_load_bitmap("man2.jpg")
al_draw_rotated_bitmap(image,0,0,250,250,150,0)
al_draw_scaled_bitmap(image,0,0,250,250,20,20,400,400,0)

al_flip_display()
al_rest(2)

al_destroy_bitmap(image)
al_destroy_display(display)
```

Screen Shot:

:alt: Scaling and Rotating Images

# Display Transparent Image

The next example display image with white background on another image

```ring
Load "gamelib.ring"

al_init()
al_init_image_addon()

display = al_create_display(640,480)
imageback = al_load_bitmap("palace.jpg")
al_draw_bitmap(imageback,0,0,0)

image = al_load_bitmap("man4.png")
al_convert_mask_to_alpha(image,al_map_rgb(255,255,255))
al_draw_bitmap(image,0,0,0)
al_flip_display()
al_rest(10)

al_destroy_bitmap(image)
al_destroy_display(display)
```

Screen Shot:

:alt: Transparent Image

# Using Threads

In this example we will learn how to use threads from the Allegro library

```ring
Load "gamelib.ring"

o1 = new mythreads

Func Main
	al_init()
	for k = 1 to 5
		al_create_thread("o1.thread1()")
		al_create_thread("o1.thread2()")
		al_create_thread("o1.thread3()")
	next
	al_rest(2)

Class Mythreads

	cAppName = "Threads Application"

	Func Thread1
		for x = 1 to 5
			see x + nl
		next
		See 'Thread(1) : Application Name : '  + cAppName + nl

	Func Thread2
		for x = 1 to 5
			see '*****' + x + nl
		next
		See 'Thread(2) : Application Name : '  + cAppName + nl

	Func Thread3
		for x = 1 to 5
			see '!!!!' + x + nl
		next
		See 'Thread(3) : Application Name : '  + cAppName + nl
```

Output:

```ring
1
2
3
4
5
Thread(1) : Application Name : Threads Application
*****1
*****2
*****3
*****4
*****5
Thread(2) : Application Name : Threads Application
!!!!1
!!!!2
!!!!3
!!!!4
!!!!5
Thread(3) : Application Name : Threads Application
1
2
3
4
5
Thread(1) : Application Name : Threads Application
!!!!1
!!!!2
!!!!3
!!!!4
!!!!5
Thread(3) : Application Name : Threads Application
*****1
*****2
*****3
*****4
*****5
Thread(2) : Application Name : Threads Application
*****1
*****2
*****3
*****4
*****5
Thread(2) : Application Name : Threads Application
!!!!1
!!!!2
!!!!3
!!!!4
!!!!5
Thread(3) : Application Name : Threads Application
1
2
3
4
5
Thread(1) : Application Name : Threads Application
*****1
*****2
*****3
*****1
*****4
*****2
!!!!1
*****5
*****3
1
!!!!2
Thread(2) : Application Name : Threads Application
1
*****4
!!!!1
2
!!!!3
!!!!4
*****5
!!!!2
3
2
!!!!5
Thread(2) : Application Name : Threads Application
!!!!3
4
3
Thread(3) : Application Name : Threads Application
!!!!4
5
4
!!!!5
Thread(1) : Application Name : Threads Application
5
Thread(3) : Application Name : Threads Application
Thread(1) : Application Name : Threads Application
```


## gameengine

# =
# Demo Project - Game Engine for 2D Games

In this chapter we will learn about using the different programming paradigms in the same project.

We will create a simple Game Engine for 2D Games.

You can use the Engine directly to create 2D Games for Desktop or Mobile.

# Project Layers

The project contains the next layers

- Games Layer (Here we will use declarative programming)
- Game Engine Classes (Here we will use the Object-Oriented Programming paradigm)
- Interface to graphics library (Here we will use procedural programming)
- Graphics Library bindings (Here we have RingAllegro and RingLibSDL)

# Graphics Library bindings

We already have RingAllegro to use the Allegro game programming library and we have RingLibSDL
to use the LibSDL game programming library.

Both of RingAllegro and RingLibSDL are created using the C language with the help of the
Ring code generator for extensions.

Each of them is over 10,000 lines of C code which is generated after writing simple configuration
files (That are processed by the code generator).

Each configuration file determines the functions names, structures information and constants
then the generator process this configuration file to produce the C code and the library
that can be loaded from Ring code.

Using RingAllegro and RingLibSDL is very similar to using Allegro and LibSDL from C code where
you have the same functions but we can build on that using the Ring language features

- RingAllegro Source Code : https://github.com/ring-lang/ring/tree/master/extensions/ringallegro
- RingLibSDL Source Code : https://github.com/ring-lang/ring/tree/master/extensions/ringsdl

# Interface to graphics library

In this layer we have gl_allegro.ring and gl_libsdl.ring

Each library provides the same functions to be used with interacting with the Graphics Library.

This layer hides the details and the difference between RingAllegro and RingLibSDL.

You have the same functions, Just use it and you can switch between Allegro and LibSDL at anytime.

Why ?

Allegro is very simple, we can use it to quickly create 2D games for Windows, Linux and MacOS X.

In Ring 1.0 we started by supporting Allegro.

Also LibSDL is very powerful and popular, very easy to use for Mobile Development.

Ring 1.1 comes with support for LibSDL so we can quickly create games for Mobile.

> **Note:**

- gl_allegro.ring source code : https://github.com/ring-lang/ring/blob/master/libraries/gameengine/gl_allegro.ring
- gl_libsdl.ring source code : https://github.com/ring-lang/ring/blob/master/libraries/gameengine/gl_libsdl.ring

# Game Engine Classes

The Engine comes with the next classes

- GameBase class
- Resources class
- Game class
- GameObject class
- Sprite class
- Text class
- Animate class
- Sound class
- Map class

- Source Code : https://github.com/ring-lang/ring/blob/master/libraries/gameengine/gameengine.ring

# Games Layer

In this layer we create our games using the Game Engine classes

The classes are designed to be used through Declarative Programming.

In our games we will use the next classes

- Game class
- Sprite class
- Text class
- Animate class
- Sound class
- Map class

> **Note:**

We will introduce some examples and three simple games :-

- Stars Fighter Game
- Flappy Bird 3000 Game
- Super Man 2016 Game

# Game Class

The next table present the class attributes.

# =
Attributes		Description
# =
FPS		Number determines how many times the draw() method will be called per second.
FixedFPS	Number determines how many times the animate() method will be called per second.
Title		String determines the window title of the game.
Icon		String determines the window icon (file name)
aObjects	List contains all objects in the game
shutdown	True/False value to end the game loop
# =

The next table present the class methods.

# =
Method			Description
# =
refresh()		Delete objects.
settitle(cTitle)	Set the window title using a string parameter.
shutdown()		Close the application.
find(cName)		Find an object using the object name
remove(nID)		Remove an object using the object ID
# =

The next table present a group of keywords defined by the class.

# =
Keyword			Description
# =
sprite 			Create new Sprite object and add it to the game objects.
text 			Create new Text object and add it to the game objects.
animate 		Create new Animate object and add it to the game objects.
sound 			Create new Sound object and add it to the game objects.
map			Create new Map object and add it to the game objects.
# =

# GameObject Class

The next table present the class attributes.

# =
Attributes		Description
# =
enabled		True/False determine the state of the object (Active/Not Active)
x		Number determine the x position of the object.
y		Number determine the y position of the object.
width		Number determine the width of the object.
height		Number determine the height of the object.
nIndex		Number determine the ID of the object.
name		String represent the object name.
animate		True/False to animate the object or not.
move		True/False to move the object using the keyboard or not.
Scaled		True/False to scale the object image or not.
draw		Function to be called when drawing the object.
state		Function to be called for object animation.
keypress	Function to be called when a key is pressed.
mouse		Function to be called when a mouse event happens.
# =

The next table present the class methods.

# =
Method				Description
# =
keyboard(oGame,nkey)		Check Keyboard Events
mouse(oGame,nType,aMouseList)	Check Mouse Events
rgb(r,g,b)			Return new color using the RGB (Red, Green and Blue) Values.
# =

# Sprite Class

Parent Class : GameObject Class

The next table present the class attributes.

# =
Attributes		Description
# =
image		String determine the image file name.
point		Number determine the limit of automatic movement of the object.
direction	Number determine the direction of movement.
nstep		Number determine the increment/decrement during movement.
type		Number determine the object type in the game (Optional).
transparent	True/False value determine if the image is transparent.
# =

The next table present the class methods.

# =
Method			Description
# =
Draw(oGame)		Draw the object
# =

# Text Class

Parent Class : Sprite Class

The next table present the class attributes.

# =
Attributes		Description
# =
size		Number determine the font size
font		String determine the font file name
text		String determine the text to be displayed
color		Number determine the color
# =

The next table present the class methods.

# =
Method			Description
# =
Draw(oGame)		Draw the object
# =

# Animate Class

Parent Class : Sprite Class

The next table present the class attributes.

# =
Attributes		Description
# =
frames		Number determine the number of frames
frame		Number determine the active frame
framewidth	Number determine the frame width.
animate		True/False determine using animate or not.
scaled		True/False determine scaling image or not.
# =

The next table present the class methods.

# =
Method			Description
# =
Draw(oGame)		Draw the object
# =

# Sound Class

Parent Class : GameObject Class

The next table present the class attributes.

# =
Attributes		Description
# =
file		String determine the sound file name.
once		True/False determine to play the file one time or not (loop).
# =

The next table present the class methods.

# =
Method			Description
# =
playsound()		Play the sound file
# =

# Map Class

Parent Class : Sprite Class

The next table present the class attributes.

# =
Attributes		Description
# =
aMap 		List determine the map content using numbers.
aImages		List determine the image used for each number in the map.
BlockWidth	Number determine the block width (default = 32).
BlockHeight	Number determine the block height (default = 32).
Animate		True/False determine the animation status.
# =

The next table present the class methods.

# =
Method			Description
# =
getvalue(x,y)		Return the item value in the Map according to the visible part
# =

# Using the Game Engine - Creating the Game Window

```ring
Load "gameengine.ring"	# Give Control to the Game Engine

func main		# Called by the Game Engine

	oGame = New Game	# Create the Game Object
	{
		title = "My First Game"
	}			# Start the Events Loop
```

> **Note:**
> because this instruction will give the control to the game engine.

Screen Shot:

:alt: screen shot

# Using the Game Engine - Drawing Text

```ring
Load "gameengine.ring"	# Give Control to the Game Engine

func main		# Called by the Game Engine

	oGame = New Game	# Create the Game Object
	{
		title = "My First Game"
		text {
			x = 10	y=50
			animate = false
			size = 20
			file = "fonts/pirulen.ttf"
			text = "game development using ring is very fun!"
			color = rgb(0,0,0)
		}
	}		# Start the Events Loop
```

Screen Shot:

:alt: screen shot

# Using the Game Engine - Moving Text

```ring
Load "gameengine.ring"	# Give Control to the Game Engine

func main		# Called by the Game Engine

	oGame = New Game	# Create the Game Object
	{
		title = "My First Game"
		text {
			x = 10	y=50
			animate = false
			size = 20
			file = "fonts/pirulen.ttf"
			text = "game development using ring is very fun!"
			color = rgb(0,0,0)	# Color = black
		}
		text {
			x = 10	y=150
			# Animation Part =====================================
			animate = true			# Use Animation
			direction = GE_DIRECTION_INCVERTICAL	# Increase y
			point = 400		 	# Continue until y=400
			nStep = 3			# Each time y+= 3
			#=====================================================
			size = 20
			file = "fonts/pirulen.ttf"
			text = "welcome to the real world!"
			color = rgb(0,0,255)		# Color = Blue
		}
	}					# Start the Events Loop
```

Screen Shot:

:alt: screen shot

# Using the Game Engine - Playing Sound

```ring
Load "gameengine.ring"	# Give Control to the Game Engine

func main		# Called by the Game Engine

	oGame = New Game	# Create the Game Object
	{
		title = "My First Game"
		text {
			x = 10	y=50
			animate = false
			size = 20
			file = "fonts/pirulen.ttf"
			text = "game development using ring is very fun!"
			color = rgb(0,0,0)	# Color = black
		}
		text {
			x = 10	y=150
			# Animation Part ======================================
			animate = true				# Use Animation
			direction = GE_DIRECTION_INCVERTICAL	# Increase y
			point = 400	 	# Continue until y=400
			nStep = 3		# Each time y+= 3
			#======================================================
			size = 20
			file = "fonts/pirulen.ttf"
			text = "welcome to the real world!"
			color = rgb(0,0,255)	# Color = Blue
		}
		Sound {					# Play Sound
			file = "sound/music1.wav"	# Sound File Name
		}
	}					# Start the Events Loop
```


# Using the Game Engine - Animation

```ring
Load "gameengine.ring"	# Give Control to the Game Engine

func main          	# Called by the Game Engine

  oGame = New Game      # Create the Game Object
  {
	title = "My First Game"

	animate {
	  file = "images/fire.png"
	  x = 100
	  y = 200
	  framewidth = 40
	  height = 42
	  nStep = 3      # Used for delay
	  transparent = true
	  state = func oGame,oSelf {  # Called by engine each frame
		oSelf {
		  nStep--
		  if nStep = 0
			nStep = 3
			if frame < 13      # we have 13 frames in animation
			  frame++   # move to next frame
			else
			  oGame.remove(oself.nIndex)   # remove object
			ok
		  ok
		}
	  }
	 }


  }          # Start the Events Loop
```

:alt: screen shot

# Using the Game Engine - Animation and Functions

```ring
Load "gameengine.ring"	# Give Control to the Game Engine

func main          	# Called by the Game Engine

  oGame = New Game      # Create the Game Object
  {
	title = "My First Game"
	for x = 70 to 700 step 50
	  for y = 70 to 500 step 50
		showfire(oGame,x,y)
	  next
	next

  }          # Start the Events Loop

func showfire oGame,nX,nY
  oGame {
	animate {
	  file = "images/fire.png"
	  x = nX
	  y = nY
	  framewidth = 40
	  height = 42
	  nStep = 3      # Used for delay
	  transparent = true
	  state = func oGame,oSelf {  # Called by engine each frame
		oSelf {
		  nStep--
		  if nStep = 0
			nStep = 3
			if frame < 13      # we have 13 frames in animation
			  frame++   # move to next frame
			else
			  frame=1
			ok
		  ok
		}
	  }
	 }
  }
```

:alt: screen shot

# Using the Game Engine - Sprite - Automatic Movement using Keyboard

```ring
Load "gameengine.ring"				# Give control to the game engine

func main					# Called by the Game Engine

	oGame = New Game			# Create the Game Object
	{
		title = "My First Game"
		sprite
		{
			type = GE_TYPE_PLAYER		# Just for our usage
			x=400 y=400 width=100 height=100
			file = "images/player.png"
			transparent = true
			Animate=false
			Move=true 	# we can move it using keyboard arrows
			Scaled=true
		}
	}					# Start the Events Loop
```

:alt: screen shot

# Using the Game Engine - Sprite - Keypress event

```ring
Load "gameengine.ring"				# Give control to the game engine

func main					# Called by the Game Engine

	oGame = New Game			# Create the Game Object
	{
		title = "My First Game"
		sprite
		{
			type = GE_TYPE_PLAYER		# Just for our usage
			x=400 y=400 width=100 height=100
			file = "images/player.png"
			transparent = true
			Animate=false
			Move=false			# Custom Movement
			Scaled=true
			keypress = func oGame,oSelf,nKey {
				oSelf {
					Switch nKey
					on KEY_LEFT
						x -= 10
					on KEY_RIGHT
						x += 10
					on KEY_UP
						y -= 10
					on KEY_DOWN
						y += 10
					off
				}
			}
		}
	}					# Start the Events Loop
```


# Using the Game Engine - Sprite - Mouse event

```ring
Load "gameengine.ring"				# Give control to the game engine

func main					# Called by the Game Engine

	oGame = New Game			# Create the Game Object
	{
		title = "My First Game"
		sprite
		{
			type = GE_TYPE_PLAYER		# Just for our usage
			x=400 y=400 width=100 height=100
			file = "images/player.png"
			transparent = true
			Animate=false
			Move=false			# Custom Movement
			Scaled=true
			keypress = func oGame,oSelf,nKey {
				oSelf {
					Switch nKey
					on KEY_LEFT
						x -= 10
					on KEY_RIGHT
						x += 10
					on KEY_UP
						y -= 10
					on KEY_DOWN
						y += 10
					off
				}
			}
			mouse = func oGame,oSelf,nType,aMouseList {
				if nType = GE_MOUSE_UP
					oSelf {
						x = aMouseList[GE_MOUSE_X]
						y = aMouseList[GE_MOUSE_Y]
					}
				ok
			}
		}
	}					# Start the Events Loop
```


# Using the Game Engine - Sprite - State event

```ring
Load "gameengine.ring"				# Give control to the game engine

func main					# Called by the Game Engine

	oGame = New Game			# Create the Game Object
	{
		title = "My First Game"
		sprite
		{
			type = GE_TYPE_PLAYER		# Just for our usage
			x=400 y=400 width=100 height=100
			file = "images/player.png"
			transparent = true
			Animate=false
			Move=false			# Custom Movement
			Scaled=true
			keypress = func oGame,oSelf,nKey {
				oSelf {
					Switch nKey
					on KEY_LEFT
						x -= 10
					on KEY_RIGHT
						x += 10
					on KEY_UP
						y -= 10
					on KEY_DOWN
						y += 10
					off
				}
			}
			mouse = func oGame,oSelf,nType,aMouseList {
				if nType = GE_MOUSE_UP
					oSelf {
						x = aMouseList[GE_MOUSE_X]
						y = aMouseList[GE_MOUSE_Y]
					}
				ok
			}
			state = func oGame,oSelf {
				oself {
					if x < 0 x = 0 ok
					if y < 0 y = 0 ok
					if x > ogame.width-width
						x= ogame.width - width ok
					if y > ogame.height-height
						y=ogame.height - height ok
				}
			}
		}
	}					# Start the Events Loop
```


# Using the Game Engine - Animate - Events

```ring
Load "gameengine.ring"				# Give control to the game engine

func main					# Called by the Game Engine

	oGame = New Game			# Create the Game Object
	{
		title = "My First Game"

		animate {

			file = "images/fbbird.png"
			x = 10
			y = 10
			framewidth = 20
			scaled = true
			height = 50
			width = 50
			nStep = 3
			transparent = true

			state = func oGame,oSelf {
				oSelf {

					# Animation
						nStep--
						if nStep = 0
							nStep = 3
							if frame < 3
								frame++
							else
								frame=1
							ok
						ok

					# Move Down
						y += 3
						if y > 550 y=550 ok

				}

			}

			keypress = func ogame,oself,nKey {
				oself {
					if nkey = key_space
						y -= 55
						if y<=0 y=0 ok
					ok
				}
			}

			mouse = func ogame,oself,nType,aMouseList {
				if nType = GE_MOUSE_UP
					cFunc = oself.keypress
					call cFunc(oGame,oSelf,Key_Space)
				ok
			}
		}
	}					# Start the Events Loop
```

Screen Shot:

:alt: screen shot

# Using the Game Engine - Map

```ring
Load "gameengine.ring"        # Give control to the game engine

func main          # Called by the Game Engine

oGame = New Game      # Create the Game Object
{
  title = "My First Game"

  Map {

	blockwidth = 80
	blockheight = 80

	aMap = [
		[0,0,0,0,0,0,0,0,0,1,0,0,0,3,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,3,0,0,0,1,0,0,0,1,0,0,0],
		[0,0,0,0,0,0,0,0,0,3,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,3,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
	]

	aImages = ["images/fbwall.png",
		 "images/fbwallup.png",
		 "images/fbwalldown.png"]

	state = func oGame,oSelf {
	  oSelf {
		x -= 3
		if x < - 2100  x = 0  ok
	  }
	}

  }
}          # Start the Events Loop
```

Screen Shot:

:alt: screen shot

# Using the Game Engine - Map Events

```ring
Load "gameengine.ring"        # Give control to the game engine

func main          # Called by the Game Engine

  oGame = New Game      # Create the Game Object
  {
	title = "My First Game"

	Map {

	  blockwidth = 80
	  blockheight = 80

	  aMap = [
		   [0,0,0,0,0,0,0,0,0,1,0,0,0,3,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],
		  [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],
		  [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,1,0,0,0],
		  [0,0,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,3,0,0,0,1,0,0,0,1,0,0,0],
		  [0,0,0,0,0,0,0,0,0,3,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,3,0,0,0],
		  [0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
		  [0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
		  [0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
	  ]

	  aImages = ["images/fbwall.png",
			 "images/fbwallup.png",
			 "images/fbwalldown.png"]

	  state = func oGame,oSelf {
		oSelf {
		  x -= 3
		  if x < - 2100  x = 0  ok
		}
	  }

	  mouse = func ogame,oself,nType,aMouseList {
		if nType = GE_MOUSE_UP
		  oSelf {
			mX = aMouseList[GE_MOUSE_X]
			mY = aMouseList[GE_MOUSE_Y]
			nValue = GetValue(mX,mY)
			nRow = GetRow(mX,mY)
			nCol = GetCol(mX,mY)
			Switch nValue
			On 1  aMap[nRow][nCol] = 0
			On 2  aMap[nRow][nCol] = 0
			On 3  aMap[nRow][nCol] = 0
			On 0  aMap[nRow][nCol] = 1
			Off
		  }
		ok
	  }

	}
  }          # Start the Events Loop
```

Screen Shot:

:alt: screen shot

# Using the Game Engine - Object and Drawing

We can use the Object keyword (defined by the game engine) to create objects from the GameObject class.

Example:

```ring
Load "gameengine.ring"				# Give control to the game engine

func main					# Called by the Game Engine

	oGame = New Game			# Create the Game Object
	{
		title = "My First Game"
		Object {
			x = 0 y=300 width = 200 height=200
			draw = func oGame,oSelf {
				oSelf {
					for t = 1 to 210
						gl_draw_circle(x,y,t,
						gl_map_rgb(t*random(255),
						t*2,t*3),1)
					next
				}
			}
			state = func oGame,oSelf {
				oSelf {
					if x <= 800
						x+= 3
					else
						x=0
					ok
				}
			}
			keypress = func oGame,oSelf,nKey {
				oSelf {
					Switch nKey
					on KEY_LEFT
						x -= 10
					on KEY_RIGHT
						x += 10
					on KEY_UP
						y -= 10
					on KEY_DOWN
						y += 10
					off
				}
			}
		}

	}					# Start the Events Loop
```

Screen Shot:

:alt: screen shot

Example:

```ring
Load "gameengine.ring"				# Give control to the game engine

func main					# Called by the Game Engine

	oGame = New Game			# Create the Game Object
	{
		title = "My First Game"
		Object {
			x = 400 y=300 width = 200 height=200
			draw = func oGame,oSelf {
				oSelf {
					for t = 1 to 210
						gl_draw_rectangle(x+t,y+t,
						x+t*2,y+t*2,
						gl_map_rgb(t*random(255),
						t*2,t*3),1)
						gl_draw_rectangle(x+t*2,y+t*2,
						x-t*2,y-t*2,
						gl_map_rgb(t*random(255),
						t*2,t*3),1)
					next
				}
			}
			keypress = func oGame,oSelf,nKey {
				oSelf {
					Switch nKey
					on KEY_LEFT
						x -= 10
					on KEY_RIGHT
						x += 10
					on KEY_UP
						y -= 10
					on KEY_DOWN
						y += 10
					off
				}
			}
		}

	}					# Start the Events Loop
```

Screen Shot:

:alt: screen shot

# Stars Fighter Game

The Stars Fighter source code

```ring
# The Ring Standard Library
# Game Engine for 2D Games
# 2016, Mahmoud Fayed <msfclipper@yahoo.com>

oGameState = NULL

load "gameengine.ring"

func main

  oGame = New Game

  while true

	  oGameState = new GameState

	  oGame {
		title = "Stars Fighter!"
		sprite
		{
		  file = "images/menu1.jpg"
		  x = 0 y=0 width=800 height = 600 scaled = true animate = false
		  keypress = func ogame,oself,nKey {
			if nkey = key_esc or nKey = GE_AC_BACK
			  ogame.shutdown()
			but nKey = key_space
			  oGameState.startplay=true
			  ogame.shutdown=true
			ok
		  }
		  mouse = func ogame,oself,nType,aMouseList {
			if nType = GE_MOUSE_UP
			  oGameState.startplay=true
			  ogame.shutdown=true
			ok
		  }
		}
		text {
		  animate = false
		  size = 35
		  file = "fonts/pirulen.ttf"
		  text = "Stars Fighter"
		  x = 10  y=50
		}
		text {
		  animate = false
		  size = 25
		  file = "fonts/pirulen.ttf"
		  text = "Version 1.0"
		  x = 80  y=100
		}
		text {
		  animate = false
		  size = 16
		  file = "fonts/pirulen.ttf"
		  text = "(C) 2016, Mahmoud Fayed"
		  x = 45  y=140
		}

		text {
		  animate = false
		  size = 25
		  file = "fonts/pirulen.ttf"
		  text = "Press Space to start"
		  x = 190  y=470
		}
		text {
		  animate = false
		  size = 20
		  file = "fonts/pirulen.ttf"
		  text = "Press Esc to Exit"
		  x = 260  y=510
		}
		Sound {
		  file = "sound/music1.wav"
		}
	  }

	  if oGameState.startplay
		oGame.refresh()
		playstart(oGame)
		oGame.refresh()
	  ok

  end

func playstart oGame

  oSound = New Sound {
	file = "sound/music2.wav"
  }

  while true
	play(oGame)
	if ogame.shutdown = true and oGameState.value = 0
	  exit
	ok
	ogame.refresh()
  end

  oSound.Delete()

func play oGame

  oGame
  {
	FPS = 60
	FixedFPS = 120
	title = "Stars Fighter!"
	sprite
	{
	  file = "images/stars.jpg"
	  x = 0
	  y = 0
	  point = -370
	  direction = ge_direction_dec
	  type = ge_type_background
	  state = func ogame,oself {
		  oself {
			if x < -350
			  direction = ge_direction_inc
			  point = 370
			but x = 0 and direction = ge_direction_inc
			  direction = ge_direction_dec
			  point = -370
			ok
		  }
		}
	}
	sprite
	{
	  file = "images/player.png"
	  transparent = true
	  type = ge_type_player
	  x = 400 y =400 width=100 height=100
	  animate=false move=true Scaled=true
	  mouse = func ogame,oself,nType,aMouseList {

		if not ( aMouseList[GE_MOUSE_X] >= oSelf.x and
				 aMouseList[GE_MOUSE_X] <= oSelf.x+oSelf.width and
				 aMouseList[GE_MOUSE_Y] >= oself.y and
				 aMouseList[GE_MOUSE_Y] <= oSelf.y+oSelf.height )

		  if nType = GE_MOUSE_DOWN
			if aMouseList[1] < oSelf.X  # left
			  oSelf.X -= 100
			else
			  oSelf.X += 100
			ok
			if aMouseList[2] < oSelf.Y  # up
			  oSelf.Y -= 100
			else
			  oSelf.Y += 100
			ok
		  ok

		else
		  if nType = GE_MOUSE_UP
			cFunc = oself.keypress
			call cFunc(oGame,oSelf,Key_Space)
		  ok
		ok
	  }
	  keypress = func oGame,oself,nkey {
		if nkey = key_space
		  ogame {
			sprite {
			  type = ge_type_fire
			  file  = "images/rocket.png"
			  transparent = true
				x = oself.x + 30
			  y = oself.y - 30
			  width = 30
			  height = 30
			  point = -30
			  nstep = 20
			  direction = ge_direction_decvertical
			  state = func oGame,oSelf {
				for x in oGame.aObjects
				  if x.type = ge_type_enemy
					if oself.x >= x.x and oself.y >= x.y and
					  oself.x <= x.x + x.width and
					  oself.y <= x.y + x.height
					  showfire(oGame,x.x+40,x.y+40)
					  ogame.remove(x.nindex)
					  oGameState.score+=10
					  oGameState.enemies--
					  checkwin(oGame)
					  exit
					ok
				  ok
				next
			  }
			}
		  }
		but nkey = key_esc or nKey = GE_AC_BACK ogame.shutdown()
		ok
	  }
	  state = func oGame,oSelf {
		oself {
		  if x < 0 x = 0 ok
		  if y < 0 y = 0 ok
		  if x > ogame.screen_w-width  x= ogame.screen_w - width ok
		  if y > ogame.screen_h-height y=ogame.screen_h-height ok
		}
	  }
	}
	for g = 1 to oGameState.enemies
	  sprite
	  {
		type = ge_type_enemy
		file = "images/enemy.png"
		transparent = true
		x = g*random(50) y =g width=100 height=100
		animate=true Scaled=true
		direction = ge_direction_random
		state = func oGame,oSelf {
		  oself {
			if x < 0 x = 0 ok
			if y < 0 y = 0 ok
			if x > ogame.screen_w-width  x= ogame.screen_w - width ok
			if y > ogame.screen_h-height y=ogame.screen_h-height ok
		  }
		  if random(100) = 1
			ogame {
			  sprite {
				type = ge_type_fire
				file  = "images/rocket2.png"
				transparent = true
				x = oself.x + 30
				y = oself.y + oself.height+ 30
				width = 30
				height = 30
				point = ogame.screen_h+30
				nstep = 10
				direction = ge_direction_incvertical
				state = func oGame,oSelf {
				  x =  oGame.aObjects[oGameState.playerindex]
				  if oself.x >= x.x and oself.y >= x.y and
					 oself.x <= x.x + x.width and
					 oself.y <= x.y + x.height
					 if oGameState.value > 0
					   oGameState.value-=10
					 ok
					 ogame.remove(oself.nindex)
					 checkgameover(oGame)
				  ok
				}
			  }
			}
		  ok
		}
	  }
	next
	text {
	  size = 30
	  file = "fonts/pirulen.ttf"
	  text = "Destroy All Enemies!"
	  nstep = 3
	  color = GE_COLOR_GREEN
	  x = 100  y=50
	  direction = ge_direction_incvertical
	  point = 500
	}
	text {
	  animate = false
	  point = 400
	  size = 30
	  file = "fonts/pirulen.ttf"
	  text = "Score : " + oGameState.score
	  x = 500  y=10
	  state = func oGame,oSelf { oSelf { text = "Score : " + oGameState.score } }
	}
	text {
	  animate = false
	  point = 400
	  size = 30
	  file = "fonts/pirulen.ttf"
	  text = "Energy : " + oGameState.value
	  x = 500  y=50
	  state = func oGame,oSelf { oSelf { text = "Energy : " + oGameState.value } }
	}
	text {
	  animate = false
	  point = 400
	  size = 30
	  file = "fonts/pirulen.ttf"
	  text = "Level : " + oGameState.level
	  x = 500  y=90
	}
  }


func checkwin ogame
  if oGameState.gameresult  return ok
  if oGameState.enemies = 0
	oGameState.gameresult = true
	oGame {
	  if oGameState.level < 30
	  text {
		point = 400
		size = 30
		file = "fonts/pirulen.ttf"
		text = "Level Completed!"
		nStep = 3
		x = 500  y=10
		state = func ogame,oself {
		  if oself.y >= 400
			ogame.shutdown = true
			oGameState.level++
			oGameState.enemies = oGameState.level
			oGameState.gameresult = false
		  ok
		}
	  }
	  else
	  text {
		point = 400
		size = 30
		nStep = 3
		file = "fonts/pirulen.ttf"
		text = "You Win !!!"
		x = 500  y=10
		state = func ogame,oself {
		  if oself.y >= 400
			ogame.shutdown = true
			oGameState.value = 0
		  ok
		}
	  }
	  ok
	}
  ok

func checkgameover ogame
  if oGameState.gameresult  return ok
  if oGameState.value <= 0
	oGameState.gameresult = true
	oGame {
	  text {
		point = 400
		size = 30
		nStep = 3
		file = "fonts/pirulen.ttf"
		text = "Game Over !!!"
		x = 500  y=10
		state = func ogame,oself {
		  if oself.y >= 400
			ogame.shutdown = true
		  ok
		}
	  }
	}
	showfire(oGame,oGame.aObjects[oGameState.PlayerIndex].x+40,
			 oGame.aObjects[oGameState.PlayerIndex].y+40)
	oGame.aObjects[oGameState.PlayerIndex].enabled = false
	oGame.remove(oGameState.PlayerIndex)
  ok


func showfire oGame,nX,nY
  oGame {
	animate {
	  file = "images/fire.png"
	  x = nX
	  y = nY
	  framewidth = 40
	  height = 42
	  nStep = 3
	  transparent = true
	  state = func oGame,oSelf {
		oSelf {
		  nStep--
		  if nStep = 0
			nStep = 3
			if frame < 13
			  frame++
			else
			  frame=1
			  oGame.remove(oself.nIndex)
			ok
		  ok
		}
	  }
	}
  }


class gamestate
  score = 0
  level = 1
  enemies = 1
  value = 100
  playerindex = 2
  gameresult = false
  startplay=false
```

Screen Shot:

:alt: Stars Fighter

# Flappy Bird 3000 Game

The Flappy Bird 3000 Game source code

```ring
# The Ring Standard Library
# Game Engine for 2D Games
# 2016, Mahmoud Fayed <msfclipper@yahoo.com>

oGameState = NULL

Load "gameengine.ring"

func main

  oGame = New Game


  while true

	oGameState = New GameState

	oGame {
	  title = "Flappy Bird 3000"
	  sprite
	  {
		file = "images/fbback.png"
		x = 0 y=0 width=800 height = 600 scaled = true animate = false
		keypress = func ogame,oself,nKey {
		  if nkey = key_esc or nKey = GE_AC_BACK
			ogame.shutdown()
		  but nKey = key_space
			oGameState.startplay=true
			ogame.shutdown=true
		  ok
		}
		mouse = func ogame,oself,nType,aMouseList {
		  if nType = GE_MOUSE_UP
			cFunc = oself.keypress
			call cFunc(oGame,oSelf,Key_Space)
		  ok
		}
	  }
	  text {
		animate = false
		size = 35
		file = "fonts/pirulen.ttf"
		text = "Flappy Bird 3000"
		x = 150  y=50
	  }
	  text {
		animate = false
		size = 25
		file = "fonts/pirulen.ttf"
		text = "Version 1.0"
		x = 280  y=100
	  }
	  text {
		animate = false
		size = 16
		file = "fonts/pirulen.ttf"
		text = "(C) 2016, Mahmoud Fayed"
		x = 245  y=140
	  }

	  text {
		animate = false
		size = 25
		file = "fonts/pirulen.ttf"
		text = "To Win Get Score = 3000"
		x = 150  y=270
	  }

	  text {
		animate = false
		size = 25
		file = "fonts/pirulen.ttf"
		text = "Press Space to start"
		x = 190  y=470
	  }
	  text {
		animate = false
		size = 20
		file = "fonts/pirulen.ttf"
		text = "Press Esc to Exit"
		x = 260  y=510
	  }

	  animate {
		file = "images/fbbird.png"
		x = 200
		y = 200
		framewidth = 20
		scaled = true
		height = 50
		width = 50
		nStep = 3
		transparent = true
		animate = true
		direction = ge_direction_random
		state = func oGame,oSelf {
		  oSelf {
			nStep--
			if nStep = 0
			  nStep = 3
			  if frame < 3
				frame++
			  else
				frame=1
			  ok
			ok
			if x <= 0 x=0 ok
			if y <= 0 y=0 ok
			if x >= 750 x= 750 ok
			if y > 550 y=550 ok
		  }
		}
	  }

	  Sound {
		file = "sound/music2.wav"
	  }
	}
	if oGameState.startplay
	  oGame.refresh()
	  playstart(oGame)
	  oGame.refresh()
	ok

  end


func playstart oGame

  oGame {
	FPS = 60
	FixedFPS = 120
	Title = "Flappy Bird 3000"
	Sprite {
	  file = "images/fbback.png"
	  x = 0 y=0 width=800 height = 600 scaled = true animate = false
	  keypress = func ogame,oself,nKey {
		if nkey = key_esc or nKey = GE_AC_BACK
		  ogame.shutdown()
		ok
	  }
	}

	Map {
	  blockwidth = 80
	  blockheight = 80
	  aMap = [
		   [0,0,0,0,0,0,0,0,0,1,0,0,0,3,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],
		  [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],
		  [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,1,0,0,0],
		  [0,0,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,3,0,0,0,1,0,0,0,1,0,0,0],
		  [0,0,0,0,0,0,0,0,0,3,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,3,0,0,0],
		  [0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
		  [0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
		  [0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0]
		]
	  newmap(aMap)
	  aImages = ["images/fbwall.png","images/fbwallup.png",
		  "images/fbwalldown.png"]
	  state = func oGame,oSelf {
		if oGameState.gameresult = false
		  px = oGame.aObjects[3].x
		  py = oGame.aObjects[3].y
		  oSelf {
			x -=  3
			if x < - 2100
			  x = 0
			  newmap(aMap)
			ok
			nCol =  getcol(px,0)
			if nCol=11 or nCol=15 or nCol=19 or nCol=23 or nCol=27
			  if nCol != oGameState.lastcol
				oGameState.lastcol = nCol
				oGameState.Score += 100
				oGame { Sound {
				  once = true
				  file = "sound/sfx_point.wav"
				} }
				checkwin(oGame)
			  ok
			ok
		  }
		  if  oSelf.getvalue(px+40,py) != 0 or
			  oSelf.getvalue(px+40,py+40) != 0 or
			  oSelf.getvalue(px,py) != 0 or
			  oSelf.getvalue(px,py+40) != 0
			oGameState.gameresult = true
			oGame {
			  text {
				point = 550
				size = 30
				nStep = 3
				file = "fonts/pirulen.ttf"
				text = "Game Over !!!"
				x = 500  y=10
				state = func ogame,oself {
				  if oself.y >= 550
					  ogame.shutdown = true
				  ok
					if oself.y = 90
					ogame {
					  Sound {
						once = true
						file = "sound/sfx_die.wav"
					  }
					}
				  ok
				}
			  }
			  Sound {
				once = true
				file = "sound/sfx_hit.wav"
			  }
			}
		  ok
		ok
	  }
	}

	animate {
	  file = "images/fbbird.png"
	  x = 10
	  y = 10
	  framewidth = 20
	  scaled = true
	  height = 50
	  width = 50
	  nStep = 3
	  transparent = true
	  state = func oGame,oSelf {
		oSelf {
		  nStep--
		  if nStep = 0
			nStep = 3
			if frame < 3
			  frame++
			else
			  frame=1
			ok
		  ok
		}

		if not oGameState.playerwin
		  oGameState.down --
		  if oGameState.down = 0
			oGameState.down = 3
			oself {
			  y += 25
			  if y > 550 y=550 ok
			}
		  ok
		ok

	  }
	  keypress = func ogame,oself,nKey {
		if oGameState.gameresult = false
		  oself {
			if nkey = key_space
			  y -= 55
			  oGameState.down = 60
			  if y<=0 y=0 ok
			ok
		  }
		ok
	  }
	  mouse = func ogame,oself,nType,aMouseList {
		if nType = GE_MOUSE_UP
		  cFunc = oself.keypress
		  call cFunc(oGame,oSelf,Key_Space)
		ok
	  }
	}

	text {
	  animate = false
	  point = 400
	  size = 30
	  file = "fonts/pirulen.ttf"
	  text = "Score : " + oGameState.score
	  x = 500  y=10
	  state = func oGame,oSelf {
		oSelf { text = "Score : " + oGameState.score }
	  }
	}

  }

func newmap aMap
  aV = [
  [1,1,3,0,0,2,1,1],
  [1,3,0,0,0,2,1,1],
  [1,1,1,3,0,2,1,1],
  [1,1,1,3,0,0,0,0],
  [0,0,0,0,2,1,1,1],
  [0,0,2,1,1,1,1,1],
  [0,0,0,2,1,1,1,1],
  [1,1,1,3,0,2,1,1],
  [1,1,1,1,1,3,0,0],
  [3,0,0,2,1,1,1,1],
  [3,0,0,2,3,0,0,2]
  ]
  for x = 10 to 24 step 4
	aVar = aV[ (random(10)+1) ]
	for y = 1 to 8
	  aMap[y][x] = aVar[y]
	next
  next

func checkwin ogame
  if oGameState.score = 3000
	oGameState.gameresult = true
	oGameState.playerwin = true
	oGame {
	  text {
		point = 400
		size = 30
		nStep = 3
		file = "fonts/pirulen.ttf"
		text = "You Win !!!"
		x = 500  y=10
		state = func ogame,oself {
		  if oself.y >= 400
			ogame.shutdown = true
			oGameState.value = 0
		  ok
		}
	  }
	}
  ok

Class GameState
  down = 3
  gameresult = false
  Score = 0
  startplay=false
  lastcol = 0
  playerwin = false
```

Screen Shot:

:alt: Flappy Bird 300

# Super Man 2016 Game

The Super Man 2016 Game source code

```ring
# The Ring Standard Library
# Game Engine for 2D Games
# 2016, Mahmoud Fayed <msfclipper@yahoo.com>

oGameState = NULL

Load "gameengine.ring"

func main

  oGame = New Game

  while true

	oGameState = new GameState

	oGame {
	  title = "Super Man 2016"
	  sprite
	  {
		file = "images/superman.jpg"
		x = 0 y=0 width=800 height = 600 scaled = true animate = false
		keypress = func ogame,oself,nKey {
		  if nkey = key_esc or nKey = GE_AC_BACK
			ogame.shutdown()
		  but nKey = key_space
			oGameState.startplay=true
			ogame.shutdown=true
		  ok
		}
		mouse = func ogame,oself,nType,aMouseList {
		  if nType = GE_MOUSE_UP
			oGameState.startplay=true
			ogame.shutdown=true
		  ok
		}
		state = func ogame,oself {
		  oself {
			if x > -500
			  x-=1
			  y-=1
			  width +=1
			  height +=4
			ok
		  }
		}
	  }
	  text {
		animate = false
		size = 35
		file = "fonts/pirulen.ttf"
		text = "Super Man 2016"
		x = 20  y=30
	  }
	  text {
		animate = false
		size = 25
		file = "fonts/pirulen.ttf"
		text = "Version 1.0"
		x = 20  y=80
	  }
	  text {
		animate = false
		size = 16
		file = "fonts/pirulen.ttf"
		text = "(C) 2016, Mahmoud Fayed"
		x = 20  y=120
	  }

	  text {
		animate = false
		size = 25
		file = "fonts/pirulen.ttf"
		text = "Press Space to start"
		x = 190  y=470
	  }
	  text {
		animate = false
		size = 20
		file = "fonts/pirulen.ttf"
		text = "Press Esc to Exit"
		x = 260  y=510
	  }

	  animate {
		file = "images/superman.png"
		x = 200
		y = 200
		framewidth = 68
		scaled = true
		height = 86
		width = 60
		nStep = 10
		transparent = true
		animate = true
		direction = ge_direction_random
		state = func oGame,oSelf {
		  oSelf {
			nStep--
			if nStep = 0
			  nStep = 10
			  if frame < 1
				frame++
			  else
				frame=1
			  ok
			ok
			if x <= 0 x=0 ok
			if y <= 0 y=0 ok
			if x >= 750 x= 750 ok
			if y > 550 y=550 ok
		  }
		}
	  }

	  Sound {
		file = "sound/music2.wav"
	  }
	}
	if oGameState.startplay
	  oGame.refresh()
	  playstart(oGame)
	  oGame.refresh()
	ok

  end


func playstart oGame

  oGame {
	FPS = 60
	FixedFPS = 15
	Title = "Super Man 2016"
	Sprite {
	  file = "images/supermancity.jpg"
	  x = 0 y=0 width=800 height = 600 scaled = true animate = false
	}
	Map {
	  blockwidth = 80
	  blockheight = 80
	  aMap = [
		  [0,0,0,4,4,4,0,0,0,1,0,0,0,1,4,4,0,1,0,0,0,0,4,4,0,1,4,
4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1,0,0,0,1,0,0,0,1,0,3,3,3,5,3,3,3,3,0],
		  [0,0,4,0,4,0,4,0,0,1,0,0,0,3,4,4,4,1,0,0,0,0,4,4,0,1,4,
4,4,0,0,4,4,4,4,4,4,4,4,4,4,4,4,1,4,1,0,0,0,1,0,0,0,1,0,4,4,4,4,4,4,4,4,0],
		  [0,0,0,4,4,4,0,0,0,1,0,0,0,4,4,4,4,1,0,0,0,0,0,0,0,3,4,
4,4,0,0,4,0,0,0,0,0,0,4,2,0,0,4,1,4,1,4,2,4,1,0,2,0,1,0,4,4,4,4,4,4,4,4,0],
		  [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
0,0,0,0,4,4,4,4,4,4,4,4,1,0,0,4,1,4,1,4,1,4,1,0,1,0,1,0,2,2,2,2,2,2,2,2,0],
		  [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
0,0,0,0,2,0,0,0,0,0,2,0,3,0,0,0,1,4,1,4,1,4,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0],
		  [0,0,0,0,0,0,0,0,0,1,0,0,0,2,0,0,0,1,0,0,0,2,0,0,0,0,0,
0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,4,3,4,1,4,3,0,1,0,3,0,1,0,0,0,0,0,0,0,0],
		  [0,0,2,0,0,2,0,0,2,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,
0,0,0,0,1,0,0,0,0,0,3,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0],
		  [0,0,1,0,0,1,0,0,1,3,0,0,0,1,0,0,0,3,0,0,0,1,0,0,0,0,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0]
		]
	  aImages = ["images/smwall.png","images/smwallup.png",
		  "images/smwalldown.png","images/smstar.png",
		  "images/smkey.png","images/smstar2.png"]
	}

	sprite {
	  type = ge_type_enemy
	  animate = false
	  file  = "images/smhome.png"
	  x = 5000
	  y = 400
	  width = 290
	  height = 200
	  transparent = true

	  state = func oGame,oSelf {
		oself {
		  x = 5000 +  oGame.aObjects[2].x
		  if x < 0 or x > SCREEN_W return ok
		}
		if oGameState.gameresult or oGameState.DoorKey = false  return ok
		if oGame.aObjects[oGameState.playerindex].x > oself.x + 100 and
		  oGame.aObjects[oGameState.playerindex].y > oself.y + 50
		  oGameState.gameresult = true
		  oGame {
			sprite {
			  file = "images/smwin.jpg"
			  x=0 y=0 width=800 height=600
			  scaled = true animate=false
			  state = func ogame,oself {
				oself {
				  x-=5
				  y-=5
				  width +=10
				  height +=10
				  if x = -300
					ogame.shutdown = true
				  ok
				}
			  }
			}
		  }
		ok
	  }

	}

	animate {
	  file = "images/superman.png"
	  x = 0
	  y = 0
	  framewidth = 60
	  scaled = true
	  height = 86
	  width = 60
	  nStep = 3
	  transparent = true
	  state = func oGame,oSelf {

		checkstarskeycol(oGame,oSelf)

		if not oGameState.playerwin
			oself {
			  file = "images/superman.png"
			  height = 86
			  width = 60
			  for t=1 to 8
				if checkwall2(oGame,oSelf,0,5,[2,1])
				  y += 5
				else
				  exit
				ok
			  next
			  if y > 500 y=500 ok
			}
		ok

	  }
	  keypress = func ogame,oself,nKey {
		if oGameState.gameresult = false

		  oself {
			if nkey = key_up  and checkwall(oGame,oSelf,0,-40)
			  oGameState.value -= 1
			  checkgameover(oGame)
			  file = "images/supermanup.png"
			  height = 123
			  dotransparent()
			  y -= 40
			  oGameState.down = 10
			  if y<=0 y=0 ok
			but nkey = key_down and checkwall(oGame,oSelf,0,40)
			  file = "images/supermandown.png"
			  dotransparent()
			  y += 40
			  if y>=500 y=500 ok
			but nKey = key_right and checkwall(oGame,oSelf,10,0)
			  file = "images/supermanright.png"
			  dotransparent()
			  x += 10
			  if x >= 440
				if oGame.aObjects[2].x > -4500
				  oGame.aObjects[2].x -= 50
				  callenemystate(oGame)
				else
				  if x <= 750
					if  checkwall(oGame,oSelf,10,0)
					  x += 10
					ok
				  else
					if  checkwall(oGame,oSelf,-10,0)
					  x -= 10
					ok
				  ok
				  return
				ok
				x=400
			  ok
			but nKey = key_left and checkwall(oGame,oSelf,-10,0)
			  file = "images/supermanleft.png"
			  dotransparent()
			  x -= 10
			  if x <= 0
				x += 10
				if oGame.aObjects[2].x != 0
				  oGame.aObjects[2].x += 50
				  callenemystate(oGame)
				  x += 50
				ok
			  ok
			but nkey = key_esc or nKey = GE_AC_BACK
			  ogame.shutdown()
			ok
		  }
		ok
	  }
	  mouse = func ogame,oself,nType,aMouseList {
		if nType = GE_MOUSE_DOWN
		  oGameState.moveplayer = TRUE
		But nType = GE_MOUSE_UP
		  oGameState.moveplayer = FALSE
		ok
		if oGameState.moveplayer = TRUE
		  if aMouseList[GE_MOUSE_X] < oSelf.X  # left
			cFunc = oself.keypress
			call cFunc(oGame,oSelf,Key_left)
		  else
			cFunc = oself.keypress
			call cFunc(oGame,oSelf,Key_right)
		  ok
		  if aMouseList[GE_MOUSE_Y] < oSelf.Y  # up
			cFunc = oself.keypress
			call cFunc(oGame,oSelf,Key_up)
		  else
			cFunc = oself.keypress
			call cFunc(oGame,oSelf,Key_down)
		  ok
		ok
	  }
	}

	addenemy(oGame,600)
	addenemy(oGame,900)
	addenemy(oGame,1550)
	addenemy(oGame,2350)
	addenemy(oGame,3350)
	addenemy(oGame,3500)
	addenemy(oGame,3670)
	addenemy(oGame,3840)

	text {
	  animate = false
	  point = 400
	  size = 30
	  file = "fonts/pirulen.ttf"
	  text = "Score : " + oGameState.score
	  x = 500  y=0
	  state = func oGame,oSelf {
		oSelf { text = "Score : " + oGameState.score }
	  }
	}

	text {
	  animate = false
	  point = 400
	  size = 30
	  file = "fonts/pirulen.ttf"
	  text = "Energy : " + oGameState.value
	  x = 10  y=0
	  state = func oGame,oSelf { oSelf { text = "Energy : " + oGameState.value } }
	}
  }


func inlist nValue,aList
  for x in aList
	if x = nValue
	  return true
	ok
  next
  return false

func checkwall oGame,oself,diffx,diffy
  alist = [1,2,3]
  return checkwall2(oGame,oself,diffx,diffy,aList)

func checkwall2 oGame,oself,diffx,diffy,aList
  xPos = oSelf.x + diffx
  yPos = oSelf.y + diffy
  nValue = oGame.aObjects[2].getvalue(xPos,yPos)
  nValue = inlist(nValue,aList)
  nValue = not nValue
  if nValue = 0 return nValue ok

  xPos = oSelf.x + diffx
  yPos = oSelf.y + diffy + oSelf.height
  nValue = oGame.aObjects[2].getvalue(xPos,yPos)
  nValue = inlist(nValue,aList)
  nValue = not nValue
  if nValue = 0 return nValue ok

  xPos = oSelf.x + diffx + oSelf.width
  yPos = oSelf.y + diffy
  nValue = oGame.aObjects[2].getvalue(xPos,yPos)
  nValue = inlist(nValue,aList)
  nValue = not nValue
  if nValue = 0 return nValue ok

  xPos = oSelf.x + diffx + oSelf.width
  yPos = oSelf.y + diffy + oSelf.height
  nValue = oGame.aObjects[2].getvalue(xPos,yPos)
  nValue = inlist(nValue,aList)
  nValue = not nValue
  if nValue = 0 return nValue ok

  return nValue

func checkopenwall oGame
  if oGameState.score = 900
	oGame.aObjects[2].aMap[3][10] = 3
	oGame.aObjects[2].aMap[4][10] = 0
	oGame.aObjects[2].aMap[5][10] = 0
	oGame.aObjects[2].aMap[6][10] = 0
	oGame.aObjects[2].aMap[7][10] = 0
	oGame.aObjects[2].aMap[8][10] = 0
  but oGameState.score = 1800
	oGame.aObjects[2].aMap[3][18] = 3
	oGame.aObjects[2].aMap[4][18] = 0
	oGame.aObjects[2].aMap[5][18] = 0
	oGame.aObjects[2].aMap[6][18] = 0
	oGame.aObjects[2].aMap[7][18] = 0
	oGame.aObjects[2].aMap[8][18] = 0
  but oGameState.score = 5500
	oGame.aObjects[2].aMap[1][44] = 0
	oGame.aObjects[2].aMap[2][44] = 0
	oGame.aObjects[2].aMap[3][44] = 2
  ok


func checkgameover ogame
  if oGameState.gameresult  return ok
  if oGameState.value <= 0
	oGameState.value = 0
	oGameState.gameresult = true
	oGame {
	  text {
		point = 400
		size = 30
		nStep = 9
		file = "fonts/pirulen.ttf"
		text = "Game Over !!!"
		x = 500  y=10
		state = func ogame,oself {
		  if oself.y >= 400
			ogame.shutdown = true
		  ok
		}
	  }
	}
	showfire(oGame,oGame.aObjects[oGameState.PlayerIndex].x+40,
		 oGame.aObjects[oGameState.PlayerIndex].y+40)
	oGame.aObjects[oGameState.PlayerIndex].enabled = false
	oGame.remove(oGameState.PlayerIndex)
  ok


func showfire oGame,nX,nY
  oGame {
	animate {
	  file = "images/fire.png"
	  x = nX
	  y = nY
	  framewidth = 40
	  height = 42
	  nStep = 3
	  transparent = true
	  state = func oGame,oSelf {
		oSelf {
		  nStep--
		  if nStep = 0
			nStep = 3
			if frame < 13
			  frame++
			else
			  frame=1
			  oGame.remove(oself.nIndex)
			ok
		  ok
		}
	  }
	}
  }

func addenemy oGame,xPos
  oGame {
	lbraceend = false
	sprite {
		type = ge_type_enemy
		file = "images/smenemy.png"
		transparent = true
		x = xPos y =10 width=100 height=100
		animate=true Scaled=true
		direction = GE_DIRECTION_NOMOVE
		temp = xPos
		state = func oGame,oSelf {
		  oself {
			x = oSelf.temp +  oGame.aObjects[2].x
			if y < 0 y = 0 ok
			if y > 100 y=100 ok
			if x > SCREEN_W or x < 0 return ok
		  }

		  if random(10) = 1
			if oGameState.gameresult return ok
			ogame {
			  sprite {
				type = ge_type_fire
				file  = "images/smrocket.png"
				scaled  = true
				transparent = true
				x = oself.x + 30
				y = oself.y + oself.height+ 30
				width = 30
				height = 30
				point = ogame.screen_h+30
				nstep = 30
				direction = ge_direction_incvertical
				xvalue =  oGame.aObjects[2].x
				temp = oself.x + 30 - xvalue
				state = func oGame,oSelf {
				  oself { x = oSelf.temp +  oGame.aObjects[2].x  }
				  x =  oGame.aObjects[oGameState.playerindex]
				  if oself.x >= x.x and oself.y >= x.y and
					 oself.x <= x.x + x.width and
					 oself.y <= x.y + x.height
					 if oGameState.value > 0
					   oGameState.value-=1000
					 ok
					 ogame.remove(oself.nindex)
					 checkgameover(oGame)
				  ok
				}
			  }
			}
		  ok
		}
	  }
  }
  ogame.lbraceend = true


func checkstarskey oGame,oSelf,nValue,nRow,nCol
  switch nValue
	on 4
	  oGame.aObjects[2].aMap[nRow][nCol] = 6
	  oGameState.Score += 100
	  checkopenwall(oGame)
	  oGame { Sound {
		once = true
		file = "sound/sfx_point.wav"
	  } }
	on 5
	  oGame.aObjects[2].aMap[nRow][nCol] = 0
	  oGameState.DoorKey = true
	  oGameState.Score += 500
	  checkopenwall(oGame)
	  oGame { Sound {
		once = true
		file = "sound/sfx_point.wav"
	  } }
  off

func checkstarskeycol oGame,oSelf
  nValue = oGame.aObjects[2].getvalue(oSelf.x,oSelf.y)
  nRow = oGame.aObjects[2].getrow(oSelf.x,oSelf.y)
  nCol = oGame.aObjects[2].getcol(oSelf.x,oSelf.y)
  checkstarskey(oGame,oSelf,nValue,nRow,nCol)

  nValue = oGame.aObjects[2].getvalue(oSelf.x+oSelf.width,oSelf.y+oSelf.height)
  nRow = oGame.aObjects[2].getrow(oSelf.x+oSelf.width,oSelf.y+oSelf.height)
  nCol = oGame.aObjects[2].getcol(oSelf.x+oSelf.width,oSelf.y+oSelf.height)
  checkstarskey(oGame,oSelf,nValue,nRow,nCol)

  nValue = oGame.aObjects[2].getvalue(oSelf.x+oSelf.width,oSelf.y)
  nRow = oGame.aObjects[2].getrow(oSelf.x+oSelf.width,oSelf.y)
  nCol = oGame.aObjects[2].getcol(oSelf.x+oSelf.width,oSelf.y)
  checkstarskey(oGame,oSelf,nValue,nRow,nCol)

  nValue = oGame.aObjects[2].getvalue(oSelf.x,oSelf.y+oSelf.height)
  nRow = oGame.aObjects[2].getrow(oSelf.x,oSelf.y+oSelf.height)
  nCol = oGame.aObjects[2].getcol(oSelf.x,oSelf.y+oSelf.height)
  checkstarskey(oGame,oSelf,nValue,nRow,nCol)

func callenemystate oGame
  for t in oGame.aObjects
	t {
	  if type = GE_TYPE_ENEMY
		call state(oGame,t)
	  ok
	}
  next

Class GameState

  down = 3
  gameresult = false
  Score = 0
  startplay=false
  lastcol = 0
  playerwin = false
  DoorKey = false
  playerindex = 4
  value = 1000
  moveplayer = false
```

Screen Shot:

:alt: Super Man 2016


## gameengineandorid

# =
# Building Games For Android

Chapter Author: Youssef Saeed

In this chapter, we will learn about building RingLibSDL games for mobile. This will allow us to create Android packages (`.apk` or `.aab`) for applications developed using the Ring Game Engine for 2D games.

RingLibSDL is a binding that connects the Ring programming language with the Simple DirectMedia Layer (SDL) library, providing a powerful framework for creating cross-platform games and multimedia applications.

:depth: 2

# Prerequisites

Before you begin, you need to have the necessary development tools installed on your system.

- **Android Studio**
The recommended way to get the Android SDK, NDK, and build tools is by installing the latest version of `Android Studio <https://developer.android.com/studio>`_.

- **Android SDK**
- Android SDK Platform 36 or the latest available.
- You can install and manage SDK platforms through the SDK Manager in Android Studio.

- **Android NDK**
- Android NDK version r27 or later.
- This can also be installed and managed through the Android Studio SDK Manager (`Tools` > `SDK Manager` > `SDK Tools` tab).

- **Java Development Kit (JDK)**
- JDK 17 or later. We recommend using a modern LTS version.
- **Recommended:** `Azul Zulu JDK 21 <https://www.azul.com/downloads/?package=jdk#zulu>`_ or later.
- **Alternative:** `Oracle OpenJDK 17 <https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html>`_ or later.

> **Note:**
> If you prefer an automated setup, you can use the provided installation scripts (``install_android_sdk.sh`` for Linux or ``install_android_sdk.ps1`` for Windows) to install the JDK, Android SDK, NDK, and set up the environment automatically. See the :ref:`automated-setup-using-scripts` section below.

# Automated Setup using Scripts

To simplify the installation process, you can use the provided scripts that automatically download and install the required components.

## goldmagic800

# =
# The Gold Magic 800 Game

In this chapter we will learn about the Gold Magic 800 Game

The game is developed using Ring, RingAllegro and RingOpenGL

After installing the package:

```ring
ringpm install goldmagic800
```

You will find the game in ring/applications/goldmagic800 folder

# The Game Story

Your friend discovered a unique and special box, created by the greatest wizard in the world 7,000 years ago.
When you close the box and move it, you will find new gold underneath, making it an infinite source of wealth.
The box resides in a special environment full of puzzles, protected by powerful magic that prevents anyone from entering.
Your friend has designed a new robot using nanotechnology that can move the box with a remote control device.
Your mission is to solve all the puzzles and secure this box forever, making you the richest person in the world.

# How to play?

The Gold Magic 800 is a puzzle game about moving your box through the right way.

The game is based on moving your box around to get gold score (=800) to open the
First Door (Box Number 1) Then directly put your box on the Door (this will open the next door),
Then continue to put your box on all of the next doors in the level, You need the score (800) only
for the first door, The next doors doesn't require this condition, but your way of gold will be
converted to a wall once you put the Box on any door, so select your path carefully.

# What will you learn?

1- Plan First

2- Move to your target directly then go to get the required resources

3- Look to the future when you evaluate the different solutions

4- Try to avoid mistakes, Also learn from them

5- Respect the Cost (800)

6- Focus and be careful

7- Be patient and Enjoy!

# Screen Shots

We can select the level

:alt: Gold Magic 800 - Screen Shot 2

The next screen shot for level (31)

:alt: Gold Magic 800 - Screen Shot 3

The Gold Magic 800 Level Editor

:alt: Gold Magic 800 Level Editor

# Source Code

You will find the Level Editor source code in this folder

https://github.com/ring-lang/ring/tree/master/applications/goldmagic800/editor

The user interface of the Level Editor is designed using the Ring Form Designer.

:alt: Gold Magic 800 Level Editor

The next file contains the Level Editor Controller Class

https://github.com/ring-lang/ring/blob/master/applications/goldmagic800/editor/editorController.ring

You will find the Game Engine source code in this folder

https://github.com/ring-lang/ring/tree/master/applications/goldmagic800


## libsdl

# =
# Using RingLibSDL

In this chapter we will learn about using RingLibSDL to create games based on the
LibSDL, SDLImage, SDLTTF and SDLMixer libraries.

> **Tip:**

> **Note:**

# Create Window

Example:

```ring
Load "libsdl.ring"

SDL_Init(SDL_INIT_EVERYTHING)
win = SDL_CreateWindow("Hello World!", 100, 100, 640, 480, SDL_WINDOW_SHOWN)
SDL_Delay(2000)
SDL_DestroyWindow(win)
SDL_Quit()
```


# Display Image

Example:

```ring
Load "libsdl.ring"

SDL_Init(SDL_INIT_EVERYTHING)
win = SDL_CreateWindow("Hello World!", 100, 100, 640, 480, SDL_WINDOW_SHOWN)
ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC )
bmp = SDL_LoadBMP("hello.bmp")
tex = SDL_CreateTextureFromSurface(ren,bmp)
SDL_FreeSurface(bmp)
SDL_RenderClear(ren)
SDL_RenderCopy2(ren,tex)
SDL_RenderPresent(ren)
SDL_Delay(2000)
SDL_DestroyTexture(tex)
SDL_DestroyRenderer(ren)
SDL_DestroyWindow(win)
SDL_Quit()
```


# Switch between two images

Example:

```ring
Load "libsdl.ring"

SDL_Init(SDL_INIT_EVERYTHING)
win = SDL_CreateWindow("Hello World!", 100, 100, 640, 480, SDL_WINDOW_SHOWN)
ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC )
bmp = SDL_LoadBMP("hello.bmp")
tex = SDL_CreateTextureFromSurface(ren,bmp)
SDL_FreeSurface(bmp)
bmp = SDL_LoadBMP("hello2.bmp")
tex2 = SDL_CreateTextureFromSurface(ren,bmp)
SDL_FreeSurface(bmp)

for x = 1 to 10 showtex(tex) showtex(tex2) next

SDL_DestroyTexture(tex)
SDL_DestroyTexture(tex2)
SDL_DestroyRenderer(ren)
SDL_DestroyWindow(win)
SDL_Quit()

func showtex oTex
	SDL_RenderClear(ren)
	SDL_RenderCopy2(ren,oTex)
	SDL_RenderPresent(ren)
	SDL_Delay(200)
```


# Draw Rectangle

Example:

```ring
Load "libsdl.ring"

SDL_Init(SDL_INIT_EVERYTHING)
win = SDL_CreateWindow("Hello World!", 100, 100, 640, 480, SDL_WINDOW_SHOWN)
ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC )
SDL_RenderClear(ren)
rect = sdl_new_sdl_rect()
sdl_set_sdl_rect_x(rect,10)
sdl_set_sdl_rect_y(rect,10)
sdl_set_sdl_rect_w(rect,100)
sdl_set_sdl_rect_h(rect,100)
SDL_SetRenderDrawColor(ren,255,255,255,255)
SDL_RenderDrawRect(ren,rect)
sdl_destroy_sdl_rect(rect)
SDL_RenderPresent(ren)
SDL_Delay(2000)
SDL_DestroyRenderer(ren)
SDL_DestroyWindow(win)
SDL_Quit()
```


# Display PNG Images

Example:

```ring
Load "libsdl.ring"

SDL_Init(SDL_INIT_EVERYTHING)
win = SDL_CreateWindow("Hello World!", 100, 100, 640, 480, SDL_WINDOW_SHOWN)
ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC )
bmp = IMG_Load("hello3.png")
tex = SDL_CreateTextureFromSurface(ren,bmp)
SDL_FreeSurface(bmp)
SDL_RenderClear(ren)
SDL_RenderCopy2(ren,tex)
SDL_RenderPresent(ren)
SDL_Delay(2000)
SDL_DestroyTexture(tex)
SDL_DestroyRenderer(ren)
SDL_DestroyWindow(win)
SDL_Quit()
```


# Use TTF Fonts

Example:

```ring
Load "libsdl.ring"

SDL_Init(SDL_INIT_EVERYTHING)
win = SDL_CreateWindow("Hello World!", 100, 100, 640, 480, SDL_WINDOW_SHOWN)
ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC )
SDL_RenderClear(ren)

TTF_Init()
font = TTF_OpenFont("pirulen.ttf", 16)
color = sdl_new_sdl_color()
sdl_set_sdl_color_r(color,0)
sdl_set_sdl_color_g(color,255)
sdl_set_sdl_color_b(color,0)
text = TTF_RenderText_Solid(font,"Welcome to the Ring language",color)
surface = SDL_GetWindowSurface(win)
SDL_BlitSurface(text, NULL, surface, NULL)
SDL_UpdateWindowSurface(win)
SDL_Delay(2000)

SDL_Destroy_SDL_Color(color)
SDL_FreeSurface(text)
TTF_CloseFont(font)
SDL_DestroyRenderer(ren)
SDL_DestroyWindow(win)
SDL_Quit()
```


# Display Transparent Images

Example:

```ring
Load "libsdl.ring"

SDL_Init(SDL_INIT_EVERYTHING)

flags = IMG_INIT_JPG | IMG_INIT_PNG
IMG_Init(flags)

win = SDL_CreateWindow("Hello World!", 100, 100, 800, 600, SDL_WINDOW_SHOWN)
ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC )

bmp = IMG_Load("stars.jpg")
tex = SDL_CreateTextureFromSurface(ren,bmp)
SDL_FreeSurface(bmp)
SDL_RenderClear(ren)
SDL_RenderCopy(ren,tex,NULL,NULL)
SDL_DestroyTexture(tex)

bmp = IMG_Load("player.png")
# Image - Set Transparent color (white)
myformat = sdl_get_sdl_surface_format(bmp)
white = SDL_MapRGB(myformat, 255, 255, 255)
SDL_SetColorKey(bmp, SDL_True, white)

tex = SDL_CreateTextureFromSurface(ren,bmp)
SDL_FreeSurface(bmp)
rect = sdl_new_sdl_rect()
sdl_set_sdl_rect_x(rect,0)
sdl_set_sdl_rect_y(rect,0)
sdl_set_sdl_rect_w(rect,100)
sdl_set_sdl_rect_h(rect,100)
SDL_RenderCopy(ren,tex,NULL,rect)

SDL_SetTextureBlendMode(tex,2)
SDL_SetTextureAlphaMod(tex,255)
sdl_set_sdl_rect_x(rect,200)
sdl_set_sdl_rect_y(rect,200)
sdl_set_sdl_rect_w(rect,100)
sdl_set_sdl_rect_h(rect,100)
SDL_RenderCopy(ren,tex,NULL,rect)

SDL_DestroyTexture(tex)
SDL_Destroy_SDL_Rect(rect)

SDL_RenderPresent(ren)
SDL_Delay(2000)
SDL_DestroyRenderer(ren)
SDL_DestroyWindow(win)
SDL_Quit()
```


# Close Window Event

Example:

```ring
Load "libsdl.ring"

SDL_Init(SDL_INIT_EVERYTHING)
win = SDL_CreateWindow("Hello World!", 100, 100, 640, 480, SDL_WINDOW_SHOWN)

myevent = sdl_new_sdl_event()
while true
	thevent = sdl_pollevent(myevent)
	switch sdl_get_sdl_event_type(myevent)
		on sdl_get_sdl_quit()
			exit
		on sdl_get_sdl_keydown()
			Key = SDL_GET_SDL_Event_key_keysym_sym(myevent)
			if key = 27 exit ok

	off
end

SDL_DestroyWindow(win)
SDL_Quit()
```


# Mouse Events

Example:

```ring
Load "libsdl.ring"

SDL_Init(SDL_INIT_EVERYTHING)

win = SDL_CreateWindow("Mouse Events ", 100, 100, 640, 480, SDL_WINDOW_SHOWN)

TTF_Init()
font = TTF_OpenFont("pirulen.ttf", 16)
color = sdl_new_sdl_color()
sdl_set_sdl_color_r(color,0)
sdl_set_sdl_color_g(color,255)
sdl_set_sdl_color_b(color,0)

surface = SDL_GetWindowSurface(win)

myevent = sdl_new_sdl_event()
while true
	cMsg = ""
	sdl_pollevent(myevent)
	switch sdl_get_sdl_event_type(myevent)
		on SDL_QUIT
			exit
		on SDL_KEYDOWN
			Key = SDL_GET_SDL_Event_key_keysym_sym(myevent)
			if key = 27 exit ok
		on SDL_MOUSEBUTTONDOWN
			if sdl_get_Sdl_Event_button_button(myevent) = SDL_BUTTON_LEFT
				SDL_SETWINDOWTITLE(win, " Button_Left_Down " )
			but sdl_get_Sdl_Event_button_button(myevent) = SDL_BUTTON_MIDDLE
				SDL_SETWINDOWTITLE(win,  " Button_Middle_Down " )
			but sdl_get_Sdl_Event_button_button(myevent) = SDL_BUTTON_RIGHT
				SDL_SETWINDOWTITLE(win,  " Button_Right_Down " )
			ok
		on SDL_MOUSEMOTION
			sdl_fillrect(surface,NULL,0)
			if sdl_get_sdl_event_motion_xrel(myevent) < 0
				cMsg += " Left "
			else
				cMsg += " Right "
			ok
			if sdl_get_sdl_event_motion_yrel(myevent) < 0
				cMsg += " Up "
			else
				cMsg += " Down "
			ok
			cMsg += " x = " + sdl_get_sdl_event_motion_x(myevent)
			cMsg += " y = " + sdl_get_sdl_event_motion_y(myevent)
			showmsg(cMsg)
	off
end

SDL_Destroy_SDL_Color(Color)
TTF_CloseFont(font)
SDL_DestroyWindow(win)
SDL_Quit()

func showmsg mymsg
	text = TTF_RenderText_Solid(font,mymsg,color)
	SDL_BlitSurface(text, NULL, surface, NULL)
	SDL_UpdateWindowSurface(win)
	SDL_FreeSurface(text)
```


# Play Sound

Example:

```ring
Load "libsdl.ring"

SDL_Init(SDL_INIT_EVERYTHING)
win = SDL_CreateWindow("Hello World!", 100, 100, 640, 480, SDL_WINDOW_SHOWN)
Mix_OpenAudio( 44100, MIX_DEFAULT_FORMAT , 2, 10000)
Mix_AllocateChannels(4)
sound = Mix_LoadWav( "sound.wav" )
Mix_VolumeChunk(sound,1)
Mix_PlayChannel(1,sound,0)

myevent = sdl_new_sdl_event()
while true
	thevent = sdl_pollevent(myevent)
	switch sdl_get_sdl_event_type(myevent)
		on sdl_get_sdl_quit()
			exit
		on sdl_get_sdl_keydown()
			Key = SDL_GET_SDL_Event_key_keysym_sym(myevent)
			if key = 27 exit ok
	off
end

Mix_FreeChunk( sound )
Mix_CloseAudio()
Mix_Quit()
SDL_DestroyWindow(win)
SDL_Quit()
```
