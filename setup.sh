#!/bin/bash

#Combination of multi safety flags
# -e  - exit on error
# -u  - undefined variables cause error
# -o pipefail - fail if any command in a pipeline fails

set -euo pipefail


#Create a log file and a log function to log all info,error messages of script- setup.sh

LOG_FILE="setup.log"
log() {
    echo "- $1" | tee -a "$LOG_FILE"

    }

log_info() {
    log "[INFO] -$(date)- $1"
    }

log_error() {
    log "[ERROR] - $(date)- $1"
    }

log_warning()  {
    log "[WARNING] -$(date)- $1"
    }


#This is the path for the users current working directory, the $1:- there passes the first argument the user would input as the current directory or it would be default which is :pwd
PROJECT_DIR="${1:-$(pwd)}"

#We are creating a function that checks for an existing python environment, activate if it exists. Create and activate, if it does not exist.
virtual_env() {
    #Define the path the env will be created, we use; "{$1:-(pwd)}, it creates the venv if a path is specified by the user or it uses - pwd of the user
    VENV_DIR="$PROJECT_DIR/venv"

    if [ -d "$VENV_DIR" ]; then

        log_info "Python environment exists, activating immediately"
    source "$VENV_DIR/bin/activate" || source "$VENV_DIR/scripts/activate"
    else
        log_info "Python virtual environment does not exist... Creating one now"
    python3 -m venv "$VENV_DIR" && source "$VENV_DIR/bin/activate"
    log_info "Python virtual Environment created and activated sucessfully" 
    fi
    }



#Install the latest version of pip in the environment"

pip_install() {

   pip install --upgrade pip || python3 pip install --upgrade pip

        log_info "The latest version of pip"
    }



#Check if .gitignore exists and create one if it does not exist
git_ignore() {
    IGNORE_F="$PROJECT_DIR/.gitignore"

    if [ ! -f "$IGNORE_F" ]; then

        log_warning "File does not exist, creating one now"
        touch .gitignore
#We use the multi-inline command to put files in gitignore file
        cat > "$IGNORE_F" <<EOF

# Byte-compiled / optimized / DLL files
__pycache__/
*.py.class

# Environments
.env
.envrc
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

EOF

        log_info "Git ignore file created successfully, contains all standard ignore rules for python."

    else
        log_warning ".gitignore file already exist, skipping creation."
    fi
    }


#Install python package - pandas
install_pandas() {
    if pip list | grep -q pandas; then
        log_info "Pandas is installed"
    else
        log_warning "Pandas is not installed, Installing pandas now"
         pip install pandas
        log_info "Pandas installation complete"
    fi
    }

#install requests package -

install_requests() {

    if pip list | grep -q requests; then

        log_info "Requests package already installed"
    else
        log_warning "Requests package not found, installing one now"
        pip install requests

        log_info "Requests Package successfully Installed"
    fi
    }


set_up() {

    virtual_env
    pip_install
    git_ignore
    install_pandas
    install_requests

log_info "Environment Ready- SET UP DONE"

    }

set_up






















































k
