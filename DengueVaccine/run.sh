#!bin/bash
mkdir results
../../cd++ -m"Dengue2SerosTempVaccine.ma" -l"results/Dengue2SerosTempVaccine.log" -t00:06:00:000
cp results/Dengue2SerosTempVaccine.log01 ./Dengue2SerosTempVaccine.log
rm -r results