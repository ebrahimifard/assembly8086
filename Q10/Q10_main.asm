.386
.MODEL FLAT

ExitProcess PROTO NEAR32 stdcall, dwExitCode: DWORD
EXTRN	MAX3: NEAR32

INCLUDE io.h

cr		EQU		0dh
lf		EQU		0ah

.STACK 4096

.DATA
prompt1		BYTE	"Please type first number : ",0
prompt2		BYTE	"please	type second number : ",0
prompt3     BYTE	"please typr third number : ",0
Value1		BYTE	11 DUP (?)
Value2		BYTE	11 DUP (?)
Value3		BYTE	11 DUP (?)
Answer		BYTE	"Maximum number is : "
Result		BYTE	11 DUP (?)
			BYTE    cr,lf,0

.CODE
_START:
			output	prompt1
			input	Value1,11
			atod	Value1
			push	eax

			output	prompt2
			input	Value2,11
			atod	Value2
			push	eax

			output	prompt3
			input	Value3,11
			atod	Value3
			push	eax

			call	MAX3
			
			dtoa	Result,eax
			output	Answer

			INVOKE	ExitProcess, 0

PUBLIC	_start
END