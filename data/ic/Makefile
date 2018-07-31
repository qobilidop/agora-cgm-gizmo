.PHONY: all

all: 1e12q.dat

%.dat: %.conf
	mkdir -p $*
	cd $* && MUSIC ../$<
	mv $*/$@ .
	rm -rf $*
