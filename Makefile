.PHONY: clean

clean:
	rm -rf build dist *.egg-info
	find . -name "__pycache__" -type d -exec rm -rf {} +

build: clean
	python setup.py check
	python setup.py sdist
	python setup.py bdist_wheel --universal

release-test:
	twine upload --repository testpypi dist/*

release:
	twine upload dist/*
