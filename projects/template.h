#define PROLOGUE \
"target triple = \"x86_64-pc-linux-gnu\"\n" \
"\n" \
"declare i32 @printf(i8*, ...) #1\n" \
"@.str = private unnamed_addr constant [4 x i8] c\"%%d\\0A\\00\", align 1\n" \
"\n" \
"define void @print_integer(i32) #0 {\n" \
"  %%2 = alloca i32, align 4\n" \
"  store i32 %%0, i32* %%2, align 4\n" \
"  %%3 = load i32, i32* %%2, align 4\n" \
"  %%4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %%3)\n" \
"  ret void\n" \
"}\n" \
"\n" \
"%%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %%struct._IO_marker*, %%struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %%struct._IO_codecvt*, %%struct._IO_wide_data*, %%struct._IO_FILE*, i8*, i64, i32, [20 x i8] }\n" \
"%%struct._IO_marker = type opaque\n" \
"%%struct._IO_codecvt = type opaque\n" \
"%%struct._IO_wide_data = type opaque\n" \
"\n" \
"@stderr = external dso_local global %%struct._IO_FILE*, align 8\n" \
"@.str.1 = private unnamed_addr constant [25 x i8] c\"please enter an integer\\0A\\00\", align 1\n" \
"@.str.2 = private unnamed_addr constant [3 x i8] c\"%%d\\00\", align 1\n" \
"@.str.3 = private unnamed_addr constant [6 x i8] c\"scanf\\00\", align 1\n" \
"@.str.4 = private unnamed_addr constant [24 x i8] c\"no matching characters\\0A\\00\", align 1\n" \
"\n" \
"declare i32* @__errno_location() #2\n" \
"declare i32 @__isoc99_scanf(i8*, ...) #1\n" \
"declare void @perror(i8*) #1\n" \
"declare void @exit(i32) #3\n" \
"declare i32 @fprintf(%%struct._IO_FILE*, i8*, ...) #1\n" \
"\n" \
"define i32 @read_integer() #0 {\n" \
"  %%1 = alloca i32, align 4\n" \
"  %%2 = alloca i32, align 4\n" \
"  %%3 = call i32* @__errno_location() #4\n" \
"  store i32 0, i32* %%3, align 4\n" \
"  %%4 = load %%struct._IO_FILE*, %%struct._IO_FILE** @stderr, align 8\n" \
"  %%5 = call i32 (%%struct._IO_FILE*, i8*, ...) @fprintf(%%struct._IO_FILE* %%4, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i32 0, i32 0))\n" \
"  %%6 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %%1)\n" \
"  store i32 %%6, i32* %%2, align 4\n" \
"  %%7 = load i32, i32* %%2, align 4\n" \
"  %%8 = icmp eq i32 %%7, 1\n" \
"  br i1 %%8, label %%9, label %%11\n" \
"\n" \
"; <label>:9:                                      ; preds = %%0\n" \
"  %%10 = load i32, i32* %%1, align 4\n" \
"  ret i32 %%10\n" \
"\n" \
"; <label>:11:                                     ; preds = %%0\n" \
"  %%12 = call i32* @__errno_location() #4\n" \
"  %%13 = load i32, i32* %%12, align 4\n" \
"  %%14 = icmp ne i32 %%13, 0\n" \
"  br i1 %%14, label %%15, label %%16\n" \
"\n" \
"; <label>:15:                                     ; preds = %%11\n" \
"  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))\n" \
"  call void @exit(i32 1) #5\n" \
"  unreachable\n" \
"\n" \
"; <label>:16:                                     ; preds = %%11\n" \
"  %%17 = load %%struct._IO_FILE*, %%struct._IO_FILE** @stderr, align 8\n" \
"  %%18 = call i32 (%%struct._IO_FILE*, i8*, ...) @fprintf(%%struct._IO_FILE* %%17, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.4, i32 0, i32 0))\n" \
"  call void @exit(i32 1) #5\n" \
"  unreachable\n" \
"}\n" \
"\n" \
"define i32 @main() #0 {\n"

