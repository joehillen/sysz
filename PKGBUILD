# Maintainer: Joe Hillenbrand (joehillen) <joehillen@gmail.com>

pkgname=sysz
pkgver=1.0.0
pkgrel=1
pkgdesc="A fzf interface terminal UI for systemctl"
arch=("any")
url="https://github.com/joehillen/sysz"
license=("UNLICENSE")
depends=("bash" "fzf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('79d4d8679e8f7c5f1c0ea0bb9409a411fad77fb88946e9bad23e7b6b80f9ac87')

package() {
  install -Dm775 "$srcdir/$pkgname-$pkgver/sysz" "$pkgdir/usr/bin/sysz"
}
