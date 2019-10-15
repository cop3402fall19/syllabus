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

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [25 x i8] c"please enter an integer\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"scanf\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"no matching characters\0A\00", align 1

declare i32* @__errno_location() #2
declare i32 @__isoc99_scanf(i8*, ...) #1
declare void @perror(i8*) #1
declare void @exit(i32) #3
declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

define i32 @read_integer() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32* @__errno_location() #4
  store i32 0, i32* %3, align 4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i32 0, i32 0))
  %6 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %1)
  store i32 %6, i32* %2, align 4
  %7 = load i32, i32* %2, align 4
  %8 = icmp eq i32 %7, 1
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %0
  %10 = load i32, i32* %1, align 4
  ret i32 %10

; <label>:11:                                     ; preds = %0
  %12 = call i32* @__errno_location() #4
  %13 = load i32, i32* %12, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %11
  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable
}

define i32 @g(i32) #0 {
  %x = alloca i32, align 4
  store i32 %0, i32* %x, align 4
  ret i32 0
}

define i32 @main() #0 {
  %x = add nsw i32 4, 0
  %y = call i32 @g(i32 %x)
  %z = call i32 @g(i32 %x)
  %a = call i32 @g(i32 %x)
  %a1 = call i32 @g(i32 %x)
  %a2 = call i32 @g(i32 %x)
  %a3 = call i32 @g(i32 %x)
  %a4 = call i32 @g(i32 %x)
  %a5 = call i32 @g(i32 %x)
  %a6 = call i32 @g(i32 %x)
  %a7 = call i32 @g(i32 %x)
  %a8 = call i32 @g(i32 %x)
  %a9 = call i32 @g(i32 %x)
  %b = call i32 @g(i32 %x)
  call void @print_integer(i32 %x)
  call void @print_integer(i32 %a)
  call void @print_integer(i32 %a2)
  call void @print_integer(i32 %a3)
  call void @print_integer(i32 %a4)
  call void @print_integer(i32 %a5)
  call void @print_integer(i32 %a6)
  call void @print_integer(i32 %a7)
  call void @print_integer(i32 %a8)
  call void @print_integer(i32 %a9)
  call void @print_integer(i32 %a)
  call void @print_integer(i32 %a)
  call void @print_integer(i32 %a)
  call void @print_integer(i32 %a)
  call void @print_integer(i32 %y)
  call void @print_integer(i32 %y)
  call void @print_integer(i32 %y)
  ret i32 0
}
