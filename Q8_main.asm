.386
.MODEL FLAT

ExitProcess	PROTO NEAR32 stdcall, dwExitCode: DWORD
EXTRN	GetValue: NEAR32

INCLUDE io.h

cr		EQU			0dh
lf		EQU			0ah

.STACK	4096

.DATA
prompt1		BYTE	"Enter max value: ", 0
maxValue	BYTE	11 DUP (?)
prompt2		BYTE	"You entered "
result		BYTE	11 DUP (?)
			BYTE	". ", cr, lf, 0

.CODE
_start:
			output	prompt1
			input	maxValue, 11
			atod	maxValue

			call	GetValue

			dtoa	result, eax
			output	prompt2

			INVOKE	ExitProcess, 0
PUBLIC _start
END