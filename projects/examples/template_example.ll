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
  %t1 = add nsw i32 2, 3
  %t2 = add nsw i32 %t1, 3
  ret i32 %t2
}
