CC=clang 

# Best option
# $CC -fuse-ld=lld -Wno-error=implicit-function-declaration --target=riscv64 -march=rv64gc --sysroot=/home/zhong/Downloads/riscv/riscv64-unknown-elf --gcc-toolchain=/home/zhong/Downloads/riscv -O3 -Irv64 -Iposix -funroll-loops -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1  -lrt"\"  -DPERFORMANCE_RUN=1 core_list_join.c core_main.c core_matrix.c core_state.c core_util.c posix/core_portme.c -o ./coremark.exe -lrt
$CC --target=riscv64 -march=rv64gc --sysroot=/home/zhong/Downloads/riscv/riscv64-unknown-elf --gcc-toolchain=/home/zhong/Downloads/riscv -O3 -DPERFORMANCE_RUN=1 -fuse-ld=lld -I./riscv64 -I./riscv64-clang -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1 -fuse-ld=lld   "\" -DITERATIONS=0  core_list_join.c core_main.c core_matrix.c core_state.c core_util.c ./riscv64-clang/core_portme.c -o ./coremark.exe

OBJD=llvm-objdump 
$OBJD -S coremark.exe > coremark.exe.dis
# $OBJD -S coremark.exe_bak > coremark.exe_bak.dis
adb push coremark.exe /coremark/
adb shell /coremark/coremark.exe
