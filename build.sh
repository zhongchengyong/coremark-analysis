# GCC=/home/zhong/study/Riscv_boards/tina-d1-h/prebuilt/gcc/linux-x86/riscv/toolchain-thead-glibc/riscv64-glibc-gcc-thead_20200702/bin/riscv64-unknown-linux-gnu-gcc
GCC=/home/zhong/study/Riscv_boards/tina-d1-h/lichee/brandy-2.0/tools/toolchain/riscv64-linux-x86_64-20200528/bin/riscv64-unknown-linux-gnu-gcc
$GCC -O3 -Irv64 -Iposix -I. -DFLAGS_STR=\""-O3 -DPERFORMANCE_RUN=1  -lrt"\"  -DPERFORMANCE_RUN=1 core_list_join.c core_main.c core_matrix.c core_state.c core_util.c posix/core_portme.c -o ./coremark.exe -lrt -DITERATIONS=60000
