.386
.MODEL FLAT

ExitProcess PROTO NEAR32 stdcall, dwExitCode: DWORD
EXTRN     Root: NEAR32

INCLUDE io.h

cr		EQU			0dh
lf		EQU			0ah

.STACK	4096

.DATA
prompt1		BYTE	"Please enter a number: ", 0
anum		BYTE	11 DUP (?)
prompt2		BYTE	"The answer is "
result		BYTE	11 DUP (?)
			BYTE	cr, lf, 0
.CODE
_start:
			output	prompt1
			input	anum, 11
			atod	anum
			
			pushd	eax
			call	Root

			; mov		eax, 0
			dtoa	result, eax
			output	prompt2

			INVOKE ExitProcess, 0

PUBLIC	_start
END