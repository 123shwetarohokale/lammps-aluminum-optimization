# lammps-aluminum-optimization
LAMMPS model to optimize aluminum structure size
This repository contains scripts and documentation for running molecular dynamics (MD) simulations of aluminum using LAMMPS.
The simulations investigate the mechanical and thermodynamic properties of single-crystal Al under uniaxial tensile deformation and thermal equilibration.

**Execution environment:**

This input script was run using the Aug 2015 version of LAMMPS.
CPU-based simulation (GPU required)
Runs on standard HPC cluster or local workstation

SLURM script: Changes in some commands may require revision of the input script.

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

**2.1 System Initialization Protocol**

Lattice: FCC Aluminum

Orientation: x[100], y[010], z[001]

Initial lattice constant: 4.0 Å

System size: 15 × 15 × 15 unit cells = 13,500 atoms

**2.2 Interatomic Potential**

Potential: Embedded Atom Method (EAM)

File: Al99.eam.alloy

Reference: Mishin et al. (1999)

LAMMPS settings:

pair_style eam/alloy

pair_coeff * * Al99.eam.alloy Al
