# Define name of the virtual env
VENV := venv

# default target, when make executed without arguments
all: venv

$(VENV)/bin/activate: requirements.txt
	python3 -m venv $(VENV)
	./$(VENV)/bin/pip install -r requirements.txt

# default target
venv: $(VENV)/bin/activate

# run depends on venv, when venv changes or requirements.txt changes, it will reexecute the graph
run: venv
	./$(VENV)/bin/python3 main.py

# clean depends on nothing. with clean we remove cache
clean:
	rm -rf $(VENV)
	find . -type f -name '*.pyc' -delete

.PHONY: all venv run clean
