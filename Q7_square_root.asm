PUBLIC	  Root

.386
.MODEL FLAT

.CODE
Root      PROC  NEAR32
          push  ebx          ; save registers
          push  ecx
          mov   ebx, 0       ; SqRt := 0
WhileLE:  mov   ecx, ebx     ; copy SqRt
          imul  ecx, ebx     ; SqRt*SqRt
          cmp   ecx, eax     ; SqRt*SqRt <= Nbr ?
          jnle  EndWhileLE   ; exit if not
          inc   ebx          ; add 1 to SqRt
          jmp   WhileLE      ; repeat
EndWhileLE:
          dec   ebx          ; subtract 1 from SqRt
          mov   eax, ebx     ; return SqRt in AX
          pop   ecx          ; restore registers
          pop   ebx
          ret               ; return
Root      ENDP
END

