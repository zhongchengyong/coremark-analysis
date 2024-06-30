GCC=/home/zhong/study/Riscv_boards/tina-d1-h/prebuilt/gcc/linux-x86/riscv/toolchain-thead-glibc/riscv64-glibc-gcc-thead_20200702/bin/riscv64-unknown-linux-gnu-gcc
# GCC=clang --target=riscv64 -march=rv64gc --sysroot=/home/zhong/Downloads/riscv/riscv64-unknown-elf --gcc-toolchain=/home/zhong/Downloads/riscv

# GCC=/home/zhong/study/Riscv_boards/tina-d1-h/lichee/brandy-2.0/tools/toolchain/riscv64-linux-x86_64-20200528/bin/riscv64-unknown-linux-gnu-gcc

# Best option
$GCC -O3 -Irv64 -Iposix -funroll-loops -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1  -lrt"\"  -DPERFORMANCE_RUN=1 core_list_join.c core_main.c core_matrix.c core_state.c core_util.c posix/core_portme.c -o ./coremark.exe -lrt -DITERATIONS=60000

# Best option with static
# $GCC -static -O3 -Irv64 -Iposix -funroll-loops -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1  -lrt"\"  -DPERFORMANCE_RUN=1 core_list_join.c core_main.c core_matrix.c core_state.c core_util.c posix/core_portme.c -o ./coremark.exe -lrt -DITERATIONS=60000


# Score 3.1, without unroll-loops
# $GCC -O3 -Irv64 -Iposix  -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1  -lrt"\"  -DPERFORMANCE_RUN=1 core_list_join.c core_main.c core_matrix.c core_state.c core_util.c posix/core_portme.c -o ./coremark.exe -lrt -DITERATIONS=60000

OBJD=/home/zhong/study/Riscv_boards/tina-d1-h/prebuilt/gcc/linux-x86/riscv/toolchain-thead-glibc/riscv64-glibc-gcc-thead_20200702/bin/riscv64-unknown-linux-gnu-objdump
$OBJD -S coremark.exe > coremark.exe.dis
$OBJD -S coremark.exe_bak > coremark.exe_bak.dis
# adb push coremark.exe /coremark/
# adb shell /coremark/coremark.exe
