.PHONY: all install

all: clean README.md

clean:
	rm -f README.md

README.md: README.sh
	./README.sh

install:
	install -m755 sysz /usr/local/bin/
