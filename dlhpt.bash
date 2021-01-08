#!/bin/bash

####################### BSUB Headers #########################
#BSUB -P bip198
#BSUB -W 0:10
#BSUB -nnodes 1
#BSUB -q batch
#BSUB -J train_mnist_model_with_pl
#BSUB -o /gpfs/alpine/scratch/acmwhb/bip198/Repositories/Personal_Repositories/deep-learning-hpc-project-template/job%J.out
#BSUB -e /gpfs/alpine/scratch/acmwhb/bip198/Repositories/Personal_Repositories/deep-learning-hpc-project-template/job%J.out
###############################################################

# Remote project path
export PROJDIR=$MEMBERWORK/bip198/Repositories/Personal_Repositories/deep-learning-hpc-project-template

# Configure Conda for BSUB script environment
eval "$(conda shell.bash hook)"

# Remote Conda environment
conda activate "$PROJDIR"/venv

# Run training script
horovodrun -np 2 python3 "$PROJDIR"/project/lit_image_classifier.py
