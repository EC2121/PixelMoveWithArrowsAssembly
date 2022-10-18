
.org $8000
start:

LDA $4000

CMP #1
BEQ moveUp
CMP #2
BEQ moveDown
CMP #4
BEQ moveLeft
CMP #8
BEQ moveRight
JMP start

Clear:
LDA #0
STA $0200,X
RTS

Draw:
LDA #1
STA $0200,X
RTS


;MOVE UP--------------------
moveUp:
JSR Clear
;MOVE OFFSET
LDA $0300
SBC #16
STA $0300
LDX $0300
JSR Draw
JMP start

;MOVE RIGHT------------------
moveRight:
JSR Clear
LDX $0300
INX
STX $0300
JSR Draw
JMP start



;MOVE LEFT------------------
moveLeft:
JSR Clear
LDX $0300
DEX
STX $0300
JSR Draw
JMP start


;MOVE DOWN-------------------
moveDown:
JSR Clear
LDA $0300
ADC #15
STA $0300
LDX $0300
JSR Draw
JMP start

.goto $FFFA
.dw start
.dw start
.dw start