.386
.MODEL FLAT

ExitProcess PROTO NEAR32 stdcall, dwExitCode: DWORD


INCLUDE io.h

cr		EQU		0dh
lf		EQU		0ah

.STACK 4096

.DATA

prompt1		BYTE	"Please type maximum number : "
Maximum		BYTE    16 DUP (?)
            BYTE    cr,Lf,Lf,Lf,Lf,0
Answer      BYTE    "Answer is : "
            BYTE    cr,Lf,Lf,0
Result      BYTE    cr,Lf
Value       BYTE    11 DUP (?)
Space       BYTE    15 DUP (' ')
Square      BYTE    11 DUP (?)
            BYTE    cr,Lf,Lf,0


.CODE
_start:
            output	prompt1
			input   Maximum,16
			atod    Maximum
			mov     ecx,eax
			inc     eax
			mov     ebx,eax
      
fors:        
			mov     edx,ebx
			sub     edx,ecx
			dtoa    Value,edx
			imul    edx,edx
			dtoa	Square,edx
			output  Result
			loop    fors

			INVOKE	ExitProcess, 0
PUBLIC	_start
END