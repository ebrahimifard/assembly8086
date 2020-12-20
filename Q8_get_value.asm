PUBLIC	GetValue

.386
.MODEL FLAT

INCLUDE io.h

cr		EQU		0dh
lf		EQU		0ah

.DATA
prompt1		BYTE	"Enter a number: ", 0
value		BYTE	11 DUP (?)
maxValue	DWORD	?	

.CODE
GetValue	PROC	NEAR32
			push	ecx
			push	edx
			push	ebx
			push	esp
			push	ebp
			push	esi
			push	edi
			pushfd

			mov		maxValue, eax

lbl:		output	prompt1
			input	value, 11
			atod	value
			cmp		eax, maxValue
			ja		lbl

			popfd
			pop		edi
			pop		esi
			pop		ebp
			pop		esp
			pop		ebx
			pop		edx
			pop		ecx

			ret
GetValue	ENDP
END