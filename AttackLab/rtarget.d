
rtarget：     文件格式 elf64-x86-64


Disassembly of section .text:

0000000000808000 <_start>:
  808000:	31 ed                	xor    %ebp,%ebp
  808002:	49 89 d1             	mov    %rdx,%r9
  808005:	5e                   	pop    %rsi
  808006:	48 89 e2             	mov    %rsp,%rdx
  808009:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  80800d:	50                   	push   %rax
  80800e:	54                   	push   %rsp
  80800f:	49 c7 c0 00 a1 80 00 	mov    $0x80a100,%r8
  808016:	48 c7 c1 90 a0 80 00 	mov    $0x80a090,%rcx
  80801d:	48 c7 c7 81 82 80 00 	mov    $0x808281,%rdi
  808024:	ff 15 c6 3f 20 00    	callq  *0x203fc6(%rip)        # a0bff0 <__libc_start_main@GLIBC_2.2.5>
  80802a:	f4                   	hlt    
  80802b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000808030 <_dl_relocate_static_pie>:
  808030:	f3 c3                	repz retq 
  808032:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  808039:	00 00 00 
  80803c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000808040 <deregister_tm_clones>:
  808040:	55                   	push   %rbp
  808041:	b8 98 c4 a0 00       	mov    $0xa0c498,%eax
  808046:	48 3d 98 c4 a0 00    	cmp    $0xa0c498,%rax
  80804c:	48 89 e5             	mov    %rsp,%rbp
  80804f:	74 17                	je     808068 <deregister_tm_clones+0x28>
  808051:	b8 00 00 00 00       	mov    $0x0,%eax
  808056:	48 85 c0             	test   %rax,%rax
  808059:	74 0d                	je     808068 <deregister_tm_clones+0x28>
  80805b:	5d                   	pop    %rbp
  80805c:	bf 98 c4 a0 00       	mov    $0xa0c498,%edi
  808061:	ff e0                	jmpq   *%rax
  808063:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  808068:	5d                   	pop    %rbp
  808069:	c3                   	retq   
  80806a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000808070 <register_tm_clones>:
  808070:	be 98 c4 a0 00       	mov    $0xa0c498,%esi
  808075:	55                   	push   %rbp
  808076:	48 81 ee 98 c4 a0 00 	sub    $0xa0c498,%rsi
  80807d:	48 89 e5             	mov    %rsp,%rbp
  808080:	48 c1 fe 03          	sar    $0x3,%rsi
  808084:	48 89 f0             	mov    %rsi,%rax
  808087:	48 c1 e8 3f          	shr    $0x3f,%rax
  80808b:	48 01 c6             	add    %rax,%rsi
  80808e:	48 d1 fe             	sar    %rsi
  808091:	74 15                	je     8080a8 <register_tm_clones+0x38>
  808093:	b8 00 00 00 00       	mov    $0x0,%eax
  808098:	48 85 c0             	test   %rax,%rax
  80809b:	74 0b                	je     8080a8 <register_tm_clones+0x38>
  80809d:	5d                   	pop    %rbp
  80809e:	bf 98 c4 a0 00       	mov    $0xa0c498,%edi
  8080a3:	ff e0                	jmpq   *%rax
  8080a5:	0f 1f 00             	nopl   (%rax)
  8080a8:	5d                   	pop    %rbp
  8080a9:	c3                   	retq   
  8080aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000008080b0 <__do_global_dtors_aux>:
  8080b0:	80 3d 11 44 20 00 00 	cmpb   $0x0,0x204411(%rip)        # a0c4c8 <completed.7698>
  8080b7:	75 17                	jne    8080d0 <__do_global_dtors_aux+0x20>
  8080b9:	55                   	push   %rbp
  8080ba:	48 89 e5             	mov    %rsp,%rbp
  8080bd:	e8 7e ff ff ff       	callq  808040 <deregister_tm_clones>
  8080c2:	c6 05 ff 43 20 00 01 	movb   $0x1,0x2043ff(%rip)        # a0c4c8 <completed.7698>
  8080c9:	5d                   	pop    %rbp
  8080ca:	c3                   	retq   
  8080cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  8080d0:	f3 c3                	repz retq 
  8080d2:	0f 1f 40 00          	nopl   0x0(%rax)
  8080d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  8080dd:	00 00 00 

00000000008080e0 <frame_dummy>:
  8080e0:	55                   	push   %rbp
  8080e1:	48 89 e5             	mov    %rsp,%rbp
  8080e4:	5d                   	pop    %rbp
  8080e5:	eb 89                	jmp    808070 <register_tm_clones>

00000000008080e7 <usage>:
  8080e7:	48 83 ec 08          	sub    $0x8,%rsp
  8080eb:	48 89 fa             	mov    %rdi,%rdx
  8080ee:	83 3d 13 44 20 00 00 	cmpl   $0x0,0x204413(%rip)        # a0c508 <is_checker>
  8080f5:	74 50                	je     808147 <usage+0x60>
  8080f7:	48 8d 35 1a 20 00 00 	lea    0x201a(%rip),%rsi        # 80a118 <_IO_stdin_used+0x8>
  8080fe:	bf 01 00 00 00       	mov    $0x1,%edi
  808103:	b8 00 00 00 00       	mov    $0x0,%eax
  808108:	e8 d3 8c bf ff       	callq  400de0 <__printf_chk@plt>
  80810d:	48 8d 3d 3c 20 00 00 	lea    0x203c(%rip),%rdi        # 80a150 <_IO_stdin_used+0x40>
  808114:	e8 a7 8b bf ff       	callq  400cc0 <puts@plt>
  808119:	48 8d 3d 30 21 00 00 	lea    0x2130(%rip),%rdi        # 80a250 <_IO_stdin_used+0x140>
  808120:	e8 9b 8b bf ff       	callq  400cc0 <puts@plt>
  808125:	48 8d 3d 4c 20 00 00 	lea    0x204c(%rip),%rdi        # 80a178 <_IO_stdin_used+0x68>
  80812c:	e8 8f 8b bf ff       	callq  400cc0 <puts@plt>
  808131:	48 8d 3d 32 21 00 00 	lea    0x2132(%rip),%rdi        # 80a26a <_IO_stdin_used+0x15a>
  808138:	e8 83 8b bf ff       	callq  400cc0 <puts@plt>
  80813d:	bf 00 00 00 00       	mov    $0x0,%edi
  808142:	e8 d9 8c bf ff       	callq  400e20 <exit@plt>
  808147:	48 8d 35 38 21 00 00 	lea    0x2138(%rip),%rsi        # 80a286 <_IO_stdin_used+0x176>
  80814e:	bf 01 00 00 00       	mov    $0x1,%edi
  808153:	b8 00 00 00 00       	mov    $0x0,%eax
  808158:	e8 83 8c bf ff       	callq  400de0 <__printf_chk@plt>
  80815d:	48 8d 3d 3c 20 00 00 	lea    0x203c(%rip),%rdi        # 80a1a0 <_IO_stdin_used+0x90>
  808164:	e8 57 8b bf ff       	callq  400cc0 <puts@plt>
  808169:	48 8d 3d 58 20 00 00 	lea    0x2058(%rip),%rdi        # 80a1c8 <_IO_stdin_used+0xb8>
  808170:	e8 4b 8b bf ff       	callq  400cc0 <puts@plt>
  808175:	48 8d 3d 28 21 00 00 	lea    0x2128(%rip),%rdi        # 80a2a4 <_IO_stdin_used+0x194>
  80817c:	e8 3f 8b bf ff       	callq  400cc0 <puts@plt>
  808181:	eb ba                	jmp    80813d <usage+0x56>

0000000000808183 <initialize_target>:
  808183:	55                   	push   %rbp
  808184:	53                   	push   %rbx
  808185:	48 81 ec 18 20 00 00 	sub    $0x2018,%rsp
  80818c:	89 f5                	mov    %esi,%ebp
  80818e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  808195:	00 00 
  808197:	48 89 84 24 08 20 00 	mov    %rax,0x2008(%rsp)
  80819e:	00 
  80819f:	31 c0                	xor    %eax,%eax
  8081a1:	89 3d 51 43 20 00    	mov    %edi,0x204351(%rip)        # a0c4f8 <check_level>
  8081a7:	8b 3d 83 3f 20 00    	mov    0x203f83(%rip),%edi        # a0c130 <target_id>
  8081ad:	e8 bb 1e 00 00       	callq  80a06d <gencookie>
  8081b2:	89 05 4c 43 20 00    	mov    %eax,0x20434c(%rip)        # a0c504 <cookie>
  8081b8:	89 c7                	mov    %eax,%edi
  8081ba:	e8 ae 1e 00 00       	callq  80a06d <gencookie>
  8081bf:	89 05 3b 43 20 00    	mov    %eax,0x20433b(%rip)        # a0c500 <authkey>
  8081c5:	8b 05 65 3f 20 00    	mov    0x203f65(%rip),%eax        # a0c130 <target_id>
  8081cb:	8d 78 01             	lea    0x1(%rax),%edi
  8081ce:	e8 bd 8a bf ff       	callq  400c90 <srandom@plt>
  8081d3:	e8 c8 8b bf ff       	callq  400da0 <random@plt>
  8081d8:	89 c7                	mov    %eax,%edi
  8081da:	e8 8d 02 00 00       	callq  80846c <scramble>
  8081df:	89 c3                	mov    %eax,%ebx
  8081e1:	85 ed                	test   %ebp,%ebp
  8081e3:	75 50                	jne    808235 <initialize_target+0xb2>
  8081e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8081ea:	01 d8                	add    %ebx,%eax
  8081ec:	0f b7 c0             	movzwl %ax,%eax
  8081ef:	8d 04 c5 00 01 00 00 	lea    0x100(,%rax,8),%eax
  8081f6:	89 c0                	mov    %eax,%eax
  8081f8:	48 89 05 91 42 20 00 	mov    %rax,0x204291(%rip)        # a0c490 <buf_offset>
  8081ff:	c6 05 2a 4f 20 00 72 	movb   $0x72,0x204f2a(%rip)        # a0d130 <target_prefix>
  808206:	83 3d 7b 42 20 00 00 	cmpl   $0x0,0x20427b(%rip)        # a0c488 <notify>
  80820d:	74 09                	je     808218 <initialize_target+0x95>
  80820f:	83 3d f2 42 20 00 00 	cmpl   $0x0,0x2042f2(%rip)        # a0c508 <is_checker>
  808216:	74 35                	je     80824d <initialize_target+0xca>
  808218:	48 8b 84 24 08 20 00 	mov    0x2008(%rsp),%rax
  80821f:	00 
  808220:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  808227:	00 00 
  808229:	75 51                	jne    80827c <initialize_target+0xf9>
  80822b:	48 81 c4 18 20 00 00 	add    $0x2018,%rsp
  808232:	5b                   	pop    %rbx
  808233:	5d                   	pop    %rbp
  808234:	c3                   	retq   
  808235:	bf 00 00 00 00       	mov    $0x0,%edi
  80823a:	e8 51 8b bf ff       	callq  400d90 <time@plt>
  80823f:	89 c7                	mov    %eax,%edi
  808241:	e8 4a 8a bf ff       	callq  400c90 <srandom@plt>
  808246:	e8 55 8b bf ff       	callq  400da0 <random@plt>
  80824b:	eb 9d                	jmp    8081ea <initialize_target+0x67>
  80824d:	48 89 e7             	mov    %rsp,%rdi
  808250:	e8 48 1b 00 00       	callq  809d9d <init_driver>
  808255:	85 c0                	test   %eax,%eax
  808257:	79 bf                	jns    808218 <initialize_target+0x95>
  808259:	48 89 e2             	mov    %rsp,%rdx
  80825c:	48 8d 35 95 1f 00 00 	lea    0x1f95(%rip),%rsi        # 80a1f8 <_IO_stdin_used+0xe8>
  808263:	bf 01 00 00 00       	mov    $0x1,%edi
  808268:	b8 00 00 00 00       	mov    $0x0,%eax
  80826d:	e8 6e 8b bf ff       	callq  400de0 <__printf_chk@plt>
  808272:	bf 08 00 00 00       	mov    $0x8,%edi
  808277:	e8 a4 8b bf ff       	callq  400e20 <exit@plt>
  80827c:	e8 5f 8a bf ff       	callq  400ce0 <__stack_chk_fail@plt>

0000000000808281 <main>:
  808281:	41 56                	push   %r14
  808283:	41 55                	push   %r13
  808285:	41 54                	push   %r12
  808287:	55                   	push   %rbp
  808288:	53                   	push   %rbx
  808289:	41 89 fc             	mov    %edi,%r12d
  80828c:	48 89 f3             	mov    %rsi,%rbx
  80828f:	48 c7 c6 a4 90 80 00 	mov    $0x8090a4,%rsi
  808296:	bf 0b 00 00 00       	mov    $0xb,%edi
  80829b:	e8 a0 8a bf ff       	callq  400d40 <signal@plt>
  8082a0:	48 c7 c6 50 90 80 00 	mov    $0x809050,%rsi
  8082a7:	bf 07 00 00 00       	mov    $0x7,%edi
  8082ac:	e8 8f 8a bf ff       	callq  400d40 <signal@plt>
  8082b1:	48 c7 c6 f8 90 80 00 	mov    $0x8090f8,%rsi
  8082b8:	bf 04 00 00 00       	mov    $0x4,%edi
  8082bd:	e8 7e 8a bf ff       	callq  400d40 <signal@plt>
  8082c2:	83 3d 3f 42 20 00 00 	cmpl   $0x0,0x20423f(%rip)        # a0c508 <is_checker>
  8082c9:	75 26                	jne    8082f1 <main+0x70>
  8082cb:	48 8d 2d eb 1f 00 00 	lea    0x1feb(%rip),%rbp        # 80a2bd <_IO_stdin_used+0x1ad>
  8082d2:	48 8b 05 c7 41 20 00 	mov    0x2041c7(%rip),%rax        # a0c4a0 <stdin@@GLIBC_2.2.5>
  8082d9:	48 89 05 10 42 20 00 	mov    %rax,0x204210(%rip)        # a0c4f0 <infile>
  8082e0:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  8082e6:	41 be 00 00 00 00    	mov    $0x0,%r14d
  8082ec:	e9 8d 00 00 00       	jmpq   80837e <main+0xfd>
  8082f1:	48 c7 c6 4c 91 80 00 	mov    $0x80914c,%rsi
  8082f8:	bf 0e 00 00 00       	mov    $0xe,%edi
  8082fd:	e8 3e 8a bf ff       	callq  400d40 <signal@plt>
  808302:	bf 05 00 00 00       	mov    $0x5,%edi
  808307:	e8 04 8a bf ff       	callq  400d10 <alarm@plt>
  80830c:	48 8d 2d af 1f 00 00 	lea    0x1faf(%rip),%rbp        # 80a2c2 <_IO_stdin_used+0x1b2>
  808313:	eb bd                	jmp    8082d2 <main+0x51>
  808315:	48 8b 3b             	mov    (%rbx),%rdi
  808318:	e8 ca fd ff ff       	callq  8080e7 <usage>
  80831d:	48 8d 35 11 22 00 00 	lea    0x2211(%rip),%rsi        # 80a535 <_IO_stdin_used+0x425>
  808324:	48 8b 3d 7d 41 20 00 	mov    0x20417d(%rip),%rdi        # a0c4a8 <optarg@@GLIBC_2.2.5>
  80832b:	e8 c0 8a bf ff       	callq  400df0 <fopen@plt>
  808330:	48 89 05 b9 41 20 00 	mov    %rax,0x2041b9(%rip)        # a0c4f0 <infile>
  808337:	48 85 c0             	test   %rax,%rax
  80833a:	75 42                	jne    80837e <main+0xfd>
  80833c:	48 8b 0d 65 41 20 00 	mov    0x204165(%rip),%rcx        # a0c4a8 <optarg@@GLIBC_2.2.5>
  808343:	48 8d 15 80 1f 00 00 	lea    0x1f80(%rip),%rdx        # 80a2ca <_IO_stdin_used+0x1ba>
  80834a:	be 01 00 00 00       	mov    $0x1,%esi
  80834f:	48 8b 3d 6a 41 20 00 	mov    0x20416a(%rip),%rdi        # a0c4c0 <stderr@@GLIBC_2.2.5>
  808356:	e8 e5 8a bf ff       	callq  400e40 <__fprintf_chk@plt>
  80835b:	b8 01 00 00 00       	mov    $0x1,%eax
  808360:	e9 d9 00 00 00       	jmpq   80843e <main+0x1bd>
  808365:	ba 10 00 00 00       	mov    $0x10,%edx
  80836a:	be 00 00 00 00       	mov    $0x0,%esi
  80836f:	48 8b 3d 32 41 20 00 	mov    0x204132(%rip),%rdi        # a0c4a8 <optarg@@GLIBC_2.2.5>
  808376:	e8 95 8a bf ff       	callq  400e10 <strtoul@plt>
  80837b:	41 89 c6             	mov    %eax,%r14d
  80837e:	48 89 ea             	mov    %rbp,%rdx
  808381:	48 89 de             	mov    %rbx,%rsi
  808384:	44 89 e7             	mov    %r12d,%edi
  808387:	e8 74 8a bf ff       	callq  400e00 <getopt@plt>
  80838c:	3c ff                	cmp    $0xff,%al
  80838e:	74 62                	je     8083f2 <main+0x171>
  808390:	0f be d0             	movsbl %al,%edx
  808393:	83 e8 61             	sub    $0x61,%eax
  808396:	3c 10                	cmp    $0x10,%al
  808398:	77 3a                	ja     8083d4 <main+0x153>
  80839a:	0f b6 c0             	movzbl %al,%eax
  80839d:	48 8d 0d 64 1f 00 00 	lea    0x1f64(%rip),%rcx        # 80a308 <_IO_stdin_used+0x1f8>
  8083a4:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  8083a8:	48 01 c8             	add    %rcx,%rax
  8083ab:	ff e0                	jmpq   *%rax
  8083ad:	ba 0a 00 00 00       	mov    $0xa,%edx
  8083b2:	be 00 00 00 00       	mov    $0x0,%esi
  8083b7:	48 8b 3d ea 40 20 00 	mov    0x2040ea(%rip),%rdi        # a0c4a8 <optarg@@GLIBC_2.2.5>
  8083be:	e8 ad 89 bf ff       	callq  400d70 <strtol@plt>
  8083c3:	41 89 c5             	mov    %eax,%r13d
  8083c6:	eb b6                	jmp    80837e <main+0xfd>
  8083c8:	c7 05 b6 40 20 00 00 	movl   $0x0,0x2040b6(%rip)        # a0c488 <notify>
  8083cf:	00 00 00 
  8083d2:	eb aa                	jmp    80837e <main+0xfd>
  8083d4:	48 8d 35 0c 1f 00 00 	lea    0x1f0c(%rip),%rsi        # 80a2e7 <_IO_stdin_used+0x1d7>
  8083db:	bf 01 00 00 00       	mov    $0x1,%edi
  8083e0:	b8 00 00 00 00       	mov    $0x0,%eax
  8083e5:	e8 f6 89 bf ff       	callq  400de0 <__printf_chk@plt>
  8083ea:	48 8b 3b             	mov    (%rbx),%rdi
  8083ed:	e8 f5 fc ff ff       	callq  8080e7 <usage>
  8083f2:	be 01 00 00 00       	mov    $0x1,%esi
  8083f7:	44 89 ef             	mov    %r13d,%edi
  8083fa:	e8 84 fd ff ff       	callq  808183 <initialize_target>
  8083ff:	83 3d 02 41 20 00 00 	cmpl   $0x0,0x204102(%rip)        # a0c508 <is_checker>
  808406:	74 09                	je     808411 <main+0x190>
  808408:	44 39 35 f1 40 20 00 	cmp    %r14d,0x2040f1(%rip)        # a0c500 <authkey>
  80840f:	75 36                	jne    808447 <main+0x1c6>
  808411:	8b 15 ed 40 20 00    	mov    0x2040ed(%rip),%edx        # a0c504 <cookie>
  808417:	48 8d 35 dc 1e 00 00 	lea    0x1edc(%rip),%rsi        # 80a2fa <_IO_stdin_used+0x1ea>
  80841e:	bf 01 00 00 00       	mov    $0x1,%edi
  808423:	b8 00 00 00 00       	mov    $0x0,%eax
  808428:	e8 b3 89 bf ff       	callq  400de0 <__printf_chk@plt>
  80842d:	48 8b 3d 5c 40 20 00 	mov    0x20405c(%rip),%rdi        # a0c490 <buf_offset>
  808434:	e8 6a 0d 00 00       	callq  8091a3 <launch>
  808439:	b8 00 00 00 00       	mov    $0x0,%eax
  80843e:	5b                   	pop    %rbx
  80843f:	5d                   	pop    %rbp
  808440:	41 5c                	pop    %r12
  808442:	41 5d                	pop    %r13
  808444:	41 5e                	pop    %r14
  808446:	c3                   	retq   
  808447:	44 89 f2             	mov    %r14d,%edx
  80844a:	48 8d 35 cf 1d 00 00 	lea    0x1dcf(%rip),%rsi        # 80a220 <_IO_stdin_used+0x110>
  808451:	bf 01 00 00 00       	mov    $0x1,%edi
  808456:	b8 00 00 00 00       	mov    $0x0,%eax
  80845b:	e8 80 89 bf ff       	callq  400de0 <__printf_chk@plt>
  808460:	b8 00 00 00 00       	mov    $0x0,%eax
  808465:	e8 3f 08 00 00       	callq  808ca9 <check_fail>
  80846a:	eb a5                	jmp    808411 <main+0x190>

