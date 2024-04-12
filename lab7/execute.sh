#!/bin/bash
export PATH=/export/thishost/riscv/bin:$PATH
while getopts i:o:b: flag
do
	case "${flag}" in
         i) first=${OPTARG};;
			   o) second=${OPTARG};;
			   b) third=${OPTARG};;
	esac
done
riscv64-unknown-elf-as $first  -march=rv32imac -o $second
riscv64-unknown-elf-objdump -D $second > $third
python3 converter.py --file $third
