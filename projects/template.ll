target triple = "x86_64-pc-linux-gnu"

declare i32 @printf(i8*, ...) #1
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define void @print_integer(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %3)
  ret void
}

define i32 @main() #0 {
  %t1 = add nsw i32 99, 22
  call void @print_integer(i32 %t1)
  %t2 = sdiv i32 102, 2
  call void @print_integer(i32 %t2)
  %t3 = sub nsw i32 30, 81
  call void @print_integer(i32 %t3)
  %t4 = mul nsw 29, 4
  call void @print_integer(i32 %t4)
  call void @print_integer(i32 70)
  ret i32 0
}
