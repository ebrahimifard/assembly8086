PUBLIC MAX3

.386
.MODEL FLAT

.CODE

MAX3	PROC	NEAR32

		push	ebp
		mov		ebp,esp
		push	ecx
		push	edx
		push	ebx
		push	esp
		push	ebp
		push	esi
		push	edi
		pushfd

		mov		eax,[ ebp + 8 ]	 ; input C in eax
		mov		ebx,[ ebp + 12 ] ; input B in ebx
		cmp		eax,ebx
		ja		CGB				 ; C greater than B
		jb		BGC				 ; B greater than C
CGB:	mov		ecx,eax			 ; if C>B , AFTER this part greater than between B and C is in the ecx
		Jmp		f1
BGC:	mov		ecx,ebx			 ; if B>C		
f1:		mov		edx,[ ebp + 16 ] ; input A in edx
		cmp		ecx,edx
		ja		FS1
		jb		FS2
FS1:	mov		eax,ecx			; Final strategy 1 
		Jmp	f2
FS2:	mov		eax,edx			; Final strategy 2


f2:		popfd
		pop		edi
		pop		esi
		pop		ebp
		pop		esp
		pop		ebx
		pop		edx
		pop		ecx
		pop		ebp
		add		esi, 12

		ret


MAX3	ENDP
END