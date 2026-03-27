#--------------------------------------------------
# Project:
# Purpose:
#--------------------------------------------------

.PHONY: all run test

all: run

run:
	@racket main.rkt

test:
	@raco test main.rkt

