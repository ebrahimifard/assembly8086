

.386
.MODEL FLAT

ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

INCLUDE io.h            ; header file for input/output

cr      EQU     0dh     ; carriage return character
Lf      EQU     0ah     ; line feed

.STACK  4096            ; reserve 4096-byte stack

.DATA  
Prompt1			BYTE	".................... Surface Of Cube ....................",cr,Lf,Lf
				BYTE	"Please type X : ",0
Prompt2			BYTE	"Please type Y : ",0
Prompt3			BYTE	"Please type Z : ",0
Value			BYTE	16 DUP (?)
Answer			BYTE	"Surface is "
Result			BYTE	16 DUP (?)
				BYTE    cr,Lf,Lf,0

.CODE
_start:
				output Prompt1
				input  Value,16
				atod   Value	
				mov    ebx,eax  ;ebx = X

				output Prompt2
				input  Value,16
				atod   Value
				mov    ecx,eax  ;ecx = Y

				output Prompt3
				input  Value,16
				atod   Value
				mov    edx,eax  ;edx = Z
				mov	   edi,eax
			
				

				mul	   ebx		; eax = X*Z
				mov    esi,eax  ; esi = xz
				mov    eax,ebx
				mul    ecx      ; eax = xy
				add    esi,eax  ; esi = xy + xz
				mov    eax,ecx
				mul    edi
				add    esi,eax
				add    esi,esi
				




				dtoa   Result,esi
				output Answer

				INVOKE  ExitProcess, 0  

PUBLIC _start                  

END  