000000000080846c <scramble>:
  80846c:	48 83 ec 38          	sub    $0x38,%rsp
  808470:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  808477:	00 00 
  808479:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  80847e:	31 c0                	xor    %eax,%eax
  808480:	eb 10                	jmp    808492 <scramble+0x26>
  808482:	69 d0 0b 01 00 00    	imul   $0x10b,%eax,%edx
  808488:	01 fa                	add    %edi,%edx
  80848a:	89 c1                	mov    %eax,%ecx
  80848c:	89 14 8c             	mov    %edx,(%rsp,%rcx,4)
  80848f:	83 c0 01             	add    $0x1,%eax
  808492:	83 f8 09             	cmp    $0x9,%eax
  808495:	76 eb                	jbe    808482 <scramble+0x16>
  808497:	8b 44 24 14          	mov    0x14(%rsp),%eax
  80849b:	69 c0 3b ae 00 00    	imul   $0xae3b,%eax,%eax
  8084a1:	89 44 24 14          	mov    %eax,0x14(%rsp)
  8084a5:	8b 44 24 04          	mov    0x4(%rsp),%eax
  8084a9:	69 c0 ff 4f 00 00    	imul   $0x4fff,%eax,%eax
  8084af:	89 44 24 04          	mov    %eax,0x4(%rsp)
  8084b3:	8b 44 24 14          	mov    0x14(%rsp),%eax
  8084b7:	69 c0 3f 95 00 00    	imul   $0x953f,%eax,%eax
  8084bd:	89 44 24 14          	mov    %eax,0x14(%rsp)
  8084c1:	8b 44 24 24          	mov    0x24(%rsp),%eax
  8084c5:	69 c0 b4 ed 00 00    	imul   $0xedb4,%eax,%eax
  8084cb:	89 44 24 24          	mov    %eax,0x24(%rsp)
  8084cf:	8b 04 24             	mov    (%rsp),%eax
  8084d2:	69 c0 ba 2b 00 00    	imul   $0x2bba,%eax,%eax
  8084d8:	89 04 24             	mov    %eax,(%rsp)
  8084db:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  8084df:	69 c0 4c 3d 00 00    	imul   $0x3d4c,%eax,%eax
  8084e5:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  8084e9:	8b 44 24 20          	mov    0x20(%rsp),%eax
  8084ed:	69 c0 e8 bf 00 00    	imul   $0xbfe8,%eax,%eax
  8084f3:	89 44 24 20          	mov    %eax,0x20(%rsp)
  8084f7:	8b 04 24             	mov    (%rsp),%eax
  8084fa:	69 c0 f2 7b 00 00    	imul   $0x7bf2,%eax,%eax
  808500:	89 04 24             	mov    %eax,(%rsp)
  808503:	8b 04 24             	mov    (%rsp),%eax
  808506:	69 c0 18 5c 00 00    	imul   $0x5c18,%eax,%eax
  80850c:	89 04 24             	mov    %eax,(%rsp)
  80850f:	8b 44 24 20          	mov    0x20(%rsp),%eax
  808513:	69 c0 50 28 00 00    	imul   $0x2850,%eax,%eax
  808519:	89 44 24 20          	mov    %eax,0x20(%rsp)
  80851d:	8b 04 24             	mov    (%rsp),%eax
  808520:	69 c0 14 28 00 00    	imul   $0x2814,%eax,%eax
  808526:	89 04 24             	mov    %eax,(%rsp)
  808529:	8b 44 24 24          	mov    0x24(%rsp),%eax
  80852d:	69 c0 d6 9e 00 00    	imul   $0x9ed6,%eax,%eax
  808533:	89 44 24 24          	mov    %eax,0x24(%rsp)
  808537:	8b 44 24 14          	mov    0x14(%rsp),%eax
  80853b:	69 c0 6c e3 00 00    	imul   $0xe36c,%eax,%eax
  808541:	89 44 24 14          	mov    %eax,0x14(%rsp)
  808545:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  808549:	69 c0 f3 a0 00 00    	imul   $0xa0f3,%eax,%eax
  80854f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  808553:	8b 44 24 18          	mov    0x18(%rsp),%eax
  808557:	69 c0 da f8 00 00    	imul   $0xf8da,%eax,%eax
  80855d:	89 44 24 18          	mov    %eax,0x18(%rsp)
  808561:	8b 04 24             	mov    (%rsp),%eax
  808564:	69 c0 7e 34 00 00    	imul   $0x347e,%eax,%eax
  80856a:	89 04 24             	mov    %eax,(%rsp)
  80856d:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  808571:	69 c0 01 ef 00 00    	imul   $0xef01,%eax,%eax
  808577:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  80857b:	8b 44 24 10          	mov    0x10(%rsp),%eax
  80857f:	69 c0 81 de 00 00    	imul   $0xde81,%eax,%eax
  808585:	89 44 24 10          	mov    %eax,0x10(%rsp)
  808589:	8b 44 24 04          	mov    0x4(%rsp),%eax
  80858d:	69 c0 96 85 00 00    	imul   $0x8596,%eax,%eax
  808593:	89 44 24 04          	mov    %eax,0x4(%rsp)
  808597:	8b 44 24 04          	mov    0x4(%rsp),%eax
  80859b:	69 c0 43 78 00 00    	imul   $0x7843,%eax,%eax
  8085a1:	89 44 24 04          	mov    %eax,0x4(%rsp)
  8085a5:	8b 44 24 10          	mov    0x10(%rsp),%eax
  8085a9:	69 c0 da 92 00 00    	imul   $0x92da,%eax,%eax
  8085af:	89 44 24 10          	mov    %eax,0x10(%rsp)
  8085b3:	8b 44 24 10          	mov    0x10(%rsp),%eax
  8085b7:	69 c0 0c aa 00 00    	imul   $0xaa0c,%eax,%eax
  8085bd:	89 44 24 10          	mov    %eax,0x10(%rsp)
  8085c1:	8b 04 24             	mov    (%rsp),%eax
  8085c4:	69 c0 aa 69 00 00    	imul   $0x69aa,%eax,%eax
  8085ca:	89 04 24             	mov    %eax,(%rsp)
  8085cd:	8b 44 24 10          	mov    0x10(%rsp),%eax
  8085d1:	69 c0 c6 a9 00 00    	imul   $0xa9c6,%eax,%eax
  8085d7:	89 44 24 10          	mov    %eax,0x10(%rsp)
  8085db:	8b 04 24             	mov    (%rsp),%eax
  8085de:	69 c0 0c a7 00 00    	imul   $0xa70c,%eax,%eax
  8085e4:	89 04 24             	mov    %eax,(%rsp)
  8085e7:	8b 44 24 20          	mov    0x20(%rsp),%eax
  8085eb:	69 c0 42 cb 00 00    	imul   $0xcb42,%eax,%eax
  8085f1:	89 44 24 20          	mov    %eax,0x20(%rsp)
  8085f5:	8b 04 24             	mov    (%rsp),%eax
  8085f8:	69 c0 d4 4f 00 00    	imul   $0x4fd4,%eax,%eax
  8085fe:	89 04 24             	mov    %eax,(%rsp)
  808601:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  808605:	69 c0 b2 f9 00 00    	imul   $0xf9b2,%eax,%eax
  80860b:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  80860f:	8b 44 24 14          	mov    0x14(%rsp),%eax
  808613:	69 c0 59 ee 00 00    	imul   $0xee59,%eax,%eax
  808619:	89 44 24 14          	mov    %eax,0x14(%rsp)
  80861d:	8b 44 24 14          	mov    0x14(%rsp),%eax
  808621:	69 c0 b4 66 00 00    	imul   $0x66b4,%eax,%eax
  808627:	89 44 24 14          	mov    %eax,0x14(%rsp)
  80862b:	8b 44 24 24          	mov    0x24(%rsp),%eax
  80862f:	69 c0 2b 74 00 00    	imul   $0x742b,%eax,%eax
  808635:	89 44 24 24          	mov    %eax,0x24(%rsp)
  808639:	8b 44 24 10          	mov    0x10(%rsp),%eax
  80863d:	69 c0 49 8e 00 00    	imul   $0x8e49,%eax,%eax
  808643:	89 44 24 10          	mov    %eax,0x10(%rsp)
  808647:	8b 44 24 20          	mov    0x20(%rsp),%eax
  80864b:	69 c0 b0 1f 00 00    	imul   $0x1fb0,%eax,%eax
  808651:	89 44 24 20          	mov    %eax,0x20(%rsp)
  808655:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  808659:	69 c0 6c e7 00 00    	imul   $0xe76c,%eax,%eax
  80865f:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  808663:	8b 44 24 18          	mov    0x18(%rsp),%eax
  808667:	69 c0 00 39 00 00    	imul   $0x3900,%eax,%eax
  80866d:	89 44 24 18          	mov    %eax,0x18(%rsp)
  808671:	8b 44 24 10          	mov    0x10(%rsp),%eax
  808675:	69 c0 98 56 00 00    	imul   $0x5698,%eax,%eax
  80867b:	89 44 24 10          	mov    %eax,0x10(%rsp)
  80867f:	8b 04 24             	mov    (%rsp),%eax
  808682:	69 c0 40 15 00 00    	imul   $0x1540,%eax,%eax
  808688:	89 04 24             	mov    %eax,(%rsp)
  80868b:	8b 44 24 10          	mov    0x10(%rsp),%eax
  80868f:	69 c0 9c 1e 00 00    	imul   $0x1e9c,%eax,%eax
  808695:	89 44 24 10          	mov    %eax,0x10(%rsp)
  808699:	8b 44 24 18          	mov    0x18(%rsp),%eax
  80869d:	69 c0 a2 26 00 00    	imul   $0x26a2,%eax,%eax
  8086a3:	89 44 24 18          	mov    %eax,0x18(%rsp)
  8086a7:	8b 44 24 08          	mov    0x8(%rsp),%eax
  8086ab:	69 c0 ac 44 00 00    	imul   $0x44ac,%eax,%eax
  8086b1:	89 44 24 08          	mov    %eax,0x8(%rsp)
  8086b5:	8b 44 24 08          	mov    0x8(%rsp),%eax
  8086b9:	69 c0 78 9a 00 00    	imul   $0x9a78,%eax,%eax
  8086bf:	89 44 24 08          	mov    %eax,0x8(%rsp)
  8086c3:	8b 04 24             	mov    (%rsp),%eax
  8086c6:	69 c0 cf 9c 00 00    	imul   $0x9ccf,%eax,%eax
  8086cc:	89 04 24             	mov    %eax,(%rsp)
  8086cf:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  8086d3:	69 c0 06 7a 00 00    	imul   $0x7a06,%eax,%eax
  8086d9:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  8086dd:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  8086e1:	69 c0 8d 1d 00 00    	imul   $0x1d8d,%eax,%eax
  8086e7:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  8086eb:	8b 04 24             	mov    (%rsp),%eax
  8086ee:	69 c0 26 31 00 00    	imul   $0x3126,%eax,%eax
  8086f4:	89 04 24             	mov    %eax,(%rsp)
  8086f7:	8b 44 24 08          	mov    0x8(%rsp),%eax
  8086fb:	69 c0 92 4f 00 00    	imul   $0x4f92,%eax,%eax
  808701:	89 44 24 08          	mov    %eax,0x8(%rsp)
  808705:	8b 44 24 10          	mov    0x10(%rsp),%eax
  808709:	69 c0 75 1f 00 00    	imul   $0x1f75,%eax,%eax
  80870f:	89 44 24 10          	mov    %eax,0x10(%rsp)
  808713:	8b 44 24 14          	mov    0x14(%rsp),%eax
  808717:	69 c0 7e 08 00 00    	imul   $0x87e,%eax,%eax
  80871d:	89 44 24 14          	mov    %eax,0x14(%rsp)
  808721:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  808725:	69 c0 a6 4a 00 00    	imul   $0x4aa6,%eax,%eax
  80872b:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  80872f:	8b 44 24 10          	mov    0x10(%rsp),%eax
  808733:	69 c0 6c e4 00 00    	imul   $0xe46c,%eax,%eax
  808739:	89 44 24 10          	mov    %eax,0x10(%rsp)
  80873d:	8b 44 24 10          	mov    0x10(%rsp),%eax
  808741:	69 c0 9b 4f 00 00    	imul   $0x4f9b,%eax,%eax
  808747:	89 44 24 10          	mov    %eax,0x10(%rsp)
  80874b:	8b 44 24 14          	mov    0x14(%rsp),%eax
  80874f:	69 c0 80 4f 00 00    	imul   $0x4f80,%eax,%eax
  808755:	89 44 24 14          	mov    %eax,0x14(%rsp)
  808759:	8b 44 24 20          	mov    0x20(%rsp),%eax
  80875d:	69 c0 a8 3b 00 00    	imul   $0x3ba8,%eax,%eax
  808763:	89 44 24 20          	mov    %eax,0x20(%rsp)
  808767:	8b 44 24 18          	mov    0x18(%rsp),%eax
  80876b:	69 c0 c5 e3 00 00    	imul   $0xe3c5,%eax,%eax
  808771:	89 44 24 18          	mov    %eax,0x18(%rsp)
  808775:	8b 44 24 04          	mov    0x4(%rsp),%eax
  808779:	69 c0 7e 36 00 00    	imul   $0x367e,%eax,%eax
  80877f:	89 44 24 04          	mov    %eax,0x4(%rsp)
  808783:	8b 44 24 10          	mov    0x10(%rsp),%eax
  808787:	69 c0 f9 2f 00 00    	imul   $0x2ff9,%eax,%eax
  80878d:	89 44 24 10          	mov    %eax,0x10(%rsp)
  808791:	8b 44 24 10          	mov    0x10(%rsp),%eax
  808795:	69 c0 5f 38 00 00    	imul   $0x385f,%eax,%eax
  80879b:	89 44 24 10          	mov    %eax,0x10(%rsp)
  80879f:	8b 44 24 24          	mov    0x24(%rsp),%eax
  8087a3:	69 c0 43 bb 00 00    	imul   $0xbb43,%eax,%eax
  8087a9:	89 44 24 24          	mov    %eax,0x24(%rsp)
  8087ad:	8b 44 24 10          	mov    0x10(%rsp),%eax
  8087b1:	69 c0 49 63 00 00    	imul   $0x6349,%eax,%eax
  8087b7:	89 44 24 10          	mov    %eax,0x10(%rsp)
  8087bb:	8b 44 24 24          	mov    0x24(%rsp),%eax
  8087bf:	69 c0 c4 1a 00 00    	imul   $0x1ac4,%eax,%eax
  8087c5:	89 44 24 24          	mov    %eax,0x24(%rsp)
  8087c9:	8b 04 24             	mov    (%rsp),%eax
  8087cc:	69 c0 12 5d 00 00    	imul   $0x5d12,%eax,%eax
  8087d2:	89 04 24             	mov    %eax,(%rsp)
  8087d5:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  8087d9:	69 c0 c1 39 00 00    	imul   $0x39c1,%eax,%eax
  8087df:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  8087e3:	8b 04 24             	mov    (%rsp),%eax
  8087e6:	69 c0 32 48 00 00    	imul   $0x4832,%eax,%eax
  8087ec:	89 04 24             	mov    %eax,(%rsp)
  8087ef:	8b 44 24 04          	mov    0x4(%rsp),%eax
  8087f3:	69 c0 ad bb 00 00    	imul   $0xbbad,%eax,%eax
  8087f9:	89 44 24 04          	mov    %eax,0x4(%rsp)
  8087fd:	8b 44 24 04          	mov    0x4(%rsp),%eax
  808801:	69 c0 2b 32 00 00    	imul   $0x322b,%eax,%eax
  808807:	89 44 24 04          	mov    %eax,0x4(%rsp)
  80880b:	8b 44 24 08          	mov    0x8(%rsp),%eax
  80880f:	69 c0 7f 16 00 00    	imul   $0x167f,%eax,%eax
  808815:	89 44 24 08          	mov    %eax,0x8(%rsp)
  808819:	8b 44 24 18          	mov    0x18(%rsp),%eax
  80881d:	69 c0 1e db 00 00    	imul   $0xdb1e,%eax,%eax
  808823:	89 44 24 18          	mov    %eax,0x18(%rsp)
  808827:	8b 44 24 10          	mov    0x10(%rsp),%eax
  80882b:	69 c0 a1 e6 00 00    	imul   $0xe6a1,%eax,%eax
  808831:	89 44 24 10          	mov    %eax,0x10(%rsp)
  808835:	8b 44 24 20          	mov    0x20(%rsp),%eax
  808839:	69 c0 1c d4 00 00    	imul   $0xd41c,%eax,%eax
  80883f:	89 44 24 20          	mov    %eax,0x20(%rsp)
  808843:	8b 44 24 14          	mov    0x14(%rsp),%eax
  808847:	69 c0 11 79 00 00    	imul   $0x7911,%eax,%eax
  80884d:	89 44 24 14          	mov    %eax,0x14(%rsp)
  808851:	8b 44 24 10          	mov    0x10(%rsp),%eax
  808855:	69 c0 d7 f2 00 00    	imul   $0xf2d7,%eax,%eax
  80885b:	89 44 24 10          	mov    %eax,0x10(%rsp)
  80885f:	8b 44 24 18          	mov    0x18(%rsp),%eax
  808863:	69 c0 91 db 00 00    	imul   $0xdb91,%eax,%eax
  808869:	89 44 24 18          	mov    %eax,0x18(%rsp)
  80886d:	8b 44 24 18          	mov    0x18(%rsp),%eax
  808871:	69 c0 d2 75 00 00    	imul   $0x75d2,%eax,%eax
  808877:	89 44 24 18          	mov    %eax,0x18(%rsp)
  80887b:	8b 44 24 04          	mov    0x4(%rsp),%eax
  80887f:	69 c0 9b dd 00 00    	imul   $0xdd9b,%eax,%eax
  808885:	89 44 24 04          	mov    %eax,0x4(%rsp)
  808889:	8b 44 24 24          	mov    0x24(%rsp),%eax
  80888d:	69 c0 a5 6f 00 00    	imul   $0x6fa5,%eax,%eax
  808893:	89 44 24 24          	mov    %eax,0x24(%rsp)
  808897:	8b 44 24 24          	mov    0x24(%rsp),%eax
  80889b:	69 c0 8a 6d 00 00    	imul   $0x6d8a,%eax,%eax
  8088a1:	89 44 24 24          	mov    %eax,0x24(%rsp)
  8088a5:	8b 44 24 10          	mov    0x10(%rsp),%eax
  8088a9:	69 c0 b5 62 00 00    	imul   $0x62b5,%eax,%eax
  8088af:	89 44 24 10          	mov    %eax,0x10(%rsp)
  8088b3:	8b 04 24             	mov    (%rsp),%eax
  8088b6:	69 c0 3f 49 00 00    	imul   $0x493f,%eax,%eax
  8088bc:	89 04 24             	mov    %eax,(%rsp)
  8088bf:	8b 04 24             	mov    (%rsp),%eax
  8088c2:	69 c0 8c e9 00 00    	imul   $0xe98c,%eax,%eax
  8088c8:	89 04 24             	mov    %eax,(%rsp)
  8088cb:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  8088cf:	69 c0 c1 3d 00 00    	imul   $0x3dc1,%eax,%eax
  8088d5:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  8088d9:	8b 44 24 20          	mov    0x20(%rsp),%eax
  8088dd:	69 c0 05 a5 00 00    	imul   $0xa505,%eax,%eax
  8088e3:	89 44 24 20          	mov    %eax,0x20(%rsp)
  8088e7:	ba 00 00 00 00       	mov    $0x0,%edx
  8088ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8088f1:	eb 0a                	jmp    8088fd <scramble+0x491>
  8088f3:	89 d1                	mov    %edx,%ecx
  8088f5:	8b 0c 8c             	mov    (%rsp,%rcx,4),%ecx
  8088f8:	01 c8                	add    %ecx,%eax
  8088fa:	83 c2 01             	add    $0x1,%edx
  8088fd:	83 fa 09             	cmp    $0x9,%edx
  808900:	76 f1                	jbe    8088f3 <scramble+0x487>
  808902:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  808907:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  80890e:	00 00 
  808910:	75 05                	jne    808917 <scramble+0x4ab>
  808912:	48 83 c4 38          	add    $0x38,%rsp
  808916:	c3                   	retq   
  808917:	e8 c4 83 bf ff       	callq  400ce0 <__stack_chk_fail@plt>

