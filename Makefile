.PHONY: all install clean

all: clean README.md VERSION PKGBUILD
	sed -i -e "s/^SYSZ_VERSION=.*/SYSZ_VERSION=`cat VERSION`/" sysz
	sed -i -e "s/^pkgver=.*/pkgver=`cat VERSION`/" PKGBUILD

clean:
	rm -f README.md

README.md: README.sh sysz VERSION
	./README.sh

install:
	install -m755 sysz /usr/local/bin/
