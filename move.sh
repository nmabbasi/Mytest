#!/bin/bash

cd /media/nmabbasi/088E003F578AB9A2/MetaTrans_Results/BGI-diamond-result

for f in */3-MAP//m3-output/BGI/abundance/out.txt
do
cp -v "$f" /home/nmabbasi/New_Tools/Analysis_working_directory/Functional_Analysis/"${f//\//_}"

done













