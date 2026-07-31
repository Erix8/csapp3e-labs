
ctarget：     文件格式 elf64-x86-64


Disassembly of section .text:

0000000000808000 <_start>:
  808000:	31 ed                	xor    %ebp,%ebp
  808002:	49 89 d1             	mov    %rdx,%r9
  808005:	5e                   	pop    %rsi
  808006:	48 89 e2             	mov    %rsp,%rdx
  808009:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  80800d:	50                   	push   %rax
  80800e:	54                   	push   %rsp
  80800f:	49 c7 c0 e0 9f 80 00 	mov    $0x809fe0,%r8
  808016:	48 c7 c1 70 9f 80 00 	mov    $0x809f70,%rcx
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
  8080f7:	48 8d 35 fa 1e 00 00 	lea    0x1efa(%rip),%rsi        # 809ff8 <_IO_stdin_used+0x8>
  8080fe:	bf 01 00 00 00       	mov    $0x1,%edi
  808103:	b8 00 00 00 00       	mov    $0x0,%eax
  808108:	e8 d3 8c bf ff       	callq  400de0 <__printf_chk@plt>
  80810d:	48 8d 3d 1c 1f 00 00 	lea    0x1f1c(%rip),%rdi        # 80a030 <_IO_stdin_used+0x40>
  808114:	e8 a7 8b bf ff       	callq  400cc0 <puts@plt>
  808119:	48 8d 3d 10 20 00 00 	lea    0x2010(%rip),%rdi        # 80a130 <_IO_stdin_used+0x140>
  808120:	e8 9b 8b bf ff       	callq  400cc0 <puts@plt>
  808125:	48 8d 3d 2c 1f 00 00 	lea    0x1f2c(%rip),%rdi        # 80a058 <_IO_stdin_used+0x68>
  80812c:	e8 8f 8b bf ff       	callq  400cc0 <puts@plt>
  808131:	48 8d 3d 12 20 00 00 	lea    0x2012(%rip),%rdi        # 80a14a <_IO_stdin_used+0x15a>
  808138:	e8 83 8b bf ff       	callq  400cc0 <puts@plt>
  80813d:	bf 00 00 00 00       	mov    $0x0,%edi
  808142:	e8 d9 8c bf ff       	callq  400e20 <exit@plt>
  808147:	48 8d 35 18 20 00 00 	lea    0x2018(%rip),%rsi        # 80a166 <_IO_stdin_used+0x176>
  80814e:	bf 01 00 00 00       	mov    $0x1,%edi
  808153:	b8 00 00 00 00       	mov    $0x0,%eax
  808158:	e8 83 8c bf ff       	callq  400de0 <__printf_chk@plt>
  80815d:	48 8d 3d 1c 1f 00 00 	lea    0x1f1c(%rip),%rdi        # 80a080 <_IO_stdin_used+0x90>
  808164:	e8 57 8b bf ff       	callq  400cc0 <puts@plt>
  808169:	48 8d 3d 38 1f 00 00 	lea    0x1f38(%rip),%rdi        # 80a0a8 <_IO_stdin_used+0xb8>
  808170:	e8 4b 8b bf ff       	callq  400cc0 <puts@plt>
  808175:	48 8d 3d 08 20 00 00 	lea    0x2008(%rip),%rdi        # 80a184 <_IO_stdin_used+0x194>
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
  8081ad:	e8 96 1d 00 00       	callq  809f48 <gencookie>
  8081b2:	89 05 4c 43 20 00    	mov    %eax,0x20434c(%rip)        # a0c504 <cookie>
  8081b8:	89 c7                	mov    %eax,%edi
  8081ba:	e8 89 1d 00 00       	callq  809f48 <gencookie>
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
  8081ff:	c6 05 2a 4f 20 00 63 	movb   $0x63,0x204f2a(%rip)        # a0d130 <target_prefix>
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
  808250:	e8 23 1a 00 00       	callq  809c78 <init_driver>
  808255:	85 c0                	test   %eax,%eax
  808257:	79 bf                	jns    808218 <initialize_target+0x95>
  808259:	48 89 e2             	mov    %rsp,%rdx
  80825c:	48 8d 35 75 1e 00 00 	lea    0x1e75(%rip),%rsi        # 80a0d8 <_IO_stdin_used+0xe8>
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
  80828f:	48 c7 c6 7f 8f 80 00 	mov    $0x808f7f,%rsi
  808296:	bf 0b 00 00 00       	mov    $0xb,%edi
  80829b:	e8 a0 8a bf ff       	callq  400d40 <signal@plt>
  8082a0:	48 c7 c6 2b 8f 80 00 	mov    $0x808f2b,%rsi
  8082a7:	bf 07 00 00 00       	mov    $0x7,%edi
  8082ac:	e8 8f 8a bf ff       	callq  400d40 <signal@plt>
  8082b1:	48 c7 c6 d3 8f 80 00 	mov    $0x808fd3,%rsi
  8082b8:	bf 04 00 00 00       	mov    $0x4,%edi
  8082bd:	e8 7e 8a bf ff       	callq  400d40 <signal@plt>
  8082c2:	83 3d 3f 42 20 00 00 	cmpl   $0x0,0x20423f(%rip)        # a0c508 <is_checker>
  8082c9:	75 26                	jne    8082f1 <main+0x70>
  8082cb:	48 8d 2d cb 1e 00 00 	lea    0x1ecb(%rip),%rbp        # 80a19d <_IO_stdin_used+0x1ad>
  8082d2:	48 8b 05 c7 41 20 00 	mov    0x2041c7(%rip),%rax        # a0c4a0 <stdin@@GLIBC_2.2.5>
  8082d9:	48 89 05 10 42 20 00 	mov    %rax,0x204210(%rip)        # a0c4f0 <infile>
  8082e0:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  8082e6:	41 be 00 00 00 00    	mov    $0x0,%r14d
  8082ec:	e9 8d 00 00 00       	jmpq   80837e <main+0xfd>
  8082f1:	48 c7 c6 27 90 80 00 	mov    $0x809027,%rsi
  8082f8:	bf 0e 00 00 00       	mov    $0xe,%edi
  8082fd:	e8 3e 8a bf ff       	callq  400d40 <signal@plt>
  808302:	bf 05 00 00 00       	mov    $0x5,%edi
  808307:	e8 04 8a bf ff       	callq  400d10 <alarm@plt>
  80830c:	48 8d 2d 8f 1e 00 00 	lea    0x1e8f(%rip),%rbp        # 80a1a2 <_IO_stdin_used+0x1b2>
  808313:	eb bd                	jmp    8082d2 <main+0x51>
  808315:	48 8b 3b             	mov    (%rbx),%rdi
  808318:	e8 ca fd ff ff       	callq  8080e7 <usage>
  80831d:	48 8d 35 f1 20 00 00 	lea    0x20f1(%rip),%rsi        # 80a415 <_IO_stdin_used+0x425>
  808324:	48 8b 3d 7d 41 20 00 	mov    0x20417d(%rip),%rdi        # a0c4a8 <optarg@@GLIBC_2.2.5>
  80832b:	e8 c0 8a bf ff       	callq  400df0 <fopen@plt>
  808330:	48 89 05 b9 41 20 00 	mov    %rax,0x2041b9(%rip)        # a0c4f0 <infile>
  808337:	48 85 c0             	test   %rax,%rax
  80833a:	75 42                	jne    80837e <main+0xfd>
  80833c:	48 8b 0d 65 41 20 00 	mov    0x204165(%rip),%rcx        # a0c4a8 <optarg@@GLIBC_2.2.5>
  808343:	48 8d 15 60 1e 00 00 	lea    0x1e60(%rip),%rdx        # 80a1aa <_IO_stdin_used+0x1ba>
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
  80839d:	48 8d 0d 44 1e 00 00 	lea    0x1e44(%rip),%rcx        # 80a1e8 <_IO_stdin_used+0x1f8>
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
  8083d4:	48 8d 35 ec 1d 00 00 	lea    0x1dec(%rip),%rsi        # 80a1c7 <_IO_stdin_used+0x1d7>
  8083db:	bf 01 00 00 00       	mov    $0x1,%edi
  8083e0:	b8 00 00 00 00       	mov    $0x0,%eax
  8083e5:	e8 f6 89 bf ff       	callq  400de0 <__printf_chk@plt>
  8083ea:	48 8b 3b             	mov    (%rbx),%rdi
  8083ed:	e8 f5 fc ff ff       	callq  8080e7 <usage>
  8083f2:	be 00 00 00 00       	mov    $0x0,%esi
  8083f7:	44 89 ef             	mov    %r13d,%edi
  8083fa:	e8 84 fd ff ff       	callq  808183 <initialize_target>
  8083ff:	83 3d 02 41 20 00 00 	cmpl   $0x0,0x204102(%rip)        # a0c508 <is_checker>
  808406:	74 09                	je     808411 <main+0x190>
  808408:	44 39 35 f1 40 20 00 	cmp    %r14d,0x2040f1(%rip)        # a0c500 <authkey>
  80840f:	75 36                	jne    808447 <main+0x1c6>
  808411:	8b 15 ed 40 20 00    	mov    0x2040ed(%rip),%edx        # a0c504 <cookie>
  808417:	48 8d 35 bc 1d 00 00 	lea    0x1dbc(%rip),%rsi        # 80a1da <_IO_stdin_used+0x1ea>
  80841e:	bf 01 00 00 00       	mov    $0x1,%edi
  808423:	b8 00 00 00 00       	mov    $0x0,%eax
  808428:	e8 b3 89 bf ff       	callq  400de0 <__printf_chk@plt>
  80842d:	48 8b 3d 5c 40 20 00 	mov    0x20405c(%rip),%rdi        # a0c490 <buf_offset>
  808434:	e8 fa 0c 00 00       	callq  809133 <stable_launch>
  808439:	b8 00 00 00 00       	mov    $0x0,%eax
  80843e:	5b                   	pop    %rbx
  80843f:	5d                   	pop    %rbp
  808440:	41 5c                	pop    %r12
  808442:	41 5d                	pop    %r13
  808444:	41 5e                	pop    %r14
  808446:	c3                   	retq   
  808447:	44 89 f2             	mov    %r14d,%edx
  80844a:	48 8d 35 af 1c 00 00 	lea    0x1caf(%rip),%rsi        # 80a100 <_IO_stdin_used+0x110>
  808451:	bf 01 00 00 00       	mov    $0x1,%edi
  808456:	b8 00 00 00 00       	mov    $0x0,%eax
  80845b:	e8 80 89 bf ff       	callq  400de0 <__printf_chk@plt>
  808460:	b8 00 00 00 00       	mov    $0x0,%eax
  808465:	e8 1a 07 00 00       	callq  808b84 <check_fail>
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
  808923:	e8 94 02 00 00       	callq  808bbc <Gets>
  808928:	b8 01 00 00 00       	mov    $0x1,%eax
  80892d:	48 83 c4 38          	add    $0x38,%rsp
  808931:	c3                   	retq   

0000000000808932 <touch1>:
  808932:	48 83 ec 08          	sub    $0x8,%rsp
  808936:	c7 05 bc 3b 20 00 01 	movl   $0x1,0x203bbc(%rip)        # a0c4fc <vlevel>
  80893d:	00 00 00 
  808940:	48 8d 3d 24 19 00 00 	lea    0x1924(%rip),%rdi        # 80a26b <_IO_stdin_used+0x27b>
  808947:	e8 74 83 bf ff       	callq  400cc0 <puts@plt>
  80894c:	bf 01 00 00 00       	mov    $0x1,%edi
  808951:	e8 dd 04 00 00       	callq  808e33 <validate>
  808956:	bf 00 00 00 00       	mov    $0x0,%edi
  80895b:	e8 c0 84 bf ff       	callq  400e20 <exit@plt>