000000000080891c <getbuf>:
  80891c:	48 83 ec 38          	sub    $0x38,%rsp
  808920:	48 89 e7             	mov    %rsp,%rdi
  808923:	e8 b9 03 00 00       	callq  808ce1 <Gets>
  808928:	b8 01 00 00 00       	mov    $0x1,%eax
  80892d:	48 83 c4 38          	add    $0x38,%rsp
  808931:	c3                   	retq   

0000000000808932 <touch1>:
  808932:	48 83 ec 08          	sub    $0x8,%rsp
  808936:	c7 05 bc 3b 20 00 01 	movl   $0x1,0x203bbc(%rip)        # a0c4fc <vlevel>
  80893d:	00 00 00 
  808940:	48 8d 3d 44 1a 00 00 	lea    0x1a44(%rip),%rdi        # 80a38b <_IO_stdin_used+0x27b>
  808947:	e8 74 83 bf ff       	callq  400cc0 <puts@plt>
  80894c:	bf 01 00 00 00       	mov    $0x1,%edi
  808951:	e8 02 06 00 00       	callq  808f58 <validate>
  808956:	bf 00 00 00 00       	mov    $0x0,%edi
  80895b:	e8 c0 84 bf ff       	callq  400e20 <exit@plt>

0000000000808960 <touch2>:
  808960:	48 83 ec 08          	sub    $0x8,%rsp
  808964:	89 fa                	mov    %edi,%edx
  808966:	c7 05 8c 3b 20 00 02 	movl   $0x2,0x203b8c(%rip)        # a0c4fc <vlevel>
  80896d:	00 00 00 
  808970:	39 3d 8e 3b 20 00    	cmp    %edi,0x203b8e(%rip)        # a0c504 <cookie>
  808976:	74 2a                	je     8089a2 <touch2+0x42>
  808978:	48 8d 35 59 1a 00 00 	lea    0x1a59(%rip),%rsi        # 80a3d8 <_IO_stdin_used+0x2c8>
  80897f:	bf 01 00 00 00       	mov    $0x1,%edi
  808984:	b8 00 00 00 00       	mov    $0x0,%eax
  808989:	e8 52 84 bf ff       	callq  400de0 <__printf_chk@plt>
  80898e:	bf 02 00 00 00       	mov    $0x2,%edi
  808993:	e8 90 06 00 00       	callq  809028 <fail>
  808998:	bf 00 00 00 00       	mov    $0x0,%edi
  80899d:	e8 7e 84 bf ff       	callq  400e20 <exit@plt>
  8089a2:	48 8d 35 07 1a 00 00 	lea    0x1a07(%rip),%rsi        # 80a3b0 <_IO_stdin_used+0x2a0>
  8089a9:	bf 01 00 00 00       	mov    $0x1,%edi
  8089ae:	b8 00 00 00 00       	mov    $0x0,%eax
  8089b3:	e8 28 84 bf ff       	callq  400de0 <__printf_chk@plt>
  8089b8:	bf 02 00 00 00       	mov    $0x2,%edi
  8089bd:	e8 96 05 00 00       	callq  808f58 <validate>
  8089c2:	eb d4                	jmp    808998 <touch2+0x38>

00000000008089c4 <hexmatch>:
  8089c4:	41 54                	push   %r12
  8089c6:	55                   	push   %rbp
  8089c7:	53                   	push   %rbx
  8089c8:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  8089cc:	89 fd                	mov    %edi,%ebp
  8089ce:	48 89 f3             	mov    %rsi,%rbx
  8089d1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  8089d8:	00 00 
  8089da:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  8089df:	31 c0                	xor    %eax,%eax
  8089e1:	e8 ba 83 bf ff       	callq  400da0 <random@plt>
  8089e6:	48 89 c1             	mov    %rax,%rcx
  8089e9:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  8089f0:	0a d7 a3 
  8089f3:	48 f7 ea             	imul   %rdx
  8089f6:	48 01 ca             	add    %rcx,%rdx
  8089f9:	48 c1 fa 06          	sar    $0x6,%rdx
  8089fd:	48 89 c8             	mov    %rcx,%rax
  808a00:	48 c1 f8 3f          	sar    $0x3f,%rax
  808a04:	48 29 c2             	sub    %rax,%rdx
  808a07:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  808a0b:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  808a0f:	48 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%rax
  808a16:	00 
  808a17:	48 29 c1             	sub    %rax,%rcx
  808a1a:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  808a1e:	41 89 e8             	mov    %ebp,%r8d
  808a21:	48 8d 0d 80 19 00 00 	lea    0x1980(%rip),%rcx        # 80a3a8 <_IO_stdin_used+0x298>
  808a28:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  808a2f:	be 01 00 00 00       	mov    $0x1,%esi
  808a34:	4c 89 e7             	mov    %r12,%rdi
  808a37:	b8 00 00 00 00       	mov    $0x0,%eax
  808a3c:	e8 0f 84 bf ff       	callq  400e50 <__sprintf_chk@plt>
  808a41:	ba 09 00 00 00       	mov    $0x9,%edx
  808a46:	4c 89 e6             	mov    %r12,%rsi
  808a49:	48 89 df             	mov    %rbx,%rdi
  808a4c:	e8 4f 82 bf ff       	callq  400ca0 <strncmp@plt>
  808a51:	85 c0                	test   %eax,%eax
  808a53:	0f 94 c0             	sete   %al
  808a56:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
  808a5b:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  808a62:	00 00 
  808a64:	75 0c                	jne    808a72 <hexmatch+0xae>
  808a66:	0f b6 c0             	movzbl %al,%eax
  808a69:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
  808a6d:	5b                   	pop    %rbx
  808a6e:	5d                   	pop    %rbp
  808a6f:	41 5c                	pop    %r12
  808a71:	c3                   	retq   
  808a72:	e8 69 82 bf ff       	callq  400ce0 <__stack_chk_fail@plt>

0000000000808a77 <touch3>:
  808a77:	53                   	push   %rbx
  808a78:	48 89 fb             	mov    %rdi,%rbx
  808a7b:	c7 05 77 3a 20 00 03 	movl   $0x3,0x203a77(%rip)        # a0c4fc <vlevel>
  808a82:	00 00 00 
  808a85:	48 89 fe             	mov    %rdi,%rsi
  808a88:	8b 3d 76 3a 20 00    	mov    0x203a76(%rip),%edi        # a0c504 <cookie>
  808a8e:	e8 31 ff ff ff       	callq  8089c4 <hexmatch>
  808a93:	85 c0                	test   %eax,%eax
  808a95:	74 2d                	je     808ac4 <touch3+0x4d>
  808a97:	48 89 da             	mov    %rbx,%rdx
  808a9a:	48 8d 35 5f 19 00 00 	lea    0x195f(%rip),%rsi        # 80a400 <_IO_stdin_used+0x2f0>
  808aa1:	bf 01 00 00 00       	mov    $0x1,%edi
  808aa6:	b8 00 00 00 00       	mov    $0x0,%eax
  808aab:	e8 30 83 bf ff       	callq  400de0 <__printf_chk@plt>
  808ab0:	bf 03 00 00 00       	mov    $0x3,%edi
  808ab5:	e8 9e 04 00 00       	callq  808f58 <validate>
  808aba:	bf 00 00 00 00       	mov    $0x0,%edi
  808abf:	e8 5c 83 bf ff       	callq  400e20 <exit@plt>
  808ac4:	48 89 da             	mov    %rbx,%rdx
  808ac7:	48 8d 35 5a 19 00 00 	lea    0x195a(%rip),%rsi        # 80a428 <_IO_stdin_used+0x318>
  808ace:	bf 01 00 00 00       	mov    $0x1,%edi
  808ad3:	b8 00 00 00 00       	mov    $0x0,%eax
  808ad8:	e8 03 83 bf ff       	callq  400de0 <__printf_chk@plt>
  808add:	bf 03 00 00 00       	mov    $0x3,%edi
  808ae2:	e8 41 05 00 00       	callq  809028 <fail>
  808ae7:	eb d1                	jmp    808aba <touch3+0x43>

0000000000808ae9 <test>:
  808ae9:	48 83 ec 08          	sub    $0x8,%rsp
  808aed:	b8 00 00 00 00       	mov    $0x0,%eax
  808af2:	e8 25 fe ff ff       	callq  80891c <getbuf>
  808af7:	89 c2                	mov    %eax,%edx
  808af9:	48 8d 35 50 19 00 00 	lea    0x1950(%rip),%rsi        # 80a450 <_IO_stdin_used+0x340>
  808b00:	bf 01 00 00 00       	mov    $0x1,%edi
  808b05:	b8 00 00 00 00       	mov    $0x0,%eax
  808b0a:	e8 d1 82 bf ff       	callq  400de0 <__printf_chk@plt>
  808b0f:	48 83 c4 08          	add    $0x8,%rsp
  808b13:	c3                   	retq   

0000000000808b14 <start_farm>:
  808b14:	b8 01 00 00 00       	mov    $0x1,%eax
  808b19:	c3                   	retq   

0000000000808b1a <setval_408>:
  808b1a:	c7 07 18 18 90 90    	movl   $0x90901818,(%rdi)
  808b20:	c3                   	retq   

0000000000808b21 <setval_366>:
  808b21:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  808b27:	c3                   	retq   

0000000000808b28 <addval_241>:
  808b28:	8d 87 78 90 90 c3    	lea    -0x3c6f6f88(%rdi),%eax
  808b2e:	c3                   	retq   

0000000000808b2f <getval_172>:
  808b2f:	b8 48 89 c7 c2       	mov    $0xc2c78948,%eax
  808b34:	c3                   	retq   

0000000000808b35 <setval_227>:
  808b35:	c7 07 d1 48 89 c7    	movl   $0xc78948d1,(%rdi)
  808b3b:	c3                   	retq   

0000000000808b3c <setval_104>:
  808b3c:	c7 07 48 09 c7 c3    	movl   $0xc3c70948,(%rdi)
  808b42:	c3                   	retq   

0000000000808b43 <getval_352>:
  808b43:	b8 a2 21 d7 58       	mov    $0x58d721a2,%eax
  808b48:	c3                   	retq   

0000000000808b49 <addval_443>:
  808b49:	8d 87 95 54 58 90    	lea    -0x6fa7ab6b(%rdi),%eax
  808b4f:	c3                   	retq   

0000000000808b50 <mid_farm>:
  808b50:	b8 01 00 00 00       	mov    $0x1,%eax
  808b55:	c3                   	retq   

0000000000808b56 <add_xy>:
  808b56:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  808b5a:	c3                   	retq   

0000000000808b5b <getval_213>:
  808b5b:	b8 89 d1 38 c9       	mov    $0xc938d189,%eax
  808b60:	c3                   	retq   

0000000000808b61 <setval_376>:
  808b61:	c7 07 e2 48 8d e0    	movl   $0xe08d48e2,(%rdi)
  808b67:	c3                   	retq   

0000000000808b68 <setval_223>:
  808b68:	c7 07 a1 89 c2 94    	movl   $0x94c289a1,(%rdi)
  808b6e:	c3                   	retq   

0000000000808b6f <setval_390>:
  808b6f:	c7 07 48 89 e0 91    	movl   $0x91e08948,(%rdi)
  808b75:	c3                   	retq   

0000000000808b76 <setval_200>:
  808b76:	c7 07 89 ce 28 d2    	movl   $0xd228ce89,(%rdi)
  808b7c:	c3                   	retq   

0000000000808b7d <setval_427>:
  808b7d:	c7 07 12 48 c9 e0    	movl   $0xe0c94812,(%rdi)
  808b83:	c3                   	retq   

0000000000808b84 <addval_454>:
  808b84:	8d 87 09 c2 84 db    	lea    -0x247b3df7(%rdi),%eax
  808b8a:	c3                   	retq   

0000000000808b8b <addval_467>:
  808b8b:	8d 87 99 c2 08 db    	lea    -0x24f73d67(%rdi),%eax
  808b91:	c3                   	retq   

0000000000808b92 <addval_492>:
  808b92:	8d 87 89 d1 c2 09    	lea    0x9c2d189(%rdi),%eax
  808b98:	c3                   	retq   

0000000000808b99 <getval_204>:
  808b99:	b8 89 ce 18 d2       	mov    $0xd218ce89,%eax
  808b9e:	c3                   	retq   

0000000000808b9f <addval_435>:
  808b9f:	8d 87 89 d1 20 d2    	lea    -0x2ddf2e77(%rdi),%eax
  808ba5:	c3                   	retq   

0000000000808ba6 <addval_216>:
  808ba6:	8d 87 89 d1 78 db    	lea    -0x24872e77(%rdi),%eax
  808bac:	c3                   	retq   

0000000000808bad <getval_378>:
  808bad:	b8 89 d1 78 c0       	mov    $0xc078d189,%eax
  808bb2:	c3                   	retq   

0000000000808bb3 <getval_318>:
  808bb3:	b8 40 89 e0 c3       	mov    $0xc3e08940,%eax
  808bb8:	c3                   	retq   

0000000000808bb9 <addval_401>:
  808bb9:	8d 87 89 ce 38 c0    	lea    -0x3fc73177(%rdi),%eax
  808bbf:	c3                   	retq   

0000000000808bc0 <getval_361>:
  808bc0:	b8 48 89 e0 c1       	mov    $0xc1e08948,%eax
  808bc5:	c3                   	retq   

0000000000808bc6 <addval_486>:
  808bc6:	8d 87 09 d1 84 d2    	lea    -0x2d7b2ef7(%rdi),%eax
  808bcc:	c3                   	retq   

0000000000808bcd <addval_150>:
  808bcd:	8d 87 89 ce 38 db    	lea    -0x24c73177(%rdi),%eax
  808bd3:	c3                   	retq   

0000000000808bd4 <addval_423>:
  808bd4:	8d 87 48 89 e0 c3    	lea    -0x3c1f76b8(%rdi),%eax
  808bda:	c3                   	retq   

0000000000808bdb <setval_214>:
  808bdb:	c7 07 7e a9 ce 90    	movl   $0x90cea97e,(%rdi)
  808be1:	c3                   	retq   

0000000000808be2 <addval_141>:
  808be2:	8d 87 09 ce 20 c0    	lea    -0x3fdf31f7(%rdi),%eax
  808be8:	c3                   	retq   

0000000000808be9 <setval_109>:
  808be9:	c7 07 d6 48 89 e0    	movl   $0xe08948d6,(%rdi)
  808bef:	c3                   	retq   

0000000000808bf0 <addval_126>:
  808bf0:	8d 87 88 c2 38 c9    	lea    -0x36c73d78(%rdi),%eax
  808bf6:	c3                   	retq   

0000000000808bf7 <getval_173>:
  808bf7:	b8 48 89 e0 92       	mov    $0x92e08948,%eax
  808bfc:	c3                   	retq   

0000000000808bfd <addval_442>:
  808bfd:	8d 87 a9 c2 08 c0    	lea    -0x3ff73d57(%rdi),%eax
  808c03:	c3                   	retq   

0000000000808c04 <setval_278>:
  808c04:	c7 07 21 89 ce 91    	movl   $0x91ce8921,(%rdi)
  808c0a:	c3                   	retq   

0000000000808c0b <setval_195>:
  808c0b:	c7 07 8b d1 20 c9    	movl   $0xc920d18b,(%rdi)
  808c11:	c3                   	retq   

0000000000808c12 <setval_388>:
  808c12:	c7 07 8d d1 08 d2    	movl   $0xd208d18d,(%rdi)
  808c18:	c3                   	retq   

