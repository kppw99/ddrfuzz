#!/bin/bash

home=/targets/libpng
seed_home=$home/seed
bin=$home/bin/pngtest
opt='-m 100 -t 10000+'

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
LD_PRELOAD=$LIBRARY_PATH afl-fuzz $opt -i $input -o $output -- $bin @@ /dev/null