0000000000808960 <touch2>:
  808960:	48 83 ec 08          	sub    $0x8,%rsp
  808964:	89 fa                	mov    %edi,%edx
  808966:	c7 05 8c 3b 20 00 02 	movl   $0x2,0x203b8c(%rip)        # a0c4fc <vlevel>
  80896d:	00 00 00 
  808970:	39 3d 8e 3b 20 00    	cmp    %edi,0x203b8e(%rip)        # a0c504 <cookie>
  808976:	74 2a                	je     8089a2 <touch2+0x42>
  808978:	48 8d 35 39 19 00 00 	lea    0x1939(%rip),%rsi        # 80a2b8 <_IO_stdin_used+0x2c8>
  80897f:	bf 01 00 00 00       	mov    $0x1,%edi
  808984:	b8 00 00 00 00       	mov    $0x0,%eax
  808989:	e8 52 84 bf ff       	callq  400de0 <__printf_chk@plt>
  80898e:	bf 02 00 00 00       	mov    $0x2,%edi
  808993:	e8 6b 05 00 00       	callq  808f03 <fail>
  808998:	bf 00 00 00 00       	mov    $0x0,%edi
  80899d:	e8 7e 84 bf ff       	callq  400e20 <exit@plt>
  8089a2:	48 8d 35 e7 18 00 00 	lea    0x18e7(%rip),%rsi        # 80a290 <_IO_stdin_used+0x2a0>
  8089a9:	bf 01 00 00 00       	mov    $0x1,%edi
  8089ae:	b8 00 00 00 00       	mov    $0x0,%eax
  8089b3:	e8 28 84 bf ff       	callq  400de0 <__printf_chk@plt>
  8089b8:	bf 02 00 00 00       	mov    $0x2,%edi
  8089bd:	e8 71 04 00 00       	callq  808e33 <validate>
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
  808a21:	48 8d 0d 60 18 00 00 	lea    0x1860(%rip),%rcx        # 80a288 <_IO_stdin_used+0x298>
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
  808a9a:	48 8d 35 3f 18 00 00 	lea    0x183f(%rip),%rsi        # 80a2e0 <_IO_stdin_used+0x2f0>
  808aa1:	bf 01 00 00 00       	mov    $0x1,%edi
  808aa6:	b8 00 00 00 00       	mov    $0x0,%eax
  808aab:	e8 30 83 bf ff       	callq  400de0 <__printf_chk@plt>
  808ab0:	bf 03 00 00 00       	mov    $0x3,%edi
  808ab5:	e8 79 03 00 00       	callq  808e33 <validate>
  808aba:	bf 00 00 00 00       	mov    $0x0,%edi
  808abf:	e8 5c 83 bf ff       	callq  400e20 <exit@plt>
  808ac4:	48 89 da             	mov    %rbx,%rdx
  808ac7:	48 8d 35 3a 18 00 00 	lea    0x183a(%rip),%rsi        # 80a308 <_IO_stdin_used+0x318>
  808ace:	bf 01 00 00 00       	mov    $0x1,%edi
  808ad3:	b8 00 00 00 00       	mov    $0x0,%eax
  808ad8:	e8 03 83 bf ff       	callq  400de0 <__printf_chk@plt>
  808add:	bf 03 00 00 00       	mov    $0x3,%edi
  808ae2:	e8 1c 04 00 00       	callq  808f03 <fail>
  808ae7:	eb d1                	jmp    808aba <touch3+0x43>

0000000000808ae9 <test>:
  808ae9:	48 83 ec 08          	sub    $0x8,%rsp
  808aed:	b8 00 00 00 00       	mov    $0x0,%eax
  808af2:	e8 25 fe ff ff       	callq  80891c <getbuf>
  808af7:	89 c2                	mov    %eax,%edx
  808af9:	48 8d 35 30 18 00 00 	lea    0x1830(%rip),%rsi        # 80a330 <_IO_stdin_used+0x340>
  808b00:	bf 01 00 00 00       	mov    $0x1,%edi
  808b05:	b8 00 00 00 00       	mov    $0x0,%eax
  808b0a:	e8 d1 82 bf ff       	callq  400de0 <__printf_chk@plt>
  808b0f:	48 83 c4 08          	add    $0x8,%rsp
  808b13:	c3                   	retq   

0000000000808b14 <save_char>:
  808b14:	8b 05 0a 46 20 00    	mov    0x20460a(%rip),%eax        # a0d124 <gets_cnt>
  808b1a:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  808b1f:	7f 4a                	jg     808b6b <save_char+0x57>
  808b21:	89 f9                	mov    %edi,%ecx
  808b23:	c0 e9 04             	shr    $0x4,%cl
  808b26:	8d 14 40             	lea    (%rax,%rax,2),%edx
  808b29:	4c 8d 05 20 1b 00 00 	lea    0x1b20(%rip),%r8        # 80a650 <trans_char>
  808b30:	83 e1 0f             	and    $0xf,%ecx
  808b33:	45 0f b6 0c 08       	movzbl (%r8,%rcx,1),%r9d
  808b38:	48 8d 0d e1 39 20 00 	lea    0x2039e1(%rip),%rcx        # a0c520 <gets_buf>
  808b3f:	48 63 f2             	movslq %edx,%rsi
  808b42:	44 88 0c 31          	mov    %r9b,(%rcx,%rsi,1)
  808b46:	8d 72 01             	lea    0x1(%rdx),%esi
  808b49:	83 e7 0f             	and    $0xf,%edi
  808b4c:	41 0f b6 3c 38       	movzbl (%r8,%rdi,1),%edi
  808b51:	48 63 f6             	movslq %esi,%rsi
  808b54:	40 88 3c 31          	mov    %dil,(%rcx,%rsi,1)
  808b58:	83 c2 02             	add    $0x2,%edx
  808b5b:	48 63 d2             	movslq %edx,%rdx
  808b5e:	c6 04 11 20          	movb   $0x20,(%rcx,%rdx,1)
  808b62:	83 c0 01             	add    $0x1,%eax
  808b65:	89 05 b9 45 20 00    	mov    %eax,0x2045b9(%rip)        # a0d124 <gets_cnt>
  808b6b:	f3 c3                	repz retq 

0000000000808b6d <save_term>:
  808b6d:	8b 05 b1 45 20 00    	mov    0x2045b1(%rip),%eax        # a0d124 <gets_cnt>
  808b73:	8d 04 40             	lea    (%rax,%rax,2),%eax
  808b76:	48 98                	cltq   
  808b78:	48 8d 15 a1 39 20 00 	lea    0x2039a1(%rip),%rdx        # a0c520 <gets_buf>
  808b7f:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  808b83:	c3                   	retq   

0000000000808b84 <check_fail>:
  808b84:	48 83 ec 08          	sub    $0x8,%rsp
  808b88:	0f be 15 a1 45 20 00 	movsbl 0x2045a1(%rip),%edx        # a0d130 <target_prefix>
  808b8f:	4c 8d 05 8a 39 20 00 	lea    0x20398a(%rip),%r8        # a0c520 <gets_buf>
  808b96:	8b 0d 5c 39 20 00    	mov    0x20395c(%rip),%ecx        # a0c4f8 <check_level>
  808b9c:	48 8d 35 b0 17 00 00 	lea    0x17b0(%rip),%rsi        # 80a353 <_IO_stdin_used+0x363>
  808ba3:	bf 01 00 00 00       	mov    $0x1,%edi
  808ba8:	b8 00 00 00 00       	mov    $0x0,%eax
  808bad:	e8 2e 82 bf ff       	callq  400de0 <__printf_chk@plt>
  808bb2:	bf 01 00 00 00       	mov    $0x1,%edi
  808bb7:	e8 64 82 bf ff       	callq  400e20 <exit@plt>

0000000000808bbc <Gets>:
  808bbc:	41 54                	push   %r12
  808bbe:	55                   	push   %rbp
  808bbf:	53                   	push   %rbx
  808bc0:	49 89 fc             	mov    %rdi,%r12
  808bc3:	c7 05 57 45 20 00 00 	movl   $0x0,0x204557(%rip)        # a0d124 <gets_cnt>
  808bca:	00 00 00 
  808bcd:	48 89 fb             	mov    %rdi,%rbx
  808bd0:	eb 11                	jmp    808be3 <Gets+0x27>
  808bd2:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  808bd6:	88 03                	mov    %al,(%rbx)
  808bd8:	0f b6 f8             	movzbl %al,%edi
  808bdb:	e8 34 ff ff ff       	callq  808b14 <save_char>
  808be0:	48 89 eb             	mov    %rbp,%rbx
  808be3:	48 8b 3d 06 39 20 00 	mov    0x203906(%rip),%rdi        # a0c4f0 <infile>
  808bea:	e8 c1 81 bf ff       	callq  400db0 <_IO_getc@plt>
  808bef:	83 f8 ff             	cmp    $0xffffffff,%eax
  808bf2:	74 05                	je     808bf9 <Gets+0x3d>
  808bf4:	83 f8 0a             	cmp    $0xa,%eax
  808bf7:	75 d9                	jne    808bd2 <Gets+0x16>
  808bf9:	c6 03 00             	movb   $0x0,(%rbx)
  808bfc:	b8 00 00 00 00       	mov    $0x0,%eax
  808c01:	e8 67 ff ff ff       	callq  808b6d <save_term>
  808c06:	4c 89 e0             	mov    %r12,%rax
  808c09:	5b                   	pop    %rbx
  808c0a:	5d                   	pop    %rbp
  808c0b:	41 5c                	pop    %r12
  808c0d:	c3                   	retq   

