	.text
	.file	"var_test.ll"
	.globl	print_integer           # -- Begin function print_integer
	.p2align	4, 0x90
	.type	print_integer,@function
print_integer:                          # @print_integer
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, 4(%rsp)
	movl	4(%rsp), %esi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	%eax, (%rsp)            # 4-byte Spill
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	print_integer, .Lfunc_end0-print_integer
	.cfi_endproc
                                        # -- End function
	.globl	read_integer            # -- Begin function read_integer
	.p2align	4, 0x90
	.type	read_integer,@function
read_integer:                           # @read_integer
	.cfi_startproc
# %bb.0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	callq	__errno_location
	movl	$0, (%rax)
	movq	stderr, %rdi
	movabsq	$.L.str.1, %rsi
	movb	$0, %al
	callq	fprintf
	movabsq	$.L.str.2, %rdi
	leaq	20(%rsp), %rsi
	movl	%eax, 12(%rsp)          # 4-byte Spill
	movb	$0, %al
	callq	__isoc99_scanf
	movl	%eax, 16(%rsp)
	cmpl	$1, 16(%rsp)
	jne	.LBB1_2
# %bb.1:
	movl	20(%rsp), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB1_2:
	.cfi_def_cfa_offset 32
	callq	__errno_location
	cmpl	$0, (%rax)
	je	.LBB1_4
# %bb.3:
	movabsq	$.L.str.3, %rdi
	callq	perror
	movl	$1, %edi
	callq	exit
.LBB1_4:
	movq	stderr, %rdi
	movabsq	$.L.str.4, %rsi
	movb	$0, %al
	callq	fprintf
	movl	$1, %edi
	movl	%eax, 8(%rsp)           # 4-byte Spill
	callq	exit
.Lfunc_end1:
	.size	read_integer, .Lfunc_end1-read_integer
	.cfi_endproc
                                        # -- End function
	.globl	g                       # -- Begin function g
	.p2align	4, 0x90
	.type	g,@function
g:                                      # @g
	.cfi_startproc
# %bb.0:
	xorl	%eax, %eax
	movl	%edi, -4(%rsp)
	retq
.Lfunc_end2:
	.size	g, .Lfunc_end2-g
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	xorl	%eax, %eax
	addl	$4, %eax
	movl	%eax, %edi
	movl	%eax, 52(%rsp)          # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 48(%rsp)          # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 44(%rsp)          # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 40(%rsp)          # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 36(%rsp)          # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 32(%rsp)          # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 28(%rsp)          # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 24(%rsp)          # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 20(%rsp)          # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 16(%rsp)          # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 12(%rsp)          # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 8(%rsp)           # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, 4(%rsp)           # 4-byte Spill
	callq	g
	movl	52(%rsp), %edi          # 4-byte Reload
	movl	%eax, (%rsp)            # 4-byte Spill
	callq	print_integer
	movl	40(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	32(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	28(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	24(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	20(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	16(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	12(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	8(%rsp), %edi           # 4-byte Reload
	callq	print_integer
	movl	4(%rsp), %edi           # 4-byte Reload
	callq	print_integer
	movl	40(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	40(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	40(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	40(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	48(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	48(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	movl	48(%rsp), %edi          # 4-byte Reload
	callq	print_integer
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\n"
	.size	.L.str, 4

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"please enter an integer\n"
	.size	.L.str.1, 25

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%d"
	.size	.L.str.2, 3

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"scanf"
	.size	.L.str.3, 6

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"no matching characters\n"
	.size	.L.str.4, 24


	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
	.addrsig_sym print_integer
	.addrsig_sym __errno_location
	.addrsig_sym __isoc99_scanf
	.addrsig_sym perror
	.addrsig_sym exit
	.addrsig_sym fprintf
	.addrsig_sym read_integer
	.addrsig_sym g
	.addrsig_sym main
	.addrsig_sym stderr
