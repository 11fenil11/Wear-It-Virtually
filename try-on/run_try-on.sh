#!/bin/bash
set -e

# Script to run the virtual try-on
# Assumes that the output from the human parsing is stored in ./VITON/data/segment/ and
# the output from the pose estimation, pose.pkl and the extracted keypoints, are stored in ./VITON/data/ and ./VITON/data/pose/, respectively.

if [ "$#" -ne 2 ]; then
    echo "ERROR: run_try-on.sh requires two inputs: absolute path to the person image and absolute path to the clothing image."
    exit
fi

# Set variables
person_img=$1
clothing_img=$2

printf "\nSET Vairables Done.....\n\n"
read

# Copy input images to appropriate directory
cp $person_img $clothing_img ./VITON/data/women_top/

printf "\nCopy  Done.....\n\n"
read

# Make list to run over
person_name=$(basename $person_img)
clothing_name=$(basename $clothing_img)
echo "$person_name $clothing_name" > ./VITON/data/viton_test_pairs.txt

printf "\nMaking list  Done.....\n\n"
read


# Move to project directory
cd VITON

printf "\nSET Directory to vition Done.....\n\n"
read

# Run coarse step, clothing warp, and refinement step
printf "\nRunning stage 1 ...\n\n"
./test_stage1.sh

printf "\nStage 1 Completed.....\n\n"
read

printf "\nStage1 completed\n\n"
printf "\nRunning shape warp ...\n\n"
octave shape_context_warp.m
printf "\nRunning shape war done ...\n\n"
read
printf "\nRunning stage 2 ...\n\n"
./test_stage2.sh

printf "\n Stage2 Completed...." 
read