0000000000808c0e <notify_server>:
  808c0e:	55                   	push   %rbp
  808c0f:	53                   	push   %rbx
  808c10:	48 81 ec 18 40 00 00 	sub    $0x4018,%rsp
  808c17:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  808c1e:	00 00 
  808c20:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  808c27:	00 
  808c28:	31 c0                	xor    %eax,%eax
  808c2a:	83 3d d7 38 20 00 00 	cmpl   $0x0,0x2038d7(%rip)        # a0c508 <is_checker>
  808c31:	0f 85 d9 00 00 00    	jne    808d10 <notify_server+0x102>
  808c37:	89 fb                	mov    %edi,%ebx
  808c39:	8b 05 e5 44 20 00    	mov    0x2044e5(%rip),%eax        # a0d124 <gets_cnt>
  808c3f:	83 c0 64             	add    $0x64,%eax
  808c42:	3d 00 20 00 00       	cmp    $0x2000,%eax
  808c47:	0f 8f e4 00 00 00    	jg     808d31 <notify_server+0x123>
  808c4d:	0f be 05 dc 44 20 00 	movsbl 0x2044dc(%rip),%eax        # a0d130 <target_prefix>
  808c54:	83 3d 2d 38 20 00 00 	cmpl   $0x0,0x20382d(%rip)        # a0c488 <notify>
  808c5b:	0f 84 f0 00 00 00    	je     808d51 <notify_server+0x143>
  808c61:	8b 15 99 38 20 00    	mov    0x203899(%rip),%edx        # a0c500 <authkey>
  808c67:	85 db                	test   %ebx,%ebx
  808c69:	0f 84 ec 00 00 00    	je     808d5b <notify_server+0x14d>
  808c6f:	48 8d 2d f3 16 00 00 	lea    0x16f3(%rip),%rbp        # 80a369 <_IO_stdin_used+0x379>
  808c76:	48 89 e7             	mov    %rsp,%rdi
  808c79:	48 83 ec 08          	sub    $0x8,%rsp
  808c7d:	48 8d 0d 9c 38 20 00 	lea    0x20389c(%rip),%rcx        # a0c520 <gets_buf>
  808c84:	51                   	push   %rcx
  808c85:	56                   	push   %rsi
  808c86:	50                   	push   %rax
  808c87:	52                   	push   %rdx
  808c88:	55                   	push   %rbp
  808c89:	44 8b 0d a0 34 20 00 	mov    0x2034a0(%rip),%r9d        # a0c130 <target_id>
  808c90:	4c 8d 05 dc 16 00 00 	lea    0x16dc(%rip),%r8        # 80a373 <_IO_stdin_used+0x383>
  808c97:	b9 00 20 00 00       	mov    $0x2000,%ecx
  808c9c:	ba 01 00 00 00       	mov    $0x1,%edx
  808ca1:	be 00 20 00 00       	mov    $0x2000,%esi
  808ca6:	b8 00 00 00 00       	mov    $0x0,%eax
  808cab:	e8 c0 7f bf ff       	callq  400c70 <__snprintf_chk@plt>
  808cb0:	48 83 c4 30          	add    $0x30,%rsp
  808cb4:	83 3d cd 37 20 00 00 	cmpl   $0x0,0x2037cd(%rip)        # a0c488 <notify>
  808cbb:	0f 84 df 00 00 00    	je     808da0 <notify_server+0x192>
  808cc1:	85 db                	test   %ebx,%ebx
  808cc3:	0f 84 c6 00 00 00    	je     808d8f <notify_server+0x181>
  808cc9:	48 89 e1             	mov    %rsp,%rcx
  808ccc:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  808cd3:	00 
  808cd4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  808cda:	48 8b 15 67 34 20 00 	mov    0x203467(%rip),%rdx        # a0c148 <lab>
  808ce1:	48 8b 35 98 37 20 00 	mov    0x203798(%rip),%rsi        # a0c480 <course>
  808ce8:	48 8b 3d 51 34 20 00 	mov    0x203451(%rip),%rdi        # a0c140 <user_id>
  808cef:	e8 af 11 00 00       	callq  809ea3 <driver_post>
  808cf4:	85 c0                	test   %eax,%eax
  808cf6:	78 6f                	js     808d67 <notify_server+0x159>
  808cf8:	48 8d 3d b9 17 00 00 	lea    0x17b9(%rip),%rdi        # 80a4b8 <_IO_stdin_used+0x4c8>
  808cff:	e8 bc 7f bf ff       	callq  400cc0 <puts@plt>
  808d04:	48 8d 3d 90 16 00 00 	lea    0x1690(%rip),%rdi        # 80a39b <_IO_stdin_used+0x3ab>
  808d0b:	e8 b0 7f bf ff       	callq  400cc0 <puts@plt>
  808d10:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  808d17:	00 
  808d18:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  808d1f:	00 00 
  808d21:	0f 85 07 01 00 00    	jne    808e2e <notify_server+0x220>
  808d27:	48 81 c4 18 40 00 00 	add    $0x4018,%rsp
  808d2e:	5b                   	pop    %rbx
  808d2f:	5d                   	pop    %rbp
  808d30:	c3                   	retq   
  808d31:	48 8d 35 50 17 00 00 	lea    0x1750(%rip),%rsi        # 80a488 <_IO_stdin_used+0x498>
  808d38:	bf 01 00 00 00       	mov    $0x1,%edi
  808d3d:	b8 00 00 00 00       	mov    $0x0,%eax
  808d42:	e8 99 80 bf ff       	callq  400de0 <__printf_chk@plt>
  808d47:	bf 01 00 00 00       	mov    $0x1,%edi
  808d4c:	e8 cf 80 bf ff       	callq  400e20 <exit@plt>
  808d51:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  808d56:	e9 0c ff ff ff       	jmpq   808c67 <notify_server+0x59>
  808d5b:	48 8d 2d 0c 16 00 00 	lea    0x160c(%rip),%rbp        # 80a36e <_IO_stdin_used+0x37e>
  808d62:	e9 0f ff ff ff       	jmpq   808c76 <notify_server+0x68>
  808d67:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  808d6e:	00 
  808d6f:	48 8d 35 19 16 00 00 	lea    0x1619(%rip),%rsi        # 80a38f <_IO_stdin_used+0x39f>
  808d76:	bf 01 00 00 00       	mov    $0x1,%edi
  808d7b:	b8 00 00 00 00       	mov    $0x0,%eax
  808d80:	e8 5b 80 bf ff       	callq  400de0 <__printf_chk@plt>
  808d85:	bf 01 00 00 00       	mov    $0x1,%edi
  808d8a:	e8 91 80 bf ff       	callq  400e20 <exit@plt>
  808d8f:	48 8d 3d 0f 16 00 00 	lea    0x160f(%rip),%rdi        # 80a3a5 <_IO_stdin_used+0x3b5>
  808d96:	e8 25 7f bf ff       	callq  400cc0 <puts@plt>
  808d9b:	e9 70 ff ff ff       	jmpq   808d10 <notify_server+0x102>
  808da0:	48 89 ea             	mov    %rbp,%rdx
  808da3:	48 8d 35 46 17 00 00 	lea    0x1746(%rip),%rsi        # 80a4f0 <_IO_stdin_used+0x500>
  808daa:	bf 01 00 00 00       	mov    $0x1,%edi
  808daf:	b8 00 00 00 00       	mov    $0x0,%eax
  808db4:	e8 27 80 bf ff       	callq  400de0 <__printf_chk@plt>
  808db9:	48 8b 15 80 33 20 00 	mov    0x203380(%rip),%rdx        # a0c140 <user_id>
  808dc0:	48 8d 35 e5 15 00 00 	lea    0x15e5(%rip),%rsi        # 80a3ac <_IO_stdin_used+0x3bc>
  808dc7:	bf 01 00 00 00       	mov    $0x1,%edi
  808dcc:	b8 00 00 00 00       	mov    $0x0,%eax
  808dd1:	e8 0a 80 bf ff       	callq  400de0 <__printf_chk@plt>
  808dd6:	48 8b 15 a3 36 20 00 	mov    0x2036a3(%rip),%rdx        # a0c480 <course>
  808ddd:	48 8d 35 d5 15 00 00 	lea    0x15d5(%rip),%rsi        # 80a3b9 <_IO_stdin_used+0x3c9>
  808de4:	bf 01 00 00 00       	mov    $0x1,%edi
  808de9:	b8 00 00 00 00       	mov    $0x0,%eax
  808dee:	e8 ed 7f bf ff       	callq  400de0 <__printf_chk@plt>
  808df3:	48 8b 15 4e 33 20 00 	mov    0x20334e(%rip),%rdx        # a0c148 <lab>
  808dfa:	48 8d 35 c4 15 00 00 	lea    0x15c4(%rip),%rsi        # 80a3c5 <_IO_stdin_used+0x3d5>
  808e01:	bf 01 00 00 00       	mov    $0x1,%edi
  808e06:	b8 00 00 00 00       	mov    $0x0,%eax
  808e0b:	e8 d0 7f bf ff       	callq  400de0 <__printf_chk@plt>
  808e10:	48 89 e2             	mov    %rsp,%rdx
  808e13:	48 8d 35 b4 15 00 00 	lea    0x15b4(%rip),%rsi        # 80a3ce <_IO_stdin_used+0x3de>
  808e1a:	bf 01 00 00 00       	mov    $0x1,%edi
  808e1f:	b8 00 00 00 00       	mov    $0x0,%eax
  808e24:	e8 b7 7f bf ff       	callq  400de0 <__printf_chk@plt>
  808e29:	e9 e2 fe ff ff       	jmpq   808d10 <notify_server+0x102>
  808e2e:	e8 ad 7e bf ff       	callq  400ce0 <__stack_chk_fail@plt>

0000000000808e33 <validate>:
  808e33:	53                   	push   %rbx
  808e34:	89 fb                	mov    %edi,%ebx
  808e36:	83 3d cb 36 20 00 00 	cmpl   $0x0,0x2036cb(%rip)        # a0c508 <is_checker>
  808e3d:	74 72                	je     808eb1 <validate+0x7e>
  808e3f:	39 3d b7 36 20 00    	cmp    %edi,0x2036b7(%rip)        # a0c4fc <vlevel>
  808e45:	75 32                	jne    808e79 <validate+0x46>
  808e47:	8b 15 ab 36 20 00    	mov    0x2036ab(%rip),%edx        # a0c4f8 <check_level>
  808e4d:	39 fa                	cmp    %edi,%edx
  808e4f:	75 3e                	jne    808e8f <validate+0x5c>
  808e51:	0f be 15 d8 42 20 00 	movsbl 0x2042d8(%rip),%edx        # a0d130 <target_prefix>
  808e58:	4c 8d 05 c1 36 20 00 	lea    0x2036c1(%rip),%r8        # a0c520 <gets_buf>
  808e5f:	89 f9                	mov    %edi,%ecx
  808e61:	48 8d 35 90 15 00 00 	lea    0x1590(%rip),%rsi        # 80a3f8 <_IO_stdin_used+0x408>
  808e68:	bf 01 00 00 00       	mov    $0x1,%edi
  808e6d:	b8 00 00 00 00       	mov    $0x0,%eax
  808e72:	e8 69 7f bf ff       	callq  400de0 <__printf_chk@plt>
  808e77:	5b                   	pop    %rbx
  808e78:	c3                   	retq   
  808e79:	48 8d 3d 5a 15 00 00 	lea    0x155a(%rip),%rdi        # 80a3da <_IO_stdin_used+0x3ea>
  808e80:	e8 3b 7e bf ff       	callq  400cc0 <puts@plt>
  808e85:	b8 00 00 00 00       	mov    $0x0,%eax
  808e8a:	e8 f5 fc ff ff       	callq  808b84 <check_fail>
  808e8f:	89 f9                	mov    %edi,%ecx
  808e91:	48 8d 35 80 16 00 00 	lea    0x1680(%rip),%rsi        # 80a518 <_IO_stdin_used+0x528>
  808e98:	bf 01 00 00 00       	mov    $0x1,%edi
  808e9d:	b8 00 00 00 00       	mov    $0x0,%eax
  808ea2:	e8 39 7f bf ff       	callq  400de0 <__printf_chk@plt>
  808ea7:	b8 00 00 00 00       	mov    $0x0,%eax
  808eac:	e8 d3 fc ff ff       	callq  808b84 <check_fail>
  808eb1:	39 3d 45 36 20 00    	cmp    %edi,0x203645(%rip)        # a0c4fc <vlevel>
  808eb7:	74 1a                	je     808ed3 <validate+0xa0>
  808eb9:	48 8d 3d 1a 15 00 00 	lea    0x151a(%rip),%rdi        # 80a3da <_IO_stdin_used+0x3ea>
  808ec0:	e8 fb 7d bf ff       	callq  400cc0 <puts@plt>
  808ec5:	89 de                	mov    %ebx,%esi
  808ec7:	bf 00 00 00 00       	mov    $0x0,%edi
  808ecc:	e8 3d fd ff ff       	callq  808c0e <notify_server>
  808ed1:	eb a4                	jmp    808e77 <validate+0x44>
  808ed3:	0f be 0d 56 42 20 00 	movsbl 0x204256(%rip),%ecx        # a0d130 <target_prefix>
  808eda:	89 fa                	mov    %edi,%edx
  808edc:	48 8d 35 5d 16 00 00 	lea    0x165d(%rip),%rsi        # 80a540 <_IO_stdin_used+0x550>
  808ee3:	bf 01 00 00 00       	mov    $0x1,%edi
  808ee8:	b8 00 00 00 00       	mov    $0x0,%eax
  808eed:	e8 ee 7e bf ff       	callq  400de0 <__printf_chk@plt>
  808ef2:	89 de                	mov    %ebx,%esi
  808ef4:	bf 01 00 00 00       	mov    $0x1,%edi
  808ef9:	e8 10 fd ff ff       	callq  808c0e <notify_server>
  808efe:	e9 74 ff ff ff       	jmpq   808e77 <validate+0x44>

0000000000808f03 <fail>:
  808f03:	48 83 ec 08          	sub    $0x8,%rsp
  808f07:	83 3d fa 35 20 00 00 	cmpl   $0x0,0x2035fa(%rip)        # a0c508 <is_checker>
  808f0e:	75 11                	jne    808f21 <fail+0x1e>
  808f10:	89 fe                	mov    %edi,%esi
  808f12:	bf 00 00 00 00       	mov    $0x0,%edi
  808f17:	e8 f2 fc ff ff       	callq  808c0e <notify_server>
  808f1c:	48 83 c4 08          	add    $0x8,%rsp
  808f20:	c3                   	retq   
  808f21:	b8 00 00 00 00       	mov    $0x0,%eax
  808f26:	e8 59 fc ff ff       	callq  808b84 <check_fail>

0000000000808f2b <bushandler>:
  808f2b:	48 83 ec 08          	sub    $0x8,%rsp
  808f2f:	83 3d d2 35 20 00 00 	cmpl   $0x0,0x2035d2(%rip)        # a0c508 <is_checker>
  808f36:	74 16                	je     808f4e <bushandler+0x23>
  808f38:	48 8d 3d ce 14 00 00 	lea    0x14ce(%rip),%rdi        # 80a40d <_IO_stdin_used+0x41d>
  808f3f:	e8 7c 7d bf ff       	callq  400cc0 <puts@plt>
  808f44:	b8 00 00 00 00       	mov    $0x0,%eax
  808f49:	e8 36 fc ff ff       	callq  808b84 <check_fail>
  808f4e:	48 8d 3d 23 16 00 00 	lea    0x1623(%rip),%rdi        # 80a578 <_IO_stdin_used+0x588>
  808f55:	e8 66 7d bf ff       	callq  400cc0 <puts@plt>
  808f5a:	48 8d 3d b6 14 00 00 	lea    0x14b6(%rip),%rdi        # 80a417 <_IO_stdin_used+0x427>
  808f61:	e8 5a 7d bf ff       	callq  400cc0 <puts@plt>
  808f66:	be 00 00 00 00       	mov    $0x0,%esi
  808f6b:	bf 00 00 00 00       	mov    $0x0,%edi
  808f70:	e8 99 fc ff ff       	callq  808c0e <notify_server>
  808f75:	bf 01 00 00 00       	mov    $0x1,%edi
  808f7a:	e8 a1 7e bf ff       	callq  400e20 <exit@plt>

