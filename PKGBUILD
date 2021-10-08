# Maintainer: Joe Hillenbrand (joehillen) <joehillen@gmail.com>

pkgname=sysz
pkgver=1.4.1
pkgrel=0
pkgdesc="fzf terminal UI for systemctl"
arch=("any")
url="https://github.com/joehillen/sysz"
license=("UNLICENSE")
depends=("bash" "fzf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e8bc9d9764df63b9f1680b60895d929586d7b5cff84c0a5c2a5448f9be69e535')

package() {
  install -Dm775 "$srcdir/$pkgname-$pkgver/sysz" "$pkgdir/usr/bin/sysz"
}
