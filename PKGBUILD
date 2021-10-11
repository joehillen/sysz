# Maintainer: Joe Hillenbrand (joehillen) <joehillen@gmail.com>

pkgname=sysz
pkgver=1.4.2
pkgrel=0
pkgdesc="fzf terminal UI for systemctl"
arch=("any")
url="https://github.com/joehillen/sysz"
license=("UNLICENSE")
depends=("bash" "fzf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c9ec63e631b98ad5263447247c6d508ebe519963a028d69aefc6423fad60a9f6')

package() {
  install -Dm775 "$srcdir/$pkgname-$pkgver/sysz" "$pkgdir/usr/bin/sysz"
}