0000000000808f7f <seghandler>:
  808f7f:	48 83 ec 08          	sub    $0x8,%rsp
  808f83:	83 3d 7e 35 20 00 00 	cmpl   $0x0,0x20357e(%rip)        # a0c508 <is_checker>
  808f8a:	74 16                	je     808fa2 <seghandler+0x23>
  808f8c:	48 8d 3d 9a 14 00 00 	lea    0x149a(%rip),%rdi        # 80a42d <_IO_stdin_used+0x43d>
  808f93:	e8 28 7d bf ff       	callq  400cc0 <puts@plt>
  808f98:	b8 00 00 00 00       	mov    $0x0,%eax
  808f9d:	e8 e2 fb ff ff       	callq  808b84 <check_fail>
  808fa2:	48 8d 3d ef 15 00 00 	lea    0x15ef(%rip),%rdi        # 80a598 <_IO_stdin_used+0x5a8>
  808fa9:	e8 12 7d bf ff       	callq  400cc0 <puts@plt>
  808fae:	48 8d 3d 62 14 00 00 	lea    0x1462(%rip),%rdi        # 80a417 <_IO_stdin_used+0x427>
  808fb5:	e8 06 7d bf ff       	callq  400cc0 <puts@plt>
  808fba:	be 00 00 00 00       	mov    $0x0,%esi
  808fbf:	bf 00 00 00 00       	mov    $0x0,%edi
  808fc4:	e8 45 fc ff ff       	callq  808c0e <notify_server>
  808fc9:	bf 01 00 00 00       	mov    $0x1,%edi
  808fce:	e8 4d 7e bf ff       	callq  400e20 <exit@plt>

0000000000808fd3 <illegalhandler>:
  808fd3:	48 83 ec 08          	sub    $0x8,%rsp
  808fd7:	83 3d 2a 35 20 00 00 	cmpl   $0x0,0x20352a(%rip)        # a0c508 <is_checker>
  808fde:	74 16                	je     808ff6 <illegalhandler+0x23>
  808fe0:	48 8d 3d 59 14 00 00 	lea    0x1459(%rip),%rdi        # 80a440 <_IO_stdin_used+0x450>
  808fe7:	e8 d4 7c bf ff       	callq  400cc0 <puts@plt>
  808fec:	b8 00 00 00 00       	mov    $0x0,%eax
  808ff1:	e8 8e fb ff ff       	callq  808b84 <check_fail>
  808ff6:	48 8d 3d c3 15 00 00 	lea    0x15c3(%rip),%rdi        # 80a5c0 <_IO_stdin_used+0x5d0>
  808ffd:	e8 be 7c bf ff       	callq  400cc0 <puts@plt>
  809002:	48 8d 3d 0e 14 00 00 	lea    0x140e(%rip),%rdi        # 80a417 <_IO_stdin_used+0x427>
  809009:	e8 b2 7c bf ff       	callq  400cc0 <puts@plt>
  80900e:	be 00 00 00 00       	mov    $0x0,%esi
  809013:	bf 00 00 00 00       	mov    $0x0,%edi
  809018:	e8 f1 fb ff ff       	callq  808c0e <notify_server>
  80901d:	bf 01 00 00 00       	mov    $0x1,%edi
  809022:	e8 f9 7d bf ff       	callq  400e20 <exit@plt>

0000000000809027 <sigalrmhandler>:
  809027:	48 83 ec 08          	sub    $0x8,%rsp
  80902b:	83 3d d6 34 20 00 00 	cmpl   $0x0,0x2034d6(%rip)        # a0c508 <is_checker>
  809032:	74 16                	je     80904a <sigalrmhandler+0x23>
  809034:	48 8d 3d 19 14 00 00 	lea    0x1419(%rip),%rdi        # 80a454 <_IO_stdin_used+0x464>
  80903b:	e8 80 7c bf ff       	callq  400cc0 <puts@plt>
  809040:	b8 00 00 00 00       	mov    $0x0,%eax
  809045:	e8 3a fb ff ff       	callq  808b84 <check_fail>
  80904a:	ba 05 00 00 00       	mov    $0x5,%edx
  80904f:	48 8d 35 9a 15 00 00 	lea    0x159a(%rip),%rsi        # 80a5f0 <_IO_stdin_used+0x600>
  809056:	bf 01 00 00 00       	mov    $0x1,%edi
  80905b:	b8 00 00 00 00       	mov    $0x0,%eax
  809060:	e8 7b 7d bf ff       	callq  400de0 <__printf_chk@plt>
  809065:	be 00 00 00 00       	mov    $0x0,%esi
  80906a:	bf 00 00 00 00       	mov    $0x0,%edi
  80906f:	e8 9a fb ff ff       	callq  808c0e <notify_server>
  809074:	bf 01 00 00 00       	mov    $0x1,%edi
  809079:	e8 a2 7d bf ff       	callq  400e20 <exit@plt>

000000000080907e <launch>:
  80907e:	55                   	push   %rbp
  80907f:	48 89 e5             	mov    %rsp,%rbp
  809082:	48 83 ec 10          	sub    $0x10,%rsp
  809086:	48 89 fa             	mov    %rdi,%rdx
  809089:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  809090:	00 00 
  809092:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  809096:	31 c0                	xor    %eax,%eax
  809098:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  80909c:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  8090a0:	48 29 c4             	sub    %rax,%rsp
  8090a3:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  8090a8:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  8090ac:	be f4 00 00 00       	mov    $0xf4,%esi
  8090b1:	e8 4a 7c bf ff       	callq  400d00 <memset@plt>
  8090b6:	48 8b 05 e3 33 20 00 	mov    0x2033e3(%rip),%rax        # a0c4a0 <stdin@@GLIBC_2.2.5>
  8090bd:	48 39 05 2c 34 20 00 	cmp    %rax,0x20342c(%rip)        # a0c4f0 <infile>
  8090c4:	74 3a                	je     809100 <launch+0x82>
  8090c6:	c7 05 2c 34 20 00 00 	movl   $0x0,0x20342c(%rip)        # a0c4fc <vlevel>
  8090cd:	00 00 00 
  8090d0:	b8 00 00 00 00       	mov    $0x0,%eax
  8090d5:	e8 0f fa ff ff       	callq  808ae9 <test>
  8090da:	83 3d 27 34 20 00 00 	cmpl   $0x0,0x203427(%rip)        # a0c508 <is_checker>
  8090e1:	75 35                	jne    809118 <launch+0x9a>
  8090e3:	48 8d 3d 8a 13 00 00 	lea    0x138a(%rip),%rdi        # 80a474 <_IO_stdin_used+0x484>
  8090ea:	e8 d1 7b bf ff       	callq  400cc0 <puts@plt>
  8090ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8090f3:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  8090fa:	00 00 
  8090fc:	75 30                	jne    80912e <launch+0xb0>
  8090fe:	c9                   	leaveq 
  8090ff:	c3                   	retq   
  809100:	48 8d 35 55 13 00 00 	lea    0x1355(%rip),%rsi        # 80a45c <_IO_stdin_used+0x46c>
  809107:	bf 01 00 00 00       	mov    $0x1,%edi
  80910c:	b8 00 00 00 00       	mov    $0x0,%eax
  809111:	e8 ca 7c bf ff       	callq  400de0 <__printf_chk@plt>
  809116:	eb ae                	jmp    8090c6 <launch+0x48>
  809118:	48 8d 3d 4a 13 00 00 	lea    0x134a(%rip),%rdi        # 80a469 <_IO_stdin_used+0x479>
  80911f:	e8 9c 7b bf ff       	callq  400cc0 <puts@plt>
  809124:	b8 00 00 00 00       	mov    $0x0,%eax
  809129:	e8 56 fa ff ff       	callq  808b84 <check_fail>
  80912e:	e8 ad 7b bf ff       	callq  400ce0 <__stack_chk_fail@plt>

0000000000809133 <stable_launch>:
  809133:	53                   	push   %rbx
  809134:	48 89 3d ad 33 20 00 	mov    %rdi,0x2033ad(%rip)        # a0c4e8 <global_offset>
  80913b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  809141:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  809147:	b9 32 01 00 00       	mov    $0x132,%ecx
  80914c:	ba 07 00 00 00       	mov    $0x7,%edx
  809151:	be 00 00 10 00       	mov    $0x100000,%esi
  809156:	bf 00 60 58 55       	mov    $0x55586000,%edi
  80915b:	e8 90 7b bf ff       	callq  400cf0 <mmap@plt>
  809160:	48 89 c3             	mov    %rax,%rbx
  809163:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  809169:	75 43                	jne    8091ae <stable_launch+0x7b>
  80916b:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  809172:	48 89 15 af 3f 20 00 	mov    %rdx,0x203faf(%rip)        # a0d128 <stack_top>
  809179:	48 89 e0             	mov    %rsp,%rax
  80917c:	48 89 d4             	mov    %rdx,%rsp
  80917f:	48 89 c2             	mov    %rax,%rdx
  809182:	48 89 15 57 33 20 00 	mov    %rdx,0x203357(%rip)        # a0c4e0 <global_save_stack>
  809189:	48 8b 3d 58 33 20 00 	mov    0x203358(%rip),%rdi        # a0c4e8 <global_offset>
  809190:	e8 e9 fe ff ff       	callq  80907e <launch>
  809195:	48 8b 05 44 33 20 00 	mov    0x203344(%rip),%rax        # a0c4e0 <global_save_stack>
  80919c:	48 89 c4             	mov    %rax,%rsp
  80919f:	be 00 00 10 00       	mov    $0x100000,%esi
  8091a4:	48 89 df             	mov    %rbx,%rdi
  8091a7:	e8 24 7c bf ff       	callq  400dd0 <munmap@plt>
  8091ac:	5b                   	pop    %rbx
  8091ad:	c3                   	retq   
  8091ae:	be 00 00 10 00       	mov    $0x100000,%esi
  8091b3:	48 89 c7             	mov    %rax,%rdi
  8091b6:	e8 15 7c bf ff       	callq  400dd0 <munmap@plt>
  8091bb:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  8091c0:	48 8d 15 61 14 00 00 	lea    0x1461(%rip),%rdx        # 80a628 <_IO_stdin_used+0x638>
  8091c7:	be 01 00 00 00       	mov    $0x1,%esi
  8091cc:	48 8b 3d ed 32 20 00 	mov    0x2032ed(%rip),%rdi        # a0c4c0 <stderr@@GLIBC_2.2.5>
  8091d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8091d8:	e8 63 7c bf ff       	callq  400e40 <__fprintf_chk@plt>
  8091dd:	bf 01 00 00 00       	mov    $0x1,%edi
  8091e2:	e8 39 7c bf ff       	callq  400e20 <exit@plt>

00000000008091e7 <rio_readinitb>:
  8091e7:	89 37                	mov    %esi,(%rdi)
  8091e9:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  8091f0:	48 8d 47 10          	lea    0x10(%rdi),%rax
  8091f4:	48 89 47 08          	mov    %rax,0x8(%rdi)
  8091f8:	c3                   	retq   

00000000008091f9 <sigalrm_handler>:
  8091f9:	48 83 ec 08          	sub    $0x8,%rsp
  8091fd:	b9 00 00 00 00       	mov    $0x0,%ecx
  809202:	48 8d 15 57 14 00 00 	lea    0x1457(%rip),%rdx        # 80a660 <trans_char+0x10>
  809209:	be 01 00 00 00       	mov    $0x1,%esi
  80920e:	48 8b 3d ab 32 20 00 	mov    0x2032ab(%rip),%rdi        # a0c4c0 <stderr@@GLIBC_2.2.5>
  809215:	b8 00 00 00 00       	mov    $0x0,%eax
  80921a:	e8 21 7c bf ff       	callq  400e40 <__fprintf_chk@plt>
  80921f:	bf 01 00 00 00       	mov    $0x1,%edi
  809224:	e8 f7 7b bf ff       	callq  400e20 <exit@plt>

