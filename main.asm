.psx
.Open "exe/src_SLPS_023.87", "exe/SLPS_023.87", 0x8000F800
.headersize 0X8000F800

.include "src/extra_text.asm"

; Secondary text rendering routine (memcard messages)
; Doesn't handle newlines or highlighted text
.org 0x80032ce4
addiu	t1,t1,0x1	; Count each char as 1 byte instead of 2

.org 0x80032d9c
nop					; Read only one byte/char from the input string
nop
jal		GetASCIICharTextureFromBios
nop

.org 0x80032dbc
expand_line_texture:
li		v1,0x7
lbu		v0,0x0(a1)	; Read BIOS 1bpp char texture 1 byte/line at a time

.org 0x80032de0
addiu	a2,0x1
slti	v0,a2,0xf
bne		v0,r0,expand_line_texture
addiu	a1,0x1
j		0x80032e1c
nop

.org 0x80032e20
sra		t9,s5,0x2	; Halve width of final chars (13 to 6)

.org 0x80032e80
andi	v1,0xf0
sra		v1,v1,0x1	; Halve the byte offset for pixel below (16 to 8)

.org 0x80032f18
slti	v0,a3,0x7e	; Iterate half the times for halfwidth tex

.org 0x80032f3c
addiu	s1,s1,0x1	; Advance char read 1 byte for ASCII instead of SJIS

; Main text rendering routine (in-game dialogues)
; Recognizes 0x1 as newline, 0x23 to enclose highlighted text in red

.org 0x800327b0		; Halve line length in bytes/chars
jal		0x800328ac
addu	v0,t5,v0

.org 0x80032aa4
jal		0x800328ac
addu	v0,t5,v0

.org 0x800328ac
srl		t6,s6,0x1
sb		t6,0x0(v0)
jr		ra
nop

.org 0x80032834			; Halve # position in chars
j		0x800328bc
srl		t6,v1,0x1

.org 0x800328bc
sb		t6,0x0(v0)
j		0x80032a80
nop

.org 0x8003284c
nop

.org 0x80032854
nop					; Read only one byte/char from the input string

.org 0x80032874
lbu		v0,0x0(a1)	; Read BIOS 1bpp char texture 1 byte/line at a time

.org 0x80032894
addiu	a2,0x1
slti	v0,a2,0xf
bne		v0,r0,0x80032870
addiu	a1,0x1
j		0x800328d0
nop

.org 0x80032908
nop					; Prevent char width from doubling

.org 0x80032964
andi	v1,0xf0
sra		v1,v1,0x1	; Halve the byte offset for pixel below (16 to 8)

.org 0x80032a44
slti	v0,s1,0x7e	; Iterate half the times for halfwidth tex

.org 0x80032a64
nop					; Prevent two byte advance to fetch next char

; Fetch half-width textures for ASCII chars from the BIOS
.org	0x80013d04
.area	0x80013dc6 - 0x80013d04
FontMap:
	.include "src/font_map.asm"
.endarea

.org	0x8004ab3c
.area	0x8004ab94 - 0x8004ab3c
GetASCIICharTextureFromBios:
la		v1, FontMap
addiu	v0, a0, -0x1f
sll		v0, 1
addu	v0, v1

lhu		v0, 0x0(v0)
nop

lui		v1, 0xBFC7	; base addr in BIOS for charset 4 textures (half-width)
or		v0, v1

jr		ra
nop
.endarea

.org 0x8006f6f4		; whitespace used in word-item menu for empty slots
.sjisn " "
.db 0x00

.Close

.Open "exe/src_YEKJPK.DAT", "exe/YEKJPK.DAT", 0x0

.include "src/game_text.asm"
.include "src/word_item.asm"

.Close
