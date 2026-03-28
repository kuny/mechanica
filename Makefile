#--------------------------------------------------
# Project:
# Purpose:
#--------------------------------------------------

.PHONY: all run test

all: main nn

main:
	racket main.rkt

nn:
	racket nn.rkt

test:
	raco test main.rkt
	raco test nn.rkt

