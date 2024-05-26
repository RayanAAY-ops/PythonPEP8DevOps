### 3 types of tests:
    # function test
    # class based test


    2 main conviction:
    <function_name>_test # the most convenient
    test_<function_name> # not preferred


Pytest hide input and expected output by default --> use -s as argument

Pytest runs unittest TestLegacy as well

Tests are either in tree ( like this /tests), or out tree

git has a notion of git hooks, stored inside .git, to be executed before a commit happens

Basics of TOX:
- command runner
- encode the way you test your project
- when working on a library, you need to have a setup.py /setup.cfg
- has two sections:
    - [tox] : defines what it's globally available
        - keyword [envlist]: which env he can run like py36, py37, py38, py39, pypy3
    - [testenv]:
        list the commands you want to test your library
        - keyword [deps] : [-r]requirements-dev.txt
        - commands = commands to test your lib like pytest
            - [commands] : pytest {posargs:tests}

- it will setup your package/ install dependencies
- tox allows to test all your tests inside multiple environnments.
- virtualenvs are created inside .tox
- if you want to test against a specific environment and overwrite the envlist, just use $tox -e py38
- you can specify specficis tests like this:
    - tox -e py38 --tests -k fstring (fstring tests)
    - makefile :tracks files dependency graph and last modified timestamps of the files.

        -  avoid the "it worked on my machine" situation
        - to avoid running script2 then script1, because you need to run script1 before script2
        - can simply be used to manage a python virtual env and install required dependencies from "requirements.txt"
            -     .PHONY is a special target that marks other targets as phony. Phony targets are not actual files but names for a set of commands to run.
        This prevents make from being confused if there are files named all, venv, run, or clean in the directory.
        By declaring these targets as phony, make will always execute their associated commands when these targets are invoked.
Variables

    VENV := venv: Sets VENV to the directory name for the virtual environment.

Targets

    all: Default target that depends on venv.
    venv: Shortcut target to set up the virtual environment by ensuring $(VENV)/bin/activate is up-to-date.
    $(VENV)/bin/activate: Ensures the virtual environment is created and dependencies from requirements.txt are installed. This runs:


run: Depends on venv and runs the app.py script using the virtual environment's Python interpreter:


clean: Removes the virtual environment and all *.pyc files:


Phony Targets

    .PHONY: all venv run clean: Declares these targets as phony, ensuring make treats them as always out-of-date and always executes their commands.

Workflow

    Running make sets up the virtual environment (venv).
    Running make run sets up the virtual environment if needed and then runs app.py.
    Running make clean removes the virtual environment and cleans up bytecode files.
