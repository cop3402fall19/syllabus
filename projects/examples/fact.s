	.file	"fact.c"
	.text
	.p2align 4
	.globl	factorial
	.type	factorial, @function
factorial:
.LFB0:
	.cfi_startproc
	movl	$1, %eax
	testl	%edi, %edi
	jle	.L1
	.p2align 4,,10
	.p2align 3
.L2:
	imull	%edi, %eax
	subl	$1, %edi
	jne	.L2
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	factorial, .-factorial
	.ident	"GCC: (Debian 9.2.1-4) 9.2.1 20190821"
	.section	.note.GNU-stack,"",@progbits
