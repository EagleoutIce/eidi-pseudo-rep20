.PHONY: all docker

all:
	latexmk

docker:
	docker build --pull --tag 'eidi-pseudo-rep-make' --file 'Dockerfile' .