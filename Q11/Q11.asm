; Amir Ebrahimifard
; 88521166

.386
.MODEL FLAT

ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

INCLUDE io.h            ; header file for input/output

cr      EQU     0dh     ; carriage return character
Lf      EQU     0ah     ; line feed

.STACK  4096            ; reserve 4096-byte stack

.DATA  


Introduction	BYTE	"---------- Machine Language and System Programming ----------",cr,Lf,Lf,0
Identification  BYTE	"--------------- Amir Ebrahimifard - 88521166 ---------------",cr,Lf,Lf,0
Prompt1			BYTE	"                      ----- COINS -----",cr,Lf,Lf
				BYTE    "Please type number of 100 Rials : ",0
Prompt2			BYTE    "Please type number of 250 Rials : ",0
Prompt3         BYTE    "Please type number of 500 Rials : ",0
Prompt4         BYTE    "Please type number of 1000 Rials : ",0


Rials100			BYTE	32 DUP (?)
Rials250			BYTE	32 DUP (?)
Rials500			BYTE	32 DUP (?)
Rials1000			BYTE	32 DUP (?)



Answer          BYTE	"There are "
Coins			BYTE    11 DUP (?)
				BYTE    "coins worth"
Total			BYTE	11 DUP (?)
				BYTE	cr,Lf,Lf,0


		

.CODE
_start:
			
			    ; ECX = COUNTER 
				; EDX = Total

				;Introduction to program
				output Introduction
				output Identification


				;Calculate 100 Rials coins
				output Prompt1
				input  Rials100,32
				atod   Rials100  
				mov	   ecx,eax
				imul   eax,100
				mov    edx,eax
				

				;Calculate 250 Rials coins
				output Prompt2
				input  Rials250,32
				atod   Rials250
				add    ecx,eax
				imul   eax,250
				add    edx,eax


				;Calculate 500 Rials coins
				output Prompt3
				input  Rials500,32
				atod   Rials500
				add    ecx,eax
				imul   eax,500
				add	   edx,eax


				;Calculate 1000 Rials coins
				output Prompt4
				input  Rials1000,32
				atod   Rials1000
				add    ecx,eax
				imul   eax,1000
				add    edx,eax


				;Show the answer
				dtoa   Coins,ecx
				dtoa   Total,edx
				output Answer


				INVOKE  ExitProcess, 0  

PUBLIC _start                  

END  

