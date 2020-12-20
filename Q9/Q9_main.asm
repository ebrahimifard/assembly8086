.386
.MODEL FLAT

ExitProcess PROTO NEAR32 stdcall, dwExitCode: DWORD
EXTRN	Min2: NEAR32

INCLUDE io.h

cr		EQU		0dh
lf		EQU		0ah

.STACK 4096

.DATA
prompt1		BYTE	"Enter first number: ", 0
prompt2		BYTE	"Enter second number: ", 0
num1		BYTE	6 DUP (?)
num2		BYTE	6 DUP (?)
prompt3		BYTE	"Minimum is "
result		BYTE	6 DUP (?)
			BYTE	cr, lf, 0

.CODE
_start:
			output	prompt1
			input	num1, 6
			mov		eax, 0
			atoi	num1
			push	ax

			output	prompt2
			input	num2, 6
			mov		eax, 0
			atoi	num2
			push	ax

			call	Min2
			itoa	result, ax

			output	prompt3

			INVOKE	ExitProcess, 0
PUBLIC	_start
END