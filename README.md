# libcirc-alt-unix

version: 1.3-alt

This is an alternative version of Liberation Circuit, an RTS/programming game, made to be easier to compile and mod.
This is NOT an official release, the original game can be found at https://github.com/linleyh/liberation-circuit.git

This version is made to compile on Windows only, to get the version for Unix systems, go to https://github.com/Xenos6666/libcirc-alt-unix

To compile the game, you first need to download mingw64 (make sure to get the x86_64 version), and install it, then either copy the mingw64 directory in the game's directory, or change the path in INSTALL.bat to your mingw64 directory. Once you are done, just run INSTALL.bat, and the game should compile.
If you encounter any problem during compilation, please report it to me on Vanilla's Liberation Circuit Discord server (you should find the link on the game's website).

The executable should go in the "bin" subdirectory (the same directory as the "init.txt" file). The game requires write access to this directory to save mission progress.
If this isn't okay, you can specify a path in the fopen calls at about lines 2808 and 2860 of h_story.c.

If you are running the game from a terminal, make sure to cd into bin/ before running it!

---

On top of changing the way this game compiles, this versions changes some of the source code to make it more compatible with modding.
I do NOT guarantee that the game will behave exactly the same way the original version does (although if it doesn't that proabably means I did something terribly wrong)

---

Don't try to compile the .c files in the /proc or /story subdirectories! They are code used by the game itself.

- Manual.html has extensive detail about the game, including documentation for the in-game API.

- Edit init.txt to set screen resolution and other options (fullscreen, sound volume, key rebinding, colourblind mode etc).

It looks like this (this is github markdown):

![a screenshot](http://i.imgur.com/pPIJ03I.png)

![another screenshot](http://i.imgur.com/QKWzkqA.png)