0000000000808c19 <getval_128>:
  808c19:	b8 89 c2 38 d2       	mov    $0xd238c289,%eax
  808c1e:	c3                   	retq   

0000000000808c1f <setval_187>:
  808c1f:	c7 07 89 c2 84 c9    	movl   $0xc984c289,(%rdi)
  808c25:	c3                   	retq   

0000000000808c26 <setval_299>:
  808c26:	c7 07 89 ce 18 c9    	movl   $0xc918ce89,(%rdi)
  808c2c:	c3                   	retq   

0000000000808c2d <getval_406>:
  808c2d:	b8 89 c2 90 c1       	mov    $0xc190c289,%eax
  808c32:	c3                   	retq   

0000000000808c33 <end_farm>:
  808c33:	b8 01 00 00 00       	mov    $0x1,%eax
  808c38:	c3                   	retq   

0000000000808c39 <save_char>:
  808c39:	8b 05 e5 44 20 00    	mov    0x2044e5(%rip),%eax        # a0d124 <gets_cnt>
  808c3f:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  808c44:	7f 4a                	jg     808c90 <save_char+0x57>
  808c46:	89 f9                	mov    %edi,%ecx
  808c48:	c0 e9 04             	shr    $0x4,%cl
  808c4b:	8d 14 40             	lea    (%rax,%rax,2),%edx
  808c4e:	4c 8d 05 1b 1b 00 00 	lea    0x1b1b(%rip),%r8        # 80a770 <trans_char>
  808c55:	83 e1 0f             	and    $0xf,%ecx
  808c58:	45 0f b6 0c 08       	movzbl (%r8,%rcx,1),%r9d
  808c5d:	48 8d 0d bc 38 20 00 	lea    0x2038bc(%rip),%rcx        # a0c520 <gets_buf>
  808c64:	48 63 f2             	movslq %edx,%rsi
  808c67:	44 88 0c 31          	mov    %r9b,(%rcx,%rsi,1)
  808c6b:	8d 72 01             	lea    0x1(%rdx),%esi
  808c6e:	83 e7 0f             	and    $0xf,%edi
  808c71:	41 0f b6 3c 38       	movzbl (%r8,%rdi,1),%edi
  808c76:	48 63 f6             	movslq %esi,%rsi
  808c79:	40 88 3c 31          	mov    %dil,(%rcx,%rsi,1)
  808c7d:	83 c2 02             	add    $0x2,%edx
  808c80:	48 63 d2             	movslq %edx,%rdx
  808c83:	c6 04 11 20          	movb   $0x20,(%rcx,%rdx,1)
  808c87:	83 c0 01             	add    $0x1,%eax
  808c8a:	89 05 94 44 20 00    	mov    %eax,0x204494(%rip)        # a0d124 <gets_cnt>
  808c90:	f3 c3                	repz retq 

0000000000808c92 <save_term>:
  808c92:	8b 05 8c 44 20 00    	mov    0x20448c(%rip),%eax        # a0d124 <gets_cnt>
  808c98:	8d 04 40             	lea    (%rax,%rax,2),%eax
  808c9b:	48 98                	cltq   
  808c9d:	48 8d 15 7c 38 20 00 	lea    0x20387c(%rip),%rdx        # a0c520 <gets_buf>
  808ca4:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  808ca8:	c3                   	retq   

0000000000808ca9 <check_fail>:
  808ca9:	48 83 ec 08          	sub    $0x8,%rsp
  808cad:	0f be 15 7c 44 20 00 	movsbl 0x20447c(%rip),%edx        # a0d130 <target_prefix>
  808cb4:	4c 8d 05 65 38 20 00 	lea    0x203865(%rip),%r8        # a0c520 <gets_buf>
  808cbb:	8b 0d 37 38 20 00    	mov    0x203837(%rip),%ecx        # a0c4f8 <check_level>
  808cc1:	48 8d 35 ab 17 00 00 	lea    0x17ab(%rip),%rsi        # 80a473 <_IO_stdin_used+0x363>
  808cc8:	bf 01 00 00 00       	mov    $0x1,%edi
  808ccd:	b8 00 00 00 00       	mov    $0x0,%eax
  808cd2:	e8 09 81 bf ff       	callq  400de0 <__printf_chk@plt>
  808cd7:	bf 01 00 00 00       	mov    $0x1,%edi
  808cdc:	e8 3f 81 bf ff       	callq  400e20 <exit@plt>

0000000000808ce1 <Gets>:
  808ce1:	41 54                	push   %r12
  808ce3:	55                   	push   %rbp
  808ce4:	53                   	push   %rbx
  808ce5:	49 89 fc             	mov    %rdi,%r12
  808ce8:	c7 05 32 44 20 00 00 	movl   $0x0,0x204432(%rip)        # a0d124 <gets_cnt>
  808cef:	00 00 00 
  808cf2:	48 89 fb             	mov    %rdi,%rbx
  808cf5:	eb 11                	jmp    808d08 <Gets+0x27>
  808cf7:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  808cfb:	88 03                	mov    %al,(%rbx)
  808cfd:	0f b6 f8             	movzbl %al,%edi
  808d00:	e8 34 ff ff ff       	callq  808c39 <save_char>
  808d05:	48 89 eb             	mov    %rbp,%rbx
  808d08:	48 8b 3d e1 37 20 00 	mov    0x2037e1(%rip),%rdi        # a0c4f0 <infile>
  808d0f:	e8 9c 80 bf ff       	callq  400db0 <_IO_getc@plt>
  808d14:	83 f8 ff             	cmp    $0xffffffff,%eax
  808d17:	74 05                	je     808d1e <Gets+0x3d>
  808d19:	83 f8 0a             	cmp    $0xa,%eax
  808d1c:	75 d9                	jne    808cf7 <Gets+0x16>
  808d1e:	c6 03 00             	movb   $0x0,(%rbx)
  808d21:	b8 00 00 00 00       	mov    $0x0,%eax
  808d26:	e8 67 ff ff ff       	callq  808c92 <save_term>
  808d2b:	4c 89 e0             	mov    %r12,%rax
  808d2e:	5b                   	pop    %rbx
  808d2f:	5d                   	pop    %rbp
  808d30:	41 5c                	pop    %r12
  808d32:	c3                   	retq   

0000000000808d33 <notify_server>:
  808d33:	55                   	push   %rbp
  808d34:	53                   	push   %rbx
  808d35:	48 81 ec 18 40 00 00 	sub    $0x4018,%rsp
  808d3c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  808d43:	00 00 
  808d45:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  808d4c:	00 
  808d4d:	31 c0                	xor    %eax,%eax
  808d4f:	83 3d b2 37 20 00 00 	cmpl   $0x0,0x2037b2(%rip)        # a0c508 <is_checker>
  808d56:	0f 85 d9 00 00 00    	jne    808e35 <notify_server+0x102>
  808d5c:	89 fb                	mov    %edi,%ebx
  808d5e:	8b 05 c0 43 20 00    	mov    0x2043c0(%rip),%eax        # a0d124 <gets_cnt>
  808d64:	83 c0 64             	add    $0x64,%eax
  808d67:	3d 00 20 00 00       	cmp    $0x2000,%eax
  808d6c:	0f 8f e4 00 00 00    	jg     808e56 <notify_server+0x123>
  808d72:	0f be 05 b7 43 20 00 	movsbl 0x2043b7(%rip),%eax        # a0d130 <target_prefix>
  808d79:	83 3d 08 37 20 00 00 	cmpl   $0x0,0x203708(%rip)        # a0c488 <notify>
  808d80:	0f 84 f0 00 00 00    	je     808e76 <notify_server+0x143>
  808d86:	8b 15 74 37 20 00    	mov    0x203774(%rip),%edx        # a0c500 <authkey>
  808d8c:	85 db                	test   %ebx,%ebx
  808d8e:	0f 84 ec 00 00 00    	je     808e80 <notify_server+0x14d>
  808d94:	48 8d 2d ee 16 00 00 	lea    0x16ee(%rip),%rbp        # 80a489 <_IO_stdin_used+0x379>
  808d9b:	48 89 e7             	mov    %rsp,%rdi
  808d9e:	48 83 ec 08          	sub    $0x8,%rsp
  808da2:	48 8d 0d 77 37 20 00 	lea    0x203777(%rip),%rcx        # a0c520 <gets_buf>
  808da9:	51                   	push   %rcx
  808daa:	56                   	push   %rsi
  808dab:	50                   	push   %rax
  808dac:	52                   	push   %rdx
  808dad:	55                   	push   %rbp
  808dae:	44 8b 0d 7b 33 20 00 	mov    0x20337b(%rip),%r9d        # a0c130 <target_id>
  808db5:	4c 8d 05 d7 16 00 00 	lea    0x16d7(%rip),%r8        # 80a493 <_IO_stdin_used+0x383>
  808dbc:	b9 00 20 00 00       	mov    $0x2000,%ecx
  808dc1:	ba 01 00 00 00       	mov    $0x1,%edx
  808dc6:	be 00 20 00 00       	mov    $0x2000,%esi
  808dcb:	b8 00 00 00 00       	mov    $0x0,%eax
  808dd0:	e8 9b 7e bf ff       	callq  400c70 <__snprintf_chk@plt>
  808dd5:	48 83 c4 30          	add    $0x30,%rsp
  808dd9:	83 3d a8 36 20 00 00 	cmpl   $0x0,0x2036a8(%rip)        # a0c488 <notify>
  808de0:	0f 84 df 00 00 00    	je     808ec5 <notify_server+0x192>
  808de6:	85 db                	test   %ebx,%ebx
  808de8:	0f 84 c6 00 00 00    	je     808eb4 <notify_server+0x181>
  808dee:	48 89 e1             	mov    %rsp,%rcx
  808df1:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  808df8:	00 
  808df9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  808dff:	48 8b 15 42 33 20 00 	mov    0x203342(%rip),%rdx        # a0c148 <lab>
  808e06:	48 8b 35 73 36 20 00 	mov    0x203673(%rip),%rsi        # a0c480 <course>
  808e0d:	48 8b 3d 2c 33 20 00 	mov    0x20332c(%rip),%rdi        # a0c140 <user_id>
  808e14:	e8 af 11 00 00       	callq  809fc8 <driver_post>
  808e19:	85 c0                	test   %eax,%eax
  808e1b:	78 6f                	js     808e8c <notify_server+0x159>
  808e1d:	48 8d 3d b4 17 00 00 	lea    0x17b4(%rip),%rdi        # 80a5d8 <_IO_stdin_used+0x4c8>
  808e24:	e8 97 7e bf ff       	callq  400cc0 <puts@plt>
  808e29:	48 8d 3d 8b 16 00 00 	lea    0x168b(%rip),%rdi        # 80a4bb <_IO_stdin_used+0x3ab>
  808e30:	e8 8b 7e bf ff       	callq  400cc0 <puts@plt>
  808e35:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  808e3c:	00 
  808e3d:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  808e44:	00 00 
  808e46:	0f 85 07 01 00 00    	jne    808f53 <notify_server+0x220>
  808e4c:	48 81 c4 18 40 00 00 	add    $0x4018,%rsp
  808e53:	5b                   	pop    %rbx
  808e54:	5d                   	pop    %rbp
  808e55:	c3                   	retq   
  808e56:	48 8d 35 4b 17 00 00 	lea    0x174b(%rip),%rsi        # 80a5a8 <_IO_stdin_used+0x498>
  808e5d:	bf 01 00 00 00       	mov    $0x1,%edi
  808e62:	b8 00 00 00 00       	mov    $0x0,%eax
  808e67:	e8 74 7f bf ff       	callq  400de0 <__printf_chk@plt>
  808e6c:	bf 01 00 00 00       	mov    $0x1,%edi
  808e71:	e8 aa 7f bf ff       	callq  400e20 <exit@plt>
  808e76:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  808e7b:	e9 0c ff ff ff       	jmpq   808d8c <notify_server+0x59>
  808e80:	48 8d 2d 07 16 00 00 	lea    0x1607(%rip),%rbp        # 80a48e <_IO_stdin_used+0x37e>
  808e87:	e9 0f ff ff ff       	jmpq   808d9b <notify_server+0x68>
  808e8c:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  808e93:	00 
  808e94:	48 8d 35 14 16 00 00 	lea    0x1614(%rip),%rsi        # 80a4af <_IO_stdin_used+0x39f>
  808e9b:	bf 01 00 00 00       	mov    $0x1,%edi
  808ea0:	b8 00 00 00 00       	mov    $0x0,%eax
  808ea5:	e8 36 7f bf ff       	callq  400de0 <__printf_chk@plt>
  808eaa:	bf 01 00 00 00       	mov    $0x1,%edi
  808eaf:	e8 6c 7f bf ff       	callq  400e20 <exit@plt>
  808eb4:	48 8d 3d 0a 16 00 00 	lea    0x160a(%rip),%rdi        # 80a4c5 <_IO_stdin_used+0x3b5>
  808ebb:	e8 00 7e bf ff       	callq  400cc0 <puts@plt>
  808ec0:	e9 70 ff ff ff       	jmpq   808e35 <notify_server+0x102>
  808ec5:	48 89 ea             	mov    %rbp,%rdx
  808ec8:	48 8d 35 41 17 00 00 	lea    0x1741(%rip),%rsi        # 80a610 <_IO_stdin_used+0x500>
  808ecf:	bf 01 00 00 00       	mov    $0x1,%edi
  808ed4:	b8 00 00 00 00       	mov    $0x0,%eax
  808ed9:	e8 02 7f bf ff       	callq  400de0 <__printf_chk@plt>
  808ede:	48 8b 15 5b 32 20 00 	mov    0x20325b(%rip),%rdx        # a0c140 <user_id>
  808ee5:	48 8d 35 e0 15 00 00 	lea    0x15e0(%rip),%rsi        # 80a4cc <_IO_stdin_used+0x3bc>
  808eec:	bf 01 00 00 00       	mov    $0x1,%edi
  808ef1:	b8 00 00 00 00       	mov    $0x0,%eax
  808ef6:	e8 e5 7e bf ff       	callq  400de0 <__printf_chk@plt>
  808efb:	48 8b 15 7e 35 20 00 	mov    0x20357e(%rip),%rdx        # a0c480 <course>
  808f02:	48 8d 35 d0 15 00 00 	lea    0x15d0(%rip),%rsi        # 80a4d9 <_IO_stdin_used+0x3c9>
  808f09:	bf 01 00 00 00       	mov    $0x1,%edi
  808f0e:	b8 00 00 00 00       	mov    $0x0,%eax
  808f13:	e8 c8 7e bf ff       	callq  400de0 <__printf_chk@plt>
  808f18:	48 8b 15 29 32 20 00 	mov    0x203229(%rip),%rdx        # a0c148 <lab>
  808f1f:	48 8d 35 bf 15 00 00 	lea    0x15bf(%rip),%rsi        # 80a4e5 <_IO_stdin_used+0x3d5>
  808f26:	bf 01 00 00 00       	mov    $0x1,%edi
  808f2b:	b8 00 00 00 00       	mov    $0x0,%eax
  808f30:	e8 ab 7e bf ff       	callq  400de0 <__printf_chk@plt>
  808f35:	48 89 e2             	mov    %rsp,%rdx
  808f38:	48 8d 35 af 15 00 00 	lea    0x15af(%rip),%rsi        # 80a4ee <_IO_stdin_used+0x3de>
  808f3f:	bf 01 00 00 00       	mov    $0x1,%edi
  808f44:	b8 00 00 00 00       	mov    $0x0,%eax
  808f49:	e8 92 7e bf ff       	callq  400de0 <__printf_chk@plt>
  808f4e:	e9 e2 fe ff ff       	jmpq   808e35 <notify_server+0x102>
  808f53:	e8 88 7d bf ff       	callq  400ce0 <__stack_chk_fail@plt>

0000000000808f58 <validate>:
  808f58:	53                   	push   %rbx
  808f59:	89 fb                	mov    %edi,%ebx
  808f5b:	83 3d a6 35 20 00 00 	cmpl   $0x0,0x2035a6(%rip)        # a0c508 <is_checker>
  808f62:	74 72                	je     808fd6 <validate+0x7e>
  808f64:	39 3d 92 35 20 00    	cmp    %edi,0x203592(%rip)        # a0c4fc <vlevel>
  808f6a:	75 32                	jne    808f9e <validate+0x46>
  808f6c:	8b 15 86 35 20 00    	mov    0x203586(%rip),%edx        # a0c4f8 <check_level>
  808f72:	39 fa                	cmp    %edi,%edx
  808f74:	75 3e                	jne    808fb4 <validate+0x5c>
  808f76:	0f be 15 b3 41 20 00 	movsbl 0x2041b3(%rip),%edx        # a0d130 <target_prefix>
  808f7d:	4c 8d 05 9c 35 20 00 	lea    0x20359c(%rip),%r8        # a0c520 <gets_buf>
  808f84:	89 f9                	mov    %edi,%ecx
  808f86:	48 8d 35 8b 15 00 00 	lea    0x158b(%rip),%rsi        # 80a518 <_IO_stdin_used+0x408>
  808f8d:	bf 01 00 00 00       	mov    $0x1,%edi
  808f92:	b8 00 00 00 00       	mov    $0x0,%eax
  808f97:	e8 44 7e bf ff       	callq  400de0 <__printf_chk@plt>
  808f9c:	5b                   	pop    %rbx
  808f9d:	c3                   	retq   
  808f9e:	48 8d 3d 55 15 00 00 	lea    0x1555(%rip),%rdi        # 80a4fa <_IO_stdin_used+0x3ea>
  808fa5:	e8 16 7d bf ff       	callq  400cc0 <puts@plt>
  808faa:	b8 00 00 00 00       	mov    $0x0,%eax
  808faf:	e8 f5 fc ff ff       	callq  808ca9 <check_fail>
  808fb4:	89 f9                	mov    %edi,%ecx
  808fb6:	48 8d 35 7b 16 00 00 	lea    0x167b(%rip),%rsi        # 80a638 <_IO_stdin_used+0x528>
  808fbd:	bf 01 00 00 00       	mov    $0x1,%edi
  808fc2:	b8 00 00 00 00       	mov    $0x0,%eax
  808fc7:	e8 14 7e bf ff       	callq  400de0 <__printf_chk@plt>
  808fcc:	b8 00 00 00 00       	mov    $0x0,%eax
  808fd1:	e8 d3 fc ff ff       	callq  808ca9 <check_fail>
  808fd6:	39 3d 20 35 20 00    	cmp    %edi,0x203520(%rip)        # a0c4fc <vlevel>
  808fdc:	74 1a                	je     808ff8 <validate+0xa0>
  808fde:	48 8d 3d 15 15 00 00 	lea    0x1515(%rip),%rdi        # 80a4fa <_IO_stdin_used+0x3ea>
  808fe5:	e8 d6 7c bf ff       	callq  400cc0 <puts@plt>
  808fea:	89 de                	mov    %ebx,%esi
  808fec:	bf 00 00 00 00       	mov    $0x0,%edi
  808ff1:	e8 3d fd ff ff       	callq  808d33 <notify_server>
  808ff6:	eb a4                	jmp    808f9c <validate+0x44>
  808ff8:	0f be 0d 31 41 20 00 	movsbl 0x204131(%rip),%ecx        # a0d130 <target_prefix>
  808fff:	89 fa                	mov    %edi,%edx
  809001:	48 8d 35 58 16 00 00 	lea    0x1658(%rip),%rsi        # 80a660 <_IO_stdin_used+0x550>
  809008:	bf 01 00 00 00       	mov    $0x1,%edi
  80900d:	b8 00 00 00 00       	mov    $0x0,%eax
  809012:	e8 c9 7d bf ff       	callq  400de0 <__printf_chk@plt>
  809017:	89 de                	mov    %ebx,%esi
  809019:	bf 01 00 00 00       	mov    $0x1,%edi
  80901e:	e8 10 fd ff ff       	callq  808d33 <notify_server>
  809023:	e9 74 ff ff ff       	jmpq   808f9c <validate+0x44>

