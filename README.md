# CS:APP Labs — Personal Implementation

This repository contains my personal implementations of the labs for
[CS:APP (Computer Systems: A Programmer's Perspective), 3rd Edition](https://csapp.cs.cmu.edu/3e/labs.html).
The labs cover key concepts in computer systems: data representation, machine-level programming,
processor architecture, memory hierarchy, linking, exceptional control flow, virtual memory, and
networking.

## Lab Contents

| Lab | Summary | Progess |
|-----|---------|---------|
| DataLab ([Guidance](https://csapp.cs.cmu.edu/3e/datalab.pdf) · [Handout](https://csapp.cs.cmu.edu/3e/datalab-handout.tar)) | Bit-level manipulations and integer/floating-point representation puzzles. | ✅
| Bomb Lab ([Guidance](https://csapp.cs.cmu.edu/3e/bomblab.pdf) · [Handout](https://csapp.cs.cmu.edu/3e/bomb.tar)) | Defuse a binary bomb by reverse-engineering x86-64 assembly. | 😴
| Attack Lab ([Guidance](https://csapp.cs.cmu.edu/3e/attacklab.pdf) · [Handout](https://csapp.cs.cmu.edu/3e/target1.tar)) | Code injection and return-oriented programming (ROP) attacks. | ✅
| Architecture Lab ([Guidance](https://csapp.cs.cmu.edu/3e/archlab.pdf) · [Handout](https://csapp.cs.cmu.edu/3e/archlab-handout.tar)) | Design and optimize a pipelined Y86-64 processor. | ✅
| Cache Lab ([Guidance](https://csapp.cs.cmu.edu/3e/cachelab.pdf) · [Handout](https://csapp.cs.cmu.edu/3e/cachelab-handout.tar)) | Write a cache simulator and optimize matrix transpose for cache performance. | 😴
| Performance Lab ([Guidance](https://csapp.cs.cmu.edu/3e/perflab.pdf) · [Handout](https://csapp.cs.cmu.edu/3e/perflab-handout.tar)) | Optimize image processing kernels (rotate, smooth). | 😴
| Shell Lab ([Guidance](https://csapp.cs.cmu.edu/3e/shlab.pdf) · [Handout](https://csapp.cs.cmu.edu/3e/shlab-handout.tar)) | Write a simple Unix shell with job control. | 😴
| Malloc Lab ([Guidance](https://csapp.cs.cmu.edu/3e/malloclab.pdf) · [Handout](https://csapp.cs.cmu.edu/3e/malloclab-handout.tar)) | Implement a dynamic memory allocator (malloc, free, realloc). | 😴
| Proxy Lab ([Guidance](https://csapp.cs.cmu.edu/3e/proxylab.pdf) · [Handout](https://csapp.cs.cmu.edu/3e/proxylab-handout.tar)) | Write a concurrent web proxy with caching. | 😴

## Docker Environment

This repository provides a Docker-based development environment to ensure consistent tooling
across platforms. The image is based on **Ubuntu 20.04 (amd64)** and includes:

- Build toolchain: `gcc-multilib`, `g++-multilib`, `build-essential`
- Utilities: `git`, `wget`, `curl`, `vim`, `zsh`
- Debugging / scripting: `python3`, `gdb`

### Quick Start

```bash
cd docker
docker compose up -d       # build & start the container in background
docker exec -it csapp3e-labs zsh   # enter the container
```

### File Mounting

| Path (in container) | Source | Purpose |
|---------------------|--------|---------|
| `/root/csapp3e-labs` | repo root (via `..`) | All lab files are synced live with the host |
| `/root/.ssh` (read-only) | `~/.ssh` | Git access via SSH keys |

### Notes

- The container runs with `privileged: true` and `NET_ADMIN` capability — required for some labs
  (e.g., Attack Lab, Proxy Lab) that manipulate network settings.
- DNS is set to `8.8.8.8` and `1.1.1.1` to ensure reliable name resolution.
