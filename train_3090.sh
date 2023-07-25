#!/bin/bash

#SBATCH --job-name="sr-ulm"
#SBATCH --time=23:00:00

#SBATCH --mail-user=christopher.hahne@unibe.ch
#SBATCH --mail-type=none
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=32G
#SBATCH --qos=job_gpu_sznitman
#SBATCH --account=ws_00000
#SBATCH --partition=gpu-invest
#SBATCH --gres=gpu:rtx3090:1

module load Python/3.9.5-GCCcore-10.3.0
module load CUDA/11.8.0

source ~/20_sr-ulm/venv/bin/activate

#python3 -m pip install -r requirements.txt

#git clone --recurse-submodules git@github.com:hahnec/simple_tracker simple_tracker_repo
#python3 -m pip install -r simple_tracker_repo/requirements.txt
#ln -sf ./simple_tracker_repo/simple_tracker simple_tracker

python3 -c "import torch; print(torch.cuda.is_available())"

python3 ./train.py