0000000000809229 <rio_writen>:
  809229:	41 55                	push   %r13
  80922b:	41 54                	push   %r12
  80922d:	55                   	push   %rbp
  80922e:	53                   	push   %rbx
  80922f:	48 83 ec 08          	sub    $0x8,%rsp
  809233:	41 89 fc             	mov    %edi,%r12d
  809236:	48 89 f5             	mov    %rsi,%rbp
  809239:	49 89 d5             	mov    %rdx,%r13
  80923c:	48 89 d3             	mov    %rdx,%rbx
  80923f:	eb 06                	jmp    809247 <rio_writen+0x1e>
  809241:	48 29 c3             	sub    %rax,%rbx
  809244:	48 01 c5             	add    %rax,%rbp
  809247:	48 85 db             	test   %rbx,%rbx
  80924a:	74 24                	je     809270 <rio_writen+0x47>
  80924c:	48 89 da             	mov    %rbx,%rdx
  80924f:	48 89 ee             	mov    %rbp,%rsi
  809252:	44 89 e7             	mov    %r12d,%edi
  809255:	e8 76 7a bf ff       	callq  400cd0 <write@plt>
  80925a:	48 85 c0             	test   %rax,%rax
  80925d:	7f e2                	jg     809241 <rio_writen+0x18>
  80925f:	e8 1c 7a bf ff       	callq  400c80 <__errno_location@plt>
  809264:	83 38 04             	cmpl   $0x4,(%rax)
  809267:	75 15                	jne    80927e <rio_writen+0x55>
  809269:	b8 00 00 00 00       	mov    $0x0,%eax
  80926e:	eb d1                	jmp    809241 <rio_writen+0x18>
  809270:	4c 89 e8             	mov    %r13,%rax
  809273:	48 83 c4 08          	add    $0x8,%rsp
  809277:	5b                   	pop    %rbx
  809278:	5d                   	pop    %rbp
  809279:	41 5c                	pop    %r12
  80927b:	41 5d                	pop    %r13
  80927d:	c3                   	retq   
  80927e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  809285:	eb ec                	jmp    809273 <rio_writen+0x4a>

0000000000809287 <rio_read>:
  809287:	41 55                	push   %r13
  809289:	41 54                	push   %r12
  80928b:	55                   	push   %rbp
  80928c:	53                   	push   %rbx
  80928d:	48 83 ec 08          	sub    $0x8,%rsp
  809291:	48 89 fb             	mov    %rdi,%rbx
  809294:	49 89 f5             	mov    %rsi,%r13
  809297:	49 89 d4             	mov    %rdx,%r12
  80929a:	eb 0a                	jmp    8092a6 <rio_read+0x1f>
  80929c:	e8 df 79 bf ff       	callq  400c80 <__errno_location@plt>
  8092a1:	83 38 04             	cmpl   $0x4,(%rax)
  8092a4:	75 5c                	jne    809302 <rio_read+0x7b>
  8092a6:	8b 6b 04             	mov    0x4(%rbx),%ebp
  8092a9:	85 ed                	test   %ebp,%ebp
  8092ab:	7f 24                	jg     8092d1 <rio_read+0x4a>
  8092ad:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  8092b1:	8b 3b                	mov    (%rbx),%edi
  8092b3:	ba 00 20 00 00       	mov    $0x2000,%edx
  8092b8:	48 89 ee             	mov    %rbp,%rsi
  8092bb:	e8 70 7a bf ff       	callq  400d30 <read@plt>
  8092c0:	89 43 04             	mov    %eax,0x4(%rbx)
  8092c3:	85 c0                	test   %eax,%eax
  8092c5:	78 d5                	js     80929c <rio_read+0x15>
  8092c7:	85 c0                	test   %eax,%eax
  8092c9:	74 40                	je     80930b <rio_read+0x84>
  8092cb:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  8092cf:	eb d5                	jmp    8092a6 <rio_read+0x1f>
  8092d1:	89 e8                	mov    %ebp,%eax
  8092d3:	4c 39 e0             	cmp    %r12,%rax
  8092d6:	72 03                	jb     8092db <rio_read+0x54>
  8092d8:	44 89 e5             	mov    %r12d,%ebp
  8092db:	4c 63 e5             	movslq %ebp,%r12
  8092de:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  8092e2:	4c 89 e2             	mov    %r12,%rdx
  8092e5:	4c 89 ef             	mov    %r13,%rdi
  8092e8:	e8 93 7a bf ff       	callq  400d80 <memcpy@plt>
  8092ed:	4c 01 63 08          	add    %r12,0x8(%rbx)
  8092f1:	29 6b 04             	sub    %ebp,0x4(%rbx)
  8092f4:	4c 89 e0             	mov    %r12,%rax
  8092f7:	48 83 c4 08          	add    $0x8,%rsp
  8092fb:	5b                   	pop    %rbx
  8092fc:	5d                   	pop    %rbp
  8092fd:	41 5c                	pop    %r12
  8092ff:	41 5d                	pop    %r13
  809301:	c3                   	retq   
  809302:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  809309:	eb ec                	jmp    8092f7 <rio_read+0x70>
  80930b:	b8 00 00 00 00       	mov    $0x0,%eax
  809310:	eb e5                	jmp    8092f7 <rio_read+0x70>

0000000000809312 <rio_readlineb>:
  809312:	41 55                	push   %r13
  809314:	41 54                	push   %r12
  809316:	55                   	push   %rbp
  809317:	53                   	push   %rbx
  809318:	48 83 ec 18          	sub    $0x18,%rsp
  80931c:	49 89 fd             	mov    %rdi,%r13
  80931f:	48 89 f5             	mov    %rsi,%rbp
  809322:	49 89 d4             	mov    %rdx,%r12
  809325:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  80932c:	00 00 
  80932e:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  809333:	31 c0                	xor    %eax,%eax
  809335:	bb 01 00 00 00       	mov    $0x1,%ebx
  80933a:	4c 39 e3             	cmp    %r12,%rbx
  80933d:	73 47                	jae    809386 <rio_readlineb+0x74>
  80933f:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  809344:	ba 01 00 00 00       	mov    $0x1,%edx
  809349:	4c 89 ef             	mov    %r13,%rdi
  80934c:	e8 36 ff ff ff       	callq  809287 <rio_read>
  809351:	83 f8 01             	cmp    $0x1,%eax
  809354:	75 1c                	jne    809372 <rio_readlineb+0x60>
  809356:	48 8d 45 01          	lea    0x1(%rbp),%rax
  80935a:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  80935f:	88 55 00             	mov    %dl,0x0(%rbp)
  809362:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  809367:	74 1a                	je     809383 <rio_readlineb+0x71>
  809369:	48 83 c3 01          	add    $0x1,%rbx
  80936d:	48 89 c5             	mov    %rax,%rbp
  809370:	eb c8                	jmp    80933a <rio_readlineb+0x28>
  809372:	85 c0                	test   %eax,%eax
  809374:	75 32                	jne    8093a8 <rio_readlineb+0x96>
  809376:	48 83 fb 01          	cmp    $0x1,%rbx
  80937a:	75 0a                	jne    809386 <rio_readlineb+0x74>
  80937c:	b8 00 00 00 00       	mov    $0x0,%eax
  809381:	eb 0a                	jmp    80938d <rio_readlineb+0x7b>
  809383:	48 89 c5             	mov    %rax,%rbp
  809386:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  80938a:	48 89 d8             	mov    %rbx,%rax
  80938d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  809392:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  809399:	00 00 
  80939b:	75 14                	jne    8093b1 <rio_readlineb+0x9f>
  80939d:	48 83 c4 18          	add    $0x18,%rsp
  8093a1:	5b                   	pop    %rbx
  8093a2:	5d                   	pop    %rbp
  8093a3:	41 5c                	pop    %r12
  8093a5:	41 5d                	pop    %r13
  8093a7:	c3                   	retq   
  8093a8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  8093af:	eb dc                	jmp    80938d <rio_readlineb+0x7b>
  8093b1:	e8 2a 79 bf ff       	callq  400ce0 <__stack_chk_fail@plt>

00000000008093b6 <urlencode>:
  8093b6:	41 54                	push   %r12
  8093b8:	55                   	push   %rbp
  8093b9:	53                   	push   %rbx
  8093ba:	48 83 ec 10          	sub    $0x10,%rsp
  8093be:	48 89 fb             	mov    %rdi,%rbx
  8093c1:	48 89 f5             	mov    %rsi,%rbp
  8093c4:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  8093cb:	00 00 
  8093cd:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  8093d2:	31 c0                	xor    %eax,%eax
  8093d4:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  8093db:	f2 ae                	repnz scas %es:(%rdi),%al
  8093dd:	48 89 ce             	mov    %rcx,%rsi
  8093e0:	48 f7 d6             	not    %rsi
  8093e3:	8d 46 ff             	lea    -0x1(%rsi),%eax
  8093e6:	eb 0f                	jmp    8093f7 <urlencode+0x41>
  8093e8:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  8093ec:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  8093f0:	48 83 c3 01          	add    $0x1,%rbx
  8093f4:	44 89 e0             	mov    %r12d,%eax
  8093f7:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  8093fb:	85 c0                	test   %eax,%eax
  8093fd:	0f 84 a8 00 00 00    	je     8094ab <urlencode+0xf5>
  809403:	44 0f b6 03          	movzbl (%rbx),%r8d
  809407:	41 80 f8 2a          	cmp    $0x2a,%r8b
  80940b:	0f 94 c2             	sete   %dl
  80940e:	41 80 f8 2d          	cmp    $0x2d,%r8b
  809412:	0f 94 c0             	sete   %al
  809415:	08 c2                	or     %al,%dl
  809417:	75 cf                	jne    8093e8 <urlencode+0x32>
  809419:	41 80 f8 2e          	cmp    $0x2e,%r8b
  80941d:	74 c9                	je     8093e8 <urlencode+0x32>
  80941f:	41 80 f8 5f          	cmp    $0x5f,%r8b
  809423:	74 c3                	je     8093e8 <urlencode+0x32>
  809425:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  809429:	3c 09                	cmp    $0x9,%al
  80942b:	76 bb                	jbe    8093e8 <urlencode+0x32>
  80942d:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  809431:	3c 19                	cmp    $0x19,%al
  809433:	76 b3                	jbe    8093e8 <urlencode+0x32>
  809435:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  809439:	3c 19                	cmp    $0x19,%al
  80943b:	76 ab                	jbe    8093e8 <urlencode+0x32>
  80943d:	41 80 f8 20          	cmp    $0x20,%r8b
  809441:	74 56                	je     809499 <urlencode+0xe3>
  809443:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  809447:	3c 5f                	cmp    $0x5f,%al
  809449:	0f 96 c2             	setbe  %dl
  80944c:	41 80 f8 09          	cmp    $0x9,%r8b
  809450:	0f 94 c0             	sete   %al
  809453:	08 c2                	or     %al,%dl
  809455:	74 4f                	je     8094a6 <urlencode+0xf0>
  809457:	48 89 e7             	mov    %rsp,%rdi
  80945a:	45 0f b6 c0          	movzbl %r8b,%r8d
  80945e:	48 8d 0d 93 12 00 00 	lea    0x1293(%rip),%rcx        # 80a6f8 <trans_char+0xa8>
  809465:	ba 08 00 00 00       	mov    $0x8,%edx
  80946a:	be 01 00 00 00       	mov    $0x1,%esi
  80946f:	b8 00 00 00 00       	mov    $0x0,%eax
  809474:	e8 d7 79 bf ff       	callq  400e50 <__sprintf_chk@plt>
  809479:	0f b6 04 24          	movzbl (%rsp),%eax
  80947d:	88 45 00             	mov    %al,0x0(%rbp)
  809480:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  809485:	88 45 01             	mov    %al,0x1(%rbp)
  809488:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  80948d:	88 45 02             	mov    %al,0x2(%rbp)
  809490:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  809494:	e9 57 ff ff ff       	jmpq   8093f0 <urlencode+0x3a>
  809499:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  80949d:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  8094a1:	e9 4a ff ff ff       	jmpq   8093f0 <urlencode+0x3a>
  8094a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8094ab:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  8094b0:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  8094b7:	00 00 
  8094b9:	75 09                	jne    8094c4 <urlencode+0x10e>
  8094bb:	48 83 c4 10          	add    $0x10,%rsp
  8094bf:	5b                   	pop    %rbx
  8094c0:	5d                   	pop    %rbp
  8094c1:	41 5c                	pop    %r12
  8094c3:	c3                   	retq   
  8094c4:	e8 17 78 bf ff       	callq  400ce0 <__stack_chk_fail@plt>

