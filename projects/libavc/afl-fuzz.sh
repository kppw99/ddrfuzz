#!/bin/bash

home=/targets/libavc
seed_home=$home/seed
bin=$home/bin/avcdec
opt='-m 1000 -t 10000+'

origin_dir=$seed_home/org
copt_dir=$seed_home/copt
topt_dir=$seed_home/topt

if [ -z $1 ]; then
	input=$origin_dir
elif [ $1 == 'cmin' ]; then
	input=$copt_dir
elif [ $1 == 'tmin' ]; then
	input=$topt_dir
else
	echo ''
	echo './afl-fuzz.sh {input_seed}'
	echo ''
	echo 'Required input seed:'
	echo '  - cmin		: cmin directory'
	echo '  - tmin		: tmin directory'
	echo '  - default(null)	: origin directory'
	echo ''
	exit 100
fi

output=$home/output
rm -rf $output
echo core >/proc/sys/kernel/core_pattern
afl-fuzz $opt -i $input -o $output $bin --input @@