# Prisoner PSX English translation patch

This includes all the necessary code to patch the game and translate it to English.
Patcher script is Linux only, but it should be easy to replicate the same steps in a .bat in Windows.

## What you'll need:

*	Java and Wine installed on your system.
*	A copy of the game, with the .cue and .bin extracted in the "bin" folder.
*	MD5 for Prisoner (Japan).bin should be 0456698b5061bd34606b35763ff48979

##	You'll also need the following executables in the "tools" folder:
*	armips.exe
*	jpsxdec.jar
*	jpsxdec-lib.jar
*	psxinject.exe (part of the psximager suite)

Simply give run permissions to patcher.py and execute. If everything's in order, it'll patch the .bin of the game and you'll be able to play it in English.

## Known bugs/glitches
*	The game uses a non-standard bilinear interpolation algorithm that was designed to scale the PSX BIOS' full-width 16x15 px font down to 13x12-ish and somewhat antialiase them. I managed to modify it enough to work with the BIOS' half-width 8x15 px font, but sometimes there's a small 1 px overlap between two chars (this is particularly noticeable in the "Checking memory card" message). I haven't been able to figure out why that happens. It's mildly annoying, but the text is perfectly readable.
*	Probably related to the previous bug, sometimes a line of dialog will create a "ghost image" of its first two or three characters at the far-right end of the text box (past the character's portrait). It doesn't interfere with the text being displayed inside the box, and this glitch can be avoided by just forcing the text to appear all at once by pressing triangle or circle, which I wholeheartedly recommend. 

## Changelog:
###	v1.0:
*	Initial commit. The game is fully playable with the code as it stands.

##	To-do (but probably won't-do):
*	Fix the bilinear interpolation code for half-width character textures so that they don't have the occasional 1 pixel overlap.
*	Figure out why some text lines have a "ghost image" past the right edge of the dialog box (probably something to do with pointers, which I didn't figure out).
*	Reverse-engineer the proprietary FEY compression algorithm used for images so that I can extract, decompress, modify, recompress and reinsert them.

##	Other considerations:

This is my second translation patch ever. I did a thorough playtest for proofreading and such, but the game has A LOT of text and it's quite difficult to access all of it during a playthrough, so I probably missed something. Let me know, I'll update the patch in response to feedback.

Feel free to use this code to translate the game to whatever other language you feel like, or whatever. A simple "thank you" would be nice and appreciated, but it's by no means mandatory.