#define EPILOGUE \
"  ret i32 0\n" \
"}\n"

#define PROJ4_PROLOGUE \
"target triple = \"x86_64-pc-linux-gnu\"\n" \
"\n" \
"declare i32 @printf(i8*, ...) #1\n" \
"@.str = private unnamed_addr constant [4 x i8] c\"%%d\\0A\\00\", align 1\n" \
"\n" \
"define void @print_integer(i32) #0 {\n" \
"  %%2 = alloca i32, align 4\n" \
"  store i32 %%0, i32* %%2, align 4\n" \
"  %%3 = load i32, i32* %%2, align 4\n" \
"  %%4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %%3)\n" \
"  ret void\n" \
"}\n" \
"\n" \
"%%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %%struct._IO_marker*, %%struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %%struct._IO_codecvt*, %%struct._IO_wide_data*, %%struct._IO_FILE*, i8*, i64, i32, [20 x i8] }\n" \
"%%struct._IO_marker = type opaque\n" \
"%%struct._IO_codecvt = type opaque\n" \
"%%struct._IO_wide_data = type opaque\n" \
"\n" \
"@stderr = external dso_local global %%struct._IO_FILE*, align 8\n" \
"@.str.1 = private unnamed_addr constant [25 x i8] c\"please enter an integer\\0A\\00\", align 1\n" \
"@.str.2 = private unnamed_addr constant [3 x i8] c\"%%d\\00\", align 1\n" \
"@.str.3 = private unnamed_addr constant [6 x i8] c\"scanf\\00\", align 1\n" \
"@.str.4 = private unnamed_addr constant [24 x i8] c\"no matching characters\\0A\\00\", align 1\n" \
"\n" \
"declare i32* @__errno_location() #2\n" \
"declare i32 @__isoc99_scanf(i8*, ...) #1\n" \
"declare void @perror(i8*) #1\n" \
"declare void @exit(i32) #3\n" \
"declare i32 @fprintf(%%struct._IO_FILE*, i8*, ...) #1\n" \
"\n" \
"define i32 @read_integer() #0 {\n" \
"  %%1 = alloca i32, align 4\n" \
"  %%2 = alloca i32, align 4\n" \
"  %%3 = call i32* @__errno_location() #4\n" \
"  store i32 0, i32* %%3, align 4\n" \
"  %%4 = load %%struct._IO_FILE*, %%struct._IO_FILE** @stderr, align 8\n" \
"  %%5 = call i32 (%%struct._IO_FILE*, i8*, ...) @fprintf(%%struct._IO_FILE* %%4, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i32 0, i32 0))\n" \
"  %%6 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32* %%1)\n" \
"  store i32 %%6, i32* %%2, align 4\n" \
"  %%7 = load i32, i32* %%2, align 4\n" \
"  %%8 = icmp eq i32 %%7, 1\n" \
"  br i1 %%8, label %%9, label %%11\n" \
"\n" \
"; <label>:9:                                      ; preds = %%0\n" \
"  %%10 = load i32, i32* %%1, align 4\n" \
"  ret i32 %%10\n" \
"\n" \
"; <label>:11:                                     ; preds = %%0\n" \
"  %%12 = call i32* @__errno_location() #4\n" \
"  %%13 = load i32, i32* %%12, align 4\n" \
"  %%14 = icmp ne i32 %%13, 0\n" \
"  br i1 %%14, label %%15, label %%16\n" \
"\n" \
"; <label>:15:                                     ; preds = %%11\n" \
"  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))\n" \
"  call void @exit(i32 1) #5\n" \
"  unreachable\n" \
"\n" \
"; <label>:16:                                     ; preds = %%11\n" \
"  %%17 = load %%struct._IO_FILE*, %%struct._IO_FILE** @stderr, align 8\n" \
"  %%18 = call i32 (%%struct._IO_FILE*, i8*, ...) @fprintf(%%struct._IO_FILE* %%17, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.4, i32 0, i32 0))\n" \
"  call void @exit(i32 1) #5\n" \
"  unreachable\n" \
"}\n" \
"\n"
