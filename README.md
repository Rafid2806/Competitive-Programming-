# Competitive-Programming-
Storing all of the solutions and lessons that I learned while solving problems.

This repo is also set up so I can **write, compile and test C/C++ solutions directly on my
Android tablet (Samsung Galaxy Tab S10 FE+)**, no laptop needed.

---

## Can you really do competitive programming on Android?

Yes. Android runs on a Linux kernel, and the **Termux** app gives you a real Linux terminal
with a real compiler (`clang`, the same compiler family that Codeforces, AtCoder etc. offer).
The Tab S10 FE+ has an 8-core ARM CPU, which is plenty for compiling and running CP solutions.

What's different from a laptop, and how this repo handles it:

| Problem on Android | Fix |
|---|---|
| No GCC, so `#include <bits/stdc++.h>` doesn't exist | `tools/include/bits/stdc++.h` gets installed for you |
| Typing `{ } [ ] ; < >` on the touch keyboard is slow | Extra-keys row added to Termux; a Bluetooth keyboard / Book Cover Keyboard is even better |
| Running sample tests by hand is tedious | `cprun A.cpp` compiles and checks every sample automatically |
| Apps can't run programs stored in `/sdcard` | `cprun` keeps compiled binaries in Termux's home folder |

---

## Setup (one time, about 5 minutes)

1. **Install Termux from F-Droid or GitHub**, *not* the Play Store.
   - F-Droid: https://f-droid.org/packages/com.termux/
   - or GitHub releases: https://github.com/termux/termux-app/releases (pick the `arm64-v8a` APK)
2. Open Termux and run:
   ```bash
   pkg install -y git
   git clone https://github.com/rafid2806/competitive-programming-.git cp
   cd cp
   bash setup-termux.sh
   ```
3. Close and reopen Termux. That's it.

`setup-termux.sh` installs `clang`, `git`, the `micro` and `neovim` editors, the
`bits/stdc++.h` header, adds `cprun`/`cpnew` to your PATH, and adds an extra key row
(`{ } [ ] ( ) ; < > =` and arrows) above the keyboard.

---

## Daily workflow

```bash
cd ~/cp/solutions
cpnew cf/2050/A          # creates A.cpp from the template + empty A.in / A.out
micro cf/2050/A.cpp      # write your code (Ctrl+S save, Ctrl+Q quit)
# paste the sample input into A.in and the sample output into A.out
cprun cf/2050/A.cpp      # compile + run all samples
```

Example output:
```
compiling A.cpp...
OK A.in (6 ms)
WRONG ANSWER A2.in (6 ms)
  --- input ---      ...
  --- expected ---   ...
  --- yours ---      ...
1 / 2 passed
```

`cprun` options:

| Command | What it does |
|---|---|
| `cprun A.cpp` | Compile (only if changed), then run `A.in`, `A1.in`, `A2.in`... and compare with `.out`/`.ans` |
| `cprun A.cpp -i` | Run interactively: type input, end with `Ctrl+D` |
| `cprun A.cpp -s` | Debug build with sanitizers. Catches out-of-bounds `vector` access, overflow and UB |
| `TL=2 cprun A.cpp` | Set a time limit in seconds (default 5) |
| `cprun B.c` | Plain C works too (`cpnew B c`) |

Compiled with `-std=c++20 -O2 -DLOCAL -Wall -Wextra -Wshadow`, so the template's `dbg(x)`
only prints locally, never on the judge.

Save your solutions to GitHub:
```bash
git add -A && git commit -m "CF 2050 A" && git push
```
(For pushing, set up a GitHub personal access token or `pkg install gh && gh auth login`.)

---

## Better editors (optional)

The terminal editor `micro` is easy to use (mouse/touch support, normal shortcuts), but if you want
a nicer touch UI:

- **Acode** (Play Store / F-Droid): a full code editor for Android with syntax highlighting and tabs.
  Keep the repo somewhere Acode can open it (run `termux-setup-storage`, then clone into
  `~/storage/shared/cp`), edit in Acode, and switch to Termux to run `cprun`.
  That works because `cprun` keeps its binaries out of shared storage.
- **VS Code in the browser (code-server)**: the real VS Code UI running locally on the tablet:
  ```bash
  pkg install tur-repo && pkg install code-server
  code-server --auth none        # then open http://localhost:8080 in Chrome/Samsung Internet
  ```
  Use split screen: browser on one side, problem statement on the other.

## Tablet tips

- **Samsung DeX** + a Bluetooth keyboard (or the Book Cover Keyboard) gives you a desktop-like setup
  with resizable windows: Termux/Acode on one side, Codeforces on the other.
- Pinch to zoom in Termux to change the font size.
- In Termux, swipe in from the left edge to open more terminal sessions (one for editing, one for running).
- Volume-Down acts as `Ctrl` in Termux (`Vol-Down + C` = Ctrl+C to stop a stuck program).

## Alternatives if you don't want Termux

- **Cxxdroid** (Play Store): an all-in-one C/C++ IDE app. Easiest to start with, but no test
  automation and some features need payment.
- **Online**: Codeforces "Custom Invocation", ideone.com, godbolt.org. They work in any browser
  but need internet and are slower to iterate with.

---

## Repo layout

```
setup-termux.sh            one-time Termux setup
tools/cprun                compile + test runner
tools/cpnew                create a new problem from the template
tools/include/bits/stdc++.h  <bits/stdc++.h> for clang/libc++
templates/template.cpp     C++ template (fast IO, dbg macro, multi-testcase)
templates/template.c       C template
solutions/                 my solutions go here (e.g. solutions/cf/2050/A.cpp)
```
