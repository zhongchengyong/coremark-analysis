rm -rf coremark.exe
rm -rf coremark.exe.dis

GCC=/home/zhong/study/Riscv_boards/tina-d1-h/prebuilt/gcc/linux-x86/riscv/toolchain-thead-glibc/riscv64-glibc-gcc-thead_20200702/bin/riscv64-unknown-linux-gnu-gcc

# Best option
# $GCC -O3 -funroll-loops -DPERFORMANCE_RUN=1 -Irv64 -Iposix  -I. -DFLAGS_STR=\""-O3 -funroll-loops -DPERFORMANCE_RUN=1  -lrt"\"   core_list_join.c core_main.c core_matrix.c core_state.c core_util.c posix/core_portme.c -lrt -o ./coremark.exe

# Best option with static
$GCC -O3 -funroll-loops -DPERFORMANCE_RUN=1 -static -Irv64 -Iposix  -I. -DFLAGS_STR=\""-O3 -funroll-loops -DPERFORMANCE_RUN=1 -static -lrt"\"   core_list_join.c core_main.c core_matrix.c core_state.c core_util.c posix/core_portme.c -lrt -o ./coremark.exe


# Score 3.1, without unroll-loops
# $GCC -O3 -Irv64 -Iposix  -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1  -lrt"\"  -DPERFORMANCE_RUN=1 core_list_join.c core_main.c core_matrix.c core_state.c core_util.c posix/core_portme.c -o ./coremark.exe -lrt -DITERATIONS=60000


if [ -e coremark.exe ]
then 
    OBJD=/home/zhong/study/Riscv_boards/tina-d1-h/prebuilt/gcc/linux-x86/riscv/toolchain-thead-glibc/riscv64-glibc-gcc-thead_20200702/bin/riscv64-unknown-linux-gnu-objdump
    $OBJD -S coremark.exe > coremark.exe.dis
    $OBJD -S coremark.exe_bak > coremark.exe_bak.dis
    adb push coremark.exe /coremark/
    adb shell /coremark/coremark.exe
else
    echo "Compile failed"
fi