00000000008094c9 <submitr>:
  8094c9:	41 57                	push   %r15
  8094cb:	41 56                	push   %r14
  8094cd:	41 55                	push   %r13
  8094cf:	41 54                	push   %r12
  8094d1:	55                   	push   %rbp
  8094d2:	53                   	push   %rbx
  8094d3:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
  8094da:	49 89 fd             	mov    %rdi,%r13
  8094dd:	89 74 24 14          	mov    %esi,0x14(%rsp)
  8094e1:	49 89 d7             	mov    %rdx,%r15
  8094e4:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  8094e9:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  8094ee:	4d 89 ce             	mov    %r9,%r14
  8094f1:	48 8b ac 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbp
  8094f8:	00 
  8094f9:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  809500:	00 00 
  809502:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
  809509:	00 
  80950a:	31 c0                	xor    %eax,%eax
  80950c:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
  809513:	00 
  809514:	ba 00 00 00 00       	mov    $0x0,%edx
  809519:	be 01 00 00 00       	mov    $0x1,%esi
  80951e:	bf 02 00 00 00       	mov    $0x2,%edi
  809523:	e8 38 79 bf ff       	callq  400e60 <socket@plt>
  809528:	85 c0                	test   %eax,%eax
  80952a:	0f 88 a9 02 00 00    	js     8097d9 <submitr+0x310>
  809530:	89 c3                	mov    %eax,%ebx
  809532:	4c 89 ef             	mov    %r13,%rdi
  809535:	e8 16 78 bf ff       	callq  400d50 <gethostbyname@plt>
  80953a:	48 85 c0             	test   %rax,%rax
  80953d:	0f 84 e2 02 00 00    	je     809825 <submitr+0x35c>
  809543:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
  809548:	48 c7 44 24 32 00 00 	movq   $0x0,0x32(%rsp)
  80954f:	00 00 
  809551:	c7 44 24 3a 00 00 00 	movl   $0x0,0x3a(%rsp)
  809558:	00 
  809559:	66 c7 44 24 3e 00 00 	movw   $0x0,0x3e(%rsp)
  809560:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
  809567:	48 63 50 14          	movslq 0x14(%rax),%rdx
  80956b:	48 8b 40 18          	mov    0x18(%rax),%rax
  80956f:	48 8b 30             	mov    (%rax),%rsi
  809572:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
  809577:	b9 0c 00 00 00       	mov    $0xc,%ecx
  80957c:	e8 df 77 bf ff       	callq  400d60 <__memmove_chk@plt>
  809581:	0f b7 44 24 14       	movzwl 0x14(%rsp),%eax
  809586:	66 c1 c8 08          	ror    $0x8,%ax
  80958a:	66 89 44 24 32       	mov    %ax,0x32(%rsp)
  80958f:	ba 10 00 00 00       	mov    $0x10,%edx
  809594:	4c 89 e6             	mov    %r12,%rsi
  809597:	89 df                	mov    %ebx,%edi
  809599:	e8 92 78 bf ff       	callq  400e30 <connect@plt>
  80959e:	85 c0                	test   %eax,%eax
  8095a0:	0f 88 e7 02 00 00    	js     80988d <submitr+0x3c4>
  8095a6:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  8095ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8095b2:	48 89 f1             	mov    %rsi,%rcx
  8095b5:	4c 89 f7             	mov    %r14,%rdi
  8095b8:	f2 ae                	repnz scas %es:(%rdi),%al
  8095ba:	48 89 ca             	mov    %rcx,%rdx
  8095bd:	48 f7 d2             	not    %rdx
  8095c0:	48 89 f1             	mov    %rsi,%rcx
  8095c3:	4c 89 ff             	mov    %r15,%rdi
  8095c6:	f2 ae                	repnz scas %es:(%rdi),%al
  8095c8:	48 f7 d1             	not    %rcx
  8095cb:	49 89 c8             	mov    %rcx,%r8
  8095ce:	48 89 f1             	mov    %rsi,%rcx
  8095d1:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  8095d6:	f2 ae                	repnz scas %es:(%rdi),%al
  8095d8:	48 f7 d1             	not    %rcx
  8095db:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  8095e0:	48 89 f1             	mov    %rsi,%rcx
  8095e3:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  8095e8:	f2 ae                	repnz scas %es:(%rdi),%al
  8095ea:	48 89 c8             	mov    %rcx,%rax
  8095ed:	48 f7 d0             	not    %rax
  8095f0:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  8095f5:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  8095fa:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  809601:	00 
  809602:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  809608:	0f 87 d9 02 00 00    	ja     8098e7 <submitr+0x41e>
  80960e:	48 8d b4 24 50 40 00 	lea    0x4050(%rsp),%rsi
  809615:	00 
  809616:	b9 00 04 00 00       	mov    $0x400,%ecx
  80961b:	b8 00 00 00 00       	mov    $0x0,%eax
  809620:	48 89 f7             	mov    %rsi,%rdi
  809623:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  809626:	4c 89 f7             	mov    %r14,%rdi
  809629:	e8 88 fd ff ff       	callq  8093b6 <urlencode>
  80962e:	85 c0                	test   %eax,%eax
  809630:	0f 88 24 03 00 00    	js     80995a <submitr+0x491>
  809636:	4c 8d a4 24 50 20 00 	lea    0x2050(%rsp),%r12
  80963d:	00 
  80963e:	41 55                	push   %r13
  809640:	48 8d 84 24 58 40 00 	lea    0x4058(%rsp),%rax
  809647:	00 
  809648:	50                   	push   %rax
  809649:	4d 89 f9             	mov    %r15,%r9
  80964c:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
  809651:	48 8d 0d 30 10 00 00 	lea    0x1030(%rip),%rcx        # 80a688 <trans_char+0x38>
  809658:	ba 00 20 00 00       	mov    $0x2000,%edx
  80965d:	be 01 00 00 00       	mov    $0x1,%esi
  809662:	4c 89 e7             	mov    %r12,%rdi
  809665:	b8 00 00 00 00       	mov    $0x0,%eax
  80966a:	e8 e1 77 bf ff       	callq  400e50 <__sprintf_chk@plt>
  80966f:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  809676:	b8 00 00 00 00       	mov    $0x0,%eax
  80967b:	4c 89 e7             	mov    %r12,%rdi
  80967e:	f2 ae                	repnz scas %es:(%rdi),%al
  809680:	48 89 ca             	mov    %rcx,%rdx
  809683:	48 f7 d2             	not    %rdx
  809686:	48 8d 52 ff          	lea    -0x1(%rdx),%rdx
  80968a:	4c 89 e6             	mov    %r12,%rsi
  80968d:	89 df                	mov    %ebx,%edi
  80968f:	e8 95 fb ff ff       	callq  809229 <rio_writen>
  809694:	48 83 c4 10          	add    $0x10,%rsp
  809698:	48 85 c0             	test   %rax,%rax
  80969b:	0f 88 44 03 00 00    	js     8099e5 <submitr+0x51c>
  8096a1:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
  8096a6:	89 de                	mov    %ebx,%esi
  8096a8:	4c 89 e7             	mov    %r12,%rdi
  8096ab:	e8 37 fb ff ff       	callq  8091e7 <rio_readinitb>
  8096b0:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  8096b7:	00 
  8096b8:	ba 00 20 00 00       	mov    $0x2000,%edx
  8096bd:	4c 89 e7             	mov    %r12,%rdi
  8096c0:	e8 4d fc ff ff       	callq  809312 <rio_readlineb>
  8096c5:	48 85 c0             	test   %rax,%rax
  8096c8:	0f 8e 86 03 00 00    	jle    809a54 <submitr+0x58b>
  8096ce:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
  8096d3:	48 8d 94 24 50 60 00 	lea    0x6050(%rsp),%rdx
  8096da:	00 
  8096db:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
  8096e2:	00 
  8096e3:	4c 8d 84 24 50 80 00 	lea    0x8050(%rsp),%r8
  8096ea:	00 
  8096eb:	48 8d 35 0d 10 00 00 	lea    0x100d(%rip),%rsi        # 80a6ff <trans_char+0xaf>
  8096f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8096f7:	e8 c4 76 bf ff       	callq  400dc0 <__isoc99_sscanf@plt>
  8096fc:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  809703:	00 
  809704:	b9 03 00 00 00       	mov    $0x3,%ecx
  809709:	48 8d 3d 06 10 00 00 	lea    0x1006(%rip),%rdi        # 80a716 <trans_char+0xc6>
  809710:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  809712:	0f 97 c0             	seta   %al
  809715:	1c 00                	sbb    $0x0,%al
  809717:	84 c0                	test   %al,%al
  809719:	0f 84 b3 03 00 00    	je     809ad2 <submitr+0x609>
  80971f:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  809726:	00 
  809727:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  80972c:	ba 00 20 00 00       	mov    $0x2000,%edx
  809731:	e8 dc fb ff ff       	callq  809312 <rio_readlineb>
  809736:	48 85 c0             	test   %rax,%rax
  809739:	7f c1                	jg     8096fc <submitr+0x233>
  80973b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  809742:	3a 20 43 
  809745:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  80974c:	20 75 6e 
  80974f:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809753:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809757:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  80975e:	74 6f 20 
  809761:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
  809768:	68 65 61 
  80976b:	48 89 45 10          	mov    %rax,0x10(%rbp)
  80976f:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809773:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  80977a:	66 72 6f 
  80977d:	48 ba 6d 20 74 68 65 	movabs $0x657220656874206d,%rdx
  809784:	20 72 65 
  809787:	48 89 45 20          	mov    %rax,0x20(%rbp)
  80978b:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  80978f:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  809796:	73 65 72 
  809799:	48 89 45 30          	mov    %rax,0x30(%rbp)
  80979d:	c7 45 38 76 65 72 00 	movl   $0x726576,0x38(%rbp)
  8097a4:	89 df                	mov    %ebx,%edi
  8097a6:	e8 75 75 bf ff       	callq  400d20 <close@plt>
  8097ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8097b0:	48 8b 9c 24 58 a0 00 	mov    0xa058(%rsp),%rbx
  8097b7:	00 
  8097b8:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  8097bf:	00 00 
  8097c1:	0f 85 7e 04 00 00    	jne    809c45 <submitr+0x77c>
  8097c7:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
  8097ce:	5b                   	pop    %rbx
  8097cf:	5d                   	pop    %rbp
  8097d0:	41 5c                	pop    %r12
  8097d2:	41 5d                	pop    %r13
  8097d4:	41 5e                	pop    %r14
  8097d6:	41 5f                	pop    %r15
  8097d8:	c3                   	retq   
  8097d9:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  8097e0:	3a 20 43 
  8097e3:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  8097ea:	20 75 6e 
  8097ed:	48 89 45 00          	mov    %rax,0x0(%rbp)
  8097f1:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  8097f5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  8097fc:	74 6f 20 
  8097ff:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  809806:	65 20 73 
  809809:	48 89 45 10          	mov    %rax,0x10(%rbp)
  80980d:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809811:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  809818:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  80981e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809823:	eb 8b                	jmp    8097b0 <submitr+0x2e7>
  809825:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  80982c:	3a 20 44 
  80982f:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  809836:	20 75 6e 
  809839:	48 89 45 00          	mov    %rax,0x0(%rbp)
  80983d:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809841:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809848:	74 6f 20 
  80984b:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  809852:	76 65 20 
  809855:	48 89 45 10          	mov    %rax,0x10(%rbp)
  809859:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  80985d:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  809864:	72 20 61 
  809867:	48 89 45 20          	mov    %rax,0x20(%rbp)
  80986b:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  809872:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  809878:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  80987c:	89 df                	mov    %ebx,%edi
  80987e:	e8 9d 74 bf ff       	callq  400d20 <close@plt>
  809883:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809888:	e9 23 ff ff ff       	jmpq   8097b0 <submitr+0x2e7>
  80988d:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  809894:	3a 20 55 
  809897:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  80989e:	20 74 6f 
  8098a1:	48 89 45 00          	mov    %rax,0x0(%rbp)
  8098a5:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  8098a9:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  8098b0:	65 63 74 
  8098b3:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
  8098ba:	68 65 20 
  8098bd:	48 89 45 10          	mov    %rax,0x10(%rbp)
  8098c1:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  8098c5:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
  8098cc:	66 c7 45 24 65 72    	movw   $0x7265,0x24(%rbp)
  8098d2:	c6 45 26 00          	movb   $0x0,0x26(%rbp)
  8098d6:	89 df                	mov    %ebx,%edi
  8098d8:	e8 43 74 bf ff       	callq  400d20 <close@plt>
  8098dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8098e2:	e9 c9 fe ff ff       	jmpq   8097b0 <submitr+0x2e7>
  8098e7:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  8098ee:	3a 20 52 
  8098f1:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  8098f8:	20 73 74 
  8098fb:	48 89 45 00          	mov    %rax,0x0(%rbp)
  8098ff:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809903:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  80990a:	74 6f 6f 
  80990d:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
  809914:	65 2e 20 
  809917:	48 89 45 10          	mov    %rax,0x10(%rbp)
  80991b:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  80991f:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  809926:	61 73 65 
  809929:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
  809930:	49 54 52 
  809933:	48 89 45 20          	mov    %rax,0x20(%rbp)
  809937:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  80993b:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  809942:	55 46 00 
  809945:	48 89 45 30          	mov    %rax,0x30(%rbp)
  809949:	89 df                	mov    %ebx,%edi
  80994b:	e8 d0 73 bf ff       	callq  400d20 <close@plt>
  809950:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809955:	e9 56 fe ff ff       	jmpq   8097b0 <submitr+0x2e7>
  80995a:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  809961:	3a 20 52 
  809964:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  80996b:	20 73 74 
  80996e:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809972:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809976:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  80997d:	63 6f 6e 
  809980:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
  809987:	20 61 6e 
  80998a:	48 89 45 10          	mov    %rax,0x10(%rbp)
  80998e:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809992:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  809999:	67 61 6c 
  80999c:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
  8099a3:	6e 70 72 
  8099a6:	48 89 45 20          	mov    %rax,0x20(%rbp)
  8099aa:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  8099ae:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  8099b5:	6c 65 20 
  8099b8:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
  8099bf:	63 74 65 
  8099c2:	48 89 45 30          	mov    %rax,0x30(%rbp)
  8099c6:	48 89 55 38          	mov    %rdx,0x38(%rbp)
  8099ca:	66 c7 45 40 72 2e    	movw   $0x2e72,0x40(%rbp)
  8099d0:	c6 45 42 00          	movb   $0x0,0x42(%rbp)
  8099d4:	89 df                	mov    %ebx,%edi
  8099d6:	e8 45 73 bf ff       	callq  400d20 <close@plt>
  8099db:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8099e0:	e9 cb fd ff ff       	jmpq   8097b0 <submitr+0x2e7>
  8099e5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  8099ec:	3a 20 43 
  8099ef:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  8099f6:	20 75 6e 
  8099f9:	48 89 45 00          	mov    %rax,0x0(%rbp)
  8099fd:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809a01:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809a08:	74 6f 20 
  809a0b:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
  809a12:	20 74 6f 
  809a15:	48 89 45 10          	mov    %rax,0x10(%rbp)
  809a19:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809a1d:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  809a24:	72 65 73 
  809a27:	48 ba 75 6c 74 20 73 	movabs $0x7672657320746c75,%rdx
  809a2e:	65 72 76 
  809a31:	48 89 45 20          	mov    %rax,0x20(%rbp)
  809a35:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  809a39:	66 c7 45 30 65 72    	movw   $0x7265,0x30(%rbp)
  809a3f:	c6 45 32 00          	movb   $0x0,0x32(%rbp)
  809a43:	89 df                	mov    %ebx,%edi
  809a45:	e8 d6 72 bf ff       	callq  400d20 <close@plt>
  809a4a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809a4f:	e9 5c fd ff ff       	jmpq   8097b0 <submitr+0x2e7>
  809a54:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  809a5b:	3a 20 43 
  809a5e:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  809a65:	20 75 6e 
  809a68:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809a6c:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809a70:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809a77:	74 6f 20 
  809a7a:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
  809a81:	66 69 72 
  809a84:	48 89 45 10          	mov    %rax,0x10(%rbp)
  809a88:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809a8c:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  809a93:	61 64 65 
  809a96:	48 ba 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rdx
  809a9d:	6d 20 72 
  809aa0:	48 89 45 20          	mov    %rax,0x20(%rbp)
  809aa4:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  809aa8:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  809aaf:	20 73 65 
  809ab2:	48 89 45 30          	mov    %rax,0x30(%rbp)
  809ab6:	c7 45 38 72 76 65 72 	movl   $0x72657672,0x38(%rbp)
  809abd:	c6 45 3c 00          	movb   $0x0,0x3c(%rbp)
  809ac1:	89 df                	mov    %ebx,%edi
  809ac3:	e8 58 72 bf ff       	callq  400d20 <close@plt>
  809ac8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809acd:	e9 de fc ff ff       	jmpq   8097b0 <submitr+0x2e7>
  809ad2:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  809ad9:	00 
  809ada:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  809adf:	ba 00 20 00 00       	mov    $0x2000,%edx
  809ae4:	e8 29 f8 ff ff       	callq  809312 <rio_readlineb>
  809ae9:	48 85 c0             	test   %rax,%rax
  809aec:	0f 8e 96 00 00 00    	jle    809b88 <submitr+0x6bf>
  809af2:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
  809af7:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  809afe:	0f 85 08 01 00 00    	jne    809c0c <submitr+0x743>
  809b04:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  809b0b:	00 
  809b0c:	48 89 ef             	mov    %rbp,%rdi
  809b0f:	e8 9c 71 bf ff       	callq  400cb0 <strcpy@plt>
  809b14:	89 df                	mov    %ebx,%edi
  809b16:	e8 05 72 bf ff       	callq  400d20 <close@plt>
  809b1b:	b9 04 00 00 00       	mov    $0x4,%ecx
  809b20:	48 8d 3d e9 0b 00 00 	lea    0xbe9(%rip),%rdi        # 80a710 <trans_char+0xc0>
  809b27:	48 89 ee             	mov    %rbp,%rsi
  809b2a:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  809b2c:	0f 97 c0             	seta   %al
  809b2f:	1c 00                	sbb    $0x0,%al
  809b31:	0f be c0             	movsbl %al,%eax
  809b34:	85 c0                	test   %eax,%eax
  809b36:	0f 84 74 fc ff ff    	je     8097b0 <submitr+0x2e7>
  809b3c:	b9 05 00 00 00       	mov    $0x5,%ecx
  809b41:	48 8d 3d cc 0b 00 00 	lea    0xbcc(%rip),%rdi        # 80a714 <trans_char+0xc4>
  809b48:	48 89 ee             	mov    %rbp,%rsi
  809b4b:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  809b4d:	0f 97 c0             	seta   %al
  809b50:	1c 00                	sbb    $0x0,%al
  809b52:	0f be c0             	movsbl %al,%eax
  809b55:	85 c0                	test   %eax,%eax
  809b57:	0f 84 53 fc ff ff    	je     8097b0 <submitr+0x2e7>
  809b5d:	b9 03 00 00 00       	mov    $0x3,%ecx
  809b62:	48 8d 3d b0 0b 00 00 	lea    0xbb0(%rip),%rdi        # 80a719 <trans_char+0xc9>
  809b69:	48 89 ee             	mov    %rbp,%rsi
  809b6c:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  809b6e:	0f 97 c0             	seta   %al
  809b71:	1c 00                	sbb    $0x0,%al
  809b73:	0f be c0             	movsbl %al,%eax
  809b76:	85 c0                	test   %eax,%eax
  809b78:	0f 84 32 fc ff ff    	je     8097b0 <submitr+0x2e7>
  809b7e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809b83:	e9 28 fc ff ff       	jmpq   8097b0 <submitr+0x2e7>
  809b88:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  809b8f:	3a 20 43 
  809b92:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  809b99:	20 75 6e 
  809b9c:	48 89 45 00          	mov    %rax,0x0(%rbp)
  809ba0:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  809ba4:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809bab:	74 6f 20 
  809bae:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
  809bb5:	73 74 61 
  809bb8:	48 89 45 10          	mov    %rax,0x10(%rbp)
  809bbc:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  809bc0:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  809bc7:	65 73 73 
  809bca:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
  809bd1:	72 6f 6d 
  809bd4:	48 89 45 20          	mov    %rax,0x20(%rbp)
  809bd8:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  809bdc:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  809be3:	6c 74 20 
  809be6:	48 89 45 30          	mov    %rax,0x30(%rbp)
  809bea:	c7 45 38 73 65 72 76 	movl   $0x76726573,0x38(%rbp)
  809bf1:	66 c7 45 3c 65 72    	movw   $0x7265,0x3c(%rbp)
  809bf7:	c6 45 3e 00          	movb   $0x0,0x3e(%rbp)
  809bfb:	89 df                	mov    %ebx,%edi
  809bfd:	e8 1e 71 bf ff       	callq  400d20 <close@plt>
  809c02:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809c07:	e9 a4 fb ff ff       	jmpq   8097b0 <submitr+0x2e7>
  809c0c:	4c 8d 8c 24 50 80 00 	lea    0x8050(%rsp),%r9
  809c13:	00 
  809c14:	48 8d 0d ad 0a 00 00 	lea    0xaad(%rip),%rcx        # 80a6c8 <trans_char+0x78>
  809c1b:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  809c22:	be 01 00 00 00       	mov    $0x1,%esi
  809c27:	48 89 ef             	mov    %rbp,%rdi
  809c2a:	b8 00 00 00 00       	mov    $0x0,%eax
  809c2f:	e8 1c 72 bf ff       	callq  400e50 <__sprintf_chk@plt>
  809c34:	89 df                	mov    %ebx,%edi
  809c36:	e8 e5 70 bf ff       	callq  400d20 <close@plt>
  809c3b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809c40:	e9 6b fb ff ff       	jmpq   8097b0 <submitr+0x2e7>
  809c45:	e8 96 70 bf ff       	callq  400ce0 <__stack_chk_fail@plt>