0000000000809028 <fail>:
  809028:	48 83 ec 08          	sub    $0x8,%rsp
  80902c:	83 3d d5 34 20 00 00 	cmpl   $0x0,0x2034d5(%rip)        # a0c508 <is_checker>
  809033:	75 11                	jne    809046 <fail+0x1e>
  809035:	89 fe                	mov    %edi,%esi
  809037:	bf 00 00 00 00       	mov    $0x0,%edi
  80903c:	e8 f2 fc ff ff       	callq  808d33 <notify_server>
  809041:	48 83 c4 08          	add    $0x8,%rsp
  809045:	c3                   	retq   
  809046:	b8 00 00 00 00       	mov    $0x0,%eax
  80904b:	e8 59 fc ff ff       	callq  808ca9 <check_fail>

0000000000809050 <bushandler>:
  809050:	48 83 ec 08          	sub    $0x8,%rsp
  809054:	83 3d ad 34 20 00 00 	cmpl   $0x0,0x2034ad(%rip)        # a0c508 <is_checker>
  80905b:	74 16                	je     809073 <bushandler+0x23>
  80905d:	48 8d 3d c9 14 00 00 	lea    0x14c9(%rip),%rdi        # 80a52d <_IO_stdin_used+0x41d>
  809064:	e8 57 7c bf ff       	callq  400cc0 <puts@plt>
  809069:	b8 00 00 00 00       	mov    $0x0,%eax
  80906e:	e8 36 fc ff ff       	callq  808ca9 <check_fail>
  809073:	48 8d 3d 1e 16 00 00 	lea    0x161e(%rip),%rdi        # 80a698 <_IO_stdin_used+0x588>
  80907a:	e8 41 7c bf ff       	callq  400cc0 <puts@plt>
  80907f:	48 8d 3d b1 14 00 00 	lea    0x14b1(%rip),%rdi        # 80a537 <_IO_stdin_used+0x427>
  809086:	e8 35 7c bf ff       	callq  400cc0 <puts@plt>
  80908b:	be 00 00 00 00       	mov    $0x0,%esi
  809090:	bf 00 00 00 00       	mov    $0x0,%edi
  809095:	e8 99 fc ff ff       	callq  808d33 <notify_server>
  80909a:	bf 01 00 00 00       	mov    $0x1,%edi
  80909f:	e8 7c 7d bf ff       	callq  400e20 <exit@plt>

00000000008090a4 <seghandler>:
  8090a4:	48 83 ec 08          	sub    $0x8,%rsp
  8090a8:	83 3d 59 34 20 00 00 	cmpl   $0x0,0x203459(%rip)        # a0c508 <is_checker>
  8090af:	74 16                	je     8090c7 <seghandler+0x23>
  8090b1:	48 8d 3d 95 14 00 00 	lea    0x1495(%rip),%rdi        # 80a54d <_IO_stdin_used+0x43d>
  8090b8:	e8 03 7c bf ff       	callq  400cc0 <puts@plt>
  8090bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8090c2:	e8 e2 fb ff ff       	callq  808ca9 <check_fail>
  8090c7:	48 8d 3d ea 15 00 00 	lea    0x15ea(%rip),%rdi        # 80a6b8 <_IO_stdin_used+0x5a8>
  8090ce:	e8 ed 7b bf ff       	callq  400cc0 <puts@plt>
  8090d3:	48 8d 3d 5d 14 00 00 	lea    0x145d(%rip),%rdi        # 80a537 <_IO_stdin_used+0x427>
  8090da:	e8 e1 7b bf ff       	callq  400cc0 <puts@plt>
  8090df:	be 00 00 00 00       	mov    $0x0,%esi
  8090e4:	bf 00 00 00 00       	mov    $0x0,%edi
  8090e9:	e8 45 fc ff ff       	callq  808d33 <notify_server>
  8090ee:	bf 01 00 00 00       	mov    $0x1,%edi
  8090f3:	e8 28 7d bf ff       	callq  400e20 <exit@plt>

00000000008090f8 <illegalhandler>:
  8090f8:	48 83 ec 08          	sub    $0x8,%rsp
  8090fc:	83 3d 05 34 20 00 00 	cmpl   $0x0,0x203405(%rip)        # a0c508 <is_checker>
  809103:	74 16                	je     80911b <illegalhandler+0x23>
  809105:	48 8d 3d 54 14 00 00 	lea    0x1454(%rip),%rdi        # 80a560 <_IO_stdin_used+0x450>
  80910c:	e8 af 7b bf ff       	callq  400cc0 <puts@plt>
  809111:	b8 00 00 00 00       	mov    $0x0,%eax
  809116:	e8 8e fb ff ff       	callq  808ca9 <check_fail>
  80911b:	48 8d 3d be 15 00 00 	lea    0x15be(%rip),%rdi        # 80a6e0 <_IO_stdin_used+0x5d0>
  809122:	e8 99 7b bf ff       	callq  400cc0 <puts@plt>
  809127:	48 8d 3d 09 14 00 00 	lea    0x1409(%rip),%rdi        # 80a537 <_IO_stdin_used+0x427>
  80912e:	e8 8d 7b bf ff       	callq  400cc0 <puts@plt>
  809133:	be 00 00 00 00       	mov    $0x0,%esi
  809138:	bf 00 00 00 00       	mov    $0x0,%edi
  80913d:	e8 f1 fb ff ff       	callq  808d33 <notify_server>
  809142:	bf 01 00 00 00       	mov    $0x1,%edi
  809147:	e8 d4 7c bf ff       	callq  400e20 <exit@plt>

000000000080914c <sigalrmhandler>:
  80914c:	48 83 ec 08          	sub    $0x8,%rsp
  809150:	83 3d b1 33 20 00 00 	cmpl   $0x0,0x2033b1(%rip)        # a0c508 <is_checker>
  809157:	74 16                	je     80916f <sigalrmhandler+0x23>
  809159:	48 8d 3d 14 14 00 00 	lea    0x1414(%rip),%rdi        # 80a574 <_IO_stdin_used+0x464>
  809160:	e8 5b 7b bf ff       	callq  400cc0 <puts@plt>
  809165:	b8 00 00 00 00       	mov    $0x0,%eax
  80916a:	e8 3a fb ff ff       	callq  808ca9 <check_fail>
  80916f:	ba 05 00 00 00       	mov    $0x5,%edx
  809174:	48 8d 35 95 15 00 00 	lea    0x1595(%rip),%rsi        # 80a710 <_IO_stdin_used+0x600>
  80917b:	bf 01 00 00 00       	mov    $0x1,%edi
  809180:	b8 00 00 00 00       	mov    $0x0,%eax
  809185:	e8 56 7c bf ff       	callq  400de0 <__printf_chk@plt>
  80918a:	be 00 00 00 00       	mov    $0x0,%esi
  80918f:	bf 00 00 00 00       	mov    $0x0,%edi
  809194:	e8 9a fb ff ff       	callq  808d33 <notify_server>
  809199:	bf 01 00 00 00       	mov    $0x1,%edi
  80919e:	e8 7d 7c bf ff       	callq  400e20 <exit@plt>

00000000008091a3 <launch>:
  8091a3:	55                   	push   %rbp
  8091a4:	48 89 e5             	mov    %rsp,%rbp
  8091a7:	48 83 ec 10          	sub    $0x10,%rsp
  8091ab:	48 89 fa             	mov    %rdi,%rdx
  8091ae:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  8091b5:	00 00 
  8091b7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8091bb:	31 c0                	xor    %eax,%eax
  8091bd:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  8091c1:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  8091c5:	48 29 c4             	sub    %rax,%rsp
  8091c8:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  8091cd:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  8091d1:	be f4 00 00 00       	mov    $0xf4,%esi
  8091d6:	e8 25 7b bf ff       	callq  400d00 <memset@plt>
  8091db:	48 8b 05 be 32 20 00 	mov    0x2032be(%rip),%rax        # a0c4a0 <stdin@@GLIBC_2.2.5>
  8091e2:	48 39 05 07 33 20 00 	cmp    %rax,0x203307(%rip)        # a0c4f0 <infile>
  8091e9:	74 3a                	je     809225 <launch+0x82>
  8091eb:	c7 05 07 33 20 00 00 	movl   $0x0,0x203307(%rip)        # a0c4fc <vlevel>
  8091f2:	00 00 00 
  8091f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8091fa:	e8 ea f8 ff ff       	callq  808ae9 <test>
  8091ff:	83 3d 02 33 20 00 00 	cmpl   $0x0,0x203302(%rip)        # a0c508 <is_checker>
  809206:	75 35                	jne    80923d <launch+0x9a>
  809208:	48 8d 3d 85 13 00 00 	lea    0x1385(%rip),%rdi        # 80a594 <_IO_stdin_used+0x484>
  80920f:	e8 ac 7a bf ff       	callq  400cc0 <puts@plt>
  809214:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  809218:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  80921f:	00 00 
  809221:	75 30                	jne    809253 <launch+0xb0>
  809223:	c9                   	leaveq 
  809224:	c3                   	retq   
  809225:	48 8d 35 50 13 00 00 	lea    0x1350(%rip),%rsi        # 80a57c <_IO_stdin_used+0x46c>
  80922c:	bf 01 00 00 00       	mov    $0x1,%edi
  809231:	b8 00 00 00 00       	mov    $0x0,%eax
  809236:	e8 a5 7b bf ff       	callq  400de0 <__printf_chk@plt>
  80923b:	eb ae                	jmp    8091eb <launch+0x48>
  80923d:	48 8d 3d 45 13 00 00 	lea    0x1345(%rip),%rdi        # 80a589 <_IO_stdin_used+0x479>
  809244:	e8 77 7a bf ff       	callq  400cc0 <puts@plt>
  809249:	b8 00 00 00 00       	mov    $0x0,%eax
  80924e:	e8 56 fa ff ff       	callq  808ca9 <check_fail>
  809253:	e8 88 7a bf ff       	callq  400ce0 <__stack_chk_fail@plt>

0000000000809258 <stable_launch>:
  809258:	53                   	push   %rbx
  809259:	48 89 3d 88 32 20 00 	mov    %rdi,0x203288(%rip)        # a0c4e8 <global_offset>
  809260:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  809266:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80926c:	b9 32 01 00 00       	mov    $0x132,%ecx
  809271:	ba 07 00 00 00       	mov    $0x7,%edx
  809276:	be 00 00 10 00       	mov    $0x100000,%esi
  80927b:	bf 00 60 58 55       	mov    $0x55586000,%edi
  809280:	e8 6b 7a bf ff       	callq  400cf0 <mmap@plt>
  809285:	48 89 c3             	mov    %rax,%rbx
  809288:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  80928e:	75 43                	jne    8092d3 <stable_launch+0x7b>
  809290:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  809297:	48 89 15 8a 3e 20 00 	mov    %rdx,0x203e8a(%rip)        # a0d128 <stack_top>
  80929e:	48 89 e0             	mov    %rsp,%rax
  8092a1:	48 89 d4             	mov    %rdx,%rsp
  8092a4:	48 89 c2             	mov    %rax,%rdx
  8092a7:	48 89 15 32 32 20 00 	mov    %rdx,0x203232(%rip)        # a0c4e0 <global_save_stack>
  8092ae:	48 8b 3d 33 32 20 00 	mov    0x203233(%rip),%rdi        # a0c4e8 <global_offset>
  8092b5:	e8 e9 fe ff ff       	callq  8091a3 <launch>
  8092ba:	48 8b 05 1f 32 20 00 	mov    0x20321f(%rip),%rax        # a0c4e0 <global_save_stack>
  8092c1:	48 89 c4             	mov    %rax,%rsp
  8092c4:	be 00 00 10 00       	mov    $0x100000,%esi
  8092c9:	48 89 df             	mov    %rbx,%rdi
  8092cc:	e8 ff 7a bf ff       	callq  400dd0 <munmap@plt>
  8092d1:	5b                   	pop    %rbx
  8092d2:	c3                   	retq   
  8092d3:	be 00 00 10 00       	mov    $0x100000,%esi
  8092d8:	48 89 c7             	mov    %rax,%rdi
  8092db:	e8 f0 7a bf ff       	callq  400dd0 <munmap@plt>
  8092e0:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  8092e5:	48 8d 15 5c 14 00 00 	lea    0x145c(%rip),%rdx        # 80a748 <_IO_stdin_used+0x638>
  8092ec:	be 01 00 00 00       	mov    $0x1,%esi
  8092f1:	48 8b 3d c8 31 20 00 	mov    0x2031c8(%rip),%rdi        # a0c4c0 <stderr@@GLIBC_2.2.5>
  8092f8:	b8 00 00 00 00       	mov    $0x0,%eax
  8092fd:	e8 3e 7b bf ff       	callq  400e40 <__fprintf_chk@plt>
  809302:	bf 01 00 00 00       	mov    $0x1,%edi
  809307:	e8 14 7b bf ff       	callq  400e20 <exit@plt>

000000000080930c <rio_readinitb>:
  80930c:	89 37                	mov    %esi,(%rdi)
  80930e:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  809315:	48 8d 47 10          	lea    0x10(%rdi),%rax
  809319:	48 89 47 08          	mov    %rax,0x8(%rdi)
  80931d:	c3                   	retq   

000000000080931e <sigalrm_handler>:
  80931e:	48 83 ec 08          	sub    $0x8,%rsp
  809322:	b9 00 00 00 00       	mov    $0x0,%ecx
  809327:	48 8d 15 52 14 00 00 	lea    0x1452(%rip),%rdx        # 80a780 <trans_char+0x10>
  80932e:	be 01 00 00 00       	mov    $0x1,%esi
  809333:	48 8b 3d 86 31 20 00 	mov    0x203186(%rip),%rdi        # a0c4c0 <stderr@@GLIBC_2.2.5>
  80933a:	b8 00 00 00 00       	mov    $0x0,%eax
  80933f:	e8 fc 7a bf ff       	callq  400e40 <__fprintf_chk@plt>
  809344:	bf 01 00 00 00       	mov    $0x1,%edi
  809349:	e8 d2 7a bf ff       	callq  400e20 <exit@plt>

000000000080934e <rio_writen>:
  80934e:	41 55                	push   %r13
  809350:	41 54                	push   %r12
  809352:	55                   	push   %rbp
  809353:	53                   	push   %rbx
  809354:	48 83 ec 08          	sub    $0x8,%rsp
  809358:	41 89 fc             	mov    %edi,%r12d
  80935b:	48 89 f5             	mov    %rsi,%rbp
  80935e:	49 89 d5             	mov    %rdx,%r13
  809361:	48 89 d3             	mov    %rdx,%rbx
  809364:	eb 06                	jmp    80936c <rio_writen+0x1e>
  809366:	48 29 c3             	sub    %rax,%rbx
  809369:	48 01 c5             	add    %rax,%rbp
  80936c:	48 85 db             	test   %rbx,%rbx
  80936f:	74 24                	je     809395 <rio_writen+0x47>
  809371:	48 89 da             	mov    %rbx,%rdx
  809374:	48 89 ee             	mov    %rbp,%rsi
  809377:	44 89 e7             	mov    %r12d,%edi
  80937a:	e8 51 79 bf ff       	callq  400cd0 <write@plt>
  80937f:	48 85 c0             	test   %rax,%rax
  809382:	7f e2                	jg     809366 <rio_writen+0x18>
  809384:	e8 f7 78 bf ff       	callq  400c80 <__errno_location@plt>
  809389:	83 38 04             	cmpl   $0x4,(%rax)
  80938c:	75 15                	jne    8093a3 <rio_writen+0x55>
  80938e:	b8 00 00 00 00       	mov    $0x0,%eax
  809393:	eb d1                	jmp    809366 <rio_writen+0x18>
  809395:	4c 89 e8             	mov    %r13,%rax
  809398:	48 83 c4 08          	add    $0x8,%rsp
  80939c:	5b                   	pop    %rbx
  80939d:	5d                   	pop    %rbp
  80939e:	41 5c                	pop    %r12
  8093a0:	41 5d                	pop    %r13
  8093a2:	c3                   	retq   
  8093a3:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  8093aa:	eb ec                	jmp    809398 <rio_writen+0x4a>

00000000008093ac <rio_read>:
  8093ac:	41 55                	push   %r13
  8093ae:	41 54                	push   %r12
  8093b0:	55                   	push   %rbp
  8093b1:	53                   	push   %rbx
  8093b2:	48 83 ec 08          	sub    $0x8,%rsp
  8093b6:	48 89 fb             	mov    %rdi,%rbx
  8093b9:	49 89 f5             	mov    %rsi,%r13
  8093bc:	49 89 d4             	mov    %rdx,%r12
  8093bf:	eb 0a                	jmp    8093cb <rio_read+0x1f>
  8093c1:	e8 ba 78 bf ff       	callq  400c80 <__errno_location@plt>
  8093c6:	83 38 04             	cmpl   $0x4,(%rax)
  8093c9:	75 5c                	jne    809427 <rio_read+0x7b>
  8093cb:	8b 6b 04             	mov    0x4(%rbx),%ebp
  8093ce:	85 ed                	test   %ebp,%ebp
  8093d0:	7f 24                	jg     8093f6 <rio_read+0x4a>
  8093d2:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  8093d6:	8b 3b                	mov    (%rbx),%edi
  8093d8:	ba 00 20 00 00       	mov    $0x2000,%edx
  8093dd:	48 89 ee             	mov    %rbp,%rsi
  8093e0:	e8 4b 79 bf ff       	callq  400d30 <read@plt>
  8093e5:	89 43 04             	mov    %eax,0x4(%rbx)
  8093e8:	85 c0                	test   %eax,%eax
  8093ea:	78 d5                	js     8093c1 <rio_read+0x15>
  8093ec:	85 c0                	test   %eax,%eax
  8093ee:	74 40                	je     809430 <rio_read+0x84>
  8093f0:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  8093f4:	eb d5                	jmp    8093cb <rio_read+0x1f>
  8093f6:	89 e8                	mov    %ebp,%eax
  8093f8:	4c 39 e0             	cmp    %r12,%rax
  8093fb:	72 03                	jb     809400 <rio_read+0x54>
  8093fd:	44 89 e5             	mov    %r12d,%ebp
  809400:	4c 63 e5             	movslq %ebp,%r12
  809403:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  809407:	4c 89 e2             	mov    %r12,%rdx
  80940a:	4c 89 ef             	mov    %r13,%rdi
  80940d:	e8 6e 79 bf ff       	callq  400d80 <memcpy@plt>
  809412:	4c 01 63 08          	add    %r12,0x8(%rbx)
  809416:	29 6b 04             	sub    %ebp,0x4(%rbx)
  809419:	4c 89 e0             	mov    %r12,%rax
  80941c:	48 83 c4 08          	add    $0x8,%rsp
  809420:	5b                   	pop    %rbx
  809421:	5d                   	pop    %rbp
  809422:	41 5c                	pop    %r12
  809424:	41 5d                	pop    %r13
  809426:	c3                   	retq   
  809427:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  80942e:	eb ec                	jmp    80941c <rio_read+0x70>
  809430:	b8 00 00 00 00       	mov    $0x0,%eax
  809435:	eb e5                	jmp    80941c <rio_read+0x70>

