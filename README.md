# 🖥️ CSAPP3e Labs — Personal Solutions

> **Bits, bombs, buffers, caches, shells, and more — the full CS:APP gauntlet, one lab at a time.** 🧗‍♂️

This repository collects my personal implementations of the labs for
[*Computer Systems: A Programmer's Perspective (3rd Edition)*](https://csapp.cs.cmu.edu/3e/labs.html).

The labs span the core pillars of computer systems — data representation,
machine-level programming, processor architecture, memory hierarchy, linking,
exceptional control flow, virtual memory, and networking — one lab at a time.
Each lab lives in its own directory with its own write-up and solutions. ✨

## ⚙️ Env Setup

On a Debian or Ubuntu **x86** machine (for example, amd64 Ubuntu 22.04), install the following dependencies:

``` bash
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install gcc-multilib, g++-multilib build-essential gdb python3 git wget curl vim flex bison
```

## 🗂️ Lab Contents

| Lab | Summary |
| --- | ------- |
| 🧪 [Data Lab] | Bit-level manipulations and integer/floating-point representation puzzles 🧮 |
| 💣 [Bomb Lab] | Defuse a binary bomb by reverse-engineering x86-64 assembly 🔍 |
| 🎯 [Attack Lab] | Code injection and return-oriented programming (ROP) attacks 🔫 |
| 🏗️ [Arch Lab] | Design and optimize a pipelined Y86-64 processor ⚡ |
| 🧊 [Cache Lab] | Write a cache simulator and optimize matrix transpose for cache performance 📊 |
| 🚀 [Perf Lab] | Optimize image processing kernels (rotate, smooth) 🖼️ |
| 🐚 [Shell Lab] | Write a simple Unix shell with job control 🖥️ |
| 🧠 [Malloc Lab] | Implement a dynamic memory allocator (malloc, free, realloc) 📦 |
| 🌐 [Proxy Lab] | Write a concurrent web proxy with caching 🔗 |

[Data Lab]: ./DataLab/README.md
[Bomb Lab]: ./BombLab/bomblab.pdf
[Attack Lab]: ./AttackLab/attacklab.pdf
[Arch Lab]: ./ArchLab/archlab.pdf
[Cache Lab]: ./CacheLab/cachelab.pdf
[Perf Lab]: ./PerfLab/perflab.pdf
[Shell Lab]: ./ShellLab/shelllab.pdf
[Malloc Lab]: ./MallocLab/malloclab.pdf
[Proxy Lab]: ./ProxyLab/proxylab.pdf

## 🙏 Credits

- Labs by [CS:APP](https://csapp.cs.cmu.edu/) — *Randal E. Bryant & David R. O'Hallaron*
- Per-lab write-ups and solution explanations written by me
