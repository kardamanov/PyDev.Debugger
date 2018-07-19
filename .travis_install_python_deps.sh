#!/bin/bash
set -ev

source activate build_env
conda install --yes numpy ipython cython pytest psutil

if [ "$PYDEVD_PYTHON_VERSION" = "2.6" ]; then
    conda install --yes pyqt=4
    # Django 1.7 does not support Python 2.7
fi
if [ "$PYDEVD_PYTHON_VERSION" = "2.7" ]; then
    conda install --yes pyqt=4
    pip install "django>=1.7,<1.8"

fi
if [ "$PYDEVD_PYTHON_VERSION" = "3.5" ]; then
    conda install --yes pyqt=5
    pip install "django>=1.7,<1.8"
fi

pip install Pympler
# pytest-xdist not available on conda for python 2.6
pip install pytest-xdist
pip install untangle
pip install scapy==2.4.0