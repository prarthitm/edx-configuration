
yml_files:=$(shell find . -name "*.yml")
json_files:=$(shell find . -name "*.json")

test: test.syntax test.edx_east_roles

test.syntax: test.syntax.yml test.syntax.json

test.syntax.yml: $(patsubst %,test.syntax.yml/%,$(yml_files))

test.syntax.yml/%:
	python -c "import sys,yaml; yaml.load(open(sys.argv[1]))" $* >/dev/null

test.syntax.json: $(patsubst %,test.syntax.json/%,$(json_files))

test.syntax.json/%:
	jsonlint -v $*

test.edx_east_roles:
	tests/test_edx_east_roles.sh

clean: test.clean

test.clean:
	rm -rf playbooks/edx-east/test_output
