@echo off

echo Deactivating Conda environment...
call conda deactivate

echo Removing Conda environment...
call conda env remove -n Oracle-Demo-1

echo Done!
