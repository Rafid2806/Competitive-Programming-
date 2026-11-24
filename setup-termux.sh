#!/data/data/com.termux/files/usr/bin/bash
# One-time setup for competitive programming in Termux (Android).
# Run from inside this repo:   bash setup-termux.sh
set -e
repo="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing packages (clang = C/C++ compiler, git, editors)"
pkg update -y
pkg install -y clang make git micro neovim coreutils diffutils

echo "==> Installing <bits/stdc++.h> (Termux's libc++ doesn't ship one)"
mkdir -p "$PREFIX/include/bits"
cp "$repo/tools/include/bits/stdc++.h" "$PREFIX/include/bits/stdc++.h"

echo "==> Adding cprun / cpnew to PATH"
line="export PATH=\"$repo/tools:\$PATH\""
grep -qxF "$line" ~/.bashrc 2>/dev/null || echo "$line" >> ~/.bashrc

echo "==> Adding coding keys to the on-screen extra-keys row"
mkdir -p ~/.termux
if [ ! -f ~/.termux/termux.properties ] || ! grep -q '^extra-keys' ~/.termux/termux.properties; then
  cat >> ~/.termux/termux.properties <<'PROPS'
extra-keys = [['ESC','TAB','{','}','[',']','(',')',';','&','|'], \
              ['CTRL','ALT','<','>','=','"','HOME','UP','END','PGUP','/'], \
              ['SHIFT','#','!','+','-','*','LEFT','DOWN','RIGHT','PGDN','~']]
PROPS
  termux-reload-settings 2>/dev/null || true
fi

echo "==> Quick self-test"
tmp="$(mktemp -d)"
printf '#include <bits/stdc++.h>\nint main(){std::vector<int> v{3,1,2}; std::sort(v.begin(),v.end()); std::cout<<v[0]<<v[1]<<v[2]<<"\\n";}\n' > "$tmp/t.cpp"
clang++ -std=c++20 -O2 "$tmp/t.cpp" -o "$tmp/t" && [ "$("$tmp/t")" = 123 ] && echo "    compiler OK"
rm -rf "$tmp"

echo
echo "Done! Close and reopen Termux (or run: source ~/.bashrc), then try:"
echo "    cpnew A && micro A.cpp && cprun A.cpp"
