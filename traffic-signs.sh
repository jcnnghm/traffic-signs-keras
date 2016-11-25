#!/bin/bash
set -e


cd /work/car/traffic-signs
source activate venv
/root/anaconda3/envs/venv/bin/jupyter notebook --no-browser --ip=*
