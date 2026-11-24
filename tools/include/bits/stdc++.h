// bits/stdc++.h replacement for clang + libc++ (Termux on Android ships
// libc++, which has no <bits/stdc++.h>). Includes every standard header
// that the toolchain actually provides, so `#include <bits/stdc++.h>`
// works the same as it does on Codeforces / GCC.
#pragma once

// C headers
#include <cassert>
#include <cctype>
#include <cerrno>
#include <cfloat>
#include <climits>
#include <cmath>
#include <cstdarg>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <cinttypes>

// C++ headers
#include <algorithm>
#include <array>
#include <atomic>
#include <bitset>
#include <chrono>
#include <complex>
#include <deque>
#include <exception>
#include <fstream>
#include <functional>
#include <iomanip>
#include <ios>
#include <iosfwd>
#include <iostream>
#include <istream>
#include <iterator>
#include <limits>
#include <list>
#include <locale>
#include <map>
#include <memory>
#include <mutex>
#include <new>
#include <numeric>
#include <ostream>
#include <queue>
#include <random>
#include <ratio>
#include <set>
#include <sstream>
#include <stack>
#include <stdexcept>
#include <streambuf>
#include <string>
#include <thread>
#include <tuple>
#include <type_traits>
#include <typeinfo>
#include <unordered_map>
#include <unordered_set>
#include <utility>
#include <valarray>
#include <vector>

// Newer headers: only pulled in when the compiler/standard supports them.
#if __cplusplus >= 201703L
#  if __has_include(<optional>)
#    include <optional>
#  endif
#  if __has_include(<variant>)
#    include <variant>
#  endif
#  if __has_include(<string_view>)
#    include <string_view>
#  endif
#  if __has_include(<any>)
#    include <any>
#  endif
#endif
#if __cplusplus >= 202002L
#  if __has_include(<bit>)
#    include <bit>
#  endif
#  if __has_include(<numbers>)
#    include <numbers>
#  endif
#  if __has_include(<span>)
#    include <span>
#  endif
#  if __has_include(<ranges>)
#    include <ranges>
#  endif
#  if __has_include(<compare>)
#    include <compare>
#  endif
#endif
