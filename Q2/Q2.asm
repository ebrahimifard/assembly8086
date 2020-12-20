

.386
.MODEL FLAT

ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

INCLUDE io.h            ; header file for input/output

cr      EQU     0dh     ; carriage return character
Lf      EQU     0ah     ; line feed

.STACK  4096            ; reserve 4096-byte stack

.DATA                   ; reserve storage for data

Prompt1			BYTE	".......... Evaluating Expresion ..........",cr,Lf,Lf
				BYTE	"---------- 2 ( -X + Y - 1 ) + Z ----------",cr,Lf,Lf
				BYTE    "Please type X : ",0
Prompt2			BYTE	"Please type Y : ",0
Prompt3			BYTE	"Please type Z : ",0
Value			BYTE    32 DUP (?)
Answer			BYTE    "The Result is : "
Result			BYTE	32 DUP (?)
				BYTE	cr,Lf,Lf,0
									
.CODE
_start:
				output Prompt1
				input  Value,32
				atoi   Value
				mov	   bx,ax
				neg	   bx

				output Prompt2
				input  Value,32
				atoi   Value
				add    bx,ax

				dec    bx
				add    bx,bx
				
				output Prompt3
				input  Value,32
				atoi   Value
				add    bx,ax

				itoa   Result,bx
				output Answer

				INVOKE  ExitProcess, 0  

PUBLIC _start                  

END  

