#!bin/bash
mkdir results
../../cd++ -m"Dengue2Seros.ma" -l"results/Dengue2Seros.log" -t00:06:00:000
cp results/Dengue2Seros.log01 ./Dengue2Seros.log
rm -r results