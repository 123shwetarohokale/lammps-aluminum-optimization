# lammps-aluminum-optimization
LAMMPS model to optimize aluminum structure size
This repository contains scripts and documentation for running molecular dynamics (MD) simulations of aluminum using LAMMPS.
The simulations investigate the mechanical and thermodynamic properties of single-crystal Al under uniaxial tensile deformation and thermal equilibration.

**Execution environment:**

CPU-based simulation (GPU required)
Runs on standard HPC cluster or local workstation

SLURM script:  
#!/bin/bash
#SBATCH -p shortgpu #gpu-p100, shortgpu, shortgpu-p100, short, bsudfq, 
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=14
#SBATCH --gres=gpu:1 #(number of GPUs requested) #HOOMD & LAMMPS peeps, Gromacs peeps remove
#SBATCH -t 30:00
#SBATCH -o al.o%j
#SBATCH -J Aluminum
# #SBATCH --exclusive

module load lammps_gpu
export OMP_NUM_THREADS=14
mpirun -np 1 -npernode 14 lmp -sf gpu -pk gpu 1 -in in.nvt

**2.0 Software Environment Setup**

This input script was run using the Aug 2015 version of LAMMPS. Changes in some commands may require revision of the input script. To get the input file, you have a few options:
