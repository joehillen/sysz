VERSION := $(shell cat VERSION)
ARCHIVE := sysz-$(VERSION).tar.gz
.PHONY: install clean release archive
.ONESHELL: aur-release

sysz: VERSION
	sed -i -e "s/^SYSZ_VERSION=.*/SYSZ_VERSION=$(VERSION)/" sysz

$(ARCHIVE): sysz CHANGELOG.md README.md
	git archive --format=tar.gz -o $(ARCHIVE) --prefix sysz-$(VERSION)/ $(VERSION)

clean:
	/bin/rm -f README.md

README.md: README.sh sysz VERSION
	./README.sh

archive: $(ARCHIVE)

PKGBUILD: VERSION $(ARCHIVE)
	sed -i -e "s/^pkgver=.*/pkgver=$(VERSION)/" PKGBUILD
	sed -i -e "s/^sha256sums=.*/sha256sums=('`sha256sum $(ARCHIVE) | cut -d' ' -f1`')/" PKGBUILD
	makepkg -f

aur-release: PKGBUILD
	git commit -am 'Update PKGBUILD'
	git push origin master
	cp PKGBUILD ~/src/aur/sysz/PKGBUILD
	cd ~/src/aur/sysz/
	makepkg -ci
	git commit -am "Release $(VERSION)"
	git push origin master

github-release: VERSION sysz CHANGELOG.md README.md
	git commit -am 'Release $(VERSION)'
	git tag $(VERSION)
	git push origin $(VERSION)

release: clean sysz README.md github-release


install:
	install -m755 sysz /usr/local/bin/
