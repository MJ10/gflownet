module load python/3.9 cuda/11.7 openblas

cd $SLURM_TMPDIR
virtualenv env
source env/bin/activate

pip install --no-index --find-links ~/wheels/ ~/wheels/torch-1.13.0+cu117-cp39-cp39-linux_x86_64.whl
pip install --no-index --find-links ~/wheels/ ~/wheels/torch_scatter-2.0.9-cp39-cp39-linux_x86_64.whl
pip install --no-index --find-links ~/wheels/ ~/wheels/torch_sparse-0.6.15-cp39-cp39-linux_x86_64.whl
pip install --no-index --find-links ~/wheels/ ~/wheels/torch_cluster-1.6.0-cp39-cp39-linux_x86_64.whl
pip install --no-index --find-links ~/wheels/ torch-geometric botorch cvxopt tensorboard
cd ~/recursion/gflownet/
pip install --no-index --find-links ~/wheels/ -e .
export GFN_MODEL_PATH=/scratch/mjain/mol_gen/best_params.pkl.gz
export LD_LIBRARY_PATH=/cvmfs/soft.computecanada.ca/easybuild/software/2020/Core/cudacore/11.7.0/lib