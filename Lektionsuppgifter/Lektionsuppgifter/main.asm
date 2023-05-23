;
; Lektionsuppgifter.asm
;
; Created: 30/03/2023 12:58:24
; Author : olleh
;


; Replace with your application code

;Úppgift 1
    ldi r16, 198
	ldi r17, $64
	ldi r17, $93

;Uppgift 2
	mov r18, r16

;Uppgift 3
	lds r16, 0x110
	sts 0x112, r16 ; Store the contents of register r16 into memory cell $112

;Uppgift 4
	lds r16, 0x110
	lds r17, 0x111

	adc r16,r17

	sts 0x112,r16

;Uppgift 5
	lds r16, 0x110

	lsl r16

	sts 0x111, r16

;Uppgift 6
	andi r16, $0F

;Uppgift 7
	ori r16, $E0

;Uppgift 8
    lds r16, 0x110
    swap r16
    andi r16, 0x0F
    sts 0x111, r16
    lds r17, 0x110
    andi r17, 0x0F
    sts 0x112, r17
	
;Uppgift 9
	lds r16, 0x110
	lds r17, 0x111
	
	cp r16, r17
	brge r16BIGGER ;if r16>=r17 => branch to r16bigger
	sts 0x112, r17

r16BIGGER:
	sts 0x112, r16

;Uppgift 10
	lds r16, 0x110
	
	lsl r16			;x2
	mov r17, r16

	lsl r16			;x4
	lsl r16			;x8

	add r16, r17	; 2x + 8x

	sts 0x112, r16

;Uppgift 11
	ldi r15, 7
	adc r16, r15

;Uppgift 12
	ldi r29, 3	
	ldi r28, 1

    add r30, r29
    brcc INGENCARRY
    add r31, r28

INGENCARRY:
 ;gör inget...

