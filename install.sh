#!/bin/sh
# Installs bober's newest build: $PREFIX/share/bober, linked as $PREFIX/bin/bober. PREFIX defaults to ~/.local.
# In braces, so that a download cut short runs none of it.
{
set -eu
case "$(uname -sm)" in
"Linux x86_64") p=Linux-X64 ;;
"Linux aarch64") p=Linux-ARM64 ;;
"Darwin arm64") p=macOS-ARM64 ;;
*) echo "bober: no package for $(uname -sm); there are Linux x86-64, Linux arm64 and macOS arm64" >&2; exit 1 ;;
esac
PREFIX=${PREFIX:-$HOME/.local}
mkdir -p "$PREFIX/share" "$PREFIX/bin"
t=$(mktemp -d "$PREFIX/share/bober.XXXXXX")
trap 'rm -rf "$t"' EXIT
curl -fsSL "https://github.com/bober-lang/bober/releases/download/edge/bober-$p.tar.gz" | tar -xzf - -C "$t"
test -x "$t/bober/bin/bober"
rm -rf "$PREFIX/share/bober"
mv "$t/bober" "$PREFIX/share/bober"
ln -sf ../share/bober/bin/bober "$PREFIX/bin/bober"
echo "installed $PREFIX/bin/bober"
case ":$PATH:" in *":$PREFIX/bin:"*) ;; *) echo "add $PREFIX/bin to PATH: export PATH=\"$PREFIX/bin:\$PATH\"" ;; esac
}
