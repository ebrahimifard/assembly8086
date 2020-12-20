PUBLIC Min2

.386
.MODEL FLAT

.CODE
Min2		PROC	NEAR32
			push	ebp
			mov		ebp, esp
			push	ecx
			push	edx
			push	ebx
			push	esp
			push	ebp
			push	esi
			push	edi
			pushfd

			mov		ax, [ebp + 8]
			mov		bx, [ebp + 8]
			cmp		bx, [ebp + 10]
			jl		p1gep2
			mov		ax, [ebp + 10]
p1gep2:
			popfd
			pop		edi
			pop		esi
			pop		ebp
			pop		esp
			pop		ebx
			pop		edx
			pop		ecx
			pop		ebp
			add		esi, 4

			ret
Min2		ENDP
END

