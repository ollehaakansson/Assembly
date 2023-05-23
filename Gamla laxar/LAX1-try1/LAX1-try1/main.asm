	ldi r16, HIGH(RAMEND)
	out SPH, r16
	ldi r16, LOW(RAMEND)
	out SPL, r16
	call HW_INIT

DATA:
	clr r17
	in r16, PINA
	cpi r16, 10
	brpl PRINT
	subi r16, 10	
	ldi r17, 1

PRINT
	out PORTB, r16
	out PORTD, r17
	jmp DATA

HW_INIT:
	ldi r16, 0x0F	;Utsignaler
	out DDRB, r16
	out DDRD, r16
	clr r16			;Insignaler
	out DDRA, r16
	ret