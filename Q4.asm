.386
.MODEL FLAT

ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

INCLUDE io.h            ; header file for input/output

cr      EQU     0dh     ; carriage return character
Lf      EQU     0ah     ; line feed

.STACK  4096            ; reserve 4096-byte stack

.DATA                   ; reserve storage for data

prompt1			BYTE	"     ---------- Calculation The Volume Of A Cube ----------     ",cr,Lf,Lf
				BYTE	"Please type x : ",0
Prompt2			BYTE	"Please type y : ",0
prompt3			BYTE	"Please typr z : ",0
Value			BYTE	16 DUP (?)
Answer			BYTE	"The answer is : "
Result			BYTE	32 DUP (?)
				BYTE	cr,Lf,Lf

.CODE
_Start:
				output Prompt1
				input  Value,16
				atod   Value
				mov    ebx,eax

				output Prompt2
				input  Value,16
				atod   Value
				mul    ebx
				mov    ebx,eax

				output Prompt3
				input  Value,16
				atod   Value
				mul    ebx

				dtoa   Result,eax
				output Answer
				INVOKE  ExitProcess, 0  

PUBLIC _start                  

END  