0000000000809c4a <init_timeout>:
  809c4a:	85 ff                	test   %edi,%edi
  809c4c:	74 28                	je     809c76 <init_timeout+0x2c>
  809c4e:	53                   	push   %rbx
  809c4f:	89 fb                	mov    %edi,%ebx
  809c51:	85 ff                	test   %edi,%edi
  809c53:	78 1a                	js     809c6f <init_timeout+0x25>
  809c55:	48 8d 35 9d f5 ff ff 	lea    -0xa63(%rip),%rsi        # 8091f9 <sigalrm_handler>
  809c5c:	bf 0e 00 00 00       	mov    $0xe,%edi
  809c61:	e8 da 70 bf ff       	callq  400d40 <signal@plt>
  809c66:	89 df                	mov    %ebx,%edi
  809c68:	e8 a3 70 bf ff       	callq  400d10 <alarm@plt>
  809c6d:	5b                   	pop    %rbx
  809c6e:	c3                   	retq   
  809c6f:	bb 00 00 00 00       	mov    $0x0,%ebx
  809c74:	eb df                	jmp    809c55 <init_timeout+0xb>
  809c76:	f3 c3                	repz retq 

0000000000809c78 <init_driver>:
  809c78:	41 54                	push   %r12
  809c7a:	55                   	push   %rbp
  809c7b:	53                   	push   %rbx
  809c7c:	48 83 ec 20          	sub    $0x20,%rsp
  809c80:	49 89 fc             	mov    %rdi,%r12
  809c83:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  809c8a:	00 00 
  809c8c:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  809c91:	31 c0                	xor    %eax,%eax
  809c93:	be 01 00 00 00       	mov    $0x1,%esi
  809c98:	bf 0d 00 00 00       	mov    $0xd,%edi
  809c9d:	e8 9e 70 bf ff       	callq  400d40 <signal@plt>
  809ca2:	be 01 00 00 00       	mov    $0x1,%esi
  809ca7:	bf 1d 00 00 00       	mov    $0x1d,%edi
  809cac:	e8 8f 70 bf ff       	callq  400d40 <signal@plt>
  809cb1:	be 01 00 00 00       	mov    $0x1,%esi
  809cb6:	bf 1d 00 00 00       	mov    $0x1d,%edi
  809cbb:	e8 80 70 bf ff       	callq  400d40 <signal@plt>
  809cc0:	ba 00 00 00 00       	mov    $0x0,%edx
  809cc5:	be 01 00 00 00       	mov    $0x1,%esi
  809cca:	bf 02 00 00 00       	mov    $0x2,%edi
  809ccf:	e8 8c 71 bf ff       	callq  400e60 <socket@plt>
  809cd4:	85 c0                	test   %eax,%eax
  809cd6:	0f 88 a3 00 00 00    	js     809d7f <init_driver+0x107>
  809cdc:	89 c3                	mov    %eax,%ebx
  809cde:	48 8d 3d 5c 05 00 00 	lea    0x55c(%rip),%rdi        # 80a241 <_IO_stdin_used+0x251>
  809ce5:	e8 66 70 bf ff       	callq  400d50 <gethostbyname@plt>
  809cea:	48 85 c0             	test   %rax,%rax
  809ced:	0f 84 df 00 00 00    	je     809dd2 <init_driver+0x15a>
  809cf3:	48 89 e5             	mov    %rsp,%rbp
  809cf6:	48 c7 44 24 02 00 00 	movq   $0x0,0x2(%rsp)
  809cfd:	00 00 
  809cff:	c7 45 0a 00 00 00 00 	movl   $0x0,0xa(%rbp)
  809d06:	66 c7 45 0e 00 00    	movw   $0x0,0xe(%rbp)
  809d0c:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  809d12:	48 63 50 14          	movslq 0x14(%rax),%rdx
  809d16:	48 8b 40 18          	mov    0x18(%rax),%rax
  809d1a:	48 8b 30             	mov    (%rax),%rsi
  809d1d:	48 8d 7d 04          	lea    0x4(%rbp),%rdi
  809d21:	b9 0c 00 00 00       	mov    $0xc,%ecx
  809d26:	e8 35 70 bf ff       	callq  400d60 <__memmove_chk@plt>
  809d2b:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  809d32:	ba 10 00 00 00       	mov    $0x10,%edx
  809d37:	48 89 ee             	mov    %rbp,%rsi
  809d3a:	89 df                	mov    %ebx,%edi
  809d3c:	e8 ef 70 bf ff       	callq  400e30 <connect@plt>
  809d41:	85 c0                	test   %eax,%eax
  809d43:	0f 88 fb 00 00 00    	js     809e44 <init_driver+0x1cc>
  809d49:	89 df                	mov    %ebx,%edi
  809d4b:	e8 d0 6f bf ff       	callq  400d20 <close@plt>
  809d50:	66 41 c7 04 24 4f 4b 	movw   $0x4b4f,(%r12)
  809d57:	41 c6 44 24 02 00    	movb   $0x0,0x2(%r12)
  809d5d:	b8 00 00 00 00       	mov    $0x0,%eax
  809d62:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  809d67:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  809d6e:	00 00 
  809d70:	0f 85 28 01 00 00    	jne    809e9e <init_driver+0x226>
  809d76:	48 83 c4 20          	add    $0x20,%rsp
  809d7a:	5b                   	pop    %rbx
  809d7b:	5d                   	pop    %rbp
  809d7c:	41 5c                	pop    %r12
  809d7e:	c3                   	retq   
  809d7f:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  809d86:	3a 20 43 
  809d89:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  809d90:	20 75 6e 
  809d93:	49 89 04 24          	mov    %rax,(%r12)
  809d97:	49 89 54 24 08       	mov    %rdx,0x8(%r12)
  809d9c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809da3:	74 6f 20 
  809da6:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  809dad:	65 20 73 
  809db0:	49 89 44 24 10       	mov    %rax,0x10(%r12)
  809db5:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
  809dba:	41 c7 44 24 20 6f 63 	movl   $0x656b636f,0x20(%r12)
  809dc1:	6b 65 
  809dc3:	66 41 c7 44 24 24 74 	movw   $0x74,0x24(%r12)
  809dca:	00 
  809dcb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809dd0:	eb 90                	jmp    809d62 <init_driver+0xea>
  809dd2:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  809dd9:	3a 20 44 
  809ddc:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  809de3:	20 75 6e 
  809de6:	49 89 04 24          	mov    %rax,(%r12)
  809dea:	49 89 54 24 08       	mov    %rdx,0x8(%r12)
  809def:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  809df6:	74 6f 20 
  809df9:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  809e00:	76 65 20 
  809e03:	49 89 44 24 10       	mov    %rax,0x10(%r12)
  809e08:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
  809e0d:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  809e14:	72 20 61 
  809e17:	49 89 44 24 20       	mov    %rax,0x20(%r12)
  809e1c:	41 c7 44 24 28 64 64 	movl   $0x65726464,0x28(%r12)
  809e23:	72 65 
  809e25:	66 41 c7 44 24 2c 73 	movw   $0x7373,0x2c(%r12)
  809e2c:	73 
  809e2d:	41 c6 44 24 2e 00    	movb   $0x0,0x2e(%r12)
  809e33:	89 df                	mov    %ebx,%edi
  809e35:	e8 e6 6e bf ff       	callq  400d20 <close@plt>
  809e3a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809e3f:	e9 1e ff ff ff       	jmpq   809d62 <init_driver+0xea>
  809e44:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  809e4b:	3a 20 55 
  809e4e:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  809e55:	20 74 6f 
  809e58:	49 89 04 24          	mov    %rax,(%r12)
  809e5c:	49 89 54 24 08       	mov    %rdx,0x8(%r12)
  809e61:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  809e68:	65 63 74 
  809e6b:	48 ba 20 74 6f 20 73 	movabs $0x76726573206f7420,%rdx
  809e72:	65 72 76 
  809e75:	49 89 44 24 10       	mov    %rax,0x10(%r12)
  809e7a:	49 89 54 24 18       	mov    %rdx,0x18(%r12)
  809e7f:	66 41 c7 44 24 20 65 	movw   $0x7265,0x20(%r12)
  809e86:	72 
  809e87:	41 c6 44 24 22 00    	movb   $0x0,0x22(%r12)
  809e8d:	89 df                	mov    %ebx,%edi
  809e8f:	e8 8c 6e bf ff       	callq  400d20 <close@plt>
  809e94:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  809e99:	e9 c4 fe ff ff       	jmpq   809d62 <init_driver+0xea>
  809e9e:	e8 3d 6e bf ff       	callq  400ce0 <__stack_chk_fail@plt>

