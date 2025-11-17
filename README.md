## Bash Script for Setting Up Development Environment
This script automatically sets up development environment for new engineers that join Data Engineering team at Beejan Technology, a company that maintains several Python based data pipelines and engineering projects.

## What the Script Does

The script automatically:

Creates a Python virtual environment

Upgrades pip to the latest version

Sets up a .gitignore file with standard Python ignores

Installs essential Python packages (e.g., pandas, requests)

## How to Execute

Make the script executable:

chmod +x setup.sh


## Run the script:

./setup.sh 

## Challenges

I faced a challenge creating a function to add color codes to messages for error handling(It was just adding up)

## Lesson Learned

Learned about escape sequences for colored terminal output.

Learned how to define and call log functions with different types (INFO, SUCCESS, WARNING, ERROR) so every message is properly reported.
