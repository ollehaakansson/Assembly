	ldi r16, HIGH(RAMEND)
	out SPH, r16
	ldi r16, LOW(RAMEND)
	out SPL, r16
	call HW_INIT

MAIN:
	sbic PINA
	jmp PROCED
	call PRINT
	jmp MAIN

PROCED:
	call DATA
	call PRINT
	jmp MAIN

DATA:
	in r16, PINA
	sbrc r16
	jmp DATA
	inc r16
	cpi r16, 16
	breq TOO_HIGH
	jmp DATA_DONE

TOO_HIGH:
	ldi r16, 15

DATA_DONE:
	ret

PRINT:
	SBRS PINB
	jmp PRINT_DONE
	out PORTD, r16

PRINT_DONE:
	ret

HW_INIT:
	ldi r16, 0x0F
	out DDRD, r16
	clr r16
	out DDRA, r16
	out DDRB, r16
	ret