0000000000809437 <rio_readlineb>:
  809437:	41 55                	push   %r13
  809439:	41 54                	push   %r12
  80943b:	55                   	push   %rbp
  80943c:	53                   	push   %rbx
  80943d:	48 83 ec 18          	sub    $0x18,%rsp
  809441:	49 89 fd             	mov    %rdi,%r13
  809444:	48 89 f5             	mov    %rsi,%rbp
  809447:	49 89 d4             	mov    %rdx,%r12
  80944a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  809451:	00 00 
  809453:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  809458:	31 c0                	xor    %eax,%eax
  80945a:	bb 01 00 00 00       	mov    $0x1,%ebx
  80945f:	4c 39 e3             	cmp    %r12,%rbx
  809462:	73 47                	jae    8094ab <rio_readlineb+0x74>
  809464:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  809469:	ba 01 00 00 00       	mov    $0x1,%edx
  80946e:	4c 89 ef             	mov    %r13,%rdi
  809471:	e8 36 ff ff ff       	callq  8093ac <rio_read>
  809476:	83 f8 01             	cmp    $0x1,%eax
  809479:	75 1c                	jne    809497 <rio_readlineb+0x60>
  80947b:	48 8d 45 01          	lea    0x1(%rbp),%rax
  80947f:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  809484:	88 55 00             	mov    %dl,0x0(%rbp)
  809487:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  80948c:	74 1a                	je     8094a8 <rio_readlineb+0x71>
  80948e:	48 83 c3 01          	add    $0x1,%rbx
  809492:	48 89 c5             	mov    %rax,%rbp
  809495:	eb c8                	jmp    80945f <rio_readlineb+0x28>
  809497:	85 c0                	test   %eax,%eax
  809499:	75 32                	jne    8094cd <rio_readlineb+0x96>
  80949b:	48 83 fb 01          	cmp    $0x1,%rbx
  80949f:	75 0a                	jne    8094ab <rio_readlineb+0x74>
  8094a1:	b8 00 00 00 00       	mov    $0x0,%eax
  8094a6:	eb 0a                	jmp    8094b2 <rio_readlineb+0x7b>
  8094a8:	48 89 c5             	mov    %rax,%rbp
  8094ab:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  8094af:	48 89 d8             	mov    %rbx,%rax
  8094b2:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  8094b7:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  8094be:	00 00 
  8094c0:	75 14                	jne    8094d6 <rio_readlineb+0x9f>
  8094c2:	48 83 c4 18          	add    $0x18,%rsp
  8094c6:	5b                   	pop    %rbx
  8094c7:	5d                   	pop    %rbp
  8094c8:	41 5c                	pop    %r12
  8094ca:	41 5d                	pop    %r13
  8094cc:	c3                   	retq   
  8094cd:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  8094d4:	eb dc                	jmp    8094b2 <rio_readlineb+0x7b>
  8094d6:	e8 05 78 bf ff       	callq  400ce0 <__stack_chk_fail@plt>

00000000008094db <urlencode>:
  8094db:	41 54                	push   %r12
  8094dd:	55                   	push   %rbp
  8094de:	53                   	push   %rbx
  8094df:	48 83 ec 10          	sub    $0x10,%rsp
  8094e3:	48 89 fb             	mov    %rdi,%rbx
  8094e6:	48 89 f5             	mov    %rsi,%rbp
  8094e9:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  8094f0:	00 00 
  8094f2:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  8094f7:	31 c0                	xor    %eax,%eax
  8094f9:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  809500:	f2 ae                	repnz scas %es:(%rdi),%al
  809502:	48 89 ce             	mov    %rcx,%rsi
  809505:	48 f7 d6             	not    %rsi
  809508:	8d 46 ff             	lea    -0x1(%rsi),%eax
  80950b:	eb 0f                	jmp    80951c <urlencode+0x41>
  80950d:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  809511:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  809515:	48 83 c3 01          	add    $0x1,%rbx
  809519:	44 89 e0             	mov    %r12d,%eax
  80951c:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  809520:	85 c0                	test   %eax,%eax
  809522:	0f 84 a8 00 00 00    	je     8095d0 <urlencode+0xf5>
  809528:	44 0f b6 03          	movzbl (%rbx),%r8d
  80952c:	41 80 f8 2a          	cmp    $0x2a,%r8b
  809530:	0f 94 c2             	sete   %dl
  809533:	41 80 f8 2d          	cmp    $0x2d,%r8b
  809537:	0f 94 c0             	sete   %al
  80953a:	08 c2                	or     %al,%dl
  80953c:	75 cf                	jne    80950d <urlencode+0x32>
  80953e:	41 80 f8 2e          	cmp    $0x2e,%r8b
  809542:	74 c9                	je     80950d <urlencode+0x32>
  809544:	41 80 f8 5f          	cmp    $0x5f,%r8b
  809548:	74 c3                	je     80950d <urlencode+0x32>
  80954a:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  80954e:	3c 09                	cmp    $0x9,%al
  809550:	76 bb                	jbe    80950d <urlencode+0x32>
  809552:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  809556:	3c 19                	cmp    $0x19,%al
  809558:	76 b3                	jbe    80950d <urlencode+0x32>
  80955a:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  80955e:	3c 19                	cmp    $0x19,%al
  809560:	76 ab                	jbe    80950d <urlencode+0x32>
  809562:	41 80 f8 20          	cmp    $0x20,%r8b
  809566:	74 56                	je     8095be <urlencode+0xe3>
  809568:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  80956c:	3c 5f                	cmp    $0x5f,%al
  80956e:	0f 96 c2             	setbe  %dl
  809571:	41 80 f8 09          	cmp    $0x9,%r8b
  809575:	0f 94 c0             	sete   %al
  809578:	08 c2                	or     %al,%dl
  80957a:	74 4f                	je     8095cb <urlencode+0xf0>
  80957c:	48 89 e7             	mov    %rsp,%rdi
  80957f:	45 0f b6 c0          	movzbl %r8b,%r8d
  809583:	48 8d 0d 8e 12 00 00 	lea    0x128e(%rip),%rcx        # 80a818 <trans_char+0xa8>
  80958a:	ba 08 00 00 00       	mov    $0x8,%edx
  80958f:	be 01 00 00 00       	mov    $0x1,%esi
  809594:	b8 00 00 00 00       	mov    $0x0,%eax
  809599:	e8 b2 78 bf ff       	callq  400e50 <__sprintf_chk@plt>
  80959e:	0f b6 04 24          	movzbl (%rsp),%eax
  8095a2:	88 45 00             	mov    %al,0x0(%rbp)
  8095a5:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  8095aa:	88 45 01             	mov    %al,0x1(%rbp)
  8095ad:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  8095b2:	88 45 02             	mov    %al,0x2(%rbp)
  8095b5:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  8095b9:	e9 57 ff ff ff       	jmpq   809515 <urlencode+0x3a>
  8095be:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  8095c2:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  8095c6:	e9 4a ff ff ff       	jmpq   809515 <urlencode+0x3a>
  8095cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8095d0:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  8095d5:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  8095dc:	00 00 
  8095de:	75 09                	jne    8095e9 <urlencode+0x10e>
  8095e0:	48 83 c4 10          	add    $0x10,%rsp
  8095e4:	5b                   	pop    %rbx
  8095e5:	5d                   	pop    %rbp
  8095e6:	41 5c                	pop    %r12
  8095e8:	c3                   	retq   
  8095e9:	e8 f2 76 bf ff       	callq  400ce0 <__stack_chk_fail@plt>

00000000008095ee <submitr>:
  8095ee:	41 57                	push   %r15
  8095f0:	41 56                	push   %r14
  8095f2:	41 55                	push   %r13
  8095f4:	41 54                	push   %r12
  8095f6:	55                   	push   %rbp
  8095f7:	53                   	push   %rbx
  8095f8:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
  8095ff:	49 89 fd             	mov    %rdi,%r13
  809602:	89 74 24 14          	mov    %esi,0x14(%rsp)
  809606:	49 89 d7             	mov    %rdx,%r15
  809609:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  80960e:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  809613:	4d 89 ce             	mov    %r9,%r14
  809616:	48 8b ac 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbp
  80961d:	00 
  80961e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  809625:	00 00 
  809627:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
  80962e:	00 
  80962f:	31 c0                	xor    %eax,%eax
  809631:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
  809638:	00 
  809639:	ba 00 00 00 00       	mov    $0x0,%edx
  80963e:	be 01 00 00 00       	mov    $0x1,%esi
  809643:	bf 02 00 00 00       	mov    $0x2,%edi
  809648:	e8 13 78 bf ff       	callq  400e60 <socket@plt>
  80964d:	85 c0                	test   %eax,%eax
  80964f:	0f 88 a9 02 00 00    	js     8098fe <submitr+0x310>
  809655:	89 c3                	mov    %eax,%ebx
  809657:	4c 89 ef             	mov    %r13,%rdi
  80965a:	e8 f1 76 bf ff       	callq  400d50 <gethostbyname@plt>
  80965f:	48 85 c0             	test   %rax,%rax
  809662:	0f 84 e2 02 00 00    	je     80994a <submitr+0x35c>
  809668:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
  80966d:	48 c7 44 24 32 00 00 	movq   $0x0,0x32(%rsp)
  809674:	00 00 
  809676:	c7 44 24 3a 00 00 00 	movl   $0x0,0x3a(%rsp)
  80967d:	00 
  80967e:	66 c7 44 24 3e 00 00 	movw   $0x0,0x3e(%rsp)
  809685:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
  80968c:	48 63 50 14          	movslq 0x14(%rax),%rdx
  809690:	48 8b 40 18          	mov    0x18(%rax),%rax
  809694:	48 8b 30             	mov    (%rax),%rsi
  809697:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
  80969c:	b9 0c 00 00 00       	mov    $0xc,%ecx
  8096a1:	e8 ba 76 bf ff       	callq  400d60 <__memmove_chk@plt>
  8096a6:	0f b7 44 24 14       	movzwl 0x14(%rsp),%eax
  8096ab:	66 c1 c8 08          	ror    $0x8,%ax
  8096af:	66 89 44 24 32       	mov    %ax,0x32(%rsp)
  8096b4:	ba 10 00 00 00       	mov    $0x10,%edx
  8096b9:	4c 89 e6             	mov    %r12,%rsi
  8096bc:	89 df                	mov    %ebx,%edi
  8096be:	e8 6d 77 bf ff       	callq  400e30 <connect@plt>
  8096c3:	85 c0                	test   %eax,%eax
  8096c5:	0f 88 e7 02 00 00    	js     8099b2 <submitr+0x3c4>
  8096cb:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  8096d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8096d7:	48 89 f1             	mov    %rsi,%rcx
  8096da:	4c 89 f7             	mov    %r14,%rdi
  8096dd:	f2 ae                	repnz scas %es:(%rdi),%al
  8096df:	48 89 ca             	mov    %rcx,%rdx
  8096e2:	48 f7 d2             	not    %rdx
  8096e5:	48 89 f1             	mov    %rsi,%rcx
  8096e8:	4c 89 ff             	mov    %r15,%rdi
  8096eb:	f2 ae                	repnz scas %es:(%rdi),%al
  8096ed:	48 f7 d1             	not    %rcx
  8096f0:	49 89 c8             	mov    %rcx,%r8
  8096f3:	48 89 f1             	mov    %rsi,%rcx
  8096f6:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  8096fb:	f2 ae                	repnz scas %es:(%rdi),%al
  8096fd:	48 f7 d1             	not    %rcx
  809700:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  809705:	48 89 f1             	mov    %rsi,%rcx
  809708:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  80970d:	f2 ae                	repnz scas %es:(%rdi),%al
  80970f:	48 89 c8             	mov    %rcx,%rax
  809712:	48 f7 d0             	not    %rax
  809715:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  80971a:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  80971f:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  809726:	00 
  809727:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  80972d:	0f 87 d9 02 00 00    	ja     809a0c <submitr+0x41e>
  809733:	48 8d b4 24 50 40 00 	lea    0x4050(%rsp),%rsi
  80973a:	00 
  80973b:	b9 00 04 00 00       	mov    $0x400,%ecx
  809740:	b8 00 00 00 00       	mov    $0x0,%eax
  809745:	48 89 f7             	mov    %rsi,%rdi
  809748:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  80974b:	4c 89 f7             	mov    %r14,%rdi
  80974e:	e8 88 fd ff ff       	callq  8094db <urlencode>
  809753:	85 c0                	test   %eax,%eax
  809755:	0f 88 24 03 00 00    	js     809a7f <submitr+0x491>
  80975b:	4c 8d a4 24 50 20 00 	lea    0x2050(%rsp),%r12
  809762:	00 
  809763:	41 55                	push   %r13
  809765:	48 8d 84 24 58 40 00 	lea    0x4058(%rsp),%rax
  80976c:	00 
  80976d:	50                   	push   %rax
  80976e:	4d 89 f9             	mov    %r15,%r9
  809771:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
  809776:	48 8d 0d 2b 10 00 00 	lea    0x102b(%rip),%rcx        # 80a7a8 <trans_char+0x38>
  80977d:	ba 00 20 00 00       	mov    $0x2000,%edx
  809782:	be 01 00 00 00       	mov    $0x1,%esi
  809787:	4c 89 e7             	mov    %r12,%rdi
  80978a:	b8 00 00 00 00       	mov    $0x0,%eax
  80978f:	e8 bc 76 bf ff       	callq  400e50 <__sprintf_chk@plt>
  809794:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  80979b:	b8 00 00 00 00       	mov    $0x0,%eax
  8097a0:	4c 89 e7             	mov    %r12,%rdi
  8097a3:	f2 ae                	repnz scas %es:(%rdi),%al
  8097a5:	48 89 ca             	mov    %rcx,%rdx
  8097a8:	48 f7 d2             	not    %rdx
  8097ab:	48 8d 52 ff          	lea    -0x1(%rdx),%rdx
  8097af:	4c 89 e6             	mov    %r12,%rsi
  8097b2:	89 df                	mov    %ebx,%edi
  8097b4:	e8 95 fb ff ff       	callq  80934e <rio_writen>
  8097b9:	48 83 c4 10          	add    $0x10,%rsp
  8097bd:	48 85 c0             	test   %rax,%rax
  8097c0:	0f 88 44 03 00 00    	js     809b0a <submitr+0x51c>
  8097c6:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
  8097cb:	89 de                	mov    %ebx,%esi
  8097cd:	4c 89 e7             	mov    %r12,%rdi
  8097d0:	e8 37 fb ff ff       	callq  80930c <rio_readinitb>
  8097d5:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  8097dc:	00 
  8097dd:	ba 00 20 00 00       	mov    $0x2000,%edx
  8097e2:	4c 89 e7             	mov    %r12,%rdi
  8097e5:	e8 4d fc ff ff       	callq  809437 <rio_readlineb>
  8097ea:	48 85 c0             	test   %rax,%rax
  8097ed:	0f 8e 86 03 00 00    	jle    809b79 <submitr+0x58b>
  8097f3:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
  8097f8:	48 8d 94 24 50 60 00 	lea    0x6050(%rsp),%rdx
  8097ff:	00 
  809800:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
  809807:	00 
  809808:	4c 8d 84 24 50 80 00 	lea    0x8050(%rsp),%r8
  80980f:	00 
  809810:	48 8d 35 08 10 00 00 	lea    0x1008(%rip),%rsi        # 80a81f <trans_char+0xaf>
  809817:	b8 00 00 00 00       	mov    $0x0,%eax
  80981c:	e8 9f 75 bf ff       	callq  400dc0 <__isoc99_sscanf@plt>
  809821:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  809828:	00 
  809829:	b9 03 00 00 00       	mov    $0x3,%ecx
  80982e:	48 8d 3d 01 10 00 00 	lea    0x1001(%rip),%rdi        # 80a836 <trans_char+0xc6>
  809835:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  809837:	0f 97 c0             	seta   %al
  80983a:	1c 00                	sbb    $0x0,%al
  80983c:	84 c0                	test   %al,%al
  80983e:	0f 84 b3 03 00 00    	je     809bf7 <submitr+0x609>
  809844:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  80984b:	00 
  80984c:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  809851:	ba 00 20 00 00       	mov    $0x2000,%edx
  809856:	e8 dc fb ff ff       	callq  809437 <rio_readlineb>
  80985b:	48 85 c0             	test   %rax,%rax
  80985e:	7f c1                	jg     809821 <submitr+0x233>
  809860:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  809867:	3a 20 43 
  80986a:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  809871:	20 75 6e 
  809874:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809878:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  80987c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809883:	74 6f 20 
  809886:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
  80988d:	68 65 61 
  809890:	48 89 45 10          	mov    %rax,0x10(%rbp)
  809894:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809898:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  80989f:	66 72 6f 
  8098a2:	48 ba 6d 20 74 68 65 	movabs $0x657220656874206d,%rdx
  8098a9:	20 72 65 
  8098ac:	48 89 45 20          	mov    %rax,0x20(%rbp)
  8098b0:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  8098b4:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  8098bb:	73 65 72 
  8098be:	48 89 45 30          	mov    %rax,0x30(%rbp)
  8098c2:	c7 45 38 76 65 72 00 	movl   $0x726576,0x38(%rbp)
  8098c9:	89 df                	mov    %ebx,%edi
  8098cb:	e8 50 74 bf ff       	callq  400d20 <close@plt>
  8098d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8098d5:	48 8b 9c 24 58 a0 00 	mov    0xa058(%rsp),%rbx
  8098dc:	00 
  8098dd:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  8098e4:	00 00 
  8098e6:	0f 85 7e 04 00 00    	jne    809d6a <submitr+0x77c>
  8098ec:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
  8098f3:	5b                   	pop    %rbx
  8098f4:	5d                   	pop    %rbp
  8098f5:	41 5c                	pop    %r12
  8098f7:	41 5d                	pop    %r13
  8098f9:	41 5e                	pop    %r14
  8098fb:	41 5f                	pop    %r15
  8098fd:	c3                   	retq   
  8098fe:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  809905:	3a 20 43 
  809908:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  80990f:	20 75 6e 
  809912:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809916:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  80991a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809921:	74 6f 20 
  809924:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  80992b:	65 20 73 
  80992e:	48 89 45 10          	mov    %rax,0x10(%rbp)
  809932:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809936:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  80993d:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  809943:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809948:	eb 8b                	jmp    8098d5 <submitr+0x2e7>
  80994a:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  809951:	3a 20 44 
  809954:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  80995b:	20 75 6e 
  80995e:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809962:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809966:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  80996d:	74 6f 20 
  809970:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  809977:	76 65 20 
  80997a:	48 89 45 10          	mov    %rax,0x10(%rbp)
  80997e:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809982:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  809989:	72 20 61 
  80998c:	48 89 45 20          	mov    %rax,0x20(%rbp)
  809990:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  809997:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  80999d:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  8099a1:	89 df                	mov    %ebx,%edi
  8099a3:	e8 78 73 bf ff       	callq  400d20 <close@plt>
  8099a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8099ad:	e9 23 ff ff ff       	jmpq   8098d5 <submitr+0x2e7>
  8099b2:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  8099b9:	3a 20 55 
  8099bc:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  8099c3:	20 74 6f 
  8099c6:	48 89 45 00          	mov    %rax,0x0(%rbp)
  8099ca:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  8099ce:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  8099d5:	65 63 74 
  8099d8:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
  8099df:	68 65 20 
  8099e2:	48 89 45 10          	mov    %rax,0x10(%rbp)
  8099e6:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  8099ea:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
  8099f1:	66 c7 45 24 65 72    	movw   $0x7265,0x24(%rbp)
  8099f7:	c6 45 26 00          	movb   $0x0,0x26(%rbp)
  8099fb:	89 df                	mov    %ebx,%edi
  8099fd:	e8 1e 73 bf ff       	callq  400d20 <close@plt>
  809a02:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809a07:	e9 c9 fe ff ff       	jmpq   8098d5 <submitr+0x2e7>
  809a0c:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  809a13:	3a 20 52 
  809a16:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  809a1d:	20 73 74 
  809a20:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809a24:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809a28:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  809a2f:	74 6f 6f 
  809a32:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
  809a39:	65 2e 20 
  809a3c:	48 89 45 10          	mov    %rax,0x10(%rbp)
  809a40:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809a44:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  809a4b:	61 73 65 
  809a4e:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
  809a55:	49 54 52 
  809a58:	48 89 45 20          	mov    %rax,0x20(%rbp)
  809a5c:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  809a60:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  809a67:	55 46 00 
  809a6a:	48 89 45 30          	mov    %rax,0x30(%rbp)
  809a6e:	89 df                	mov    %ebx,%edi
  809a70:	e8 ab 72 bf ff       	callq  400d20 <close@plt>
  809a75:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809a7a:	e9 56 fe ff ff       	jmpq   8098d5 <submitr+0x2e7>
  809a7f:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  809a86:	3a 20 52 
  809a89:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  809a90:	20 73 74 
  809a93:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809a97:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809a9b:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  809aa2:	63 6f 6e 
  809aa5:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
  809aac:	20 61 6e 
  809aaf:	48 89 45 10          	mov    %rax,0x10(%rbp)
  809ab3:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809ab7:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  809abe:	67 61 6c 
  809ac1:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
  809ac8:	6e 70 72 
  809acb:	48 89 45 20          	mov    %rax,0x20(%rbp)
  809acf:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  809ad3:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  809ada:	6c 65 20 
  809add:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
  809ae4:	63 74 65 
  809ae7:	48 89 45 30          	mov    %rax,0x30(%rbp)
  809aeb:	48 89 55 38          	mov    %rdx,0x38(%rbp)
  809aef:	66 c7 45 40 72 2e    	movw   $0x2e72,0x40(%rbp)
  809af5:	c6 45 42 00          	movb   $0x0,0x42(%rbp)
  809af9:	89 df                	mov    %ebx,%edi
  809afb:	e8 20 72 bf ff       	callq  400d20 <close@plt>
  809b00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809b05:	e9 cb fd ff ff       	jmpq   8098d5 <submitr+0x2e7>
  809b0a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  809b11:	3a 20 43 
  809b14:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  809b1b:	20 75 6e 
  809b1e:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809b22:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809b26:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809b2d:	74 6f 20 
  809b30:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
  809b37:	20 74 6f 
  809b3a:	48 89 45 10          	mov    %rax,0x10(%rbp)
  809b3e:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809b42:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  809b49:	72 65 73 
  809b4c:	48 ba 75 6c 74 20 73 	movabs $0x7672657320746c75,%rdx
  809b53:	65 72 76 
  809b56:	48 89 45 20          	mov    %rax,0x20(%rbp)
  809b5a:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  809b5e:	66 c7 45 30 65 72    	movw   $0x7265,0x30(%rbp)
  809b64:	c6 45 32 00          	movb   $0x0,0x32(%rbp)
  809b68:	89 df                	mov    %ebx,%edi
  809b6a:	e8 b1 71 bf ff       	callq  400d20 <close@plt>
  809b6f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809b74:	e9 5c fd ff ff       	jmpq   8098d5 <submitr+0x2e7>
  809b79:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  809b80:	3a 20 43 
  809b83:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  809b8a:	20 75 6e 
  809b8d:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809b91:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809b95:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809b9c:	74 6f 20 
  809b9f:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
  809ba6:	66 69 72 
  809ba9:	48 89 45 10          	mov    %rax,0x10(%rbp)
  809bad:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809bb1:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  809bb8:	61 64 65 
  809bbb:	48 ba 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rdx
  809bc2:	6d 20 72 
  809bc5:	48 89 45 20          	mov    %rax,0x20(%rbp)
  809bc9:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  809bcd:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  809bd4:	20 73 65 
  809bd7:	48 89 45 30          	mov    %rax,0x30(%rbp)
  809bdb:	c7 45 38 72 76 65 72 	movl   $0x72657672,0x38(%rbp)
  809be2:	c6 45 3c 00          	movb   $0x0,0x3c(%rbp)
  809be6:	89 df                	mov    %ebx,%edi
  809be8:	e8 33 71 bf ff       	callq  400d20 <close@plt>
  809bed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809bf2:	e9 de fc ff ff       	jmpq   8098d5 <submitr+0x2e7>
  809bf7:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  809bfe:	00 
  809bff:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  809c04:	ba 00 20 00 00       	mov    $0x2000,%edx
  809c09:	e8 29 f8 ff ff       	callq  809437 <rio_readlineb>
  809c0e:	48 85 c0             	test   %rax,%rax
  809c11:	0f 8e 96 00 00 00    	jle    809cad <submitr+0x6bf>
  809c17:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
  809c1c:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  809c23:	0f 85 08 01 00 00    	jne    809d31 <submitr+0x743>
  809c29:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  809c30:	00 
  809c31:	48 89 ef             	mov    %rbp,%rdi
  809c34:	e8 77 70 bf ff       	callq  400cb0 <strcpy@plt>
  809c39:	89 df                	mov    %ebx,%edi
  809c3b:	e8 e0 70 bf ff       	callq  400d20 <close@plt>
  809c40:	b9 04 00 00 00       	mov    $0x4,%ecx
  809c45:	48 8d 3d e4 0b 00 00 	lea    0xbe4(%rip),%rdi        # 80a830 <trans_char+0xc0>
  809c4c:	48 89 ee             	mov    %rbp,%rsi
  809c4f:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  809c51:	0f 97 c0             	seta   %al
  809c54:	1c 00                	sbb    $0x0,%al
  809c56:	0f be c0             	movsbl %al,%eax
  809c59:	85 c0                	test   %eax,%eax
  809c5b:	0f 84 74 fc ff ff    	je     8098d5 <submitr+0x2e7>
  809c61:	b9 05 00 00 00       	mov    $0x5,%ecx
  809c66:	48 8d 3d c7 0b 00 00 	lea    0xbc7(%rip),%rdi        # 80a834 <trans_char+0xc4>
  809c6d:	48 89 ee             	mov    %rbp,%rsi
  809c70:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  809c72:	0f 97 c0             	seta   %al
  809c75:	1c 00                	sbb    $0x0,%al
  809c77:	0f be c0             	movsbl %al,%eax
  809c7a:	85 c0                	test   %eax,%eax
  809c7c:	0f 84 53 fc ff ff    	je     8098d5 <submitr+0x2e7>
  809c82:	b9 03 00 00 00       	mov    $0x3,%ecx
  809c87:	48 8d 3d ab 0b 00 00 	lea    0xbab(%rip),%rdi        # 80a839 <trans_char+0xc9>
  809c8e:	48 89 ee             	mov    %rbp,%rsi
  809c91:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  809c93:	0f 97 c0             	seta   %al
  809c96:	1c 00                	sbb    $0x0,%al
  809c98:	0f be c0             	movsbl %al,%eax
  809c9b:	85 c0                	test   %eax,%eax
  809c9d:	0f 84 32 fc ff ff    	je     8098d5 <submitr+0x2e7>
  809ca3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809ca8:	e9 28 fc ff ff       	jmpq   8098d5 <submitr+0x2e7>
  809cad:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  809cb4:	3a 20 43 
  809cb7:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  809cbe:	20 75 6e 
  809cc1:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809cc5:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809cc9:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809cd0:	74 6f 20 
  809cd3:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
  809cda:	73 74 61 
  809cdd:	48 89 45 10          	mov    %rax,0x10(%rbp)
  809ce1:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809ce5:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  809cec:	65 73 73 
  809cef:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
  809cf6:	72 6f 6d 
  809cf9:	48 89 45 20          	mov    %rax,0x20(%rbp)
  809cfd:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  809d01:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  809d08:	6c 74 20 
  809d0b:	48 89 45 30          	mov    %rax,0x30(%rbp)
  809d0f:	c7 45 38 73 65 72 76 	movl   $0x76726573,0x38(%rbp)
  809d16:	66 c7 45 3c 65 72    	movw   $0x7265,0x3c(%rbp)
  809d1c:	c6 45 3e 00          	movb   $0x0,0x3e(%rbp)
  809d20:	89 df                	mov    %ebx,%edi
  809d22:	e8 f9 6f bf ff       	callq  400d20 <close@plt>
  809d27:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809d2c:	e9 a4 fb ff ff       	jmpq   8098d5 <submitr+0x2e7>
  809d31:	4c 8d 8c 24 50 80 00 	lea    0x8050(%rsp),%r9
  809d38:	00 
  809d39:	48 8d 0d a8 0a 00 00 	lea    0xaa8(%rip),%rcx        # 80a7e8 <trans_char+0x78>
  809d40:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  809d47:	be 01 00 00 00       	mov    $0x1,%esi
  809d4c:	48 89 ef             	mov    %rbp,%rdi
  809d4f:	b8 00 00 00 00       	mov    $0x0,%eax
  809d54:	e8 f7 70 bf ff       	callq  400e50 <__sprintf_chk@plt>
  809d59:	89 df                	mov    %ebx,%edi
  809d5b:	e8 c0 6f bf ff       	callq  400d20 <close@plt>
  809d60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809d65:	e9 6b fb ff ff       	jmpq   8098d5 <submitr+0x2e7>
  809d6a:	e8 71 6f bf ff       	callq  400ce0 <__stack_chk_fail@plt>

