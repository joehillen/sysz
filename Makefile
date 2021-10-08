VERSION := $(shell cat VERSION)
ARCHIVE := sysz-$(VERSION).tar.gz
.PHONY: all install clean release

all: clean README.md VERSION PKGBUILD
	sed -i -e "s/^SYSZ_VERSION=.*/SYSZ_VERSION=$(VERSION)/" sysz
	sed -i -e "s/^pkgver=.*/pkgver=$(VERSION)/" PKGBUILD

release: all
	git commit -am 'Release $(VERSION)'
	git tag $(VERSION)
	git push origin $(VERSION)
	git archive --format=tar.gz -o $(ARCHIVE) --prefix sysz-$(VERSION)/ HEAD
	sed -i -e "s/^sha256sum=.*/sha256sum=('$(shell sha256sum $(ARCHIVE))')/" PKGBUILD
	makepkg
	git commit -am 'Update PKGBUILD'
	git push orgin master


clean:
	/bin/rm -f README.md

README.md: README.sh sysz VERSION
	./README.sh

install:
	install -m755 sysz /usr/local/bin/
