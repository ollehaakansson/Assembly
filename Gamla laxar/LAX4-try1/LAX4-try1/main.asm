ldi r16, HIGH(RAMEND)
out SPH, r16
ldi r16, LOW(RAMEND)
out SPL, r16
call HW_INIT

DATA:
	in r16, PINA
	cpi r16, 0xFF
	breq SWITCH
	cpi r16, 9
	BRMI DATA
	jmp PRINT

SWITCH:
	cpi r18, 1
	breq ZERO
	ldi r18, 1
	jmp DATA
ZERO:
	clr r18
	jmp DATA	

PRINT:
	cpi r18, 1
	breq RIGHT
	out PORTB, r16
	jmp DATA
RIGHT:
	out PORTD, r16
	jmp DATA

HW_INIT:
	ldi r16, 0x0F
	out DDRB, r16
	out DDRD, r16
	clr r16
	out DDRA, r16
	ret