0000000000809d6f <init_timeout>:
  809d6f:	85 ff                	test   %edi,%edi
  809d71:	74 28                	je     809d9b <init_timeout+0x2c>
  809d73:	53                   	push   %rbx
  809d74:	89 fb                	mov    %edi,%ebx
  809d76:	85 ff                	test   %edi,%edi
  809d78:	78 1a                	js     809d94 <init_timeout+0x25>
  809d7a:	48 8d 35 9d f5 ff ff 	lea    -0xa63(%rip),%rsi        # 80931e <sigalrm_handler>
  809d81:	bf 0e 00 00 00       	mov    $0xe,%edi
  809d86:	e8 b5 6f bf ff       	callq  400d40 <signal@plt>
  809d8b:	89 df                	mov    %ebx,%edi
  809d8d:	e8 7e 6f bf ff       	callq  400d10 <alarm@plt>
  809d92:	5b                   	pop    %rbx
  809d93:	c3                   	retq   
  809d94:	bb 00 00 00 00       	mov    $0x0,%ebx
  809d99:	eb df                	jmp    809d7a <init_timeout+0xb>
  809d9b:	f3 c3                	repz retq 

0000000000809d9d <init_driver>:
  809d9d:	41 54                	push   %r12
  809d9f:	55                   	push   %rbp
  809da0:	53                   	push   %rbx
  809da1:	48 83 ec 20          	sub    $0x20,%rsp
  809da5:	49 89 fc             	mov    %rdi,%r12
  809da8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  809daf:	00 00 
  809db1:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  809db6:	31 c0                	xor    %eax,%eax
  809db8:	be 01 00 00 00       	mov    $0x1,%esi
  809dbd:	bf 0d 00 00 00       	mov    $0xd,%edi
  809dc2:	e8 79 6f bf ff       	callq  400d40 <signal@plt>
  809dc7:	be 01 00 00 00       	mov    $0x1,%esi
  809dcc:	bf 1d 00 00 00       	mov    $0x1d,%edi
  809dd1:	e8 6a 6f bf ff       	callq  400d40 <signal@plt>
  809dd6:	be 01 00 00 00       	mov    $0x1,%esi
  809ddb:	bf 1d 00 00 00       	mov    $0x1d,%edi
  809de0:	e8 5b 6f bf ff       	callq  400d40 <signal@plt>
  809de5:	ba 00 00 00 00       	mov    $0x0,%edx
  809dea:	be 01 00 00 00       	mov    $0x1,%esi
  809def:	bf 02 00 00 00       	mov    $0x2,%edi
  809df4:	e8 67 70 bf ff       	callq  400e60 <socket@plt>
  809df9:	85 c0                	test   %eax,%eax
  809dfb:	0f 88 a3 00 00 00    	js     809ea4 <init_driver+0x107>
  809e01:	89 c3                	mov    %eax,%ebx
  809e03:	48 8d 3d 57 05 00 00 	lea    0x557(%rip),%rdi        # 80a361 <_IO_stdin_used+0x251>
  809e0a:	e8 41 6f bf ff       	callq  400d50 <gethostbyname@plt>
  809e0f:	48 85 c0             	test   %rax,%rax
  809e12:	0f 84 df 00 00 00    	je     809ef7 <init_driver+0x15a>
  809e18:	48 89 e5             	mov    %rsp,%rbp
  809e1b:	48 c7 44 24 02 00 00 	movq   $0x0,0x2(%rsp)
  809e22:	00 00 
  809e24:	c7 45 0a 00 00 00 00 	movl   $0x0,0xa(%rbp)
  809e2b:	66 c7 45 0e 00 00    	movw   $0x0,0xe(%rbp)
  809e31:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  809e37:	48 63 50 14          	movslq 0x14(%rax),%rdx
  809e3b:	48 8b 40 18          	mov    0x18(%rax),%rax
  809e3f:	48 8b 30             	mov    (%rax),%rsi
  809e42:	48 8d 7d 04          	lea    0x4(%rbp),%rdi
  809e46:	b9 0c 00 00 00       	mov    $0xc,%ecx
  809e4b:	e8 10 6f bf ff       	callq  400d60 <__memmove_chk@plt>
  809e50:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  809e57:	ba 10 00 00 00       	mov    $0x10,%edx
  809e5c:	48 89 ee             	mov    %rbp,%rsi
  809e5f:	89 df                	mov    %ebx,%edi
  809e61:	e8 ca 6f bf ff       	callq  400e30 <connect@plt>
  809e66:	85 c0                	test   %eax,%eax
  809e68:	0f 88 fb 00 00 00    	js     809f69 <init_driver+0x1cc>
  809e6e:	89 df                	mov    %ebx,%edi
  809e70:	e8 ab 6e bf ff       	callq  400d20 <close@plt>
  809e75:	66 41 c7 04 24 4f 4b 	movw   $0x4b4f,(%r12)
  809e7c:	41 c6 44 24 02 00    	movb   $0x0,0x2(%r12)
  809e82:	b8 00 00 00 00       	mov    $0x0,%eax
  809e87:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  809e8c:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  809e93:	00 00 
  809e95:	0f 85 28 01 00 00    	jne    809fc3 <init_driver+0x226>
  809e9b:	48 83 c4 20          	add    $0x20,%rsp
  809e9f:	5b                   	pop    %rbx
  809ea0:	5d                   	pop    %rbp
  809ea1:	41 5c                	pop    %r12
  809ea3:	c3                   	retq   
  809ea4:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  809eab:	3a 20 43 
  809eae:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  809eb5:	20 75 6e 
  809eb8:	49 89 04 24          	mov    %rax,(%r12)
  809ebc:	49 89 54 24 08       	mov    %rdx,0x8(%r12)
  809ec1:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809ec8:	74 6f 20 
  809ecb:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  809ed2:	65 20 73 
  809ed5:	49 89 44 24 10       	mov    %rax,0x10(%r12)
  809eda:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
  809edf:	41 c7 44 24 20 6f 63 	movl   $0x656b636f,0x20(%r12)
  809ee6:	6b 65 
  809ee8:	66 41 c7 44 24 24 74 	movw   $0x74,0x24(%r12)
  809eef:	00 
  809ef0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809ef5:	eb 90                	jmp    809e87 <init_driver+0xea>
  809ef7:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  809efe:	3a 20 44 
  809f01:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  809f08:	20 75 6e 
  809f0b:	49 89 04 24          	mov    %rax,(%r12)
  809f0f:	49 89 54 24 08       	mov    %rdx,0x8(%r12)
  809f14:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809f1b:	74 6f 20 
  809f1e:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  809f25:	76 65 20 
  809f28:	49 89 44 24 10       	mov    %rax,0x10(%r12)
  809f2d:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
  809f32:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  809f39:	72 20 61 
  809f3c:	49 89 44 24 20       	mov    %rax,0x20(%r12)
  809f41:	41 c7 44 24 28 64 64 	movl   $0x65726464,0x28(%r12)
  809f48:	72 65 
  809f4a:	66 41 c7 44 24 2c 73 	movw   $0x7373,0x2c(%r12)
  809f51:	73 
  809f52:	41 c6 44 24 2e 00    	movb   $0x0,0x2e(%r12)
  809f58:	89 df                	mov    %ebx,%edi
  809f5a:	e8 c1 6d bf ff       	callq  400d20 <close@plt>
  809f5f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809f64:	e9 1e ff ff ff       	jmpq   809e87 <init_driver+0xea>
  809f69:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  809f70:	3a 20 55 
  809f73:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  809f7a:	20 74 6f 
  809f7d:	49 89 04 24          	mov    %rax,(%r12)
  809f81:	49 89 54 24 08       	mov    %rdx,0x8(%r12)
  809f86:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  809f8d:	65 63 74 
  809f90:	48 ba 20 74 6f 20 73 	movabs $0x76726573206f7420,%rdx
  809f97:	65 72 76 
  809f9a:	49 89 44 24 10       	mov    %rax,0x10(%r12)
  809f9f:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
  809fa4:	66 41 c7 44 24 20 65 	movw   $0x7265,0x20(%r12)
  809fab:	72 
  809fac:	41 c6 44 24 22 00    	movb   $0x0,0x22(%r12)
  809fb2:	89 df                	mov    %ebx,%edi
  809fb4:	e8 67 6d bf ff       	callq  400d20 <close@plt>
  809fb9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809fbe:	e9 c4 fe ff ff       	jmpq   809e87 <init_driver+0xea>
  809fc3:	e8 18 6d bf ff       	callq  400ce0 <__stack_chk_fail@plt>

