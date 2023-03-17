#!/bin/bash

set -ex

FC=gfortran cmake -Bbuild
cmake --build build --parallel
python create_model.py --models_dir "../gpt2/models" --model_size "124M"
python encode_input.py \
    "Alan Turing theorized that computers would one day become very powerful, but even he could not imagine" \
    -n 20
build/gpt2
