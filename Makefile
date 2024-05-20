#!/bin/bash
.PHONY: init setup poetry_init clean

# Runs all setup steps and then starts a virtual env
init: setup poetry_init
	poetry shell

# Sets up the folder structure in case these exist yet. 
setup: 
	mkdir -p data outputs notebooks

# Uses Poetry to install those packages.
poetry_init: 
	poetry install

# Warning: running this will permanently delete your outputs folder.
# Anything not reproducible in this folder will be lost.
clean: 
	rm -rf outputs/*
	PYDEVD_DISABLE_FILE_VALIDATION=1 poetry run nbexec cleaning_notebooks/

analysis:
	PYDEVD_DISABLE_FILE_VALIDATION=1 poetry run nbexec notebooks/

### optional reproduce command ###
### this will execute all iPython notebooks in alpha-numeric order
reproduce: clean analysis
