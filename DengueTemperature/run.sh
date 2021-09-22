#!bin/bash
mkdir results
../../cd++ -m"Dengue2SerosTemp.ma" -l"results/Dengue2SerosTemp.log" -t00:06:00:000
cp results/Dengue2SerosTemp.log01 ./Dengue2SerosTemp.log
rm -r results