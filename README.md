# A-Hager-Zhang Riemannian Conjugate Gradient Method for Matrix Approximation

This repository provides a solver for **Manopt**, implementing the **A-Hager-Zhang Riemannian Conjugate Gradient Method for Matrix Approximation** by:

- Nasiru Salihu  
- Seyed Yaser Mousavi Siamakani  
- Auwal Bala Abubakar  
- Mohammed Saleh  

All numerical examples presented in the associated paper use this implementation. Our version is a modification of `manopt.solver.ConjugateGradient`.

---

# Manopt CG Experiments

This repository contains **MATLAB code** to reproduce experiments using **Conjugate Gradient (CG) methods on manifolds**, based on the **Manopt toolbox (GPL v3)**.

The experiments run multiple trials per example and generate performance figures using the **Dolan–Moré method**.

---
## Repository Structure
The repository is organized as follows:
/README.md <- This file, describing the repository
/LICENSE_GPLv3.txt <- Manopt GPL v3 license
/LICENSE_KMUTT.txt <- MATLAB experiment code license for this repository
/setup.m <- Adds Manopt and experiment scripts to the MATLAB path
/manopt/ <- Original Manopt toolbox (GPL v3)
/matlab_code/ <- MATLAB scripts for experiments, including modified CG and line search routines
example1.m <- Runs 100 trials for Example 2.1: Orthogonal Procrustes Problem
example2.m <- Runs 100 trials for Example 2.2: Rayleigh-Quotient Minimization
cg_modified.m <- Modified Conjugate Gradient solver
linesearch_modified.m <- Modified line search routine
/results/ <- Excel files storing trial results from experiments
/figures/ <- Generated Dolan–Moré plots visualizing performance


## Requirements

- MATLAB R202a (9.12.0.1884302)  
- **Manopt toolbox (GPL v3)**  
- Excel for storing trial results (optional, MATLAB can read/write Excel files)  

> No additional MATLAB toolboxes are required beyond Manopt.

---

## Running the Experiments
example1    % Runs 100 trials for Example 2.1: Orthogonal Procrustes Problem [28] 
example2    % Runs 100 trials for Example 2.2: Rayleigh-Quotient Minimization on the Unit Sphere [1]

### 1. Prepare MATLAB Environment
Run the setup script to add Manopt and your MATLAB code to the MATLAB path:

## License

- **Manopt Toolbox:** GPL v3 (`LICENSE_GPLv3.txt`)  
  - Copyright (C) 2009-2021 Nicolas Boumal
  - See <http://www.gnu.org/licenses/> for full license
- **MATLAB Experiment Code:** KMUTT License (`LICENSE_KMUTT.txt`)  
  - Copyright (c) 2026 [Your Name / Lab / KMUTT]  
  - For research and educational use only; redistribution requires permission 

