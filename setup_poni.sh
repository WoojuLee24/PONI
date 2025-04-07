#!/bin/bash

echo "Setting up PONI environment..."

# Set PONI root directory
echo 'export PONI_ROOT=/ws/external' >> ~/.bashrc

# Add habitat_sim library to LD_LIBRARY_PATH
echo 'export LD_LIBRARY_PATH=/opt/conda/envs/poni/lib/python3.8/site-packages/habitat_sim-0.2.1-py3.8-linux-x86_64.egg/habitat_sim/_ext:$LD_LIBRARY_PATH' >> ~/.bashrc

# Add Conda libraries to LD_LIBRARY_PATH
echo 'export LD_LIBRARY_PATH=/opt/conda/envs/poni/lib:$LD_LIBRARY_PATH' >> ~/.bashrc

# Reload bashrc to apply changes
source ~/.bashrc

# Install required Conda package
echo "Installing libstdcxx-ng from conda-forge..."
conda install -c conda-forge libstdcxx-ng -y

# Restart shell
exec bash

echo "PONI environment setup complete!"
