# Maintainer: Joe Hillenbrand (joehillen) <joehillen@gmail.com>

pkgname=sysz
pkgver=1.2.0
pkgrel=0
pkgdesc="fzf terminal UI for systemctl"
arch=("any")
url="https://github.com/joehillen/sysz"
license=("UNLICENSE")
depends=("bash" "fzf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('147859ee1f9126f6768aef161a04f547ad1ea39d0c277759d4897b6403695223')

package() {
  install -Dm775 "$srcdir/$pkgname-$pkgver/sysz" "$pkgdir/usr/bin/sysz"
}