0000000000809fc8 <driver_post>:
  809fc8:	53                   	push   %rbx
  809fc9:	4c 89 cb             	mov    %r9,%rbx
  809fcc:	45 85 c0             	test   %r8d,%r8d
  809fcf:	75 18                	jne    809fe9 <driver_post+0x21>
  809fd1:	48 85 ff             	test   %rdi,%rdi
  809fd4:	74 05                	je     809fdb <driver_post+0x13>
  809fd6:	80 3f 00             	cmpb   $0x0,(%rdi)
  809fd9:	75 37                	jne    80a012 <driver_post+0x4a>
  809fdb:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  809fe0:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  809fe4:	44 89 c0             	mov    %r8d,%eax
  809fe7:	5b                   	pop    %rbx
  809fe8:	c3                   	retq   
  809fe9:	48 89 ca             	mov    %rcx,%rdx
  809fec:	48 8d 35 49 08 00 00 	lea    0x849(%rip),%rsi        # 80a83c <trans_char+0xcc>
  809ff3:	bf 01 00 00 00       	mov    $0x1,%edi
  809ff8:	b8 00 00 00 00       	mov    $0x0,%eax
  809ffd:	e8 de 6d bf ff       	callq  400de0 <__printf_chk@plt>
  80a002:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  80a007:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  80a00b:	b8 00 00 00 00       	mov    $0x0,%eax
  80a010:	eb d5                	jmp    809fe7 <driver_post+0x1f>
  80a012:	48 83 ec 08          	sub    $0x8,%rsp
  80a016:	41 51                	push   %r9
  80a018:	49 89 c9             	mov    %rcx,%r9
  80a01b:	49 89 d0             	mov    %rdx,%r8
  80a01e:	48 89 f9             	mov    %rdi,%rcx
  80a021:	48 89 f2             	mov    %rsi,%rdx
  80a024:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  80a029:	48 8d 3d 31 03 00 00 	lea    0x331(%rip),%rdi        # 80a361 <_IO_stdin_used+0x251>
  80a030:	e8 b9 f5 ff ff       	callq  8095ee <submitr>
  80a035:	48 83 c4 10          	add    $0x10,%rsp
  80a039:	eb ac                	jmp    809fe7 <driver_post+0x1f>

000000000080a03b <check>:
  80a03b:	89 f8                	mov    %edi,%eax
  80a03d:	c1 e8 1c             	shr    $0x1c,%eax
  80a040:	85 c0                	test   %eax,%eax
  80a042:	74 1d                	je     80a061 <check+0x26>
  80a044:	b9 00 00 00 00       	mov    $0x0,%ecx
  80a049:	83 f9 1f             	cmp    $0x1f,%ecx
  80a04c:	7f 0d                	jg     80a05b <check+0x20>
  80a04e:	89 f8                	mov    %edi,%eax
  80a050:	d3 e8                	shr    %cl,%eax
  80a052:	3c 0a                	cmp    $0xa,%al
  80a054:	74 11                	je     80a067 <check+0x2c>
  80a056:	83 c1 08             	add    $0x8,%ecx
  80a059:	eb ee                	jmp    80a049 <check+0xe>
  80a05b:	b8 01 00 00 00       	mov    $0x1,%eax
  80a060:	c3                   	retq   
  80a061:	b8 00 00 00 00       	mov    $0x0,%eax
  80a066:	c3                   	retq   
  80a067:	b8 00 00 00 00       	mov    $0x0,%eax
  80a06c:	c3                   	retq   

000000000080a06d <gencookie>:
  80a06d:	53                   	push   %rbx
  80a06e:	83 c7 01             	add    $0x1,%edi
  80a071:	e8 1a 6c bf ff       	callq  400c90 <srandom@plt>
  80a076:	e8 25 6d bf ff       	callq  400da0 <random@plt>
  80a07b:	89 c3                	mov    %eax,%ebx
  80a07d:	89 c7                	mov    %eax,%edi
  80a07f:	e8 b7 ff ff ff       	callq  80a03b <check>
  80a084:	85 c0                	test   %eax,%eax
  80a086:	74 ee                	je     80a076 <gencookie+0x9>
  80a088:	89 d8                	mov    %ebx,%eax
  80a08a:	5b                   	pop    %rbx
  80a08b:	c3                   	retq   
  80a08c:	0f 1f 40 00          	nopl   0x0(%rax)

000000000080a090 <__libc_csu_init>:
  80a090:	41 57                	push   %r15
  80a092:	41 56                	push   %r14
  80a094:	49 89 d7             	mov    %rdx,%r15
  80a097:	41 55                	push   %r13
  80a099:	41 54                	push   %r12
  80a09b:	4c 8d 25 6e 1d 20 00 	lea    0x201d6e(%rip),%r12        # a0be10 <__frame_dummy_init_array_entry>
  80a0a2:	55                   	push   %rbp
  80a0a3:	48 8d 2d 6e 1d 20 00 	lea    0x201d6e(%rip),%rbp        # a0be18 <__do_global_dtors_aux_fini_array_entry>
  80a0aa:	53                   	push   %rbx
  80a0ab:	41 89 fd             	mov    %edi,%r13d
  80a0ae:	49 89 f6             	mov    %rsi,%r14
  80a0b1:	4c 29 e5             	sub    %r12,%rbp
  80a0b4:	48 83 ec 08          	sub    $0x8,%rsp
  80a0b8:	48 c1 fd 03          	sar    $0x3,%rbp
  80a0bc:	e8 87 6b bf ff       	callq  400c48 <_init>
  80a0c1:	48 85 ed             	test   %rbp,%rbp
  80a0c4:	74 20                	je     80a0e6 <__libc_csu_init+0x56>
  80a0c6:	31 db                	xor    %ebx,%ebx
  80a0c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  80a0cf:	00 
  80a0d0:	4c 89 fa             	mov    %r15,%rdx
  80a0d3:	4c 89 f6             	mov    %r14,%rsi
  80a0d6:	44 89 ef             	mov    %r13d,%edi
  80a0d9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  80a0dd:	48 83 c3 01          	add    $0x1,%rbx
  80a0e1:	48 39 dd             	cmp    %rbx,%rbp
  80a0e4:	75 ea                	jne    80a0d0 <__libc_csu_init+0x40>
  80a0e6:	48 83 c4 08          	add    $0x8,%rsp
  80a0ea:	5b                   	pop    %rbx
  80a0eb:	5d                   	pop    %rbp
  80a0ec:	41 5c                	pop    %r12
  80a0ee:	41 5d                	pop    %r13
  80a0f0:	41 5e                	pop    %r14
  80a0f2:	41 5f                	pop    %r15
  80a0f4:	c3                   	retq   
  80a0f5:	90                   	nop
  80a0f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  80a0fd:	00 00 00 

000000000080a100 <__libc_csu_fini>:
  80a100:	f3 c3                	repz retq 

Disassembly of section .init:

0000000000400c48 <_init>:
  400c48:	48 83 ec 08          	sub    $0x8,%rsp
  400c4c:	48 8b 05 a5 b3 60 00 	mov    0x60b3a5(%rip),%rax        # a0bff8 <__gmon_start__>
  400c53:	48 85 c0             	test   %rax,%rax
  400c56:	74 02                	je     400c5a <_init+0x12>
  400c58:	ff d0                	callq  *%rax
  400c5a:	48 83 c4 08          	add    $0x8,%rsp
  400c5e:	c3                   	retq   

Disassembly of section .plt:

0000000000400c60 <.plt>:
  400c60:	ff 35 a2 b3 60 00    	pushq  0x60b3a2(%rip)        # a0c008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400c66:	ff 25 a4 b3 60 00    	jmpq   *0x60b3a4(%rip)        # a0c010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400c6c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400c70 <__snprintf_chk@plt>:
  400c70:	ff 25 a2 b3 60 00    	jmpq   *0x60b3a2(%rip)        # a0c018 <__snprintf_chk@GLIBC_2.3.4>
  400c76:	68 00 00 00 00       	pushq  $0x0
  400c7b:	e9 e0 ff ff ff       	jmpq   400c60 <.plt>

0000000000400c80 <__errno_location@plt>:
  400c80:	ff 25 9a b3 60 00    	jmpq   *0x60b39a(%rip)        # a0c020 <__errno_location@GLIBC_2.2.5>
  400c86:	68 01 00 00 00       	pushq  $0x1
  400c8b:	e9 d0 ff ff ff       	jmpq   400c60 <.plt>

0000000000400c90 <srandom@plt>:
  400c90:	ff 25 92 b3 60 00    	jmpq   *0x60b392(%rip)        # a0c028 <srandom@GLIBC_2.2.5>
  400c96:	68 02 00 00 00       	pushq  $0x2
  400c9b:	e9 c0 ff ff ff       	jmpq   400c60 <.plt>

0000000000400ca0 <strncmp@plt>:
  400ca0:	ff 25 8a b3 60 00    	jmpq   *0x60b38a(%rip)        # a0c030 <strncmp@GLIBC_2.2.5>
  400ca6:	68 03 00 00 00       	pushq  $0x3
  400cab:	e9 b0 ff ff ff       	jmpq   400c60 <.plt>

0000000000400cb0 <strcpy@plt>:
  400cb0:	ff 25 82 b3 60 00    	jmpq   *0x60b382(%rip)        # a0c038 <strcpy@GLIBC_2.2.5>
  400cb6:	68 04 00 00 00       	pushq  $0x4
  400cbb:	e9 a0 ff ff ff       	jmpq   400c60 <.plt>

0000000000400cc0 <puts@plt>:
  400cc0:	ff 25 7a b3 60 00    	jmpq   *0x60b37a(%rip)        # a0c040 <puts@GLIBC_2.2.5>
  400cc6:	68 05 00 00 00       	pushq  $0x5
  400ccb:	e9 90 ff ff ff       	jmpq   400c60 <.plt>

0000000000400cd0 <write@plt>:
  400cd0:	ff 25 72 b3 60 00    	jmpq   *0x60b372(%rip)        # a0c048 <write@GLIBC_2.2.5>
  400cd6:	68 06 00 00 00       	pushq  $0x6
  400cdb:	e9 80 ff ff ff       	jmpq   400c60 <.plt>

0000000000400ce0 <__stack_chk_fail@plt>:
  400ce0:	ff 25 6a b3 60 00    	jmpq   *0x60b36a(%rip)        # a0c050 <__stack_chk_fail@GLIBC_2.4>
  400ce6:	68 07 00 00 00       	pushq  $0x7
  400ceb:	e9 70 ff ff ff       	jmpq   400c60 <.plt>

0000000000400cf0 <mmap@plt>:
  400cf0:	ff 25 62 b3 60 00    	jmpq   *0x60b362(%rip)        # a0c058 <mmap@GLIBC_2.2.5>
  400cf6:	68 08 00 00 00       	pushq  $0x8
  400cfb:	e9 60 ff ff ff       	jmpq   400c60 <.plt>

0000000000400d00 <memset@plt>:
  400d00:	ff 25 5a b3 60 00    	jmpq   *0x60b35a(%rip)        # a0c060 <memset@GLIBC_2.2.5>
  400d06:	68 09 00 00 00       	pushq  $0x9
  400d0b:	e9 50 ff ff ff       	jmpq   400c60 <.plt>

0000000000400d10 <alarm@plt>:
  400d10:	ff 25 52 b3 60 00    	jmpq   *0x60b352(%rip)        # a0c068 <alarm@GLIBC_2.2.5>
  400d16:	68 0a 00 00 00       	pushq  $0xa
  400d1b:	e9 40 ff ff ff       	jmpq   400c60 <.plt>

0000000000400d20 <close@plt>:
  400d20:	ff 25 4a b3 60 00    	jmpq   *0x60b34a(%rip)        # a0c070 <close@GLIBC_2.2.5>
  400d26:	68 0b 00 00 00       	pushq  $0xb
  400d2b:	e9 30 ff ff ff       	jmpq   400c60 <.plt>

0000000000400d30 <read@plt>:
  400d30:	ff 25 42 b3 60 00    	jmpq   *0x60b342(%rip)        # a0c078 <read@GLIBC_2.2.5>
  400d36:	68 0c 00 00 00       	pushq  $0xc
  400d3b:	e9 20 ff ff ff       	jmpq   400c60 <.plt>

0000000000400d40 <signal@plt>:
  400d40:	ff 25 3a b3 60 00    	jmpq   *0x60b33a(%rip)        # a0c080 <signal@GLIBC_2.2.5>
  400d46:	68 0d 00 00 00       	pushq  $0xd
  400d4b:	e9 10 ff ff ff       	jmpq   400c60 <.plt>

0000000000400d50 <gethostbyname@plt>:
  400d50:	ff 25 32 b3 60 00    	jmpq   *0x60b332(%rip)        # a0c088 <gethostbyname@GLIBC_2.2.5>
  400d56:	68 0e 00 00 00       	pushq  $0xe
  400d5b:	e9 00 ff ff ff       	jmpq   400c60 <.plt>

0000000000400d60 <__memmove_chk@plt>:
  400d60:	ff 25 2a b3 60 00    	jmpq   *0x60b32a(%rip)        # a0c090 <__memmove_chk@GLIBC_2.3.4>
  400d66:	68 0f 00 00 00       	pushq  $0xf
  400d6b:	e9 f0 fe ff ff       	jmpq   400c60 <.plt>

0000000000400d70 <strtol@plt>:
  400d70:	ff 25 22 b3 60 00    	jmpq   *0x60b322(%rip)        # a0c098 <strtol@GLIBC_2.2.5>
  400d76:	68 10 00 00 00       	pushq  $0x10
  400d7b:	e9 e0 fe ff ff       	jmpq   400c60 <.plt>

0000000000400d80 <memcpy@plt>:
  400d80:	ff 25 1a b3 60 00    	jmpq   *0x60b31a(%rip)        # a0c0a0 <memcpy@GLIBC_2.14>
  400d86:	68 11 00 00 00       	pushq  $0x11
  400d8b:	e9 d0 fe ff ff       	jmpq   400c60 <.plt>

0000000000400d90 <time@plt>:
  400d90:	ff 25 12 b3 60 00    	jmpq   *0x60b312(%rip)        # a0c0a8 <time@GLIBC_2.2.5>
  400d96:	68 12 00 00 00       	pushq  $0x12
  400d9b:	e9 c0 fe ff ff       	jmpq   400c60 <.plt>

0000000000400da0 <random@plt>:
  400da0:	ff 25 0a b3 60 00    	jmpq   *0x60b30a(%rip)        # a0c0b0 <random@GLIBC_2.2.5>
  400da6:	68 13 00 00 00       	pushq  $0x13
  400dab:	e9 b0 fe ff ff       	jmpq   400c60 <.plt>

0000000000400db0 <_IO_getc@plt>:
  400db0:	ff 25 02 b3 60 00    	jmpq   *0x60b302(%rip)        # a0c0b8 <_IO_getc@GLIBC_2.2.5>
  400db6:	68 14 00 00 00       	pushq  $0x14
  400dbb:	e9 a0 fe ff ff       	jmpq   400c60 <.plt>

0000000000400dc0 <__isoc99_sscanf@plt>:
  400dc0:	ff 25 fa b2 60 00    	jmpq   *0x60b2fa(%rip)        # a0c0c0 <__isoc99_sscanf@GLIBC_2.7>
  400dc6:	68 15 00 00 00       	pushq  $0x15
  400dcb:	e9 90 fe ff ff       	jmpq   400c60 <.plt>

0000000000400dd0 <munmap@plt>:
  400dd0:	ff 25 f2 b2 60 00    	jmpq   *0x60b2f2(%rip)        # a0c0c8 <munmap@GLIBC_2.2.5>
  400dd6:	68 16 00 00 00       	pushq  $0x16
  400ddb:	e9 80 fe ff ff       	jmpq   400c60 <.plt>

0000000000400de0 <__printf_chk@plt>:
  400de0:	ff 25 ea b2 60 00    	jmpq   *0x60b2ea(%rip)        # a0c0d0 <__printf_chk@GLIBC_2.3.4>
  400de6:	68 17 00 00 00       	pushq  $0x17
  400deb:	e9 70 fe ff ff       	jmpq   400c60 <.plt>

0000000000400df0 <fopen@plt>:
  400df0:	ff 25 e2 b2 60 00    	jmpq   *0x60b2e2(%rip)        # a0c0d8 <fopen@GLIBC_2.2.5>
  400df6:	68 18 00 00 00       	pushq  $0x18
  400dfb:	e9 60 fe ff ff       	jmpq   400c60 <.plt>

0000000000400e00 <getopt@plt>:
  400e00:	ff 25 da b2 60 00    	jmpq   *0x60b2da(%rip)        # a0c0e0 <getopt@GLIBC_2.2.5>
  400e06:	68 19 00 00 00       	pushq  $0x19
  400e0b:	e9 50 fe ff ff       	jmpq   400c60 <.plt>

0000000000400e10 <strtoul@plt>:
  400e10:	ff 25 d2 b2 60 00    	jmpq   *0x60b2d2(%rip)        # a0c0e8 <strtoul@GLIBC_2.2.5>
  400e16:	68 1a 00 00 00       	pushq  $0x1a
  400e1b:	e9 40 fe ff ff       	jmpq   400c60 <.plt>

0000000000400e20 <exit@plt>:
  400e20:	ff 25 ca b2 60 00    	jmpq   *0x60b2ca(%rip)        # a0c0f0 <exit@GLIBC_2.2.5>
  400e26:	68 1b 00 00 00       	pushq  $0x1b
  400e2b:	e9 30 fe ff ff       	jmpq   400c60 <.plt>

0000000000400e30 <connect@plt>:
  400e30:	ff 25 c2 b2 60 00    	jmpq   *0x60b2c2(%rip)        # a0c0f8 <connect@GLIBC_2.2.5>
  400e36:	68 1c 00 00 00       	pushq  $0x1c
  400e3b:	e9 20 fe ff ff       	jmpq   400c60 <.plt>

0000000000400e40 <__fprintf_chk@plt>:
  400e40:	ff 25 ba b2 60 00    	jmpq   *0x60b2ba(%rip)        # a0c100 <__fprintf_chk@GLIBC_2.3.4>
  400e46:	68 1d 00 00 00       	pushq  $0x1d
  400e4b:	e9 10 fe ff ff       	jmpq   400c60 <.plt>

0000000000400e50 <__sprintf_chk@plt>:
  400e50:	ff 25 b2 b2 60 00    	jmpq   *0x60b2b2(%rip)        # a0c108 <__sprintf_chk@GLIBC_2.3.4>
  400e56:	68 1e 00 00 00       	pushq  $0x1e
  400e5b:	e9 00 fe ff ff       	jmpq   400c60 <.plt>

0000000000400e60 <socket@plt>:
  400e60:	ff 25 aa b2 60 00    	jmpq   *0x60b2aa(%rip)        # a0c110 <socket@GLIBC_2.2.5>
  400e66:	68 1f 00 00 00       	pushq  $0x1f
  400e6b:	e9 f0 fd ff ff       	jmpq   400c60 <.plt>

Disassembly of section .fini:

000000000080a104 <_fini>:
  80a104:	48 83 ec 08          	sub    $0x8,%rsp
  80a108:	48 83 c4 08          	add    $0x8,%rsp
  80a10c:	c3                   	retq   
