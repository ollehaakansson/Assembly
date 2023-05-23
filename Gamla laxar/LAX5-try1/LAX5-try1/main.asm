ldi r16, HIGH(RAMEND)
out SPH, r16
ldi r16, LOW(RAMEND)
out SPL, r16
call HW_INIT

MAIN:
	call DATA
	call PRINT
	jmp MAIN

DATA:
	in r16, PINA
	cpi r16, 0
	breq SWITCH
	jmp DATA_DONE

SWITCH:
	cpi r18, 1
	breq ZERO
	ldi r18, 1
	jmp DATA_DONE
ZERO:
	clr r18

DATA_DONE:
	ret

PRINT:
	out PORTB, r16

	cpi r18, 1
	breq INVERT
	out PORTD, r16
	jmp PRINT_DONE

INVERT:
	com r16
	out PORTD, r16

PRINT_DONE:
	ret

HW_INIT:
	ldi r16, 0x0F
	out PORTB, r16
	out PORTD, r16
	clr r16
	out PORTA, r16
	ret