

.386
.MODEL FLAT

ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

INCLUDE io.h            ; header file for input/output

cr      EQU     0dh     ; carriage return character
Lf      EQU     0ah     ; line feed

.STACK  4096            ; reserve 4096-byte stack

.DATA                   ; reserve storage for data
Prompt1			BYTE  "This program evaluate complex expression",cr,Lf,Lf
				BYTE  "     ........ ( X - 2Y + 4Z ) ........      ",cr,Lf,Lf
				BYTE  " Please type X : ",0
Prompt2			BYTE  " Please type Y : ",0
Prompt3			BYTE  " Please type Z : ",0
Value			BYTE  16 DUP (?)
Answer          BYTE  cr,Lf,Lf,"The result is : "
Result          BYTE  16 DUP (?)
				BYTE  cr,Lf,Lf,0

.CODE
_start:
				output Prompt1
				input  Value,16
				atoi   Value
				mov    bx,ax

				output Prompt2
				input  Value,16
				atoi   Value
				mov    cx,ax
				add    cx,cx

				output Prompt3
				input  Value,16
				atoi   Value
				mov    dx,ax
				add    dx,dx
				add    dx,dx


				sub    bx,cx
				add    bx,dx

				itoa   Result,bx
				output Answer
				INVOKE  ExitProcess, 0  

PUBLIC _start                  

END  