0000000000809ea3 <driver_post>:
  809ea3:	53                   	push   %rbx
  809ea4:	4c 89 cb             	mov    %r9,%rbx
  809ea7:	45 85 c0             	test   %r8d,%r8d
  809eaa:	75 18                	jne    809ec4 <driver_post+0x21>
  809eac:	48 85 ff             	test   %rdi,%rdi
  809eaf:	74 05                	je     809eb6 <driver_post+0x13>
  809eb1:	80 3f 00             	cmpb   $0x0,(%rdi)
  809eb4:	75 37                	jne    809eed <driver_post+0x4a>
  809eb6:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  809ebb:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  809ebf:	44 89 c0             	mov    %r8d,%eax
  809ec2:	5b                   	pop    %rbx
  809ec3:	c3                   	retq   
  809ec4:	48 89 ca             	mov    %rcx,%rdx
  809ec7:	48 8d 35 4e 08 00 00 	lea    0x84e(%rip),%rsi        # 80a71c <trans_char+0xcc>
  809ece:	bf 01 00 00 00       	mov    $0x1,%edi
  809ed3:	b8 00 00 00 00       	mov    $0x0,%eax
  809ed8:	e8 03 6f bf ff       	callq  400de0 <__printf_chk@plt>
  809edd:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  809ee2:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  809ee6:	b8 00 00 00 00       	mov    $0x0,%eax
  809eeb:	eb d5                	jmp    809ec2 <driver_post+0x1f>
  809eed:	48 83 ec 08          	sub    $0x8,%rsp
  809ef1:	41 51                	push   %r9
  809ef3:	49 89 c9             	mov    %rcx,%r9
  809ef6:	49 89 d0             	mov    %rdx,%r8
  809ef9:	48 89 f9             	mov    %rdi,%rcx
  809efc:	48 89 f2             	mov    %rsi,%rdx
  809eff:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  809f04:	48 8d 3d 36 03 00 00 	lea    0x336(%rip),%rdi        # 80a241 <_IO_stdin_used+0x251>
  809f0b:	e8 b9 f5 ff ff       	callq  8094c9 <submitr>
  809f10:	48 83 c4 10          	add    $0x10,%rsp
  809f14:	eb ac                	jmp    809ec2 <driver_post+0x1f>

0000000000809f16 <check>:
  809f16:	89 f8                	mov    %edi,%eax
  809f18:	c1 e8 1c             	shr    $0x1c,%eax
  809f1b:	85 c0                	test   %eax,%eax
  809f1d:	74 1d                	je     809f3c <check+0x26>
  809f1f:	b9 00 00 00 00       	mov    $0x0,%ecx
  809f24:	83 f9 1f             	cmp    $0x1f,%ecx
  809f27:	7f 0d                	jg     809f36 <check+0x20>
  809f29:	89 f8                	mov    %edi,%eax
  809f2b:	d3 e8                	shr    %cl,%eax
  809f2d:	3c 0a                	cmp    $0xa,%al
  809f2f:	74 11                	je     809f42 <check+0x2c>
  809f31:	83 c1 08             	add    $0x8,%ecx
  809f34:	eb ee                	jmp    809f24 <check+0xe>
  809f36:	b8 01 00 00 00       	mov    $0x1,%eax
  809f3b:	c3                   	retq   
  809f3c:	b8 00 00 00 00       	mov    $0x0,%eax
  809f41:	c3                   	retq   
  809f42:	b8 00 00 00 00       	mov    $0x0,%eax
  809f47:	c3                   	retq   

0000000000809f48 <gencookie>:
  809f48:	53                   	push   %rbx
  809f49:	83 c7 01             	add    $0x1,%edi
  809f4c:	e8 3f 6d bf ff       	callq  400c90 <srandom@plt>
  809f51:	e8 4a 6e bf ff       	callq  400da0 <random@plt>
  809f56:	89 c3                	mov    %eax,%ebx
  809f58:	89 c7                	mov    %eax,%edi
  809f5a:	e8 b7 ff ff ff       	callq  809f16 <check>
  809f5f:	85 c0                	test   %eax,%eax
  809f61:	74 ee                	je     809f51 <gencookie+0x9>
  809f63:	89 d8                	mov    %ebx,%eax
  809f65:	5b                   	pop    %rbx
  809f66:	c3                   	retq   
  809f67:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  809f6e:	00 00 

0000000000809f70 <__libc_csu_init>:
  809f70:	41 57                	push   %r15
  809f72:	41 56                	push   %r14
  809f74:	49 89 d7             	mov    %rdx,%r15
  809f77:	41 55                	push   %r13
  809f79:	41 54                	push   %r12
  809f7b:	4c 8d 25 8e 1e 20 00 	lea    0x201e8e(%rip),%r12        # a0be10 <__frame_dummy_init_array_entry>
  809f82:	55                   	push   %rbp
  809f83:	48 8d 2d 8e 1e 20 00 	lea    0x201e8e(%rip),%rbp        # a0be18 <__do_global_dtors_aux_fini_array_entry>
  809f8a:	53                   	push   %rbx
  809f8b:	41 89 fd             	mov    %edi,%r13d
  809f8e:	49 89 f6             	mov    %rsi,%r14
  809f91:	4c 29 e5             	sub    %r12,%rbp
  809f94:	48 83 ec 08          	sub    $0x8,%rsp
  809f98:	48 c1 fd 03          	sar    $0x3,%rbp
  809f9c:	e8 a7 6c bf ff       	callq  400c48 <_init>
  809fa1:	48 85 ed             	test   %rbp,%rbp
  809fa4:	74 20                	je     809fc6 <__libc_csu_init+0x56>
  809fa6:	31 db                	xor    %ebx,%ebx
  809fa8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  809faf:	00 
  809fb0:	4c 89 fa             	mov    %r15,%rdx
  809fb3:	4c 89 f6             	mov    %r14,%rsi
  809fb6:	44 89 ef             	mov    %r13d,%edi
  809fb9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  809fbd:	48 83 c3 01          	add    $0x1,%rbx
  809fc1:	48 39 dd             	cmp    %rbx,%rbp
  809fc4:	75 ea                	jne    809fb0 <__libc_csu_init+0x40>
  809fc6:	48 83 c4 08          	add    $0x8,%rsp
  809fca:	5b                   	pop    %rbx
  809fcb:	5d                   	pop    %rbp
  809fcc:	41 5c                	pop    %r12
  809fce:	41 5d                	pop    %r13
  809fd0:	41 5e                	pop    %r14
  809fd2:	41 5f                	pop    %r15
  809fd4:	c3                   	retq   
  809fd5:	90                   	nop
  809fd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  809fdd:	00 00 00 

0000000000809fe0 <__libc_csu_fini>:
  809fe0:	f3 c3                	repz retq 

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

0000000000809fe4 <_fini>:
  809fe4:	48 83 ec 08          	sub    $0x8,%rsp
  809fe8:	48 83 c4 08          	add    $0x8,%rsp
  809fec:	c3                   	retq   
