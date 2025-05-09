#!/bin/bash
#SBATCH --partition=shortgpu   # other options may include 'gpu', 'standard', etc.
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=14
#SBATCH --gres=gpu:1
#SBATCH --time=00:30:00
#SBATCH --job-name=Aluminum
#SBATCH --output=aluminum_output_%j.txt

# Load LAMMPS with GPU support module
module purge
module load lammps/2023.02.22-cuda   # Replace with actual module name on Borah

# Set OpenMP threads
export OMP_NUM_THREADS=14

# Run LAMMPS with GPU acceleration
mpirun -np 1 lmp -sf gpu -pk gpu 1 -in in.tensile.nvt -var latconst 4.05
