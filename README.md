## Bash Script for Setting Up Development Environment
This script automatically sets up development environment for new engineers that join Data Engineering team at Beejan Technology, a company that maintains several Python based data pipelines and engineering projects.

## What The Script Does
-- The script automatically:

--- Creates a python virtual environment
--- Upgrades Pip
--- Sets up .gitignore file
--- Installs Python Packages

## How To Execute
-- chmod +x setup.sh

-- ./setup.sh

## Challenges:
I had a challenge creating a function to add color code to messages for Error handling.
I tried calling a function inside a function but it wasn't adding up.

## Lesson learned:
I had to read about escape sequences, thanks to this task.
Learnt how to define and call log function and their types, for every message to be reported.
