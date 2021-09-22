#!bin/bash
mkdir results
../../cd++ -m"basic_dengue.ma" -l"results/basic_dengue.log" -t00:06:00:000
cp results/basic_dengue.log01 ./basic_dengue.log
rm -r results