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

@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"scanf\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [32 x i8] c"no matching characters. exiting\00", align 1

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
  %4 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32* %1)
  store i32 %4, i32* %2, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %0
  %8 = load i32, i32* %1, align 4
  ret i32 %8

; <label>:9:                                      ; preds = %0
  %10 = call i32* @__errno_location() #4
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %9
  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable
}

define i32 @main() #0 {
  %1 = call i32 @read_integer()
  call void @print_integer(i32 %1)
  %2 = call i32 @read_integer()
  call void @print_integer(i32 %2)
  %3 = call i32 @read_integer()
  call void @print_integer(i32 %3)
  ret i32 0
}
