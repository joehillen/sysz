.PHONY: all install clean

all: clean README.md

clean:
	rm -f README.md

README.md: README.sh sysz VERSION
	./README.sh

install:
	install -m755 sysz /usr/local/bin/
