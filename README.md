# 🏛️ CSAPP Labs — Personal Implementation

> **Bits, bombs, buffers, caches, shells, and more — the full CS:APP gauntlet, one lab at a time.** 🧗‍♂️

This repository contains my personal implementations of the labs for
[*Computer Systems: A Programmer's Perspective (3rd Edition)*](https://csapp.cs.cmu.edu/3e/labs.html).
The labs cover the core pillars of computer systems: data representation, machine-level programming,
processor architecture, memory hierarchy, linking, exceptional control flow, virtual memory, and
networking. Each lab lives in its own directory with its own write-up and solutions. ✨

---

## 🗂️ Lab Contents

| Lab | Summary | Progress |
| --- | --- | --- |
| [Data Lab] | Bit-level manipulations and integer/floating-point representation puzzles. | ✅ |
| [Bomb Lab] | Defuse a binary bomb by reverse-engineering x86-64 assembly. | 👨🏻‍💻 |
| [Attack Lab] | Code injection and return-oriented programming (ROP) attacks. | ✅ |
| [Architecture Lab] | Design and optimize a pipelined Y86-64 processor. | ✅ |
| [Cache Lab] | Write a cache simulator and optimize matrix transpose for cache performance. | 😴 |
| [Performance Lab] | Optimize image processing kernels (rotate, smooth). | 😴 |
| [Shell Lab] | Write a simple Unix shell with job control. | 😴 |
| [Malloc Lab] | Implement a dynamic memory allocator (malloc, free, realloc). | 😴 |
| [Proxy Lab] | Write a concurrent web proxy with caching. | 😴 |

[Data Lab]: https://csapp.cs.cmu.edu/3e/datalab.pdf
[Bomb Lab]: https://csapp.cs.cmu.edu/3e/bomblab.pdf
[Attack Lab]: https://csapp.cs.cmu.edu/3e/attacklab.pdf
[Architecture Lab]: https://csapp.cs.cmu.edu/3e/archlab.pdf
[Cache Lab]: https://csapp.cs.cmu.edu/3e/cachelab.pdf
[Performance Lab]: https://csapp.cs.cmu.edu/3e/perflab.pdf
[Shell Lab]: https://csapp.cs.cmu.edu/3e/shlab.pdf
[Malloc Lab]: https://csapp.cs.cmu.edu/3e/malloclab.pdf
[Proxy Lab]: https://csapp.cs.cmu.edu/3e/proxylab.pdf

---

## 🐳 Docker Environment

This repository provides a Docker-based development environment to ensure consistent tooling
across platforms. The image is based on **Ubuntu 20.04 (amd64)** and includes:

| What | What's inside |
| --- | --- |
| 🛠️ Build toolchain | `gcc-multilib`, `g++-multilib`, `build-essential` |
| 🧰 Utilities | `git`, `wget`, `curl`, `vim`, `zsh` |
| 🐛 Debugging / scripting | `python3`, `gdb` |

### 🚀 Quick Start

```bash
cd docker
docker compose up -d       # build & start the container in background
docker exec -it csapp3e-labs zsh   # enter the container
```

### 📂 File Mounting

| Path (in container) | Source | Purpose |
| --- | --- | --- |
| `/root/csapp3e-labs` | repo root (via `..`) | All lab files are synced live with the host |
| `/root/.ssh` (read-only) | `~/.ssh` | Git access via SSH keys |

### 📝 Notes

- The container runs with `privileged: true` and `NET_ADMIN` capability — required for some labs
  (e.g., Attack Lab, Proxy Lab) that manipulate network settings.
- DNS is set to `8.8.8.8` and `1.1.1.1` to ensure reliable name resolution.

---

## 🙏 Credits

- Labs by [CS:APP](https://csapp.cs.cmu.edu/) — *Randal E. Bryant & David R. O'Hallaron*
- Per-lab write-ups and solution explanations written by me