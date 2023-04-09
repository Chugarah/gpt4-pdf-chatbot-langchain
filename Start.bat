@echo off

echo Creating Conda environment...
conda env create -f environment-win.yaml

echo Activating Conda environment...
call conda activate Oracle-Demo-1

echo Done!
