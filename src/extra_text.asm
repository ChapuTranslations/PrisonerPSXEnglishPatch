@line_end	equ	0x00

.org 0x80010876
.dw 0x81829382
.dw 0x85829682
.dw 0x40814081

.org 0x80010990
.sjisn "No room for word"
.db @line_end

.org 0x800109ac
.sjisn "obtained      fused"
.db @line_end

.org 0x800109cc
.sjisn "join?       delete?"
.db @line_end

.org 0x80010f4c
.sjisn "Loading "
.db @line_end

.org 0x80010f58
.sjisn "Please insert "
.db @line_end

.org 0x80010f70
.sjisn "All item buttons"
.db @line_end

.org 0x80010f88
.sjisn "Please insert a memory card"
.db @line_end

.org 0x80010fa4
.sjisn "Is broken, please fix"
.db @line_end

.org 0x80010fbc
.sjisn "Saving failed "
.db @line_end

.org 0x80010fd4
.sjisn "Loading failed"
.db @line_end

.org 0x80010fec
.sjisn "Saved "
.db @line_end

.org 0x80011000
.sjisn "Saving"
.db @line_end

.org 0x8001100c
.sjisn "Loaded"
.db @line_end

.org 0x8001101c
.sjisn "Format failed "
.db @line_end

.org 0x80011034
.sjisn "Format complete "
.db @line_end

.org 0x80011048
.sjisn "Formatting memory card"
.db @line_end

.org 0x80011060
.sjisn "\"PRISONER\""
.db @line_end

.org 0x80011078
.sjisn "No data for "
.db @line_end

.org 0x80011090
.sjisn "Format? "
.db @line_end

.org 0x800110a4
.sjisn "not formatted "
.db @line_end

.org 0x800110bc
.sjisn "Load? "
.db @line_end

.org 0x800110d0
.sjisn "(at least 1 block req)"
.db @line_end

.org 0x800110e8
.sjisn "capacity is full"
.db @line_end

.org 0x80011100
.sjisn "Memory card's "
.db @line_end

.org 0x80011114
.sjisn "Overwrite?"
.db @line_end

.org 0x80011128
.sjisn "Save? "
.db @line_end

.org 0x8001113c
.sjisn "in card slot 1"
.db @line_end

.org 0x80011154
.sjisn "not connected "
.db @line_end

.org 0x80011168
.sjisn "Memory card "
.db @line_end

.org 0x80011184
.sjisn "memory card "
.db @line_end

.org 0x8001119c
.sjisn "Checking"
.db @line_end
