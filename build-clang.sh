rm -rf coremark.exe
rm -rf coremark.exe.dis

CC=clang 

# Best option
$CC -v -static -funroll-loops -march=rv64gc  -O3 -DPERFORMANCE_RUN=1 -Iriscv64 -Iposix -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1 -fuse-ld=lld  -funroll-loops "\" -DITERATIONS=0 core_list_join.c core_main.c core_matrix.c core_state.c core_util.c ./posix/core_portme.c -o ./coremark.exe

OBJD=llvm-objdump 
$OBJD -S coremark.exe > coremark.exe.dis
# $OBJD -S coremark.exe_bak > coremark.exe_bak.dis
if [ -e coremark.exe ]
then 
    adb push coremark.exe /coremark/
    adb shell /coremark/coremark.exe
else
    echo "Compile failed"
fi
