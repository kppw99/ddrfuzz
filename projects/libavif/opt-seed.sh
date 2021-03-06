#!/bin/bash

home=/targets/libavif
seed_home=$home/seed
bin=$home/bin/avif_example_decode_file
opt='-m 1000 -t 10000+'

origin_dir=$seed_home/org
copt_dir=$seed_home/copt
topt_dir=$seed_home/topt

if [ -z ${1} ] || [ ${1} == 'cmin' ]; then

	rm -rf $copt_dir
	afl-cmin $opt -i $origin_dir -o $copt_dir -- $bin -w /dev/null @@

	if [ -z $1 ]; then
		for input in $copt_dir/*
		do
			filename=$(basename $input)
			output=$topt_dir/$filename

			rm -rf $output
			afl-tmin $opt -i $input -o $output -- $bin -w /dev/null @@
		done
	fi
elif [ $1 == 'tmin' ]; then
	for input in $origin_dir/*
	do
		filename=$(basename $input)
		output=$topt_dir/$filename

		rm -rf $output
		afl-tmin $opt -i $input -o $output -- $bin -w /dev/null @@
	done
else
	echo ''
	echo './opt-seed.sh {options}'
	echo ''
	echo 'Required options:'
	echo '  - cmin		: afl-cmin only'
	echo '  - tmin		: afl-tmin only'
	echo '  - default(null)	: afl-cmin + afl-tmin'
	echo ''
	exit 100
fi
