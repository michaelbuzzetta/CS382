aarch64-linux-gnu-as $1.s -g -o $1.o
aarch64-linux-gnu-as $1_data.s -g -o $1_data.o
aarch64-linux-gnu-ld $1.o $1_data.o -o $1