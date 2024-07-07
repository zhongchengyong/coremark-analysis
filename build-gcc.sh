rm -rf coremark.exe
rm -rf coremark.exe.dis

GCC=/home/zhong/riscv/riscv/bin/riscv64-unknown-linux-gnu-gcc

# Best option with static, otherwise the library can't found on C906
# unroll-loops is critical
$GCC -O3 -funroll-loops -DPERFORMANCE_RUN=1 -static -Irv64 -Iposix  -I. -DFLAGS_STR=\""-O3 -funroll-loops -DPERFORMANCE_RUN=1 -static -lrt"\"   core_list_join.c core_main.c core_matrix.c core_state.c core_util.c posix/core_portme.c -lrt -o ./coremark.exe



OBJD=riscv64-unknown-linux-gnu-objdump


if [ -e coremark.exe ]
then 
    $OBJD -S coremark.exe > coremark.exe.dis
    $OBJD -S coremark.exe_bak > coremark.exe_bak.dis

    adb push coremark.exe /coremark/
    adb shell /coremark/coremark.exe
else
    echo "Compile failed"
fi
