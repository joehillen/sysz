# Maintainer: Joe Hillenbrand (joehillen) <joehillen@gmail.com>

pkgname=sysz
pkgver=1.4.0
pkgrel=0
pkgdesc="fzf terminal UI for systemctl"
arch=("any")
url="https://github.com/joehillen/sysz"
license=("UNLICENSE")
depends=("bash" "fzf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b800f80accfec6ffa8a00b57f28428a727819c4f1160a9fa0cdc1bb70e187c9d')

package() {
  install -Dm775 "$srcdir/$pkgname-$pkgver/sysz" "$pkgdir/usr/bin/sysz"
}
