VERSION := $(shell cat VERSION)
ARCHIVE := sysz-$(VERSION).tar.gz
.PHONY: all install clean release

sysz: VERSION CHANGELOG.md
	sed -i -e "s/^SYSZ_VERSION=.*/SYSZ_VERSION=$(VERSION)/" sysz

$(ARCHIVE): VERSION CHANGELOG.md
	git archive --format=tar.gz -o $(ARCHIVE) --prefix sysz-$(VERSION)/ HEAD

PKGBUILD: VERSION $(ARCHIVE)
	sed -i -e "s/^sha256sums=.*/sha256sums=('`sha256sum $(ARCHIVE) | cut -d' ' -f1`')/" PKGBUILD
	makepkg -f
	git commit -am 'Update PKGBUILD'
	git push origin master
	cp PKGBUILD ~/src/aur/sysz/PKGBUILD
	cd ~/src/aur/sysz/
	makepkg -ci
	git commit -am "Release $(VERSION)"
	git push origin master

all: clean sysz $(ARCHIVE)

release: all
	git commit -am 'Release $(VERSION)'
	git tag $(VERSION)
	git push origin $(VERSION)

clean:
	/bin/rm -f README.md

README.md: README.sh sysz VERSION
	./README.sh

install:
	install -m755 sysz /usr/local/bin/
