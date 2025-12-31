
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	00014297          	auipc	t0,0x14
ffffffffc0200004:	00028293          	mv	t0,t0
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc0214000 <boot_hartid>
ffffffffc020000c:	00014297          	auipc	t0,0x14
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc0214008 <boot_dtb>
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)
ffffffffc0200018:	c02132b7          	lui	t0,0xc0213
ffffffffc020001c:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200020:	037a                	slli	t1,t1,0x1e
ffffffffc0200022:	406282b3          	sub	t0,t0,t1
ffffffffc0200026:	00c2d293          	srli	t0,t0,0xc
ffffffffc020002a:	fff0031b          	addiw	t1,zero,-1
ffffffffc020002e:	137e                	slli	t1,t1,0x3f
ffffffffc0200030:	0062e2b3          	or	t0,t0,t1
ffffffffc0200034:	18029073          	csrw	satp,t0
ffffffffc0200038:	12000073          	sfence.vma
ffffffffc020003c:	c0213137          	lui	sp,0xc0213
ffffffffc0200040:	c02002b7          	lui	t0,0xc0200
ffffffffc0200044:	04a28293          	addi	t0,t0,74 # ffffffffc020004a <kern_init>
ffffffffc0200048:	8282                	jr	t0

ffffffffc020004a <kern_init>:
ffffffffc020004a:	00091517          	auipc	a0,0x91
ffffffffc020004e:	04650513          	addi	a0,a0,70 # ffffffffc0291090 <buf>
ffffffffc0200052:	00097617          	auipc	a2,0x97
ffffffffc0200056:	8ee60613          	addi	a2,a2,-1810 # ffffffffc0296940 <end>
ffffffffc020005a:	1141                	addi	sp,sp,-16
ffffffffc020005c:	8e09                	sub	a2,a2,a0
ffffffffc020005e:	4581                	li	a1,0
ffffffffc0200060:	e406                	sd	ra,8(sp)
ffffffffc0200062:	2c90b0ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0200066:	52c000ef          	jal	ra,ffffffffc0200592 <cons_init>
ffffffffc020006a:	0000c597          	auipc	a1,0xc
ffffffffc020006e:	b2e58593          	addi	a1,a1,-1234 # ffffffffc020bb98 <etext+0x4>
ffffffffc0200072:	0000c517          	auipc	a0,0xc
ffffffffc0200076:	b4650513          	addi	a0,a0,-1210 # ffffffffc020bbb8 <etext+0x24>
ffffffffc020007a:	12c000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020007e:	1ae000ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc0200082:	62a000ef          	jal	ra,ffffffffc02006ac <dtb_init>
ffffffffc0200086:	2d7020ef          	jal	ra,ffffffffc0202b5c <pmm_init>
ffffffffc020008a:	3ef000ef          	jal	ra,ffffffffc0200c78 <pic_init>
ffffffffc020008e:	515000ef          	jal	ra,ffffffffc0200da2 <idt_init>
ffffffffc0200092:	767030ef          	jal	ra,ffffffffc0203ff8 <vmm_init>
ffffffffc0200096:	76c070ef          	jal	ra,ffffffffc0207802 <sched_init>
ffffffffc020009a:	5cb060ef          	jal	ra,ffffffffc0206e64 <proc_init>
ffffffffc020009e:	1bf000ef          	jal	ra,ffffffffc0200a5c <ide_init>
ffffffffc02000a2:	198050ef          	jal	ra,ffffffffc020523a <fs_init>
ffffffffc02000a6:	4a4000ef          	jal	ra,ffffffffc020054a <clock_init>
ffffffffc02000aa:	3c3000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02000ae:	783060ef          	jal	ra,ffffffffc0207030 <cpu_idle>

ffffffffc02000b2 <readline>:
ffffffffc02000b2:	715d                	addi	sp,sp,-80
ffffffffc02000b4:	e486                	sd	ra,72(sp)
ffffffffc02000b6:	e0a6                	sd	s1,64(sp)
ffffffffc02000b8:	fc4a                	sd	s2,56(sp)
ffffffffc02000ba:	f84e                	sd	s3,48(sp)
ffffffffc02000bc:	f452                	sd	s4,40(sp)
ffffffffc02000be:	f056                	sd	s5,32(sp)
ffffffffc02000c0:	ec5a                	sd	s6,24(sp)
ffffffffc02000c2:	e85e                	sd	s7,16(sp)
ffffffffc02000c4:	c901                	beqz	a0,ffffffffc02000d4 <readline+0x22>
ffffffffc02000c6:	85aa                	mv	a1,a0
ffffffffc02000c8:	0000c517          	auipc	a0,0xc
ffffffffc02000cc:	af850513          	addi	a0,a0,-1288 # ffffffffc020bbc0 <etext+0x2c>
ffffffffc02000d0:	0d6000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02000d4:	4481                	li	s1,0
ffffffffc02000d6:	497d                	li	s2,31
ffffffffc02000d8:	49a1                	li	s3,8
ffffffffc02000da:	4aa9                	li	s5,10
ffffffffc02000dc:	4b35                	li	s6,13
ffffffffc02000de:	00091b97          	auipc	s7,0x91
ffffffffc02000e2:	fb2b8b93          	addi	s7,s7,-78 # ffffffffc0291090 <buf>
ffffffffc02000e6:	3fe00a13          	li	s4,1022
ffffffffc02000ea:	0fa000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000ee:	00054a63          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc02000f2:	00a95a63          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc02000f6:	029a5263          	bge	s4,s1,ffffffffc020011a <readline+0x68>
ffffffffc02000fa:	0ea000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000fe:	fe055ae3          	bgez	a0,ffffffffc02000f2 <readline+0x40>
ffffffffc0200102:	4501                	li	a0,0
ffffffffc0200104:	a091                	j	ffffffffc0200148 <readline+0x96>
ffffffffc0200106:	03351463          	bne	a0,s3,ffffffffc020012e <readline+0x7c>
ffffffffc020010a:	e8a9                	bnez	s1,ffffffffc020015c <readline+0xaa>
ffffffffc020010c:	0d8000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc0200110:	fe0549e3          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc0200114:	fea959e3          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc0200118:	4481                	li	s1,0
ffffffffc020011a:	e42a                	sd	a0,8(sp)
ffffffffc020011c:	0c6000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200120:	6522                	ld	a0,8(sp)
ffffffffc0200122:	009b87b3          	add	a5,s7,s1
ffffffffc0200126:	2485                	addiw	s1,s1,1
ffffffffc0200128:	00a78023          	sb	a0,0(a5)
ffffffffc020012c:	bf7d                	j	ffffffffc02000ea <readline+0x38>
ffffffffc020012e:	01550463          	beq	a0,s5,ffffffffc0200136 <readline+0x84>
ffffffffc0200132:	fb651ce3          	bne	a0,s6,ffffffffc02000ea <readline+0x38>
ffffffffc0200136:	0ac000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc020013a:	00091517          	auipc	a0,0x91
ffffffffc020013e:	f5650513          	addi	a0,a0,-170 # ffffffffc0291090 <buf>
ffffffffc0200142:	94aa                	add	s1,s1,a0
ffffffffc0200144:	00048023          	sb	zero,0(s1)
ffffffffc0200148:	60a6                	ld	ra,72(sp)
ffffffffc020014a:	6486                	ld	s1,64(sp)
ffffffffc020014c:	7962                	ld	s2,56(sp)
ffffffffc020014e:	79c2                	ld	s3,48(sp)
ffffffffc0200150:	7a22                	ld	s4,40(sp)
ffffffffc0200152:	7a82                	ld	s5,32(sp)
ffffffffc0200154:	6b62                	ld	s6,24(sp)
ffffffffc0200156:	6bc2                	ld	s7,16(sp)
ffffffffc0200158:	6161                	addi	sp,sp,80
ffffffffc020015a:	8082                	ret
ffffffffc020015c:	4521                	li	a0,8
ffffffffc020015e:	084000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200162:	34fd                	addiw	s1,s1,-1
ffffffffc0200164:	b759                	j	ffffffffc02000ea <readline+0x38>

ffffffffc0200166 <cputch>:
ffffffffc0200166:	1141                	addi	sp,sp,-16
ffffffffc0200168:	e022                	sd	s0,0(sp)
ffffffffc020016a:	e406                	sd	ra,8(sp)
ffffffffc020016c:	842e                	mv	s0,a1
ffffffffc020016e:	432000ef          	jal	ra,ffffffffc02005a0 <cons_putc>
ffffffffc0200172:	401c                	lw	a5,0(s0)
ffffffffc0200174:	60a2                	ld	ra,8(sp)
ffffffffc0200176:	2785                	addiw	a5,a5,1
ffffffffc0200178:	c01c                	sw	a5,0(s0)
ffffffffc020017a:	6402                	ld	s0,0(sp)
ffffffffc020017c:	0141                	addi	sp,sp,16
ffffffffc020017e:	8082                	ret

ffffffffc0200180 <vcprintf>:
ffffffffc0200180:	1101                	addi	sp,sp,-32
ffffffffc0200182:	872e                	mv	a4,a1
ffffffffc0200184:	75dd                	lui	a1,0xffff7
ffffffffc0200186:	86aa                	mv	a3,a0
ffffffffc0200188:	0070                	addi	a2,sp,12
ffffffffc020018a:	00000517          	auipc	a0,0x0
ffffffffc020018e:	fdc50513          	addi	a0,a0,-36 # ffffffffc0200166 <cputch>
ffffffffc0200192:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd60199>
ffffffffc0200196:	ec06                	sd	ra,24(sp)
ffffffffc0200198:	c602                	sw	zero,12(sp)
ffffffffc020019a:	5020b0ef          	jal	ra,ffffffffc020b69c <vprintfmt>
ffffffffc020019e:	60e2                	ld	ra,24(sp)
ffffffffc02001a0:	4532                	lw	a0,12(sp)
ffffffffc02001a2:	6105                	addi	sp,sp,32
ffffffffc02001a4:	8082                	ret

ffffffffc02001a6 <cprintf>:
ffffffffc02001a6:	711d                	addi	sp,sp,-96
ffffffffc02001a8:	02810313          	addi	t1,sp,40 # ffffffffc0213028 <boot_page_table_sv39+0x28>
ffffffffc02001ac:	8e2a                	mv	t3,a0
ffffffffc02001ae:	f42e                	sd	a1,40(sp)
ffffffffc02001b0:	75dd                	lui	a1,0xffff7
ffffffffc02001b2:	f832                	sd	a2,48(sp)
ffffffffc02001b4:	fc36                	sd	a3,56(sp)
ffffffffc02001b6:	e0ba                	sd	a4,64(sp)
ffffffffc02001b8:	00000517          	auipc	a0,0x0
ffffffffc02001bc:	fae50513          	addi	a0,a0,-82 # ffffffffc0200166 <cputch>
ffffffffc02001c0:	0050                	addi	a2,sp,4
ffffffffc02001c2:	871a                	mv	a4,t1
ffffffffc02001c4:	86f2                	mv	a3,t3
ffffffffc02001c6:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd60199>
ffffffffc02001ca:	ec06                	sd	ra,24(sp)
ffffffffc02001cc:	e4be                	sd	a5,72(sp)
ffffffffc02001ce:	e8c2                	sd	a6,80(sp)
ffffffffc02001d0:	ecc6                	sd	a7,88(sp)
ffffffffc02001d2:	e41a                	sd	t1,8(sp)
ffffffffc02001d4:	c202                	sw	zero,4(sp)
ffffffffc02001d6:	4c60b0ef          	jal	ra,ffffffffc020b69c <vprintfmt>
ffffffffc02001da:	60e2                	ld	ra,24(sp)
ffffffffc02001dc:	4512                	lw	a0,4(sp)
ffffffffc02001de:	6125                	addi	sp,sp,96
ffffffffc02001e0:	8082                	ret

ffffffffc02001e2 <cputchar>:
ffffffffc02001e2:	ae7d                	j	ffffffffc02005a0 <cons_putc>

ffffffffc02001e4 <getchar>:
ffffffffc02001e4:	1141                	addi	sp,sp,-16
ffffffffc02001e6:	e406                	sd	ra,8(sp)
ffffffffc02001e8:	40c000ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc02001ec:	dd75                	beqz	a0,ffffffffc02001e8 <getchar+0x4>
ffffffffc02001ee:	60a2                	ld	ra,8(sp)
ffffffffc02001f0:	0141                	addi	sp,sp,16
ffffffffc02001f2:	8082                	ret

ffffffffc02001f4 <strdup>:
ffffffffc02001f4:	1101                	addi	sp,sp,-32
ffffffffc02001f6:	ec06                	sd	ra,24(sp)
ffffffffc02001f8:	e822                	sd	s0,16(sp)
ffffffffc02001fa:	e426                	sd	s1,8(sp)
ffffffffc02001fc:	e04a                	sd	s2,0(sp)
ffffffffc02001fe:	892a                	mv	s2,a0
ffffffffc0200200:	0890b0ef          	jal	ra,ffffffffc020ba88 <strlen>
ffffffffc0200204:	842a                	mv	s0,a0
ffffffffc0200206:	0505                	addi	a0,a0,1
ffffffffc0200208:	613010ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc020020c:	84aa                	mv	s1,a0
ffffffffc020020e:	c901                	beqz	a0,ffffffffc020021e <strdup+0x2a>
ffffffffc0200210:	8622                	mv	a2,s0
ffffffffc0200212:	85ca                	mv	a1,s2
ffffffffc0200214:	9426                	add	s0,s0,s1
ffffffffc0200216:	1670b0ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc020021a:	00040023          	sb	zero,0(s0)
ffffffffc020021e:	60e2                	ld	ra,24(sp)
ffffffffc0200220:	6442                	ld	s0,16(sp)
ffffffffc0200222:	6902                	ld	s2,0(sp)
ffffffffc0200224:	8526                	mv	a0,s1
ffffffffc0200226:	64a2                	ld	s1,8(sp)
ffffffffc0200228:	6105                	addi	sp,sp,32
ffffffffc020022a:	8082                	ret

ffffffffc020022c <print_kerninfo>:
ffffffffc020022c:	1141                	addi	sp,sp,-16
ffffffffc020022e:	0000c517          	auipc	a0,0xc
ffffffffc0200232:	99a50513          	addi	a0,a0,-1638 # ffffffffc020bbc8 <etext+0x34>
ffffffffc0200236:	e406                	sd	ra,8(sp)
ffffffffc0200238:	f6fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020023c:	00000597          	auipc	a1,0x0
ffffffffc0200240:	e0e58593          	addi	a1,a1,-498 # ffffffffc020004a <kern_init>
ffffffffc0200244:	0000c517          	auipc	a0,0xc
ffffffffc0200248:	9a450513          	addi	a0,a0,-1628 # ffffffffc020bbe8 <etext+0x54>
ffffffffc020024c:	f5bff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200250:	0000c597          	auipc	a1,0xc
ffffffffc0200254:	94458593          	addi	a1,a1,-1724 # ffffffffc020bb94 <etext>
ffffffffc0200258:	0000c517          	auipc	a0,0xc
ffffffffc020025c:	9b050513          	addi	a0,a0,-1616 # ffffffffc020bc08 <etext+0x74>
ffffffffc0200260:	f47ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200264:	00091597          	auipc	a1,0x91
ffffffffc0200268:	e2c58593          	addi	a1,a1,-468 # ffffffffc0291090 <buf>
ffffffffc020026c:	0000c517          	auipc	a0,0xc
ffffffffc0200270:	9bc50513          	addi	a0,a0,-1604 # ffffffffc020bc28 <etext+0x94>
ffffffffc0200274:	f33ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200278:	00096597          	auipc	a1,0x96
ffffffffc020027c:	6c858593          	addi	a1,a1,1736 # ffffffffc0296940 <end>
ffffffffc0200280:	0000c517          	auipc	a0,0xc
ffffffffc0200284:	9c850513          	addi	a0,a0,-1592 # ffffffffc020bc48 <etext+0xb4>
ffffffffc0200288:	f1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020028c:	00097597          	auipc	a1,0x97
ffffffffc0200290:	ab358593          	addi	a1,a1,-1357 # ffffffffc0296d3f <end+0x3ff>
ffffffffc0200294:	00000797          	auipc	a5,0x0
ffffffffc0200298:	db678793          	addi	a5,a5,-586 # ffffffffc020004a <kern_init>
ffffffffc020029c:	40f587b3          	sub	a5,a1,a5
ffffffffc02002a0:	43f7d593          	srai	a1,a5,0x3f
ffffffffc02002a4:	60a2                	ld	ra,8(sp)
ffffffffc02002a6:	3ff5f593          	andi	a1,a1,1023
ffffffffc02002aa:	95be                	add	a1,a1,a5
ffffffffc02002ac:	85a9                	srai	a1,a1,0xa
ffffffffc02002ae:	0000c517          	auipc	a0,0xc
ffffffffc02002b2:	9ba50513          	addi	a0,a0,-1606 # ffffffffc020bc68 <etext+0xd4>
ffffffffc02002b6:	0141                	addi	sp,sp,16
ffffffffc02002b8:	b5fd                	j	ffffffffc02001a6 <cprintf>

ffffffffc02002ba <print_stackframe>:
ffffffffc02002ba:	1141                	addi	sp,sp,-16
ffffffffc02002bc:	0000c617          	auipc	a2,0xc
ffffffffc02002c0:	9dc60613          	addi	a2,a2,-1572 # ffffffffc020bc98 <etext+0x104>
ffffffffc02002c4:	04e00593          	li	a1,78
ffffffffc02002c8:	0000c517          	auipc	a0,0xc
ffffffffc02002cc:	9e850513          	addi	a0,a0,-1560 # ffffffffc020bcb0 <etext+0x11c>
ffffffffc02002d0:	e406                	sd	ra,8(sp)
ffffffffc02002d2:	1cc000ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02002d6 <mon_help>:
ffffffffc02002d6:	1141                	addi	sp,sp,-16
ffffffffc02002d8:	0000c617          	auipc	a2,0xc
ffffffffc02002dc:	9f060613          	addi	a2,a2,-1552 # ffffffffc020bcc8 <etext+0x134>
ffffffffc02002e0:	0000c597          	auipc	a1,0xc
ffffffffc02002e4:	a0858593          	addi	a1,a1,-1528 # ffffffffc020bce8 <etext+0x154>
ffffffffc02002e8:	0000c517          	auipc	a0,0xc
ffffffffc02002ec:	a0850513          	addi	a0,a0,-1528 # ffffffffc020bcf0 <etext+0x15c>
ffffffffc02002f0:	e406                	sd	ra,8(sp)
ffffffffc02002f2:	eb5ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02002f6:	0000c617          	auipc	a2,0xc
ffffffffc02002fa:	a0a60613          	addi	a2,a2,-1526 # ffffffffc020bd00 <etext+0x16c>
ffffffffc02002fe:	0000c597          	auipc	a1,0xc
ffffffffc0200302:	a2a58593          	addi	a1,a1,-1494 # ffffffffc020bd28 <etext+0x194>
ffffffffc0200306:	0000c517          	auipc	a0,0xc
ffffffffc020030a:	9ea50513          	addi	a0,a0,-1558 # ffffffffc020bcf0 <etext+0x15c>
ffffffffc020030e:	e99ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200312:	0000c617          	auipc	a2,0xc
ffffffffc0200316:	a2660613          	addi	a2,a2,-1498 # ffffffffc020bd38 <etext+0x1a4>
ffffffffc020031a:	0000c597          	auipc	a1,0xc
ffffffffc020031e:	a3e58593          	addi	a1,a1,-1474 # ffffffffc020bd58 <etext+0x1c4>
ffffffffc0200322:	0000c517          	auipc	a0,0xc
ffffffffc0200326:	9ce50513          	addi	a0,a0,-1586 # ffffffffc020bcf0 <etext+0x15c>
ffffffffc020032a:	e7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020032e:	60a2                	ld	ra,8(sp)
ffffffffc0200330:	4501                	li	a0,0
ffffffffc0200332:	0141                	addi	sp,sp,16
ffffffffc0200334:	8082                	ret

ffffffffc0200336 <mon_kerninfo>:
ffffffffc0200336:	1141                	addi	sp,sp,-16
ffffffffc0200338:	e406                	sd	ra,8(sp)
ffffffffc020033a:	ef3ff0ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc020033e:	60a2                	ld	ra,8(sp)
ffffffffc0200340:	4501                	li	a0,0
ffffffffc0200342:	0141                	addi	sp,sp,16
ffffffffc0200344:	8082                	ret

ffffffffc0200346 <mon_backtrace>:
ffffffffc0200346:	1141                	addi	sp,sp,-16
ffffffffc0200348:	e406                	sd	ra,8(sp)
ffffffffc020034a:	f71ff0ef          	jal	ra,ffffffffc02002ba <print_stackframe>
ffffffffc020034e:	60a2                	ld	ra,8(sp)
ffffffffc0200350:	4501                	li	a0,0
ffffffffc0200352:	0141                	addi	sp,sp,16
ffffffffc0200354:	8082                	ret

ffffffffc0200356 <kmonitor>:
ffffffffc0200356:	7115                	addi	sp,sp,-224
ffffffffc0200358:	ed5e                	sd	s7,152(sp)
ffffffffc020035a:	8baa                	mv	s7,a0
ffffffffc020035c:	0000c517          	auipc	a0,0xc
ffffffffc0200360:	a0c50513          	addi	a0,a0,-1524 # ffffffffc020bd68 <etext+0x1d4>
ffffffffc0200364:	ed86                	sd	ra,216(sp)
ffffffffc0200366:	e9a2                	sd	s0,208(sp)
ffffffffc0200368:	e5a6                	sd	s1,200(sp)
ffffffffc020036a:	e1ca                	sd	s2,192(sp)
ffffffffc020036c:	fd4e                	sd	s3,184(sp)
ffffffffc020036e:	f952                	sd	s4,176(sp)
ffffffffc0200370:	f556                	sd	s5,168(sp)
ffffffffc0200372:	f15a                	sd	s6,160(sp)
ffffffffc0200374:	e962                	sd	s8,144(sp)
ffffffffc0200376:	e566                	sd	s9,136(sp)
ffffffffc0200378:	e16a                	sd	s10,128(sp)
ffffffffc020037a:	e2dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020037e:	0000c517          	auipc	a0,0xc
ffffffffc0200382:	a1250513          	addi	a0,a0,-1518 # ffffffffc020bd90 <etext+0x1fc>
ffffffffc0200386:	e21ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020038a:	000b8563          	beqz	s7,ffffffffc0200394 <kmonitor+0x3e>
ffffffffc020038e:	855e                	mv	a0,s7
ffffffffc0200390:	3fb000ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0200394:	0000cc17          	auipc	s8,0xc
ffffffffc0200398:	a6cc0c13          	addi	s8,s8,-1428 # ffffffffc020be00 <commands>
ffffffffc020039c:	0000c917          	auipc	s2,0xc
ffffffffc02003a0:	a1c90913          	addi	s2,s2,-1508 # ffffffffc020bdb8 <etext+0x224>
ffffffffc02003a4:	0000c497          	auipc	s1,0xc
ffffffffc02003a8:	a1c48493          	addi	s1,s1,-1508 # ffffffffc020bdc0 <etext+0x22c>
ffffffffc02003ac:	49bd                	li	s3,15
ffffffffc02003ae:	0000cb17          	auipc	s6,0xc
ffffffffc02003b2:	a1ab0b13          	addi	s6,s6,-1510 # ffffffffc020bdc8 <etext+0x234>
ffffffffc02003b6:	0000ca17          	auipc	s4,0xc
ffffffffc02003ba:	932a0a13          	addi	s4,s4,-1742 # ffffffffc020bce8 <etext+0x154>
ffffffffc02003be:	4a8d                	li	s5,3
ffffffffc02003c0:	854a                	mv	a0,s2
ffffffffc02003c2:	cf1ff0ef          	jal	ra,ffffffffc02000b2 <readline>
ffffffffc02003c6:	842a                	mv	s0,a0
ffffffffc02003c8:	dd65                	beqz	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003ca:	00054583          	lbu	a1,0(a0)
ffffffffc02003ce:	4c81                	li	s9,0
ffffffffc02003d0:	e1bd                	bnez	a1,ffffffffc0200436 <kmonitor+0xe0>
ffffffffc02003d2:	fe0c87e3          	beqz	s9,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003d6:	6582                	ld	a1,0(sp)
ffffffffc02003d8:	0000cd17          	auipc	s10,0xc
ffffffffc02003dc:	a28d0d13          	addi	s10,s10,-1496 # ffffffffc020be00 <commands>
ffffffffc02003e0:	8552                	mv	a0,s4
ffffffffc02003e2:	4401                	li	s0,0
ffffffffc02003e4:	0d61                	addi	s10,s10,24
ffffffffc02003e6:	6ea0b0ef          	jal	ra,ffffffffc020bad0 <strcmp>
ffffffffc02003ea:	c919                	beqz	a0,ffffffffc0200400 <kmonitor+0xaa>
ffffffffc02003ec:	2405                	addiw	s0,s0,1
ffffffffc02003ee:	0b540063          	beq	s0,s5,ffffffffc020048e <kmonitor+0x138>
ffffffffc02003f2:	000d3503          	ld	a0,0(s10)
ffffffffc02003f6:	6582                	ld	a1,0(sp)
ffffffffc02003f8:	0d61                	addi	s10,s10,24
ffffffffc02003fa:	6d60b0ef          	jal	ra,ffffffffc020bad0 <strcmp>
ffffffffc02003fe:	f57d                	bnez	a0,ffffffffc02003ec <kmonitor+0x96>
ffffffffc0200400:	00141793          	slli	a5,s0,0x1
ffffffffc0200404:	97a2                	add	a5,a5,s0
ffffffffc0200406:	078e                	slli	a5,a5,0x3
ffffffffc0200408:	97e2                	add	a5,a5,s8
ffffffffc020040a:	6b9c                	ld	a5,16(a5)
ffffffffc020040c:	865e                	mv	a2,s7
ffffffffc020040e:	002c                	addi	a1,sp,8
ffffffffc0200410:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200414:	9782                	jalr	a5
ffffffffc0200416:	fa0555e3          	bgez	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc020041a:	60ee                	ld	ra,216(sp)
ffffffffc020041c:	644e                	ld	s0,208(sp)
ffffffffc020041e:	64ae                	ld	s1,200(sp)
ffffffffc0200420:	690e                	ld	s2,192(sp)
ffffffffc0200422:	79ea                	ld	s3,184(sp)
ffffffffc0200424:	7a4a                	ld	s4,176(sp)
ffffffffc0200426:	7aaa                	ld	s5,168(sp)
ffffffffc0200428:	7b0a                	ld	s6,160(sp)
ffffffffc020042a:	6bea                	ld	s7,152(sp)
ffffffffc020042c:	6c4a                	ld	s8,144(sp)
ffffffffc020042e:	6caa                	ld	s9,136(sp)
ffffffffc0200430:	6d0a                	ld	s10,128(sp)
ffffffffc0200432:	612d                	addi	sp,sp,224
ffffffffc0200434:	8082                	ret
ffffffffc0200436:	8526                	mv	a0,s1
ffffffffc0200438:	6dc0b0ef          	jal	ra,ffffffffc020bb14 <strchr>
ffffffffc020043c:	c901                	beqz	a0,ffffffffc020044c <kmonitor+0xf6>
ffffffffc020043e:	00144583          	lbu	a1,1(s0)
ffffffffc0200442:	00040023          	sb	zero,0(s0)
ffffffffc0200446:	0405                	addi	s0,s0,1
ffffffffc0200448:	d5c9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc020044a:	b7f5                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc020044c:	00044783          	lbu	a5,0(s0)
ffffffffc0200450:	d3c9                	beqz	a5,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200452:	033c8963          	beq	s9,s3,ffffffffc0200484 <kmonitor+0x12e>
ffffffffc0200456:	003c9793          	slli	a5,s9,0x3
ffffffffc020045a:	0118                	addi	a4,sp,128
ffffffffc020045c:	97ba                	add	a5,a5,a4
ffffffffc020045e:	f887b023          	sd	s0,-128(a5)
ffffffffc0200462:	00044583          	lbu	a1,0(s0)
ffffffffc0200466:	2c85                	addiw	s9,s9,1
ffffffffc0200468:	e591                	bnez	a1,ffffffffc0200474 <kmonitor+0x11e>
ffffffffc020046a:	b7b5                	j	ffffffffc02003d6 <kmonitor+0x80>
ffffffffc020046c:	00144583          	lbu	a1,1(s0)
ffffffffc0200470:	0405                	addi	s0,s0,1
ffffffffc0200472:	d1a5                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200474:	8526                	mv	a0,s1
ffffffffc0200476:	69e0b0ef          	jal	ra,ffffffffc020bb14 <strchr>
ffffffffc020047a:	d96d                	beqz	a0,ffffffffc020046c <kmonitor+0x116>
ffffffffc020047c:	00044583          	lbu	a1,0(s0)
ffffffffc0200480:	d9a9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200482:	bf55                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc0200484:	45c1                	li	a1,16
ffffffffc0200486:	855a                	mv	a0,s6
ffffffffc0200488:	d1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020048c:	b7e9                	j	ffffffffc0200456 <kmonitor+0x100>
ffffffffc020048e:	6582                	ld	a1,0(sp)
ffffffffc0200490:	0000c517          	auipc	a0,0xc
ffffffffc0200494:	95850513          	addi	a0,a0,-1704 # ffffffffc020bde8 <etext+0x254>
ffffffffc0200498:	d0fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020049c:	b715                	j	ffffffffc02003c0 <kmonitor+0x6a>

ffffffffc020049e <__panic>:
ffffffffc020049e:	00096317          	auipc	t1,0x96
ffffffffc02004a2:	3fa30313          	addi	t1,t1,1018 # ffffffffc0296898 <is_panic>
ffffffffc02004a6:	00033e03          	ld	t3,0(t1)
ffffffffc02004aa:	715d                	addi	sp,sp,-80
ffffffffc02004ac:	ec06                	sd	ra,24(sp)
ffffffffc02004ae:	e822                	sd	s0,16(sp)
ffffffffc02004b0:	f436                	sd	a3,40(sp)
ffffffffc02004b2:	f83a                	sd	a4,48(sp)
ffffffffc02004b4:	fc3e                	sd	a5,56(sp)
ffffffffc02004b6:	e0c2                	sd	a6,64(sp)
ffffffffc02004b8:	e4c6                	sd	a7,72(sp)
ffffffffc02004ba:	020e1a63          	bnez	t3,ffffffffc02004ee <__panic+0x50>
ffffffffc02004be:	4785                	li	a5,1
ffffffffc02004c0:	00f33023          	sd	a5,0(t1)
ffffffffc02004c4:	8432                	mv	s0,a2
ffffffffc02004c6:	103c                	addi	a5,sp,40
ffffffffc02004c8:	862e                	mv	a2,a1
ffffffffc02004ca:	85aa                	mv	a1,a0
ffffffffc02004cc:	0000c517          	auipc	a0,0xc
ffffffffc02004d0:	97c50513          	addi	a0,a0,-1668 # ffffffffc020be48 <commands+0x48>
ffffffffc02004d4:	e43e                	sd	a5,8(sp)
ffffffffc02004d6:	cd1ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004da:	65a2                	ld	a1,8(sp)
ffffffffc02004dc:	8522                	mv	a0,s0
ffffffffc02004de:	ca3ff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc02004e2:	0000d517          	auipc	a0,0xd
ffffffffc02004e6:	c2650513          	addi	a0,a0,-986 # ffffffffc020d108 <default_pmm_manager+0x610>
ffffffffc02004ea:	cbdff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004ee:	4501                	li	a0,0
ffffffffc02004f0:	4581                	li	a1,0
ffffffffc02004f2:	4601                	li	a2,0
ffffffffc02004f4:	48a1                	li	a7,8
ffffffffc02004f6:	00000073          	ecall
ffffffffc02004fa:	778000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02004fe:	4501                	li	a0,0
ffffffffc0200500:	e57ff0ef          	jal	ra,ffffffffc0200356 <kmonitor>
ffffffffc0200504:	bfed                	j	ffffffffc02004fe <__panic+0x60>

ffffffffc0200506 <__warn>:
ffffffffc0200506:	715d                	addi	sp,sp,-80
ffffffffc0200508:	832e                	mv	t1,a1
ffffffffc020050a:	e822                	sd	s0,16(sp)
ffffffffc020050c:	85aa                	mv	a1,a0
ffffffffc020050e:	8432                	mv	s0,a2
ffffffffc0200510:	fc3e                	sd	a5,56(sp)
ffffffffc0200512:	861a                	mv	a2,t1
ffffffffc0200514:	103c                	addi	a5,sp,40
ffffffffc0200516:	0000c517          	auipc	a0,0xc
ffffffffc020051a:	95250513          	addi	a0,a0,-1710 # ffffffffc020be68 <commands+0x68>
ffffffffc020051e:	ec06                	sd	ra,24(sp)
ffffffffc0200520:	f436                	sd	a3,40(sp)
ffffffffc0200522:	f83a                	sd	a4,48(sp)
ffffffffc0200524:	e0c2                	sd	a6,64(sp)
ffffffffc0200526:	e4c6                	sd	a7,72(sp)
ffffffffc0200528:	e43e                	sd	a5,8(sp)
ffffffffc020052a:	c7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020052e:	65a2                	ld	a1,8(sp)
ffffffffc0200530:	8522                	mv	a0,s0
ffffffffc0200532:	c4fff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc0200536:	0000d517          	auipc	a0,0xd
ffffffffc020053a:	bd250513          	addi	a0,a0,-1070 # ffffffffc020d108 <default_pmm_manager+0x610>
ffffffffc020053e:	c69ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200542:	60e2                	ld	ra,24(sp)
ffffffffc0200544:	6442                	ld	s0,16(sp)
ffffffffc0200546:	6161                	addi	sp,sp,80
ffffffffc0200548:	8082                	ret

ffffffffc020054a <clock_init>:
ffffffffc020054a:	02000793          	li	a5,32
ffffffffc020054e:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200552:	c0102573          	rdtime	a0
ffffffffc0200556:	67e1                	lui	a5,0x18
ffffffffc0200558:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc020055c:	953e                	add	a0,a0,a5
ffffffffc020055e:	4581                	li	a1,0
ffffffffc0200560:	4601                	li	a2,0
ffffffffc0200562:	4881                	li	a7,0
ffffffffc0200564:	00000073          	ecall
ffffffffc0200568:	0000c517          	auipc	a0,0xc
ffffffffc020056c:	92050513          	addi	a0,a0,-1760 # ffffffffc020be88 <commands+0x88>
ffffffffc0200570:	00096797          	auipc	a5,0x96
ffffffffc0200574:	3207b823          	sd	zero,816(a5) # ffffffffc02968a0 <ticks>
ffffffffc0200578:	b13d                	j	ffffffffc02001a6 <cprintf>

ffffffffc020057a <clock_set_next_event>:
ffffffffc020057a:	c0102573          	rdtime	a0
ffffffffc020057e:	67e1                	lui	a5,0x18
ffffffffc0200580:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc0200584:	953e                	add	a0,a0,a5
ffffffffc0200586:	4581                	li	a1,0
ffffffffc0200588:	4601                	li	a2,0
ffffffffc020058a:	4881                	li	a7,0
ffffffffc020058c:	00000073          	ecall
ffffffffc0200590:	8082                	ret

ffffffffc0200592 <cons_init>:
ffffffffc0200592:	4501                	li	a0,0
ffffffffc0200594:	4581                	li	a1,0
ffffffffc0200596:	4601                	li	a2,0
ffffffffc0200598:	4889                	li	a7,2
ffffffffc020059a:	00000073          	ecall
ffffffffc020059e:	8082                	ret

ffffffffc02005a0 <cons_putc>:
ffffffffc02005a0:	1101                	addi	sp,sp,-32
ffffffffc02005a2:	ec06                	sd	ra,24(sp)
ffffffffc02005a4:	100027f3          	csrr	a5,sstatus
ffffffffc02005a8:	8b89                	andi	a5,a5,2
ffffffffc02005aa:	4701                	li	a4,0
ffffffffc02005ac:	ef95                	bnez	a5,ffffffffc02005e8 <cons_putc+0x48>
ffffffffc02005ae:	47a1                	li	a5,8
ffffffffc02005b0:	00f50b63          	beq	a0,a5,ffffffffc02005c6 <cons_putc+0x26>
ffffffffc02005b4:	4581                	li	a1,0
ffffffffc02005b6:	4601                	li	a2,0
ffffffffc02005b8:	4885                	li	a7,1
ffffffffc02005ba:	00000073          	ecall
ffffffffc02005be:	e315                	bnez	a4,ffffffffc02005e2 <cons_putc+0x42>
ffffffffc02005c0:	60e2                	ld	ra,24(sp)
ffffffffc02005c2:	6105                	addi	sp,sp,32
ffffffffc02005c4:	8082                	ret
ffffffffc02005c6:	4521                	li	a0,8
ffffffffc02005c8:	4581                	li	a1,0
ffffffffc02005ca:	4601                	li	a2,0
ffffffffc02005cc:	4885                	li	a7,1
ffffffffc02005ce:	00000073          	ecall
ffffffffc02005d2:	02000513          	li	a0,32
ffffffffc02005d6:	00000073          	ecall
ffffffffc02005da:	4521                	li	a0,8
ffffffffc02005dc:	00000073          	ecall
ffffffffc02005e0:	d365                	beqz	a4,ffffffffc02005c0 <cons_putc+0x20>
ffffffffc02005e2:	60e2                	ld	ra,24(sp)
ffffffffc02005e4:	6105                	addi	sp,sp,32
ffffffffc02005e6:	a559                	j	ffffffffc0200c6c <intr_enable>
ffffffffc02005e8:	e42a                	sd	a0,8(sp)
ffffffffc02005ea:	688000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02005ee:	6522                	ld	a0,8(sp)
ffffffffc02005f0:	4705                	li	a4,1
ffffffffc02005f2:	bf75                	j	ffffffffc02005ae <cons_putc+0xe>

ffffffffc02005f4 <cons_getc>:
ffffffffc02005f4:	1101                	addi	sp,sp,-32
ffffffffc02005f6:	ec06                	sd	ra,24(sp)
ffffffffc02005f8:	100027f3          	csrr	a5,sstatus
ffffffffc02005fc:	8b89                	andi	a5,a5,2
ffffffffc02005fe:	4801                	li	a6,0
ffffffffc0200600:	e3d5                	bnez	a5,ffffffffc02006a4 <cons_getc+0xb0>
ffffffffc0200602:	00091697          	auipc	a3,0x91
ffffffffc0200606:	e8e68693          	addi	a3,a3,-370 # ffffffffc0291490 <cons>
ffffffffc020060a:	07f00713          	li	a4,127
ffffffffc020060e:	20000313          	li	t1,512
ffffffffc0200612:	a021                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200614:	0ff57513          	zext.b	a0,a0
ffffffffc0200618:	ef91                	bnez	a5,ffffffffc0200634 <cons_getc+0x40>
ffffffffc020061a:	4501                	li	a0,0
ffffffffc020061c:	4581                	li	a1,0
ffffffffc020061e:	4601                	li	a2,0
ffffffffc0200620:	4889                	li	a7,2
ffffffffc0200622:	00000073          	ecall
ffffffffc0200626:	0005079b          	sext.w	a5,a0
ffffffffc020062a:	0207c763          	bltz	a5,ffffffffc0200658 <cons_getc+0x64>
ffffffffc020062e:	fee793e3          	bne	a5,a4,ffffffffc0200614 <cons_getc+0x20>
ffffffffc0200632:	4521                	li	a0,8
ffffffffc0200634:	2046a783          	lw	a5,516(a3)
ffffffffc0200638:	02079613          	slli	a2,a5,0x20
ffffffffc020063c:	9201                	srli	a2,a2,0x20
ffffffffc020063e:	2785                	addiw	a5,a5,1
ffffffffc0200640:	9636                	add	a2,a2,a3
ffffffffc0200642:	20f6a223          	sw	a5,516(a3)
ffffffffc0200646:	00a60023          	sb	a0,0(a2)
ffffffffc020064a:	fc6798e3          	bne	a5,t1,ffffffffc020061a <cons_getc+0x26>
ffffffffc020064e:	00091797          	auipc	a5,0x91
ffffffffc0200652:	0407a323          	sw	zero,70(a5) # ffffffffc0291694 <cons+0x204>
ffffffffc0200656:	b7d1                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200658:	2006a783          	lw	a5,512(a3)
ffffffffc020065c:	2046a703          	lw	a4,516(a3)
ffffffffc0200660:	4501                	li	a0,0
ffffffffc0200662:	00f70f63          	beq	a4,a5,ffffffffc0200680 <cons_getc+0x8c>
ffffffffc0200666:	0017861b          	addiw	a2,a5,1
ffffffffc020066a:	1782                	slli	a5,a5,0x20
ffffffffc020066c:	9381                	srli	a5,a5,0x20
ffffffffc020066e:	97b6                	add	a5,a5,a3
ffffffffc0200670:	20c6a023          	sw	a2,512(a3)
ffffffffc0200674:	20000713          	li	a4,512
ffffffffc0200678:	0007c503          	lbu	a0,0(a5)
ffffffffc020067c:	00e60763          	beq	a2,a4,ffffffffc020068a <cons_getc+0x96>
ffffffffc0200680:	00081b63          	bnez	a6,ffffffffc0200696 <cons_getc+0xa2>
ffffffffc0200684:	60e2                	ld	ra,24(sp)
ffffffffc0200686:	6105                	addi	sp,sp,32
ffffffffc0200688:	8082                	ret
ffffffffc020068a:	00091797          	auipc	a5,0x91
ffffffffc020068e:	0007a323          	sw	zero,6(a5) # ffffffffc0291690 <cons+0x200>
ffffffffc0200692:	fe0809e3          	beqz	a6,ffffffffc0200684 <cons_getc+0x90>
ffffffffc0200696:	e42a                	sd	a0,8(sp)
ffffffffc0200698:	5d4000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020069c:	60e2                	ld	ra,24(sp)
ffffffffc020069e:	6522                	ld	a0,8(sp)
ffffffffc02006a0:	6105                	addi	sp,sp,32
ffffffffc02006a2:	8082                	ret
ffffffffc02006a4:	5ce000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02006a8:	4805                	li	a6,1
ffffffffc02006aa:	bfa1                	j	ffffffffc0200602 <cons_getc+0xe>

ffffffffc02006ac <dtb_init>:
ffffffffc02006ac:	7119                	addi	sp,sp,-128
ffffffffc02006ae:	0000b517          	auipc	a0,0xb
ffffffffc02006b2:	7fa50513          	addi	a0,a0,2042 # ffffffffc020bea8 <commands+0xa8>
ffffffffc02006b6:	fc86                	sd	ra,120(sp)
ffffffffc02006b8:	f8a2                	sd	s0,112(sp)
ffffffffc02006ba:	e8d2                	sd	s4,80(sp)
ffffffffc02006bc:	f4a6                	sd	s1,104(sp)
ffffffffc02006be:	f0ca                	sd	s2,96(sp)
ffffffffc02006c0:	ecce                	sd	s3,88(sp)
ffffffffc02006c2:	e4d6                	sd	s5,72(sp)
ffffffffc02006c4:	e0da                	sd	s6,64(sp)
ffffffffc02006c6:	fc5e                	sd	s7,56(sp)
ffffffffc02006c8:	f862                	sd	s8,48(sp)
ffffffffc02006ca:	f466                	sd	s9,40(sp)
ffffffffc02006cc:	f06a                	sd	s10,32(sp)
ffffffffc02006ce:	ec6e                	sd	s11,24(sp)
ffffffffc02006d0:	ad7ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006d4:	00014597          	auipc	a1,0x14
ffffffffc02006d8:	92c5b583          	ld	a1,-1748(a1) # ffffffffc0214000 <boot_hartid>
ffffffffc02006dc:	0000b517          	auipc	a0,0xb
ffffffffc02006e0:	7dc50513          	addi	a0,a0,2012 # ffffffffc020beb8 <commands+0xb8>
ffffffffc02006e4:	ac3ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006e8:	00014417          	auipc	s0,0x14
ffffffffc02006ec:	92040413          	addi	s0,s0,-1760 # ffffffffc0214008 <boot_dtb>
ffffffffc02006f0:	600c                	ld	a1,0(s0)
ffffffffc02006f2:	0000b517          	auipc	a0,0xb
ffffffffc02006f6:	7d650513          	addi	a0,a0,2006 # ffffffffc020bec8 <commands+0xc8>
ffffffffc02006fa:	aadff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006fe:	00043a03          	ld	s4,0(s0)
ffffffffc0200702:	0000b517          	auipc	a0,0xb
ffffffffc0200706:	7de50513          	addi	a0,a0,2014 # ffffffffc020bee0 <commands+0xe0>
ffffffffc020070a:	120a0463          	beqz	s4,ffffffffc0200832 <dtb_init+0x186>
ffffffffc020070e:	57f5                	li	a5,-3
ffffffffc0200710:	07fa                	slli	a5,a5,0x1e
ffffffffc0200712:	00fa0733          	add	a4,s4,a5
ffffffffc0200716:	431c                	lw	a5,0(a4)
ffffffffc0200718:	00ff0637          	lui	a2,0xff0
ffffffffc020071c:	6b41                	lui	s6,0x10
ffffffffc020071e:	0087d59b          	srliw	a1,a5,0x8
ffffffffc0200722:	0187969b          	slliw	a3,a5,0x18
ffffffffc0200726:	0187d51b          	srliw	a0,a5,0x18
ffffffffc020072a:	0105959b          	slliw	a1,a1,0x10
ffffffffc020072e:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200732:	8df1                	and	a1,a1,a2
ffffffffc0200734:	8ec9                	or	a3,a3,a0
ffffffffc0200736:	0087979b          	slliw	a5,a5,0x8
ffffffffc020073a:	1b7d                	addi	s6,s6,-1
ffffffffc020073c:	0167f7b3          	and	a5,a5,s6
ffffffffc0200740:	8dd5                	or	a1,a1,a3
ffffffffc0200742:	8ddd                	or	a1,a1,a5
ffffffffc0200744:	d00e07b7          	lui	a5,0xd00e0
ffffffffc0200748:	2581                	sext.w	a1,a1
ffffffffc020074a:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <end+0xfe495ad>
ffffffffc020074e:	10f59163          	bne	a1,a5,ffffffffc0200850 <dtb_init+0x1a4>
ffffffffc0200752:	471c                	lw	a5,8(a4)
ffffffffc0200754:	4754                	lw	a3,12(a4)
ffffffffc0200756:	4c81                	li	s9,0
ffffffffc0200758:	0087d59b          	srliw	a1,a5,0x8
ffffffffc020075c:	0086d51b          	srliw	a0,a3,0x8
ffffffffc0200760:	0186941b          	slliw	s0,a3,0x18
ffffffffc0200764:	0186d89b          	srliw	a7,a3,0x18
ffffffffc0200768:	01879a1b          	slliw	s4,a5,0x18
ffffffffc020076c:	0187d81b          	srliw	a6,a5,0x18
ffffffffc0200770:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200774:	0106d69b          	srliw	a3,a3,0x10
ffffffffc0200778:	0105959b          	slliw	a1,a1,0x10
ffffffffc020077c:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200780:	8d71                	and	a0,a0,a2
ffffffffc0200782:	01146433          	or	s0,s0,a7
ffffffffc0200786:	0086969b          	slliw	a3,a3,0x8
ffffffffc020078a:	010a6a33          	or	s4,s4,a6
ffffffffc020078e:	8e6d                	and	a2,a2,a1
ffffffffc0200790:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200794:	8c49                	or	s0,s0,a0
ffffffffc0200796:	0166f6b3          	and	a3,a3,s6
ffffffffc020079a:	00ca6a33          	or	s4,s4,a2
ffffffffc020079e:	0167f7b3          	and	a5,a5,s6
ffffffffc02007a2:	8c55                	or	s0,s0,a3
ffffffffc02007a4:	00fa6a33          	or	s4,s4,a5
ffffffffc02007a8:	1402                	slli	s0,s0,0x20
ffffffffc02007aa:	1a02                	slli	s4,s4,0x20
ffffffffc02007ac:	9001                	srli	s0,s0,0x20
ffffffffc02007ae:	020a5a13          	srli	s4,s4,0x20
ffffffffc02007b2:	943a                	add	s0,s0,a4
ffffffffc02007b4:	9a3a                	add	s4,s4,a4
ffffffffc02007b6:	00ff0c37          	lui	s8,0xff0
ffffffffc02007ba:	4b8d                	li	s7,3
ffffffffc02007bc:	0000b917          	auipc	s2,0xb
ffffffffc02007c0:	77490913          	addi	s2,s2,1908 # ffffffffc020bf30 <commands+0x130>
ffffffffc02007c4:	49bd                	li	s3,15
ffffffffc02007c6:	4d91                	li	s11,4
ffffffffc02007c8:	4d05                	li	s10,1
ffffffffc02007ca:	0000b497          	auipc	s1,0xb
ffffffffc02007ce:	75e48493          	addi	s1,s1,1886 # ffffffffc020bf28 <commands+0x128>
ffffffffc02007d2:	000a2703          	lw	a4,0(s4)
ffffffffc02007d6:	004a0a93          	addi	s5,s4,4
ffffffffc02007da:	0087569b          	srliw	a3,a4,0x8
ffffffffc02007de:	0187179b          	slliw	a5,a4,0x18
ffffffffc02007e2:	0187561b          	srliw	a2,a4,0x18
ffffffffc02007e6:	0106969b          	slliw	a3,a3,0x10
ffffffffc02007ea:	0107571b          	srliw	a4,a4,0x10
ffffffffc02007ee:	8fd1                	or	a5,a5,a2
ffffffffc02007f0:	0186f6b3          	and	a3,a3,s8
ffffffffc02007f4:	0087171b          	slliw	a4,a4,0x8
ffffffffc02007f8:	8fd5                	or	a5,a5,a3
ffffffffc02007fa:	00eb7733          	and	a4,s6,a4
ffffffffc02007fe:	8fd9                	or	a5,a5,a4
ffffffffc0200800:	2781                	sext.w	a5,a5
ffffffffc0200802:	09778c63          	beq	a5,s7,ffffffffc020089a <dtb_init+0x1ee>
ffffffffc0200806:	00fbea63          	bltu	s7,a5,ffffffffc020081a <dtb_init+0x16e>
ffffffffc020080a:	07a78663          	beq	a5,s10,ffffffffc0200876 <dtb_init+0x1ca>
ffffffffc020080e:	4709                	li	a4,2
ffffffffc0200810:	00e79763          	bne	a5,a4,ffffffffc020081e <dtb_init+0x172>
ffffffffc0200814:	4c81                	li	s9,0
ffffffffc0200816:	8a56                	mv	s4,s5
ffffffffc0200818:	bf6d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020081a:	ffb78ee3          	beq	a5,s11,ffffffffc0200816 <dtb_init+0x16a>
ffffffffc020081e:	0000b517          	auipc	a0,0xb
ffffffffc0200822:	78a50513          	addi	a0,a0,1930 # ffffffffc020bfa8 <commands+0x1a8>
ffffffffc0200826:	981ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020082a:	0000b517          	auipc	a0,0xb
ffffffffc020082e:	7b650513          	addi	a0,a0,1974 # ffffffffc020bfe0 <commands+0x1e0>
ffffffffc0200832:	7446                	ld	s0,112(sp)
ffffffffc0200834:	70e6                	ld	ra,120(sp)
ffffffffc0200836:	74a6                	ld	s1,104(sp)
ffffffffc0200838:	7906                	ld	s2,96(sp)
ffffffffc020083a:	69e6                	ld	s3,88(sp)
ffffffffc020083c:	6a46                	ld	s4,80(sp)
ffffffffc020083e:	6aa6                	ld	s5,72(sp)
ffffffffc0200840:	6b06                	ld	s6,64(sp)
ffffffffc0200842:	7be2                	ld	s7,56(sp)
ffffffffc0200844:	7c42                	ld	s8,48(sp)
ffffffffc0200846:	7ca2                	ld	s9,40(sp)
ffffffffc0200848:	7d02                	ld	s10,32(sp)
ffffffffc020084a:	6de2                	ld	s11,24(sp)
ffffffffc020084c:	6109                	addi	sp,sp,128
ffffffffc020084e:	baa1                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200850:	7446                	ld	s0,112(sp)
ffffffffc0200852:	70e6                	ld	ra,120(sp)
ffffffffc0200854:	74a6                	ld	s1,104(sp)
ffffffffc0200856:	7906                	ld	s2,96(sp)
ffffffffc0200858:	69e6                	ld	s3,88(sp)
ffffffffc020085a:	6a46                	ld	s4,80(sp)
ffffffffc020085c:	6aa6                	ld	s5,72(sp)
ffffffffc020085e:	6b06                	ld	s6,64(sp)
ffffffffc0200860:	7be2                	ld	s7,56(sp)
ffffffffc0200862:	7c42                	ld	s8,48(sp)
ffffffffc0200864:	7ca2                	ld	s9,40(sp)
ffffffffc0200866:	7d02                	ld	s10,32(sp)
ffffffffc0200868:	6de2                	ld	s11,24(sp)
ffffffffc020086a:	0000b517          	auipc	a0,0xb
ffffffffc020086e:	69650513          	addi	a0,a0,1686 # ffffffffc020bf00 <commands+0x100>
ffffffffc0200872:	6109                	addi	sp,sp,128
ffffffffc0200874:	ba0d                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200876:	8556                	mv	a0,s5
ffffffffc0200878:	2100b0ef          	jal	ra,ffffffffc020ba88 <strlen>
ffffffffc020087c:	8a2a                	mv	s4,a0
ffffffffc020087e:	4619                	li	a2,6
ffffffffc0200880:	85a6                	mv	a1,s1
ffffffffc0200882:	8556                	mv	a0,s5
ffffffffc0200884:	2a01                	sext.w	s4,s4
ffffffffc0200886:	2680b0ef          	jal	ra,ffffffffc020baee <strncmp>
ffffffffc020088a:	e111                	bnez	a0,ffffffffc020088e <dtb_init+0x1e2>
ffffffffc020088c:	4c85                	li	s9,1
ffffffffc020088e:	0a91                	addi	s5,s5,4
ffffffffc0200890:	9ad2                	add	s5,s5,s4
ffffffffc0200892:	ffcafa93          	andi	s5,s5,-4
ffffffffc0200896:	8a56                	mv	s4,s5
ffffffffc0200898:	bf2d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020089a:	004a2783          	lw	a5,4(s4)
ffffffffc020089e:	00ca0693          	addi	a3,s4,12
ffffffffc02008a2:	0087d71b          	srliw	a4,a5,0x8
ffffffffc02008a6:	01879a9b          	slliw	s5,a5,0x18
ffffffffc02008aa:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008ae:	0107171b          	slliw	a4,a4,0x10
ffffffffc02008b2:	0107d79b          	srliw	a5,a5,0x10
ffffffffc02008b6:	00caeab3          	or	s5,s5,a2
ffffffffc02008ba:	01877733          	and	a4,a4,s8
ffffffffc02008be:	0087979b          	slliw	a5,a5,0x8
ffffffffc02008c2:	00eaeab3          	or	s5,s5,a4
ffffffffc02008c6:	00fb77b3          	and	a5,s6,a5
ffffffffc02008ca:	00faeab3          	or	s5,s5,a5
ffffffffc02008ce:	2a81                	sext.w	s5,s5
ffffffffc02008d0:	000c9c63          	bnez	s9,ffffffffc02008e8 <dtb_init+0x23c>
ffffffffc02008d4:	1a82                	slli	s5,s5,0x20
ffffffffc02008d6:	00368793          	addi	a5,a3,3
ffffffffc02008da:	020ada93          	srli	s5,s5,0x20
ffffffffc02008de:	9abe                	add	s5,s5,a5
ffffffffc02008e0:	ffcafa93          	andi	s5,s5,-4
ffffffffc02008e4:	8a56                	mv	s4,s5
ffffffffc02008e6:	b5f5                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc02008e8:	008a2783          	lw	a5,8(s4)
ffffffffc02008ec:	85ca                	mv	a1,s2
ffffffffc02008ee:	e436                	sd	a3,8(sp)
ffffffffc02008f0:	0087d51b          	srliw	a0,a5,0x8
ffffffffc02008f4:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008f8:	0187971b          	slliw	a4,a5,0x18
ffffffffc02008fc:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200900:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200904:	8f51                	or	a4,a4,a2
ffffffffc0200906:	01857533          	and	a0,a0,s8
ffffffffc020090a:	0087979b          	slliw	a5,a5,0x8
ffffffffc020090e:	8d59                	or	a0,a0,a4
ffffffffc0200910:	00fb77b3          	and	a5,s6,a5
ffffffffc0200914:	8d5d                	or	a0,a0,a5
ffffffffc0200916:	1502                	slli	a0,a0,0x20
ffffffffc0200918:	9101                	srli	a0,a0,0x20
ffffffffc020091a:	9522                	add	a0,a0,s0
ffffffffc020091c:	1b40b0ef          	jal	ra,ffffffffc020bad0 <strcmp>
ffffffffc0200920:	66a2                	ld	a3,8(sp)
ffffffffc0200922:	f94d                	bnez	a0,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200924:	fb59f8e3          	bgeu	s3,s5,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200928:	00ca3783          	ld	a5,12(s4)
ffffffffc020092c:	014a3703          	ld	a4,20(s4)
ffffffffc0200930:	0000b517          	auipc	a0,0xb
ffffffffc0200934:	60850513          	addi	a0,a0,1544 # ffffffffc020bf38 <commands+0x138>
ffffffffc0200938:	4207d613          	srai	a2,a5,0x20
ffffffffc020093c:	0087d31b          	srliw	t1,a5,0x8
ffffffffc0200940:	42075593          	srai	a1,a4,0x20
ffffffffc0200944:	0187de1b          	srliw	t3,a5,0x18
ffffffffc0200948:	0186581b          	srliw	a6,a2,0x18
ffffffffc020094c:	0187941b          	slliw	s0,a5,0x18
ffffffffc0200950:	0107d89b          	srliw	a7,a5,0x10
ffffffffc0200954:	0187d693          	srli	a3,a5,0x18
ffffffffc0200958:	01861f1b          	slliw	t5,a2,0x18
ffffffffc020095c:	0087579b          	srliw	a5,a4,0x8
ffffffffc0200960:	0103131b          	slliw	t1,t1,0x10
ffffffffc0200964:	0106561b          	srliw	a2,a2,0x10
ffffffffc0200968:	010f6f33          	or	t5,t5,a6
ffffffffc020096c:	0187529b          	srliw	t0,a4,0x18
ffffffffc0200970:	0185df9b          	srliw	t6,a1,0x18
ffffffffc0200974:	01837333          	and	t1,t1,s8
ffffffffc0200978:	01c46433          	or	s0,s0,t3
ffffffffc020097c:	0186f6b3          	and	a3,a3,s8
ffffffffc0200980:	01859e1b          	slliw	t3,a1,0x18
ffffffffc0200984:	01871e9b          	slliw	t4,a4,0x18
ffffffffc0200988:	0107581b          	srliw	a6,a4,0x10
ffffffffc020098c:	0086161b          	slliw	a2,a2,0x8
ffffffffc0200990:	8361                	srli	a4,a4,0x18
ffffffffc0200992:	0107979b          	slliw	a5,a5,0x10
ffffffffc0200996:	0105d59b          	srliw	a1,a1,0x10
ffffffffc020099a:	01e6e6b3          	or	a3,a3,t5
ffffffffc020099e:	00cb7633          	and	a2,s6,a2
ffffffffc02009a2:	0088181b          	slliw	a6,a6,0x8
ffffffffc02009a6:	0085959b          	slliw	a1,a1,0x8
ffffffffc02009aa:	00646433          	or	s0,s0,t1
ffffffffc02009ae:	0187f7b3          	and	a5,a5,s8
ffffffffc02009b2:	01fe6333          	or	t1,t3,t6
ffffffffc02009b6:	01877c33          	and	s8,a4,s8
ffffffffc02009ba:	0088989b          	slliw	a7,a7,0x8
ffffffffc02009be:	011b78b3          	and	a7,s6,a7
ffffffffc02009c2:	005eeeb3          	or	t4,t4,t0
ffffffffc02009c6:	00c6e733          	or	a4,a3,a2
ffffffffc02009ca:	006c6c33          	or	s8,s8,t1
ffffffffc02009ce:	010b76b3          	and	a3,s6,a6
ffffffffc02009d2:	00bb7b33          	and	s6,s6,a1
ffffffffc02009d6:	01d7e7b3          	or	a5,a5,t4
ffffffffc02009da:	016c6b33          	or	s6,s8,s6
ffffffffc02009de:	01146433          	or	s0,s0,a7
ffffffffc02009e2:	8fd5                	or	a5,a5,a3
ffffffffc02009e4:	1702                	slli	a4,a4,0x20
ffffffffc02009e6:	1b02                	slli	s6,s6,0x20
ffffffffc02009e8:	1782                	slli	a5,a5,0x20
ffffffffc02009ea:	9301                	srli	a4,a4,0x20
ffffffffc02009ec:	1402                	slli	s0,s0,0x20
ffffffffc02009ee:	020b5b13          	srli	s6,s6,0x20
ffffffffc02009f2:	0167eb33          	or	s6,a5,s6
ffffffffc02009f6:	8c59                	or	s0,s0,a4
ffffffffc02009f8:	faeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02009fc:	85a2                	mv	a1,s0
ffffffffc02009fe:	0000b517          	auipc	a0,0xb
ffffffffc0200a02:	55a50513          	addi	a0,a0,1370 # ffffffffc020bf58 <commands+0x158>
ffffffffc0200a06:	fa0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a0a:	014b5613          	srli	a2,s6,0x14
ffffffffc0200a0e:	85da                	mv	a1,s6
ffffffffc0200a10:	0000b517          	auipc	a0,0xb
ffffffffc0200a14:	56050513          	addi	a0,a0,1376 # ffffffffc020bf70 <commands+0x170>
ffffffffc0200a18:	f8eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a1c:	008b05b3          	add	a1,s6,s0
ffffffffc0200a20:	15fd                	addi	a1,a1,-1
ffffffffc0200a22:	0000b517          	auipc	a0,0xb
ffffffffc0200a26:	56e50513          	addi	a0,a0,1390 # ffffffffc020bf90 <commands+0x190>
ffffffffc0200a2a:	f7cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a2e:	0000b517          	auipc	a0,0xb
ffffffffc0200a32:	5b250513          	addi	a0,a0,1458 # ffffffffc020bfe0 <commands+0x1e0>
ffffffffc0200a36:	00096797          	auipc	a5,0x96
ffffffffc0200a3a:	e687b923          	sd	s0,-398(a5) # ffffffffc02968a8 <memory_base>
ffffffffc0200a3e:	00096797          	auipc	a5,0x96
ffffffffc0200a42:	e767b923          	sd	s6,-398(a5) # ffffffffc02968b0 <memory_size>
ffffffffc0200a46:	b3f5                	j	ffffffffc0200832 <dtb_init+0x186>

ffffffffc0200a48 <get_memory_base>:
ffffffffc0200a48:	00096517          	auipc	a0,0x96
ffffffffc0200a4c:	e6053503          	ld	a0,-416(a0) # ffffffffc02968a8 <memory_base>
ffffffffc0200a50:	8082                	ret

ffffffffc0200a52 <get_memory_size>:
ffffffffc0200a52:	00096517          	auipc	a0,0x96
ffffffffc0200a56:	e5e53503          	ld	a0,-418(a0) # ffffffffc02968b0 <memory_size>
ffffffffc0200a5a:	8082                	ret

ffffffffc0200a5c <ide_init>:
ffffffffc0200a5c:	1141                	addi	sp,sp,-16
ffffffffc0200a5e:	00091597          	auipc	a1,0x91
ffffffffc0200a62:	c8a58593          	addi	a1,a1,-886 # ffffffffc02916e8 <ide_devices+0x50>
ffffffffc0200a66:	4505                	li	a0,1
ffffffffc0200a68:	e022                	sd	s0,0(sp)
ffffffffc0200a6a:	00091797          	auipc	a5,0x91
ffffffffc0200a6e:	c207a723          	sw	zero,-978(a5) # ffffffffc0291698 <ide_devices>
ffffffffc0200a72:	00091797          	auipc	a5,0x91
ffffffffc0200a76:	c607ab23          	sw	zero,-906(a5) # ffffffffc02916e8 <ide_devices+0x50>
ffffffffc0200a7a:	00091797          	auipc	a5,0x91
ffffffffc0200a7e:	ca07af23          	sw	zero,-834(a5) # ffffffffc0291738 <ide_devices+0xa0>
ffffffffc0200a82:	00091797          	auipc	a5,0x91
ffffffffc0200a86:	d007a323          	sw	zero,-762(a5) # ffffffffc0291788 <ide_devices+0xf0>
ffffffffc0200a8a:	e406                	sd	ra,8(sp)
ffffffffc0200a8c:	00091417          	auipc	s0,0x91
ffffffffc0200a90:	c0c40413          	addi	s0,s0,-1012 # ffffffffc0291698 <ide_devices>
ffffffffc0200a94:	23a000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200a98:	483c                	lw	a5,80(s0)
ffffffffc0200a9a:	cf99                	beqz	a5,ffffffffc0200ab8 <ide_init+0x5c>
ffffffffc0200a9c:	00091597          	auipc	a1,0x91
ffffffffc0200aa0:	c9c58593          	addi	a1,a1,-868 # ffffffffc0291738 <ide_devices+0xa0>
ffffffffc0200aa4:	4509                	li	a0,2
ffffffffc0200aa6:	228000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200aaa:	0a042783          	lw	a5,160(s0)
ffffffffc0200aae:	c785                	beqz	a5,ffffffffc0200ad6 <ide_init+0x7a>
ffffffffc0200ab0:	60a2                	ld	ra,8(sp)
ffffffffc0200ab2:	6402                	ld	s0,0(sp)
ffffffffc0200ab4:	0141                	addi	sp,sp,16
ffffffffc0200ab6:	8082                	ret
ffffffffc0200ab8:	0000b697          	auipc	a3,0xb
ffffffffc0200abc:	54068693          	addi	a3,a3,1344 # ffffffffc020bff8 <commands+0x1f8>
ffffffffc0200ac0:	0000b617          	auipc	a2,0xb
ffffffffc0200ac4:	55060613          	addi	a2,a2,1360 # ffffffffc020c010 <commands+0x210>
ffffffffc0200ac8:	45c5                	li	a1,17
ffffffffc0200aca:	0000b517          	auipc	a0,0xb
ffffffffc0200ace:	55e50513          	addi	a0,a0,1374 # ffffffffc020c028 <commands+0x228>
ffffffffc0200ad2:	9cdff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200ad6:	0000b697          	auipc	a3,0xb
ffffffffc0200ada:	56a68693          	addi	a3,a3,1386 # ffffffffc020c040 <commands+0x240>
ffffffffc0200ade:	0000b617          	auipc	a2,0xb
ffffffffc0200ae2:	53260613          	addi	a2,a2,1330 # ffffffffc020c010 <commands+0x210>
ffffffffc0200ae6:	45d1                	li	a1,20
ffffffffc0200ae8:	0000b517          	auipc	a0,0xb
ffffffffc0200aec:	54050513          	addi	a0,a0,1344 # ffffffffc020c028 <commands+0x228>
ffffffffc0200af0:	9afff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200af4 <ide_device_valid>:
ffffffffc0200af4:	478d                	li	a5,3
ffffffffc0200af6:	00a7ef63          	bltu	a5,a0,ffffffffc0200b14 <ide_device_valid+0x20>
ffffffffc0200afa:	00251793          	slli	a5,a0,0x2
ffffffffc0200afe:	953e                	add	a0,a0,a5
ffffffffc0200b00:	0512                	slli	a0,a0,0x4
ffffffffc0200b02:	00091797          	auipc	a5,0x91
ffffffffc0200b06:	b9678793          	addi	a5,a5,-1130 # ffffffffc0291698 <ide_devices>
ffffffffc0200b0a:	953e                	add	a0,a0,a5
ffffffffc0200b0c:	4108                	lw	a0,0(a0)
ffffffffc0200b0e:	00a03533          	snez	a0,a0
ffffffffc0200b12:	8082                	ret
ffffffffc0200b14:	4501                	li	a0,0
ffffffffc0200b16:	8082                	ret

ffffffffc0200b18 <ide_device_size>:
ffffffffc0200b18:	478d                	li	a5,3
ffffffffc0200b1a:	02a7e163          	bltu	a5,a0,ffffffffc0200b3c <ide_device_size+0x24>
ffffffffc0200b1e:	00251793          	slli	a5,a0,0x2
ffffffffc0200b22:	953e                	add	a0,a0,a5
ffffffffc0200b24:	0512                	slli	a0,a0,0x4
ffffffffc0200b26:	00091797          	auipc	a5,0x91
ffffffffc0200b2a:	b7278793          	addi	a5,a5,-1166 # ffffffffc0291698 <ide_devices>
ffffffffc0200b2e:	97aa                	add	a5,a5,a0
ffffffffc0200b30:	4398                	lw	a4,0(a5)
ffffffffc0200b32:	4501                	li	a0,0
ffffffffc0200b34:	c709                	beqz	a4,ffffffffc0200b3e <ide_device_size+0x26>
ffffffffc0200b36:	0087e503          	lwu	a0,8(a5)
ffffffffc0200b3a:	8082                	ret
ffffffffc0200b3c:	4501                	li	a0,0
ffffffffc0200b3e:	8082                	ret

ffffffffc0200b40 <ide_read_secs>:
ffffffffc0200b40:	1141                	addi	sp,sp,-16
ffffffffc0200b42:	e406                	sd	ra,8(sp)
ffffffffc0200b44:	08000793          	li	a5,128
ffffffffc0200b48:	04d7e763          	bltu	a5,a3,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b4c:	478d                	li	a5,3
ffffffffc0200b4e:	0005081b          	sext.w	a6,a0
ffffffffc0200b52:	04a7e263          	bltu	a5,a0,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b56:	00281793          	slli	a5,a6,0x2
ffffffffc0200b5a:	97c2                	add	a5,a5,a6
ffffffffc0200b5c:	0792                	slli	a5,a5,0x4
ffffffffc0200b5e:	00091817          	auipc	a6,0x91
ffffffffc0200b62:	b3a80813          	addi	a6,a6,-1222 # ffffffffc0291698 <ide_devices>
ffffffffc0200b66:	97c2                	add	a5,a5,a6
ffffffffc0200b68:	0007a883          	lw	a7,0(a5)
ffffffffc0200b6c:	02088563          	beqz	a7,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b70:	100008b7          	lui	a7,0x10000
ffffffffc0200b74:	0515f163          	bgeu	a1,a7,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b78:	1582                	slli	a1,a1,0x20
ffffffffc0200b7a:	9181                	srli	a1,a1,0x20
ffffffffc0200b7c:	00d58733          	add	a4,a1,a3
ffffffffc0200b80:	02e8eb63          	bltu	a7,a4,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b84:	00251713          	slli	a4,a0,0x2
ffffffffc0200b88:	60a2                	ld	ra,8(sp)
ffffffffc0200b8a:	63bc                	ld	a5,64(a5)
ffffffffc0200b8c:	953a                	add	a0,a0,a4
ffffffffc0200b8e:	0512                	slli	a0,a0,0x4
ffffffffc0200b90:	9542                	add	a0,a0,a6
ffffffffc0200b92:	0141                	addi	sp,sp,16
ffffffffc0200b94:	8782                	jr	a5
ffffffffc0200b96:	0000b697          	auipc	a3,0xb
ffffffffc0200b9a:	4c268693          	addi	a3,a3,1218 # ffffffffc020c058 <commands+0x258>
ffffffffc0200b9e:	0000b617          	auipc	a2,0xb
ffffffffc0200ba2:	47260613          	addi	a2,a2,1138 # ffffffffc020c010 <commands+0x210>
ffffffffc0200ba6:	02200593          	li	a1,34
ffffffffc0200baa:	0000b517          	auipc	a0,0xb
ffffffffc0200bae:	47e50513          	addi	a0,a0,1150 # ffffffffc020c028 <commands+0x228>
ffffffffc0200bb2:	8edff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200bb6:	0000b697          	auipc	a3,0xb
ffffffffc0200bba:	4ca68693          	addi	a3,a3,1226 # ffffffffc020c080 <commands+0x280>
ffffffffc0200bbe:	0000b617          	auipc	a2,0xb
ffffffffc0200bc2:	45260613          	addi	a2,a2,1106 # ffffffffc020c010 <commands+0x210>
ffffffffc0200bc6:	02300593          	li	a1,35
ffffffffc0200bca:	0000b517          	auipc	a0,0xb
ffffffffc0200bce:	45e50513          	addi	a0,a0,1118 # ffffffffc020c028 <commands+0x228>
ffffffffc0200bd2:	8cdff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200bd6 <ide_write_secs>:
ffffffffc0200bd6:	1141                	addi	sp,sp,-16
ffffffffc0200bd8:	e406                	sd	ra,8(sp)
ffffffffc0200bda:	08000793          	li	a5,128
ffffffffc0200bde:	04d7e763          	bltu	a5,a3,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200be2:	478d                	li	a5,3
ffffffffc0200be4:	0005081b          	sext.w	a6,a0
ffffffffc0200be8:	04a7e263          	bltu	a5,a0,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200bec:	00281793          	slli	a5,a6,0x2
ffffffffc0200bf0:	97c2                	add	a5,a5,a6
ffffffffc0200bf2:	0792                	slli	a5,a5,0x4
ffffffffc0200bf4:	00091817          	auipc	a6,0x91
ffffffffc0200bf8:	aa480813          	addi	a6,a6,-1372 # ffffffffc0291698 <ide_devices>
ffffffffc0200bfc:	97c2                	add	a5,a5,a6
ffffffffc0200bfe:	0007a883          	lw	a7,0(a5)
ffffffffc0200c02:	02088563          	beqz	a7,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200c06:	100008b7          	lui	a7,0x10000
ffffffffc0200c0a:	0515f163          	bgeu	a1,a7,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c0e:	1582                	slli	a1,a1,0x20
ffffffffc0200c10:	9181                	srli	a1,a1,0x20
ffffffffc0200c12:	00d58733          	add	a4,a1,a3
ffffffffc0200c16:	02e8eb63          	bltu	a7,a4,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c1a:	00251713          	slli	a4,a0,0x2
ffffffffc0200c1e:	60a2                	ld	ra,8(sp)
ffffffffc0200c20:	67bc                	ld	a5,72(a5)
ffffffffc0200c22:	953a                	add	a0,a0,a4
ffffffffc0200c24:	0512                	slli	a0,a0,0x4
ffffffffc0200c26:	9542                	add	a0,a0,a6
ffffffffc0200c28:	0141                	addi	sp,sp,16
ffffffffc0200c2a:	8782                	jr	a5
ffffffffc0200c2c:	0000b697          	auipc	a3,0xb
ffffffffc0200c30:	42c68693          	addi	a3,a3,1068 # ffffffffc020c058 <commands+0x258>
ffffffffc0200c34:	0000b617          	auipc	a2,0xb
ffffffffc0200c38:	3dc60613          	addi	a2,a2,988 # ffffffffc020c010 <commands+0x210>
ffffffffc0200c3c:	02900593          	li	a1,41
ffffffffc0200c40:	0000b517          	auipc	a0,0xb
ffffffffc0200c44:	3e850513          	addi	a0,a0,1000 # ffffffffc020c028 <commands+0x228>
ffffffffc0200c48:	857ff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200c4c:	0000b697          	auipc	a3,0xb
ffffffffc0200c50:	43468693          	addi	a3,a3,1076 # ffffffffc020c080 <commands+0x280>
ffffffffc0200c54:	0000b617          	auipc	a2,0xb
ffffffffc0200c58:	3bc60613          	addi	a2,a2,956 # ffffffffc020c010 <commands+0x210>
ffffffffc0200c5c:	02a00593          	li	a1,42
ffffffffc0200c60:	0000b517          	auipc	a0,0xb
ffffffffc0200c64:	3c850513          	addi	a0,a0,968 # ffffffffc020c028 <commands+0x228>
ffffffffc0200c68:	837ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200c6c <intr_enable>:
ffffffffc0200c6c:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200c70:	8082                	ret

ffffffffc0200c72 <intr_disable>:
ffffffffc0200c72:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200c76:	8082                	ret

ffffffffc0200c78 <pic_init>:
ffffffffc0200c78:	8082                	ret

ffffffffc0200c7a <ramdisk_write>:
ffffffffc0200c7a:	00856703          	lwu	a4,8(a0)
ffffffffc0200c7e:	1141                	addi	sp,sp,-16
ffffffffc0200c80:	e406                	sd	ra,8(sp)
ffffffffc0200c82:	8f0d                	sub	a4,a4,a1
ffffffffc0200c84:	87ae                	mv	a5,a1
ffffffffc0200c86:	85b2                	mv	a1,a2
ffffffffc0200c88:	00e6f363          	bgeu	a3,a4,ffffffffc0200c8e <ramdisk_write+0x14>
ffffffffc0200c8c:	8736                	mv	a4,a3
ffffffffc0200c8e:	6908                	ld	a0,16(a0)
ffffffffc0200c90:	07a6                	slli	a5,a5,0x9
ffffffffc0200c92:	00971613          	slli	a2,a4,0x9
ffffffffc0200c96:	953e                	add	a0,a0,a5
ffffffffc0200c98:	6e50a0ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc0200c9c:	60a2                	ld	ra,8(sp)
ffffffffc0200c9e:	4501                	li	a0,0
ffffffffc0200ca0:	0141                	addi	sp,sp,16
ffffffffc0200ca2:	8082                	ret

ffffffffc0200ca4 <ramdisk_read>:
ffffffffc0200ca4:	00856783          	lwu	a5,8(a0)
ffffffffc0200ca8:	1141                	addi	sp,sp,-16
ffffffffc0200caa:	e406                	sd	ra,8(sp)
ffffffffc0200cac:	8f8d                	sub	a5,a5,a1
ffffffffc0200cae:	872a                	mv	a4,a0
ffffffffc0200cb0:	8532                	mv	a0,a2
ffffffffc0200cb2:	00f6f363          	bgeu	a3,a5,ffffffffc0200cb8 <ramdisk_read+0x14>
ffffffffc0200cb6:	87b6                	mv	a5,a3
ffffffffc0200cb8:	6b18                	ld	a4,16(a4)
ffffffffc0200cba:	05a6                	slli	a1,a1,0x9
ffffffffc0200cbc:	00979613          	slli	a2,a5,0x9
ffffffffc0200cc0:	95ba                	add	a1,a1,a4
ffffffffc0200cc2:	6bb0a0ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc0200cc6:	60a2                	ld	ra,8(sp)
ffffffffc0200cc8:	4501                	li	a0,0
ffffffffc0200cca:	0141                	addi	sp,sp,16
ffffffffc0200ccc:	8082                	ret

ffffffffc0200cce <ramdisk_init>:
ffffffffc0200cce:	1101                	addi	sp,sp,-32
ffffffffc0200cd0:	e822                	sd	s0,16(sp)
ffffffffc0200cd2:	842e                	mv	s0,a1
ffffffffc0200cd4:	e426                	sd	s1,8(sp)
ffffffffc0200cd6:	05000613          	li	a2,80
ffffffffc0200cda:	84aa                	mv	s1,a0
ffffffffc0200cdc:	4581                	li	a1,0
ffffffffc0200cde:	8522                	mv	a0,s0
ffffffffc0200ce0:	ec06                	sd	ra,24(sp)
ffffffffc0200ce2:	e04a                	sd	s2,0(sp)
ffffffffc0200ce4:	6470a0ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0200ce8:	4785                	li	a5,1
ffffffffc0200cea:	06f48b63          	beq	s1,a5,ffffffffc0200d60 <ramdisk_init+0x92>
ffffffffc0200cee:	4789                	li	a5,2
ffffffffc0200cf0:	00090617          	auipc	a2,0x90
ffffffffc0200cf4:	32060613          	addi	a2,a2,800 # ffffffffc0291010 <arena>
ffffffffc0200cf8:	0001b917          	auipc	s2,0x1b
ffffffffc0200cfc:	01890913          	addi	s2,s2,24 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d00:	08f49563          	bne	s1,a5,ffffffffc0200d8a <ramdisk_init+0xbc>
ffffffffc0200d04:	06c90863          	beq	s2,a2,ffffffffc0200d74 <ramdisk_init+0xa6>
ffffffffc0200d08:	412604b3          	sub	s1,a2,s2
ffffffffc0200d0c:	86a6                	mv	a3,s1
ffffffffc0200d0e:	85ca                	mv	a1,s2
ffffffffc0200d10:	167d                	addi	a2,a2,-1
ffffffffc0200d12:	0000b517          	auipc	a0,0xb
ffffffffc0200d16:	3c650513          	addi	a0,a0,966 # ffffffffc020c0d8 <commands+0x2d8>
ffffffffc0200d1a:	c8cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200d1e:	57fd                	li	a5,-1
ffffffffc0200d20:	1782                	slli	a5,a5,0x20
ffffffffc0200d22:	0785                	addi	a5,a5,1
ffffffffc0200d24:	0094d49b          	srliw	s1,s1,0x9
ffffffffc0200d28:	e01c                	sd	a5,0(s0)
ffffffffc0200d2a:	c404                	sw	s1,8(s0)
ffffffffc0200d2c:	01243823          	sd	s2,16(s0)
ffffffffc0200d30:	02040513          	addi	a0,s0,32
ffffffffc0200d34:	0000b597          	auipc	a1,0xb
ffffffffc0200d38:	3fc58593          	addi	a1,a1,1020 # ffffffffc020c130 <commands+0x330>
ffffffffc0200d3c:	5830a0ef          	jal	ra,ffffffffc020babe <strcpy>
ffffffffc0200d40:	00000797          	auipc	a5,0x0
ffffffffc0200d44:	f6478793          	addi	a5,a5,-156 # ffffffffc0200ca4 <ramdisk_read>
ffffffffc0200d48:	e03c                	sd	a5,64(s0)
ffffffffc0200d4a:	00000797          	auipc	a5,0x0
ffffffffc0200d4e:	f3078793          	addi	a5,a5,-208 # ffffffffc0200c7a <ramdisk_write>
ffffffffc0200d52:	60e2                	ld	ra,24(sp)
ffffffffc0200d54:	e43c                	sd	a5,72(s0)
ffffffffc0200d56:	6442                	ld	s0,16(sp)
ffffffffc0200d58:	64a2                	ld	s1,8(sp)
ffffffffc0200d5a:	6902                	ld	s2,0(sp)
ffffffffc0200d5c:	6105                	addi	sp,sp,32
ffffffffc0200d5e:	8082                	ret
ffffffffc0200d60:	0001b617          	auipc	a2,0x1b
ffffffffc0200d64:	fb060613          	addi	a2,a2,-80 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d68:	00013917          	auipc	s2,0x13
ffffffffc0200d6c:	2a890913          	addi	s2,s2,680 # ffffffffc0214010 <_binary_bin_swap_img_start>
ffffffffc0200d70:	f8c91ce3          	bne	s2,a2,ffffffffc0200d08 <ramdisk_init+0x3a>
ffffffffc0200d74:	6442                	ld	s0,16(sp)
ffffffffc0200d76:	60e2                	ld	ra,24(sp)
ffffffffc0200d78:	64a2                	ld	s1,8(sp)
ffffffffc0200d7a:	6902                	ld	s2,0(sp)
ffffffffc0200d7c:	0000b517          	auipc	a0,0xb
ffffffffc0200d80:	34450513          	addi	a0,a0,836 # ffffffffc020c0c0 <commands+0x2c0>
ffffffffc0200d84:	6105                	addi	sp,sp,32
ffffffffc0200d86:	c20ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200d8a:	0000b617          	auipc	a2,0xb
ffffffffc0200d8e:	37660613          	addi	a2,a2,886 # ffffffffc020c100 <commands+0x300>
ffffffffc0200d92:	03200593          	li	a1,50
ffffffffc0200d96:	0000b517          	auipc	a0,0xb
ffffffffc0200d9a:	38250513          	addi	a0,a0,898 # ffffffffc020c118 <commands+0x318>
ffffffffc0200d9e:	f00ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200da2 <idt_init>:
ffffffffc0200da2:	14005073          	csrwi	sscratch,0
ffffffffc0200da6:	00000797          	auipc	a5,0x0
ffffffffc0200daa:	4c678793          	addi	a5,a5,1222 # ffffffffc020126c <__alltraps>
ffffffffc0200dae:	10579073          	csrw	stvec,a5
ffffffffc0200db2:	000407b7          	lui	a5,0x40
ffffffffc0200db6:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200dba:	8082                	ret

ffffffffc0200dbc <print_regs>:
ffffffffc0200dbc:	610c                	ld	a1,0(a0)
ffffffffc0200dbe:	1141                	addi	sp,sp,-16
ffffffffc0200dc0:	e022                	sd	s0,0(sp)
ffffffffc0200dc2:	842a                	mv	s0,a0
ffffffffc0200dc4:	0000b517          	auipc	a0,0xb
ffffffffc0200dc8:	37c50513          	addi	a0,a0,892 # ffffffffc020c140 <commands+0x340>
ffffffffc0200dcc:	e406                	sd	ra,8(sp)
ffffffffc0200dce:	bd8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dd2:	640c                	ld	a1,8(s0)
ffffffffc0200dd4:	0000b517          	auipc	a0,0xb
ffffffffc0200dd8:	38450513          	addi	a0,a0,900 # ffffffffc020c158 <commands+0x358>
ffffffffc0200ddc:	bcaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200de0:	680c                	ld	a1,16(s0)
ffffffffc0200de2:	0000b517          	auipc	a0,0xb
ffffffffc0200de6:	38e50513          	addi	a0,a0,910 # ffffffffc020c170 <commands+0x370>
ffffffffc0200dea:	bbcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dee:	6c0c                	ld	a1,24(s0)
ffffffffc0200df0:	0000b517          	auipc	a0,0xb
ffffffffc0200df4:	39850513          	addi	a0,a0,920 # ffffffffc020c188 <commands+0x388>
ffffffffc0200df8:	baeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dfc:	700c                	ld	a1,32(s0)
ffffffffc0200dfe:	0000b517          	auipc	a0,0xb
ffffffffc0200e02:	3a250513          	addi	a0,a0,930 # ffffffffc020c1a0 <commands+0x3a0>
ffffffffc0200e06:	ba0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e0a:	740c                	ld	a1,40(s0)
ffffffffc0200e0c:	0000b517          	auipc	a0,0xb
ffffffffc0200e10:	3ac50513          	addi	a0,a0,940 # ffffffffc020c1b8 <commands+0x3b8>
ffffffffc0200e14:	b92ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e18:	780c                	ld	a1,48(s0)
ffffffffc0200e1a:	0000b517          	auipc	a0,0xb
ffffffffc0200e1e:	3b650513          	addi	a0,a0,950 # ffffffffc020c1d0 <commands+0x3d0>
ffffffffc0200e22:	b84ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e26:	7c0c                	ld	a1,56(s0)
ffffffffc0200e28:	0000b517          	auipc	a0,0xb
ffffffffc0200e2c:	3c050513          	addi	a0,a0,960 # ffffffffc020c1e8 <commands+0x3e8>
ffffffffc0200e30:	b76ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e34:	602c                	ld	a1,64(s0)
ffffffffc0200e36:	0000b517          	auipc	a0,0xb
ffffffffc0200e3a:	3ca50513          	addi	a0,a0,970 # ffffffffc020c200 <commands+0x400>
ffffffffc0200e3e:	b68ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e42:	642c                	ld	a1,72(s0)
ffffffffc0200e44:	0000b517          	auipc	a0,0xb
ffffffffc0200e48:	3d450513          	addi	a0,a0,980 # ffffffffc020c218 <commands+0x418>
ffffffffc0200e4c:	b5aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e50:	682c                	ld	a1,80(s0)
ffffffffc0200e52:	0000b517          	auipc	a0,0xb
ffffffffc0200e56:	3de50513          	addi	a0,a0,990 # ffffffffc020c230 <commands+0x430>
ffffffffc0200e5a:	b4cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e5e:	6c2c                	ld	a1,88(s0)
ffffffffc0200e60:	0000b517          	auipc	a0,0xb
ffffffffc0200e64:	3e850513          	addi	a0,a0,1000 # ffffffffc020c248 <commands+0x448>
ffffffffc0200e68:	b3eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e6c:	702c                	ld	a1,96(s0)
ffffffffc0200e6e:	0000b517          	auipc	a0,0xb
ffffffffc0200e72:	3f250513          	addi	a0,a0,1010 # ffffffffc020c260 <commands+0x460>
ffffffffc0200e76:	b30ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e7a:	742c                	ld	a1,104(s0)
ffffffffc0200e7c:	0000b517          	auipc	a0,0xb
ffffffffc0200e80:	3fc50513          	addi	a0,a0,1020 # ffffffffc020c278 <commands+0x478>
ffffffffc0200e84:	b22ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e88:	782c                	ld	a1,112(s0)
ffffffffc0200e8a:	0000b517          	auipc	a0,0xb
ffffffffc0200e8e:	40650513          	addi	a0,a0,1030 # ffffffffc020c290 <commands+0x490>
ffffffffc0200e92:	b14ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e96:	7c2c                	ld	a1,120(s0)
ffffffffc0200e98:	0000b517          	auipc	a0,0xb
ffffffffc0200e9c:	41050513          	addi	a0,a0,1040 # ffffffffc020c2a8 <commands+0x4a8>
ffffffffc0200ea0:	b06ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ea4:	604c                	ld	a1,128(s0)
ffffffffc0200ea6:	0000b517          	auipc	a0,0xb
ffffffffc0200eaa:	41a50513          	addi	a0,a0,1050 # ffffffffc020c2c0 <commands+0x4c0>
ffffffffc0200eae:	af8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eb2:	644c                	ld	a1,136(s0)
ffffffffc0200eb4:	0000b517          	auipc	a0,0xb
ffffffffc0200eb8:	42450513          	addi	a0,a0,1060 # ffffffffc020c2d8 <commands+0x4d8>
ffffffffc0200ebc:	aeaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ec0:	684c                	ld	a1,144(s0)
ffffffffc0200ec2:	0000b517          	auipc	a0,0xb
ffffffffc0200ec6:	42e50513          	addi	a0,a0,1070 # ffffffffc020c2f0 <commands+0x4f0>
ffffffffc0200eca:	adcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ece:	6c4c                	ld	a1,152(s0)
ffffffffc0200ed0:	0000b517          	auipc	a0,0xb
ffffffffc0200ed4:	43850513          	addi	a0,a0,1080 # ffffffffc020c308 <commands+0x508>
ffffffffc0200ed8:	aceff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200edc:	704c                	ld	a1,160(s0)
ffffffffc0200ede:	0000b517          	auipc	a0,0xb
ffffffffc0200ee2:	44250513          	addi	a0,a0,1090 # ffffffffc020c320 <commands+0x520>
ffffffffc0200ee6:	ac0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eea:	744c                	ld	a1,168(s0)
ffffffffc0200eec:	0000b517          	auipc	a0,0xb
ffffffffc0200ef0:	44c50513          	addi	a0,a0,1100 # ffffffffc020c338 <commands+0x538>
ffffffffc0200ef4:	ab2ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ef8:	784c                	ld	a1,176(s0)
ffffffffc0200efa:	0000b517          	auipc	a0,0xb
ffffffffc0200efe:	45650513          	addi	a0,a0,1110 # ffffffffc020c350 <commands+0x550>
ffffffffc0200f02:	aa4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f06:	7c4c                	ld	a1,184(s0)
ffffffffc0200f08:	0000b517          	auipc	a0,0xb
ffffffffc0200f0c:	46050513          	addi	a0,a0,1120 # ffffffffc020c368 <commands+0x568>
ffffffffc0200f10:	a96ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f14:	606c                	ld	a1,192(s0)
ffffffffc0200f16:	0000b517          	auipc	a0,0xb
ffffffffc0200f1a:	46a50513          	addi	a0,a0,1130 # ffffffffc020c380 <commands+0x580>
ffffffffc0200f1e:	a88ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f22:	646c                	ld	a1,200(s0)
ffffffffc0200f24:	0000b517          	auipc	a0,0xb
ffffffffc0200f28:	47450513          	addi	a0,a0,1140 # ffffffffc020c398 <commands+0x598>
ffffffffc0200f2c:	a7aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f30:	686c                	ld	a1,208(s0)
ffffffffc0200f32:	0000b517          	auipc	a0,0xb
ffffffffc0200f36:	47e50513          	addi	a0,a0,1150 # ffffffffc020c3b0 <commands+0x5b0>
ffffffffc0200f3a:	a6cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f3e:	6c6c                	ld	a1,216(s0)
ffffffffc0200f40:	0000b517          	auipc	a0,0xb
ffffffffc0200f44:	48850513          	addi	a0,a0,1160 # ffffffffc020c3c8 <commands+0x5c8>
ffffffffc0200f48:	a5eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f4c:	706c                	ld	a1,224(s0)
ffffffffc0200f4e:	0000b517          	auipc	a0,0xb
ffffffffc0200f52:	49250513          	addi	a0,a0,1170 # ffffffffc020c3e0 <commands+0x5e0>
ffffffffc0200f56:	a50ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f5a:	746c                	ld	a1,232(s0)
ffffffffc0200f5c:	0000b517          	auipc	a0,0xb
ffffffffc0200f60:	49c50513          	addi	a0,a0,1180 # ffffffffc020c3f8 <commands+0x5f8>
ffffffffc0200f64:	a42ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f68:	786c                	ld	a1,240(s0)
ffffffffc0200f6a:	0000b517          	auipc	a0,0xb
ffffffffc0200f6e:	4a650513          	addi	a0,a0,1190 # ffffffffc020c410 <commands+0x610>
ffffffffc0200f72:	a34ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f76:	7c6c                	ld	a1,248(s0)
ffffffffc0200f78:	6402                	ld	s0,0(sp)
ffffffffc0200f7a:	60a2                	ld	ra,8(sp)
ffffffffc0200f7c:	0000b517          	auipc	a0,0xb
ffffffffc0200f80:	4ac50513          	addi	a0,a0,1196 # ffffffffc020c428 <commands+0x628>
ffffffffc0200f84:	0141                	addi	sp,sp,16
ffffffffc0200f86:	a20ff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200f8a <print_trapframe>:
ffffffffc0200f8a:	1141                	addi	sp,sp,-16
ffffffffc0200f8c:	e022                	sd	s0,0(sp)
ffffffffc0200f8e:	85aa                	mv	a1,a0
ffffffffc0200f90:	842a                	mv	s0,a0
ffffffffc0200f92:	0000b517          	auipc	a0,0xb
ffffffffc0200f96:	4ae50513          	addi	a0,a0,1198 # ffffffffc020c440 <commands+0x640>
ffffffffc0200f9a:	e406                	sd	ra,8(sp)
ffffffffc0200f9c:	a0aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fa0:	8522                	mv	a0,s0
ffffffffc0200fa2:	e1bff0ef          	jal	ra,ffffffffc0200dbc <print_regs>
ffffffffc0200fa6:	10043583          	ld	a1,256(s0)
ffffffffc0200faa:	0000b517          	auipc	a0,0xb
ffffffffc0200fae:	4ae50513          	addi	a0,a0,1198 # ffffffffc020c458 <commands+0x658>
ffffffffc0200fb2:	9f4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fb6:	10843583          	ld	a1,264(s0)
ffffffffc0200fba:	0000b517          	auipc	a0,0xb
ffffffffc0200fbe:	4b650513          	addi	a0,a0,1206 # ffffffffc020c470 <commands+0x670>
ffffffffc0200fc2:	9e4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fc6:	11043583          	ld	a1,272(s0)
ffffffffc0200fca:	0000b517          	auipc	a0,0xb
ffffffffc0200fce:	4be50513          	addi	a0,a0,1214 # ffffffffc020c488 <commands+0x688>
ffffffffc0200fd2:	9d4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fd6:	11843583          	ld	a1,280(s0)
ffffffffc0200fda:	6402                	ld	s0,0(sp)
ffffffffc0200fdc:	60a2                	ld	ra,8(sp)
ffffffffc0200fde:	0000b517          	auipc	a0,0xb
ffffffffc0200fe2:	4ba50513          	addi	a0,a0,1210 # ffffffffc020c498 <commands+0x698>
ffffffffc0200fe6:	0141                	addi	sp,sp,16
ffffffffc0200fe8:	9beff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200fec <interrupt_handler>:
ffffffffc0200fec:	11853783          	ld	a5,280(a0)
ffffffffc0200ff0:	472d                	li	a4,11
ffffffffc0200ff2:	0786                	slli	a5,a5,0x1
ffffffffc0200ff4:	8385                	srli	a5,a5,0x1
ffffffffc0200ff6:	06f76e63          	bltu	a4,a5,ffffffffc0201072 <interrupt_handler+0x86>
ffffffffc0200ffa:	0000b717          	auipc	a4,0xb
ffffffffc0200ffe:	55670713          	addi	a4,a4,1366 # ffffffffc020c550 <commands+0x750>
ffffffffc0201002:	078a                	slli	a5,a5,0x2
ffffffffc0201004:	97ba                	add	a5,a5,a4
ffffffffc0201006:	439c                	lw	a5,0(a5)
ffffffffc0201008:	97ba                	add	a5,a5,a4
ffffffffc020100a:	8782                	jr	a5
ffffffffc020100c:	0000b517          	auipc	a0,0xb
ffffffffc0201010:	50450513          	addi	a0,a0,1284 # ffffffffc020c510 <commands+0x710>
ffffffffc0201014:	992ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201018:	0000b517          	auipc	a0,0xb
ffffffffc020101c:	4d850513          	addi	a0,a0,1240 # ffffffffc020c4f0 <commands+0x6f0>
ffffffffc0201020:	986ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201024:	0000b517          	auipc	a0,0xb
ffffffffc0201028:	48c50513          	addi	a0,a0,1164 # ffffffffc020c4b0 <commands+0x6b0>
ffffffffc020102c:	97aff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201030:	0000b517          	auipc	a0,0xb
ffffffffc0201034:	4a050513          	addi	a0,a0,1184 # ffffffffc020c4d0 <commands+0x6d0>
ffffffffc0201038:	96eff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020103c:	1141                	addi	sp,sp,-16
ffffffffc020103e:	e406                	sd	ra,8(sp)
ffffffffc0201040:	d3aff0ef          	jal	ra,ffffffffc020057a <clock_set_next_event>
ffffffffc0201044:	00096717          	auipc	a4,0x96
ffffffffc0201048:	85c70713          	addi	a4,a4,-1956 # ffffffffc02968a0 <ticks>
ffffffffc020104c:	631c                	ld	a5,0(a4)
ffffffffc020104e:	0785                	addi	a5,a5,1
ffffffffc0201050:	e31c                	sd	a5,0(a4)
ffffffffc0201052:	3b7060ef          	jal	ra,ffffffffc0207c08 <run_timer_list>
ffffffffc0201056:	d9eff0ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020105a:	60a2                	ld	ra,8(sp)
ffffffffc020105c:	0ff57513          	zext.b	a0,a0
ffffffffc0201060:	0141                	addi	sp,sp,16
ffffffffc0201062:	2760806f          	j	ffffffffc02092d8 <dev_stdin_write>
ffffffffc0201066:	0000b517          	auipc	a0,0xb
ffffffffc020106a:	4ca50513          	addi	a0,a0,1226 # ffffffffc020c530 <commands+0x730>
ffffffffc020106e:	938ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201072:	bf21                	j	ffffffffc0200f8a <print_trapframe>

ffffffffc0201074 <exception_handler>:
ffffffffc0201074:	11853783          	ld	a5,280(a0)
ffffffffc0201078:	1141                	addi	sp,sp,-16
ffffffffc020107a:	e022                	sd	s0,0(sp)
ffffffffc020107c:	e406                	sd	ra,8(sp)
ffffffffc020107e:	473d                	li	a4,15
ffffffffc0201080:	842a                	mv	s0,a0
ffffffffc0201082:	12f76a63          	bltu	a4,a5,ffffffffc02011b6 <exception_handler+0x142>
ffffffffc0201086:	0000b717          	auipc	a4,0xb
ffffffffc020108a:	68670713          	addi	a4,a4,1670 # ffffffffc020c70c <commands+0x90c>
ffffffffc020108e:	078a                	slli	a5,a5,0x2
ffffffffc0201090:	97ba                	add	a5,a5,a4
ffffffffc0201092:	439c                	lw	a5,0(a5)
ffffffffc0201094:	97ba                	add	a5,a5,a4
ffffffffc0201096:	8782                	jr	a5
ffffffffc0201098:	0000b517          	auipc	a0,0xb
ffffffffc020109c:	59850513          	addi	a0,a0,1432 # ffffffffc020c630 <commands+0x830>
ffffffffc02010a0:	906ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02010a4:	10843783          	ld	a5,264(s0)
ffffffffc02010a8:	60a2                	ld	ra,8(sp)
ffffffffc02010aa:	0791                	addi	a5,a5,4
ffffffffc02010ac:	10f43423          	sd	a5,264(s0)
ffffffffc02010b0:	6402                	ld	s0,0(sp)
ffffffffc02010b2:	0141                	addi	sp,sp,16
ffffffffc02010b4:	56b0606f          	j	ffffffffc0207e1e <syscall>
ffffffffc02010b8:	0000b517          	auipc	a0,0xb
ffffffffc02010bc:	59850513          	addi	a0,a0,1432 # ffffffffc020c650 <commands+0x850>
ffffffffc02010c0:	6402                	ld	s0,0(sp)
ffffffffc02010c2:	60a2                	ld	ra,8(sp)
ffffffffc02010c4:	0141                	addi	sp,sp,16
ffffffffc02010c6:	8e0ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010ca:	0000b517          	auipc	a0,0xb
ffffffffc02010ce:	5a650513          	addi	a0,a0,1446 # ffffffffc020c670 <commands+0x870>
ffffffffc02010d2:	b7fd                	j	ffffffffc02010c0 <exception_handler+0x4c>
ffffffffc02010d4:	0000b517          	auipc	a0,0xb
ffffffffc02010d8:	5bc50513          	addi	a0,a0,1468 # ffffffffc020c690 <commands+0x890>
ffffffffc02010dc:	8caff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02010e0:	10043783          	ld	a5,256(s0)
ffffffffc02010e4:	1007f793          	andi	a5,a5,256
ffffffffc02010e8:	ef81                	bnez	a5,ffffffffc0201100 <exception_handler+0x8c>
ffffffffc02010ea:	00096797          	auipc	a5,0x96
ffffffffc02010ee:	8067b783          	ld	a5,-2042(a5) # ffffffffc02968f0 <current>
ffffffffc02010f2:	c799                	beqz	a5,ffffffffc0201100 <exception_handler+0x8c>
ffffffffc02010f4:	0b07a703          	lw	a4,176(a5)
ffffffffc02010f8:	00176713          	ori	a4,a4,1
ffffffffc02010fc:	0ae7a823          	sw	a4,176(a5)
ffffffffc0201100:	60a2                	ld	ra,8(sp)
ffffffffc0201102:	6402                	ld	s0,0(sp)
ffffffffc0201104:	0141                	addi	sp,sp,16
ffffffffc0201106:	8082                	ret
ffffffffc0201108:	0000b517          	auipc	a0,0xb
ffffffffc020110c:	5a050513          	addi	a0,a0,1440 # ffffffffc020c6a8 <commands+0x8a8>
ffffffffc0201110:	896ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201114:	10043783          	ld	a5,256(s0)
ffffffffc0201118:	1007f793          	andi	a5,a5,256
ffffffffc020111c:	f3f5                	bnez	a5,ffffffffc0201100 <exception_handler+0x8c>
ffffffffc020111e:	b7f1                	j	ffffffffc02010ea <exception_handler+0x76>
ffffffffc0201120:	0000b517          	auipc	a0,0xb
ffffffffc0201124:	5a050513          	addi	a0,a0,1440 # ffffffffc020c6c0 <commands+0x8c0>
ffffffffc0201128:	87eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020112c:	10043783          	ld	a5,256(s0)
ffffffffc0201130:	1007f793          	andi	a5,a5,256
ffffffffc0201134:	f7f1                	bnez	a5,ffffffffc0201100 <exception_handler+0x8c>
ffffffffc0201136:	bf55                	j	ffffffffc02010ea <exception_handler+0x76>
ffffffffc0201138:	0000b517          	auipc	a0,0xb
ffffffffc020113c:	44850513          	addi	a0,a0,1096 # ffffffffc020c580 <commands+0x780>
ffffffffc0201140:	b741                	j	ffffffffc02010c0 <exception_handler+0x4c>
ffffffffc0201142:	0000b517          	auipc	a0,0xb
ffffffffc0201146:	5ae50513          	addi	a0,a0,1454 # ffffffffc020c6f0 <commands+0x8f0>
ffffffffc020114a:	85cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020114e:	10043783          	ld	a5,256(s0)
ffffffffc0201152:	1007f793          	andi	a5,a5,256
ffffffffc0201156:	f7cd                	bnez	a5,ffffffffc0201100 <exception_handler+0x8c>
ffffffffc0201158:	bf49                	j	ffffffffc02010ea <exception_handler+0x76>
ffffffffc020115a:	0000b517          	auipc	a0,0xb
ffffffffc020115e:	44650513          	addi	a0,a0,1094 # ffffffffc020c5a0 <commands+0x7a0>
ffffffffc0201162:	844ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201166:	10043783          	ld	a5,256(s0)
ffffffffc020116a:	1007f793          	andi	a5,a5,256
ffffffffc020116e:	fbc9                	bnez	a5,ffffffffc0201100 <exception_handler+0x8c>
ffffffffc0201170:	bfad                	j	ffffffffc02010ea <exception_handler+0x76>
ffffffffc0201172:	0000b517          	auipc	a0,0xb
ffffffffc0201176:	44650513          	addi	a0,a0,1094 # ffffffffc020c5b8 <commands+0x7b8>
ffffffffc020117a:	b799                	j	ffffffffc02010c0 <exception_handler+0x4c>
ffffffffc020117c:	0000b517          	auipc	a0,0xb
ffffffffc0201180:	44c50513          	addi	a0,a0,1100 # ffffffffc020c5c8 <commands+0x7c8>
ffffffffc0201184:	bf35                	j	ffffffffc02010c0 <exception_handler+0x4c>
ffffffffc0201186:	0000b517          	auipc	a0,0xb
ffffffffc020118a:	55250513          	addi	a0,a0,1362 # ffffffffc020c6d8 <commands+0x8d8>
ffffffffc020118e:	818ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201192:	10043783          	ld	a5,256(s0)
ffffffffc0201196:	1007f793          	andi	a5,a5,256
ffffffffc020119a:	f3bd                	bnez	a5,ffffffffc0201100 <exception_handler+0x8c>
ffffffffc020119c:	b7b9                	j	ffffffffc02010ea <exception_handler+0x76>
ffffffffc020119e:	0000b517          	auipc	a0,0xb
ffffffffc02011a2:	47a50513          	addi	a0,a0,1146 # ffffffffc020c618 <commands+0x818>
ffffffffc02011a6:	800ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02011aa:	10043783          	ld	a5,256(s0)
ffffffffc02011ae:	1007f793          	andi	a5,a5,256
ffffffffc02011b2:	f7b9                	bnez	a5,ffffffffc0201100 <exception_handler+0x8c>
ffffffffc02011b4:	bf1d                	j	ffffffffc02010ea <exception_handler+0x76>
ffffffffc02011b6:	8522                	mv	a0,s0
ffffffffc02011b8:	dd3ff0ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc02011bc:	10043783          	ld	a5,256(s0)
ffffffffc02011c0:	1007f793          	andi	a5,a5,256
ffffffffc02011c4:	ff95                	bnez	a5,ffffffffc0201100 <exception_handler+0x8c>
ffffffffc02011c6:	b715                	j	ffffffffc02010ea <exception_handler+0x76>
ffffffffc02011c8:	0000b617          	auipc	a2,0xb
ffffffffc02011cc:	42060613          	addi	a2,a2,1056 # ffffffffc020c5e8 <commands+0x7e8>
ffffffffc02011d0:	0b500593          	li	a1,181
ffffffffc02011d4:	0000b517          	auipc	a0,0xb
ffffffffc02011d8:	42c50513          	addi	a0,a0,1068 # ffffffffc020c600 <commands+0x800>
ffffffffc02011dc:	ac2ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02011e0 <trap>:
ffffffffc02011e0:	1101                	addi	sp,sp,-32
ffffffffc02011e2:	e822                	sd	s0,16(sp)
ffffffffc02011e4:	00095417          	auipc	s0,0x95
ffffffffc02011e8:	70c40413          	addi	s0,s0,1804 # ffffffffc02968f0 <current>
ffffffffc02011ec:	6018                	ld	a4,0(s0)
ffffffffc02011ee:	ec06                	sd	ra,24(sp)
ffffffffc02011f0:	e426                	sd	s1,8(sp)
ffffffffc02011f2:	e04a                	sd	s2,0(sp)
ffffffffc02011f4:	11853683          	ld	a3,280(a0)
ffffffffc02011f8:	cf1d                	beqz	a4,ffffffffc0201236 <trap+0x56>
ffffffffc02011fa:	10053483          	ld	s1,256(a0)
ffffffffc02011fe:	0a073903          	ld	s2,160(a4)
ffffffffc0201202:	f348                	sd	a0,160(a4)
ffffffffc0201204:	1004f493          	andi	s1,s1,256
ffffffffc0201208:	0206c463          	bltz	a3,ffffffffc0201230 <trap+0x50>
ffffffffc020120c:	e69ff0ef          	jal	ra,ffffffffc0201074 <exception_handler>
ffffffffc0201210:	601c                	ld	a5,0(s0)
ffffffffc0201212:	0b27b023          	sd	s2,160(a5)
ffffffffc0201216:	e499                	bnez	s1,ffffffffc0201224 <trap+0x44>
ffffffffc0201218:	0b07a703          	lw	a4,176(a5)
ffffffffc020121c:	8b05                	andi	a4,a4,1
ffffffffc020121e:	e329                	bnez	a4,ffffffffc0201260 <trap+0x80>
ffffffffc0201220:	6f9c                	ld	a5,24(a5)
ffffffffc0201222:	eb85                	bnez	a5,ffffffffc0201252 <trap+0x72>
ffffffffc0201224:	60e2                	ld	ra,24(sp)
ffffffffc0201226:	6442                	ld	s0,16(sp)
ffffffffc0201228:	64a2                	ld	s1,8(sp)
ffffffffc020122a:	6902                	ld	s2,0(sp)
ffffffffc020122c:	6105                	addi	sp,sp,32
ffffffffc020122e:	8082                	ret
ffffffffc0201230:	dbdff0ef          	jal	ra,ffffffffc0200fec <interrupt_handler>
ffffffffc0201234:	bff1                	j	ffffffffc0201210 <trap+0x30>
ffffffffc0201236:	0006c863          	bltz	a3,ffffffffc0201246 <trap+0x66>
ffffffffc020123a:	6442                	ld	s0,16(sp)
ffffffffc020123c:	60e2                	ld	ra,24(sp)
ffffffffc020123e:	64a2                	ld	s1,8(sp)
ffffffffc0201240:	6902                	ld	s2,0(sp)
ffffffffc0201242:	6105                	addi	sp,sp,32
ffffffffc0201244:	bd05                	j	ffffffffc0201074 <exception_handler>
ffffffffc0201246:	6442                	ld	s0,16(sp)
ffffffffc0201248:	60e2                	ld	ra,24(sp)
ffffffffc020124a:	64a2                	ld	s1,8(sp)
ffffffffc020124c:	6902                	ld	s2,0(sp)
ffffffffc020124e:	6105                	addi	sp,sp,32
ffffffffc0201250:	bb71                	j	ffffffffc0200fec <interrupt_handler>
ffffffffc0201252:	6442                	ld	s0,16(sp)
ffffffffc0201254:	60e2                	ld	ra,24(sp)
ffffffffc0201256:	64a2                	ld	s1,8(sp)
ffffffffc0201258:	6902                	ld	s2,0(sp)
ffffffffc020125a:	6105                	addi	sp,sp,32
ffffffffc020125c:	7a00606f          	j	ffffffffc02079fc <schedule>
ffffffffc0201260:	555d                	li	a0,-9
ffffffffc0201262:	5e5040ef          	jal	ra,ffffffffc0206046 <do_exit>
ffffffffc0201266:	601c                	ld	a5,0(s0)
ffffffffc0201268:	bf65                	j	ffffffffc0201220 <trap+0x40>
	...

ffffffffc020126c <__alltraps>:
ffffffffc020126c:	14011173          	csrrw	sp,sscratch,sp
ffffffffc0201270:	00011463          	bnez	sp,ffffffffc0201278 <__alltraps+0xc>
ffffffffc0201274:	14002173          	csrr	sp,sscratch
ffffffffc0201278:	712d                	addi	sp,sp,-288
ffffffffc020127a:	e002                	sd	zero,0(sp)
ffffffffc020127c:	e406                	sd	ra,8(sp)
ffffffffc020127e:	ec0e                	sd	gp,24(sp)
ffffffffc0201280:	f012                	sd	tp,32(sp)
ffffffffc0201282:	f416                	sd	t0,40(sp)
ffffffffc0201284:	f81a                	sd	t1,48(sp)
ffffffffc0201286:	fc1e                	sd	t2,56(sp)
ffffffffc0201288:	e0a2                	sd	s0,64(sp)
ffffffffc020128a:	e4a6                	sd	s1,72(sp)
ffffffffc020128c:	e8aa                	sd	a0,80(sp)
ffffffffc020128e:	ecae                	sd	a1,88(sp)
ffffffffc0201290:	f0b2                	sd	a2,96(sp)
ffffffffc0201292:	f4b6                	sd	a3,104(sp)
ffffffffc0201294:	f8ba                	sd	a4,112(sp)
ffffffffc0201296:	fcbe                	sd	a5,120(sp)
ffffffffc0201298:	e142                	sd	a6,128(sp)
ffffffffc020129a:	e546                	sd	a7,136(sp)
ffffffffc020129c:	e94a                	sd	s2,144(sp)
ffffffffc020129e:	ed4e                	sd	s3,152(sp)
ffffffffc02012a0:	f152                	sd	s4,160(sp)
ffffffffc02012a2:	f556                	sd	s5,168(sp)
ffffffffc02012a4:	f95a                	sd	s6,176(sp)
ffffffffc02012a6:	fd5e                	sd	s7,184(sp)
ffffffffc02012a8:	e1e2                	sd	s8,192(sp)
ffffffffc02012aa:	e5e6                	sd	s9,200(sp)
ffffffffc02012ac:	e9ea                	sd	s10,208(sp)
ffffffffc02012ae:	edee                	sd	s11,216(sp)
ffffffffc02012b0:	f1f2                	sd	t3,224(sp)
ffffffffc02012b2:	f5f6                	sd	t4,232(sp)
ffffffffc02012b4:	f9fa                	sd	t5,240(sp)
ffffffffc02012b6:	fdfe                	sd	t6,248(sp)
ffffffffc02012b8:	14001473          	csrrw	s0,sscratch,zero
ffffffffc02012bc:	100024f3          	csrr	s1,sstatus
ffffffffc02012c0:	14102973          	csrr	s2,sepc
ffffffffc02012c4:	143029f3          	csrr	s3,stval
ffffffffc02012c8:	14202a73          	csrr	s4,scause
ffffffffc02012cc:	e822                	sd	s0,16(sp)
ffffffffc02012ce:	e226                	sd	s1,256(sp)
ffffffffc02012d0:	e64a                	sd	s2,264(sp)
ffffffffc02012d2:	ea4e                	sd	s3,272(sp)
ffffffffc02012d4:	ee52                	sd	s4,280(sp)
ffffffffc02012d6:	850a                	mv	a0,sp
ffffffffc02012d8:	f09ff0ef          	jal	ra,ffffffffc02011e0 <trap>

ffffffffc02012dc <__trapret>:
ffffffffc02012dc:	6492                	ld	s1,256(sp)
ffffffffc02012de:	6932                	ld	s2,264(sp)
ffffffffc02012e0:	1004f413          	andi	s0,s1,256
ffffffffc02012e4:	e401                	bnez	s0,ffffffffc02012ec <__trapret+0x10>
ffffffffc02012e6:	1200                	addi	s0,sp,288
ffffffffc02012e8:	14041073          	csrw	sscratch,s0
ffffffffc02012ec:	10049073          	csrw	sstatus,s1
ffffffffc02012f0:	14191073          	csrw	sepc,s2
ffffffffc02012f4:	60a2                	ld	ra,8(sp)
ffffffffc02012f6:	61e2                	ld	gp,24(sp)
ffffffffc02012f8:	7202                	ld	tp,32(sp)
ffffffffc02012fa:	72a2                	ld	t0,40(sp)
ffffffffc02012fc:	7342                	ld	t1,48(sp)
ffffffffc02012fe:	73e2                	ld	t2,56(sp)
ffffffffc0201300:	6406                	ld	s0,64(sp)
ffffffffc0201302:	64a6                	ld	s1,72(sp)
ffffffffc0201304:	6546                	ld	a0,80(sp)
ffffffffc0201306:	65e6                	ld	a1,88(sp)
ffffffffc0201308:	7606                	ld	a2,96(sp)
ffffffffc020130a:	76a6                	ld	a3,104(sp)
ffffffffc020130c:	7746                	ld	a4,112(sp)
ffffffffc020130e:	77e6                	ld	a5,120(sp)
ffffffffc0201310:	680a                	ld	a6,128(sp)
ffffffffc0201312:	68aa                	ld	a7,136(sp)
ffffffffc0201314:	694a                	ld	s2,144(sp)
ffffffffc0201316:	69ea                	ld	s3,152(sp)
ffffffffc0201318:	7a0a                	ld	s4,160(sp)
ffffffffc020131a:	7aaa                	ld	s5,168(sp)
ffffffffc020131c:	7b4a                	ld	s6,176(sp)
ffffffffc020131e:	7bea                	ld	s7,184(sp)
ffffffffc0201320:	6c0e                	ld	s8,192(sp)
ffffffffc0201322:	6cae                	ld	s9,200(sp)
ffffffffc0201324:	6d4e                	ld	s10,208(sp)
ffffffffc0201326:	6dee                	ld	s11,216(sp)
ffffffffc0201328:	7e0e                	ld	t3,224(sp)
ffffffffc020132a:	7eae                	ld	t4,232(sp)
ffffffffc020132c:	7f4e                	ld	t5,240(sp)
ffffffffc020132e:	7fee                	ld	t6,248(sp)
ffffffffc0201330:	6142                	ld	sp,16(sp)
ffffffffc0201332:	10200073          	sret

ffffffffc0201336 <forkrets>:
ffffffffc0201336:	812a                	mv	sp,a0
ffffffffc0201338:	b755                	j	ffffffffc02012dc <__trapret>

ffffffffc020133a <default_init>:
ffffffffc020133a:	00090797          	auipc	a5,0x90
ffffffffc020133e:	49e78793          	addi	a5,a5,1182 # ffffffffc02917d8 <free_area>
ffffffffc0201342:	e79c                	sd	a5,8(a5)
ffffffffc0201344:	e39c                	sd	a5,0(a5)
ffffffffc0201346:	0007a823          	sw	zero,16(a5)
ffffffffc020134a:	8082                	ret

ffffffffc020134c <default_nr_free_pages>:
ffffffffc020134c:	00090517          	auipc	a0,0x90
ffffffffc0201350:	49c56503          	lwu	a0,1180(a0) # ffffffffc02917e8 <free_area+0x10>
ffffffffc0201354:	8082                	ret

ffffffffc0201356 <default_check>:
ffffffffc0201356:	715d                	addi	sp,sp,-80
ffffffffc0201358:	e0a2                	sd	s0,64(sp)
ffffffffc020135a:	00090417          	auipc	s0,0x90
ffffffffc020135e:	47e40413          	addi	s0,s0,1150 # ffffffffc02917d8 <free_area>
ffffffffc0201362:	641c                	ld	a5,8(s0)
ffffffffc0201364:	e486                	sd	ra,72(sp)
ffffffffc0201366:	fc26                	sd	s1,56(sp)
ffffffffc0201368:	f84a                	sd	s2,48(sp)
ffffffffc020136a:	f44e                	sd	s3,40(sp)
ffffffffc020136c:	f052                	sd	s4,32(sp)
ffffffffc020136e:	ec56                	sd	s5,24(sp)
ffffffffc0201370:	e85a                	sd	s6,16(sp)
ffffffffc0201372:	e45e                	sd	s7,8(sp)
ffffffffc0201374:	e062                	sd	s8,0(sp)
ffffffffc0201376:	2a878d63          	beq	a5,s0,ffffffffc0201630 <default_check+0x2da>
ffffffffc020137a:	4481                	li	s1,0
ffffffffc020137c:	4901                	li	s2,0
ffffffffc020137e:	ff07b703          	ld	a4,-16(a5)
ffffffffc0201382:	8b09                	andi	a4,a4,2
ffffffffc0201384:	2a070a63          	beqz	a4,ffffffffc0201638 <default_check+0x2e2>
ffffffffc0201388:	ff87a703          	lw	a4,-8(a5)
ffffffffc020138c:	679c                	ld	a5,8(a5)
ffffffffc020138e:	2905                	addiw	s2,s2,1
ffffffffc0201390:	9cb9                	addw	s1,s1,a4
ffffffffc0201392:	fe8796e3          	bne	a5,s0,ffffffffc020137e <default_check+0x28>
ffffffffc0201396:	89a6                	mv	s3,s1
ffffffffc0201398:	6df000ef          	jal	ra,ffffffffc0202276 <nr_free_pages>
ffffffffc020139c:	6f351e63          	bne	a0,s3,ffffffffc0201a98 <default_check+0x742>
ffffffffc02013a0:	4505                	li	a0,1
ffffffffc02013a2:	657000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc02013a6:	8aaa                	mv	s5,a0
ffffffffc02013a8:	42050863          	beqz	a0,ffffffffc02017d8 <default_check+0x482>
ffffffffc02013ac:	4505                	li	a0,1
ffffffffc02013ae:	64b000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc02013b2:	89aa                	mv	s3,a0
ffffffffc02013b4:	70050263          	beqz	a0,ffffffffc0201ab8 <default_check+0x762>
ffffffffc02013b8:	4505                	li	a0,1
ffffffffc02013ba:	63f000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc02013be:	8a2a                	mv	s4,a0
ffffffffc02013c0:	48050c63          	beqz	a0,ffffffffc0201858 <default_check+0x502>
ffffffffc02013c4:	293a8a63          	beq	s5,s3,ffffffffc0201658 <default_check+0x302>
ffffffffc02013c8:	28aa8863          	beq	s5,a0,ffffffffc0201658 <default_check+0x302>
ffffffffc02013cc:	28a98663          	beq	s3,a0,ffffffffc0201658 <default_check+0x302>
ffffffffc02013d0:	000aa783          	lw	a5,0(s5)
ffffffffc02013d4:	2a079263          	bnez	a5,ffffffffc0201678 <default_check+0x322>
ffffffffc02013d8:	0009a783          	lw	a5,0(s3)
ffffffffc02013dc:	28079e63          	bnez	a5,ffffffffc0201678 <default_check+0x322>
ffffffffc02013e0:	411c                	lw	a5,0(a0)
ffffffffc02013e2:	28079b63          	bnez	a5,ffffffffc0201678 <default_check+0x322>
ffffffffc02013e6:	00095797          	auipc	a5,0x95
ffffffffc02013ea:	4f27b783          	ld	a5,1266(a5) # ffffffffc02968d8 <pages>
ffffffffc02013ee:	40fa8733          	sub	a4,s5,a5
ffffffffc02013f2:	0000f617          	auipc	a2,0xf
ffffffffc02013f6:	abe63603          	ld	a2,-1346(a2) # ffffffffc020feb0 <nbase>
ffffffffc02013fa:	8719                	srai	a4,a4,0x6
ffffffffc02013fc:	9732                	add	a4,a4,a2
ffffffffc02013fe:	00095697          	auipc	a3,0x95
ffffffffc0201402:	4d26b683          	ld	a3,1234(a3) # ffffffffc02968d0 <npage>
ffffffffc0201406:	06b2                	slli	a3,a3,0xc
ffffffffc0201408:	0732                	slli	a4,a4,0xc
ffffffffc020140a:	28d77763          	bgeu	a4,a3,ffffffffc0201698 <default_check+0x342>
ffffffffc020140e:	40f98733          	sub	a4,s3,a5
ffffffffc0201412:	8719                	srai	a4,a4,0x6
ffffffffc0201414:	9732                	add	a4,a4,a2
ffffffffc0201416:	0732                	slli	a4,a4,0xc
ffffffffc0201418:	4cd77063          	bgeu	a4,a3,ffffffffc02018d8 <default_check+0x582>
ffffffffc020141c:	40f507b3          	sub	a5,a0,a5
ffffffffc0201420:	8799                	srai	a5,a5,0x6
ffffffffc0201422:	97b2                	add	a5,a5,a2
ffffffffc0201424:	07b2                	slli	a5,a5,0xc
ffffffffc0201426:	30d7f963          	bgeu	a5,a3,ffffffffc0201738 <default_check+0x3e2>
ffffffffc020142a:	4505                	li	a0,1
ffffffffc020142c:	00043c03          	ld	s8,0(s0)
ffffffffc0201430:	00843b83          	ld	s7,8(s0)
ffffffffc0201434:	01042b03          	lw	s6,16(s0)
ffffffffc0201438:	e400                	sd	s0,8(s0)
ffffffffc020143a:	e000                	sd	s0,0(s0)
ffffffffc020143c:	00090797          	auipc	a5,0x90
ffffffffc0201440:	3a07a623          	sw	zero,940(a5) # ffffffffc02917e8 <free_area+0x10>
ffffffffc0201444:	5b5000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc0201448:	2c051863          	bnez	a0,ffffffffc0201718 <default_check+0x3c2>
ffffffffc020144c:	4585                	li	a1,1
ffffffffc020144e:	8556                	mv	a0,s5
ffffffffc0201450:	5e7000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc0201454:	4585                	li	a1,1
ffffffffc0201456:	854e                	mv	a0,s3
ffffffffc0201458:	5df000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc020145c:	4585                	li	a1,1
ffffffffc020145e:	8552                	mv	a0,s4
ffffffffc0201460:	5d7000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc0201464:	4818                	lw	a4,16(s0)
ffffffffc0201466:	478d                	li	a5,3
ffffffffc0201468:	28f71863          	bne	a4,a5,ffffffffc02016f8 <default_check+0x3a2>
ffffffffc020146c:	4505                	li	a0,1
ffffffffc020146e:	58b000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc0201472:	89aa                	mv	s3,a0
ffffffffc0201474:	26050263          	beqz	a0,ffffffffc02016d8 <default_check+0x382>
ffffffffc0201478:	4505                	li	a0,1
ffffffffc020147a:	57f000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc020147e:	8aaa                	mv	s5,a0
ffffffffc0201480:	3a050c63          	beqz	a0,ffffffffc0201838 <default_check+0x4e2>
ffffffffc0201484:	4505                	li	a0,1
ffffffffc0201486:	573000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc020148a:	8a2a                	mv	s4,a0
ffffffffc020148c:	38050663          	beqz	a0,ffffffffc0201818 <default_check+0x4c2>
ffffffffc0201490:	4505                	li	a0,1
ffffffffc0201492:	567000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc0201496:	36051163          	bnez	a0,ffffffffc02017f8 <default_check+0x4a2>
ffffffffc020149a:	4585                	li	a1,1
ffffffffc020149c:	854e                	mv	a0,s3
ffffffffc020149e:	599000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc02014a2:	641c                	ld	a5,8(s0)
ffffffffc02014a4:	20878a63          	beq	a5,s0,ffffffffc02016b8 <default_check+0x362>
ffffffffc02014a8:	4505                	li	a0,1
ffffffffc02014aa:	54f000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc02014ae:	30a99563          	bne	s3,a0,ffffffffc02017b8 <default_check+0x462>
ffffffffc02014b2:	4505                	li	a0,1
ffffffffc02014b4:	545000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc02014b8:	2e051063          	bnez	a0,ffffffffc0201798 <default_check+0x442>
ffffffffc02014bc:	481c                	lw	a5,16(s0)
ffffffffc02014be:	2a079d63          	bnez	a5,ffffffffc0201778 <default_check+0x422>
ffffffffc02014c2:	854e                	mv	a0,s3
ffffffffc02014c4:	4585                	li	a1,1
ffffffffc02014c6:	01843023          	sd	s8,0(s0)
ffffffffc02014ca:	01743423          	sd	s7,8(s0)
ffffffffc02014ce:	01642823          	sw	s6,16(s0)
ffffffffc02014d2:	565000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc02014d6:	4585                	li	a1,1
ffffffffc02014d8:	8556                	mv	a0,s5
ffffffffc02014da:	55d000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc02014de:	4585                	li	a1,1
ffffffffc02014e0:	8552                	mv	a0,s4
ffffffffc02014e2:	555000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc02014e6:	4515                	li	a0,5
ffffffffc02014e8:	511000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc02014ec:	89aa                	mv	s3,a0
ffffffffc02014ee:	26050563          	beqz	a0,ffffffffc0201758 <default_check+0x402>
ffffffffc02014f2:	651c                	ld	a5,8(a0)
ffffffffc02014f4:	8385                	srli	a5,a5,0x1
ffffffffc02014f6:	8b85                	andi	a5,a5,1
ffffffffc02014f8:	54079063          	bnez	a5,ffffffffc0201a38 <default_check+0x6e2>
ffffffffc02014fc:	4505                	li	a0,1
ffffffffc02014fe:	00043b03          	ld	s6,0(s0)
ffffffffc0201502:	00843a83          	ld	s5,8(s0)
ffffffffc0201506:	e000                	sd	s0,0(s0)
ffffffffc0201508:	e400                	sd	s0,8(s0)
ffffffffc020150a:	4ef000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc020150e:	50051563          	bnez	a0,ffffffffc0201a18 <default_check+0x6c2>
ffffffffc0201512:	08098a13          	addi	s4,s3,128
ffffffffc0201516:	8552                	mv	a0,s4
ffffffffc0201518:	458d                	li	a1,3
ffffffffc020151a:	01042b83          	lw	s7,16(s0)
ffffffffc020151e:	00090797          	auipc	a5,0x90
ffffffffc0201522:	2c07a523          	sw	zero,714(a5) # ffffffffc02917e8 <free_area+0x10>
ffffffffc0201526:	511000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc020152a:	4511                	li	a0,4
ffffffffc020152c:	4cd000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc0201530:	4c051463          	bnez	a0,ffffffffc02019f8 <default_check+0x6a2>
ffffffffc0201534:	0889b783          	ld	a5,136(s3)
ffffffffc0201538:	8385                	srli	a5,a5,0x1
ffffffffc020153a:	8b85                	andi	a5,a5,1
ffffffffc020153c:	48078e63          	beqz	a5,ffffffffc02019d8 <default_check+0x682>
ffffffffc0201540:	0909a703          	lw	a4,144(s3)
ffffffffc0201544:	478d                	li	a5,3
ffffffffc0201546:	48f71963          	bne	a4,a5,ffffffffc02019d8 <default_check+0x682>
ffffffffc020154a:	450d                	li	a0,3
ffffffffc020154c:	4ad000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc0201550:	8c2a                	mv	s8,a0
ffffffffc0201552:	46050363          	beqz	a0,ffffffffc02019b8 <default_check+0x662>
ffffffffc0201556:	4505                	li	a0,1
ffffffffc0201558:	4a1000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc020155c:	42051e63          	bnez	a0,ffffffffc0201998 <default_check+0x642>
ffffffffc0201560:	418a1c63          	bne	s4,s8,ffffffffc0201978 <default_check+0x622>
ffffffffc0201564:	4585                	li	a1,1
ffffffffc0201566:	854e                	mv	a0,s3
ffffffffc0201568:	4cf000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc020156c:	458d                	li	a1,3
ffffffffc020156e:	8552                	mv	a0,s4
ffffffffc0201570:	4c7000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc0201574:	0089b783          	ld	a5,8(s3)
ffffffffc0201578:	04098c13          	addi	s8,s3,64
ffffffffc020157c:	8385                	srli	a5,a5,0x1
ffffffffc020157e:	8b85                	andi	a5,a5,1
ffffffffc0201580:	3c078c63          	beqz	a5,ffffffffc0201958 <default_check+0x602>
ffffffffc0201584:	0109a703          	lw	a4,16(s3)
ffffffffc0201588:	4785                	li	a5,1
ffffffffc020158a:	3cf71763          	bne	a4,a5,ffffffffc0201958 <default_check+0x602>
ffffffffc020158e:	008a3783          	ld	a5,8(s4)
ffffffffc0201592:	8385                	srli	a5,a5,0x1
ffffffffc0201594:	8b85                	andi	a5,a5,1
ffffffffc0201596:	3a078163          	beqz	a5,ffffffffc0201938 <default_check+0x5e2>
ffffffffc020159a:	010a2703          	lw	a4,16(s4)
ffffffffc020159e:	478d                	li	a5,3
ffffffffc02015a0:	38f71c63          	bne	a4,a5,ffffffffc0201938 <default_check+0x5e2>
ffffffffc02015a4:	4505                	li	a0,1
ffffffffc02015a6:	453000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc02015aa:	36a99763          	bne	s3,a0,ffffffffc0201918 <default_check+0x5c2>
ffffffffc02015ae:	4585                	li	a1,1
ffffffffc02015b0:	487000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc02015b4:	4509                	li	a0,2
ffffffffc02015b6:	443000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc02015ba:	32aa1f63          	bne	s4,a0,ffffffffc02018f8 <default_check+0x5a2>
ffffffffc02015be:	4589                	li	a1,2
ffffffffc02015c0:	477000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc02015c4:	4585                	li	a1,1
ffffffffc02015c6:	8562                	mv	a0,s8
ffffffffc02015c8:	46f000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc02015cc:	4515                	li	a0,5
ffffffffc02015ce:	42b000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc02015d2:	89aa                	mv	s3,a0
ffffffffc02015d4:	48050263          	beqz	a0,ffffffffc0201a58 <default_check+0x702>
ffffffffc02015d8:	4505                	li	a0,1
ffffffffc02015da:	41f000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc02015de:	2c051d63          	bnez	a0,ffffffffc02018b8 <default_check+0x562>
ffffffffc02015e2:	481c                	lw	a5,16(s0)
ffffffffc02015e4:	2a079a63          	bnez	a5,ffffffffc0201898 <default_check+0x542>
ffffffffc02015e8:	4595                	li	a1,5
ffffffffc02015ea:	854e                	mv	a0,s3
ffffffffc02015ec:	01742823          	sw	s7,16(s0)
ffffffffc02015f0:	01643023          	sd	s6,0(s0)
ffffffffc02015f4:	01543423          	sd	s5,8(s0)
ffffffffc02015f8:	43f000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc02015fc:	641c                	ld	a5,8(s0)
ffffffffc02015fe:	00878963          	beq	a5,s0,ffffffffc0201610 <default_check+0x2ba>
ffffffffc0201602:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201606:	679c                	ld	a5,8(a5)
ffffffffc0201608:	397d                	addiw	s2,s2,-1
ffffffffc020160a:	9c99                	subw	s1,s1,a4
ffffffffc020160c:	fe879be3          	bne	a5,s0,ffffffffc0201602 <default_check+0x2ac>
ffffffffc0201610:	26091463          	bnez	s2,ffffffffc0201878 <default_check+0x522>
ffffffffc0201614:	46049263          	bnez	s1,ffffffffc0201a78 <default_check+0x722>
ffffffffc0201618:	60a6                	ld	ra,72(sp)
ffffffffc020161a:	6406                	ld	s0,64(sp)
ffffffffc020161c:	74e2                	ld	s1,56(sp)
ffffffffc020161e:	7942                	ld	s2,48(sp)
ffffffffc0201620:	79a2                	ld	s3,40(sp)
ffffffffc0201622:	7a02                	ld	s4,32(sp)
ffffffffc0201624:	6ae2                	ld	s5,24(sp)
ffffffffc0201626:	6b42                	ld	s6,16(sp)
ffffffffc0201628:	6ba2                	ld	s7,8(sp)
ffffffffc020162a:	6c02                	ld	s8,0(sp)
ffffffffc020162c:	6161                	addi	sp,sp,80
ffffffffc020162e:	8082                	ret
ffffffffc0201630:	4981                	li	s3,0
ffffffffc0201632:	4481                	li	s1,0
ffffffffc0201634:	4901                	li	s2,0
ffffffffc0201636:	b38d                	j	ffffffffc0201398 <default_check+0x42>
ffffffffc0201638:	0000b697          	auipc	a3,0xb
ffffffffc020163c:	11868693          	addi	a3,a3,280 # ffffffffc020c750 <commands+0x950>
ffffffffc0201640:	0000b617          	auipc	a2,0xb
ffffffffc0201644:	9d060613          	addi	a2,a2,-1584 # ffffffffc020c010 <commands+0x210>
ffffffffc0201648:	0ef00593          	li	a1,239
ffffffffc020164c:	0000b517          	auipc	a0,0xb
ffffffffc0201650:	11450513          	addi	a0,a0,276 # ffffffffc020c760 <commands+0x960>
ffffffffc0201654:	e4bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201658:	0000b697          	auipc	a3,0xb
ffffffffc020165c:	1a068693          	addi	a3,a3,416 # ffffffffc020c7f8 <commands+0x9f8>
ffffffffc0201660:	0000b617          	auipc	a2,0xb
ffffffffc0201664:	9b060613          	addi	a2,a2,-1616 # ffffffffc020c010 <commands+0x210>
ffffffffc0201668:	0bc00593          	li	a1,188
ffffffffc020166c:	0000b517          	auipc	a0,0xb
ffffffffc0201670:	0f450513          	addi	a0,a0,244 # ffffffffc020c760 <commands+0x960>
ffffffffc0201674:	e2bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201678:	0000b697          	auipc	a3,0xb
ffffffffc020167c:	1a868693          	addi	a3,a3,424 # ffffffffc020c820 <commands+0xa20>
ffffffffc0201680:	0000b617          	auipc	a2,0xb
ffffffffc0201684:	99060613          	addi	a2,a2,-1648 # ffffffffc020c010 <commands+0x210>
ffffffffc0201688:	0bd00593          	li	a1,189
ffffffffc020168c:	0000b517          	auipc	a0,0xb
ffffffffc0201690:	0d450513          	addi	a0,a0,212 # ffffffffc020c760 <commands+0x960>
ffffffffc0201694:	e0bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201698:	0000b697          	auipc	a3,0xb
ffffffffc020169c:	1c868693          	addi	a3,a3,456 # ffffffffc020c860 <commands+0xa60>
ffffffffc02016a0:	0000b617          	auipc	a2,0xb
ffffffffc02016a4:	97060613          	addi	a2,a2,-1680 # ffffffffc020c010 <commands+0x210>
ffffffffc02016a8:	0bf00593          	li	a1,191
ffffffffc02016ac:	0000b517          	auipc	a0,0xb
ffffffffc02016b0:	0b450513          	addi	a0,a0,180 # ffffffffc020c760 <commands+0x960>
ffffffffc02016b4:	debfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016b8:	0000b697          	auipc	a3,0xb
ffffffffc02016bc:	23068693          	addi	a3,a3,560 # ffffffffc020c8e8 <commands+0xae8>
ffffffffc02016c0:	0000b617          	auipc	a2,0xb
ffffffffc02016c4:	95060613          	addi	a2,a2,-1712 # ffffffffc020c010 <commands+0x210>
ffffffffc02016c8:	0d800593          	li	a1,216
ffffffffc02016cc:	0000b517          	auipc	a0,0xb
ffffffffc02016d0:	09450513          	addi	a0,a0,148 # ffffffffc020c760 <commands+0x960>
ffffffffc02016d4:	dcbfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016d8:	0000b697          	auipc	a3,0xb
ffffffffc02016dc:	0c068693          	addi	a3,a3,192 # ffffffffc020c798 <commands+0x998>
ffffffffc02016e0:	0000b617          	auipc	a2,0xb
ffffffffc02016e4:	93060613          	addi	a2,a2,-1744 # ffffffffc020c010 <commands+0x210>
ffffffffc02016e8:	0d100593          	li	a1,209
ffffffffc02016ec:	0000b517          	auipc	a0,0xb
ffffffffc02016f0:	07450513          	addi	a0,a0,116 # ffffffffc020c760 <commands+0x960>
ffffffffc02016f4:	dabfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016f8:	0000b697          	auipc	a3,0xb
ffffffffc02016fc:	1e068693          	addi	a3,a3,480 # ffffffffc020c8d8 <commands+0xad8>
ffffffffc0201700:	0000b617          	auipc	a2,0xb
ffffffffc0201704:	91060613          	addi	a2,a2,-1776 # ffffffffc020c010 <commands+0x210>
ffffffffc0201708:	0cf00593          	li	a1,207
ffffffffc020170c:	0000b517          	auipc	a0,0xb
ffffffffc0201710:	05450513          	addi	a0,a0,84 # ffffffffc020c760 <commands+0x960>
ffffffffc0201714:	d8bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201718:	0000b697          	auipc	a3,0xb
ffffffffc020171c:	1a868693          	addi	a3,a3,424 # ffffffffc020c8c0 <commands+0xac0>
ffffffffc0201720:	0000b617          	auipc	a2,0xb
ffffffffc0201724:	8f060613          	addi	a2,a2,-1808 # ffffffffc020c010 <commands+0x210>
ffffffffc0201728:	0ca00593          	li	a1,202
ffffffffc020172c:	0000b517          	auipc	a0,0xb
ffffffffc0201730:	03450513          	addi	a0,a0,52 # ffffffffc020c760 <commands+0x960>
ffffffffc0201734:	d6bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201738:	0000b697          	auipc	a3,0xb
ffffffffc020173c:	16868693          	addi	a3,a3,360 # ffffffffc020c8a0 <commands+0xaa0>
ffffffffc0201740:	0000b617          	auipc	a2,0xb
ffffffffc0201744:	8d060613          	addi	a2,a2,-1840 # ffffffffc020c010 <commands+0x210>
ffffffffc0201748:	0c100593          	li	a1,193
ffffffffc020174c:	0000b517          	auipc	a0,0xb
ffffffffc0201750:	01450513          	addi	a0,a0,20 # ffffffffc020c760 <commands+0x960>
ffffffffc0201754:	d4bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201758:	0000b697          	auipc	a3,0xb
ffffffffc020175c:	1d868693          	addi	a3,a3,472 # ffffffffc020c930 <commands+0xb30>
ffffffffc0201760:	0000b617          	auipc	a2,0xb
ffffffffc0201764:	8b060613          	addi	a2,a2,-1872 # ffffffffc020c010 <commands+0x210>
ffffffffc0201768:	0f700593          	li	a1,247
ffffffffc020176c:	0000b517          	auipc	a0,0xb
ffffffffc0201770:	ff450513          	addi	a0,a0,-12 # ffffffffc020c760 <commands+0x960>
ffffffffc0201774:	d2bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201778:	0000b697          	auipc	a3,0xb
ffffffffc020177c:	1a868693          	addi	a3,a3,424 # ffffffffc020c920 <commands+0xb20>
ffffffffc0201780:	0000b617          	auipc	a2,0xb
ffffffffc0201784:	89060613          	addi	a2,a2,-1904 # ffffffffc020c010 <commands+0x210>
ffffffffc0201788:	0de00593          	li	a1,222
ffffffffc020178c:	0000b517          	auipc	a0,0xb
ffffffffc0201790:	fd450513          	addi	a0,a0,-44 # ffffffffc020c760 <commands+0x960>
ffffffffc0201794:	d0bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201798:	0000b697          	auipc	a3,0xb
ffffffffc020179c:	12868693          	addi	a3,a3,296 # ffffffffc020c8c0 <commands+0xac0>
ffffffffc02017a0:	0000b617          	auipc	a2,0xb
ffffffffc02017a4:	87060613          	addi	a2,a2,-1936 # ffffffffc020c010 <commands+0x210>
ffffffffc02017a8:	0dc00593          	li	a1,220
ffffffffc02017ac:	0000b517          	auipc	a0,0xb
ffffffffc02017b0:	fb450513          	addi	a0,a0,-76 # ffffffffc020c760 <commands+0x960>
ffffffffc02017b4:	cebfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017b8:	0000b697          	auipc	a3,0xb
ffffffffc02017bc:	14868693          	addi	a3,a3,328 # ffffffffc020c900 <commands+0xb00>
ffffffffc02017c0:	0000b617          	auipc	a2,0xb
ffffffffc02017c4:	85060613          	addi	a2,a2,-1968 # ffffffffc020c010 <commands+0x210>
ffffffffc02017c8:	0db00593          	li	a1,219
ffffffffc02017cc:	0000b517          	auipc	a0,0xb
ffffffffc02017d0:	f9450513          	addi	a0,a0,-108 # ffffffffc020c760 <commands+0x960>
ffffffffc02017d4:	ccbfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017d8:	0000b697          	auipc	a3,0xb
ffffffffc02017dc:	fc068693          	addi	a3,a3,-64 # ffffffffc020c798 <commands+0x998>
ffffffffc02017e0:	0000b617          	auipc	a2,0xb
ffffffffc02017e4:	83060613          	addi	a2,a2,-2000 # ffffffffc020c010 <commands+0x210>
ffffffffc02017e8:	0b800593          	li	a1,184
ffffffffc02017ec:	0000b517          	auipc	a0,0xb
ffffffffc02017f0:	f7450513          	addi	a0,a0,-140 # ffffffffc020c760 <commands+0x960>
ffffffffc02017f4:	cabfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017f8:	0000b697          	auipc	a3,0xb
ffffffffc02017fc:	0c868693          	addi	a3,a3,200 # ffffffffc020c8c0 <commands+0xac0>
ffffffffc0201800:	0000b617          	auipc	a2,0xb
ffffffffc0201804:	81060613          	addi	a2,a2,-2032 # ffffffffc020c010 <commands+0x210>
ffffffffc0201808:	0d500593          	li	a1,213
ffffffffc020180c:	0000b517          	auipc	a0,0xb
ffffffffc0201810:	f5450513          	addi	a0,a0,-172 # ffffffffc020c760 <commands+0x960>
ffffffffc0201814:	c8bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201818:	0000b697          	auipc	a3,0xb
ffffffffc020181c:	fc068693          	addi	a3,a3,-64 # ffffffffc020c7d8 <commands+0x9d8>
ffffffffc0201820:	0000a617          	auipc	a2,0xa
ffffffffc0201824:	7f060613          	addi	a2,a2,2032 # ffffffffc020c010 <commands+0x210>
ffffffffc0201828:	0d300593          	li	a1,211
ffffffffc020182c:	0000b517          	auipc	a0,0xb
ffffffffc0201830:	f3450513          	addi	a0,a0,-204 # ffffffffc020c760 <commands+0x960>
ffffffffc0201834:	c6bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201838:	0000b697          	auipc	a3,0xb
ffffffffc020183c:	f8068693          	addi	a3,a3,-128 # ffffffffc020c7b8 <commands+0x9b8>
ffffffffc0201840:	0000a617          	auipc	a2,0xa
ffffffffc0201844:	7d060613          	addi	a2,a2,2000 # ffffffffc020c010 <commands+0x210>
ffffffffc0201848:	0d200593          	li	a1,210
ffffffffc020184c:	0000b517          	auipc	a0,0xb
ffffffffc0201850:	f1450513          	addi	a0,a0,-236 # ffffffffc020c760 <commands+0x960>
ffffffffc0201854:	c4bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201858:	0000b697          	auipc	a3,0xb
ffffffffc020185c:	f8068693          	addi	a3,a3,-128 # ffffffffc020c7d8 <commands+0x9d8>
ffffffffc0201860:	0000a617          	auipc	a2,0xa
ffffffffc0201864:	7b060613          	addi	a2,a2,1968 # ffffffffc020c010 <commands+0x210>
ffffffffc0201868:	0ba00593          	li	a1,186
ffffffffc020186c:	0000b517          	auipc	a0,0xb
ffffffffc0201870:	ef450513          	addi	a0,a0,-268 # ffffffffc020c760 <commands+0x960>
ffffffffc0201874:	c2bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201878:	0000b697          	auipc	a3,0xb
ffffffffc020187c:	20868693          	addi	a3,a3,520 # ffffffffc020ca80 <commands+0xc80>
ffffffffc0201880:	0000a617          	auipc	a2,0xa
ffffffffc0201884:	79060613          	addi	a2,a2,1936 # ffffffffc020c010 <commands+0x210>
ffffffffc0201888:	12400593          	li	a1,292
ffffffffc020188c:	0000b517          	auipc	a0,0xb
ffffffffc0201890:	ed450513          	addi	a0,a0,-300 # ffffffffc020c760 <commands+0x960>
ffffffffc0201894:	c0bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201898:	0000b697          	auipc	a3,0xb
ffffffffc020189c:	08868693          	addi	a3,a3,136 # ffffffffc020c920 <commands+0xb20>
ffffffffc02018a0:	0000a617          	auipc	a2,0xa
ffffffffc02018a4:	77060613          	addi	a2,a2,1904 # ffffffffc020c010 <commands+0x210>
ffffffffc02018a8:	11900593          	li	a1,281
ffffffffc02018ac:	0000b517          	auipc	a0,0xb
ffffffffc02018b0:	eb450513          	addi	a0,a0,-332 # ffffffffc020c760 <commands+0x960>
ffffffffc02018b4:	bebfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018b8:	0000b697          	auipc	a3,0xb
ffffffffc02018bc:	00868693          	addi	a3,a3,8 # ffffffffc020c8c0 <commands+0xac0>
ffffffffc02018c0:	0000a617          	auipc	a2,0xa
ffffffffc02018c4:	75060613          	addi	a2,a2,1872 # ffffffffc020c010 <commands+0x210>
ffffffffc02018c8:	11700593          	li	a1,279
ffffffffc02018cc:	0000b517          	auipc	a0,0xb
ffffffffc02018d0:	e9450513          	addi	a0,a0,-364 # ffffffffc020c760 <commands+0x960>
ffffffffc02018d4:	bcbfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018d8:	0000b697          	auipc	a3,0xb
ffffffffc02018dc:	fa868693          	addi	a3,a3,-88 # ffffffffc020c880 <commands+0xa80>
ffffffffc02018e0:	0000a617          	auipc	a2,0xa
ffffffffc02018e4:	73060613          	addi	a2,a2,1840 # ffffffffc020c010 <commands+0x210>
ffffffffc02018e8:	0c000593          	li	a1,192
ffffffffc02018ec:	0000b517          	auipc	a0,0xb
ffffffffc02018f0:	e7450513          	addi	a0,a0,-396 # ffffffffc020c760 <commands+0x960>
ffffffffc02018f4:	babfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018f8:	0000b697          	auipc	a3,0xb
ffffffffc02018fc:	14868693          	addi	a3,a3,328 # ffffffffc020ca40 <commands+0xc40>
ffffffffc0201900:	0000a617          	auipc	a2,0xa
ffffffffc0201904:	71060613          	addi	a2,a2,1808 # ffffffffc020c010 <commands+0x210>
ffffffffc0201908:	11100593          	li	a1,273
ffffffffc020190c:	0000b517          	auipc	a0,0xb
ffffffffc0201910:	e5450513          	addi	a0,a0,-428 # ffffffffc020c760 <commands+0x960>
ffffffffc0201914:	b8bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201918:	0000b697          	auipc	a3,0xb
ffffffffc020191c:	10868693          	addi	a3,a3,264 # ffffffffc020ca20 <commands+0xc20>
ffffffffc0201920:	0000a617          	auipc	a2,0xa
ffffffffc0201924:	6f060613          	addi	a2,a2,1776 # ffffffffc020c010 <commands+0x210>
ffffffffc0201928:	10f00593          	li	a1,271
ffffffffc020192c:	0000b517          	auipc	a0,0xb
ffffffffc0201930:	e3450513          	addi	a0,a0,-460 # ffffffffc020c760 <commands+0x960>
ffffffffc0201934:	b6bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201938:	0000b697          	auipc	a3,0xb
ffffffffc020193c:	0c068693          	addi	a3,a3,192 # ffffffffc020c9f8 <commands+0xbf8>
ffffffffc0201940:	0000a617          	auipc	a2,0xa
ffffffffc0201944:	6d060613          	addi	a2,a2,1744 # ffffffffc020c010 <commands+0x210>
ffffffffc0201948:	10d00593          	li	a1,269
ffffffffc020194c:	0000b517          	auipc	a0,0xb
ffffffffc0201950:	e1450513          	addi	a0,a0,-492 # ffffffffc020c760 <commands+0x960>
ffffffffc0201954:	b4bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201958:	0000b697          	auipc	a3,0xb
ffffffffc020195c:	07868693          	addi	a3,a3,120 # ffffffffc020c9d0 <commands+0xbd0>
ffffffffc0201960:	0000a617          	auipc	a2,0xa
ffffffffc0201964:	6b060613          	addi	a2,a2,1712 # ffffffffc020c010 <commands+0x210>
ffffffffc0201968:	10c00593          	li	a1,268
ffffffffc020196c:	0000b517          	auipc	a0,0xb
ffffffffc0201970:	df450513          	addi	a0,a0,-524 # ffffffffc020c760 <commands+0x960>
ffffffffc0201974:	b2bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201978:	0000b697          	auipc	a3,0xb
ffffffffc020197c:	04868693          	addi	a3,a3,72 # ffffffffc020c9c0 <commands+0xbc0>
ffffffffc0201980:	0000a617          	auipc	a2,0xa
ffffffffc0201984:	69060613          	addi	a2,a2,1680 # ffffffffc020c010 <commands+0x210>
ffffffffc0201988:	10700593          	li	a1,263
ffffffffc020198c:	0000b517          	auipc	a0,0xb
ffffffffc0201990:	dd450513          	addi	a0,a0,-556 # ffffffffc020c760 <commands+0x960>
ffffffffc0201994:	b0bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201998:	0000b697          	auipc	a3,0xb
ffffffffc020199c:	f2868693          	addi	a3,a3,-216 # ffffffffc020c8c0 <commands+0xac0>
ffffffffc02019a0:	0000a617          	auipc	a2,0xa
ffffffffc02019a4:	67060613          	addi	a2,a2,1648 # ffffffffc020c010 <commands+0x210>
ffffffffc02019a8:	10600593          	li	a1,262
ffffffffc02019ac:	0000b517          	auipc	a0,0xb
ffffffffc02019b0:	db450513          	addi	a0,a0,-588 # ffffffffc020c760 <commands+0x960>
ffffffffc02019b4:	aebfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019b8:	0000b697          	auipc	a3,0xb
ffffffffc02019bc:	fe868693          	addi	a3,a3,-24 # ffffffffc020c9a0 <commands+0xba0>
ffffffffc02019c0:	0000a617          	auipc	a2,0xa
ffffffffc02019c4:	65060613          	addi	a2,a2,1616 # ffffffffc020c010 <commands+0x210>
ffffffffc02019c8:	10500593          	li	a1,261
ffffffffc02019cc:	0000b517          	auipc	a0,0xb
ffffffffc02019d0:	d9450513          	addi	a0,a0,-620 # ffffffffc020c760 <commands+0x960>
ffffffffc02019d4:	acbfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019d8:	0000b697          	auipc	a3,0xb
ffffffffc02019dc:	f9868693          	addi	a3,a3,-104 # ffffffffc020c970 <commands+0xb70>
ffffffffc02019e0:	0000a617          	auipc	a2,0xa
ffffffffc02019e4:	63060613          	addi	a2,a2,1584 # ffffffffc020c010 <commands+0x210>
ffffffffc02019e8:	10400593          	li	a1,260
ffffffffc02019ec:	0000b517          	auipc	a0,0xb
ffffffffc02019f0:	d7450513          	addi	a0,a0,-652 # ffffffffc020c760 <commands+0x960>
ffffffffc02019f4:	aabfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019f8:	0000b697          	auipc	a3,0xb
ffffffffc02019fc:	f6068693          	addi	a3,a3,-160 # ffffffffc020c958 <commands+0xb58>
ffffffffc0201a00:	0000a617          	auipc	a2,0xa
ffffffffc0201a04:	61060613          	addi	a2,a2,1552 # ffffffffc020c010 <commands+0x210>
ffffffffc0201a08:	10300593          	li	a1,259
ffffffffc0201a0c:	0000b517          	auipc	a0,0xb
ffffffffc0201a10:	d5450513          	addi	a0,a0,-684 # ffffffffc020c760 <commands+0x960>
ffffffffc0201a14:	a8bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a18:	0000b697          	auipc	a3,0xb
ffffffffc0201a1c:	ea868693          	addi	a3,a3,-344 # ffffffffc020c8c0 <commands+0xac0>
ffffffffc0201a20:	0000a617          	auipc	a2,0xa
ffffffffc0201a24:	5f060613          	addi	a2,a2,1520 # ffffffffc020c010 <commands+0x210>
ffffffffc0201a28:	0fd00593          	li	a1,253
ffffffffc0201a2c:	0000b517          	auipc	a0,0xb
ffffffffc0201a30:	d3450513          	addi	a0,a0,-716 # ffffffffc020c760 <commands+0x960>
ffffffffc0201a34:	a6bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a38:	0000b697          	auipc	a3,0xb
ffffffffc0201a3c:	f0868693          	addi	a3,a3,-248 # ffffffffc020c940 <commands+0xb40>
ffffffffc0201a40:	0000a617          	auipc	a2,0xa
ffffffffc0201a44:	5d060613          	addi	a2,a2,1488 # ffffffffc020c010 <commands+0x210>
ffffffffc0201a48:	0f800593          	li	a1,248
ffffffffc0201a4c:	0000b517          	auipc	a0,0xb
ffffffffc0201a50:	d1450513          	addi	a0,a0,-748 # ffffffffc020c760 <commands+0x960>
ffffffffc0201a54:	a4bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a58:	0000b697          	auipc	a3,0xb
ffffffffc0201a5c:	00868693          	addi	a3,a3,8 # ffffffffc020ca60 <commands+0xc60>
ffffffffc0201a60:	0000a617          	auipc	a2,0xa
ffffffffc0201a64:	5b060613          	addi	a2,a2,1456 # ffffffffc020c010 <commands+0x210>
ffffffffc0201a68:	11600593          	li	a1,278
ffffffffc0201a6c:	0000b517          	auipc	a0,0xb
ffffffffc0201a70:	cf450513          	addi	a0,a0,-780 # ffffffffc020c760 <commands+0x960>
ffffffffc0201a74:	a2bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a78:	0000b697          	auipc	a3,0xb
ffffffffc0201a7c:	01868693          	addi	a3,a3,24 # ffffffffc020ca90 <commands+0xc90>
ffffffffc0201a80:	0000a617          	auipc	a2,0xa
ffffffffc0201a84:	59060613          	addi	a2,a2,1424 # ffffffffc020c010 <commands+0x210>
ffffffffc0201a88:	12500593          	li	a1,293
ffffffffc0201a8c:	0000b517          	auipc	a0,0xb
ffffffffc0201a90:	cd450513          	addi	a0,a0,-812 # ffffffffc020c760 <commands+0x960>
ffffffffc0201a94:	a0bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a98:	0000b697          	auipc	a3,0xb
ffffffffc0201a9c:	ce068693          	addi	a3,a3,-800 # ffffffffc020c778 <commands+0x978>
ffffffffc0201aa0:	0000a617          	auipc	a2,0xa
ffffffffc0201aa4:	57060613          	addi	a2,a2,1392 # ffffffffc020c010 <commands+0x210>
ffffffffc0201aa8:	0f200593          	li	a1,242
ffffffffc0201aac:	0000b517          	auipc	a0,0xb
ffffffffc0201ab0:	cb450513          	addi	a0,a0,-844 # ffffffffc020c760 <commands+0x960>
ffffffffc0201ab4:	9ebfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201ab8:	0000b697          	auipc	a3,0xb
ffffffffc0201abc:	d0068693          	addi	a3,a3,-768 # ffffffffc020c7b8 <commands+0x9b8>
ffffffffc0201ac0:	0000a617          	auipc	a2,0xa
ffffffffc0201ac4:	55060613          	addi	a2,a2,1360 # ffffffffc020c010 <commands+0x210>
ffffffffc0201ac8:	0b900593          	li	a1,185
ffffffffc0201acc:	0000b517          	auipc	a0,0xb
ffffffffc0201ad0:	c9450513          	addi	a0,a0,-876 # ffffffffc020c760 <commands+0x960>
ffffffffc0201ad4:	9cbfe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201ad8 <default_free_pages>:
ffffffffc0201ad8:	1141                	addi	sp,sp,-16
ffffffffc0201ada:	e406                	sd	ra,8(sp)
ffffffffc0201adc:	14058463          	beqz	a1,ffffffffc0201c24 <default_free_pages+0x14c>
ffffffffc0201ae0:	00659693          	slli	a3,a1,0x6
ffffffffc0201ae4:	96aa                	add	a3,a3,a0
ffffffffc0201ae6:	87aa                	mv	a5,a0
ffffffffc0201ae8:	02d50263          	beq	a0,a3,ffffffffc0201b0c <default_free_pages+0x34>
ffffffffc0201aec:	6798                	ld	a4,8(a5)
ffffffffc0201aee:	8b05                	andi	a4,a4,1
ffffffffc0201af0:	10071a63          	bnez	a4,ffffffffc0201c04 <default_free_pages+0x12c>
ffffffffc0201af4:	6798                	ld	a4,8(a5)
ffffffffc0201af6:	8b09                	andi	a4,a4,2
ffffffffc0201af8:	10071663          	bnez	a4,ffffffffc0201c04 <default_free_pages+0x12c>
ffffffffc0201afc:	0007b423          	sd	zero,8(a5)
ffffffffc0201b00:	0007a023          	sw	zero,0(a5)
ffffffffc0201b04:	04078793          	addi	a5,a5,64
ffffffffc0201b08:	fed792e3          	bne	a5,a3,ffffffffc0201aec <default_free_pages+0x14>
ffffffffc0201b0c:	2581                	sext.w	a1,a1
ffffffffc0201b0e:	c90c                	sw	a1,16(a0)
ffffffffc0201b10:	00850893          	addi	a7,a0,8
ffffffffc0201b14:	4789                	li	a5,2
ffffffffc0201b16:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201b1a:	00090697          	auipc	a3,0x90
ffffffffc0201b1e:	cbe68693          	addi	a3,a3,-834 # ffffffffc02917d8 <free_area>
ffffffffc0201b22:	4a98                	lw	a4,16(a3)
ffffffffc0201b24:	669c                	ld	a5,8(a3)
ffffffffc0201b26:	01850613          	addi	a2,a0,24
ffffffffc0201b2a:	9db9                	addw	a1,a1,a4
ffffffffc0201b2c:	ca8c                	sw	a1,16(a3)
ffffffffc0201b2e:	0ad78463          	beq	a5,a3,ffffffffc0201bd6 <default_free_pages+0xfe>
ffffffffc0201b32:	fe878713          	addi	a4,a5,-24
ffffffffc0201b36:	0006b803          	ld	a6,0(a3)
ffffffffc0201b3a:	4581                	li	a1,0
ffffffffc0201b3c:	00e56a63          	bltu	a0,a4,ffffffffc0201b50 <default_free_pages+0x78>
ffffffffc0201b40:	6798                	ld	a4,8(a5)
ffffffffc0201b42:	04d70c63          	beq	a4,a3,ffffffffc0201b9a <default_free_pages+0xc2>
ffffffffc0201b46:	87ba                	mv	a5,a4
ffffffffc0201b48:	fe878713          	addi	a4,a5,-24
ffffffffc0201b4c:	fee57ae3          	bgeu	a0,a4,ffffffffc0201b40 <default_free_pages+0x68>
ffffffffc0201b50:	c199                	beqz	a1,ffffffffc0201b56 <default_free_pages+0x7e>
ffffffffc0201b52:	0106b023          	sd	a6,0(a3)
ffffffffc0201b56:	6398                	ld	a4,0(a5)
ffffffffc0201b58:	e390                	sd	a2,0(a5)
ffffffffc0201b5a:	e710                	sd	a2,8(a4)
ffffffffc0201b5c:	f11c                	sd	a5,32(a0)
ffffffffc0201b5e:	ed18                	sd	a4,24(a0)
ffffffffc0201b60:	00d70d63          	beq	a4,a3,ffffffffc0201b7a <default_free_pages+0xa2>
ffffffffc0201b64:	ff872583          	lw	a1,-8(a4)
ffffffffc0201b68:	fe870613          	addi	a2,a4,-24
ffffffffc0201b6c:	02059813          	slli	a6,a1,0x20
ffffffffc0201b70:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201b74:	97b2                	add	a5,a5,a2
ffffffffc0201b76:	02f50c63          	beq	a0,a5,ffffffffc0201bae <default_free_pages+0xd6>
ffffffffc0201b7a:	711c                	ld	a5,32(a0)
ffffffffc0201b7c:	00d78c63          	beq	a5,a3,ffffffffc0201b94 <default_free_pages+0xbc>
ffffffffc0201b80:	4910                	lw	a2,16(a0)
ffffffffc0201b82:	fe878693          	addi	a3,a5,-24
ffffffffc0201b86:	02061593          	slli	a1,a2,0x20
ffffffffc0201b8a:	01a5d713          	srli	a4,a1,0x1a
ffffffffc0201b8e:	972a                	add	a4,a4,a0
ffffffffc0201b90:	04e68a63          	beq	a3,a4,ffffffffc0201be4 <default_free_pages+0x10c>
ffffffffc0201b94:	60a2                	ld	ra,8(sp)
ffffffffc0201b96:	0141                	addi	sp,sp,16
ffffffffc0201b98:	8082                	ret
ffffffffc0201b9a:	e790                	sd	a2,8(a5)
ffffffffc0201b9c:	f114                	sd	a3,32(a0)
ffffffffc0201b9e:	6798                	ld	a4,8(a5)
ffffffffc0201ba0:	ed1c                	sd	a5,24(a0)
ffffffffc0201ba2:	02d70763          	beq	a4,a3,ffffffffc0201bd0 <default_free_pages+0xf8>
ffffffffc0201ba6:	8832                	mv	a6,a2
ffffffffc0201ba8:	4585                	li	a1,1
ffffffffc0201baa:	87ba                	mv	a5,a4
ffffffffc0201bac:	bf71                	j	ffffffffc0201b48 <default_free_pages+0x70>
ffffffffc0201bae:	491c                	lw	a5,16(a0)
ffffffffc0201bb0:	9dbd                	addw	a1,a1,a5
ffffffffc0201bb2:	feb72c23          	sw	a1,-8(a4)
ffffffffc0201bb6:	57f5                	li	a5,-3
ffffffffc0201bb8:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201bbc:	01853803          	ld	a6,24(a0)
ffffffffc0201bc0:	710c                	ld	a1,32(a0)
ffffffffc0201bc2:	8532                	mv	a0,a2
ffffffffc0201bc4:	00b83423          	sd	a1,8(a6)
ffffffffc0201bc8:	671c                	ld	a5,8(a4)
ffffffffc0201bca:	0105b023          	sd	a6,0(a1)
ffffffffc0201bce:	b77d                	j	ffffffffc0201b7c <default_free_pages+0xa4>
ffffffffc0201bd0:	e290                	sd	a2,0(a3)
ffffffffc0201bd2:	873e                	mv	a4,a5
ffffffffc0201bd4:	bf41                	j	ffffffffc0201b64 <default_free_pages+0x8c>
ffffffffc0201bd6:	60a2                	ld	ra,8(sp)
ffffffffc0201bd8:	e390                	sd	a2,0(a5)
ffffffffc0201bda:	e790                	sd	a2,8(a5)
ffffffffc0201bdc:	f11c                	sd	a5,32(a0)
ffffffffc0201bde:	ed1c                	sd	a5,24(a0)
ffffffffc0201be0:	0141                	addi	sp,sp,16
ffffffffc0201be2:	8082                	ret
ffffffffc0201be4:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201be8:	ff078693          	addi	a3,a5,-16
ffffffffc0201bec:	9e39                	addw	a2,a2,a4
ffffffffc0201bee:	c910                	sw	a2,16(a0)
ffffffffc0201bf0:	5775                	li	a4,-3
ffffffffc0201bf2:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc0201bf6:	6398                	ld	a4,0(a5)
ffffffffc0201bf8:	679c                	ld	a5,8(a5)
ffffffffc0201bfa:	60a2                	ld	ra,8(sp)
ffffffffc0201bfc:	e71c                	sd	a5,8(a4)
ffffffffc0201bfe:	e398                	sd	a4,0(a5)
ffffffffc0201c00:	0141                	addi	sp,sp,16
ffffffffc0201c02:	8082                	ret
ffffffffc0201c04:	0000b697          	auipc	a3,0xb
ffffffffc0201c08:	ea468693          	addi	a3,a3,-348 # ffffffffc020caa8 <commands+0xca8>
ffffffffc0201c0c:	0000a617          	auipc	a2,0xa
ffffffffc0201c10:	40460613          	addi	a2,a2,1028 # ffffffffc020c010 <commands+0x210>
ffffffffc0201c14:	08200593          	li	a1,130
ffffffffc0201c18:	0000b517          	auipc	a0,0xb
ffffffffc0201c1c:	b4850513          	addi	a0,a0,-1208 # ffffffffc020c760 <commands+0x960>
ffffffffc0201c20:	87ffe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201c24:	0000b697          	auipc	a3,0xb
ffffffffc0201c28:	e7c68693          	addi	a3,a3,-388 # ffffffffc020caa0 <commands+0xca0>
ffffffffc0201c2c:	0000a617          	auipc	a2,0xa
ffffffffc0201c30:	3e460613          	addi	a2,a2,996 # ffffffffc020c010 <commands+0x210>
ffffffffc0201c34:	07f00593          	li	a1,127
ffffffffc0201c38:	0000b517          	auipc	a0,0xb
ffffffffc0201c3c:	b2850513          	addi	a0,a0,-1240 # ffffffffc020c760 <commands+0x960>
ffffffffc0201c40:	85ffe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201c44 <default_alloc_pages>:
ffffffffc0201c44:	c941                	beqz	a0,ffffffffc0201cd4 <default_alloc_pages+0x90>
ffffffffc0201c46:	00090597          	auipc	a1,0x90
ffffffffc0201c4a:	b9258593          	addi	a1,a1,-1134 # ffffffffc02917d8 <free_area>
ffffffffc0201c4e:	0105a803          	lw	a6,16(a1)
ffffffffc0201c52:	872a                	mv	a4,a0
ffffffffc0201c54:	02081793          	slli	a5,a6,0x20
ffffffffc0201c58:	9381                	srli	a5,a5,0x20
ffffffffc0201c5a:	00a7ee63          	bltu	a5,a0,ffffffffc0201c76 <default_alloc_pages+0x32>
ffffffffc0201c5e:	87ae                	mv	a5,a1
ffffffffc0201c60:	a801                	j	ffffffffc0201c70 <default_alloc_pages+0x2c>
ffffffffc0201c62:	ff87a683          	lw	a3,-8(a5)
ffffffffc0201c66:	02069613          	slli	a2,a3,0x20
ffffffffc0201c6a:	9201                	srli	a2,a2,0x20
ffffffffc0201c6c:	00e67763          	bgeu	a2,a4,ffffffffc0201c7a <default_alloc_pages+0x36>
ffffffffc0201c70:	679c                	ld	a5,8(a5)
ffffffffc0201c72:	feb798e3          	bne	a5,a1,ffffffffc0201c62 <default_alloc_pages+0x1e>
ffffffffc0201c76:	4501                	li	a0,0
ffffffffc0201c78:	8082                	ret
ffffffffc0201c7a:	0007b883          	ld	a7,0(a5)
ffffffffc0201c7e:	0087b303          	ld	t1,8(a5)
ffffffffc0201c82:	fe878513          	addi	a0,a5,-24
ffffffffc0201c86:	00070e1b          	sext.w	t3,a4
ffffffffc0201c8a:	0068b423          	sd	t1,8(a7) # 10000008 <_binary_bin_sfs_img_size+0xff8ad08>
ffffffffc0201c8e:	01133023          	sd	a7,0(t1)
ffffffffc0201c92:	02c77863          	bgeu	a4,a2,ffffffffc0201cc2 <default_alloc_pages+0x7e>
ffffffffc0201c96:	071a                	slli	a4,a4,0x6
ffffffffc0201c98:	972a                	add	a4,a4,a0
ffffffffc0201c9a:	41c686bb          	subw	a3,a3,t3
ffffffffc0201c9e:	cb14                	sw	a3,16(a4)
ffffffffc0201ca0:	00870613          	addi	a2,a4,8
ffffffffc0201ca4:	4689                	li	a3,2
ffffffffc0201ca6:	40d6302f          	amoor.d	zero,a3,(a2)
ffffffffc0201caa:	0088b683          	ld	a3,8(a7)
ffffffffc0201cae:	01870613          	addi	a2,a4,24
ffffffffc0201cb2:	0105a803          	lw	a6,16(a1)
ffffffffc0201cb6:	e290                	sd	a2,0(a3)
ffffffffc0201cb8:	00c8b423          	sd	a2,8(a7)
ffffffffc0201cbc:	f314                	sd	a3,32(a4)
ffffffffc0201cbe:	01173c23          	sd	a7,24(a4)
ffffffffc0201cc2:	41c8083b          	subw	a6,a6,t3
ffffffffc0201cc6:	0105a823          	sw	a6,16(a1)
ffffffffc0201cca:	5775                	li	a4,-3
ffffffffc0201ccc:	17c1                	addi	a5,a5,-16
ffffffffc0201cce:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0201cd2:	8082                	ret
ffffffffc0201cd4:	1141                	addi	sp,sp,-16
ffffffffc0201cd6:	0000b697          	auipc	a3,0xb
ffffffffc0201cda:	dca68693          	addi	a3,a3,-566 # ffffffffc020caa0 <commands+0xca0>
ffffffffc0201cde:	0000a617          	auipc	a2,0xa
ffffffffc0201ce2:	33260613          	addi	a2,a2,818 # ffffffffc020c010 <commands+0x210>
ffffffffc0201ce6:	06100593          	li	a1,97
ffffffffc0201cea:	0000b517          	auipc	a0,0xb
ffffffffc0201cee:	a7650513          	addi	a0,a0,-1418 # ffffffffc020c760 <commands+0x960>
ffffffffc0201cf2:	e406                	sd	ra,8(sp)
ffffffffc0201cf4:	faafe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201cf8 <default_init_memmap>:
ffffffffc0201cf8:	1141                	addi	sp,sp,-16
ffffffffc0201cfa:	e406                	sd	ra,8(sp)
ffffffffc0201cfc:	c5f1                	beqz	a1,ffffffffc0201dc8 <default_init_memmap+0xd0>
ffffffffc0201cfe:	00659693          	slli	a3,a1,0x6
ffffffffc0201d02:	96aa                	add	a3,a3,a0
ffffffffc0201d04:	87aa                	mv	a5,a0
ffffffffc0201d06:	00d50f63          	beq	a0,a3,ffffffffc0201d24 <default_init_memmap+0x2c>
ffffffffc0201d0a:	6798                	ld	a4,8(a5)
ffffffffc0201d0c:	8b05                	andi	a4,a4,1
ffffffffc0201d0e:	cf49                	beqz	a4,ffffffffc0201da8 <default_init_memmap+0xb0>
ffffffffc0201d10:	0007a823          	sw	zero,16(a5)
ffffffffc0201d14:	0007b423          	sd	zero,8(a5)
ffffffffc0201d18:	0007a023          	sw	zero,0(a5)
ffffffffc0201d1c:	04078793          	addi	a5,a5,64
ffffffffc0201d20:	fed795e3          	bne	a5,a3,ffffffffc0201d0a <default_init_memmap+0x12>
ffffffffc0201d24:	2581                	sext.w	a1,a1
ffffffffc0201d26:	c90c                	sw	a1,16(a0)
ffffffffc0201d28:	4789                	li	a5,2
ffffffffc0201d2a:	00850713          	addi	a4,a0,8
ffffffffc0201d2e:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0201d32:	00090697          	auipc	a3,0x90
ffffffffc0201d36:	aa668693          	addi	a3,a3,-1370 # ffffffffc02917d8 <free_area>
ffffffffc0201d3a:	4a98                	lw	a4,16(a3)
ffffffffc0201d3c:	669c                	ld	a5,8(a3)
ffffffffc0201d3e:	01850613          	addi	a2,a0,24
ffffffffc0201d42:	9db9                	addw	a1,a1,a4
ffffffffc0201d44:	ca8c                	sw	a1,16(a3)
ffffffffc0201d46:	04d78a63          	beq	a5,a3,ffffffffc0201d9a <default_init_memmap+0xa2>
ffffffffc0201d4a:	fe878713          	addi	a4,a5,-24
ffffffffc0201d4e:	0006b803          	ld	a6,0(a3)
ffffffffc0201d52:	4581                	li	a1,0
ffffffffc0201d54:	00e56a63          	bltu	a0,a4,ffffffffc0201d68 <default_init_memmap+0x70>
ffffffffc0201d58:	6798                	ld	a4,8(a5)
ffffffffc0201d5a:	02d70263          	beq	a4,a3,ffffffffc0201d7e <default_init_memmap+0x86>
ffffffffc0201d5e:	87ba                	mv	a5,a4
ffffffffc0201d60:	fe878713          	addi	a4,a5,-24
ffffffffc0201d64:	fee57ae3          	bgeu	a0,a4,ffffffffc0201d58 <default_init_memmap+0x60>
ffffffffc0201d68:	c199                	beqz	a1,ffffffffc0201d6e <default_init_memmap+0x76>
ffffffffc0201d6a:	0106b023          	sd	a6,0(a3)
ffffffffc0201d6e:	6398                	ld	a4,0(a5)
ffffffffc0201d70:	60a2                	ld	ra,8(sp)
ffffffffc0201d72:	e390                	sd	a2,0(a5)
ffffffffc0201d74:	e710                	sd	a2,8(a4)
ffffffffc0201d76:	f11c                	sd	a5,32(a0)
ffffffffc0201d78:	ed18                	sd	a4,24(a0)
ffffffffc0201d7a:	0141                	addi	sp,sp,16
ffffffffc0201d7c:	8082                	ret
ffffffffc0201d7e:	e790                	sd	a2,8(a5)
ffffffffc0201d80:	f114                	sd	a3,32(a0)
ffffffffc0201d82:	6798                	ld	a4,8(a5)
ffffffffc0201d84:	ed1c                	sd	a5,24(a0)
ffffffffc0201d86:	00d70663          	beq	a4,a3,ffffffffc0201d92 <default_init_memmap+0x9a>
ffffffffc0201d8a:	8832                	mv	a6,a2
ffffffffc0201d8c:	4585                	li	a1,1
ffffffffc0201d8e:	87ba                	mv	a5,a4
ffffffffc0201d90:	bfc1                	j	ffffffffc0201d60 <default_init_memmap+0x68>
ffffffffc0201d92:	60a2                	ld	ra,8(sp)
ffffffffc0201d94:	e290                	sd	a2,0(a3)
ffffffffc0201d96:	0141                	addi	sp,sp,16
ffffffffc0201d98:	8082                	ret
ffffffffc0201d9a:	60a2                	ld	ra,8(sp)
ffffffffc0201d9c:	e390                	sd	a2,0(a5)
ffffffffc0201d9e:	e790                	sd	a2,8(a5)
ffffffffc0201da0:	f11c                	sd	a5,32(a0)
ffffffffc0201da2:	ed1c                	sd	a5,24(a0)
ffffffffc0201da4:	0141                	addi	sp,sp,16
ffffffffc0201da6:	8082                	ret
ffffffffc0201da8:	0000b697          	auipc	a3,0xb
ffffffffc0201dac:	d2868693          	addi	a3,a3,-728 # ffffffffc020cad0 <commands+0xcd0>
ffffffffc0201db0:	0000a617          	auipc	a2,0xa
ffffffffc0201db4:	26060613          	addi	a2,a2,608 # ffffffffc020c010 <commands+0x210>
ffffffffc0201db8:	04800593          	li	a1,72
ffffffffc0201dbc:	0000b517          	auipc	a0,0xb
ffffffffc0201dc0:	9a450513          	addi	a0,a0,-1628 # ffffffffc020c760 <commands+0x960>
ffffffffc0201dc4:	edafe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201dc8:	0000b697          	auipc	a3,0xb
ffffffffc0201dcc:	cd868693          	addi	a3,a3,-808 # ffffffffc020caa0 <commands+0xca0>
ffffffffc0201dd0:	0000a617          	auipc	a2,0xa
ffffffffc0201dd4:	24060613          	addi	a2,a2,576 # ffffffffc020c010 <commands+0x210>
ffffffffc0201dd8:	04500593          	li	a1,69
ffffffffc0201ddc:	0000b517          	auipc	a0,0xb
ffffffffc0201de0:	98450513          	addi	a0,a0,-1660 # ffffffffc020c760 <commands+0x960>
ffffffffc0201de4:	ebafe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201de8 <slob_free>:
ffffffffc0201de8:	c94d                	beqz	a0,ffffffffc0201e9a <slob_free+0xb2>
ffffffffc0201dea:	1141                	addi	sp,sp,-16
ffffffffc0201dec:	e022                	sd	s0,0(sp)
ffffffffc0201dee:	e406                	sd	ra,8(sp)
ffffffffc0201df0:	842a                	mv	s0,a0
ffffffffc0201df2:	e9c1                	bnez	a1,ffffffffc0201e82 <slob_free+0x9a>
ffffffffc0201df4:	100027f3          	csrr	a5,sstatus
ffffffffc0201df8:	8b89                	andi	a5,a5,2
ffffffffc0201dfa:	4501                	li	a0,0
ffffffffc0201dfc:	ebd9                	bnez	a5,ffffffffc0201e92 <slob_free+0xaa>
ffffffffc0201dfe:	0008f617          	auipc	a2,0x8f
ffffffffc0201e02:	28260613          	addi	a2,a2,642 # ffffffffc0291080 <slobfree>
ffffffffc0201e06:	621c                	ld	a5,0(a2)
ffffffffc0201e08:	873e                	mv	a4,a5
ffffffffc0201e0a:	679c                	ld	a5,8(a5)
ffffffffc0201e0c:	02877a63          	bgeu	a4,s0,ffffffffc0201e40 <slob_free+0x58>
ffffffffc0201e10:	00f46463          	bltu	s0,a5,ffffffffc0201e18 <slob_free+0x30>
ffffffffc0201e14:	fef76ae3          	bltu	a4,a5,ffffffffc0201e08 <slob_free+0x20>
ffffffffc0201e18:	400c                	lw	a1,0(s0)
ffffffffc0201e1a:	00459693          	slli	a3,a1,0x4
ffffffffc0201e1e:	96a2                	add	a3,a3,s0
ffffffffc0201e20:	02d78a63          	beq	a5,a3,ffffffffc0201e54 <slob_free+0x6c>
ffffffffc0201e24:	4314                	lw	a3,0(a4)
ffffffffc0201e26:	e41c                	sd	a5,8(s0)
ffffffffc0201e28:	00469793          	slli	a5,a3,0x4
ffffffffc0201e2c:	97ba                	add	a5,a5,a4
ffffffffc0201e2e:	02f40e63          	beq	s0,a5,ffffffffc0201e6a <slob_free+0x82>
ffffffffc0201e32:	e700                	sd	s0,8(a4)
ffffffffc0201e34:	e218                	sd	a4,0(a2)
ffffffffc0201e36:	e129                	bnez	a0,ffffffffc0201e78 <slob_free+0x90>
ffffffffc0201e38:	60a2                	ld	ra,8(sp)
ffffffffc0201e3a:	6402                	ld	s0,0(sp)
ffffffffc0201e3c:	0141                	addi	sp,sp,16
ffffffffc0201e3e:	8082                	ret
ffffffffc0201e40:	fcf764e3          	bltu	a4,a5,ffffffffc0201e08 <slob_free+0x20>
ffffffffc0201e44:	fcf472e3          	bgeu	s0,a5,ffffffffc0201e08 <slob_free+0x20>
ffffffffc0201e48:	400c                	lw	a1,0(s0)
ffffffffc0201e4a:	00459693          	slli	a3,a1,0x4
ffffffffc0201e4e:	96a2                	add	a3,a3,s0
ffffffffc0201e50:	fcd79ae3          	bne	a5,a3,ffffffffc0201e24 <slob_free+0x3c>
ffffffffc0201e54:	4394                	lw	a3,0(a5)
ffffffffc0201e56:	679c                	ld	a5,8(a5)
ffffffffc0201e58:	9db5                	addw	a1,a1,a3
ffffffffc0201e5a:	c00c                	sw	a1,0(s0)
ffffffffc0201e5c:	4314                	lw	a3,0(a4)
ffffffffc0201e5e:	e41c                	sd	a5,8(s0)
ffffffffc0201e60:	00469793          	slli	a5,a3,0x4
ffffffffc0201e64:	97ba                	add	a5,a5,a4
ffffffffc0201e66:	fcf416e3          	bne	s0,a5,ffffffffc0201e32 <slob_free+0x4a>
ffffffffc0201e6a:	401c                	lw	a5,0(s0)
ffffffffc0201e6c:	640c                	ld	a1,8(s0)
ffffffffc0201e6e:	e218                	sd	a4,0(a2)
ffffffffc0201e70:	9ebd                	addw	a3,a3,a5
ffffffffc0201e72:	c314                	sw	a3,0(a4)
ffffffffc0201e74:	e70c                	sd	a1,8(a4)
ffffffffc0201e76:	d169                	beqz	a0,ffffffffc0201e38 <slob_free+0x50>
ffffffffc0201e78:	6402                	ld	s0,0(sp)
ffffffffc0201e7a:	60a2                	ld	ra,8(sp)
ffffffffc0201e7c:	0141                	addi	sp,sp,16
ffffffffc0201e7e:	deffe06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0201e82:	25bd                	addiw	a1,a1,15
ffffffffc0201e84:	8191                	srli	a1,a1,0x4
ffffffffc0201e86:	c10c                	sw	a1,0(a0)
ffffffffc0201e88:	100027f3          	csrr	a5,sstatus
ffffffffc0201e8c:	8b89                	andi	a5,a5,2
ffffffffc0201e8e:	4501                	li	a0,0
ffffffffc0201e90:	d7bd                	beqz	a5,ffffffffc0201dfe <slob_free+0x16>
ffffffffc0201e92:	de1fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201e96:	4505                	li	a0,1
ffffffffc0201e98:	b79d                	j	ffffffffc0201dfe <slob_free+0x16>
ffffffffc0201e9a:	8082                	ret

ffffffffc0201e9c <__slob_get_free_pages.constprop.0>:
ffffffffc0201e9c:	4785                	li	a5,1
ffffffffc0201e9e:	1141                	addi	sp,sp,-16
ffffffffc0201ea0:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201ea4:	e406                	sd	ra,8(sp)
ffffffffc0201ea6:	352000ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc0201eaa:	c91d                	beqz	a0,ffffffffc0201ee0 <__slob_get_free_pages.constprop.0+0x44>
ffffffffc0201eac:	00095697          	auipc	a3,0x95
ffffffffc0201eb0:	a2c6b683          	ld	a3,-1492(a3) # ffffffffc02968d8 <pages>
ffffffffc0201eb4:	8d15                	sub	a0,a0,a3
ffffffffc0201eb6:	8519                	srai	a0,a0,0x6
ffffffffc0201eb8:	0000e697          	auipc	a3,0xe
ffffffffc0201ebc:	ff86b683          	ld	a3,-8(a3) # ffffffffc020feb0 <nbase>
ffffffffc0201ec0:	9536                	add	a0,a0,a3
ffffffffc0201ec2:	00c51793          	slli	a5,a0,0xc
ffffffffc0201ec6:	83b1                	srli	a5,a5,0xc
ffffffffc0201ec8:	00095717          	auipc	a4,0x95
ffffffffc0201ecc:	a0873703          	ld	a4,-1528(a4) # ffffffffc02968d0 <npage>
ffffffffc0201ed0:	0532                	slli	a0,a0,0xc
ffffffffc0201ed2:	00e7fa63          	bgeu	a5,a4,ffffffffc0201ee6 <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201ed6:	00095697          	auipc	a3,0x95
ffffffffc0201eda:	a126b683          	ld	a3,-1518(a3) # ffffffffc02968e8 <va_pa_offset>
ffffffffc0201ede:	9536                	add	a0,a0,a3
ffffffffc0201ee0:	60a2                	ld	ra,8(sp)
ffffffffc0201ee2:	0141                	addi	sp,sp,16
ffffffffc0201ee4:	8082                	ret
ffffffffc0201ee6:	86aa                	mv	a3,a0
ffffffffc0201ee8:	0000b617          	auipc	a2,0xb
ffffffffc0201eec:	c4860613          	addi	a2,a2,-952 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc0201ef0:	07100593          	li	a1,113
ffffffffc0201ef4:	0000b517          	auipc	a0,0xb
ffffffffc0201ef8:	c6450513          	addi	a0,a0,-924 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc0201efc:	da2fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201f00 <slob_alloc.constprop.0>:
ffffffffc0201f00:	1101                	addi	sp,sp,-32
ffffffffc0201f02:	ec06                	sd	ra,24(sp)
ffffffffc0201f04:	e822                	sd	s0,16(sp)
ffffffffc0201f06:	e426                	sd	s1,8(sp)
ffffffffc0201f08:	e04a                	sd	s2,0(sp)
ffffffffc0201f0a:	01050713          	addi	a4,a0,16
ffffffffc0201f0e:	6785                	lui	a5,0x1
ffffffffc0201f10:	0cf77363          	bgeu	a4,a5,ffffffffc0201fd6 <slob_alloc.constprop.0+0xd6>
ffffffffc0201f14:	00f50493          	addi	s1,a0,15
ffffffffc0201f18:	8091                	srli	s1,s1,0x4
ffffffffc0201f1a:	2481                	sext.w	s1,s1
ffffffffc0201f1c:	10002673          	csrr	a2,sstatus
ffffffffc0201f20:	8a09                	andi	a2,a2,2
ffffffffc0201f22:	e25d                	bnez	a2,ffffffffc0201fc8 <slob_alloc.constprop.0+0xc8>
ffffffffc0201f24:	0008f917          	auipc	s2,0x8f
ffffffffc0201f28:	15c90913          	addi	s2,s2,348 # ffffffffc0291080 <slobfree>
ffffffffc0201f2c:	00093683          	ld	a3,0(s2)
ffffffffc0201f30:	669c                	ld	a5,8(a3)
ffffffffc0201f32:	4398                	lw	a4,0(a5)
ffffffffc0201f34:	08975e63          	bge	a4,s1,ffffffffc0201fd0 <slob_alloc.constprop.0+0xd0>
ffffffffc0201f38:	00f68b63          	beq	a3,a5,ffffffffc0201f4e <slob_alloc.constprop.0+0x4e>
ffffffffc0201f3c:	6780                	ld	s0,8(a5)
ffffffffc0201f3e:	4018                	lw	a4,0(s0)
ffffffffc0201f40:	02975a63          	bge	a4,s1,ffffffffc0201f74 <slob_alloc.constprop.0+0x74>
ffffffffc0201f44:	00093683          	ld	a3,0(s2)
ffffffffc0201f48:	87a2                	mv	a5,s0
ffffffffc0201f4a:	fef699e3          	bne	a3,a5,ffffffffc0201f3c <slob_alloc.constprop.0+0x3c>
ffffffffc0201f4e:	ee31                	bnez	a2,ffffffffc0201faa <slob_alloc.constprop.0+0xaa>
ffffffffc0201f50:	4501                	li	a0,0
ffffffffc0201f52:	f4bff0ef          	jal	ra,ffffffffc0201e9c <__slob_get_free_pages.constprop.0>
ffffffffc0201f56:	842a                	mv	s0,a0
ffffffffc0201f58:	cd05                	beqz	a0,ffffffffc0201f90 <slob_alloc.constprop.0+0x90>
ffffffffc0201f5a:	6585                	lui	a1,0x1
ffffffffc0201f5c:	e8dff0ef          	jal	ra,ffffffffc0201de8 <slob_free>
ffffffffc0201f60:	10002673          	csrr	a2,sstatus
ffffffffc0201f64:	8a09                	andi	a2,a2,2
ffffffffc0201f66:	ee05                	bnez	a2,ffffffffc0201f9e <slob_alloc.constprop.0+0x9e>
ffffffffc0201f68:	00093783          	ld	a5,0(s2)
ffffffffc0201f6c:	6780                	ld	s0,8(a5)
ffffffffc0201f6e:	4018                	lw	a4,0(s0)
ffffffffc0201f70:	fc974ae3          	blt	a4,s1,ffffffffc0201f44 <slob_alloc.constprop.0+0x44>
ffffffffc0201f74:	04e48763          	beq	s1,a4,ffffffffc0201fc2 <slob_alloc.constprop.0+0xc2>
ffffffffc0201f78:	00449693          	slli	a3,s1,0x4
ffffffffc0201f7c:	96a2                	add	a3,a3,s0
ffffffffc0201f7e:	e794                	sd	a3,8(a5)
ffffffffc0201f80:	640c                	ld	a1,8(s0)
ffffffffc0201f82:	9f05                	subw	a4,a4,s1
ffffffffc0201f84:	c298                	sw	a4,0(a3)
ffffffffc0201f86:	e68c                	sd	a1,8(a3)
ffffffffc0201f88:	c004                	sw	s1,0(s0)
ffffffffc0201f8a:	00f93023          	sd	a5,0(s2)
ffffffffc0201f8e:	e20d                	bnez	a2,ffffffffc0201fb0 <slob_alloc.constprop.0+0xb0>
ffffffffc0201f90:	60e2                	ld	ra,24(sp)
ffffffffc0201f92:	8522                	mv	a0,s0
ffffffffc0201f94:	6442                	ld	s0,16(sp)
ffffffffc0201f96:	64a2                	ld	s1,8(sp)
ffffffffc0201f98:	6902                	ld	s2,0(sp)
ffffffffc0201f9a:	6105                	addi	sp,sp,32
ffffffffc0201f9c:	8082                	ret
ffffffffc0201f9e:	cd5fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201fa2:	00093783          	ld	a5,0(s2)
ffffffffc0201fa6:	4605                	li	a2,1
ffffffffc0201fa8:	b7d1                	j	ffffffffc0201f6c <slob_alloc.constprop.0+0x6c>
ffffffffc0201faa:	cc3fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201fae:	b74d                	j	ffffffffc0201f50 <slob_alloc.constprop.0+0x50>
ffffffffc0201fb0:	cbdfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201fb4:	60e2                	ld	ra,24(sp)
ffffffffc0201fb6:	8522                	mv	a0,s0
ffffffffc0201fb8:	6442                	ld	s0,16(sp)
ffffffffc0201fba:	64a2                	ld	s1,8(sp)
ffffffffc0201fbc:	6902                	ld	s2,0(sp)
ffffffffc0201fbe:	6105                	addi	sp,sp,32
ffffffffc0201fc0:	8082                	ret
ffffffffc0201fc2:	6418                	ld	a4,8(s0)
ffffffffc0201fc4:	e798                	sd	a4,8(a5)
ffffffffc0201fc6:	b7d1                	j	ffffffffc0201f8a <slob_alloc.constprop.0+0x8a>
ffffffffc0201fc8:	cabfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201fcc:	4605                	li	a2,1
ffffffffc0201fce:	bf99                	j	ffffffffc0201f24 <slob_alloc.constprop.0+0x24>
ffffffffc0201fd0:	843e                	mv	s0,a5
ffffffffc0201fd2:	87b6                	mv	a5,a3
ffffffffc0201fd4:	b745                	j	ffffffffc0201f74 <slob_alloc.constprop.0+0x74>
ffffffffc0201fd6:	0000b697          	auipc	a3,0xb
ffffffffc0201fda:	b9268693          	addi	a3,a3,-1134 # ffffffffc020cb68 <default_pmm_manager+0x70>
ffffffffc0201fde:	0000a617          	auipc	a2,0xa
ffffffffc0201fe2:	03260613          	addi	a2,a2,50 # ffffffffc020c010 <commands+0x210>
ffffffffc0201fe6:	06300593          	li	a1,99
ffffffffc0201fea:	0000b517          	auipc	a0,0xb
ffffffffc0201fee:	b9e50513          	addi	a0,a0,-1122 # ffffffffc020cb88 <default_pmm_manager+0x90>
ffffffffc0201ff2:	cacfe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201ff6 <kmalloc_init>:
ffffffffc0201ff6:	1141                	addi	sp,sp,-16
ffffffffc0201ff8:	0000b517          	auipc	a0,0xb
ffffffffc0201ffc:	ba850513          	addi	a0,a0,-1112 # ffffffffc020cba0 <default_pmm_manager+0xa8>
ffffffffc0202000:	e406                	sd	ra,8(sp)
ffffffffc0202002:	9a4fe0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202006:	60a2                	ld	ra,8(sp)
ffffffffc0202008:	0000b517          	auipc	a0,0xb
ffffffffc020200c:	bb050513          	addi	a0,a0,-1104 # ffffffffc020cbb8 <default_pmm_manager+0xc0>
ffffffffc0202010:	0141                	addi	sp,sp,16
ffffffffc0202012:	994fe06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0202016 <kallocated>:
ffffffffc0202016:	4501                	li	a0,0
ffffffffc0202018:	8082                	ret

ffffffffc020201a <kmalloc>:
ffffffffc020201a:	1101                	addi	sp,sp,-32
ffffffffc020201c:	e04a                	sd	s2,0(sp)
ffffffffc020201e:	6905                	lui	s2,0x1
ffffffffc0202020:	e822                	sd	s0,16(sp)
ffffffffc0202022:	ec06                	sd	ra,24(sp)
ffffffffc0202024:	e426                	sd	s1,8(sp)
ffffffffc0202026:	fef90793          	addi	a5,s2,-17 # fef <_binary_bin_swap_img_size-0x6d11>
ffffffffc020202a:	842a                	mv	s0,a0
ffffffffc020202c:	04a7f963          	bgeu	a5,a0,ffffffffc020207e <kmalloc+0x64>
ffffffffc0202030:	4561                	li	a0,24
ffffffffc0202032:	ecfff0ef          	jal	ra,ffffffffc0201f00 <slob_alloc.constprop.0>
ffffffffc0202036:	84aa                	mv	s1,a0
ffffffffc0202038:	c929                	beqz	a0,ffffffffc020208a <kmalloc+0x70>
ffffffffc020203a:	0004079b          	sext.w	a5,s0
ffffffffc020203e:	4501                	li	a0,0
ffffffffc0202040:	00f95763          	bge	s2,a5,ffffffffc020204e <kmalloc+0x34>
ffffffffc0202044:	6705                	lui	a4,0x1
ffffffffc0202046:	8785                	srai	a5,a5,0x1
ffffffffc0202048:	2505                	addiw	a0,a0,1
ffffffffc020204a:	fef74ee3          	blt	a4,a5,ffffffffc0202046 <kmalloc+0x2c>
ffffffffc020204e:	c088                	sw	a0,0(s1)
ffffffffc0202050:	e4dff0ef          	jal	ra,ffffffffc0201e9c <__slob_get_free_pages.constprop.0>
ffffffffc0202054:	e488                	sd	a0,8(s1)
ffffffffc0202056:	842a                	mv	s0,a0
ffffffffc0202058:	c525                	beqz	a0,ffffffffc02020c0 <kmalloc+0xa6>
ffffffffc020205a:	100027f3          	csrr	a5,sstatus
ffffffffc020205e:	8b89                	andi	a5,a5,2
ffffffffc0202060:	ef8d                	bnez	a5,ffffffffc020209a <kmalloc+0x80>
ffffffffc0202062:	00095797          	auipc	a5,0x95
ffffffffc0202066:	85678793          	addi	a5,a5,-1962 # ffffffffc02968b8 <bigblocks>
ffffffffc020206a:	6398                	ld	a4,0(a5)
ffffffffc020206c:	e384                	sd	s1,0(a5)
ffffffffc020206e:	e898                	sd	a4,16(s1)
ffffffffc0202070:	60e2                	ld	ra,24(sp)
ffffffffc0202072:	8522                	mv	a0,s0
ffffffffc0202074:	6442                	ld	s0,16(sp)
ffffffffc0202076:	64a2                	ld	s1,8(sp)
ffffffffc0202078:	6902                	ld	s2,0(sp)
ffffffffc020207a:	6105                	addi	sp,sp,32
ffffffffc020207c:	8082                	ret
ffffffffc020207e:	0541                	addi	a0,a0,16
ffffffffc0202080:	e81ff0ef          	jal	ra,ffffffffc0201f00 <slob_alloc.constprop.0>
ffffffffc0202084:	01050413          	addi	s0,a0,16
ffffffffc0202088:	f565                	bnez	a0,ffffffffc0202070 <kmalloc+0x56>
ffffffffc020208a:	4401                	li	s0,0
ffffffffc020208c:	60e2                	ld	ra,24(sp)
ffffffffc020208e:	8522                	mv	a0,s0
ffffffffc0202090:	6442                	ld	s0,16(sp)
ffffffffc0202092:	64a2                	ld	s1,8(sp)
ffffffffc0202094:	6902                	ld	s2,0(sp)
ffffffffc0202096:	6105                	addi	sp,sp,32
ffffffffc0202098:	8082                	ret
ffffffffc020209a:	bd9fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020209e:	00095797          	auipc	a5,0x95
ffffffffc02020a2:	81a78793          	addi	a5,a5,-2022 # ffffffffc02968b8 <bigblocks>
ffffffffc02020a6:	6398                	ld	a4,0(a5)
ffffffffc02020a8:	e384                	sd	s1,0(a5)
ffffffffc02020aa:	e898                	sd	a4,16(s1)
ffffffffc02020ac:	bc1fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020b0:	6480                	ld	s0,8(s1)
ffffffffc02020b2:	60e2                	ld	ra,24(sp)
ffffffffc02020b4:	64a2                	ld	s1,8(sp)
ffffffffc02020b6:	8522                	mv	a0,s0
ffffffffc02020b8:	6442                	ld	s0,16(sp)
ffffffffc02020ba:	6902                	ld	s2,0(sp)
ffffffffc02020bc:	6105                	addi	sp,sp,32
ffffffffc02020be:	8082                	ret
ffffffffc02020c0:	45e1                	li	a1,24
ffffffffc02020c2:	8526                	mv	a0,s1
ffffffffc02020c4:	d25ff0ef          	jal	ra,ffffffffc0201de8 <slob_free>
ffffffffc02020c8:	b765                	j	ffffffffc0202070 <kmalloc+0x56>

ffffffffc02020ca <kfree>:
ffffffffc02020ca:	c169                	beqz	a0,ffffffffc020218c <kfree+0xc2>
ffffffffc02020cc:	1101                	addi	sp,sp,-32
ffffffffc02020ce:	e822                	sd	s0,16(sp)
ffffffffc02020d0:	ec06                	sd	ra,24(sp)
ffffffffc02020d2:	e426                	sd	s1,8(sp)
ffffffffc02020d4:	03451793          	slli	a5,a0,0x34
ffffffffc02020d8:	842a                	mv	s0,a0
ffffffffc02020da:	e3d9                	bnez	a5,ffffffffc0202160 <kfree+0x96>
ffffffffc02020dc:	100027f3          	csrr	a5,sstatus
ffffffffc02020e0:	8b89                	andi	a5,a5,2
ffffffffc02020e2:	e7d9                	bnez	a5,ffffffffc0202170 <kfree+0xa6>
ffffffffc02020e4:	00094797          	auipc	a5,0x94
ffffffffc02020e8:	7d47b783          	ld	a5,2004(a5) # ffffffffc02968b8 <bigblocks>
ffffffffc02020ec:	4601                	li	a2,0
ffffffffc02020ee:	cbad                	beqz	a5,ffffffffc0202160 <kfree+0x96>
ffffffffc02020f0:	00094697          	auipc	a3,0x94
ffffffffc02020f4:	7c868693          	addi	a3,a3,1992 # ffffffffc02968b8 <bigblocks>
ffffffffc02020f8:	a021                	j	ffffffffc0202100 <kfree+0x36>
ffffffffc02020fa:	01048693          	addi	a3,s1,16
ffffffffc02020fe:	c3a5                	beqz	a5,ffffffffc020215e <kfree+0x94>
ffffffffc0202100:	6798                	ld	a4,8(a5)
ffffffffc0202102:	84be                	mv	s1,a5
ffffffffc0202104:	6b9c                	ld	a5,16(a5)
ffffffffc0202106:	fe871ae3          	bne	a4,s0,ffffffffc02020fa <kfree+0x30>
ffffffffc020210a:	e29c                	sd	a5,0(a3)
ffffffffc020210c:	ee2d                	bnez	a2,ffffffffc0202186 <kfree+0xbc>
ffffffffc020210e:	c02007b7          	lui	a5,0xc0200
ffffffffc0202112:	4098                	lw	a4,0(s1)
ffffffffc0202114:	08f46963          	bltu	s0,a5,ffffffffc02021a6 <kfree+0xdc>
ffffffffc0202118:	00094697          	auipc	a3,0x94
ffffffffc020211c:	7d06b683          	ld	a3,2000(a3) # ffffffffc02968e8 <va_pa_offset>
ffffffffc0202120:	8c15                	sub	s0,s0,a3
ffffffffc0202122:	8031                	srli	s0,s0,0xc
ffffffffc0202124:	00094797          	auipc	a5,0x94
ffffffffc0202128:	7ac7b783          	ld	a5,1964(a5) # ffffffffc02968d0 <npage>
ffffffffc020212c:	06f47163          	bgeu	s0,a5,ffffffffc020218e <kfree+0xc4>
ffffffffc0202130:	0000e517          	auipc	a0,0xe
ffffffffc0202134:	d8053503          	ld	a0,-640(a0) # ffffffffc020feb0 <nbase>
ffffffffc0202138:	8c09                	sub	s0,s0,a0
ffffffffc020213a:	041a                	slli	s0,s0,0x6
ffffffffc020213c:	00094517          	auipc	a0,0x94
ffffffffc0202140:	79c53503          	ld	a0,1948(a0) # ffffffffc02968d8 <pages>
ffffffffc0202144:	4585                	li	a1,1
ffffffffc0202146:	9522                	add	a0,a0,s0
ffffffffc0202148:	00e595bb          	sllw	a1,a1,a4
ffffffffc020214c:	0ea000ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc0202150:	6442                	ld	s0,16(sp)
ffffffffc0202152:	60e2                	ld	ra,24(sp)
ffffffffc0202154:	8526                	mv	a0,s1
ffffffffc0202156:	64a2                	ld	s1,8(sp)
ffffffffc0202158:	45e1                	li	a1,24
ffffffffc020215a:	6105                	addi	sp,sp,32
ffffffffc020215c:	b171                	j	ffffffffc0201de8 <slob_free>
ffffffffc020215e:	e20d                	bnez	a2,ffffffffc0202180 <kfree+0xb6>
ffffffffc0202160:	ff040513          	addi	a0,s0,-16
ffffffffc0202164:	6442                	ld	s0,16(sp)
ffffffffc0202166:	60e2                	ld	ra,24(sp)
ffffffffc0202168:	64a2                	ld	s1,8(sp)
ffffffffc020216a:	4581                	li	a1,0
ffffffffc020216c:	6105                	addi	sp,sp,32
ffffffffc020216e:	b9ad                	j	ffffffffc0201de8 <slob_free>
ffffffffc0202170:	b03fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202174:	00094797          	auipc	a5,0x94
ffffffffc0202178:	7447b783          	ld	a5,1860(a5) # ffffffffc02968b8 <bigblocks>
ffffffffc020217c:	4605                	li	a2,1
ffffffffc020217e:	fbad                	bnez	a5,ffffffffc02020f0 <kfree+0x26>
ffffffffc0202180:	aedfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202184:	bff1                	j	ffffffffc0202160 <kfree+0x96>
ffffffffc0202186:	ae7fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020218a:	b751                	j	ffffffffc020210e <kfree+0x44>
ffffffffc020218c:	8082                	ret
ffffffffc020218e:	0000b617          	auipc	a2,0xb
ffffffffc0202192:	a7260613          	addi	a2,a2,-1422 # ffffffffc020cc00 <default_pmm_manager+0x108>
ffffffffc0202196:	06900593          	li	a1,105
ffffffffc020219a:	0000b517          	auipc	a0,0xb
ffffffffc020219e:	9be50513          	addi	a0,a0,-1602 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc02021a2:	afcfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02021a6:	86a2                	mv	a3,s0
ffffffffc02021a8:	0000b617          	auipc	a2,0xb
ffffffffc02021ac:	a3060613          	addi	a2,a2,-1488 # ffffffffc020cbd8 <default_pmm_manager+0xe0>
ffffffffc02021b0:	07700593          	li	a1,119
ffffffffc02021b4:	0000b517          	auipc	a0,0xb
ffffffffc02021b8:	9a450513          	addi	a0,a0,-1628 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc02021bc:	ae2fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02021c0 <pa2page.part.0>:
ffffffffc02021c0:	1141                	addi	sp,sp,-16
ffffffffc02021c2:	0000b617          	auipc	a2,0xb
ffffffffc02021c6:	a3e60613          	addi	a2,a2,-1474 # ffffffffc020cc00 <default_pmm_manager+0x108>
ffffffffc02021ca:	06900593          	li	a1,105
ffffffffc02021ce:	0000b517          	auipc	a0,0xb
ffffffffc02021d2:	98a50513          	addi	a0,a0,-1654 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc02021d6:	e406                	sd	ra,8(sp)
ffffffffc02021d8:	ac6fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02021dc <pte2page.part.0>:
ffffffffc02021dc:	1141                	addi	sp,sp,-16
ffffffffc02021de:	0000b617          	auipc	a2,0xb
ffffffffc02021e2:	a4260613          	addi	a2,a2,-1470 # ffffffffc020cc20 <default_pmm_manager+0x128>
ffffffffc02021e6:	07f00593          	li	a1,127
ffffffffc02021ea:	0000b517          	auipc	a0,0xb
ffffffffc02021ee:	96e50513          	addi	a0,a0,-1682 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc02021f2:	e406                	sd	ra,8(sp)
ffffffffc02021f4:	aaafe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02021f8 <alloc_pages>:
ffffffffc02021f8:	100027f3          	csrr	a5,sstatus
ffffffffc02021fc:	8b89                	andi	a5,a5,2
ffffffffc02021fe:	e799                	bnez	a5,ffffffffc020220c <alloc_pages+0x14>
ffffffffc0202200:	00094797          	auipc	a5,0x94
ffffffffc0202204:	6e07b783          	ld	a5,1760(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc0202208:	6f9c                	ld	a5,24(a5)
ffffffffc020220a:	8782                	jr	a5
ffffffffc020220c:	1141                	addi	sp,sp,-16
ffffffffc020220e:	e406                	sd	ra,8(sp)
ffffffffc0202210:	e022                	sd	s0,0(sp)
ffffffffc0202212:	842a                	mv	s0,a0
ffffffffc0202214:	a5ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202218:	00094797          	auipc	a5,0x94
ffffffffc020221c:	6c87b783          	ld	a5,1736(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc0202220:	6f9c                	ld	a5,24(a5)
ffffffffc0202222:	8522                	mv	a0,s0
ffffffffc0202224:	9782                	jalr	a5
ffffffffc0202226:	842a                	mv	s0,a0
ffffffffc0202228:	a45fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020222c:	60a2                	ld	ra,8(sp)
ffffffffc020222e:	8522                	mv	a0,s0
ffffffffc0202230:	6402                	ld	s0,0(sp)
ffffffffc0202232:	0141                	addi	sp,sp,16
ffffffffc0202234:	8082                	ret

ffffffffc0202236 <free_pages>:
ffffffffc0202236:	100027f3          	csrr	a5,sstatus
ffffffffc020223a:	8b89                	andi	a5,a5,2
ffffffffc020223c:	e799                	bnez	a5,ffffffffc020224a <free_pages+0x14>
ffffffffc020223e:	00094797          	auipc	a5,0x94
ffffffffc0202242:	6a27b783          	ld	a5,1698(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc0202246:	739c                	ld	a5,32(a5)
ffffffffc0202248:	8782                	jr	a5
ffffffffc020224a:	1101                	addi	sp,sp,-32
ffffffffc020224c:	ec06                	sd	ra,24(sp)
ffffffffc020224e:	e822                	sd	s0,16(sp)
ffffffffc0202250:	e426                	sd	s1,8(sp)
ffffffffc0202252:	842a                	mv	s0,a0
ffffffffc0202254:	84ae                	mv	s1,a1
ffffffffc0202256:	a1dfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020225a:	00094797          	auipc	a5,0x94
ffffffffc020225e:	6867b783          	ld	a5,1670(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc0202262:	739c                	ld	a5,32(a5)
ffffffffc0202264:	85a6                	mv	a1,s1
ffffffffc0202266:	8522                	mv	a0,s0
ffffffffc0202268:	9782                	jalr	a5
ffffffffc020226a:	6442                	ld	s0,16(sp)
ffffffffc020226c:	60e2                	ld	ra,24(sp)
ffffffffc020226e:	64a2                	ld	s1,8(sp)
ffffffffc0202270:	6105                	addi	sp,sp,32
ffffffffc0202272:	9fbfe06f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc0202276 <nr_free_pages>:
ffffffffc0202276:	100027f3          	csrr	a5,sstatus
ffffffffc020227a:	8b89                	andi	a5,a5,2
ffffffffc020227c:	e799                	bnez	a5,ffffffffc020228a <nr_free_pages+0x14>
ffffffffc020227e:	00094797          	auipc	a5,0x94
ffffffffc0202282:	6627b783          	ld	a5,1634(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc0202286:	779c                	ld	a5,40(a5)
ffffffffc0202288:	8782                	jr	a5
ffffffffc020228a:	1141                	addi	sp,sp,-16
ffffffffc020228c:	e406                	sd	ra,8(sp)
ffffffffc020228e:	e022                	sd	s0,0(sp)
ffffffffc0202290:	9e3fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202294:	00094797          	auipc	a5,0x94
ffffffffc0202298:	64c7b783          	ld	a5,1612(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc020229c:	779c                	ld	a5,40(a5)
ffffffffc020229e:	9782                	jalr	a5
ffffffffc02022a0:	842a                	mv	s0,a0
ffffffffc02022a2:	9cbfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02022a6:	60a2                	ld	ra,8(sp)
ffffffffc02022a8:	8522                	mv	a0,s0
ffffffffc02022aa:	6402                	ld	s0,0(sp)
ffffffffc02022ac:	0141                	addi	sp,sp,16
ffffffffc02022ae:	8082                	ret

ffffffffc02022b0 <get_pte>:
ffffffffc02022b0:	01e5d793          	srli	a5,a1,0x1e
ffffffffc02022b4:	1ff7f793          	andi	a5,a5,511
ffffffffc02022b8:	7139                	addi	sp,sp,-64
ffffffffc02022ba:	078e                	slli	a5,a5,0x3
ffffffffc02022bc:	f426                	sd	s1,40(sp)
ffffffffc02022be:	00f504b3          	add	s1,a0,a5
ffffffffc02022c2:	6094                	ld	a3,0(s1)
ffffffffc02022c4:	f04a                	sd	s2,32(sp)
ffffffffc02022c6:	ec4e                	sd	s3,24(sp)
ffffffffc02022c8:	e852                	sd	s4,16(sp)
ffffffffc02022ca:	fc06                	sd	ra,56(sp)
ffffffffc02022cc:	f822                	sd	s0,48(sp)
ffffffffc02022ce:	e456                	sd	s5,8(sp)
ffffffffc02022d0:	e05a                	sd	s6,0(sp)
ffffffffc02022d2:	0016f793          	andi	a5,a3,1
ffffffffc02022d6:	892e                	mv	s2,a1
ffffffffc02022d8:	8a32                	mv	s4,a2
ffffffffc02022da:	00094997          	auipc	s3,0x94
ffffffffc02022de:	5f698993          	addi	s3,s3,1526 # ffffffffc02968d0 <npage>
ffffffffc02022e2:	efbd                	bnez	a5,ffffffffc0202360 <get_pte+0xb0>
ffffffffc02022e4:	14060c63          	beqz	a2,ffffffffc020243c <get_pte+0x18c>
ffffffffc02022e8:	100027f3          	csrr	a5,sstatus
ffffffffc02022ec:	8b89                	andi	a5,a5,2
ffffffffc02022ee:	14079963          	bnez	a5,ffffffffc0202440 <get_pte+0x190>
ffffffffc02022f2:	00094797          	auipc	a5,0x94
ffffffffc02022f6:	5ee7b783          	ld	a5,1518(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc02022fa:	6f9c                	ld	a5,24(a5)
ffffffffc02022fc:	4505                	li	a0,1
ffffffffc02022fe:	9782                	jalr	a5
ffffffffc0202300:	842a                	mv	s0,a0
ffffffffc0202302:	12040d63          	beqz	s0,ffffffffc020243c <get_pte+0x18c>
ffffffffc0202306:	00094b17          	auipc	s6,0x94
ffffffffc020230a:	5d2b0b13          	addi	s6,s6,1490 # ffffffffc02968d8 <pages>
ffffffffc020230e:	000b3503          	ld	a0,0(s6)
ffffffffc0202312:	00080ab7          	lui	s5,0x80
ffffffffc0202316:	00094997          	auipc	s3,0x94
ffffffffc020231a:	5ba98993          	addi	s3,s3,1466 # ffffffffc02968d0 <npage>
ffffffffc020231e:	40a40533          	sub	a0,s0,a0
ffffffffc0202322:	8519                	srai	a0,a0,0x6
ffffffffc0202324:	9556                	add	a0,a0,s5
ffffffffc0202326:	0009b703          	ld	a4,0(s3)
ffffffffc020232a:	00c51793          	slli	a5,a0,0xc
ffffffffc020232e:	4685                	li	a3,1
ffffffffc0202330:	c014                	sw	a3,0(s0)
ffffffffc0202332:	83b1                	srli	a5,a5,0xc
ffffffffc0202334:	0532                	slli	a0,a0,0xc
ffffffffc0202336:	16e7f763          	bgeu	a5,a4,ffffffffc02024a4 <get_pte+0x1f4>
ffffffffc020233a:	00094797          	auipc	a5,0x94
ffffffffc020233e:	5ae7b783          	ld	a5,1454(a5) # ffffffffc02968e8 <va_pa_offset>
ffffffffc0202342:	6605                	lui	a2,0x1
ffffffffc0202344:	4581                	li	a1,0
ffffffffc0202346:	953e                	add	a0,a0,a5
ffffffffc0202348:	7e2090ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc020234c:	000b3683          	ld	a3,0(s6)
ffffffffc0202350:	40d406b3          	sub	a3,s0,a3
ffffffffc0202354:	8699                	srai	a3,a3,0x6
ffffffffc0202356:	96d6                	add	a3,a3,s5
ffffffffc0202358:	06aa                	slli	a3,a3,0xa
ffffffffc020235a:	0116e693          	ori	a3,a3,17
ffffffffc020235e:	e094                	sd	a3,0(s1)
ffffffffc0202360:	77fd                	lui	a5,0xfffff
ffffffffc0202362:	068a                	slli	a3,a3,0x2
ffffffffc0202364:	0009b703          	ld	a4,0(s3)
ffffffffc0202368:	8efd                	and	a3,a3,a5
ffffffffc020236a:	00c6d793          	srli	a5,a3,0xc
ffffffffc020236e:	10e7ff63          	bgeu	a5,a4,ffffffffc020248c <get_pte+0x1dc>
ffffffffc0202372:	00094a97          	auipc	s5,0x94
ffffffffc0202376:	576a8a93          	addi	s5,s5,1398 # ffffffffc02968e8 <va_pa_offset>
ffffffffc020237a:	000ab403          	ld	s0,0(s5)
ffffffffc020237e:	01595793          	srli	a5,s2,0x15
ffffffffc0202382:	1ff7f793          	andi	a5,a5,511
ffffffffc0202386:	96a2                	add	a3,a3,s0
ffffffffc0202388:	00379413          	slli	s0,a5,0x3
ffffffffc020238c:	9436                	add	s0,s0,a3
ffffffffc020238e:	6014                	ld	a3,0(s0)
ffffffffc0202390:	0016f793          	andi	a5,a3,1
ffffffffc0202394:	ebad                	bnez	a5,ffffffffc0202406 <get_pte+0x156>
ffffffffc0202396:	0a0a0363          	beqz	s4,ffffffffc020243c <get_pte+0x18c>
ffffffffc020239a:	100027f3          	csrr	a5,sstatus
ffffffffc020239e:	8b89                	andi	a5,a5,2
ffffffffc02023a0:	efcd                	bnez	a5,ffffffffc020245a <get_pte+0x1aa>
ffffffffc02023a2:	00094797          	auipc	a5,0x94
ffffffffc02023a6:	53e7b783          	ld	a5,1342(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc02023aa:	6f9c                	ld	a5,24(a5)
ffffffffc02023ac:	4505                	li	a0,1
ffffffffc02023ae:	9782                	jalr	a5
ffffffffc02023b0:	84aa                	mv	s1,a0
ffffffffc02023b2:	c4c9                	beqz	s1,ffffffffc020243c <get_pte+0x18c>
ffffffffc02023b4:	00094b17          	auipc	s6,0x94
ffffffffc02023b8:	524b0b13          	addi	s6,s6,1316 # ffffffffc02968d8 <pages>
ffffffffc02023bc:	000b3503          	ld	a0,0(s6)
ffffffffc02023c0:	00080a37          	lui	s4,0x80
ffffffffc02023c4:	0009b703          	ld	a4,0(s3)
ffffffffc02023c8:	40a48533          	sub	a0,s1,a0
ffffffffc02023cc:	8519                	srai	a0,a0,0x6
ffffffffc02023ce:	9552                	add	a0,a0,s4
ffffffffc02023d0:	00c51793          	slli	a5,a0,0xc
ffffffffc02023d4:	4685                	li	a3,1
ffffffffc02023d6:	c094                	sw	a3,0(s1)
ffffffffc02023d8:	83b1                	srli	a5,a5,0xc
ffffffffc02023da:	0532                	slli	a0,a0,0xc
ffffffffc02023dc:	0ee7f163          	bgeu	a5,a4,ffffffffc02024be <get_pte+0x20e>
ffffffffc02023e0:	000ab783          	ld	a5,0(s5)
ffffffffc02023e4:	6605                	lui	a2,0x1
ffffffffc02023e6:	4581                	li	a1,0
ffffffffc02023e8:	953e                	add	a0,a0,a5
ffffffffc02023ea:	740090ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc02023ee:	000b3683          	ld	a3,0(s6)
ffffffffc02023f2:	40d486b3          	sub	a3,s1,a3
ffffffffc02023f6:	8699                	srai	a3,a3,0x6
ffffffffc02023f8:	96d2                	add	a3,a3,s4
ffffffffc02023fa:	06aa                	slli	a3,a3,0xa
ffffffffc02023fc:	0116e693          	ori	a3,a3,17
ffffffffc0202400:	e014                	sd	a3,0(s0)
ffffffffc0202402:	0009b703          	ld	a4,0(s3)
ffffffffc0202406:	068a                	slli	a3,a3,0x2
ffffffffc0202408:	757d                	lui	a0,0xfffff
ffffffffc020240a:	8ee9                	and	a3,a3,a0
ffffffffc020240c:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202410:	06e7f263          	bgeu	a5,a4,ffffffffc0202474 <get_pte+0x1c4>
ffffffffc0202414:	000ab503          	ld	a0,0(s5)
ffffffffc0202418:	00c95913          	srli	s2,s2,0xc
ffffffffc020241c:	1ff97913          	andi	s2,s2,511
ffffffffc0202420:	96aa                	add	a3,a3,a0
ffffffffc0202422:	00391513          	slli	a0,s2,0x3
ffffffffc0202426:	9536                	add	a0,a0,a3
ffffffffc0202428:	70e2                	ld	ra,56(sp)
ffffffffc020242a:	7442                	ld	s0,48(sp)
ffffffffc020242c:	74a2                	ld	s1,40(sp)
ffffffffc020242e:	7902                	ld	s2,32(sp)
ffffffffc0202430:	69e2                	ld	s3,24(sp)
ffffffffc0202432:	6a42                	ld	s4,16(sp)
ffffffffc0202434:	6aa2                	ld	s5,8(sp)
ffffffffc0202436:	6b02                	ld	s6,0(sp)
ffffffffc0202438:	6121                	addi	sp,sp,64
ffffffffc020243a:	8082                	ret
ffffffffc020243c:	4501                	li	a0,0
ffffffffc020243e:	b7ed                	j	ffffffffc0202428 <get_pte+0x178>
ffffffffc0202440:	833fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202444:	00094797          	auipc	a5,0x94
ffffffffc0202448:	49c7b783          	ld	a5,1180(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc020244c:	6f9c                	ld	a5,24(a5)
ffffffffc020244e:	4505                	li	a0,1
ffffffffc0202450:	9782                	jalr	a5
ffffffffc0202452:	842a                	mv	s0,a0
ffffffffc0202454:	819fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202458:	b56d                	j	ffffffffc0202302 <get_pte+0x52>
ffffffffc020245a:	819fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020245e:	00094797          	auipc	a5,0x94
ffffffffc0202462:	4827b783          	ld	a5,1154(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc0202466:	6f9c                	ld	a5,24(a5)
ffffffffc0202468:	4505                	li	a0,1
ffffffffc020246a:	9782                	jalr	a5
ffffffffc020246c:	84aa                	mv	s1,a0
ffffffffc020246e:	ffefe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202472:	b781                	j	ffffffffc02023b2 <get_pte+0x102>
ffffffffc0202474:	0000a617          	auipc	a2,0xa
ffffffffc0202478:	6bc60613          	addi	a2,a2,1724 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc020247c:	13200593          	li	a1,306
ffffffffc0202480:	0000a517          	auipc	a0,0xa
ffffffffc0202484:	7c850513          	addi	a0,a0,1992 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0202488:	816fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020248c:	0000a617          	auipc	a2,0xa
ffffffffc0202490:	6a460613          	addi	a2,a2,1700 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc0202494:	12500593          	li	a1,293
ffffffffc0202498:	0000a517          	auipc	a0,0xa
ffffffffc020249c:	7b050513          	addi	a0,a0,1968 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02024a0:	ffffd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02024a4:	86aa                	mv	a3,a0
ffffffffc02024a6:	0000a617          	auipc	a2,0xa
ffffffffc02024aa:	68a60613          	addi	a2,a2,1674 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc02024ae:	12100593          	li	a1,289
ffffffffc02024b2:	0000a517          	auipc	a0,0xa
ffffffffc02024b6:	79650513          	addi	a0,a0,1942 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02024ba:	fe5fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02024be:	86aa                	mv	a3,a0
ffffffffc02024c0:	0000a617          	auipc	a2,0xa
ffffffffc02024c4:	67060613          	addi	a2,a2,1648 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc02024c8:	12f00593          	li	a1,303
ffffffffc02024cc:	0000a517          	auipc	a0,0xa
ffffffffc02024d0:	77c50513          	addi	a0,a0,1916 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02024d4:	fcbfd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02024d8 <boot_map_segment>:
ffffffffc02024d8:	6785                	lui	a5,0x1
ffffffffc02024da:	7139                	addi	sp,sp,-64
ffffffffc02024dc:	00d5c833          	xor	a6,a1,a3
ffffffffc02024e0:	17fd                	addi	a5,a5,-1
ffffffffc02024e2:	fc06                	sd	ra,56(sp)
ffffffffc02024e4:	f822                	sd	s0,48(sp)
ffffffffc02024e6:	f426                	sd	s1,40(sp)
ffffffffc02024e8:	f04a                	sd	s2,32(sp)
ffffffffc02024ea:	ec4e                	sd	s3,24(sp)
ffffffffc02024ec:	e852                	sd	s4,16(sp)
ffffffffc02024ee:	e456                	sd	s5,8(sp)
ffffffffc02024f0:	00f87833          	and	a6,a6,a5
ffffffffc02024f4:	08081563          	bnez	a6,ffffffffc020257e <boot_map_segment+0xa6>
ffffffffc02024f8:	00f5f4b3          	and	s1,a1,a5
ffffffffc02024fc:	963e                	add	a2,a2,a5
ffffffffc02024fe:	94b2                	add	s1,s1,a2
ffffffffc0202500:	797d                	lui	s2,0xfffff
ffffffffc0202502:	80b1                	srli	s1,s1,0xc
ffffffffc0202504:	0125f5b3          	and	a1,a1,s2
ffffffffc0202508:	0126f6b3          	and	a3,a3,s2
ffffffffc020250c:	c0a1                	beqz	s1,ffffffffc020254c <boot_map_segment+0x74>
ffffffffc020250e:	00176713          	ori	a4,a4,1
ffffffffc0202512:	04b2                	slli	s1,s1,0xc
ffffffffc0202514:	02071993          	slli	s3,a4,0x20
ffffffffc0202518:	8a2a                	mv	s4,a0
ffffffffc020251a:	842e                	mv	s0,a1
ffffffffc020251c:	94ae                	add	s1,s1,a1
ffffffffc020251e:	40b68933          	sub	s2,a3,a1
ffffffffc0202522:	0209d993          	srli	s3,s3,0x20
ffffffffc0202526:	6a85                	lui	s5,0x1
ffffffffc0202528:	4605                	li	a2,1
ffffffffc020252a:	85a2                	mv	a1,s0
ffffffffc020252c:	8552                	mv	a0,s4
ffffffffc020252e:	d83ff0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc0202532:	008907b3          	add	a5,s2,s0
ffffffffc0202536:	c505                	beqz	a0,ffffffffc020255e <boot_map_segment+0x86>
ffffffffc0202538:	83b1                	srli	a5,a5,0xc
ffffffffc020253a:	07aa                	slli	a5,a5,0xa
ffffffffc020253c:	0137e7b3          	or	a5,a5,s3
ffffffffc0202540:	0017e793          	ori	a5,a5,1
ffffffffc0202544:	e11c                	sd	a5,0(a0)
ffffffffc0202546:	9456                	add	s0,s0,s5
ffffffffc0202548:	fe8490e3          	bne	s1,s0,ffffffffc0202528 <boot_map_segment+0x50>
ffffffffc020254c:	70e2                	ld	ra,56(sp)
ffffffffc020254e:	7442                	ld	s0,48(sp)
ffffffffc0202550:	74a2                	ld	s1,40(sp)
ffffffffc0202552:	7902                	ld	s2,32(sp)
ffffffffc0202554:	69e2                	ld	s3,24(sp)
ffffffffc0202556:	6a42                	ld	s4,16(sp)
ffffffffc0202558:	6aa2                	ld	s5,8(sp)
ffffffffc020255a:	6121                	addi	sp,sp,64
ffffffffc020255c:	8082                	ret
ffffffffc020255e:	0000a697          	auipc	a3,0xa
ffffffffc0202562:	71268693          	addi	a3,a3,1810 # ffffffffc020cc70 <default_pmm_manager+0x178>
ffffffffc0202566:	0000a617          	auipc	a2,0xa
ffffffffc020256a:	aaa60613          	addi	a2,a2,-1366 # ffffffffc020c010 <commands+0x210>
ffffffffc020256e:	09c00593          	li	a1,156
ffffffffc0202572:	0000a517          	auipc	a0,0xa
ffffffffc0202576:	6d650513          	addi	a0,a0,1750 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020257a:	f25fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020257e:	0000a697          	auipc	a3,0xa
ffffffffc0202582:	6da68693          	addi	a3,a3,1754 # ffffffffc020cc58 <default_pmm_manager+0x160>
ffffffffc0202586:	0000a617          	auipc	a2,0xa
ffffffffc020258a:	a8a60613          	addi	a2,a2,-1398 # ffffffffc020c010 <commands+0x210>
ffffffffc020258e:	09500593          	li	a1,149
ffffffffc0202592:	0000a517          	auipc	a0,0xa
ffffffffc0202596:	6b650513          	addi	a0,a0,1718 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020259a:	f05fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020259e <get_page>:
ffffffffc020259e:	1141                	addi	sp,sp,-16
ffffffffc02025a0:	e022                	sd	s0,0(sp)
ffffffffc02025a2:	8432                	mv	s0,a2
ffffffffc02025a4:	4601                	li	a2,0
ffffffffc02025a6:	e406                	sd	ra,8(sp)
ffffffffc02025a8:	d09ff0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc02025ac:	c011                	beqz	s0,ffffffffc02025b0 <get_page+0x12>
ffffffffc02025ae:	e008                	sd	a0,0(s0)
ffffffffc02025b0:	c511                	beqz	a0,ffffffffc02025bc <get_page+0x1e>
ffffffffc02025b2:	611c                	ld	a5,0(a0)
ffffffffc02025b4:	4501                	li	a0,0
ffffffffc02025b6:	0017f713          	andi	a4,a5,1
ffffffffc02025ba:	e709                	bnez	a4,ffffffffc02025c4 <get_page+0x26>
ffffffffc02025bc:	60a2                	ld	ra,8(sp)
ffffffffc02025be:	6402                	ld	s0,0(sp)
ffffffffc02025c0:	0141                	addi	sp,sp,16
ffffffffc02025c2:	8082                	ret
ffffffffc02025c4:	078a                	slli	a5,a5,0x2
ffffffffc02025c6:	83b1                	srli	a5,a5,0xc
ffffffffc02025c8:	00094717          	auipc	a4,0x94
ffffffffc02025cc:	30873703          	ld	a4,776(a4) # ffffffffc02968d0 <npage>
ffffffffc02025d0:	00e7ff63          	bgeu	a5,a4,ffffffffc02025ee <get_page+0x50>
ffffffffc02025d4:	60a2                	ld	ra,8(sp)
ffffffffc02025d6:	6402                	ld	s0,0(sp)
ffffffffc02025d8:	fff80537          	lui	a0,0xfff80
ffffffffc02025dc:	97aa                	add	a5,a5,a0
ffffffffc02025de:	079a                	slli	a5,a5,0x6
ffffffffc02025e0:	00094517          	auipc	a0,0x94
ffffffffc02025e4:	2f853503          	ld	a0,760(a0) # ffffffffc02968d8 <pages>
ffffffffc02025e8:	953e                	add	a0,a0,a5
ffffffffc02025ea:	0141                	addi	sp,sp,16
ffffffffc02025ec:	8082                	ret
ffffffffc02025ee:	bd3ff0ef          	jal	ra,ffffffffc02021c0 <pa2page.part.0>

ffffffffc02025f2 <unmap_range>:
ffffffffc02025f2:	7159                	addi	sp,sp,-112
ffffffffc02025f4:	00c5e7b3          	or	a5,a1,a2
ffffffffc02025f8:	f486                	sd	ra,104(sp)
ffffffffc02025fa:	f0a2                	sd	s0,96(sp)
ffffffffc02025fc:	eca6                	sd	s1,88(sp)
ffffffffc02025fe:	e8ca                	sd	s2,80(sp)
ffffffffc0202600:	e4ce                	sd	s3,72(sp)
ffffffffc0202602:	e0d2                	sd	s4,64(sp)
ffffffffc0202604:	fc56                	sd	s5,56(sp)
ffffffffc0202606:	f85a                	sd	s6,48(sp)
ffffffffc0202608:	f45e                	sd	s7,40(sp)
ffffffffc020260a:	f062                	sd	s8,32(sp)
ffffffffc020260c:	ec66                	sd	s9,24(sp)
ffffffffc020260e:	e86a                	sd	s10,16(sp)
ffffffffc0202610:	17d2                	slli	a5,a5,0x34
ffffffffc0202612:	e3ed                	bnez	a5,ffffffffc02026f4 <unmap_range+0x102>
ffffffffc0202614:	002007b7          	lui	a5,0x200
ffffffffc0202618:	842e                	mv	s0,a1
ffffffffc020261a:	0ef5ed63          	bltu	a1,a5,ffffffffc0202714 <unmap_range+0x122>
ffffffffc020261e:	8932                	mv	s2,a2
ffffffffc0202620:	0ec5fa63          	bgeu	a1,a2,ffffffffc0202714 <unmap_range+0x122>
ffffffffc0202624:	4785                	li	a5,1
ffffffffc0202626:	07fe                	slli	a5,a5,0x1f
ffffffffc0202628:	0ec7e663          	bltu	a5,a2,ffffffffc0202714 <unmap_range+0x122>
ffffffffc020262c:	89aa                	mv	s3,a0
ffffffffc020262e:	6a05                	lui	s4,0x1
ffffffffc0202630:	00094c97          	auipc	s9,0x94
ffffffffc0202634:	2a0c8c93          	addi	s9,s9,672 # ffffffffc02968d0 <npage>
ffffffffc0202638:	00094c17          	auipc	s8,0x94
ffffffffc020263c:	2a0c0c13          	addi	s8,s8,672 # ffffffffc02968d8 <pages>
ffffffffc0202640:	fff80bb7          	lui	s7,0xfff80
ffffffffc0202644:	00094d17          	auipc	s10,0x94
ffffffffc0202648:	29cd0d13          	addi	s10,s10,668 # ffffffffc02968e0 <pmm_manager>
ffffffffc020264c:	00200b37          	lui	s6,0x200
ffffffffc0202650:	ffe00ab7          	lui	s5,0xffe00
ffffffffc0202654:	4601                	li	a2,0
ffffffffc0202656:	85a2                	mv	a1,s0
ffffffffc0202658:	854e                	mv	a0,s3
ffffffffc020265a:	c57ff0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc020265e:	84aa                	mv	s1,a0
ffffffffc0202660:	cd29                	beqz	a0,ffffffffc02026ba <unmap_range+0xc8>
ffffffffc0202662:	611c                	ld	a5,0(a0)
ffffffffc0202664:	e395                	bnez	a5,ffffffffc0202688 <unmap_range+0x96>
ffffffffc0202666:	9452                	add	s0,s0,s4
ffffffffc0202668:	ff2466e3          	bltu	s0,s2,ffffffffc0202654 <unmap_range+0x62>
ffffffffc020266c:	70a6                	ld	ra,104(sp)
ffffffffc020266e:	7406                	ld	s0,96(sp)
ffffffffc0202670:	64e6                	ld	s1,88(sp)
ffffffffc0202672:	6946                	ld	s2,80(sp)
ffffffffc0202674:	69a6                	ld	s3,72(sp)
ffffffffc0202676:	6a06                	ld	s4,64(sp)
ffffffffc0202678:	7ae2                	ld	s5,56(sp)
ffffffffc020267a:	7b42                	ld	s6,48(sp)
ffffffffc020267c:	7ba2                	ld	s7,40(sp)
ffffffffc020267e:	7c02                	ld	s8,32(sp)
ffffffffc0202680:	6ce2                	ld	s9,24(sp)
ffffffffc0202682:	6d42                	ld	s10,16(sp)
ffffffffc0202684:	6165                	addi	sp,sp,112
ffffffffc0202686:	8082                	ret
ffffffffc0202688:	0017f713          	andi	a4,a5,1
ffffffffc020268c:	df69                	beqz	a4,ffffffffc0202666 <unmap_range+0x74>
ffffffffc020268e:	000cb703          	ld	a4,0(s9)
ffffffffc0202692:	078a                	slli	a5,a5,0x2
ffffffffc0202694:	83b1                	srli	a5,a5,0xc
ffffffffc0202696:	08e7ff63          	bgeu	a5,a4,ffffffffc0202734 <unmap_range+0x142>
ffffffffc020269a:	000c3503          	ld	a0,0(s8)
ffffffffc020269e:	97de                	add	a5,a5,s7
ffffffffc02026a0:	079a                	slli	a5,a5,0x6
ffffffffc02026a2:	953e                	add	a0,a0,a5
ffffffffc02026a4:	411c                	lw	a5,0(a0)
ffffffffc02026a6:	fff7871b          	addiw	a4,a5,-1
ffffffffc02026aa:	c118                	sw	a4,0(a0)
ffffffffc02026ac:	cf11                	beqz	a4,ffffffffc02026c8 <unmap_range+0xd6>
ffffffffc02026ae:	0004b023          	sd	zero,0(s1)
ffffffffc02026b2:	12040073          	sfence.vma	s0
ffffffffc02026b6:	9452                	add	s0,s0,s4
ffffffffc02026b8:	bf45                	j	ffffffffc0202668 <unmap_range+0x76>
ffffffffc02026ba:	945a                	add	s0,s0,s6
ffffffffc02026bc:	01547433          	and	s0,s0,s5
ffffffffc02026c0:	d455                	beqz	s0,ffffffffc020266c <unmap_range+0x7a>
ffffffffc02026c2:	f92469e3          	bltu	s0,s2,ffffffffc0202654 <unmap_range+0x62>
ffffffffc02026c6:	b75d                	j	ffffffffc020266c <unmap_range+0x7a>
ffffffffc02026c8:	100027f3          	csrr	a5,sstatus
ffffffffc02026cc:	8b89                	andi	a5,a5,2
ffffffffc02026ce:	e799                	bnez	a5,ffffffffc02026dc <unmap_range+0xea>
ffffffffc02026d0:	000d3783          	ld	a5,0(s10)
ffffffffc02026d4:	4585                	li	a1,1
ffffffffc02026d6:	739c                	ld	a5,32(a5)
ffffffffc02026d8:	9782                	jalr	a5
ffffffffc02026da:	bfd1                	j	ffffffffc02026ae <unmap_range+0xbc>
ffffffffc02026dc:	e42a                	sd	a0,8(sp)
ffffffffc02026de:	d94fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02026e2:	000d3783          	ld	a5,0(s10)
ffffffffc02026e6:	6522                	ld	a0,8(sp)
ffffffffc02026e8:	4585                	li	a1,1
ffffffffc02026ea:	739c                	ld	a5,32(a5)
ffffffffc02026ec:	9782                	jalr	a5
ffffffffc02026ee:	d7efe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02026f2:	bf75                	j	ffffffffc02026ae <unmap_range+0xbc>
ffffffffc02026f4:	0000a697          	auipc	a3,0xa
ffffffffc02026f8:	58c68693          	addi	a3,a3,1420 # ffffffffc020cc80 <default_pmm_manager+0x188>
ffffffffc02026fc:	0000a617          	auipc	a2,0xa
ffffffffc0202700:	91460613          	addi	a2,a2,-1772 # ffffffffc020c010 <commands+0x210>
ffffffffc0202704:	15a00593          	li	a1,346
ffffffffc0202708:	0000a517          	auipc	a0,0xa
ffffffffc020270c:	54050513          	addi	a0,a0,1344 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0202710:	d8ffd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202714:	0000a697          	auipc	a3,0xa
ffffffffc0202718:	59c68693          	addi	a3,a3,1436 # ffffffffc020ccb0 <default_pmm_manager+0x1b8>
ffffffffc020271c:	0000a617          	auipc	a2,0xa
ffffffffc0202720:	8f460613          	addi	a2,a2,-1804 # ffffffffc020c010 <commands+0x210>
ffffffffc0202724:	15b00593          	li	a1,347
ffffffffc0202728:	0000a517          	auipc	a0,0xa
ffffffffc020272c:	52050513          	addi	a0,a0,1312 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0202730:	d6ffd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202734:	a8dff0ef          	jal	ra,ffffffffc02021c0 <pa2page.part.0>

ffffffffc0202738 <exit_range>:
ffffffffc0202738:	7119                	addi	sp,sp,-128
ffffffffc020273a:	00c5e7b3          	or	a5,a1,a2
ffffffffc020273e:	fc86                	sd	ra,120(sp)
ffffffffc0202740:	f8a2                	sd	s0,112(sp)
ffffffffc0202742:	f4a6                	sd	s1,104(sp)
ffffffffc0202744:	f0ca                	sd	s2,96(sp)
ffffffffc0202746:	ecce                	sd	s3,88(sp)
ffffffffc0202748:	e8d2                	sd	s4,80(sp)
ffffffffc020274a:	e4d6                	sd	s5,72(sp)
ffffffffc020274c:	e0da                	sd	s6,64(sp)
ffffffffc020274e:	fc5e                	sd	s7,56(sp)
ffffffffc0202750:	f862                	sd	s8,48(sp)
ffffffffc0202752:	f466                	sd	s9,40(sp)
ffffffffc0202754:	f06a                	sd	s10,32(sp)
ffffffffc0202756:	ec6e                	sd	s11,24(sp)
ffffffffc0202758:	17d2                	slli	a5,a5,0x34
ffffffffc020275a:	20079a63          	bnez	a5,ffffffffc020296e <exit_range+0x236>
ffffffffc020275e:	002007b7          	lui	a5,0x200
ffffffffc0202762:	24f5e463          	bltu	a1,a5,ffffffffc02029aa <exit_range+0x272>
ffffffffc0202766:	8ab2                	mv	s5,a2
ffffffffc0202768:	24c5f163          	bgeu	a1,a2,ffffffffc02029aa <exit_range+0x272>
ffffffffc020276c:	4785                	li	a5,1
ffffffffc020276e:	07fe                	slli	a5,a5,0x1f
ffffffffc0202770:	22c7ed63          	bltu	a5,a2,ffffffffc02029aa <exit_range+0x272>
ffffffffc0202774:	c00009b7          	lui	s3,0xc0000
ffffffffc0202778:	0135f9b3          	and	s3,a1,s3
ffffffffc020277c:	ffe00937          	lui	s2,0xffe00
ffffffffc0202780:	400007b7          	lui	a5,0x40000
ffffffffc0202784:	5cfd                	li	s9,-1
ffffffffc0202786:	8c2a                	mv	s8,a0
ffffffffc0202788:	0125f933          	and	s2,a1,s2
ffffffffc020278c:	99be                	add	s3,s3,a5
ffffffffc020278e:	00094d17          	auipc	s10,0x94
ffffffffc0202792:	142d0d13          	addi	s10,s10,322 # ffffffffc02968d0 <npage>
ffffffffc0202796:	00ccdc93          	srli	s9,s9,0xc
ffffffffc020279a:	00094717          	auipc	a4,0x94
ffffffffc020279e:	13e70713          	addi	a4,a4,318 # ffffffffc02968d8 <pages>
ffffffffc02027a2:	00094d97          	auipc	s11,0x94
ffffffffc02027a6:	13ed8d93          	addi	s11,s11,318 # ffffffffc02968e0 <pmm_manager>
ffffffffc02027aa:	c0000437          	lui	s0,0xc0000
ffffffffc02027ae:	944e                	add	s0,s0,s3
ffffffffc02027b0:	8079                	srli	s0,s0,0x1e
ffffffffc02027b2:	1ff47413          	andi	s0,s0,511
ffffffffc02027b6:	040e                	slli	s0,s0,0x3
ffffffffc02027b8:	9462                	add	s0,s0,s8
ffffffffc02027ba:	00043a03          	ld	s4,0(s0) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc02027be:	001a7793          	andi	a5,s4,1
ffffffffc02027c2:	eb99                	bnez	a5,ffffffffc02027d8 <exit_range+0xa0>
ffffffffc02027c4:	12098463          	beqz	s3,ffffffffc02028ec <exit_range+0x1b4>
ffffffffc02027c8:	400007b7          	lui	a5,0x40000
ffffffffc02027cc:	97ce                	add	a5,a5,s3
ffffffffc02027ce:	894e                	mv	s2,s3
ffffffffc02027d0:	1159fe63          	bgeu	s3,s5,ffffffffc02028ec <exit_range+0x1b4>
ffffffffc02027d4:	89be                	mv	s3,a5
ffffffffc02027d6:	bfd1                	j	ffffffffc02027aa <exit_range+0x72>
ffffffffc02027d8:	000d3783          	ld	a5,0(s10)
ffffffffc02027dc:	0a0a                	slli	s4,s4,0x2
ffffffffc02027de:	00ca5a13          	srli	s4,s4,0xc
ffffffffc02027e2:	1cfa7263          	bgeu	s4,a5,ffffffffc02029a6 <exit_range+0x26e>
ffffffffc02027e6:	fff80637          	lui	a2,0xfff80
ffffffffc02027ea:	9652                	add	a2,a2,s4
ffffffffc02027ec:	000806b7          	lui	a3,0x80
ffffffffc02027f0:	96b2                	add	a3,a3,a2
ffffffffc02027f2:	0196f5b3          	and	a1,a3,s9
ffffffffc02027f6:	061a                	slli	a2,a2,0x6
ffffffffc02027f8:	06b2                	slli	a3,a3,0xc
ffffffffc02027fa:	18f5fa63          	bgeu	a1,a5,ffffffffc020298e <exit_range+0x256>
ffffffffc02027fe:	00094817          	auipc	a6,0x94
ffffffffc0202802:	0ea80813          	addi	a6,a6,234 # ffffffffc02968e8 <va_pa_offset>
ffffffffc0202806:	00083b03          	ld	s6,0(a6)
ffffffffc020280a:	4b85                	li	s7,1
ffffffffc020280c:	fff80e37          	lui	t3,0xfff80
ffffffffc0202810:	9b36                	add	s6,s6,a3
ffffffffc0202812:	00080337          	lui	t1,0x80
ffffffffc0202816:	6885                	lui	a7,0x1
ffffffffc0202818:	a819                	j	ffffffffc020282e <exit_range+0xf6>
ffffffffc020281a:	4b81                	li	s7,0
ffffffffc020281c:	002007b7          	lui	a5,0x200
ffffffffc0202820:	993e                	add	s2,s2,a5
ffffffffc0202822:	08090c63          	beqz	s2,ffffffffc02028ba <exit_range+0x182>
ffffffffc0202826:	09397a63          	bgeu	s2,s3,ffffffffc02028ba <exit_range+0x182>
ffffffffc020282a:	0f597063          	bgeu	s2,s5,ffffffffc020290a <exit_range+0x1d2>
ffffffffc020282e:	01595493          	srli	s1,s2,0x15
ffffffffc0202832:	1ff4f493          	andi	s1,s1,511
ffffffffc0202836:	048e                	slli	s1,s1,0x3
ffffffffc0202838:	94da                	add	s1,s1,s6
ffffffffc020283a:	609c                	ld	a5,0(s1)
ffffffffc020283c:	0017f693          	andi	a3,a5,1
ffffffffc0202840:	dee9                	beqz	a3,ffffffffc020281a <exit_range+0xe2>
ffffffffc0202842:	000d3583          	ld	a1,0(s10)
ffffffffc0202846:	078a                	slli	a5,a5,0x2
ffffffffc0202848:	83b1                	srli	a5,a5,0xc
ffffffffc020284a:	14b7fe63          	bgeu	a5,a1,ffffffffc02029a6 <exit_range+0x26e>
ffffffffc020284e:	97f2                	add	a5,a5,t3
ffffffffc0202850:	006786b3          	add	a3,a5,t1
ffffffffc0202854:	0196feb3          	and	t4,a3,s9
ffffffffc0202858:	00679513          	slli	a0,a5,0x6
ffffffffc020285c:	06b2                	slli	a3,a3,0xc
ffffffffc020285e:	12bef863          	bgeu	t4,a1,ffffffffc020298e <exit_range+0x256>
ffffffffc0202862:	00083783          	ld	a5,0(a6)
ffffffffc0202866:	96be                	add	a3,a3,a5
ffffffffc0202868:	011685b3          	add	a1,a3,a7
ffffffffc020286c:	629c                	ld	a5,0(a3)
ffffffffc020286e:	8b85                	andi	a5,a5,1
ffffffffc0202870:	f7d5                	bnez	a5,ffffffffc020281c <exit_range+0xe4>
ffffffffc0202872:	06a1                	addi	a3,a3,8
ffffffffc0202874:	fed59ce3          	bne	a1,a3,ffffffffc020286c <exit_range+0x134>
ffffffffc0202878:	631c                	ld	a5,0(a4)
ffffffffc020287a:	953e                	add	a0,a0,a5
ffffffffc020287c:	100027f3          	csrr	a5,sstatus
ffffffffc0202880:	8b89                	andi	a5,a5,2
ffffffffc0202882:	e7d9                	bnez	a5,ffffffffc0202910 <exit_range+0x1d8>
ffffffffc0202884:	000db783          	ld	a5,0(s11)
ffffffffc0202888:	4585                	li	a1,1
ffffffffc020288a:	e032                	sd	a2,0(sp)
ffffffffc020288c:	739c                	ld	a5,32(a5)
ffffffffc020288e:	9782                	jalr	a5
ffffffffc0202890:	6602                	ld	a2,0(sp)
ffffffffc0202892:	00094817          	auipc	a6,0x94
ffffffffc0202896:	05680813          	addi	a6,a6,86 # ffffffffc02968e8 <va_pa_offset>
ffffffffc020289a:	fff80e37          	lui	t3,0xfff80
ffffffffc020289e:	00080337          	lui	t1,0x80
ffffffffc02028a2:	6885                	lui	a7,0x1
ffffffffc02028a4:	00094717          	auipc	a4,0x94
ffffffffc02028a8:	03470713          	addi	a4,a4,52 # ffffffffc02968d8 <pages>
ffffffffc02028ac:	0004b023          	sd	zero,0(s1)
ffffffffc02028b0:	002007b7          	lui	a5,0x200
ffffffffc02028b4:	993e                	add	s2,s2,a5
ffffffffc02028b6:	f60918e3          	bnez	s2,ffffffffc0202826 <exit_range+0xee>
ffffffffc02028ba:	f00b85e3          	beqz	s7,ffffffffc02027c4 <exit_range+0x8c>
ffffffffc02028be:	000d3783          	ld	a5,0(s10)
ffffffffc02028c2:	0efa7263          	bgeu	s4,a5,ffffffffc02029a6 <exit_range+0x26e>
ffffffffc02028c6:	6308                	ld	a0,0(a4)
ffffffffc02028c8:	9532                	add	a0,a0,a2
ffffffffc02028ca:	100027f3          	csrr	a5,sstatus
ffffffffc02028ce:	8b89                	andi	a5,a5,2
ffffffffc02028d0:	efad                	bnez	a5,ffffffffc020294a <exit_range+0x212>
ffffffffc02028d2:	000db783          	ld	a5,0(s11)
ffffffffc02028d6:	4585                	li	a1,1
ffffffffc02028d8:	739c                	ld	a5,32(a5)
ffffffffc02028da:	9782                	jalr	a5
ffffffffc02028dc:	00094717          	auipc	a4,0x94
ffffffffc02028e0:	ffc70713          	addi	a4,a4,-4 # ffffffffc02968d8 <pages>
ffffffffc02028e4:	00043023          	sd	zero,0(s0)
ffffffffc02028e8:	ee0990e3          	bnez	s3,ffffffffc02027c8 <exit_range+0x90>
ffffffffc02028ec:	70e6                	ld	ra,120(sp)
ffffffffc02028ee:	7446                	ld	s0,112(sp)
ffffffffc02028f0:	74a6                	ld	s1,104(sp)
ffffffffc02028f2:	7906                	ld	s2,96(sp)
ffffffffc02028f4:	69e6                	ld	s3,88(sp)
ffffffffc02028f6:	6a46                	ld	s4,80(sp)
ffffffffc02028f8:	6aa6                	ld	s5,72(sp)
ffffffffc02028fa:	6b06                	ld	s6,64(sp)
ffffffffc02028fc:	7be2                	ld	s7,56(sp)
ffffffffc02028fe:	7c42                	ld	s8,48(sp)
ffffffffc0202900:	7ca2                	ld	s9,40(sp)
ffffffffc0202902:	7d02                	ld	s10,32(sp)
ffffffffc0202904:	6de2                	ld	s11,24(sp)
ffffffffc0202906:	6109                	addi	sp,sp,128
ffffffffc0202908:	8082                	ret
ffffffffc020290a:	ea0b8fe3          	beqz	s7,ffffffffc02027c8 <exit_range+0x90>
ffffffffc020290e:	bf45                	j	ffffffffc02028be <exit_range+0x186>
ffffffffc0202910:	e032                	sd	a2,0(sp)
ffffffffc0202912:	e42a                	sd	a0,8(sp)
ffffffffc0202914:	b5efe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202918:	000db783          	ld	a5,0(s11)
ffffffffc020291c:	6522                	ld	a0,8(sp)
ffffffffc020291e:	4585                	li	a1,1
ffffffffc0202920:	739c                	ld	a5,32(a5)
ffffffffc0202922:	9782                	jalr	a5
ffffffffc0202924:	b48fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202928:	6602                	ld	a2,0(sp)
ffffffffc020292a:	00094717          	auipc	a4,0x94
ffffffffc020292e:	fae70713          	addi	a4,a4,-82 # ffffffffc02968d8 <pages>
ffffffffc0202932:	6885                	lui	a7,0x1
ffffffffc0202934:	00080337          	lui	t1,0x80
ffffffffc0202938:	fff80e37          	lui	t3,0xfff80
ffffffffc020293c:	00094817          	auipc	a6,0x94
ffffffffc0202940:	fac80813          	addi	a6,a6,-84 # ffffffffc02968e8 <va_pa_offset>
ffffffffc0202944:	0004b023          	sd	zero,0(s1)
ffffffffc0202948:	b7a5                	j	ffffffffc02028b0 <exit_range+0x178>
ffffffffc020294a:	e02a                	sd	a0,0(sp)
ffffffffc020294c:	b26fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202950:	000db783          	ld	a5,0(s11)
ffffffffc0202954:	6502                	ld	a0,0(sp)
ffffffffc0202956:	4585                	li	a1,1
ffffffffc0202958:	739c                	ld	a5,32(a5)
ffffffffc020295a:	9782                	jalr	a5
ffffffffc020295c:	b10fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202960:	00094717          	auipc	a4,0x94
ffffffffc0202964:	f7870713          	addi	a4,a4,-136 # ffffffffc02968d8 <pages>
ffffffffc0202968:	00043023          	sd	zero,0(s0)
ffffffffc020296c:	bfb5                	j	ffffffffc02028e8 <exit_range+0x1b0>
ffffffffc020296e:	0000a697          	auipc	a3,0xa
ffffffffc0202972:	31268693          	addi	a3,a3,786 # ffffffffc020cc80 <default_pmm_manager+0x188>
ffffffffc0202976:	00009617          	auipc	a2,0x9
ffffffffc020297a:	69a60613          	addi	a2,a2,1690 # ffffffffc020c010 <commands+0x210>
ffffffffc020297e:	16f00593          	li	a1,367
ffffffffc0202982:	0000a517          	auipc	a0,0xa
ffffffffc0202986:	2c650513          	addi	a0,a0,710 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020298a:	b15fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020298e:	0000a617          	auipc	a2,0xa
ffffffffc0202992:	1a260613          	addi	a2,a2,418 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc0202996:	07100593          	li	a1,113
ffffffffc020299a:	0000a517          	auipc	a0,0xa
ffffffffc020299e:	1be50513          	addi	a0,a0,446 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc02029a2:	afdfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02029a6:	81bff0ef          	jal	ra,ffffffffc02021c0 <pa2page.part.0>
ffffffffc02029aa:	0000a697          	auipc	a3,0xa
ffffffffc02029ae:	30668693          	addi	a3,a3,774 # ffffffffc020ccb0 <default_pmm_manager+0x1b8>
ffffffffc02029b2:	00009617          	auipc	a2,0x9
ffffffffc02029b6:	65e60613          	addi	a2,a2,1630 # ffffffffc020c010 <commands+0x210>
ffffffffc02029ba:	17000593          	li	a1,368
ffffffffc02029be:	0000a517          	auipc	a0,0xa
ffffffffc02029c2:	28a50513          	addi	a0,a0,650 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02029c6:	ad9fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02029ca <page_remove>:
ffffffffc02029ca:	7179                	addi	sp,sp,-48
ffffffffc02029cc:	4601                	li	a2,0
ffffffffc02029ce:	ec26                	sd	s1,24(sp)
ffffffffc02029d0:	f406                	sd	ra,40(sp)
ffffffffc02029d2:	f022                	sd	s0,32(sp)
ffffffffc02029d4:	84ae                	mv	s1,a1
ffffffffc02029d6:	8dbff0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc02029da:	c511                	beqz	a0,ffffffffc02029e6 <page_remove+0x1c>
ffffffffc02029dc:	611c                	ld	a5,0(a0)
ffffffffc02029de:	842a                	mv	s0,a0
ffffffffc02029e0:	0017f713          	andi	a4,a5,1
ffffffffc02029e4:	e711                	bnez	a4,ffffffffc02029f0 <page_remove+0x26>
ffffffffc02029e6:	70a2                	ld	ra,40(sp)
ffffffffc02029e8:	7402                	ld	s0,32(sp)
ffffffffc02029ea:	64e2                	ld	s1,24(sp)
ffffffffc02029ec:	6145                	addi	sp,sp,48
ffffffffc02029ee:	8082                	ret
ffffffffc02029f0:	078a                	slli	a5,a5,0x2
ffffffffc02029f2:	83b1                	srli	a5,a5,0xc
ffffffffc02029f4:	00094717          	auipc	a4,0x94
ffffffffc02029f8:	edc73703          	ld	a4,-292(a4) # ffffffffc02968d0 <npage>
ffffffffc02029fc:	06e7f363          	bgeu	a5,a4,ffffffffc0202a62 <page_remove+0x98>
ffffffffc0202a00:	fff80537          	lui	a0,0xfff80
ffffffffc0202a04:	97aa                	add	a5,a5,a0
ffffffffc0202a06:	079a                	slli	a5,a5,0x6
ffffffffc0202a08:	00094517          	auipc	a0,0x94
ffffffffc0202a0c:	ed053503          	ld	a0,-304(a0) # ffffffffc02968d8 <pages>
ffffffffc0202a10:	953e                	add	a0,a0,a5
ffffffffc0202a12:	411c                	lw	a5,0(a0)
ffffffffc0202a14:	fff7871b          	addiw	a4,a5,-1
ffffffffc0202a18:	c118                	sw	a4,0(a0)
ffffffffc0202a1a:	cb11                	beqz	a4,ffffffffc0202a2e <page_remove+0x64>
ffffffffc0202a1c:	00043023          	sd	zero,0(s0)
ffffffffc0202a20:	12048073          	sfence.vma	s1
ffffffffc0202a24:	70a2                	ld	ra,40(sp)
ffffffffc0202a26:	7402                	ld	s0,32(sp)
ffffffffc0202a28:	64e2                	ld	s1,24(sp)
ffffffffc0202a2a:	6145                	addi	sp,sp,48
ffffffffc0202a2c:	8082                	ret
ffffffffc0202a2e:	100027f3          	csrr	a5,sstatus
ffffffffc0202a32:	8b89                	andi	a5,a5,2
ffffffffc0202a34:	eb89                	bnez	a5,ffffffffc0202a46 <page_remove+0x7c>
ffffffffc0202a36:	00094797          	auipc	a5,0x94
ffffffffc0202a3a:	eaa7b783          	ld	a5,-342(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc0202a3e:	739c                	ld	a5,32(a5)
ffffffffc0202a40:	4585                	li	a1,1
ffffffffc0202a42:	9782                	jalr	a5
ffffffffc0202a44:	bfe1                	j	ffffffffc0202a1c <page_remove+0x52>
ffffffffc0202a46:	e42a                	sd	a0,8(sp)
ffffffffc0202a48:	a2afe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202a4c:	00094797          	auipc	a5,0x94
ffffffffc0202a50:	e947b783          	ld	a5,-364(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc0202a54:	739c                	ld	a5,32(a5)
ffffffffc0202a56:	6522                	ld	a0,8(sp)
ffffffffc0202a58:	4585                	li	a1,1
ffffffffc0202a5a:	9782                	jalr	a5
ffffffffc0202a5c:	a10fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202a60:	bf75                	j	ffffffffc0202a1c <page_remove+0x52>
ffffffffc0202a62:	f5eff0ef          	jal	ra,ffffffffc02021c0 <pa2page.part.0>

ffffffffc0202a66 <page_insert>:
ffffffffc0202a66:	7139                	addi	sp,sp,-64
ffffffffc0202a68:	e852                	sd	s4,16(sp)
ffffffffc0202a6a:	8a32                	mv	s4,a2
ffffffffc0202a6c:	f822                	sd	s0,48(sp)
ffffffffc0202a6e:	4605                	li	a2,1
ffffffffc0202a70:	842e                	mv	s0,a1
ffffffffc0202a72:	85d2                	mv	a1,s4
ffffffffc0202a74:	f426                	sd	s1,40(sp)
ffffffffc0202a76:	fc06                	sd	ra,56(sp)
ffffffffc0202a78:	f04a                	sd	s2,32(sp)
ffffffffc0202a7a:	ec4e                	sd	s3,24(sp)
ffffffffc0202a7c:	e456                	sd	s5,8(sp)
ffffffffc0202a7e:	84b6                	mv	s1,a3
ffffffffc0202a80:	831ff0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc0202a84:	c961                	beqz	a0,ffffffffc0202b54 <page_insert+0xee>
ffffffffc0202a86:	4014                	lw	a3,0(s0)
ffffffffc0202a88:	611c                	ld	a5,0(a0)
ffffffffc0202a8a:	89aa                	mv	s3,a0
ffffffffc0202a8c:	0016871b          	addiw	a4,a3,1
ffffffffc0202a90:	c018                	sw	a4,0(s0)
ffffffffc0202a92:	0017f713          	andi	a4,a5,1
ffffffffc0202a96:	ef05                	bnez	a4,ffffffffc0202ace <page_insert+0x68>
ffffffffc0202a98:	00094717          	auipc	a4,0x94
ffffffffc0202a9c:	e4073703          	ld	a4,-448(a4) # ffffffffc02968d8 <pages>
ffffffffc0202aa0:	8c19                	sub	s0,s0,a4
ffffffffc0202aa2:	000807b7          	lui	a5,0x80
ffffffffc0202aa6:	8419                	srai	s0,s0,0x6
ffffffffc0202aa8:	943e                	add	s0,s0,a5
ffffffffc0202aaa:	042a                	slli	s0,s0,0xa
ffffffffc0202aac:	8cc1                	or	s1,s1,s0
ffffffffc0202aae:	0014e493          	ori	s1,s1,1
ffffffffc0202ab2:	0099b023          	sd	s1,0(s3) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202ab6:	120a0073          	sfence.vma	s4
ffffffffc0202aba:	4501                	li	a0,0
ffffffffc0202abc:	70e2                	ld	ra,56(sp)
ffffffffc0202abe:	7442                	ld	s0,48(sp)
ffffffffc0202ac0:	74a2                	ld	s1,40(sp)
ffffffffc0202ac2:	7902                	ld	s2,32(sp)
ffffffffc0202ac4:	69e2                	ld	s3,24(sp)
ffffffffc0202ac6:	6a42                	ld	s4,16(sp)
ffffffffc0202ac8:	6aa2                	ld	s5,8(sp)
ffffffffc0202aca:	6121                	addi	sp,sp,64
ffffffffc0202acc:	8082                	ret
ffffffffc0202ace:	078a                	slli	a5,a5,0x2
ffffffffc0202ad0:	83b1                	srli	a5,a5,0xc
ffffffffc0202ad2:	00094717          	auipc	a4,0x94
ffffffffc0202ad6:	dfe73703          	ld	a4,-514(a4) # ffffffffc02968d0 <npage>
ffffffffc0202ada:	06e7ff63          	bgeu	a5,a4,ffffffffc0202b58 <page_insert+0xf2>
ffffffffc0202ade:	00094a97          	auipc	s5,0x94
ffffffffc0202ae2:	dfaa8a93          	addi	s5,s5,-518 # ffffffffc02968d8 <pages>
ffffffffc0202ae6:	000ab703          	ld	a4,0(s5)
ffffffffc0202aea:	fff80937          	lui	s2,0xfff80
ffffffffc0202aee:	993e                	add	s2,s2,a5
ffffffffc0202af0:	091a                	slli	s2,s2,0x6
ffffffffc0202af2:	993a                	add	s2,s2,a4
ffffffffc0202af4:	01240c63          	beq	s0,s2,ffffffffc0202b0c <page_insert+0xa6>
ffffffffc0202af8:	00092783          	lw	a5,0(s2) # fffffffffff80000 <end+0x3fce96c0>
ffffffffc0202afc:	fff7869b          	addiw	a3,a5,-1
ffffffffc0202b00:	00d92023          	sw	a3,0(s2)
ffffffffc0202b04:	c691                	beqz	a3,ffffffffc0202b10 <page_insert+0xaa>
ffffffffc0202b06:	120a0073          	sfence.vma	s4
ffffffffc0202b0a:	bf59                	j	ffffffffc0202aa0 <page_insert+0x3a>
ffffffffc0202b0c:	c014                	sw	a3,0(s0)
ffffffffc0202b0e:	bf49                	j	ffffffffc0202aa0 <page_insert+0x3a>
ffffffffc0202b10:	100027f3          	csrr	a5,sstatus
ffffffffc0202b14:	8b89                	andi	a5,a5,2
ffffffffc0202b16:	ef91                	bnez	a5,ffffffffc0202b32 <page_insert+0xcc>
ffffffffc0202b18:	00094797          	auipc	a5,0x94
ffffffffc0202b1c:	dc87b783          	ld	a5,-568(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc0202b20:	739c                	ld	a5,32(a5)
ffffffffc0202b22:	4585                	li	a1,1
ffffffffc0202b24:	854a                	mv	a0,s2
ffffffffc0202b26:	9782                	jalr	a5
ffffffffc0202b28:	000ab703          	ld	a4,0(s5)
ffffffffc0202b2c:	120a0073          	sfence.vma	s4
ffffffffc0202b30:	bf85                	j	ffffffffc0202aa0 <page_insert+0x3a>
ffffffffc0202b32:	940fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202b36:	00094797          	auipc	a5,0x94
ffffffffc0202b3a:	daa7b783          	ld	a5,-598(a5) # ffffffffc02968e0 <pmm_manager>
ffffffffc0202b3e:	739c                	ld	a5,32(a5)
ffffffffc0202b40:	4585                	li	a1,1
ffffffffc0202b42:	854a                	mv	a0,s2
ffffffffc0202b44:	9782                	jalr	a5
ffffffffc0202b46:	926fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202b4a:	000ab703          	ld	a4,0(s5)
ffffffffc0202b4e:	120a0073          	sfence.vma	s4
ffffffffc0202b52:	b7b9                	j	ffffffffc0202aa0 <page_insert+0x3a>
ffffffffc0202b54:	5571                	li	a0,-4
ffffffffc0202b56:	b79d                	j	ffffffffc0202abc <page_insert+0x56>
ffffffffc0202b58:	e68ff0ef          	jal	ra,ffffffffc02021c0 <pa2page.part.0>

ffffffffc0202b5c <pmm_init>:
ffffffffc0202b5c:	0000a797          	auipc	a5,0xa
ffffffffc0202b60:	f9c78793          	addi	a5,a5,-100 # ffffffffc020caf8 <default_pmm_manager>
ffffffffc0202b64:	638c                	ld	a1,0(a5)
ffffffffc0202b66:	7159                	addi	sp,sp,-112
ffffffffc0202b68:	f85a                	sd	s6,48(sp)
ffffffffc0202b6a:	0000a517          	auipc	a0,0xa
ffffffffc0202b6e:	15e50513          	addi	a0,a0,350 # ffffffffc020ccc8 <default_pmm_manager+0x1d0>
ffffffffc0202b72:	00094b17          	auipc	s6,0x94
ffffffffc0202b76:	d6eb0b13          	addi	s6,s6,-658 # ffffffffc02968e0 <pmm_manager>
ffffffffc0202b7a:	f486                	sd	ra,104(sp)
ffffffffc0202b7c:	e8ca                	sd	s2,80(sp)
ffffffffc0202b7e:	e4ce                	sd	s3,72(sp)
ffffffffc0202b80:	f0a2                	sd	s0,96(sp)
ffffffffc0202b82:	eca6                	sd	s1,88(sp)
ffffffffc0202b84:	e0d2                	sd	s4,64(sp)
ffffffffc0202b86:	fc56                	sd	s5,56(sp)
ffffffffc0202b88:	f45e                	sd	s7,40(sp)
ffffffffc0202b8a:	f062                	sd	s8,32(sp)
ffffffffc0202b8c:	ec66                	sd	s9,24(sp)
ffffffffc0202b8e:	00fb3023          	sd	a5,0(s6)
ffffffffc0202b92:	e14fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b96:	000b3783          	ld	a5,0(s6)
ffffffffc0202b9a:	00094997          	auipc	s3,0x94
ffffffffc0202b9e:	d4e98993          	addi	s3,s3,-690 # ffffffffc02968e8 <va_pa_offset>
ffffffffc0202ba2:	679c                	ld	a5,8(a5)
ffffffffc0202ba4:	9782                	jalr	a5
ffffffffc0202ba6:	57f5                	li	a5,-3
ffffffffc0202ba8:	07fa                	slli	a5,a5,0x1e
ffffffffc0202baa:	00f9b023          	sd	a5,0(s3)
ffffffffc0202bae:	e9bfd0ef          	jal	ra,ffffffffc0200a48 <get_memory_base>
ffffffffc0202bb2:	892a                	mv	s2,a0
ffffffffc0202bb4:	e9ffd0ef          	jal	ra,ffffffffc0200a52 <get_memory_size>
ffffffffc0202bb8:	280504e3          	beqz	a0,ffffffffc0203640 <pmm_init+0xae4>
ffffffffc0202bbc:	84aa                	mv	s1,a0
ffffffffc0202bbe:	0000a517          	auipc	a0,0xa
ffffffffc0202bc2:	14250513          	addi	a0,a0,322 # ffffffffc020cd00 <default_pmm_manager+0x208>
ffffffffc0202bc6:	de0fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bca:	00990433          	add	s0,s2,s1
ffffffffc0202bce:	fff40693          	addi	a3,s0,-1
ffffffffc0202bd2:	864a                	mv	a2,s2
ffffffffc0202bd4:	85a6                	mv	a1,s1
ffffffffc0202bd6:	0000a517          	auipc	a0,0xa
ffffffffc0202bda:	14250513          	addi	a0,a0,322 # ffffffffc020cd18 <default_pmm_manager+0x220>
ffffffffc0202bde:	dc8fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202be2:	c8000737          	lui	a4,0xc8000
ffffffffc0202be6:	87a2                	mv	a5,s0
ffffffffc0202be8:	60876063          	bltu	a4,s0,ffffffffc02031e8 <pmm_init+0x68c>
ffffffffc0202bec:	757d                	lui	a0,0xfffff
ffffffffc0202bee:	00095617          	auipc	a2,0x95
ffffffffc0202bf2:	d5160613          	addi	a2,a2,-687 # ffffffffc029793f <end+0xfff>
ffffffffc0202bf6:	8e69                	and	a2,a2,a0
ffffffffc0202bf8:	00094497          	auipc	s1,0x94
ffffffffc0202bfc:	cd848493          	addi	s1,s1,-808 # ffffffffc02968d0 <npage>
ffffffffc0202c00:	00c7d513          	srli	a0,a5,0xc
ffffffffc0202c04:	00094b97          	auipc	s7,0x94
ffffffffc0202c08:	cd4b8b93          	addi	s7,s7,-812 # ffffffffc02968d8 <pages>
ffffffffc0202c0c:	e088                	sd	a0,0(s1)
ffffffffc0202c0e:	00cbb023          	sd	a2,0(s7)
ffffffffc0202c12:	000807b7          	lui	a5,0x80
ffffffffc0202c16:	86b2                	mv	a3,a2
ffffffffc0202c18:	02f50863          	beq	a0,a5,ffffffffc0202c48 <pmm_init+0xec>
ffffffffc0202c1c:	4781                	li	a5,0
ffffffffc0202c1e:	4585                	li	a1,1
ffffffffc0202c20:	fff806b7          	lui	a3,0xfff80
ffffffffc0202c24:	00679513          	slli	a0,a5,0x6
ffffffffc0202c28:	9532                	add	a0,a0,a2
ffffffffc0202c2a:	00850713          	addi	a4,a0,8 # fffffffffffff008 <end+0x3fd686c8>
ffffffffc0202c2e:	40b7302f          	amoor.d	zero,a1,(a4)
ffffffffc0202c32:	6088                	ld	a0,0(s1)
ffffffffc0202c34:	0785                	addi	a5,a5,1
ffffffffc0202c36:	000bb603          	ld	a2,0(s7)
ffffffffc0202c3a:	00d50733          	add	a4,a0,a3
ffffffffc0202c3e:	fee7e3e3          	bltu	a5,a4,ffffffffc0202c24 <pmm_init+0xc8>
ffffffffc0202c42:	071a                	slli	a4,a4,0x6
ffffffffc0202c44:	00e606b3          	add	a3,a2,a4
ffffffffc0202c48:	c02007b7          	lui	a5,0xc0200
ffffffffc0202c4c:	3af6ece3          	bltu	a3,a5,ffffffffc0203804 <pmm_init+0xca8>
ffffffffc0202c50:	0009b583          	ld	a1,0(s3)
ffffffffc0202c54:	77fd                	lui	a5,0xfffff
ffffffffc0202c56:	8c7d                	and	s0,s0,a5
ffffffffc0202c58:	8e8d                	sub	a3,a3,a1
ffffffffc0202c5a:	5e86e563          	bltu	a3,s0,ffffffffc0203244 <pmm_init+0x6e8>
ffffffffc0202c5e:	0000a517          	auipc	a0,0xa
ffffffffc0202c62:	0e250513          	addi	a0,a0,226 # ffffffffc020cd40 <default_pmm_manager+0x248>
ffffffffc0202c66:	d40fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202c6a:	000b3783          	ld	a5,0(s6)
ffffffffc0202c6e:	7b9c                	ld	a5,48(a5)
ffffffffc0202c70:	9782                	jalr	a5
ffffffffc0202c72:	0000a517          	auipc	a0,0xa
ffffffffc0202c76:	0e650513          	addi	a0,a0,230 # ffffffffc020cd58 <default_pmm_manager+0x260>
ffffffffc0202c7a:	d2cfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202c7e:	100027f3          	csrr	a5,sstatus
ffffffffc0202c82:	8b89                	andi	a5,a5,2
ffffffffc0202c84:	5a079563          	bnez	a5,ffffffffc020322e <pmm_init+0x6d2>
ffffffffc0202c88:	000b3783          	ld	a5,0(s6)
ffffffffc0202c8c:	4505                	li	a0,1
ffffffffc0202c8e:	6f9c                	ld	a5,24(a5)
ffffffffc0202c90:	9782                	jalr	a5
ffffffffc0202c92:	842a                	mv	s0,a0
ffffffffc0202c94:	18040ae3          	beqz	s0,ffffffffc0203628 <pmm_init+0xacc>
ffffffffc0202c98:	000bb683          	ld	a3,0(s7)
ffffffffc0202c9c:	5a7d                	li	s4,-1
ffffffffc0202c9e:	6098                	ld	a4,0(s1)
ffffffffc0202ca0:	40d406b3          	sub	a3,s0,a3
ffffffffc0202ca4:	8699                	srai	a3,a3,0x6
ffffffffc0202ca6:	00080437          	lui	s0,0x80
ffffffffc0202caa:	96a2                	add	a3,a3,s0
ffffffffc0202cac:	00ca5793          	srli	a5,s4,0xc
ffffffffc0202cb0:	8ff5                	and	a5,a5,a3
ffffffffc0202cb2:	06b2                	slli	a3,a3,0xc
ffffffffc0202cb4:	30e7ffe3          	bgeu	a5,a4,ffffffffc02037d2 <pmm_init+0xc76>
ffffffffc0202cb8:	0009b403          	ld	s0,0(s3)
ffffffffc0202cbc:	6605                	lui	a2,0x1
ffffffffc0202cbe:	4581                	li	a1,0
ffffffffc0202cc0:	9436                	add	s0,s0,a3
ffffffffc0202cc2:	8522                	mv	a0,s0
ffffffffc0202cc4:	667080ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0202cc8:	0009b683          	ld	a3,0(s3)
ffffffffc0202ccc:	77fd                	lui	a5,0xfffff
ffffffffc0202cce:	0000a917          	auipc	s2,0xa
ffffffffc0202cd2:	ec590913          	addi	s2,s2,-315 # ffffffffc020cb93 <default_pmm_manager+0x9b>
ffffffffc0202cd6:	00f97933          	and	s2,s2,a5
ffffffffc0202cda:	c0200ab7          	lui	s5,0xc0200
ffffffffc0202cde:	3fe00637          	lui	a2,0x3fe00
ffffffffc0202ce2:	964a                	add	a2,a2,s2
ffffffffc0202ce4:	4729                	li	a4,10
ffffffffc0202ce6:	40da86b3          	sub	a3,s5,a3
ffffffffc0202cea:	c02005b7          	lui	a1,0xc0200
ffffffffc0202cee:	8522                	mv	a0,s0
ffffffffc0202cf0:	fe8ff0ef          	jal	ra,ffffffffc02024d8 <boot_map_segment>
ffffffffc0202cf4:	c8000637          	lui	a2,0xc8000
ffffffffc0202cf8:	41260633          	sub	a2,a2,s2
ffffffffc0202cfc:	3f596ee3          	bltu	s2,s5,ffffffffc02038f8 <pmm_init+0xd9c>
ffffffffc0202d00:	0009b683          	ld	a3,0(s3)
ffffffffc0202d04:	85ca                	mv	a1,s2
ffffffffc0202d06:	4719                	li	a4,6
ffffffffc0202d08:	40d906b3          	sub	a3,s2,a3
ffffffffc0202d0c:	8522                	mv	a0,s0
ffffffffc0202d0e:	00094917          	auipc	s2,0x94
ffffffffc0202d12:	bba90913          	addi	s2,s2,-1094 # ffffffffc02968c8 <boot_pgdir_va>
ffffffffc0202d16:	fc2ff0ef          	jal	ra,ffffffffc02024d8 <boot_map_segment>
ffffffffc0202d1a:	00893023          	sd	s0,0(s2)
ffffffffc0202d1e:	2d5466e3          	bltu	s0,s5,ffffffffc02037ea <pmm_init+0xc8e>
ffffffffc0202d22:	0009b783          	ld	a5,0(s3)
ffffffffc0202d26:	1a7e                	slli	s4,s4,0x3f
ffffffffc0202d28:	8c1d                	sub	s0,s0,a5
ffffffffc0202d2a:	00c45793          	srli	a5,s0,0xc
ffffffffc0202d2e:	00094717          	auipc	a4,0x94
ffffffffc0202d32:	b8873923          	sd	s0,-1134(a4) # ffffffffc02968c0 <boot_pgdir_pa>
ffffffffc0202d36:	0147ea33          	or	s4,a5,s4
ffffffffc0202d3a:	180a1073          	csrw	satp,s4
ffffffffc0202d3e:	12000073          	sfence.vma
ffffffffc0202d42:	12000073          	sfence.vma
ffffffffc0202d46:	0000a517          	auipc	a0,0xa
ffffffffc0202d4a:	05250513          	addi	a0,a0,82 # ffffffffc020cd98 <default_pmm_manager+0x2a0>
ffffffffc0202d4e:	c58fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202d52:	0000e717          	auipc	a4,0xe
ffffffffc0202d56:	2ae70713          	addi	a4,a4,686 # ffffffffc0211000 <bootstack>
ffffffffc0202d5a:	0000e797          	auipc	a5,0xe
ffffffffc0202d5e:	2a678793          	addi	a5,a5,678 # ffffffffc0211000 <bootstack>
ffffffffc0202d62:	5cf70d63          	beq	a4,a5,ffffffffc020333c <pmm_init+0x7e0>
ffffffffc0202d66:	100027f3          	csrr	a5,sstatus
ffffffffc0202d6a:	8b89                	andi	a5,a5,2
ffffffffc0202d6c:	4a079763          	bnez	a5,ffffffffc020321a <pmm_init+0x6be>
ffffffffc0202d70:	000b3783          	ld	a5,0(s6)
ffffffffc0202d74:	779c                	ld	a5,40(a5)
ffffffffc0202d76:	9782                	jalr	a5
ffffffffc0202d78:	842a                	mv	s0,a0
ffffffffc0202d7a:	6098                	ld	a4,0(s1)
ffffffffc0202d7c:	c80007b7          	lui	a5,0xc8000
ffffffffc0202d80:	83b1                	srli	a5,a5,0xc
ffffffffc0202d82:	08e7e3e3          	bltu	a5,a4,ffffffffc0203608 <pmm_init+0xaac>
ffffffffc0202d86:	00093503          	ld	a0,0(s2)
ffffffffc0202d8a:	04050fe3          	beqz	a0,ffffffffc02035e8 <pmm_init+0xa8c>
ffffffffc0202d8e:	03451793          	slli	a5,a0,0x34
ffffffffc0202d92:	04079be3          	bnez	a5,ffffffffc02035e8 <pmm_init+0xa8c>
ffffffffc0202d96:	4601                	li	a2,0
ffffffffc0202d98:	4581                	li	a1,0
ffffffffc0202d9a:	805ff0ef          	jal	ra,ffffffffc020259e <get_page>
ffffffffc0202d9e:	2e0511e3          	bnez	a0,ffffffffc0203880 <pmm_init+0xd24>
ffffffffc0202da2:	100027f3          	csrr	a5,sstatus
ffffffffc0202da6:	8b89                	andi	a5,a5,2
ffffffffc0202da8:	44079e63          	bnez	a5,ffffffffc0203204 <pmm_init+0x6a8>
ffffffffc0202dac:	000b3783          	ld	a5,0(s6)
ffffffffc0202db0:	4505                	li	a0,1
ffffffffc0202db2:	6f9c                	ld	a5,24(a5)
ffffffffc0202db4:	9782                	jalr	a5
ffffffffc0202db6:	8a2a                	mv	s4,a0
ffffffffc0202db8:	00093503          	ld	a0,0(s2)
ffffffffc0202dbc:	4681                	li	a3,0
ffffffffc0202dbe:	4601                	li	a2,0
ffffffffc0202dc0:	85d2                	mv	a1,s4
ffffffffc0202dc2:	ca5ff0ef          	jal	ra,ffffffffc0202a66 <page_insert>
ffffffffc0202dc6:	26051be3          	bnez	a0,ffffffffc020383c <pmm_init+0xce0>
ffffffffc0202dca:	00093503          	ld	a0,0(s2)
ffffffffc0202dce:	4601                	li	a2,0
ffffffffc0202dd0:	4581                	li	a1,0
ffffffffc0202dd2:	cdeff0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc0202dd6:	280505e3          	beqz	a0,ffffffffc0203860 <pmm_init+0xd04>
ffffffffc0202dda:	611c                	ld	a5,0(a0)
ffffffffc0202ddc:	0017f713          	andi	a4,a5,1
ffffffffc0202de0:	26070ee3          	beqz	a4,ffffffffc020385c <pmm_init+0xd00>
ffffffffc0202de4:	6098                	ld	a4,0(s1)
ffffffffc0202de6:	078a                	slli	a5,a5,0x2
ffffffffc0202de8:	83b1                	srli	a5,a5,0xc
ffffffffc0202dea:	62e7f363          	bgeu	a5,a4,ffffffffc0203410 <pmm_init+0x8b4>
ffffffffc0202dee:	000bb683          	ld	a3,0(s7)
ffffffffc0202df2:	fff80637          	lui	a2,0xfff80
ffffffffc0202df6:	97b2                	add	a5,a5,a2
ffffffffc0202df8:	079a                	slli	a5,a5,0x6
ffffffffc0202dfa:	97b6                	add	a5,a5,a3
ffffffffc0202dfc:	2afa12e3          	bne	s4,a5,ffffffffc02038a0 <pmm_init+0xd44>
ffffffffc0202e00:	000a2683          	lw	a3,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202e04:	4785                	li	a5,1
ffffffffc0202e06:	2cf699e3          	bne	a3,a5,ffffffffc02038d8 <pmm_init+0xd7c>
ffffffffc0202e0a:	00093503          	ld	a0,0(s2)
ffffffffc0202e0e:	77fd                	lui	a5,0xfffff
ffffffffc0202e10:	6114                	ld	a3,0(a0)
ffffffffc0202e12:	068a                	slli	a3,a3,0x2
ffffffffc0202e14:	8efd                	and	a3,a3,a5
ffffffffc0202e16:	00c6d613          	srli	a2,a3,0xc
ffffffffc0202e1a:	2ae673e3          	bgeu	a2,a4,ffffffffc02038c0 <pmm_init+0xd64>
ffffffffc0202e1e:	0009bc03          	ld	s8,0(s3)
ffffffffc0202e22:	96e2                	add	a3,a3,s8
ffffffffc0202e24:	0006ba83          	ld	s5,0(a3) # fffffffffff80000 <end+0x3fce96c0>
ffffffffc0202e28:	0a8a                	slli	s5,s5,0x2
ffffffffc0202e2a:	00fafab3          	and	s5,s5,a5
ffffffffc0202e2e:	00cad793          	srli	a5,s5,0xc
ffffffffc0202e32:	06e7f3e3          	bgeu	a5,a4,ffffffffc0203698 <pmm_init+0xb3c>
ffffffffc0202e36:	4601                	li	a2,0
ffffffffc0202e38:	6585                	lui	a1,0x1
ffffffffc0202e3a:	9ae2                	add	s5,s5,s8
ffffffffc0202e3c:	c74ff0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc0202e40:	0aa1                	addi	s5,s5,8
ffffffffc0202e42:	03551be3          	bne	a0,s5,ffffffffc0203678 <pmm_init+0xb1c>
ffffffffc0202e46:	100027f3          	csrr	a5,sstatus
ffffffffc0202e4a:	8b89                	andi	a5,a5,2
ffffffffc0202e4c:	3a079163          	bnez	a5,ffffffffc02031ee <pmm_init+0x692>
ffffffffc0202e50:	000b3783          	ld	a5,0(s6)
ffffffffc0202e54:	4505                	li	a0,1
ffffffffc0202e56:	6f9c                	ld	a5,24(a5)
ffffffffc0202e58:	9782                	jalr	a5
ffffffffc0202e5a:	8c2a                	mv	s8,a0
ffffffffc0202e5c:	00093503          	ld	a0,0(s2)
ffffffffc0202e60:	46d1                	li	a3,20
ffffffffc0202e62:	6605                	lui	a2,0x1
ffffffffc0202e64:	85e2                	mv	a1,s8
ffffffffc0202e66:	c01ff0ef          	jal	ra,ffffffffc0202a66 <page_insert>
ffffffffc0202e6a:	1a0519e3          	bnez	a0,ffffffffc020381c <pmm_init+0xcc0>
ffffffffc0202e6e:	00093503          	ld	a0,0(s2)
ffffffffc0202e72:	4601                	li	a2,0
ffffffffc0202e74:	6585                	lui	a1,0x1
ffffffffc0202e76:	c3aff0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc0202e7a:	10050ce3          	beqz	a0,ffffffffc0203792 <pmm_init+0xc36>
ffffffffc0202e7e:	611c                	ld	a5,0(a0)
ffffffffc0202e80:	0107f713          	andi	a4,a5,16
ffffffffc0202e84:	0e0707e3          	beqz	a4,ffffffffc0203772 <pmm_init+0xc16>
ffffffffc0202e88:	8b91                	andi	a5,a5,4
ffffffffc0202e8a:	0c0784e3          	beqz	a5,ffffffffc0203752 <pmm_init+0xbf6>
ffffffffc0202e8e:	00093503          	ld	a0,0(s2)
ffffffffc0202e92:	611c                	ld	a5,0(a0)
ffffffffc0202e94:	8bc1                	andi	a5,a5,16
ffffffffc0202e96:	08078ee3          	beqz	a5,ffffffffc0203732 <pmm_init+0xbd6>
ffffffffc0202e9a:	000c2703          	lw	a4,0(s8)
ffffffffc0202e9e:	4785                	li	a5,1
ffffffffc0202ea0:	06f719e3          	bne	a4,a5,ffffffffc0203712 <pmm_init+0xbb6>
ffffffffc0202ea4:	4681                	li	a3,0
ffffffffc0202ea6:	6605                	lui	a2,0x1
ffffffffc0202ea8:	85d2                	mv	a1,s4
ffffffffc0202eaa:	bbdff0ef          	jal	ra,ffffffffc0202a66 <page_insert>
ffffffffc0202eae:	040512e3          	bnez	a0,ffffffffc02036f2 <pmm_init+0xb96>
ffffffffc0202eb2:	000a2703          	lw	a4,0(s4)
ffffffffc0202eb6:	4789                	li	a5,2
ffffffffc0202eb8:	00f71de3          	bne	a4,a5,ffffffffc02036d2 <pmm_init+0xb76>
ffffffffc0202ebc:	000c2783          	lw	a5,0(s8)
ffffffffc0202ec0:	7e079963          	bnez	a5,ffffffffc02036b2 <pmm_init+0xb56>
ffffffffc0202ec4:	00093503          	ld	a0,0(s2)
ffffffffc0202ec8:	4601                	li	a2,0
ffffffffc0202eca:	6585                	lui	a1,0x1
ffffffffc0202ecc:	be4ff0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc0202ed0:	54050263          	beqz	a0,ffffffffc0203414 <pmm_init+0x8b8>
ffffffffc0202ed4:	6118                	ld	a4,0(a0)
ffffffffc0202ed6:	00177793          	andi	a5,a4,1
ffffffffc0202eda:	180781e3          	beqz	a5,ffffffffc020385c <pmm_init+0xd00>
ffffffffc0202ede:	6094                	ld	a3,0(s1)
ffffffffc0202ee0:	00271793          	slli	a5,a4,0x2
ffffffffc0202ee4:	83b1                	srli	a5,a5,0xc
ffffffffc0202ee6:	52d7f563          	bgeu	a5,a3,ffffffffc0203410 <pmm_init+0x8b4>
ffffffffc0202eea:	000bb683          	ld	a3,0(s7)
ffffffffc0202eee:	fff80ab7          	lui	s5,0xfff80
ffffffffc0202ef2:	97d6                	add	a5,a5,s5
ffffffffc0202ef4:	079a                	slli	a5,a5,0x6
ffffffffc0202ef6:	97b6                	add	a5,a5,a3
ffffffffc0202ef8:	58fa1e63          	bne	s4,a5,ffffffffc0203494 <pmm_init+0x938>
ffffffffc0202efc:	8b41                	andi	a4,a4,16
ffffffffc0202efe:	56071b63          	bnez	a4,ffffffffc0203474 <pmm_init+0x918>
ffffffffc0202f02:	00093503          	ld	a0,0(s2)
ffffffffc0202f06:	4581                	li	a1,0
ffffffffc0202f08:	ac3ff0ef          	jal	ra,ffffffffc02029ca <page_remove>
ffffffffc0202f0c:	000a2c83          	lw	s9,0(s4)
ffffffffc0202f10:	4785                	li	a5,1
ffffffffc0202f12:	5cfc9163          	bne	s9,a5,ffffffffc02034d4 <pmm_init+0x978>
ffffffffc0202f16:	000c2783          	lw	a5,0(s8)
ffffffffc0202f1a:	58079d63          	bnez	a5,ffffffffc02034b4 <pmm_init+0x958>
ffffffffc0202f1e:	00093503          	ld	a0,0(s2)
ffffffffc0202f22:	6585                	lui	a1,0x1
ffffffffc0202f24:	aa7ff0ef          	jal	ra,ffffffffc02029ca <page_remove>
ffffffffc0202f28:	000a2783          	lw	a5,0(s4)
ffffffffc0202f2c:	200793e3          	bnez	a5,ffffffffc0203932 <pmm_init+0xdd6>
ffffffffc0202f30:	000c2783          	lw	a5,0(s8)
ffffffffc0202f34:	1c079fe3          	bnez	a5,ffffffffc0203912 <pmm_init+0xdb6>
ffffffffc0202f38:	00093a03          	ld	s4,0(s2)
ffffffffc0202f3c:	608c                	ld	a1,0(s1)
ffffffffc0202f3e:	000a3683          	ld	a3,0(s4)
ffffffffc0202f42:	068a                	slli	a3,a3,0x2
ffffffffc0202f44:	82b1                	srli	a3,a3,0xc
ffffffffc0202f46:	4cb6f563          	bgeu	a3,a1,ffffffffc0203410 <pmm_init+0x8b4>
ffffffffc0202f4a:	000bb503          	ld	a0,0(s7)
ffffffffc0202f4e:	96d6                	add	a3,a3,s5
ffffffffc0202f50:	069a                	slli	a3,a3,0x6
ffffffffc0202f52:	00d507b3          	add	a5,a0,a3
ffffffffc0202f56:	439c                	lw	a5,0(a5)
ffffffffc0202f58:	4f979e63          	bne	a5,s9,ffffffffc0203454 <pmm_init+0x8f8>
ffffffffc0202f5c:	8699                	srai	a3,a3,0x6
ffffffffc0202f5e:	00080637          	lui	a2,0x80
ffffffffc0202f62:	96b2                	add	a3,a3,a2
ffffffffc0202f64:	00c69713          	slli	a4,a3,0xc
ffffffffc0202f68:	8331                	srli	a4,a4,0xc
ffffffffc0202f6a:	06b2                	slli	a3,a3,0xc
ffffffffc0202f6c:	06b773e3          	bgeu	a4,a1,ffffffffc02037d2 <pmm_init+0xc76>
ffffffffc0202f70:	0009b703          	ld	a4,0(s3)
ffffffffc0202f74:	96ba                	add	a3,a3,a4
ffffffffc0202f76:	629c                	ld	a5,0(a3)
ffffffffc0202f78:	078a                	slli	a5,a5,0x2
ffffffffc0202f7a:	83b1                	srli	a5,a5,0xc
ffffffffc0202f7c:	48b7fa63          	bgeu	a5,a1,ffffffffc0203410 <pmm_init+0x8b4>
ffffffffc0202f80:	8f91                	sub	a5,a5,a2
ffffffffc0202f82:	079a                	slli	a5,a5,0x6
ffffffffc0202f84:	953e                	add	a0,a0,a5
ffffffffc0202f86:	100027f3          	csrr	a5,sstatus
ffffffffc0202f8a:	8b89                	andi	a5,a5,2
ffffffffc0202f8c:	32079463          	bnez	a5,ffffffffc02032b4 <pmm_init+0x758>
ffffffffc0202f90:	000b3783          	ld	a5,0(s6)
ffffffffc0202f94:	4585                	li	a1,1
ffffffffc0202f96:	739c                	ld	a5,32(a5)
ffffffffc0202f98:	9782                	jalr	a5
ffffffffc0202f9a:	000a3783          	ld	a5,0(s4)
ffffffffc0202f9e:	6098                	ld	a4,0(s1)
ffffffffc0202fa0:	078a                	slli	a5,a5,0x2
ffffffffc0202fa2:	83b1                	srli	a5,a5,0xc
ffffffffc0202fa4:	46e7f663          	bgeu	a5,a4,ffffffffc0203410 <pmm_init+0x8b4>
ffffffffc0202fa8:	000bb503          	ld	a0,0(s7)
ffffffffc0202fac:	fff80737          	lui	a4,0xfff80
ffffffffc0202fb0:	97ba                	add	a5,a5,a4
ffffffffc0202fb2:	079a                	slli	a5,a5,0x6
ffffffffc0202fb4:	953e                	add	a0,a0,a5
ffffffffc0202fb6:	100027f3          	csrr	a5,sstatus
ffffffffc0202fba:	8b89                	andi	a5,a5,2
ffffffffc0202fbc:	2e079063          	bnez	a5,ffffffffc020329c <pmm_init+0x740>
ffffffffc0202fc0:	000b3783          	ld	a5,0(s6)
ffffffffc0202fc4:	4585                	li	a1,1
ffffffffc0202fc6:	739c                	ld	a5,32(a5)
ffffffffc0202fc8:	9782                	jalr	a5
ffffffffc0202fca:	00093783          	ld	a5,0(s2)
ffffffffc0202fce:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd686c0>
ffffffffc0202fd2:	12000073          	sfence.vma
ffffffffc0202fd6:	100027f3          	csrr	a5,sstatus
ffffffffc0202fda:	8b89                	andi	a5,a5,2
ffffffffc0202fdc:	2a079663          	bnez	a5,ffffffffc0203288 <pmm_init+0x72c>
ffffffffc0202fe0:	000b3783          	ld	a5,0(s6)
ffffffffc0202fe4:	779c                	ld	a5,40(a5)
ffffffffc0202fe6:	9782                	jalr	a5
ffffffffc0202fe8:	8a2a                	mv	s4,a0
ffffffffc0202fea:	7d441463          	bne	s0,s4,ffffffffc02037b2 <pmm_init+0xc56>
ffffffffc0202fee:	0000a517          	auipc	a0,0xa
ffffffffc0202ff2:	10250513          	addi	a0,a0,258 # ffffffffc020d0f0 <default_pmm_manager+0x5f8>
ffffffffc0202ff6:	9b0fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202ffa:	100027f3          	csrr	a5,sstatus
ffffffffc0202ffe:	8b89                	andi	a5,a5,2
ffffffffc0203000:	26079a63          	bnez	a5,ffffffffc0203274 <pmm_init+0x718>
ffffffffc0203004:	000b3783          	ld	a5,0(s6)
ffffffffc0203008:	779c                	ld	a5,40(a5)
ffffffffc020300a:	9782                	jalr	a5
ffffffffc020300c:	8c2a                	mv	s8,a0
ffffffffc020300e:	6098                	ld	a4,0(s1)
ffffffffc0203010:	c0200437          	lui	s0,0xc0200
ffffffffc0203014:	7afd                	lui	s5,0xfffff
ffffffffc0203016:	00c71793          	slli	a5,a4,0xc
ffffffffc020301a:	6a05                	lui	s4,0x1
ffffffffc020301c:	02f47c63          	bgeu	s0,a5,ffffffffc0203054 <pmm_init+0x4f8>
ffffffffc0203020:	00c45793          	srli	a5,s0,0xc
ffffffffc0203024:	00093503          	ld	a0,0(s2)
ffffffffc0203028:	3ae7f763          	bgeu	a5,a4,ffffffffc02033d6 <pmm_init+0x87a>
ffffffffc020302c:	0009b583          	ld	a1,0(s3)
ffffffffc0203030:	4601                	li	a2,0
ffffffffc0203032:	95a2                	add	a1,a1,s0
ffffffffc0203034:	a7cff0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc0203038:	36050f63          	beqz	a0,ffffffffc02033b6 <pmm_init+0x85a>
ffffffffc020303c:	611c                	ld	a5,0(a0)
ffffffffc020303e:	078a                	slli	a5,a5,0x2
ffffffffc0203040:	0157f7b3          	and	a5,a5,s5
ffffffffc0203044:	3a879663          	bne	a5,s0,ffffffffc02033f0 <pmm_init+0x894>
ffffffffc0203048:	6098                	ld	a4,0(s1)
ffffffffc020304a:	9452                	add	s0,s0,s4
ffffffffc020304c:	00c71793          	slli	a5,a4,0xc
ffffffffc0203050:	fcf468e3          	bltu	s0,a5,ffffffffc0203020 <pmm_init+0x4c4>
ffffffffc0203054:	00093783          	ld	a5,0(s2)
ffffffffc0203058:	639c                	ld	a5,0(a5)
ffffffffc020305a:	48079d63          	bnez	a5,ffffffffc02034f4 <pmm_init+0x998>
ffffffffc020305e:	100027f3          	csrr	a5,sstatus
ffffffffc0203062:	8b89                	andi	a5,a5,2
ffffffffc0203064:	26079463          	bnez	a5,ffffffffc02032cc <pmm_init+0x770>
ffffffffc0203068:	000b3783          	ld	a5,0(s6)
ffffffffc020306c:	4505                	li	a0,1
ffffffffc020306e:	6f9c                	ld	a5,24(a5)
ffffffffc0203070:	9782                	jalr	a5
ffffffffc0203072:	8a2a                	mv	s4,a0
ffffffffc0203074:	00093503          	ld	a0,0(s2)
ffffffffc0203078:	4699                	li	a3,6
ffffffffc020307a:	10000613          	li	a2,256
ffffffffc020307e:	85d2                	mv	a1,s4
ffffffffc0203080:	9e7ff0ef          	jal	ra,ffffffffc0202a66 <page_insert>
ffffffffc0203084:	4a051863          	bnez	a0,ffffffffc0203534 <pmm_init+0x9d8>
ffffffffc0203088:	000a2703          	lw	a4,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020308c:	4785                	li	a5,1
ffffffffc020308e:	48f71363          	bne	a4,a5,ffffffffc0203514 <pmm_init+0x9b8>
ffffffffc0203092:	00093503          	ld	a0,0(s2)
ffffffffc0203096:	6405                	lui	s0,0x1
ffffffffc0203098:	4699                	li	a3,6
ffffffffc020309a:	10040613          	addi	a2,s0,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc020309e:	85d2                	mv	a1,s4
ffffffffc02030a0:	9c7ff0ef          	jal	ra,ffffffffc0202a66 <page_insert>
ffffffffc02030a4:	38051863          	bnez	a0,ffffffffc0203434 <pmm_init+0x8d8>
ffffffffc02030a8:	000a2703          	lw	a4,0(s4)
ffffffffc02030ac:	4789                	li	a5,2
ffffffffc02030ae:	4ef71363          	bne	a4,a5,ffffffffc0203594 <pmm_init+0xa38>
ffffffffc02030b2:	0000a597          	auipc	a1,0xa
ffffffffc02030b6:	18658593          	addi	a1,a1,390 # ffffffffc020d238 <default_pmm_manager+0x740>
ffffffffc02030ba:	10000513          	li	a0,256
ffffffffc02030be:	201080ef          	jal	ra,ffffffffc020babe <strcpy>
ffffffffc02030c2:	10040593          	addi	a1,s0,256
ffffffffc02030c6:	10000513          	li	a0,256
ffffffffc02030ca:	207080ef          	jal	ra,ffffffffc020bad0 <strcmp>
ffffffffc02030ce:	4a051363          	bnez	a0,ffffffffc0203574 <pmm_init+0xa18>
ffffffffc02030d2:	000bb683          	ld	a3,0(s7)
ffffffffc02030d6:	00080737          	lui	a4,0x80
ffffffffc02030da:	547d                	li	s0,-1
ffffffffc02030dc:	40da06b3          	sub	a3,s4,a3
ffffffffc02030e0:	8699                	srai	a3,a3,0x6
ffffffffc02030e2:	609c                	ld	a5,0(s1)
ffffffffc02030e4:	96ba                	add	a3,a3,a4
ffffffffc02030e6:	8031                	srli	s0,s0,0xc
ffffffffc02030e8:	0086f733          	and	a4,a3,s0
ffffffffc02030ec:	06b2                	slli	a3,a3,0xc
ffffffffc02030ee:	6ef77263          	bgeu	a4,a5,ffffffffc02037d2 <pmm_init+0xc76>
ffffffffc02030f2:	0009b783          	ld	a5,0(s3)
ffffffffc02030f6:	10000513          	li	a0,256
ffffffffc02030fa:	96be                	add	a3,a3,a5
ffffffffc02030fc:	10068023          	sb	zero,256(a3)
ffffffffc0203100:	189080ef          	jal	ra,ffffffffc020ba88 <strlen>
ffffffffc0203104:	44051863          	bnez	a0,ffffffffc0203554 <pmm_init+0x9f8>
ffffffffc0203108:	00093a83          	ld	s5,0(s2)
ffffffffc020310c:	609c                	ld	a5,0(s1)
ffffffffc020310e:	000ab683          	ld	a3,0(s5) # fffffffffffff000 <end+0x3fd686c0>
ffffffffc0203112:	068a                	slli	a3,a3,0x2
ffffffffc0203114:	82b1                	srli	a3,a3,0xc
ffffffffc0203116:	2ef6fd63          	bgeu	a3,a5,ffffffffc0203410 <pmm_init+0x8b4>
ffffffffc020311a:	8c75                	and	s0,s0,a3
ffffffffc020311c:	06b2                	slli	a3,a3,0xc
ffffffffc020311e:	6af47a63          	bgeu	s0,a5,ffffffffc02037d2 <pmm_init+0xc76>
ffffffffc0203122:	0009b403          	ld	s0,0(s3)
ffffffffc0203126:	9436                	add	s0,s0,a3
ffffffffc0203128:	100027f3          	csrr	a5,sstatus
ffffffffc020312c:	8b89                	andi	a5,a5,2
ffffffffc020312e:	1e079c63          	bnez	a5,ffffffffc0203326 <pmm_init+0x7ca>
ffffffffc0203132:	000b3783          	ld	a5,0(s6)
ffffffffc0203136:	4585                	li	a1,1
ffffffffc0203138:	8552                	mv	a0,s4
ffffffffc020313a:	739c                	ld	a5,32(a5)
ffffffffc020313c:	9782                	jalr	a5
ffffffffc020313e:	601c                	ld	a5,0(s0)
ffffffffc0203140:	6098                	ld	a4,0(s1)
ffffffffc0203142:	078a                	slli	a5,a5,0x2
ffffffffc0203144:	83b1                	srli	a5,a5,0xc
ffffffffc0203146:	2ce7f563          	bgeu	a5,a4,ffffffffc0203410 <pmm_init+0x8b4>
ffffffffc020314a:	000bb503          	ld	a0,0(s7)
ffffffffc020314e:	fff80737          	lui	a4,0xfff80
ffffffffc0203152:	97ba                	add	a5,a5,a4
ffffffffc0203154:	079a                	slli	a5,a5,0x6
ffffffffc0203156:	953e                	add	a0,a0,a5
ffffffffc0203158:	100027f3          	csrr	a5,sstatus
ffffffffc020315c:	8b89                	andi	a5,a5,2
ffffffffc020315e:	1a079863          	bnez	a5,ffffffffc020330e <pmm_init+0x7b2>
ffffffffc0203162:	000b3783          	ld	a5,0(s6)
ffffffffc0203166:	4585                	li	a1,1
ffffffffc0203168:	739c                	ld	a5,32(a5)
ffffffffc020316a:	9782                	jalr	a5
ffffffffc020316c:	000ab783          	ld	a5,0(s5)
ffffffffc0203170:	6098                	ld	a4,0(s1)
ffffffffc0203172:	078a                	slli	a5,a5,0x2
ffffffffc0203174:	83b1                	srli	a5,a5,0xc
ffffffffc0203176:	28e7fd63          	bgeu	a5,a4,ffffffffc0203410 <pmm_init+0x8b4>
ffffffffc020317a:	000bb503          	ld	a0,0(s7)
ffffffffc020317e:	fff80737          	lui	a4,0xfff80
ffffffffc0203182:	97ba                	add	a5,a5,a4
ffffffffc0203184:	079a                	slli	a5,a5,0x6
ffffffffc0203186:	953e                	add	a0,a0,a5
ffffffffc0203188:	100027f3          	csrr	a5,sstatus
ffffffffc020318c:	8b89                	andi	a5,a5,2
ffffffffc020318e:	16079463          	bnez	a5,ffffffffc02032f6 <pmm_init+0x79a>
ffffffffc0203192:	000b3783          	ld	a5,0(s6)
ffffffffc0203196:	4585                	li	a1,1
ffffffffc0203198:	739c                	ld	a5,32(a5)
ffffffffc020319a:	9782                	jalr	a5
ffffffffc020319c:	00093783          	ld	a5,0(s2)
ffffffffc02031a0:	0007b023          	sd	zero,0(a5)
ffffffffc02031a4:	12000073          	sfence.vma
ffffffffc02031a8:	100027f3          	csrr	a5,sstatus
ffffffffc02031ac:	8b89                	andi	a5,a5,2
ffffffffc02031ae:	12079a63          	bnez	a5,ffffffffc02032e2 <pmm_init+0x786>
ffffffffc02031b2:	000b3783          	ld	a5,0(s6)
ffffffffc02031b6:	779c                	ld	a5,40(a5)
ffffffffc02031b8:	9782                	jalr	a5
ffffffffc02031ba:	842a                	mv	s0,a0
ffffffffc02031bc:	488c1e63          	bne	s8,s0,ffffffffc0203658 <pmm_init+0xafc>
ffffffffc02031c0:	0000a517          	auipc	a0,0xa
ffffffffc02031c4:	0f050513          	addi	a0,a0,240 # ffffffffc020d2b0 <default_pmm_manager+0x7b8>
ffffffffc02031c8:	fdffc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02031cc:	7406                	ld	s0,96(sp)
ffffffffc02031ce:	70a6                	ld	ra,104(sp)
ffffffffc02031d0:	64e6                	ld	s1,88(sp)
ffffffffc02031d2:	6946                	ld	s2,80(sp)
ffffffffc02031d4:	69a6                	ld	s3,72(sp)
ffffffffc02031d6:	6a06                	ld	s4,64(sp)
ffffffffc02031d8:	7ae2                	ld	s5,56(sp)
ffffffffc02031da:	7b42                	ld	s6,48(sp)
ffffffffc02031dc:	7ba2                	ld	s7,40(sp)
ffffffffc02031de:	7c02                	ld	s8,32(sp)
ffffffffc02031e0:	6ce2                	ld	s9,24(sp)
ffffffffc02031e2:	6165                	addi	sp,sp,112
ffffffffc02031e4:	e13fe06f          	j	ffffffffc0201ff6 <kmalloc_init>
ffffffffc02031e8:	c80007b7          	lui	a5,0xc8000
ffffffffc02031ec:	b401                	j	ffffffffc0202bec <pmm_init+0x90>
ffffffffc02031ee:	a85fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031f2:	000b3783          	ld	a5,0(s6)
ffffffffc02031f6:	4505                	li	a0,1
ffffffffc02031f8:	6f9c                	ld	a5,24(a5)
ffffffffc02031fa:	9782                	jalr	a5
ffffffffc02031fc:	8c2a                	mv	s8,a0
ffffffffc02031fe:	a6ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203202:	b9a9                	j	ffffffffc0202e5c <pmm_init+0x300>
ffffffffc0203204:	a6ffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203208:	000b3783          	ld	a5,0(s6)
ffffffffc020320c:	4505                	li	a0,1
ffffffffc020320e:	6f9c                	ld	a5,24(a5)
ffffffffc0203210:	9782                	jalr	a5
ffffffffc0203212:	8a2a                	mv	s4,a0
ffffffffc0203214:	a59fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203218:	b645                	j	ffffffffc0202db8 <pmm_init+0x25c>
ffffffffc020321a:	a59fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020321e:	000b3783          	ld	a5,0(s6)
ffffffffc0203222:	779c                	ld	a5,40(a5)
ffffffffc0203224:	9782                	jalr	a5
ffffffffc0203226:	842a                	mv	s0,a0
ffffffffc0203228:	a45fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020322c:	b6b9                	j	ffffffffc0202d7a <pmm_init+0x21e>
ffffffffc020322e:	a45fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203232:	000b3783          	ld	a5,0(s6)
ffffffffc0203236:	4505                	li	a0,1
ffffffffc0203238:	6f9c                	ld	a5,24(a5)
ffffffffc020323a:	9782                	jalr	a5
ffffffffc020323c:	842a                	mv	s0,a0
ffffffffc020323e:	a2ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203242:	bc89                	j	ffffffffc0202c94 <pmm_init+0x138>
ffffffffc0203244:	6705                	lui	a4,0x1
ffffffffc0203246:	177d                	addi	a4,a4,-1
ffffffffc0203248:	96ba                	add	a3,a3,a4
ffffffffc020324a:	8ff5                	and	a5,a5,a3
ffffffffc020324c:	00c7d713          	srli	a4,a5,0xc
ffffffffc0203250:	1ca77063          	bgeu	a4,a0,ffffffffc0203410 <pmm_init+0x8b4>
ffffffffc0203254:	000b3683          	ld	a3,0(s6)
ffffffffc0203258:	fff80537          	lui	a0,0xfff80
ffffffffc020325c:	972a                	add	a4,a4,a0
ffffffffc020325e:	6a94                	ld	a3,16(a3)
ffffffffc0203260:	8c1d                	sub	s0,s0,a5
ffffffffc0203262:	00671513          	slli	a0,a4,0x6
ffffffffc0203266:	00c45593          	srli	a1,s0,0xc
ffffffffc020326a:	9532                	add	a0,a0,a2
ffffffffc020326c:	9682                	jalr	a3
ffffffffc020326e:	0009b583          	ld	a1,0(s3)
ffffffffc0203272:	b2f5                	j	ffffffffc0202c5e <pmm_init+0x102>
ffffffffc0203274:	9fffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203278:	000b3783          	ld	a5,0(s6)
ffffffffc020327c:	779c                	ld	a5,40(a5)
ffffffffc020327e:	9782                	jalr	a5
ffffffffc0203280:	8c2a                	mv	s8,a0
ffffffffc0203282:	9ebfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203286:	b361                	j	ffffffffc020300e <pmm_init+0x4b2>
ffffffffc0203288:	9ebfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020328c:	000b3783          	ld	a5,0(s6)
ffffffffc0203290:	779c                	ld	a5,40(a5)
ffffffffc0203292:	9782                	jalr	a5
ffffffffc0203294:	8a2a                	mv	s4,a0
ffffffffc0203296:	9d7fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020329a:	bb81                	j	ffffffffc0202fea <pmm_init+0x48e>
ffffffffc020329c:	e42a                	sd	a0,8(sp)
ffffffffc020329e:	9d5fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02032a2:	000b3783          	ld	a5,0(s6)
ffffffffc02032a6:	6522                	ld	a0,8(sp)
ffffffffc02032a8:	4585                	li	a1,1
ffffffffc02032aa:	739c                	ld	a5,32(a5)
ffffffffc02032ac:	9782                	jalr	a5
ffffffffc02032ae:	9bffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032b2:	bb21                	j	ffffffffc0202fca <pmm_init+0x46e>
ffffffffc02032b4:	e42a                	sd	a0,8(sp)
ffffffffc02032b6:	9bdfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02032ba:	000b3783          	ld	a5,0(s6)
ffffffffc02032be:	6522                	ld	a0,8(sp)
ffffffffc02032c0:	4585                	li	a1,1
ffffffffc02032c2:	739c                	ld	a5,32(a5)
ffffffffc02032c4:	9782                	jalr	a5
ffffffffc02032c6:	9a7fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032ca:	b9c1                	j	ffffffffc0202f9a <pmm_init+0x43e>
ffffffffc02032cc:	9a7fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02032d0:	000b3783          	ld	a5,0(s6)
ffffffffc02032d4:	4505                	li	a0,1
ffffffffc02032d6:	6f9c                	ld	a5,24(a5)
ffffffffc02032d8:	9782                	jalr	a5
ffffffffc02032da:	8a2a                	mv	s4,a0
ffffffffc02032dc:	991fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032e0:	bb51                	j	ffffffffc0203074 <pmm_init+0x518>
ffffffffc02032e2:	991fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02032e6:	000b3783          	ld	a5,0(s6)
ffffffffc02032ea:	779c                	ld	a5,40(a5)
ffffffffc02032ec:	9782                	jalr	a5
ffffffffc02032ee:	842a                	mv	s0,a0
ffffffffc02032f0:	97dfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032f4:	b5e1                	j	ffffffffc02031bc <pmm_init+0x660>
ffffffffc02032f6:	e42a                	sd	a0,8(sp)
ffffffffc02032f8:	97bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02032fc:	000b3783          	ld	a5,0(s6)
ffffffffc0203300:	6522                	ld	a0,8(sp)
ffffffffc0203302:	4585                	li	a1,1
ffffffffc0203304:	739c                	ld	a5,32(a5)
ffffffffc0203306:	9782                	jalr	a5
ffffffffc0203308:	965fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020330c:	bd41                	j	ffffffffc020319c <pmm_init+0x640>
ffffffffc020330e:	e42a                	sd	a0,8(sp)
ffffffffc0203310:	963fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203314:	000b3783          	ld	a5,0(s6)
ffffffffc0203318:	6522                	ld	a0,8(sp)
ffffffffc020331a:	4585                	li	a1,1
ffffffffc020331c:	739c                	ld	a5,32(a5)
ffffffffc020331e:	9782                	jalr	a5
ffffffffc0203320:	94dfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203324:	b5a1                	j	ffffffffc020316c <pmm_init+0x610>
ffffffffc0203326:	94dfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020332a:	000b3783          	ld	a5,0(s6)
ffffffffc020332e:	4585                	li	a1,1
ffffffffc0203330:	8552                	mv	a0,s4
ffffffffc0203332:	739c                	ld	a5,32(a5)
ffffffffc0203334:	9782                	jalr	a5
ffffffffc0203336:	937fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020333a:	b511                	j	ffffffffc020313e <pmm_init+0x5e2>
ffffffffc020333c:	00010417          	auipc	s0,0x10
ffffffffc0203340:	cc440413          	addi	s0,s0,-828 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc0203344:	00010797          	auipc	a5,0x10
ffffffffc0203348:	cbc78793          	addi	a5,a5,-836 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc020334c:	a0f41de3          	bne	s0,a5,ffffffffc0202d66 <pmm_init+0x20a>
ffffffffc0203350:	4581                	li	a1,0
ffffffffc0203352:	6605                	lui	a2,0x1
ffffffffc0203354:	8522                	mv	a0,s0
ffffffffc0203356:	7d4080ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc020335a:	0000d597          	auipc	a1,0xd
ffffffffc020335e:	ca658593          	addi	a1,a1,-858 # ffffffffc0210000 <bootstackguard>
ffffffffc0203362:	0000e797          	auipc	a5,0xe
ffffffffc0203366:	c8078ea3          	sb	zero,-867(a5) # ffffffffc0210fff <bootstackguard+0xfff>
ffffffffc020336a:	0000d797          	auipc	a5,0xd
ffffffffc020336e:	c8078b23          	sb	zero,-874(a5) # ffffffffc0210000 <bootstackguard>
ffffffffc0203372:	00093503          	ld	a0,0(s2)
ffffffffc0203376:	2555ec63          	bltu	a1,s5,ffffffffc02035ce <pmm_init+0xa72>
ffffffffc020337a:	0009b683          	ld	a3,0(s3)
ffffffffc020337e:	4701                	li	a4,0
ffffffffc0203380:	6605                	lui	a2,0x1
ffffffffc0203382:	40d586b3          	sub	a3,a1,a3
ffffffffc0203386:	952ff0ef          	jal	ra,ffffffffc02024d8 <boot_map_segment>
ffffffffc020338a:	00093503          	ld	a0,0(s2)
ffffffffc020338e:	23546363          	bltu	s0,s5,ffffffffc02035b4 <pmm_init+0xa58>
ffffffffc0203392:	0009b683          	ld	a3,0(s3)
ffffffffc0203396:	4701                	li	a4,0
ffffffffc0203398:	6605                	lui	a2,0x1
ffffffffc020339a:	40d406b3          	sub	a3,s0,a3
ffffffffc020339e:	85a2                	mv	a1,s0
ffffffffc02033a0:	938ff0ef          	jal	ra,ffffffffc02024d8 <boot_map_segment>
ffffffffc02033a4:	12000073          	sfence.vma
ffffffffc02033a8:	0000a517          	auipc	a0,0xa
ffffffffc02033ac:	a1850513          	addi	a0,a0,-1512 # ffffffffc020cdc0 <default_pmm_manager+0x2c8>
ffffffffc02033b0:	df7fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02033b4:	ba4d                	j	ffffffffc0202d66 <pmm_init+0x20a>
ffffffffc02033b6:	0000a697          	auipc	a3,0xa
ffffffffc02033ba:	d5a68693          	addi	a3,a3,-678 # ffffffffc020d110 <default_pmm_manager+0x618>
ffffffffc02033be:	00009617          	auipc	a2,0x9
ffffffffc02033c2:	c5260613          	addi	a2,a2,-942 # ffffffffc020c010 <commands+0x210>
ffffffffc02033c6:	28a00593          	li	a1,650
ffffffffc02033ca:	0000a517          	auipc	a0,0xa
ffffffffc02033ce:	87e50513          	addi	a0,a0,-1922 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02033d2:	8ccfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033d6:	86a2                	mv	a3,s0
ffffffffc02033d8:	00009617          	auipc	a2,0x9
ffffffffc02033dc:	75860613          	addi	a2,a2,1880 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc02033e0:	28a00593          	li	a1,650
ffffffffc02033e4:	0000a517          	auipc	a0,0xa
ffffffffc02033e8:	86450513          	addi	a0,a0,-1948 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02033ec:	8b2fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033f0:	0000a697          	auipc	a3,0xa
ffffffffc02033f4:	d6068693          	addi	a3,a3,-672 # ffffffffc020d150 <default_pmm_manager+0x658>
ffffffffc02033f8:	00009617          	auipc	a2,0x9
ffffffffc02033fc:	c1860613          	addi	a2,a2,-1000 # ffffffffc020c010 <commands+0x210>
ffffffffc0203400:	28b00593          	li	a1,651
ffffffffc0203404:	0000a517          	auipc	a0,0xa
ffffffffc0203408:	84450513          	addi	a0,a0,-1980 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020340c:	892fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203410:	db1fe0ef          	jal	ra,ffffffffc02021c0 <pa2page.part.0>
ffffffffc0203414:	0000a697          	auipc	a3,0xa
ffffffffc0203418:	b6468693          	addi	a3,a3,-1180 # ffffffffc020cf78 <default_pmm_manager+0x480>
ffffffffc020341c:	00009617          	auipc	a2,0x9
ffffffffc0203420:	bf460613          	addi	a2,a2,-1036 # ffffffffc020c010 <commands+0x210>
ffffffffc0203424:	26700593          	li	a1,615
ffffffffc0203428:	0000a517          	auipc	a0,0xa
ffffffffc020342c:	82050513          	addi	a0,a0,-2016 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203430:	86efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203434:	0000a697          	auipc	a3,0xa
ffffffffc0203438:	da468693          	addi	a3,a3,-604 # ffffffffc020d1d8 <default_pmm_manager+0x6e0>
ffffffffc020343c:	00009617          	auipc	a2,0x9
ffffffffc0203440:	bd460613          	addi	a2,a2,-1068 # ffffffffc020c010 <commands+0x210>
ffffffffc0203444:	29400593          	li	a1,660
ffffffffc0203448:	0000a517          	auipc	a0,0xa
ffffffffc020344c:	80050513          	addi	a0,a0,-2048 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203450:	84efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203454:	0000a697          	auipc	a3,0xa
ffffffffc0203458:	c4468693          	addi	a3,a3,-956 # ffffffffc020d098 <default_pmm_manager+0x5a0>
ffffffffc020345c:	00009617          	auipc	a2,0x9
ffffffffc0203460:	bb460613          	addi	a2,a2,-1100 # ffffffffc020c010 <commands+0x210>
ffffffffc0203464:	27300593          	li	a1,627
ffffffffc0203468:	00009517          	auipc	a0,0x9
ffffffffc020346c:	7e050513          	addi	a0,a0,2016 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203470:	82efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203474:	0000a697          	auipc	a3,0xa
ffffffffc0203478:	bf468693          	addi	a3,a3,-1036 # ffffffffc020d068 <default_pmm_manager+0x570>
ffffffffc020347c:	00009617          	auipc	a2,0x9
ffffffffc0203480:	b9460613          	addi	a2,a2,-1132 # ffffffffc020c010 <commands+0x210>
ffffffffc0203484:	26900593          	li	a1,617
ffffffffc0203488:	00009517          	auipc	a0,0x9
ffffffffc020348c:	7c050513          	addi	a0,a0,1984 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203490:	80efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203494:	0000a697          	auipc	a3,0xa
ffffffffc0203498:	a4468693          	addi	a3,a3,-1468 # ffffffffc020ced8 <default_pmm_manager+0x3e0>
ffffffffc020349c:	00009617          	auipc	a2,0x9
ffffffffc02034a0:	b7460613          	addi	a2,a2,-1164 # ffffffffc020c010 <commands+0x210>
ffffffffc02034a4:	26800593          	li	a1,616
ffffffffc02034a8:	00009517          	auipc	a0,0x9
ffffffffc02034ac:	7a050513          	addi	a0,a0,1952 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02034b0:	feffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034b4:	0000a697          	auipc	a3,0xa
ffffffffc02034b8:	b9c68693          	addi	a3,a3,-1124 # ffffffffc020d050 <default_pmm_manager+0x558>
ffffffffc02034bc:	00009617          	auipc	a2,0x9
ffffffffc02034c0:	b5460613          	addi	a2,a2,-1196 # ffffffffc020c010 <commands+0x210>
ffffffffc02034c4:	26d00593          	li	a1,621
ffffffffc02034c8:	00009517          	auipc	a0,0x9
ffffffffc02034cc:	78050513          	addi	a0,a0,1920 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02034d0:	fcffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034d4:	0000a697          	auipc	a3,0xa
ffffffffc02034d8:	a1c68693          	addi	a3,a3,-1508 # ffffffffc020cef0 <default_pmm_manager+0x3f8>
ffffffffc02034dc:	00009617          	auipc	a2,0x9
ffffffffc02034e0:	b3460613          	addi	a2,a2,-1228 # ffffffffc020c010 <commands+0x210>
ffffffffc02034e4:	26c00593          	li	a1,620
ffffffffc02034e8:	00009517          	auipc	a0,0x9
ffffffffc02034ec:	76050513          	addi	a0,a0,1888 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02034f0:	faffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034f4:	0000a697          	auipc	a3,0xa
ffffffffc02034f8:	c7468693          	addi	a3,a3,-908 # ffffffffc020d168 <default_pmm_manager+0x670>
ffffffffc02034fc:	00009617          	auipc	a2,0x9
ffffffffc0203500:	b1460613          	addi	a2,a2,-1260 # ffffffffc020c010 <commands+0x210>
ffffffffc0203504:	28e00593          	li	a1,654
ffffffffc0203508:	00009517          	auipc	a0,0x9
ffffffffc020350c:	74050513          	addi	a0,a0,1856 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203510:	f8ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203514:	0000a697          	auipc	a3,0xa
ffffffffc0203518:	cac68693          	addi	a3,a3,-852 # ffffffffc020d1c0 <default_pmm_manager+0x6c8>
ffffffffc020351c:	00009617          	auipc	a2,0x9
ffffffffc0203520:	af460613          	addi	a2,a2,-1292 # ffffffffc020c010 <commands+0x210>
ffffffffc0203524:	29300593          	li	a1,659
ffffffffc0203528:	00009517          	auipc	a0,0x9
ffffffffc020352c:	72050513          	addi	a0,a0,1824 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203530:	f6ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203534:	0000a697          	auipc	a3,0xa
ffffffffc0203538:	c4c68693          	addi	a3,a3,-948 # ffffffffc020d180 <default_pmm_manager+0x688>
ffffffffc020353c:	00009617          	auipc	a2,0x9
ffffffffc0203540:	ad460613          	addi	a2,a2,-1324 # ffffffffc020c010 <commands+0x210>
ffffffffc0203544:	29200593          	li	a1,658
ffffffffc0203548:	00009517          	auipc	a0,0x9
ffffffffc020354c:	70050513          	addi	a0,a0,1792 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203550:	f4ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203554:	0000a697          	auipc	a3,0xa
ffffffffc0203558:	d3468693          	addi	a3,a3,-716 # ffffffffc020d288 <default_pmm_manager+0x790>
ffffffffc020355c:	00009617          	auipc	a2,0x9
ffffffffc0203560:	ab460613          	addi	a2,a2,-1356 # ffffffffc020c010 <commands+0x210>
ffffffffc0203564:	29c00593          	li	a1,668
ffffffffc0203568:	00009517          	auipc	a0,0x9
ffffffffc020356c:	6e050513          	addi	a0,a0,1760 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203570:	f2ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203574:	0000a697          	auipc	a3,0xa
ffffffffc0203578:	cdc68693          	addi	a3,a3,-804 # ffffffffc020d250 <default_pmm_manager+0x758>
ffffffffc020357c:	00009617          	auipc	a2,0x9
ffffffffc0203580:	a9460613          	addi	a2,a2,-1388 # ffffffffc020c010 <commands+0x210>
ffffffffc0203584:	29900593          	li	a1,665
ffffffffc0203588:	00009517          	auipc	a0,0x9
ffffffffc020358c:	6c050513          	addi	a0,a0,1728 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203590:	f0ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203594:	0000a697          	auipc	a3,0xa
ffffffffc0203598:	c8c68693          	addi	a3,a3,-884 # ffffffffc020d220 <default_pmm_manager+0x728>
ffffffffc020359c:	00009617          	auipc	a2,0x9
ffffffffc02035a0:	a7460613          	addi	a2,a2,-1420 # ffffffffc020c010 <commands+0x210>
ffffffffc02035a4:	29500593          	li	a1,661
ffffffffc02035a8:	00009517          	auipc	a0,0x9
ffffffffc02035ac:	6a050513          	addi	a0,a0,1696 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02035b0:	eeffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035b4:	86a2                	mv	a3,s0
ffffffffc02035b6:	00009617          	auipc	a2,0x9
ffffffffc02035ba:	62260613          	addi	a2,a2,1570 # ffffffffc020cbd8 <default_pmm_manager+0xe0>
ffffffffc02035be:	0dc00593          	li	a1,220
ffffffffc02035c2:	00009517          	auipc	a0,0x9
ffffffffc02035c6:	68650513          	addi	a0,a0,1670 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02035ca:	ed5fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035ce:	86ae                	mv	a3,a1
ffffffffc02035d0:	00009617          	auipc	a2,0x9
ffffffffc02035d4:	60860613          	addi	a2,a2,1544 # ffffffffc020cbd8 <default_pmm_manager+0xe0>
ffffffffc02035d8:	0db00593          	li	a1,219
ffffffffc02035dc:	00009517          	auipc	a0,0x9
ffffffffc02035e0:	66c50513          	addi	a0,a0,1644 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02035e4:	ebbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035e8:	0000a697          	auipc	a3,0xa
ffffffffc02035ec:	82068693          	addi	a3,a3,-2016 # ffffffffc020ce08 <default_pmm_manager+0x310>
ffffffffc02035f0:	00009617          	auipc	a2,0x9
ffffffffc02035f4:	a2060613          	addi	a2,a2,-1504 # ffffffffc020c010 <commands+0x210>
ffffffffc02035f8:	24c00593          	li	a1,588
ffffffffc02035fc:	00009517          	auipc	a0,0x9
ffffffffc0203600:	64c50513          	addi	a0,a0,1612 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203604:	e9bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203608:	00009697          	auipc	a3,0x9
ffffffffc020360c:	7e068693          	addi	a3,a3,2016 # ffffffffc020cde8 <default_pmm_manager+0x2f0>
ffffffffc0203610:	00009617          	auipc	a2,0x9
ffffffffc0203614:	a0060613          	addi	a2,a2,-1536 # ffffffffc020c010 <commands+0x210>
ffffffffc0203618:	24b00593          	li	a1,587
ffffffffc020361c:	00009517          	auipc	a0,0x9
ffffffffc0203620:	62c50513          	addi	a0,a0,1580 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203624:	e7bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203628:	00009617          	auipc	a2,0x9
ffffffffc020362c:	75060613          	addi	a2,a2,1872 # ffffffffc020cd78 <default_pmm_manager+0x280>
ffffffffc0203630:	0aa00593          	li	a1,170
ffffffffc0203634:	00009517          	auipc	a0,0x9
ffffffffc0203638:	61450513          	addi	a0,a0,1556 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020363c:	e63fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203640:	00009617          	auipc	a2,0x9
ffffffffc0203644:	6a060613          	addi	a2,a2,1696 # ffffffffc020cce0 <default_pmm_manager+0x1e8>
ffffffffc0203648:	06500593          	li	a1,101
ffffffffc020364c:	00009517          	auipc	a0,0x9
ffffffffc0203650:	5fc50513          	addi	a0,a0,1532 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203654:	e4bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203658:	0000a697          	auipc	a3,0xa
ffffffffc020365c:	a7068693          	addi	a3,a3,-1424 # ffffffffc020d0c8 <default_pmm_manager+0x5d0>
ffffffffc0203660:	00009617          	auipc	a2,0x9
ffffffffc0203664:	9b060613          	addi	a2,a2,-1616 # ffffffffc020c010 <commands+0x210>
ffffffffc0203668:	2a500593          	li	a1,677
ffffffffc020366c:	00009517          	auipc	a0,0x9
ffffffffc0203670:	5dc50513          	addi	a0,a0,1500 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203674:	e2bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203678:	0000a697          	auipc	a3,0xa
ffffffffc020367c:	89068693          	addi	a3,a3,-1904 # ffffffffc020cf08 <default_pmm_manager+0x410>
ffffffffc0203680:	00009617          	auipc	a2,0x9
ffffffffc0203684:	99060613          	addi	a2,a2,-1648 # ffffffffc020c010 <commands+0x210>
ffffffffc0203688:	25a00593          	li	a1,602
ffffffffc020368c:	00009517          	auipc	a0,0x9
ffffffffc0203690:	5bc50513          	addi	a0,a0,1468 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203694:	e0bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203698:	86d6                	mv	a3,s5
ffffffffc020369a:	00009617          	auipc	a2,0x9
ffffffffc020369e:	49660613          	addi	a2,a2,1174 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc02036a2:	25900593          	li	a1,601
ffffffffc02036a6:	00009517          	auipc	a0,0x9
ffffffffc02036aa:	5a250513          	addi	a0,a0,1442 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02036ae:	df1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036b2:	0000a697          	auipc	a3,0xa
ffffffffc02036b6:	99e68693          	addi	a3,a3,-1634 # ffffffffc020d050 <default_pmm_manager+0x558>
ffffffffc02036ba:	00009617          	auipc	a2,0x9
ffffffffc02036be:	95660613          	addi	a2,a2,-1706 # ffffffffc020c010 <commands+0x210>
ffffffffc02036c2:	26600593          	li	a1,614
ffffffffc02036c6:	00009517          	auipc	a0,0x9
ffffffffc02036ca:	58250513          	addi	a0,a0,1410 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02036ce:	dd1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036d2:	0000a697          	auipc	a3,0xa
ffffffffc02036d6:	96668693          	addi	a3,a3,-1690 # ffffffffc020d038 <default_pmm_manager+0x540>
ffffffffc02036da:	00009617          	auipc	a2,0x9
ffffffffc02036de:	93660613          	addi	a2,a2,-1738 # ffffffffc020c010 <commands+0x210>
ffffffffc02036e2:	26500593          	li	a1,613
ffffffffc02036e6:	00009517          	auipc	a0,0x9
ffffffffc02036ea:	56250513          	addi	a0,a0,1378 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02036ee:	db1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036f2:	0000a697          	auipc	a3,0xa
ffffffffc02036f6:	91668693          	addi	a3,a3,-1770 # ffffffffc020d008 <default_pmm_manager+0x510>
ffffffffc02036fa:	00009617          	auipc	a2,0x9
ffffffffc02036fe:	91660613          	addi	a2,a2,-1770 # ffffffffc020c010 <commands+0x210>
ffffffffc0203702:	26400593          	li	a1,612
ffffffffc0203706:	00009517          	auipc	a0,0x9
ffffffffc020370a:	54250513          	addi	a0,a0,1346 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020370e:	d91fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203712:	0000a697          	auipc	a3,0xa
ffffffffc0203716:	8de68693          	addi	a3,a3,-1826 # ffffffffc020cff0 <default_pmm_manager+0x4f8>
ffffffffc020371a:	00009617          	auipc	a2,0x9
ffffffffc020371e:	8f660613          	addi	a2,a2,-1802 # ffffffffc020c010 <commands+0x210>
ffffffffc0203722:	26200593          	li	a1,610
ffffffffc0203726:	00009517          	auipc	a0,0x9
ffffffffc020372a:	52250513          	addi	a0,a0,1314 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020372e:	d71fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203732:	0000a697          	auipc	a3,0xa
ffffffffc0203736:	89e68693          	addi	a3,a3,-1890 # ffffffffc020cfd0 <default_pmm_manager+0x4d8>
ffffffffc020373a:	00009617          	auipc	a2,0x9
ffffffffc020373e:	8d660613          	addi	a2,a2,-1834 # ffffffffc020c010 <commands+0x210>
ffffffffc0203742:	26100593          	li	a1,609
ffffffffc0203746:	00009517          	auipc	a0,0x9
ffffffffc020374a:	50250513          	addi	a0,a0,1282 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020374e:	d51fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203752:	0000a697          	auipc	a3,0xa
ffffffffc0203756:	86e68693          	addi	a3,a3,-1938 # ffffffffc020cfc0 <default_pmm_manager+0x4c8>
ffffffffc020375a:	00009617          	auipc	a2,0x9
ffffffffc020375e:	8b660613          	addi	a2,a2,-1866 # ffffffffc020c010 <commands+0x210>
ffffffffc0203762:	26000593          	li	a1,608
ffffffffc0203766:	00009517          	auipc	a0,0x9
ffffffffc020376a:	4e250513          	addi	a0,a0,1250 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020376e:	d31fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203772:	0000a697          	auipc	a3,0xa
ffffffffc0203776:	83e68693          	addi	a3,a3,-1986 # ffffffffc020cfb0 <default_pmm_manager+0x4b8>
ffffffffc020377a:	00009617          	auipc	a2,0x9
ffffffffc020377e:	89660613          	addi	a2,a2,-1898 # ffffffffc020c010 <commands+0x210>
ffffffffc0203782:	25f00593          	li	a1,607
ffffffffc0203786:	00009517          	auipc	a0,0x9
ffffffffc020378a:	4c250513          	addi	a0,a0,1218 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020378e:	d11fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203792:	00009697          	auipc	a3,0x9
ffffffffc0203796:	7e668693          	addi	a3,a3,2022 # ffffffffc020cf78 <default_pmm_manager+0x480>
ffffffffc020379a:	00009617          	auipc	a2,0x9
ffffffffc020379e:	87660613          	addi	a2,a2,-1930 # ffffffffc020c010 <commands+0x210>
ffffffffc02037a2:	25e00593          	li	a1,606
ffffffffc02037a6:	00009517          	auipc	a0,0x9
ffffffffc02037aa:	4a250513          	addi	a0,a0,1186 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02037ae:	cf1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037b2:	0000a697          	auipc	a3,0xa
ffffffffc02037b6:	91668693          	addi	a3,a3,-1770 # ffffffffc020d0c8 <default_pmm_manager+0x5d0>
ffffffffc02037ba:	00009617          	auipc	a2,0x9
ffffffffc02037be:	85660613          	addi	a2,a2,-1962 # ffffffffc020c010 <commands+0x210>
ffffffffc02037c2:	27b00593          	li	a1,635
ffffffffc02037c6:	00009517          	auipc	a0,0x9
ffffffffc02037ca:	48250513          	addi	a0,a0,1154 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02037ce:	cd1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037d2:	00009617          	auipc	a2,0x9
ffffffffc02037d6:	35e60613          	addi	a2,a2,862 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc02037da:	07100593          	li	a1,113
ffffffffc02037de:	00009517          	auipc	a0,0x9
ffffffffc02037e2:	37a50513          	addi	a0,a0,890 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc02037e6:	cb9fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037ea:	86a2                	mv	a3,s0
ffffffffc02037ec:	00009617          	auipc	a2,0x9
ffffffffc02037f0:	3ec60613          	addi	a2,a2,1004 # ffffffffc020cbd8 <default_pmm_manager+0xe0>
ffffffffc02037f4:	0ca00593          	li	a1,202
ffffffffc02037f8:	00009517          	auipc	a0,0x9
ffffffffc02037fc:	45050513          	addi	a0,a0,1104 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203800:	c9ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203804:	00009617          	auipc	a2,0x9
ffffffffc0203808:	3d460613          	addi	a2,a2,980 # ffffffffc020cbd8 <default_pmm_manager+0xe0>
ffffffffc020380c:	08100593          	li	a1,129
ffffffffc0203810:	00009517          	auipc	a0,0x9
ffffffffc0203814:	43850513          	addi	a0,a0,1080 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203818:	c87fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020381c:	00009697          	auipc	a3,0x9
ffffffffc0203820:	71c68693          	addi	a3,a3,1820 # ffffffffc020cf38 <default_pmm_manager+0x440>
ffffffffc0203824:	00008617          	auipc	a2,0x8
ffffffffc0203828:	7ec60613          	addi	a2,a2,2028 # ffffffffc020c010 <commands+0x210>
ffffffffc020382c:	25d00593          	li	a1,605
ffffffffc0203830:	00009517          	auipc	a0,0x9
ffffffffc0203834:	41850513          	addi	a0,a0,1048 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203838:	c67fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020383c:	00009697          	auipc	a3,0x9
ffffffffc0203840:	63c68693          	addi	a3,a3,1596 # ffffffffc020ce78 <default_pmm_manager+0x380>
ffffffffc0203844:	00008617          	auipc	a2,0x8
ffffffffc0203848:	7cc60613          	addi	a2,a2,1996 # ffffffffc020c010 <commands+0x210>
ffffffffc020384c:	25100593          	li	a1,593
ffffffffc0203850:	00009517          	auipc	a0,0x9
ffffffffc0203854:	3f850513          	addi	a0,a0,1016 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203858:	c47fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020385c:	981fe0ef          	jal	ra,ffffffffc02021dc <pte2page.part.0>
ffffffffc0203860:	00009697          	auipc	a3,0x9
ffffffffc0203864:	64868693          	addi	a3,a3,1608 # ffffffffc020cea8 <default_pmm_manager+0x3b0>
ffffffffc0203868:	00008617          	auipc	a2,0x8
ffffffffc020386c:	7a860613          	addi	a2,a2,1960 # ffffffffc020c010 <commands+0x210>
ffffffffc0203870:	25400593          	li	a1,596
ffffffffc0203874:	00009517          	auipc	a0,0x9
ffffffffc0203878:	3d450513          	addi	a0,a0,980 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020387c:	c23fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203880:	00009697          	auipc	a3,0x9
ffffffffc0203884:	5c868693          	addi	a3,a3,1480 # ffffffffc020ce48 <default_pmm_manager+0x350>
ffffffffc0203888:	00008617          	auipc	a2,0x8
ffffffffc020388c:	78860613          	addi	a2,a2,1928 # ffffffffc020c010 <commands+0x210>
ffffffffc0203890:	24d00593          	li	a1,589
ffffffffc0203894:	00009517          	auipc	a0,0x9
ffffffffc0203898:	3b450513          	addi	a0,a0,948 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020389c:	c03fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038a0:	00009697          	auipc	a3,0x9
ffffffffc02038a4:	63868693          	addi	a3,a3,1592 # ffffffffc020ced8 <default_pmm_manager+0x3e0>
ffffffffc02038a8:	00008617          	auipc	a2,0x8
ffffffffc02038ac:	76860613          	addi	a2,a2,1896 # ffffffffc020c010 <commands+0x210>
ffffffffc02038b0:	25500593          	li	a1,597
ffffffffc02038b4:	00009517          	auipc	a0,0x9
ffffffffc02038b8:	39450513          	addi	a0,a0,916 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02038bc:	be3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038c0:	00009617          	auipc	a2,0x9
ffffffffc02038c4:	27060613          	addi	a2,a2,624 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc02038c8:	25800593          	li	a1,600
ffffffffc02038cc:	00009517          	auipc	a0,0x9
ffffffffc02038d0:	37c50513          	addi	a0,a0,892 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02038d4:	bcbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038d8:	00009697          	auipc	a3,0x9
ffffffffc02038dc:	61868693          	addi	a3,a3,1560 # ffffffffc020cef0 <default_pmm_manager+0x3f8>
ffffffffc02038e0:	00008617          	auipc	a2,0x8
ffffffffc02038e4:	73060613          	addi	a2,a2,1840 # ffffffffc020c010 <commands+0x210>
ffffffffc02038e8:	25600593          	li	a1,598
ffffffffc02038ec:	00009517          	auipc	a0,0x9
ffffffffc02038f0:	35c50513          	addi	a0,a0,860 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc02038f4:	babfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038f8:	86ca                	mv	a3,s2
ffffffffc02038fa:	00009617          	auipc	a2,0x9
ffffffffc02038fe:	2de60613          	addi	a2,a2,734 # ffffffffc020cbd8 <default_pmm_manager+0xe0>
ffffffffc0203902:	0c600593          	li	a1,198
ffffffffc0203906:	00009517          	auipc	a0,0x9
ffffffffc020390a:	34250513          	addi	a0,a0,834 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020390e:	b91fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203912:	00009697          	auipc	a3,0x9
ffffffffc0203916:	73e68693          	addi	a3,a3,1854 # ffffffffc020d050 <default_pmm_manager+0x558>
ffffffffc020391a:	00008617          	auipc	a2,0x8
ffffffffc020391e:	6f660613          	addi	a2,a2,1782 # ffffffffc020c010 <commands+0x210>
ffffffffc0203922:	27100593          	li	a1,625
ffffffffc0203926:	00009517          	auipc	a0,0x9
ffffffffc020392a:	32250513          	addi	a0,a0,802 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020392e:	b71fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203932:	00009697          	auipc	a3,0x9
ffffffffc0203936:	74e68693          	addi	a3,a3,1870 # ffffffffc020d080 <default_pmm_manager+0x588>
ffffffffc020393a:	00008617          	auipc	a2,0x8
ffffffffc020393e:	6d660613          	addi	a2,a2,1750 # ffffffffc020c010 <commands+0x210>
ffffffffc0203942:	27000593          	li	a1,624
ffffffffc0203946:	00009517          	auipc	a0,0x9
ffffffffc020394a:	30250513          	addi	a0,a0,770 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc020394e:	b51fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203952 <copy_range>:
ffffffffc0203952:	7159                	addi	sp,sp,-112
ffffffffc0203954:	00d667b3          	or	a5,a2,a3
ffffffffc0203958:	f486                	sd	ra,104(sp)
ffffffffc020395a:	f0a2                	sd	s0,96(sp)
ffffffffc020395c:	eca6                	sd	s1,88(sp)
ffffffffc020395e:	e8ca                	sd	s2,80(sp)
ffffffffc0203960:	e4ce                	sd	s3,72(sp)
ffffffffc0203962:	e0d2                	sd	s4,64(sp)
ffffffffc0203964:	fc56                	sd	s5,56(sp)
ffffffffc0203966:	f85a                	sd	s6,48(sp)
ffffffffc0203968:	f45e                	sd	s7,40(sp)
ffffffffc020396a:	f062                	sd	s8,32(sp)
ffffffffc020396c:	ec66                	sd	s9,24(sp)
ffffffffc020396e:	e86a                	sd	s10,16(sp)
ffffffffc0203970:	e46e                	sd	s11,8(sp)
ffffffffc0203972:	17d2                	slli	a5,a5,0x34
ffffffffc0203974:	20079f63          	bnez	a5,ffffffffc0203b92 <copy_range+0x240>
ffffffffc0203978:	002007b7          	lui	a5,0x200
ffffffffc020397c:	8432                	mv	s0,a2
ffffffffc020397e:	1af66263          	bltu	a2,a5,ffffffffc0203b22 <copy_range+0x1d0>
ffffffffc0203982:	8936                	mv	s2,a3
ffffffffc0203984:	18d67f63          	bgeu	a2,a3,ffffffffc0203b22 <copy_range+0x1d0>
ffffffffc0203988:	4785                	li	a5,1
ffffffffc020398a:	07fe                	slli	a5,a5,0x1f
ffffffffc020398c:	18d7eb63          	bltu	a5,a3,ffffffffc0203b22 <copy_range+0x1d0>
ffffffffc0203990:	5b7d                	li	s6,-1
ffffffffc0203992:	8aaa                	mv	s5,a0
ffffffffc0203994:	89ae                	mv	s3,a1
ffffffffc0203996:	6a05                	lui	s4,0x1
ffffffffc0203998:	00093c17          	auipc	s8,0x93
ffffffffc020399c:	f38c0c13          	addi	s8,s8,-200 # ffffffffc02968d0 <npage>
ffffffffc02039a0:	00093b97          	auipc	s7,0x93
ffffffffc02039a4:	f38b8b93          	addi	s7,s7,-200 # ffffffffc02968d8 <pages>
ffffffffc02039a8:	00cb5b13          	srli	s6,s6,0xc
ffffffffc02039ac:	00093c97          	auipc	s9,0x93
ffffffffc02039b0:	f34c8c93          	addi	s9,s9,-204 # ffffffffc02968e0 <pmm_manager>
ffffffffc02039b4:	4601                	li	a2,0
ffffffffc02039b6:	85a2                	mv	a1,s0
ffffffffc02039b8:	854e                	mv	a0,s3
ffffffffc02039ba:	8f7fe0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc02039be:	84aa                	mv	s1,a0
ffffffffc02039c0:	0e050c63          	beqz	a0,ffffffffc0203ab8 <copy_range+0x166>
ffffffffc02039c4:	611c                	ld	a5,0(a0)
ffffffffc02039c6:	8b85                	andi	a5,a5,1
ffffffffc02039c8:	e785                	bnez	a5,ffffffffc02039f0 <copy_range+0x9e>
ffffffffc02039ca:	9452                	add	s0,s0,s4
ffffffffc02039cc:	ff2464e3          	bltu	s0,s2,ffffffffc02039b4 <copy_range+0x62>
ffffffffc02039d0:	4501                	li	a0,0
ffffffffc02039d2:	70a6                	ld	ra,104(sp)
ffffffffc02039d4:	7406                	ld	s0,96(sp)
ffffffffc02039d6:	64e6                	ld	s1,88(sp)
ffffffffc02039d8:	6946                	ld	s2,80(sp)
ffffffffc02039da:	69a6                	ld	s3,72(sp)
ffffffffc02039dc:	6a06                	ld	s4,64(sp)
ffffffffc02039de:	7ae2                	ld	s5,56(sp)
ffffffffc02039e0:	7b42                	ld	s6,48(sp)
ffffffffc02039e2:	7ba2                	ld	s7,40(sp)
ffffffffc02039e4:	7c02                	ld	s8,32(sp)
ffffffffc02039e6:	6ce2                	ld	s9,24(sp)
ffffffffc02039e8:	6d42                	ld	s10,16(sp)
ffffffffc02039ea:	6da2                	ld	s11,8(sp)
ffffffffc02039ec:	6165                	addi	sp,sp,112
ffffffffc02039ee:	8082                	ret
ffffffffc02039f0:	4605                	li	a2,1
ffffffffc02039f2:	85a2                	mv	a1,s0
ffffffffc02039f4:	8556                	mv	a0,s5
ffffffffc02039f6:	8bbfe0ef          	jal	ra,ffffffffc02022b0 <get_pte>
ffffffffc02039fa:	c56d                	beqz	a0,ffffffffc0203ae4 <copy_range+0x192>
ffffffffc02039fc:	609c                	ld	a5,0(s1)
ffffffffc02039fe:	0017f713          	andi	a4,a5,1
ffffffffc0203a02:	01f7f493          	andi	s1,a5,31
ffffffffc0203a06:	16070a63          	beqz	a4,ffffffffc0203b7a <copy_range+0x228>
ffffffffc0203a0a:	000c3683          	ld	a3,0(s8)
ffffffffc0203a0e:	078a                	slli	a5,a5,0x2
ffffffffc0203a10:	00c7d713          	srli	a4,a5,0xc
ffffffffc0203a14:	14d77763          	bgeu	a4,a3,ffffffffc0203b62 <copy_range+0x210>
ffffffffc0203a18:	000bb783          	ld	a5,0(s7)
ffffffffc0203a1c:	fff806b7          	lui	a3,0xfff80
ffffffffc0203a20:	9736                	add	a4,a4,a3
ffffffffc0203a22:	071a                	slli	a4,a4,0x6
ffffffffc0203a24:	00e78db3          	add	s11,a5,a4
ffffffffc0203a28:	10002773          	csrr	a4,sstatus
ffffffffc0203a2c:	8b09                	andi	a4,a4,2
ffffffffc0203a2e:	e345                	bnez	a4,ffffffffc0203ace <copy_range+0x17c>
ffffffffc0203a30:	000cb703          	ld	a4,0(s9)
ffffffffc0203a34:	4505                	li	a0,1
ffffffffc0203a36:	6f18                	ld	a4,24(a4)
ffffffffc0203a38:	9702                	jalr	a4
ffffffffc0203a3a:	8d2a                	mv	s10,a0
ffffffffc0203a3c:	0c0d8363          	beqz	s11,ffffffffc0203b02 <copy_range+0x1b0>
ffffffffc0203a40:	100d0163          	beqz	s10,ffffffffc0203b42 <copy_range+0x1f0>
ffffffffc0203a44:	000bb703          	ld	a4,0(s7)
ffffffffc0203a48:	000805b7          	lui	a1,0x80
ffffffffc0203a4c:	000c3603          	ld	a2,0(s8)
ffffffffc0203a50:	40ed86b3          	sub	a3,s11,a4
ffffffffc0203a54:	8699                	srai	a3,a3,0x6
ffffffffc0203a56:	96ae                	add	a3,a3,a1
ffffffffc0203a58:	0166f7b3          	and	a5,a3,s6
ffffffffc0203a5c:	06b2                	slli	a3,a3,0xc
ffffffffc0203a5e:	08c7f663          	bgeu	a5,a2,ffffffffc0203aea <copy_range+0x198>
ffffffffc0203a62:	40ed07b3          	sub	a5,s10,a4
ffffffffc0203a66:	00093717          	auipc	a4,0x93
ffffffffc0203a6a:	e8270713          	addi	a4,a4,-382 # ffffffffc02968e8 <va_pa_offset>
ffffffffc0203a6e:	6308                	ld	a0,0(a4)
ffffffffc0203a70:	8799                	srai	a5,a5,0x6
ffffffffc0203a72:	97ae                	add	a5,a5,a1
ffffffffc0203a74:	0167f733          	and	a4,a5,s6
ffffffffc0203a78:	00a685b3          	add	a1,a3,a0
ffffffffc0203a7c:	07b2                	slli	a5,a5,0xc
ffffffffc0203a7e:	06c77563          	bgeu	a4,a2,ffffffffc0203ae8 <copy_range+0x196>
ffffffffc0203a82:	6605                	lui	a2,0x1
ffffffffc0203a84:	953e                	add	a0,a0,a5
ffffffffc0203a86:	0f6080ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc0203a8a:	86a6                	mv	a3,s1
ffffffffc0203a8c:	8622                	mv	a2,s0
ffffffffc0203a8e:	85ea                	mv	a1,s10
ffffffffc0203a90:	8556                	mv	a0,s5
ffffffffc0203a92:	fd5fe0ef          	jal	ra,ffffffffc0202a66 <page_insert>
ffffffffc0203a96:	d915                	beqz	a0,ffffffffc02039ca <copy_range+0x78>
ffffffffc0203a98:	0000a697          	auipc	a3,0xa
ffffffffc0203a9c:	85868693          	addi	a3,a3,-1960 # ffffffffc020d2f0 <default_pmm_manager+0x7f8>
ffffffffc0203aa0:	00008617          	auipc	a2,0x8
ffffffffc0203aa4:	57060613          	addi	a2,a2,1392 # ffffffffc020c010 <commands+0x210>
ffffffffc0203aa8:	1e900593          	li	a1,489
ffffffffc0203aac:	00009517          	auipc	a0,0x9
ffffffffc0203ab0:	19c50513          	addi	a0,a0,412 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203ab4:	9ebfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ab8:	00200637          	lui	a2,0x200
ffffffffc0203abc:	9432                	add	s0,s0,a2
ffffffffc0203abe:	ffe00637          	lui	a2,0xffe00
ffffffffc0203ac2:	8c71                	and	s0,s0,a2
ffffffffc0203ac4:	f00406e3          	beqz	s0,ffffffffc02039d0 <copy_range+0x7e>
ffffffffc0203ac8:	ef2466e3          	bltu	s0,s2,ffffffffc02039b4 <copy_range+0x62>
ffffffffc0203acc:	b711                	j	ffffffffc02039d0 <copy_range+0x7e>
ffffffffc0203ace:	9a4fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203ad2:	000cb703          	ld	a4,0(s9)
ffffffffc0203ad6:	4505                	li	a0,1
ffffffffc0203ad8:	6f18                	ld	a4,24(a4)
ffffffffc0203ada:	9702                	jalr	a4
ffffffffc0203adc:	8d2a                	mv	s10,a0
ffffffffc0203ade:	98efd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203ae2:	bfa9                	j	ffffffffc0203a3c <copy_range+0xea>
ffffffffc0203ae4:	5571                	li	a0,-4
ffffffffc0203ae6:	b5f5                	j	ffffffffc02039d2 <copy_range+0x80>
ffffffffc0203ae8:	86be                	mv	a3,a5
ffffffffc0203aea:	00009617          	auipc	a2,0x9
ffffffffc0203aee:	04660613          	addi	a2,a2,70 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc0203af2:	07100593          	li	a1,113
ffffffffc0203af6:	00009517          	auipc	a0,0x9
ffffffffc0203afa:	06250513          	addi	a0,a0,98 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc0203afe:	9a1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b02:	00009697          	auipc	a3,0x9
ffffffffc0203b06:	7ce68693          	addi	a3,a3,1998 # ffffffffc020d2d0 <default_pmm_manager+0x7d8>
ffffffffc0203b0a:	00008617          	auipc	a2,0x8
ffffffffc0203b0e:	50660613          	addi	a2,a2,1286 # ffffffffc020c010 <commands+0x210>
ffffffffc0203b12:	1ce00593          	li	a1,462
ffffffffc0203b16:	00009517          	auipc	a0,0x9
ffffffffc0203b1a:	13250513          	addi	a0,a0,306 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203b1e:	981fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b22:	00009697          	auipc	a3,0x9
ffffffffc0203b26:	18e68693          	addi	a3,a3,398 # ffffffffc020ccb0 <default_pmm_manager+0x1b8>
ffffffffc0203b2a:	00008617          	auipc	a2,0x8
ffffffffc0203b2e:	4e660613          	addi	a2,a2,1254 # ffffffffc020c010 <commands+0x210>
ffffffffc0203b32:	1b600593          	li	a1,438
ffffffffc0203b36:	00009517          	auipc	a0,0x9
ffffffffc0203b3a:	11250513          	addi	a0,a0,274 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203b3e:	961fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b42:	00009697          	auipc	a3,0x9
ffffffffc0203b46:	79e68693          	addi	a3,a3,1950 # ffffffffc020d2e0 <default_pmm_manager+0x7e8>
ffffffffc0203b4a:	00008617          	auipc	a2,0x8
ffffffffc0203b4e:	4c660613          	addi	a2,a2,1222 # ffffffffc020c010 <commands+0x210>
ffffffffc0203b52:	1cf00593          	li	a1,463
ffffffffc0203b56:	00009517          	auipc	a0,0x9
ffffffffc0203b5a:	0f250513          	addi	a0,a0,242 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203b5e:	941fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b62:	00009617          	auipc	a2,0x9
ffffffffc0203b66:	09e60613          	addi	a2,a2,158 # ffffffffc020cc00 <default_pmm_manager+0x108>
ffffffffc0203b6a:	06900593          	li	a1,105
ffffffffc0203b6e:	00009517          	auipc	a0,0x9
ffffffffc0203b72:	fea50513          	addi	a0,a0,-22 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc0203b76:	929fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b7a:	00009617          	auipc	a2,0x9
ffffffffc0203b7e:	0a660613          	addi	a2,a2,166 # ffffffffc020cc20 <default_pmm_manager+0x128>
ffffffffc0203b82:	07f00593          	li	a1,127
ffffffffc0203b86:	00009517          	auipc	a0,0x9
ffffffffc0203b8a:	fd250513          	addi	a0,a0,-46 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc0203b8e:	911fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b92:	00009697          	auipc	a3,0x9
ffffffffc0203b96:	0ee68693          	addi	a3,a3,238 # ffffffffc020cc80 <default_pmm_manager+0x188>
ffffffffc0203b9a:	00008617          	auipc	a2,0x8
ffffffffc0203b9e:	47660613          	addi	a2,a2,1142 # ffffffffc020c010 <commands+0x210>
ffffffffc0203ba2:	1b500593          	li	a1,437
ffffffffc0203ba6:	00009517          	auipc	a0,0x9
ffffffffc0203baa:	0a250513          	addi	a0,a0,162 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203bae:	8f1fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203bb2 <pgdir_alloc_page>:
ffffffffc0203bb2:	7179                	addi	sp,sp,-48
ffffffffc0203bb4:	ec26                	sd	s1,24(sp)
ffffffffc0203bb6:	e84a                	sd	s2,16(sp)
ffffffffc0203bb8:	e052                	sd	s4,0(sp)
ffffffffc0203bba:	f406                	sd	ra,40(sp)
ffffffffc0203bbc:	f022                	sd	s0,32(sp)
ffffffffc0203bbe:	e44e                	sd	s3,8(sp)
ffffffffc0203bc0:	8a2a                	mv	s4,a0
ffffffffc0203bc2:	84ae                	mv	s1,a1
ffffffffc0203bc4:	8932                	mv	s2,a2
ffffffffc0203bc6:	100027f3          	csrr	a5,sstatus
ffffffffc0203bca:	8b89                	andi	a5,a5,2
ffffffffc0203bcc:	00093997          	auipc	s3,0x93
ffffffffc0203bd0:	d1498993          	addi	s3,s3,-748 # ffffffffc02968e0 <pmm_manager>
ffffffffc0203bd4:	ef8d                	bnez	a5,ffffffffc0203c0e <pgdir_alloc_page+0x5c>
ffffffffc0203bd6:	0009b783          	ld	a5,0(s3)
ffffffffc0203bda:	4505                	li	a0,1
ffffffffc0203bdc:	6f9c                	ld	a5,24(a5)
ffffffffc0203bde:	9782                	jalr	a5
ffffffffc0203be0:	842a                	mv	s0,a0
ffffffffc0203be2:	cc09                	beqz	s0,ffffffffc0203bfc <pgdir_alloc_page+0x4a>
ffffffffc0203be4:	86ca                	mv	a3,s2
ffffffffc0203be6:	8626                	mv	a2,s1
ffffffffc0203be8:	85a2                	mv	a1,s0
ffffffffc0203bea:	8552                	mv	a0,s4
ffffffffc0203bec:	e7bfe0ef          	jal	ra,ffffffffc0202a66 <page_insert>
ffffffffc0203bf0:	e915                	bnez	a0,ffffffffc0203c24 <pgdir_alloc_page+0x72>
ffffffffc0203bf2:	4018                	lw	a4,0(s0)
ffffffffc0203bf4:	fc04                	sd	s1,56(s0)
ffffffffc0203bf6:	4785                	li	a5,1
ffffffffc0203bf8:	04f71e63          	bne	a4,a5,ffffffffc0203c54 <pgdir_alloc_page+0xa2>
ffffffffc0203bfc:	70a2                	ld	ra,40(sp)
ffffffffc0203bfe:	8522                	mv	a0,s0
ffffffffc0203c00:	7402                	ld	s0,32(sp)
ffffffffc0203c02:	64e2                	ld	s1,24(sp)
ffffffffc0203c04:	6942                	ld	s2,16(sp)
ffffffffc0203c06:	69a2                	ld	s3,8(sp)
ffffffffc0203c08:	6a02                	ld	s4,0(sp)
ffffffffc0203c0a:	6145                	addi	sp,sp,48
ffffffffc0203c0c:	8082                	ret
ffffffffc0203c0e:	864fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203c12:	0009b783          	ld	a5,0(s3)
ffffffffc0203c16:	4505                	li	a0,1
ffffffffc0203c18:	6f9c                	ld	a5,24(a5)
ffffffffc0203c1a:	9782                	jalr	a5
ffffffffc0203c1c:	842a                	mv	s0,a0
ffffffffc0203c1e:	84efd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203c22:	b7c1                	j	ffffffffc0203be2 <pgdir_alloc_page+0x30>
ffffffffc0203c24:	100027f3          	csrr	a5,sstatus
ffffffffc0203c28:	8b89                	andi	a5,a5,2
ffffffffc0203c2a:	eb89                	bnez	a5,ffffffffc0203c3c <pgdir_alloc_page+0x8a>
ffffffffc0203c2c:	0009b783          	ld	a5,0(s3)
ffffffffc0203c30:	8522                	mv	a0,s0
ffffffffc0203c32:	4585                	li	a1,1
ffffffffc0203c34:	739c                	ld	a5,32(a5)
ffffffffc0203c36:	4401                	li	s0,0
ffffffffc0203c38:	9782                	jalr	a5
ffffffffc0203c3a:	b7c9                	j	ffffffffc0203bfc <pgdir_alloc_page+0x4a>
ffffffffc0203c3c:	836fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203c40:	0009b783          	ld	a5,0(s3)
ffffffffc0203c44:	8522                	mv	a0,s0
ffffffffc0203c46:	4585                	li	a1,1
ffffffffc0203c48:	739c                	ld	a5,32(a5)
ffffffffc0203c4a:	4401                	li	s0,0
ffffffffc0203c4c:	9782                	jalr	a5
ffffffffc0203c4e:	81efd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203c52:	b76d                	j	ffffffffc0203bfc <pgdir_alloc_page+0x4a>
ffffffffc0203c54:	00009697          	auipc	a3,0x9
ffffffffc0203c58:	6ac68693          	addi	a3,a3,1708 # ffffffffc020d300 <default_pmm_manager+0x808>
ffffffffc0203c5c:	00008617          	auipc	a2,0x8
ffffffffc0203c60:	3b460613          	addi	a2,a2,948 # ffffffffc020c010 <commands+0x210>
ffffffffc0203c64:	23200593          	li	a1,562
ffffffffc0203c68:	00009517          	auipc	a0,0x9
ffffffffc0203c6c:	fe050513          	addi	a0,a0,-32 # ffffffffc020cc48 <default_pmm_manager+0x150>
ffffffffc0203c70:	82ffc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203c74 <check_vma_overlap.part.0>:
ffffffffc0203c74:	1141                	addi	sp,sp,-16
ffffffffc0203c76:	00009697          	auipc	a3,0x9
ffffffffc0203c7a:	6a268693          	addi	a3,a3,1698 # ffffffffc020d318 <default_pmm_manager+0x820>
ffffffffc0203c7e:	00008617          	auipc	a2,0x8
ffffffffc0203c82:	39260613          	addi	a2,a2,914 # ffffffffc020c010 <commands+0x210>
ffffffffc0203c86:	07400593          	li	a1,116
ffffffffc0203c8a:	00009517          	auipc	a0,0x9
ffffffffc0203c8e:	6ae50513          	addi	a0,a0,1710 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc0203c92:	e406                	sd	ra,8(sp)
ffffffffc0203c94:	80bfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203c98 <mm_create>:
ffffffffc0203c98:	1141                	addi	sp,sp,-16
ffffffffc0203c9a:	05800513          	li	a0,88
ffffffffc0203c9e:	e022                	sd	s0,0(sp)
ffffffffc0203ca0:	e406                	sd	ra,8(sp)
ffffffffc0203ca2:	b78fe0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0203ca6:	842a                	mv	s0,a0
ffffffffc0203ca8:	c115                	beqz	a0,ffffffffc0203ccc <mm_create+0x34>
ffffffffc0203caa:	e408                	sd	a0,8(s0)
ffffffffc0203cac:	e008                	sd	a0,0(s0)
ffffffffc0203cae:	00053823          	sd	zero,16(a0)
ffffffffc0203cb2:	00053c23          	sd	zero,24(a0)
ffffffffc0203cb6:	02052023          	sw	zero,32(a0)
ffffffffc0203cba:	02053423          	sd	zero,40(a0)
ffffffffc0203cbe:	02052823          	sw	zero,48(a0)
ffffffffc0203cc2:	4585                	li	a1,1
ffffffffc0203cc4:	03850513          	addi	a0,a0,56
ffffffffc0203cc8:	123000ef          	jal	ra,ffffffffc02045ea <sem_init>
ffffffffc0203ccc:	60a2                	ld	ra,8(sp)
ffffffffc0203cce:	8522                	mv	a0,s0
ffffffffc0203cd0:	6402                	ld	s0,0(sp)
ffffffffc0203cd2:	0141                	addi	sp,sp,16
ffffffffc0203cd4:	8082                	ret

ffffffffc0203cd6 <find_vma>:
ffffffffc0203cd6:	86aa                	mv	a3,a0
ffffffffc0203cd8:	c505                	beqz	a0,ffffffffc0203d00 <find_vma+0x2a>
ffffffffc0203cda:	6908                	ld	a0,16(a0)
ffffffffc0203cdc:	c501                	beqz	a0,ffffffffc0203ce4 <find_vma+0xe>
ffffffffc0203cde:	651c                	ld	a5,8(a0)
ffffffffc0203ce0:	02f5f263          	bgeu	a1,a5,ffffffffc0203d04 <find_vma+0x2e>
ffffffffc0203ce4:	669c                	ld	a5,8(a3)
ffffffffc0203ce6:	00f68d63          	beq	a3,a5,ffffffffc0203d00 <find_vma+0x2a>
ffffffffc0203cea:	fe87b703          	ld	a4,-24(a5) # 1fffe8 <_binary_bin_sfs_img_size+0x18ace8>
ffffffffc0203cee:	00e5e663          	bltu	a1,a4,ffffffffc0203cfa <find_vma+0x24>
ffffffffc0203cf2:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203cf6:	00e5ec63          	bltu	a1,a4,ffffffffc0203d0e <find_vma+0x38>
ffffffffc0203cfa:	679c                	ld	a5,8(a5)
ffffffffc0203cfc:	fef697e3          	bne	a3,a5,ffffffffc0203cea <find_vma+0x14>
ffffffffc0203d00:	4501                	li	a0,0
ffffffffc0203d02:	8082                	ret
ffffffffc0203d04:	691c                	ld	a5,16(a0)
ffffffffc0203d06:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0203ce4 <find_vma+0xe>
ffffffffc0203d0a:	ea88                	sd	a0,16(a3)
ffffffffc0203d0c:	8082                	ret
ffffffffc0203d0e:	fe078513          	addi	a0,a5,-32
ffffffffc0203d12:	ea88                	sd	a0,16(a3)
ffffffffc0203d14:	8082                	ret

ffffffffc0203d16 <insert_vma_struct>:
ffffffffc0203d16:	6590                	ld	a2,8(a1)
ffffffffc0203d18:	0105b803          	ld	a6,16(a1) # 80010 <_binary_bin_sfs_img_size+0xad10>
ffffffffc0203d1c:	1141                	addi	sp,sp,-16
ffffffffc0203d1e:	e406                	sd	ra,8(sp)
ffffffffc0203d20:	87aa                	mv	a5,a0
ffffffffc0203d22:	01066763          	bltu	a2,a6,ffffffffc0203d30 <insert_vma_struct+0x1a>
ffffffffc0203d26:	a085                	j	ffffffffc0203d86 <insert_vma_struct+0x70>
ffffffffc0203d28:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203d2c:	04e66863          	bltu	a2,a4,ffffffffc0203d7c <insert_vma_struct+0x66>
ffffffffc0203d30:	86be                	mv	a3,a5
ffffffffc0203d32:	679c                	ld	a5,8(a5)
ffffffffc0203d34:	fef51ae3          	bne	a0,a5,ffffffffc0203d28 <insert_vma_struct+0x12>
ffffffffc0203d38:	02a68463          	beq	a3,a0,ffffffffc0203d60 <insert_vma_struct+0x4a>
ffffffffc0203d3c:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203d40:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203d44:	08e8f163          	bgeu	a7,a4,ffffffffc0203dc6 <insert_vma_struct+0xb0>
ffffffffc0203d48:	04e66f63          	bltu	a2,a4,ffffffffc0203da6 <insert_vma_struct+0x90>
ffffffffc0203d4c:	00f50a63          	beq	a0,a5,ffffffffc0203d60 <insert_vma_struct+0x4a>
ffffffffc0203d50:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203d54:	05076963          	bltu	a4,a6,ffffffffc0203da6 <insert_vma_struct+0x90>
ffffffffc0203d58:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203d5c:	02c77363          	bgeu	a4,a2,ffffffffc0203d82 <insert_vma_struct+0x6c>
ffffffffc0203d60:	5118                	lw	a4,32(a0)
ffffffffc0203d62:	e188                	sd	a0,0(a1)
ffffffffc0203d64:	02058613          	addi	a2,a1,32
ffffffffc0203d68:	e390                	sd	a2,0(a5)
ffffffffc0203d6a:	e690                	sd	a2,8(a3)
ffffffffc0203d6c:	60a2                	ld	ra,8(sp)
ffffffffc0203d6e:	f59c                	sd	a5,40(a1)
ffffffffc0203d70:	f194                	sd	a3,32(a1)
ffffffffc0203d72:	0017079b          	addiw	a5,a4,1
ffffffffc0203d76:	d11c                	sw	a5,32(a0)
ffffffffc0203d78:	0141                	addi	sp,sp,16
ffffffffc0203d7a:	8082                	ret
ffffffffc0203d7c:	fca690e3          	bne	a3,a0,ffffffffc0203d3c <insert_vma_struct+0x26>
ffffffffc0203d80:	bfd1                	j	ffffffffc0203d54 <insert_vma_struct+0x3e>
ffffffffc0203d82:	ef3ff0ef          	jal	ra,ffffffffc0203c74 <check_vma_overlap.part.0>
ffffffffc0203d86:	00009697          	auipc	a3,0x9
ffffffffc0203d8a:	5c268693          	addi	a3,a3,1474 # ffffffffc020d348 <default_pmm_manager+0x850>
ffffffffc0203d8e:	00008617          	auipc	a2,0x8
ffffffffc0203d92:	28260613          	addi	a2,a2,642 # ffffffffc020c010 <commands+0x210>
ffffffffc0203d96:	07a00593          	li	a1,122
ffffffffc0203d9a:	00009517          	auipc	a0,0x9
ffffffffc0203d9e:	59e50513          	addi	a0,a0,1438 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc0203da2:	efcfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203da6:	00009697          	auipc	a3,0x9
ffffffffc0203daa:	5e268693          	addi	a3,a3,1506 # ffffffffc020d388 <default_pmm_manager+0x890>
ffffffffc0203dae:	00008617          	auipc	a2,0x8
ffffffffc0203db2:	26260613          	addi	a2,a2,610 # ffffffffc020c010 <commands+0x210>
ffffffffc0203db6:	07300593          	li	a1,115
ffffffffc0203dba:	00009517          	auipc	a0,0x9
ffffffffc0203dbe:	57e50513          	addi	a0,a0,1406 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc0203dc2:	edcfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203dc6:	00009697          	auipc	a3,0x9
ffffffffc0203dca:	5a268693          	addi	a3,a3,1442 # ffffffffc020d368 <default_pmm_manager+0x870>
ffffffffc0203dce:	00008617          	auipc	a2,0x8
ffffffffc0203dd2:	24260613          	addi	a2,a2,578 # ffffffffc020c010 <commands+0x210>
ffffffffc0203dd6:	07200593          	li	a1,114
ffffffffc0203dda:	00009517          	auipc	a0,0x9
ffffffffc0203dde:	55e50513          	addi	a0,a0,1374 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc0203de2:	ebcfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203de6 <mm_destroy>:
ffffffffc0203de6:	591c                	lw	a5,48(a0)
ffffffffc0203de8:	1141                	addi	sp,sp,-16
ffffffffc0203dea:	e406                	sd	ra,8(sp)
ffffffffc0203dec:	e022                	sd	s0,0(sp)
ffffffffc0203dee:	e78d                	bnez	a5,ffffffffc0203e18 <mm_destroy+0x32>
ffffffffc0203df0:	842a                	mv	s0,a0
ffffffffc0203df2:	6508                	ld	a0,8(a0)
ffffffffc0203df4:	00a40c63          	beq	s0,a0,ffffffffc0203e0c <mm_destroy+0x26>
ffffffffc0203df8:	6118                	ld	a4,0(a0)
ffffffffc0203dfa:	651c                	ld	a5,8(a0)
ffffffffc0203dfc:	1501                	addi	a0,a0,-32
ffffffffc0203dfe:	e71c                	sd	a5,8(a4)
ffffffffc0203e00:	e398                	sd	a4,0(a5)
ffffffffc0203e02:	ac8fe0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc0203e06:	6408                	ld	a0,8(s0)
ffffffffc0203e08:	fea418e3          	bne	s0,a0,ffffffffc0203df8 <mm_destroy+0x12>
ffffffffc0203e0c:	8522                	mv	a0,s0
ffffffffc0203e0e:	6402                	ld	s0,0(sp)
ffffffffc0203e10:	60a2                	ld	ra,8(sp)
ffffffffc0203e12:	0141                	addi	sp,sp,16
ffffffffc0203e14:	ab6fe06f          	j	ffffffffc02020ca <kfree>
ffffffffc0203e18:	00009697          	auipc	a3,0x9
ffffffffc0203e1c:	59068693          	addi	a3,a3,1424 # ffffffffc020d3a8 <default_pmm_manager+0x8b0>
ffffffffc0203e20:	00008617          	auipc	a2,0x8
ffffffffc0203e24:	1f060613          	addi	a2,a2,496 # ffffffffc020c010 <commands+0x210>
ffffffffc0203e28:	09e00593          	li	a1,158
ffffffffc0203e2c:	00009517          	auipc	a0,0x9
ffffffffc0203e30:	50c50513          	addi	a0,a0,1292 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc0203e34:	e6afc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203e38 <mm_map>:
ffffffffc0203e38:	7139                	addi	sp,sp,-64
ffffffffc0203e3a:	f822                	sd	s0,48(sp)
ffffffffc0203e3c:	6405                	lui	s0,0x1
ffffffffc0203e3e:	147d                	addi	s0,s0,-1
ffffffffc0203e40:	77fd                	lui	a5,0xfffff
ffffffffc0203e42:	9622                	add	a2,a2,s0
ffffffffc0203e44:	962e                	add	a2,a2,a1
ffffffffc0203e46:	f426                	sd	s1,40(sp)
ffffffffc0203e48:	fc06                	sd	ra,56(sp)
ffffffffc0203e4a:	00f5f4b3          	and	s1,a1,a5
ffffffffc0203e4e:	f04a                	sd	s2,32(sp)
ffffffffc0203e50:	ec4e                	sd	s3,24(sp)
ffffffffc0203e52:	e852                	sd	s4,16(sp)
ffffffffc0203e54:	e456                	sd	s5,8(sp)
ffffffffc0203e56:	002005b7          	lui	a1,0x200
ffffffffc0203e5a:	00f67433          	and	s0,a2,a5
ffffffffc0203e5e:	06b4e363          	bltu	s1,a1,ffffffffc0203ec4 <mm_map+0x8c>
ffffffffc0203e62:	0684f163          	bgeu	s1,s0,ffffffffc0203ec4 <mm_map+0x8c>
ffffffffc0203e66:	4785                	li	a5,1
ffffffffc0203e68:	07fe                	slli	a5,a5,0x1f
ffffffffc0203e6a:	0487ed63          	bltu	a5,s0,ffffffffc0203ec4 <mm_map+0x8c>
ffffffffc0203e6e:	89aa                	mv	s3,a0
ffffffffc0203e70:	cd21                	beqz	a0,ffffffffc0203ec8 <mm_map+0x90>
ffffffffc0203e72:	85a6                	mv	a1,s1
ffffffffc0203e74:	8ab6                	mv	s5,a3
ffffffffc0203e76:	8a3a                	mv	s4,a4
ffffffffc0203e78:	e5fff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0203e7c:	c501                	beqz	a0,ffffffffc0203e84 <mm_map+0x4c>
ffffffffc0203e7e:	651c                	ld	a5,8(a0)
ffffffffc0203e80:	0487e263          	bltu	a5,s0,ffffffffc0203ec4 <mm_map+0x8c>
ffffffffc0203e84:	03000513          	li	a0,48
ffffffffc0203e88:	992fe0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0203e8c:	892a                	mv	s2,a0
ffffffffc0203e8e:	5571                	li	a0,-4
ffffffffc0203e90:	02090163          	beqz	s2,ffffffffc0203eb2 <mm_map+0x7a>
ffffffffc0203e94:	854e                	mv	a0,s3
ffffffffc0203e96:	00993423          	sd	s1,8(s2)
ffffffffc0203e9a:	00893823          	sd	s0,16(s2)
ffffffffc0203e9e:	01592c23          	sw	s5,24(s2)
ffffffffc0203ea2:	85ca                	mv	a1,s2
ffffffffc0203ea4:	e73ff0ef          	jal	ra,ffffffffc0203d16 <insert_vma_struct>
ffffffffc0203ea8:	4501                	li	a0,0
ffffffffc0203eaa:	000a0463          	beqz	s4,ffffffffc0203eb2 <mm_map+0x7a>
ffffffffc0203eae:	012a3023          	sd	s2,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0203eb2:	70e2                	ld	ra,56(sp)
ffffffffc0203eb4:	7442                	ld	s0,48(sp)
ffffffffc0203eb6:	74a2                	ld	s1,40(sp)
ffffffffc0203eb8:	7902                	ld	s2,32(sp)
ffffffffc0203eba:	69e2                	ld	s3,24(sp)
ffffffffc0203ebc:	6a42                	ld	s4,16(sp)
ffffffffc0203ebe:	6aa2                	ld	s5,8(sp)
ffffffffc0203ec0:	6121                	addi	sp,sp,64
ffffffffc0203ec2:	8082                	ret
ffffffffc0203ec4:	5575                	li	a0,-3
ffffffffc0203ec6:	b7f5                	j	ffffffffc0203eb2 <mm_map+0x7a>
ffffffffc0203ec8:	00009697          	auipc	a3,0x9
ffffffffc0203ecc:	4f868693          	addi	a3,a3,1272 # ffffffffc020d3c0 <default_pmm_manager+0x8c8>
ffffffffc0203ed0:	00008617          	auipc	a2,0x8
ffffffffc0203ed4:	14060613          	addi	a2,a2,320 # ffffffffc020c010 <commands+0x210>
ffffffffc0203ed8:	0b300593          	li	a1,179
ffffffffc0203edc:	00009517          	auipc	a0,0x9
ffffffffc0203ee0:	45c50513          	addi	a0,a0,1116 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc0203ee4:	dbafc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203ee8 <dup_mmap>:
ffffffffc0203ee8:	7139                	addi	sp,sp,-64
ffffffffc0203eea:	fc06                	sd	ra,56(sp)
ffffffffc0203eec:	f822                	sd	s0,48(sp)
ffffffffc0203eee:	f426                	sd	s1,40(sp)
ffffffffc0203ef0:	f04a                	sd	s2,32(sp)
ffffffffc0203ef2:	ec4e                	sd	s3,24(sp)
ffffffffc0203ef4:	e852                	sd	s4,16(sp)
ffffffffc0203ef6:	e456                	sd	s5,8(sp)
ffffffffc0203ef8:	c52d                	beqz	a0,ffffffffc0203f62 <dup_mmap+0x7a>
ffffffffc0203efa:	892a                	mv	s2,a0
ffffffffc0203efc:	84ae                	mv	s1,a1
ffffffffc0203efe:	842e                	mv	s0,a1
ffffffffc0203f00:	e595                	bnez	a1,ffffffffc0203f2c <dup_mmap+0x44>
ffffffffc0203f02:	a085                	j	ffffffffc0203f62 <dup_mmap+0x7a>
ffffffffc0203f04:	854a                	mv	a0,s2
ffffffffc0203f06:	0155b423          	sd	s5,8(a1) # 200008 <_binary_bin_sfs_img_size+0x18ad08>
ffffffffc0203f0a:	0145b823          	sd	s4,16(a1)
ffffffffc0203f0e:	0135ac23          	sw	s3,24(a1)
ffffffffc0203f12:	e05ff0ef          	jal	ra,ffffffffc0203d16 <insert_vma_struct>
ffffffffc0203f16:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_bin_swap_img_size-0x6d10>
ffffffffc0203f1a:	fe843603          	ld	a2,-24(s0)
ffffffffc0203f1e:	6c8c                	ld	a1,24(s1)
ffffffffc0203f20:	01893503          	ld	a0,24(s2)
ffffffffc0203f24:	4701                	li	a4,0
ffffffffc0203f26:	a2dff0ef          	jal	ra,ffffffffc0203952 <copy_range>
ffffffffc0203f2a:	e105                	bnez	a0,ffffffffc0203f4a <dup_mmap+0x62>
ffffffffc0203f2c:	6000                	ld	s0,0(s0)
ffffffffc0203f2e:	02848863          	beq	s1,s0,ffffffffc0203f5e <dup_mmap+0x76>
ffffffffc0203f32:	03000513          	li	a0,48
ffffffffc0203f36:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203f3a:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203f3e:	ff842983          	lw	s3,-8(s0)
ffffffffc0203f42:	8d8fe0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0203f46:	85aa                	mv	a1,a0
ffffffffc0203f48:	fd55                	bnez	a0,ffffffffc0203f04 <dup_mmap+0x1c>
ffffffffc0203f4a:	5571                	li	a0,-4
ffffffffc0203f4c:	70e2                	ld	ra,56(sp)
ffffffffc0203f4e:	7442                	ld	s0,48(sp)
ffffffffc0203f50:	74a2                	ld	s1,40(sp)
ffffffffc0203f52:	7902                	ld	s2,32(sp)
ffffffffc0203f54:	69e2                	ld	s3,24(sp)
ffffffffc0203f56:	6a42                	ld	s4,16(sp)
ffffffffc0203f58:	6aa2                	ld	s5,8(sp)
ffffffffc0203f5a:	6121                	addi	sp,sp,64
ffffffffc0203f5c:	8082                	ret
ffffffffc0203f5e:	4501                	li	a0,0
ffffffffc0203f60:	b7f5                	j	ffffffffc0203f4c <dup_mmap+0x64>
ffffffffc0203f62:	00009697          	auipc	a3,0x9
ffffffffc0203f66:	46e68693          	addi	a3,a3,1134 # ffffffffc020d3d0 <default_pmm_manager+0x8d8>
ffffffffc0203f6a:	00008617          	auipc	a2,0x8
ffffffffc0203f6e:	0a660613          	addi	a2,a2,166 # ffffffffc020c010 <commands+0x210>
ffffffffc0203f72:	0cf00593          	li	a1,207
ffffffffc0203f76:	00009517          	auipc	a0,0x9
ffffffffc0203f7a:	3c250513          	addi	a0,a0,962 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc0203f7e:	d20fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203f82 <exit_mmap>:
ffffffffc0203f82:	1101                	addi	sp,sp,-32
ffffffffc0203f84:	ec06                	sd	ra,24(sp)
ffffffffc0203f86:	e822                	sd	s0,16(sp)
ffffffffc0203f88:	e426                	sd	s1,8(sp)
ffffffffc0203f8a:	e04a                	sd	s2,0(sp)
ffffffffc0203f8c:	c531                	beqz	a0,ffffffffc0203fd8 <exit_mmap+0x56>
ffffffffc0203f8e:	591c                	lw	a5,48(a0)
ffffffffc0203f90:	84aa                	mv	s1,a0
ffffffffc0203f92:	e3b9                	bnez	a5,ffffffffc0203fd8 <exit_mmap+0x56>
ffffffffc0203f94:	6500                	ld	s0,8(a0)
ffffffffc0203f96:	01853903          	ld	s2,24(a0)
ffffffffc0203f9a:	02850663          	beq	a0,s0,ffffffffc0203fc6 <exit_mmap+0x44>
ffffffffc0203f9e:	ff043603          	ld	a2,-16(s0)
ffffffffc0203fa2:	fe843583          	ld	a1,-24(s0)
ffffffffc0203fa6:	854a                	mv	a0,s2
ffffffffc0203fa8:	e4afe0ef          	jal	ra,ffffffffc02025f2 <unmap_range>
ffffffffc0203fac:	6400                	ld	s0,8(s0)
ffffffffc0203fae:	fe8498e3          	bne	s1,s0,ffffffffc0203f9e <exit_mmap+0x1c>
ffffffffc0203fb2:	6400                	ld	s0,8(s0)
ffffffffc0203fb4:	00848c63          	beq	s1,s0,ffffffffc0203fcc <exit_mmap+0x4a>
ffffffffc0203fb8:	ff043603          	ld	a2,-16(s0)
ffffffffc0203fbc:	fe843583          	ld	a1,-24(s0)
ffffffffc0203fc0:	854a                	mv	a0,s2
ffffffffc0203fc2:	f76fe0ef          	jal	ra,ffffffffc0202738 <exit_range>
ffffffffc0203fc6:	6400                	ld	s0,8(s0)
ffffffffc0203fc8:	fe8498e3          	bne	s1,s0,ffffffffc0203fb8 <exit_mmap+0x36>
ffffffffc0203fcc:	60e2                	ld	ra,24(sp)
ffffffffc0203fce:	6442                	ld	s0,16(sp)
ffffffffc0203fd0:	64a2                	ld	s1,8(sp)
ffffffffc0203fd2:	6902                	ld	s2,0(sp)
ffffffffc0203fd4:	6105                	addi	sp,sp,32
ffffffffc0203fd6:	8082                	ret
ffffffffc0203fd8:	00009697          	auipc	a3,0x9
ffffffffc0203fdc:	41868693          	addi	a3,a3,1048 # ffffffffc020d3f0 <default_pmm_manager+0x8f8>
ffffffffc0203fe0:	00008617          	auipc	a2,0x8
ffffffffc0203fe4:	03060613          	addi	a2,a2,48 # ffffffffc020c010 <commands+0x210>
ffffffffc0203fe8:	0e800593          	li	a1,232
ffffffffc0203fec:	00009517          	auipc	a0,0x9
ffffffffc0203ff0:	34c50513          	addi	a0,a0,844 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc0203ff4:	caafc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203ff8 <vmm_init>:
ffffffffc0203ff8:	7139                	addi	sp,sp,-64
ffffffffc0203ffa:	05800513          	li	a0,88
ffffffffc0203ffe:	fc06                	sd	ra,56(sp)
ffffffffc0204000:	f822                	sd	s0,48(sp)
ffffffffc0204002:	f426                	sd	s1,40(sp)
ffffffffc0204004:	f04a                	sd	s2,32(sp)
ffffffffc0204006:	ec4e                	sd	s3,24(sp)
ffffffffc0204008:	e852                	sd	s4,16(sp)
ffffffffc020400a:	e456                	sd	s5,8(sp)
ffffffffc020400c:	80efe0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0204010:	2e050963          	beqz	a0,ffffffffc0204302 <vmm_init+0x30a>
ffffffffc0204014:	e508                	sd	a0,8(a0)
ffffffffc0204016:	e108                	sd	a0,0(a0)
ffffffffc0204018:	00053823          	sd	zero,16(a0)
ffffffffc020401c:	00053c23          	sd	zero,24(a0)
ffffffffc0204020:	02052023          	sw	zero,32(a0)
ffffffffc0204024:	02053423          	sd	zero,40(a0)
ffffffffc0204028:	02052823          	sw	zero,48(a0)
ffffffffc020402c:	84aa                	mv	s1,a0
ffffffffc020402e:	4585                	li	a1,1
ffffffffc0204030:	03850513          	addi	a0,a0,56
ffffffffc0204034:	5b6000ef          	jal	ra,ffffffffc02045ea <sem_init>
ffffffffc0204038:	03200413          	li	s0,50
ffffffffc020403c:	a811                	j	ffffffffc0204050 <vmm_init+0x58>
ffffffffc020403e:	e500                	sd	s0,8(a0)
ffffffffc0204040:	e91c                	sd	a5,16(a0)
ffffffffc0204042:	00052c23          	sw	zero,24(a0)
ffffffffc0204046:	146d                	addi	s0,s0,-5
ffffffffc0204048:	8526                	mv	a0,s1
ffffffffc020404a:	ccdff0ef          	jal	ra,ffffffffc0203d16 <insert_vma_struct>
ffffffffc020404e:	c80d                	beqz	s0,ffffffffc0204080 <vmm_init+0x88>
ffffffffc0204050:	03000513          	li	a0,48
ffffffffc0204054:	fc7fd0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0204058:	85aa                	mv	a1,a0
ffffffffc020405a:	00240793          	addi	a5,s0,2
ffffffffc020405e:	f165                	bnez	a0,ffffffffc020403e <vmm_init+0x46>
ffffffffc0204060:	00009697          	auipc	a3,0x9
ffffffffc0204064:	52868693          	addi	a3,a3,1320 # ffffffffc020d588 <default_pmm_manager+0xa90>
ffffffffc0204068:	00008617          	auipc	a2,0x8
ffffffffc020406c:	fa860613          	addi	a2,a2,-88 # ffffffffc020c010 <commands+0x210>
ffffffffc0204070:	12c00593          	li	a1,300
ffffffffc0204074:	00009517          	auipc	a0,0x9
ffffffffc0204078:	2c450513          	addi	a0,a0,708 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc020407c:	c22fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204080:	03700413          	li	s0,55
ffffffffc0204084:	1f900913          	li	s2,505
ffffffffc0204088:	a819                	j	ffffffffc020409e <vmm_init+0xa6>
ffffffffc020408a:	e500                	sd	s0,8(a0)
ffffffffc020408c:	e91c                	sd	a5,16(a0)
ffffffffc020408e:	00052c23          	sw	zero,24(a0)
ffffffffc0204092:	0415                	addi	s0,s0,5
ffffffffc0204094:	8526                	mv	a0,s1
ffffffffc0204096:	c81ff0ef          	jal	ra,ffffffffc0203d16 <insert_vma_struct>
ffffffffc020409a:	03240a63          	beq	s0,s2,ffffffffc02040ce <vmm_init+0xd6>
ffffffffc020409e:	03000513          	li	a0,48
ffffffffc02040a2:	f79fd0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc02040a6:	85aa                	mv	a1,a0
ffffffffc02040a8:	00240793          	addi	a5,s0,2
ffffffffc02040ac:	fd79                	bnez	a0,ffffffffc020408a <vmm_init+0x92>
ffffffffc02040ae:	00009697          	auipc	a3,0x9
ffffffffc02040b2:	4da68693          	addi	a3,a3,1242 # ffffffffc020d588 <default_pmm_manager+0xa90>
ffffffffc02040b6:	00008617          	auipc	a2,0x8
ffffffffc02040ba:	f5a60613          	addi	a2,a2,-166 # ffffffffc020c010 <commands+0x210>
ffffffffc02040be:	13300593          	li	a1,307
ffffffffc02040c2:	00009517          	auipc	a0,0x9
ffffffffc02040c6:	27650513          	addi	a0,a0,630 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc02040ca:	bd4fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02040ce:	649c                	ld	a5,8(s1)
ffffffffc02040d0:	471d                	li	a4,7
ffffffffc02040d2:	1fb00593          	li	a1,507
ffffffffc02040d6:	16f48663          	beq	s1,a5,ffffffffc0204242 <vmm_init+0x24a>
ffffffffc02040da:	fe87b603          	ld	a2,-24(a5) # ffffffffffffefe8 <end+0x3fd686a8>
ffffffffc02040de:	ffe70693          	addi	a3,a4,-2
ffffffffc02040e2:	10d61063          	bne	a2,a3,ffffffffc02041e2 <vmm_init+0x1ea>
ffffffffc02040e6:	ff07b683          	ld	a3,-16(a5)
ffffffffc02040ea:	0ed71c63          	bne	a4,a3,ffffffffc02041e2 <vmm_init+0x1ea>
ffffffffc02040ee:	0715                	addi	a4,a4,5
ffffffffc02040f0:	679c                	ld	a5,8(a5)
ffffffffc02040f2:	feb712e3          	bne	a4,a1,ffffffffc02040d6 <vmm_init+0xde>
ffffffffc02040f6:	4a1d                	li	s4,7
ffffffffc02040f8:	4415                	li	s0,5
ffffffffc02040fa:	1f900a93          	li	s5,505
ffffffffc02040fe:	85a2                	mv	a1,s0
ffffffffc0204100:	8526                	mv	a0,s1
ffffffffc0204102:	bd5ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204106:	892a                	mv	s2,a0
ffffffffc0204108:	16050d63          	beqz	a0,ffffffffc0204282 <vmm_init+0x28a>
ffffffffc020410c:	00140593          	addi	a1,s0,1
ffffffffc0204110:	8526                	mv	a0,s1
ffffffffc0204112:	bc5ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204116:	89aa                	mv	s3,a0
ffffffffc0204118:	14050563          	beqz	a0,ffffffffc0204262 <vmm_init+0x26a>
ffffffffc020411c:	85d2                	mv	a1,s4
ffffffffc020411e:	8526                	mv	a0,s1
ffffffffc0204120:	bb7ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204124:	16051f63          	bnez	a0,ffffffffc02042a2 <vmm_init+0x2aa>
ffffffffc0204128:	00340593          	addi	a1,s0,3
ffffffffc020412c:	8526                	mv	a0,s1
ffffffffc020412e:	ba9ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204132:	1a051863          	bnez	a0,ffffffffc02042e2 <vmm_init+0x2ea>
ffffffffc0204136:	00440593          	addi	a1,s0,4
ffffffffc020413a:	8526                	mv	a0,s1
ffffffffc020413c:	b9bff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204140:	18051163          	bnez	a0,ffffffffc02042c2 <vmm_init+0x2ca>
ffffffffc0204144:	00893783          	ld	a5,8(s2)
ffffffffc0204148:	0a879d63          	bne	a5,s0,ffffffffc0204202 <vmm_init+0x20a>
ffffffffc020414c:	01093783          	ld	a5,16(s2)
ffffffffc0204150:	0b479963          	bne	a5,s4,ffffffffc0204202 <vmm_init+0x20a>
ffffffffc0204154:	0089b783          	ld	a5,8(s3)
ffffffffc0204158:	0c879563          	bne	a5,s0,ffffffffc0204222 <vmm_init+0x22a>
ffffffffc020415c:	0109b783          	ld	a5,16(s3)
ffffffffc0204160:	0d479163          	bne	a5,s4,ffffffffc0204222 <vmm_init+0x22a>
ffffffffc0204164:	0415                	addi	s0,s0,5
ffffffffc0204166:	0a15                	addi	s4,s4,5
ffffffffc0204168:	f9541be3          	bne	s0,s5,ffffffffc02040fe <vmm_init+0x106>
ffffffffc020416c:	4411                	li	s0,4
ffffffffc020416e:	597d                	li	s2,-1
ffffffffc0204170:	85a2                	mv	a1,s0
ffffffffc0204172:	8526                	mv	a0,s1
ffffffffc0204174:	b63ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204178:	0004059b          	sext.w	a1,s0
ffffffffc020417c:	c90d                	beqz	a0,ffffffffc02041ae <vmm_init+0x1b6>
ffffffffc020417e:	6914                	ld	a3,16(a0)
ffffffffc0204180:	6510                	ld	a2,8(a0)
ffffffffc0204182:	00009517          	auipc	a0,0x9
ffffffffc0204186:	38e50513          	addi	a0,a0,910 # ffffffffc020d510 <default_pmm_manager+0xa18>
ffffffffc020418a:	81cfc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020418e:	00009697          	auipc	a3,0x9
ffffffffc0204192:	3aa68693          	addi	a3,a3,938 # ffffffffc020d538 <default_pmm_manager+0xa40>
ffffffffc0204196:	00008617          	auipc	a2,0x8
ffffffffc020419a:	e7a60613          	addi	a2,a2,-390 # ffffffffc020c010 <commands+0x210>
ffffffffc020419e:	15900593          	li	a1,345
ffffffffc02041a2:	00009517          	auipc	a0,0x9
ffffffffc02041a6:	19650513          	addi	a0,a0,406 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc02041aa:	af4fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041ae:	147d                	addi	s0,s0,-1
ffffffffc02041b0:	fd2410e3          	bne	s0,s2,ffffffffc0204170 <vmm_init+0x178>
ffffffffc02041b4:	8526                	mv	a0,s1
ffffffffc02041b6:	c31ff0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc02041ba:	00009517          	auipc	a0,0x9
ffffffffc02041be:	39650513          	addi	a0,a0,918 # ffffffffc020d550 <default_pmm_manager+0xa58>
ffffffffc02041c2:	fe5fb0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02041c6:	7442                	ld	s0,48(sp)
ffffffffc02041c8:	70e2                	ld	ra,56(sp)
ffffffffc02041ca:	74a2                	ld	s1,40(sp)
ffffffffc02041cc:	7902                	ld	s2,32(sp)
ffffffffc02041ce:	69e2                	ld	s3,24(sp)
ffffffffc02041d0:	6a42                	ld	s4,16(sp)
ffffffffc02041d2:	6aa2                	ld	s5,8(sp)
ffffffffc02041d4:	00009517          	auipc	a0,0x9
ffffffffc02041d8:	39c50513          	addi	a0,a0,924 # ffffffffc020d570 <default_pmm_manager+0xa78>
ffffffffc02041dc:	6121                	addi	sp,sp,64
ffffffffc02041de:	fc9fb06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02041e2:	00009697          	auipc	a3,0x9
ffffffffc02041e6:	24668693          	addi	a3,a3,582 # ffffffffc020d428 <default_pmm_manager+0x930>
ffffffffc02041ea:	00008617          	auipc	a2,0x8
ffffffffc02041ee:	e2660613          	addi	a2,a2,-474 # ffffffffc020c010 <commands+0x210>
ffffffffc02041f2:	13d00593          	li	a1,317
ffffffffc02041f6:	00009517          	auipc	a0,0x9
ffffffffc02041fa:	14250513          	addi	a0,a0,322 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc02041fe:	aa0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204202:	00009697          	auipc	a3,0x9
ffffffffc0204206:	2ae68693          	addi	a3,a3,686 # ffffffffc020d4b0 <default_pmm_manager+0x9b8>
ffffffffc020420a:	00008617          	auipc	a2,0x8
ffffffffc020420e:	e0660613          	addi	a2,a2,-506 # ffffffffc020c010 <commands+0x210>
ffffffffc0204212:	14e00593          	li	a1,334
ffffffffc0204216:	00009517          	auipc	a0,0x9
ffffffffc020421a:	12250513          	addi	a0,a0,290 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc020421e:	a80fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204222:	00009697          	auipc	a3,0x9
ffffffffc0204226:	2be68693          	addi	a3,a3,702 # ffffffffc020d4e0 <default_pmm_manager+0x9e8>
ffffffffc020422a:	00008617          	auipc	a2,0x8
ffffffffc020422e:	de660613          	addi	a2,a2,-538 # ffffffffc020c010 <commands+0x210>
ffffffffc0204232:	14f00593          	li	a1,335
ffffffffc0204236:	00009517          	auipc	a0,0x9
ffffffffc020423a:	10250513          	addi	a0,a0,258 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc020423e:	a60fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204242:	00009697          	auipc	a3,0x9
ffffffffc0204246:	1ce68693          	addi	a3,a3,462 # ffffffffc020d410 <default_pmm_manager+0x918>
ffffffffc020424a:	00008617          	auipc	a2,0x8
ffffffffc020424e:	dc660613          	addi	a2,a2,-570 # ffffffffc020c010 <commands+0x210>
ffffffffc0204252:	13b00593          	li	a1,315
ffffffffc0204256:	00009517          	auipc	a0,0x9
ffffffffc020425a:	0e250513          	addi	a0,a0,226 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc020425e:	a40fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204262:	00009697          	auipc	a3,0x9
ffffffffc0204266:	20e68693          	addi	a3,a3,526 # ffffffffc020d470 <default_pmm_manager+0x978>
ffffffffc020426a:	00008617          	auipc	a2,0x8
ffffffffc020426e:	da660613          	addi	a2,a2,-602 # ffffffffc020c010 <commands+0x210>
ffffffffc0204272:	14600593          	li	a1,326
ffffffffc0204276:	00009517          	auipc	a0,0x9
ffffffffc020427a:	0c250513          	addi	a0,a0,194 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc020427e:	a20fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204282:	00009697          	auipc	a3,0x9
ffffffffc0204286:	1de68693          	addi	a3,a3,478 # ffffffffc020d460 <default_pmm_manager+0x968>
ffffffffc020428a:	00008617          	auipc	a2,0x8
ffffffffc020428e:	d8660613          	addi	a2,a2,-634 # ffffffffc020c010 <commands+0x210>
ffffffffc0204292:	14400593          	li	a1,324
ffffffffc0204296:	00009517          	auipc	a0,0x9
ffffffffc020429a:	0a250513          	addi	a0,a0,162 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc020429e:	a00fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02042a2:	00009697          	auipc	a3,0x9
ffffffffc02042a6:	1de68693          	addi	a3,a3,478 # ffffffffc020d480 <default_pmm_manager+0x988>
ffffffffc02042aa:	00008617          	auipc	a2,0x8
ffffffffc02042ae:	d6660613          	addi	a2,a2,-666 # ffffffffc020c010 <commands+0x210>
ffffffffc02042b2:	14800593          	li	a1,328
ffffffffc02042b6:	00009517          	auipc	a0,0x9
ffffffffc02042ba:	08250513          	addi	a0,a0,130 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc02042be:	9e0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02042c2:	00009697          	auipc	a3,0x9
ffffffffc02042c6:	1de68693          	addi	a3,a3,478 # ffffffffc020d4a0 <default_pmm_manager+0x9a8>
ffffffffc02042ca:	00008617          	auipc	a2,0x8
ffffffffc02042ce:	d4660613          	addi	a2,a2,-698 # ffffffffc020c010 <commands+0x210>
ffffffffc02042d2:	14c00593          	li	a1,332
ffffffffc02042d6:	00009517          	auipc	a0,0x9
ffffffffc02042da:	06250513          	addi	a0,a0,98 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc02042de:	9c0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02042e2:	00009697          	auipc	a3,0x9
ffffffffc02042e6:	1ae68693          	addi	a3,a3,430 # ffffffffc020d490 <default_pmm_manager+0x998>
ffffffffc02042ea:	00008617          	auipc	a2,0x8
ffffffffc02042ee:	d2660613          	addi	a2,a2,-730 # ffffffffc020c010 <commands+0x210>
ffffffffc02042f2:	14a00593          	li	a1,330
ffffffffc02042f6:	00009517          	auipc	a0,0x9
ffffffffc02042fa:	04250513          	addi	a0,a0,66 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc02042fe:	9a0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204302:	00009697          	auipc	a3,0x9
ffffffffc0204306:	0be68693          	addi	a3,a3,190 # ffffffffc020d3c0 <default_pmm_manager+0x8c8>
ffffffffc020430a:	00008617          	auipc	a2,0x8
ffffffffc020430e:	d0660613          	addi	a2,a2,-762 # ffffffffc020c010 <commands+0x210>
ffffffffc0204312:	12400593          	li	a1,292
ffffffffc0204316:	00009517          	auipc	a0,0x9
ffffffffc020431a:	02250513          	addi	a0,a0,34 # ffffffffc020d338 <default_pmm_manager+0x840>
ffffffffc020431e:	980fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204322 <user_mem_check>:
ffffffffc0204322:	7179                	addi	sp,sp,-48
ffffffffc0204324:	f022                	sd	s0,32(sp)
ffffffffc0204326:	f406                	sd	ra,40(sp)
ffffffffc0204328:	ec26                	sd	s1,24(sp)
ffffffffc020432a:	e84a                	sd	s2,16(sp)
ffffffffc020432c:	e44e                	sd	s3,8(sp)
ffffffffc020432e:	e052                	sd	s4,0(sp)
ffffffffc0204330:	842e                	mv	s0,a1
ffffffffc0204332:	c135                	beqz	a0,ffffffffc0204396 <user_mem_check+0x74>
ffffffffc0204334:	002007b7          	lui	a5,0x200
ffffffffc0204338:	04f5e663          	bltu	a1,a5,ffffffffc0204384 <user_mem_check+0x62>
ffffffffc020433c:	00c584b3          	add	s1,a1,a2
ffffffffc0204340:	0495f263          	bgeu	a1,s1,ffffffffc0204384 <user_mem_check+0x62>
ffffffffc0204344:	4785                	li	a5,1
ffffffffc0204346:	07fe                	slli	a5,a5,0x1f
ffffffffc0204348:	0297ee63          	bltu	a5,s1,ffffffffc0204384 <user_mem_check+0x62>
ffffffffc020434c:	892a                	mv	s2,a0
ffffffffc020434e:	89b6                	mv	s3,a3
ffffffffc0204350:	6a05                	lui	s4,0x1
ffffffffc0204352:	a821                	j	ffffffffc020436a <user_mem_check+0x48>
ffffffffc0204354:	0027f693          	andi	a3,a5,2
ffffffffc0204358:	9752                	add	a4,a4,s4
ffffffffc020435a:	8ba1                	andi	a5,a5,8
ffffffffc020435c:	c685                	beqz	a3,ffffffffc0204384 <user_mem_check+0x62>
ffffffffc020435e:	c399                	beqz	a5,ffffffffc0204364 <user_mem_check+0x42>
ffffffffc0204360:	02e46263          	bltu	s0,a4,ffffffffc0204384 <user_mem_check+0x62>
ffffffffc0204364:	6900                	ld	s0,16(a0)
ffffffffc0204366:	04947663          	bgeu	s0,s1,ffffffffc02043b2 <user_mem_check+0x90>
ffffffffc020436a:	85a2                	mv	a1,s0
ffffffffc020436c:	854a                	mv	a0,s2
ffffffffc020436e:	969ff0ef          	jal	ra,ffffffffc0203cd6 <find_vma>
ffffffffc0204372:	c909                	beqz	a0,ffffffffc0204384 <user_mem_check+0x62>
ffffffffc0204374:	6518                	ld	a4,8(a0)
ffffffffc0204376:	00e46763          	bltu	s0,a4,ffffffffc0204384 <user_mem_check+0x62>
ffffffffc020437a:	4d1c                	lw	a5,24(a0)
ffffffffc020437c:	fc099ce3          	bnez	s3,ffffffffc0204354 <user_mem_check+0x32>
ffffffffc0204380:	8b85                	andi	a5,a5,1
ffffffffc0204382:	f3ed                	bnez	a5,ffffffffc0204364 <user_mem_check+0x42>
ffffffffc0204384:	4501                	li	a0,0
ffffffffc0204386:	70a2                	ld	ra,40(sp)
ffffffffc0204388:	7402                	ld	s0,32(sp)
ffffffffc020438a:	64e2                	ld	s1,24(sp)
ffffffffc020438c:	6942                	ld	s2,16(sp)
ffffffffc020438e:	69a2                	ld	s3,8(sp)
ffffffffc0204390:	6a02                	ld	s4,0(sp)
ffffffffc0204392:	6145                	addi	sp,sp,48
ffffffffc0204394:	8082                	ret
ffffffffc0204396:	c02007b7          	lui	a5,0xc0200
ffffffffc020439a:	4501                	li	a0,0
ffffffffc020439c:	fef5e5e3          	bltu	a1,a5,ffffffffc0204386 <user_mem_check+0x64>
ffffffffc02043a0:	962e                	add	a2,a2,a1
ffffffffc02043a2:	fec5f2e3          	bgeu	a1,a2,ffffffffc0204386 <user_mem_check+0x64>
ffffffffc02043a6:	c8000537          	lui	a0,0xc8000
ffffffffc02043aa:	0505                	addi	a0,a0,1
ffffffffc02043ac:	00a63533          	sltu	a0,a2,a0
ffffffffc02043b0:	bfd9                	j	ffffffffc0204386 <user_mem_check+0x64>
ffffffffc02043b2:	4505                	li	a0,1
ffffffffc02043b4:	bfc9                	j	ffffffffc0204386 <user_mem_check+0x64>

ffffffffc02043b6 <copy_from_user>:
ffffffffc02043b6:	1101                	addi	sp,sp,-32
ffffffffc02043b8:	e822                	sd	s0,16(sp)
ffffffffc02043ba:	e426                	sd	s1,8(sp)
ffffffffc02043bc:	8432                	mv	s0,a2
ffffffffc02043be:	84b6                	mv	s1,a3
ffffffffc02043c0:	e04a                	sd	s2,0(sp)
ffffffffc02043c2:	86ba                	mv	a3,a4
ffffffffc02043c4:	892e                	mv	s2,a1
ffffffffc02043c6:	8626                	mv	a2,s1
ffffffffc02043c8:	85a2                	mv	a1,s0
ffffffffc02043ca:	ec06                	sd	ra,24(sp)
ffffffffc02043cc:	f57ff0ef          	jal	ra,ffffffffc0204322 <user_mem_check>
ffffffffc02043d0:	c519                	beqz	a0,ffffffffc02043de <copy_from_user+0x28>
ffffffffc02043d2:	8626                	mv	a2,s1
ffffffffc02043d4:	85a2                	mv	a1,s0
ffffffffc02043d6:	854a                	mv	a0,s2
ffffffffc02043d8:	7a4070ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc02043dc:	4505                	li	a0,1
ffffffffc02043de:	60e2                	ld	ra,24(sp)
ffffffffc02043e0:	6442                	ld	s0,16(sp)
ffffffffc02043e2:	64a2                	ld	s1,8(sp)
ffffffffc02043e4:	6902                	ld	s2,0(sp)
ffffffffc02043e6:	6105                	addi	sp,sp,32
ffffffffc02043e8:	8082                	ret

ffffffffc02043ea <copy_to_user>:
ffffffffc02043ea:	1101                	addi	sp,sp,-32
ffffffffc02043ec:	e822                	sd	s0,16(sp)
ffffffffc02043ee:	8436                	mv	s0,a3
ffffffffc02043f0:	e04a                	sd	s2,0(sp)
ffffffffc02043f2:	4685                	li	a3,1
ffffffffc02043f4:	8932                	mv	s2,a2
ffffffffc02043f6:	8622                	mv	a2,s0
ffffffffc02043f8:	e426                	sd	s1,8(sp)
ffffffffc02043fa:	ec06                	sd	ra,24(sp)
ffffffffc02043fc:	84ae                	mv	s1,a1
ffffffffc02043fe:	f25ff0ef          	jal	ra,ffffffffc0204322 <user_mem_check>
ffffffffc0204402:	c519                	beqz	a0,ffffffffc0204410 <copy_to_user+0x26>
ffffffffc0204404:	8622                	mv	a2,s0
ffffffffc0204406:	85ca                	mv	a1,s2
ffffffffc0204408:	8526                	mv	a0,s1
ffffffffc020440a:	772070ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc020440e:	4505                	li	a0,1
ffffffffc0204410:	60e2                	ld	ra,24(sp)
ffffffffc0204412:	6442                	ld	s0,16(sp)
ffffffffc0204414:	64a2                	ld	s1,8(sp)
ffffffffc0204416:	6902                	ld	s2,0(sp)
ffffffffc0204418:	6105                	addi	sp,sp,32
ffffffffc020441a:	8082                	ret

ffffffffc020441c <copy_string>:
ffffffffc020441c:	7139                	addi	sp,sp,-64
ffffffffc020441e:	ec4e                	sd	s3,24(sp)
ffffffffc0204420:	6985                	lui	s3,0x1
ffffffffc0204422:	99b2                	add	s3,s3,a2
ffffffffc0204424:	77fd                	lui	a5,0xfffff
ffffffffc0204426:	00f9f9b3          	and	s3,s3,a5
ffffffffc020442a:	f426                	sd	s1,40(sp)
ffffffffc020442c:	f04a                	sd	s2,32(sp)
ffffffffc020442e:	e852                	sd	s4,16(sp)
ffffffffc0204430:	e456                	sd	s5,8(sp)
ffffffffc0204432:	fc06                	sd	ra,56(sp)
ffffffffc0204434:	f822                	sd	s0,48(sp)
ffffffffc0204436:	84b2                	mv	s1,a2
ffffffffc0204438:	8aaa                	mv	s5,a0
ffffffffc020443a:	8a2e                	mv	s4,a1
ffffffffc020443c:	8936                	mv	s2,a3
ffffffffc020443e:	40c989b3          	sub	s3,s3,a2
ffffffffc0204442:	a015                	j	ffffffffc0204466 <copy_string+0x4a>
ffffffffc0204444:	65e070ef          	jal	ra,ffffffffc020baa2 <strnlen>
ffffffffc0204448:	87aa                	mv	a5,a0
ffffffffc020444a:	85a6                	mv	a1,s1
ffffffffc020444c:	8552                	mv	a0,s4
ffffffffc020444e:	8622                	mv	a2,s0
ffffffffc0204450:	0487e363          	bltu	a5,s0,ffffffffc0204496 <copy_string+0x7a>
ffffffffc0204454:	0329f763          	bgeu	s3,s2,ffffffffc0204482 <copy_string+0x66>
ffffffffc0204458:	724070ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc020445c:	9a22                	add	s4,s4,s0
ffffffffc020445e:	94a2                	add	s1,s1,s0
ffffffffc0204460:	40890933          	sub	s2,s2,s0
ffffffffc0204464:	6985                	lui	s3,0x1
ffffffffc0204466:	4681                	li	a3,0
ffffffffc0204468:	85a6                	mv	a1,s1
ffffffffc020446a:	8556                	mv	a0,s5
ffffffffc020446c:	844a                	mv	s0,s2
ffffffffc020446e:	0129f363          	bgeu	s3,s2,ffffffffc0204474 <copy_string+0x58>
ffffffffc0204472:	844e                	mv	s0,s3
ffffffffc0204474:	8622                	mv	a2,s0
ffffffffc0204476:	eadff0ef          	jal	ra,ffffffffc0204322 <user_mem_check>
ffffffffc020447a:	87aa                	mv	a5,a0
ffffffffc020447c:	85a2                	mv	a1,s0
ffffffffc020447e:	8526                	mv	a0,s1
ffffffffc0204480:	f3f1                	bnez	a5,ffffffffc0204444 <copy_string+0x28>
ffffffffc0204482:	4501                	li	a0,0
ffffffffc0204484:	70e2                	ld	ra,56(sp)
ffffffffc0204486:	7442                	ld	s0,48(sp)
ffffffffc0204488:	74a2                	ld	s1,40(sp)
ffffffffc020448a:	7902                	ld	s2,32(sp)
ffffffffc020448c:	69e2                	ld	s3,24(sp)
ffffffffc020448e:	6a42                	ld	s4,16(sp)
ffffffffc0204490:	6aa2                	ld	s5,8(sp)
ffffffffc0204492:	6121                	addi	sp,sp,64
ffffffffc0204494:	8082                	ret
ffffffffc0204496:	00178613          	addi	a2,a5,1 # fffffffffffff001 <end+0x3fd686c1>
ffffffffc020449a:	6e2070ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc020449e:	4505                	li	a0,1
ffffffffc02044a0:	b7d5                	j	ffffffffc0204484 <copy_string+0x68>

ffffffffc02044a2 <__down.constprop.0>:
ffffffffc02044a2:	715d                	addi	sp,sp,-80
ffffffffc02044a4:	e0a2                	sd	s0,64(sp)
ffffffffc02044a6:	e486                	sd	ra,72(sp)
ffffffffc02044a8:	fc26                	sd	s1,56(sp)
ffffffffc02044aa:	842a                	mv	s0,a0
ffffffffc02044ac:	100027f3          	csrr	a5,sstatus
ffffffffc02044b0:	8b89                	andi	a5,a5,2
ffffffffc02044b2:	ebb1                	bnez	a5,ffffffffc0204506 <__down.constprop.0+0x64>
ffffffffc02044b4:	411c                	lw	a5,0(a0)
ffffffffc02044b6:	00f05a63          	blez	a5,ffffffffc02044ca <__down.constprop.0+0x28>
ffffffffc02044ba:	37fd                	addiw	a5,a5,-1
ffffffffc02044bc:	c11c                	sw	a5,0(a0)
ffffffffc02044be:	4501                	li	a0,0
ffffffffc02044c0:	60a6                	ld	ra,72(sp)
ffffffffc02044c2:	6406                	ld	s0,64(sp)
ffffffffc02044c4:	74e2                	ld	s1,56(sp)
ffffffffc02044c6:	6161                	addi	sp,sp,80
ffffffffc02044c8:	8082                	ret
ffffffffc02044ca:	00850413          	addi	s0,a0,8 # ffffffffc8000008 <end+0x7d696c8>
ffffffffc02044ce:	0024                	addi	s1,sp,8
ffffffffc02044d0:	10000613          	li	a2,256
ffffffffc02044d4:	85a6                	mv	a1,s1
ffffffffc02044d6:	8522                	mv	a0,s0
ffffffffc02044d8:	2d8000ef          	jal	ra,ffffffffc02047b0 <wait_current_set>
ffffffffc02044dc:	520030ef          	jal	ra,ffffffffc02079fc <schedule>
ffffffffc02044e0:	100027f3          	csrr	a5,sstatus
ffffffffc02044e4:	8b89                	andi	a5,a5,2
ffffffffc02044e6:	efb9                	bnez	a5,ffffffffc0204544 <__down.constprop.0+0xa2>
ffffffffc02044e8:	8526                	mv	a0,s1
ffffffffc02044ea:	19c000ef          	jal	ra,ffffffffc0204686 <wait_in_queue>
ffffffffc02044ee:	e531                	bnez	a0,ffffffffc020453a <__down.constprop.0+0x98>
ffffffffc02044f0:	4542                	lw	a0,16(sp)
ffffffffc02044f2:	10000793          	li	a5,256
ffffffffc02044f6:	fcf515e3          	bne	a0,a5,ffffffffc02044c0 <__down.constprop.0+0x1e>
ffffffffc02044fa:	60a6                	ld	ra,72(sp)
ffffffffc02044fc:	6406                	ld	s0,64(sp)
ffffffffc02044fe:	74e2                	ld	s1,56(sp)
ffffffffc0204500:	4501                	li	a0,0
ffffffffc0204502:	6161                	addi	sp,sp,80
ffffffffc0204504:	8082                	ret
ffffffffc0204506:	f6cfc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020450a:	401c                	lw	a5,0(s0)
ffffffffc020450c:	00f05c63          	blez	a5,ffffffffc0204524 <__down.constprop.0+0x82>
ffffffffc0204510:	37fd                	addiw	a5,a5,-1
ffffffffc0204512:	c01c                	sw	a5,0(s0)
ffffffffc0204514:	f58fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204518:	60a6                	ld	ra,72(sp)
ffffffffc020451a:	6406                	ld	s0,64(sp)
ffffffffc020451c:	74e2                	ld	s1,56(sp)
ffffffffc020451e:	4501                	li	a0,0
ffffffffc0204520:	6161                	addi	sp,sp,80
ffffffffc0204522:	8082                	ret
ffffffffc0204524:	0421                	addi	s0,s0,8
ffffffffc0204526:	0024                	addi	s1,sp,8
ffffffffc0204528:	10000613          	li	a2,256
ffffffffc020452c:	85a6                	mv	a1,s1
ffffffffc020452e:	8522                	mv	a0,s0
ffffffffc0204530:	280000ef          	jal	ra,ffffffffc02047b0 <wait_current_set>
ffffffffc0204534:	f38fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204538:	b755                	j	ffffffffc02044dc <__down.constprop.0+0x3a>
ffffffffc020453a:	85a6                	mv	a1,s1
ffffffffc020453c:	8522                	mv	a0,s0
ffffffffc020453e:	0ee000ef          	jal	ra,ffffffffc020462c <wait_queue_del>
ffffffffc0204542:	b77d                	j	ffffffffc02044f0 <__down.constprop.0+0x4e>
ffffffffc0204544:	f2efc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204548:	8526                	mv	a0,s1
ffffffffc020454a:	13c000ef          	jal	ra,ffffffffc0204686 <wait_in_queue>
ffffffffc020454e:	e501                	bnez	a0,ffffffffc0204556 <__down.constprop.0+0xb4>
ffffffffc0204550:	f1cfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204554:	bf71                	j	ffffffffc02044f0 <__down.constprop.0+0x4e>
ffffffffc0204556:	85a6                	mv	a1,s1
ffffffffc0204558:	8522                	mv	a0,s0
ffffffffc020455a:	0d2000ef          	jal	ra,ffffffffc020462c <wait_queue_del>
ffffffffc020455e:	bfcd                	j	ffffffffc0204550 <__down.constprop.0+0xae>

ffffffffc0204560 <__up.constprop.0>:
ffffffffc0204560:	1101                	addi	sp,sp,-32
ffffffffc0204562:	e822                	sd	s0,16(sp)
ffffffffc0204564:	ec06                	sd	ra,24(sp)
ffffffffc0204566:	e426                	sd	s1,8(sp)
ffffffffc0204568:	e04a                	sd	s2,0(sp)
ffffffffc020456a:	842a                	mv	s0,a0
ffffffffc020456c:	100027f3          	csrr	a5,sstatus
ffffffffc0204570:	8b89                	andi	a5,a5,2
ffffffffc0204572:	4901                	li	s2,0
ffffffffc0204574:	eba1                	bnez	a5,ffffffffc02045c4 <__up.constprop.0+0x64>
ffffffffc0204576:	00840493          	addi	s1,s0,8
ffffffffc020457a:	8526                	mv	a0,s1
ffffffffc020457c:	0ee000ef          	jal	ra,ffffffffc020466a <wait_queue_first>
ffffffffc0204580:	85aa                	mv	a1,a0
ffffffffc0204582:	cd0d                	beqz	a0,ffffffffc02045bc <__up.constprop.0+0x5c>
ffffffffc0204584:	6118                	ld	a4,0(a0)
ffffffffc0204586:	10000793          	li	a5,256
ffffffffc020458a:	0ec72703          	lw	a4,236(a4)
ffffffffc020458e:	02f71f63          	bne	a4,a5,ffffffffc02045cc <__up.constprop.0+0x6c>
ffffffffc0204592:	4685                	li	a3,1
ffffffffc0204594:	10000613          	li	a2,256
ffffffffc0204598:	8526                	mv	a0,s1
ffffffffc020459a:	0fa000ef          	jal	ra,ffffffffc0204694 <wakeup_wait>
ffffffffc020459e:	00091863          	bnez	s2,ffffffffc02045ae <__up.constprop.0+0x4e>
ffffffffc02045a2:	60e2                	ld	ra,24(sp)
ffffffffc02045a4:	6442                	ld	s0,16(sp)
ffffffffc02045a6:	64a2                	ld	s1,8(sp)
ffffffffc02045a8:	6902                	ld	s2,0(sp)
ffffffffc02045aa:	6105                	addi	sp,sp,32
ffffffffc02045ac:	8082                	ret
ffffffffc02045ae:	6442                	ld	s0,16(sp)
ffffffffc02045b0:	60e2                	ld	ra,24(sp)
ffffffffc02045b2:	64a2                	ld	s1,8(sp)
ffffffffc02045b4:	6902                	ld	s2,0(sp)
ffffffffc02045b6:	6105                	addi	sp,sp,32
ffffffffc02045b8:	eb4fc06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02045bc:	401c                	lw	a5,0(s0)
ffffffffc02045be:	2785                	addiw	a5,a5,1
ffffffffc02045c0:	c01c                	sw	a5,0(s0)
ffffffffc02045c2:	bff1                	j	ffffffffc020459e <__up.constprop.0+0x3e>
ffffffffc02045c4:	eaefc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02045c8:	4905                	li	s2,1
ffffffffc02045ca:	b775                	j	ffffffffc0204576 <__up.constprop.0+0x16>
ffffffffc02045cc:	00009697          	auipc	a3,0x9
ffffffffc02045d0:	fcc68693          	addi	a3,a3,-52 # ffffffffc020d598 <default_pmm_manager+0xaa0>
ffffffffc02045d4:	00008617          	auipc	a2,0x8
ffffffffc02045d8:	a3c60613          	addi	a2,a2,-1476 # ffffffffc020c010 <commands+0x210>
ffffffffc02045dc:	45e5                	li	a1,25
ffffffffc02045de:	00009517          	auipc	a0,0x9
ffffffffc02045e2:	fe250513          	addi	a0,a0,-30 # ffffffffc020d5c0 <default_pmm_manager+0xac8>
ffffffffc02045e6:	eb9fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02045ea <sem_init>:
ffffffffc02045ea:	c10c                	sw	a1,0(a0)
ffffffffc02045ec:	0521                	addi	a0,a0,8
ffffffffc02045ee:	a825                	j	ffffffffc0204626 <wait_queue_init>

ffffffffc02045f0 <up>:
ffffffffc02045f0:	f71ff06f          	j	ffffffffc0204560 <__up.constprop.0>

ffffffffc02045f4 <down>:
ffffffffc02045f4:	1141                	addi	sp,sp,-16
ffffffffc02045f6:	e406                	sd	ra,8(sp)
ffffffffc02045f8:	eabff0ef          	jal	ra,ffffffffc02044a2 <__down.constprop.0>
ffffffffc02045fc:	2501                	sext.w	a0,a0
ffffffffc02045fe:	e501                	bnez	a0,ffffffffc0204606 <down+0x12>
ffffffffc0204600:	60a2                	ld	ra,8(sp)
ffffffffc0204602:	0141                	addi	sp,sp,16
ffffffffc0204604:	8082                	ret
ffffffffc0204606:	00009697          	auipc	a3,0x9
ffffffffc020460a:	fca68693          	addi	a3,a3,-54 # ffffffffc020d5d0 <default_pmm_manager+0xad8>
ffffffffc020460e:	00008617          	auipc	a2,0x8
ffffffffc0204612:	a0260613          	addi	a2,a2,-1534 # ffffffffc020c010 <commands+0x210>
ffffffffc0204616:	04000593          	li	a1,64
ffffffffc020461a:	00009517          	auipc	a0,0x9
ffffffffc020461e:	fa650513          	addi	a0,a0,-90 # ffffffffc020d5c0 <default_pmm_manager+0xac8>
ffffffffc0204622:	e7dfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204626 <wait_queue_init>:
ffffffffc0204626:	e508                	sd	a0,8(a0)
ffffffffc0204628:	e108                	sd	a0,0(a0)
ffffffffc020462a:	8082                	ret

ffffffffc020462c <wait_queue_del>:
ffffffffc020462c:	7198                	ld	a4,32(a1)
ffffffffc020462e:	01858793          	addi	a5,a1,24
ffffffffc0204632:	00e78b63          	beq	a5,a4,ffffffffc0204648 <wait_queue_del+0x1c>
ffffffffc0204636:	6994                	ld	a3,16(a1)
ffffffffc0204638:	00a69863          	bne	a3,a0,ffffffffc0204648 <wait_queue_del+0x1c>
ffffffffc020463c:	6d94                	ld	a3,24(a1)
ffffffffc020463e:	e698                	sd	a4,8(a3)
ffffffffc0204640:	e314                	sd	a3,0(a4)
ffffffffc0204642:	f19c                	sd	a5,32(a1)
ffffffffc0204644:	ed9c                	sd	a5,24(a1)
ffffffffc0204646:	8082                	ret
ffffffffc0204648:	1141                	addi	sp,sp,-16
ffffffffc020464a:	00009697          	auipc	a3,0x9
ffffffffc020464e:	fe668693          	addi	a3,a3,-26 # ffffffffc020d630 <default_pmm_manager+0xb38>
ffffffffc0204652:	00008617          	auipc	a2,0x8
ffffffffc0204656:	9be60613          	addi	a2,a2,-1602 # ffffffffc020c010 <commands+0x210>
ffffffffc020465a:	45f1                	li	a1,28
ffffffffc020465c:	00009517          	auipc	a0,0x9
ffffffffc0204660:	fbc50513          	addi	a0,a0,-68 # ffffffffc020d618 <default_pmm_manager+0xb20>
ffffffffc0204664:	e406                	sd	ra,8(sp)
ffffffffc0204666:	e39fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020466a <wait_queue_first>:
ffffffffc020466a:	651c                	ld	a5,8(a0)
ffffffffc020466c:	00f50563          	beq	a0,a5,ffffffffc0204676 <wait_queue_first+0xc>
ffffffffc0204670:	fe878513          	addi	a0,a5,-24
ffffffffc0204674:	8082                	ret
ffffffffc0204676:	4501                	li	a0,0
ffffffffc0204678:	8082                	ret

ffffffffc020467a <wait_queue_empty>:
ffffffffc020467a:	651c                	ld	a5,8(a0)
ffffffffc020467c:	40a78533          	sub	a0,a5,a0
ffffffffc0204680:	00153513          	seqz	a0,a0
ffffffffc0204684:	8082                	ret

ffffffffc0204686 <wait_in_queue>:
ffffffffc0204686:	711c                	ld	a5,32(a0)
ffffffffc0204688:	0561                	addi	a0,a0,24
ffffffffc020468a:	40a78533          	sub	a0,a5,a0
ffffffffc020468e:	00a03533          	snez	a0,a0
ffffffffc0204692:	8082                	ret

ffffffffc0204694 <wakeup_wait>:
ffffffffc0204694:	e689                	bnez	a3,ffffffffc020469e <wakeup_wait+0xa>
ffffffffc0204696:	6188                	ld	a0,0(a1)
ffffffffc0204698:	c590                	sw	a2,8(a1)
ffffffffc020469a:	2b00306f          	j	ffffffffc020794a <wakeup_proc>
ffffffffc020469e:	7198                	ld	a4,32(a1)
ffffffffc02046a0:	01858793          	addi	a5,a1,24
ffffffffc02046a4:	00e78e63          	beq	a5,a4,ffffffffc02046c0 <wakeup_wait+0x2c>
ffffffffc02046a8:	6994                	ld	a3,16(a1)
ffffffffc02046aa:	00d51b63          	bne	a0,a3,ffffffffc02046c0 <wakeup_wait+0x2c>
ffffffffc02046ae:	6d94                	ld	a3,24(a1)
ffffffffc02046b0:	6188                	ld	a0,0(a1)
ffffffffc02046b2:	e698                	sd	a4,8(a3)
ffffffffc02046b4:	e314                	sd	a3,0(a4)
ffffffffc02046b6:	f19c                	sd	a5,32(a1)
ffffffffc02046b8:	ed9c                	sd	a5,24(a1)
ffffffffc02046ba:	c590                	sw	a2,8(a1)
ffffffffc02046bc:	28e0306f          	j	ffffffffc020794a <wakeup_proc>
ffffffffc02046c0:	1141                	addi	sp,sp,-16
ffffffffc02046c2:	00009697          	auipc	a3,0x9
ffffffffc02046c6:	f6e68693          	addi	a3,a3,-146 # ffffffffc020d630 <default_pmm_manager+0xb38>
ffffffffc02046ca:	00008617          	auipc	a2,0x8
ffffffffc02046ce:	94660613          	addi	a2,a2,-1722 # ffffffffc020c010 <commands+0x210>
ffffffffc02046d2:	45f1                	li	a1,28
ffffffffc02046d4:	00009517          	auipc	a0,0x9
ffffffffc02046d8:	f4450513          	addi	a0,a0,-188 # ffffffffc020d618 <default_pmm_manager+0xb20>
ffffffffc02046dc:	e406                	sd	ra,8(sp)
ffffffffc02046de:	dc1fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02046e2 <wakeup_queue>:
ffffffffc02046e2:	651c                	ld	a5,8(a0)
ffffffffc02046e4:	0ca78563          	beq	a5,a0,ffffffffc02047ae <wakeup_queue+0xcc>
ffffffffc02046e8:	1101                	addi	sp,sp,-32
ffffffffc02046ea:	e822                	sd	s0,16(sp)
ffffffffc02046ec:	e426                	sd	s1,8(sp)
ffffffffc02046ee:	e04a                	sd	s2,0(sp)
ffffffffc02046f0:	ec06                	sd	ra,24(sp)
ffffffffc02046f2:	84aa                	mv	s1,a0
ffffffffc02046f4:	892e                	mv	s2,a1
ffffffffc02046f6:	fe878413          	addi	s0,a5,-24
ffffffffc02046fa:	e23d                	bnez	a2,ffffffffc0204760 <wakeup_queue+0x7e>
ffffffffc02046fc:	6008                	ld	a0,0(s0)
ffffffffc02046fe:	01242423          	sw	s2,8(s0)
ffffffffc0204702:	248030ef          	jal	ra,ffffffffc020794a <wakeup_proc>
ffffffffc0204706:	701c                	ld	a5,32(s0)
ffffffffc0204708:	01840713          	addi	a4,s0,24
ffffffffc020470c:	02e78463          	beq	a5,a4,ffffffffc0204734 <wakeup_queue+0x52>
ffffffffc0204710:	6818                	ld	a4,16(s0)
ffffffffc0204712:	02e49163          	bne	s1,a4,ffffffffc0204734 <wakeup_queue+0x52>
ffffffffc0204716:	02f48f63          	beq	s1,a5,ffffffffc0204754 <wakeup_queue+0x72>
ffffffffc020471a:	fe87b503          	ld	a0,-24(a5)
ffffffffc020471e:	ff27a823          	sw	s2,-16(a5)
ffffffffc0204722:	fe878413          	addi	s0,a5,-24
ffffffffc0204726:	224030ef          	jal	ra,ffffffffc020794a <wakeup_proc>
ffffffffc020472a:	701c                	ld	a5,32(s0)
ffffffffc020472c:	01840713          	addi	a4,s0,24
ffffffffc0204730:	fee790e3          	bne	a5,a4,ffffffffc0204710 <wakeup_queue+0x2e>
ffffffffc0204734:	00009697          	auipc	a3,0x9
ffffffffc0204738:	efc68693          	addi	a3,a3,-260 # ffffffffc020d630 <default_pmm_manager+0xb38>
ffffffffc020473c:	00008617          	auipc	a2,0x8
ffffffffc0204740:	8d460613          	addi	a2,a2,-1836 # ffffffffc020c010 <commands+0x210>
ffffffffc0204744:	02200593          	li	a1,34
ffffffffc0204748:	00009517          	auipc	a0,0x9
ffffffffc020474c:	ed050513          	addi	a0,a0,-304 # ffffffffc020d618 <default_pmm_manager+0xb20>
ffffffffc0204750:	d4ffb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204754:	60e2                	ld	ra,24(sp)
ffffffffc0204756:	6442                	ld	s0,16(sp)
ffffffffc0204758:	64a2                	ld	s1,8(sp)
ffffffffc020475a:	6902                	ld	s2,0(sp)
ffffffffc020475c:	6105                	addi	sp,sp,32
ffffffffc020475e:	8082                	ret
ffffffffc0204760:	6798                	ld	a4,8(a5)
ffffffffc0204762:	02f70763          	beq	a4,a5,ffffffffc0204790 <wakeup_queue+0xae>
ffffffffc0204766:	6814                	ld	a3,16(s0)
ffffffffc0204768:	02d49463          	bne	s1,a3,ffffffffc0204790 <wakeup_queue+0xae>
ffffffffc020476c:	6c14                	ld	a3,24(s0)
ffffffffc020476e:	6008                	ld	a0,0(s0)
ffffffffc0204770:	e698                	sd	a4,8(a3)
ffffffffc0204772:	e314                	sd	a3,0(a4)
ffffffffc0204774:	f01c                	sd	a5,32(s0)
ffffffffc0204776:	ec1c                	sd	a5,24(s0)
ffffffffc0204778:	01242423          	sw	s2,8(s0)
ffffffffc020477c:	1ce030ef          	jal	ra,ffffffffc020794a <wakeup_proc>
ffffffffc0204780:	6480                	ld	s0,8(s1)
ffffffffc0204782:	fc8489e3          	beq	s1,s0,ffffffffc0204754 <wakeup_queue+0x72>
ffffffffc0204786:	6418                	ld	a4,8(s0)
ffffffffc0204788:	87a2                	mv	a5,s0
ffffffffc020478a:	1421                	addi	s0,s0,-24
ffffffffc020478c:	fce79de3          	bne	a5,a4,ffffffffc0204766 <wakeup_queue+0x84>
ffffffffc0204790:	00009697          	auipc	a3,0x9
ffffffffc0204794:	ea068693          	addi	a3,a3,-352 # ffffffffc020d630 <default_pmm_manager+0xb38>
ffffffffc0204798:	00008617          	auipc	a2,0x8
ffffffffc020479c:	87860613          	addi	a2,a2,-1928 # ffffffffc020c010 <commands+0x210>
ffffffffc02047a0:	45f1                	li	a1,28
ffffffffc02047a2:	00009517          	auipc	a0,0x9
ffffffffc02047a6:	e7650513          	addi	a0,a0,-394 # ffffffffc020d618 <default_pmm_manager+0xb20>
ffffffffc02047aa:	cf5fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02047ae:	8082                	ret

ffffffffc02047b0 <wait_current_set>:
ffffffffc02047b0:	00092797          	auipc	a5,0x92
ffffffffc02047b4:	1407b783          	ld	a5,320(a5) # ffffffffc02968f0 <current>
ffffffffc02047b8:	c39d                	beqz	a5,ffffffffc02047de <wait_current_set+0x2e>
ffffffffc02047ba:	01858713          	addi	a4,a1,24
ffffffffc02047be:	800006b7          	lui	a3,0x80000
ffffffffc02047c2:	ed98                	sd	a4,24(a1)
ffffffffc02047c4:	e19c                	sd	a5,0(a1)
ffffffffc02047c6:	c594                	sw	a3,8(a1)
ffffffffc02047c8:	4685                	li	a3,1
ffffffffc02047ca:	c394                	sw	a3,0(a5)
ffffffffc02047cc:	0ec7a623          	sw	a2,236(a5)
ffffffffc02047d0:	611c                	ld	a5,0(a0)
ffffffffc02047d2:	e988                	sd	a0,16(a1)
ffffffffc02047d4:	e118                	sd	a4,0(a0)
ffffffffc02047d6:	e798                	sd	a4,8(a5)
ffffffffc02047d8:	f188                	sd	a0,32(a1)
ffffffffc02047da:	ed9c                	sd	a5,24(a1)
ffffffffc02047dc:	8082                	ret
ffffffffc02047de:	1141                	addi	sp,sp,-16
ffffffffc02047e0:	00009697          	auipc	a3,0x9
ffffffffc02047e4:	e9068693          	addi	a3,a3,-368 # ffffffffc020d670 <default_pmm_manager+0xb78>
ffffffffc02047e8:	00008617          	auipc	a2,0x8
ffffffffc02047ec:	82860613          	addi	a2,a2,-2008 # ffffffffc020c010 <commands+0x210>
ffffffffc02047f0:	07400593          	li	a1,116
ffffffffc02047f4:	00009517          	auipc	a0,0x9
ffffffffc02047f8:	e2450513          	addi	a0,a0,-476 # ffffffffc020d618 <default_pmm_manager+0xb20>
ffffffffc02047fc:	e406                	sd	ra,8(sp)
ffffffffc02047fe:	ca1fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204802 <get_fd_array.part.0>:
ffffffffc0204802:	1141                	addi	sp,sp,-16
ffffffffc0204804:	00009697          	auipc	a3,0x9
ffffffffc0204808:	e7c68693          	addi	a3,a3,-388 # ffffffffc020d680 <default_pmm_manager+0xb88>
ffffffffc020480c:	00008617          	auipc	a2,0x8
ffffffffc0204810:	80460613          	addi	a2,a2,-2044 # ffffffffc020c010 <commands+0x210>
ffffffffc0204814:	45d1                	li	a1,20
ffffffffc0204816:	00009517          	auipc	a0,0x9
ffffffffc020481a:	e9a50513          	addi	a0,a0,-358 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc020481e:	e406                	sd	ra,8(sp)
ffffffffc0204820:	c7ffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204824 <fd_array_alloc>:
ffffffffc0204824:	00092797          	auipc	a5,0x92
ffffffffc0204828:	0cc7b783          	ld	a5,204(a5) # ffffffffc02968f0 <current>
ffffffffc020482c:	1507b783          	ld	a5,336(a5)
ffffffffc0204830:	1141                	addi	sp,sp,-16
ffffffffc0204832:	e406                	sd	ra,8(sp)
ffffffffc0204834:	c3a5                	beqz	a5,ffffffffc0204894 <fd_array_alloc+0x70>
ffffffffc0204836:	4b98                	lw	a4,16(a5)
ffffffffc0204838:	04e05e63          	blez	a4,ffffffffc0204894 <fd_array_alloc+0x70>
ffffffffc020483c:	775d                	lui	a4,0xffff7
ffffffffc020483e:	ad970713          	addi	a4,a4,-1319 # ffffffffffff6ad9 <end+0x3fd60199>
ffffffffc0204842:	679c                	ld	a5,8(a5)
ffffffffc0204844:	02e50863          	beq	a0,a4,ffffffffc0204874 <fd_array_alloc+0x50>
ffffffffc0204848:	04700713          	li	a4,71
ffffffffc020484c:	04a76263          	bltu	a4,a0,ffffffffc0204890 <fd_array_alloc+0x6c>
ffffffffc0204850:	00351713          	slli	a4,a0,0x3
ffffffffc0204854:	40a70533          	sub	a0,a4,a0
ffffffffc0204858:	050e                	slli	a0,a0,0x3
ffffffffc020485a:	97aa                	add	a5,a5,a0
ffffffffc020485c:	4398                	lw	a4,0(a5)
ffffffffc020485e:	e71d                	bnez	a4,ffffffffc020488c <fd_array_alloc+0x68>
ffffffffc0204860:	5b88                	lw	a0,48(a5)
ffffffffc0204862:	e91d                	bnez	a0,ffffffffc0204898 <fd_array_alloc+0x74>
ffffffffc0204864:	4705                	li	a4,1
ffffffffc0204866:	c398                	sw	a4,0(a5)
ffffffffc0204868:	0207b423          	sd	zero,40(a5)
ffffffffc020486c:	e19c                	sd	a5,0(a1)
ffffffffc020486e:	60a2                	ld	ra,8(sp)
ffffffffc0204870:	0141                	addi	sp,sp,16
ffffffffc0204872:	8082                	ret
ffffffffc0204874:	6685                	lui	a3,0x1
ffffffffc0204876:	fc068693          	addi	a3,a3,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc020487a:	96be                	add	a3,a3,a5
ffffffffc020487c:	4398                	lw	a4,0(a5)
ffffffffc020487e:	d36d                	beqz	a4,ffffffffc0204860 <fd_array_alloc+0x3c>
ffffffffc0204880:	03878793          	addi	a5,a5,56
ffffffffc0204884:	fef69ce3          	bne	a3,a5,ffffffffc020487c <fd_array_alloc+0x58>
ffffffffc0204888:	5529                	li	a0,-22
ffffffffc020488a:	b7d5                	j	ffffffffc020486e <fd_array_alloc+0x4a>
ffffffffc020488c:	5545                	li	a0,-15
ffffffffc020488e:	b7c5                	j	ffffffffc020486e <fd_array_alloc+0x4a>
ffffffffc0204890:	5575                	li	a0,-3
ffffffffc0204892:	bff1                	j	ffffffffc020486e <fd_array_alloc+0x4a>
ffffffffc0204894:	f6fff0ef          	jal	ra,ffffffffc0204802 <get_fd_array.part.0>
ffffffffc0204898:	00009697          	auipc	a3,0x9
ffffffffc020489c:	e2868693          	addi	a3,a3,-472 # ffffffffc020d6c0 <default_pmm_manager+0xbc8>
ffffffffc02048a0:	00007617          	auipc	a2,0x7
ffffffffc02048a4:	77060613          	addi	a2,a2,1904 # ffffffffc020c010 <commands+0x210>
ffffffffc02048a8:	03b00593          	li	a1,59
ffffffffc02048ac:	00009517          	auipc	a0,0x9
ffffffffc02048b0:	e0450513          	addi	a0,a0,-508 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc02048b4:	bebfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02048b8 <fd_array_free>:
ffffffffc02048b8:	411c                	lw	a5,0(a0)
ffffffffc02048ba:	1141                	addi	sp,sp,-16
ffffffffc02048bc:	e022                	sd	s0,0(sp)
ffffffffc02048be:	e406                	sd	ra,8(sp)
ffffffffc02048c0:	4705                	li	a4,1
ffffffffc02048c2:	842a                	mv	s0,a0
ffffffffc02048c4:	04e78063          	beq	a5,a4,ffffffffc0204904 <fd_array_free+0x4c>
ffffffffc02048c8:	470d                	li	a4,3
ffffffffc02048ca:	04e79563          	bne	a5,a4,ffffffffc0204914 <fd_array_free+0x5c>
ffffffffc02048ce:	591c                	lw	a5,48(a0)
ffffffffc02048d0:	c38d                	beqz	a5,ffffffffc02048f2 <fd_array_free+0x3a>
ffffffffc02048d2:	00009697          	auipc	a3,0x9
ffffffffc02048d6:	dee68693          	addi	a3,a3,-530 # ffffffffc020d6c0 <default_pmm_manager+0xbc8>
ffffffffc02048da:	00007617          	auipc	a2,0x7
ffffffffc02048de:	73660613          	addi	a2,a2,1846 # ffffffffc020c010 <commands+0x210>
ffffffffc02048e2:	04500593          	li	a1,69
ffffffffc02048e6:	00009517          	auipc	a0,0x9
ffffffffc02048ea:	dca50513          	addi	a0,a0,-566 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc02048ee:	bb1fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02048f2:	7408                	ld	a0,40(s0)
ffffffffc02048f4:	6cd030ef          	jal	ra,ffffffffc02087c0 <vfs_close>
ffffffffc02048f8:	60a2                	ld	ra,8(sp)
ffffffffc02048fa:	00042023          	sw	zero,0(s0)
ffffffffc02048fe:	6402                	ld	s0,0(sp)
ffffffffc0204900:	0141                	addi	sp,sp,16
ffffffffc0204902:	8082                	ret
ffffffffc0204904:	591c                	lw	a5,48(a0)
ffffffffc0204906:	f7f1                	bnez	a5,ffffffffc02048d2 <fd_array_free+0x1a>
ffffffffc0204908:	60a2                	ld	ra,8(sp)
ffffffffc020490a:	00042023          	sw	zero,0(s0)
ffffffffc020490e:	6402                	ld	s0,0(sp)
ffffffffc0204910:	0141                	addi	sp,sp,16
ffffffffc0204912:	8082                	ret
ffffffffc0204914:	00009697          	auipc	a3,0x9
ffffffffc0204918:	de468693          	addi	a3,a3,-540 # ffffffffc020d6f8 <default_pmm_manager+0xc00>
ffffffffc020491c:	00007617          	auipc	a2,0x7
ffffffffc0204920:	6f460613          	addi	a2,a2,1780 # ffffffffc020c010 <commands+0x210>
ffffffffc0204924:	04400593          	li	a1,68
ffffffffc0204928:	00009517          	auipc	a0,0x9
ffffffffc020492c:	d8850513          	addi	a0,a0,-632 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc0204930:	b6ffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204934 <fd_array_release>:
ffffffffc0204934:	4118                	lw	a4,0(a0)
ffffffffc0204936:	1141                	addi	sp,sp,-16
ffffffffc0204938:	e406                	sd	ra,8(sp)
ffffffffc020493a:	4685                	li	a3,1
ffffffffc020493c:	3779                	addiw	a4,a4,-2
ffffffffc020493e:	04e6e063          	bltu	a3,a4,ffffffffc020497e <fd_array_release+0x4a>
ffffffffc0204942:	5918                	lw	a4,48(a0)
ffffffffc0204944:	00e05d63          	blez	a4,ffffffffc020495e <fd_array_release+0x2a>
ffffffffc0204948:	fff7069b          	addiw	a3,a4,-1
ffffffffc020494c:	d914                	sw	a3,48(a0)
ffffffffc020494e:	c681                	beqz	a3,ffffffffc0204956 <fd_array_release+0x22>
ffffffffc0204950:	60a2                	ld	ra,8(sp)
ffffffffc0204952:	0141                	addi	sp,sp,16
ffffffffc0204954:	8082                	ret
ffffffffc0204956:	60a2                	ld	ra,8(sp)
ffffffffc0204958:	0141                	addi	sp,sp,16
ffffffffc020495a:	f5fff06f          	j	ffffffffc02048b8 <fd_array_free>
ffffffffc020495e:	00009697          	auipc	a3,0x9
ffffffffc0204962:	e0a68693          	addi	a3,a3,-502 # ffffffffc020d768 <default_pmm_manager+0xc70>
ffffffffc0204966:	00007617          	auipc	a2,0x7
ffffffffc020496a:	6aa60613          	addi	a2,a2,1706 # ffffffffc020c010 <commands+0x210>
ffffffffc020496e:	05600593          	li	a1,86
ffffffffc0204972:	00009517          	auipc	a0,0x9
ffffffffc0204976:	d3e50513          	addi	a0,a0,-706 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc020497a:	b25fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020497e:	00009697          	auipc	a3,0x9
ffffffffc0204982:	db268693          	addi	a3,a3,-590 # ffffffffc020d730 <default_pmm_manager+0xc38>
ffffffffc0204986:	00007617          	auipc	a2,0x7
ffffffffc020498a:	68a60613          	addi	a2,a2,1674 # ffffffffc020c010 <commands+0x210>
ffffffffc020498e:	05500593          	li	a1,85
ffffffffc0204992:	00009517          	auipc	a0,0x9
ffffffffc0204996:	d1e50513          	addi	a0,a0,-738 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc020499a:	b05fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020499e <fd_array_open.part.0>:
ffffffffc020499e:	1141                	addi	sp,sp,-16
ffffffffc02049a0:	00009697          	auipc	a3,0x9
ffffffffc02049a4:	de068693          	addi	a3,a3,-544 # ffffffffc020d780 <default_pmm_manager+0xc88>
ffffffffc02049a8:	00007617          	auipc	a2,0x7
ffffffffc02049ac:	66860613          	addi	a2,a2,1640 # ffffffffc020c010 <commands+0x210>
ffffffffc02049b0:	05f00593          	li	a1,95
ffffffffc02049b4:	00009517          	auipc	a0,0x9
ffffffffc02049b8:	cfc50513          	addi	a0,a0,-772 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc02049bc:	e406                	sd	ra,8(sp)
ffffffffc02049be:	ae1fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02049c2 <fd_array_init>:
ffffffffc02049c2:	4781                	li	a5,0
ffffffffc02049c4:	04800713          	li	a4,72
ffffffffc02049c8:	cd1c                	sw	a5,24(a0)
ffffffffc02049ca:	02052823          	sw	zero,48(a0)
ffffffffc02049ce:	00052023          	sw	zero,0(a0)
ffffffffc02049d2:	2785                	addiw	a5,a5,1
ffffffffc02049d4:	03850513          	addi	a0,a0,56
ffffffffc02049d8:	fee798e3          	bne	a5,a4,ffffffffc02049c8 <fd_array_init+0x6>
ffffffffc02049dc:	8082                	ret

ffffffffc02049de <fd_array_close>:
ffffffffc02049de:	4118                	lw	a4,0(a0)
ffffffffc02049e0:	1141                	addi	sp,sp,-16
ffffffffc02049e2:	e406                	sd	ra,8(sp)
ffffffffc02049e4:	e022                	sd	s0,0(sp)
ffffffffc02049e6:	4789                	li	a5,2
ffffffffc02049e8:	04f71a63          	bne	a4,a5,ffffffffc0204a3c <fd_array_close+0x5e>
ffffffffc02049ec:	591c                	lw	a5,48(a0)
ffffffffc02049ee:	842a                	mv	s0,a0
ffffffffc02049f0:	02f05663          	blez	a5,ffffffffc0204a1c <fd_array_close+0x3e>
ffffffffc02049f4:	37fd                	addiw	a5,a5,-1
ffffffffc02049f6:	470d                	li	a4,3
ffffffffc02049f8:	c118                	sw	a4,0(a0)
ffffffffc02049fa:	d91c                	sw	a5,48(a0)
ffffffffc02049fc:	0007871b          	sext.w	a4,a5
ffffffffc0204a00:	c709                	beqz	a4,ffffffffc0204a0a <fd_array_close+0x2c>
ffffffffc0204a02:	60a2                	ld	ra,8(sp)
ffffffffc0204a04:	6402                	ld	s0,0(sp)
ffffffffc0204a06:	0141                	addi	sp,sp,16
ffffffffc0204a08:	8082                	ret
ffffffffc0204a0a:	7508                	ld	a0,40(a0)
ffffffffc0204a0c:	5b5030ef          	jal	ra,ffffffffc02087c0 <vfs_close>
ffffffffc0204a10:	60a2                	ld	ra,8(sp)
ffffffffc0204a12:	00042023          	sw	zero,0(s0)
ffffffffc0204a16:	6402                	ld	s0,0(sp)
ffffffffc0204a18:	0141                	addi	sp,sp,16
ffffffffc0204a1a:	8082                	ret
ffffffffc0204a1c:	00009697          	auipc	a3,0x9
ffffffffc0204a20:	d4c68693          	addi	a3,a3,-692 # ffffffffc020d768 <default_pmm_manager+0xc70>
ffffffffc0204a24:	00007617          	auipc	a2,0x7
ffffffffc0204a28:	5ec60613          	addi	a2,a2,1516 # ffffffffc020c010 <commands+0x210>
ffffffffc0204a2c:	06800593          	li	a1,104
ffffffffc0204a30:	00009517          	auipc	a0,0x9
ffffffffc0204a34:	c8050513          	addi	a0,a0,-896 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc0204a38:	a67fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204a3c:	00009697          	auipc	a3,0x9
ffffffffc0204a40:	c9c68693          	addi	a3,a3,-868 # ffffffffc020d6d8 <default_pmm_manager+0xbe0>
ffffffffc0204a44:	00007617          	auipc	a2,0x7
ffffffffc0204a48:	5cc60613          	addi	a2,a2,1484 # ffffffffc020c010 <commands+0x210>
ffffffffc0204a4c:	06700593          	li	a1,103
ffffffffc0204a50:	00009517          	auipc	a0,0x9
ffffffffc0204a54:	c6050513          	addi	a0,a0,-928 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc0204a58:	a47fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204a5c <fd_array_dup>:
ffffffffc0204a5c:	7179                	addi	sp,sp,-48
ffffffffc0204a5e:	e84a                	sd	s2,16(sp)
ffffffffc0204a60:	00052903          	lw	s2,0(a0)
ffffffffc0204a64:	f406                	sd	ra,40(sp)
ffffffffc0204a66:	f022                	sd	s0,32(sp)
ffffffffc0204a68:	ec26                	sd	s1,24(sp)
ffffffffc0204a6a:	e44e                	sd	s3,8(sp)
ffffffffc0204a6c:	4785                	li	a5,1
ffffffffc0204a6e:	04f91663          	bne	s2,a5,ffffffffc0204aba <fd_array_dup+0x5e>
ffffffffc0204a72:	0005a983          	lw	s3,0(a1)
ffffffffc0204a76:	4789                	li	a5,2
ffffffffc0204a78:	04f99163          	bne	s3,a5,ffffffffc0204aba <fd_array_dup+0x5e>
ffffffffc0204a7c:	7584                	ld	s1,40(a1)
ffffffffc0204a7e:	699c                	ld	a5,16(a1)
ffffffffc0204a80:	7194                	ld	a3,32(a1)
ffffffffc0204a82:	6598                	ld	a4,8(a1)
ffffffffc0204a84:	842a                	mv	s0,a0
ffffffffc0204a86:	e91c                	sd	a5,16(a0)
ffffffffc0204a88:	f114                	sd	a3,32(a0)
ffffffffc0204a8a:	e518                	sd	a4,8(a0)
ffffffffc0204a8c:	8526                	mv	a0,s1
ffffffffc0204a8e:	490030ef          	jal	ra,ffffffffc0207f1e <inode_ref_inc>
ffffffffc0204a92:	8526                	mv	a0,s1
ffffffffc0204a94:	496030ef          	jal	ra,ffffffffc0207f2a <inode_open_inc>
ffffffffc0204a98:	401c                	lw	a5,0(s0)
ffffffffc0204a9a:	f404                	sd	s1,40(s0)
ffffffffc0204a9c:	03279f63          	bne	a5,s2,ffffffffc0204ada <fd_array_dup+0x7e>
ffffffffc0204aa0:	cc8d                	beqz	s1,ffffffffc0204ada <fd_array_dup+0x7e>
ffffffffc0204aa2:	581c                	lw	a5,48(s0)
ffffffffc0204aa4:	01342023          	sw	s3,0(s0)
ffffffffc0204aa8:	70a2                	ld	ra,40(sp)
ffffffffc0204aaa:	2785                	addiw	a5,a5,1
ffffffffc0204aac:	d81c                	sw	a5,48(s0)
ffffffffc0204aae:	7402                	ld	s0,32(sp)
ffffffffc0204ab0:	64e2                	ld	s1,24(sp)
ffffffffc0204ab2:	6942                	ld	s2,16(sp)
ffffffffc0204ab4:	69a2                	ld	s3,8(sp)
ffffffffc0204ab6:	6145                	addi	sp,sp,48
ffffffffc0204ab8:	8082                	ret
ffffffffc0204aba:	00009697          	auipc	a3,0x9
ffffffffc0204abe:	cf668693          	addi	a3,a3,-778 # ffffffffc020d7b0 <default_pmm_manager+0xcb8>
ffffffffc0204ac2:	00007617          	auipc	a2,0x7
ffffffffc0204ac6:	54e60613          	addi	a2,a2,1358 # ffffffffc020c010 <commands+0x210>
ffffffffc0204aca:	07300593          	li	a1,115
ffffffffc0204ace:	00009517          	auipc	a0,0x9
ffffffffc0204ad2:	be250513          	addi	a0,a0,-1054 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc0204ad6:	9c9fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204ada:	ec5ff0ef          	jal	ra,ffffffffc020499e <fd_array_open.part.0>

ffffffffc0204ade <file_testfd>:
ffffffffc0204ade:	04700793          	li	a5,71
ffffffffc0204ae2:	04a7e263          	bltu	a5,a0,ffffffffc0204b26 <file_testfd+0x48>
ffffffffc0204ae6:	00092797          	auipc	a5,0x92
ffffffffc0204aea:	e0a7b783          	ld	a5,-502(a5) # ffffffffc02968f0 <current>
ffffffffc0204aee:	1507b783          	ld	a5,336(a5)
ffffffffc0204af2:	cf85                	beqz	a5,ffffffffc0204b2a <file_testfd+0x4c>
ffffffffc0204af4:	4b98                	lw	a4,16(a5)
ffffffffc0204af6:	02e05a63          	blez	a4,ffffffffc0204b2a <file_testfd+0x4c>
ffffffffc0204afa:	6798                	ld	a4,8(a5)
ffffffffc0204afc:	00351793          	slli	a5,a0,0x3
ffffffffc0204b00:	8f89                	sub	a5,a5,a0
ffffffffc0204b02:	078e                	slli	a5,a5,0x3
ffffffffc0204b04:	97ba                	add	a5,a5,a4
ffffffffc0204b06:	4394                	lw	a3,0(a5)
ffffffffc0204b08:	4709                	li	a4,2
ffffffffc0204b0a:	00e69e63          	bne	a3,a4,ffffffffc0204b26 <file_testfd+0x48>
ffffffffc0204b0e:	4f98                	lw	a4,24(a5)
ffffffffc0204b10:	00a71b63          	bne	a4,a0,ffffffffc0204b26 <file_testfd+0x48>
ffffffffc0204b14:	c199                	beqz	a1,ffffffffc0204b1a <file_testfd+0x3c>
ffffffffc0204b16:	6788                	ld	a0,8(a5)
ffffffffc0204b18:	c901                	beqz	a0,ffffffffc0204b28 <file_testfd+0x4a>
ffffffffc0204b1a:	4505                	li	a0,1
ffffffffc0204b1c:	c611                	beqz	a2,ffffffffc0204b28 <file_testfd+0x4a>
ffffffffc0204b1e:	6b88                	ld	a0,16(a5)
ffffffffc0204b20:	00a03533          	snez	a0,a0
ffffffffc0204b24:	8082                	ret
ffffffffc0204b26:	4501                	li	a0,0
ffffffffc0204b28:	8082                	ret
ffffffffc0204b2a:	1141                	addi	sp,sp,-16
ffffffffc0204b2c:	e406                	sd	ra,8(sp)
ffffffffc0204b2e:	cd5ff0ef          	jal	ra,ffffffffc0204802 <get_fd_array.part.0>

ffffffffc0204b32 <file_open>:
ffffffffc0204b32:	711d                	addi	sp,sp,-96
ffffffffc0204b34:	ec86                	sd	ra,88(sp)
ffffffffc0204b36:	e8a2                	sd	s0,80(sp)
ffffffffc0204b38:	e4a6                	sd	s1,72(sp)
ffffffffc0204b3a:	e0ca                	sd	s2,64(sp)
ffffffffc0204b3c:	fc4e                	sd	s3,56(sp)
ffffffffc0204b3e:	f852                	sd	s4,48(sp)
ffffffffc0204b40:	0035f793          	andi	a5,a1,3
ffffffffc0204b44:	470d                	li	a4,3
ffffffffc0204b46:	0ce78163          	beq	a5,a4,ffffffffc0204c08 <file_open+0xd6>
ffffffffc0204b4a:	078e                	slli	a5,a5,0x3
ffffffffc0204b4c:	00009717          	auipc	a4,0x9
ffffffffc0204b50:	ed470713          	addi	a4,a4,-300 # ffffffffc020da20 <CSWTCH.79>
ffffffffc0204b54:	892a                	mv	s2,a0
ffffffffc0204b56:	00009697          	auipc	a3,0x9
ffffffffc0204b5a:	eb268693          	addi	a3,a3,-334 # ffffffffc020da08 <CSWTCH.78>
ffffffffc0204b5e:	755d                	lui	a0,0xffff7
ffffffffc0204b60:	96be                	add	a3,a3,a5
ffffffffc0204b62:	84ae                	mv	s1,a1
ffffffffc0204b64:	97ba                	add	a5,a5,a4
ffffffffc0204b66:	858a                	mv	a1,sp
ffffffffc0204b68:	ad950513          	addi	a0,a0,-1319 # ffffffffffff6ad9 <end+0x3fd60199>
ffffffffc0204b6c:	0006ba03          	ld	s4,0(a3)
ffffffffc0204b70:	0007b983          	ld	s3,0(a5)
ffffffffc0204b74:	cb1ff0ef          	jal	ra,ffffffffc0204824 <fd_array_alloc>
ffffffffc0204b78:	842a                	mv	s0,a0
ffffffffc0204b7a:	c911                	beqz	a0,ffffffffc0204b8e <file_open+0x5c>
ffffffffc0204b7c:	60e6                	ld	ra,88(sp)
ffffffffc0204b7e:	8522                	mv	a0,s0
ffffffffc0204b80:	6446                	ld	s0,80(sp)
ffffffffc0204b82:	64a6                	ld	s1,72(sp)
ffffffffc0204b84:	6906                	ld	s2,64(sp)
ffffffffc0204b86:	79e2                	ld	s3,56(sp)
ffffffffc0204b88:	7a42                	ld	s4,48(sp)
ffffffffc0204b8a:	6125                	addi	sp,sp,96
ffffffffc0204b8c:	8082                	ret
ffffffffc0204b8e:	0030                	addi	a2,sp,8
ffffffffc0204b90:	85a6                	mv	a1,s1
ffffffffc0204b92:	854a                	mv	a0,s2
ffffffffc0204b94:	287030ef          	jal	ra,ffffffffc020861a <vfs_open>
ffffffffc0204b98:	842a                	mv	s0,a0
ffffffffc0204b9a:	e13d                	bnez	a0,ffffffffc0204c00 <file_open+0xce>
ffffffffc0204b9c:	6782                	ld	a5,0(sp)
ffffffffc0204b9e:	0204f493          	andi	s1,s1,32
ffffffffc0204ba2:	6422                	ld	s0,8(sp)
ffffffffc0204ba4:	0207b023          	sd	zero,32(a5)
ffffffffc0204ba8:	c885                	beqz	s1,ffffffffc0204bd8 <file_open+0xa6>
ffffffffc0204baa:	c03d                	beqz	s0,ffffffffc0204c10 <file_open+0xde>
ffffffffc0204bac:	783c                	ld	a5,112(s0)
ffffffffc0204bae:	c3ad                	beqz	a5,ffffffffc0204c10 <file_open+0xde>
ffffffffc0204bb0:	779c                	ld	a5,40(a5)
ffffffffc0204bb2:	cfb9                	beqz	a5,ffffffffc0204c10 <file_open+0xde>
ffffffffc0204bb4:	8522                	mv	a0,s0
ffffffffc0204bb6:	00009597          	auipc	a1,0x9
ffffffffc0204bba:	c8258593          	addi	a1,a1,-894 # ffffffffc020d838 <default_pmm_manager+0xd40>
ffffffffc0204bbe:	378030ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0204bc2:	783c                	ld	a5,112(s0)
ffffffffc0204bc4:	6522                	ld	a0,8(sp)
ffffffffc0204bc6:	080c                	addi	a1,sp,16
ffffffffc0204bc8:	779c                	ld	a5,40(a5)
ffffffffc0204bca:	9782                	jalr	a5
ffffffffc0204bcc:	842a                	mv	s0,a0
ffffffffc0204bce:	e515                	bnez	a0,ffffffffc0204bfa <file_open+0xc8>
ffffffffc0204bd0:	6782                	ld	a5,0(sp)
ffffffffc0204bd2:	7722                	ld	a4,40(sp)
ffffffffc0204bd4:	6422                	ld	s0,8(sp)
ffffffffc0204bd6:	f398                	sd	a4,32(a5)
ffffffffc0204bd8:	4394                	lw	a3,0(a5)
ffffffffc0204bda:	f780                	sd	s0,40(a5)
ffffffffc0204bdc:	0147b423          	sd	s4,8(a5)
ffffffffc0204be0:	0137b823          	sd	s3,16(a5)
ffffffffc0204be4:	4705                	li	a4,1
ffffffffc0204be6:	02e69363          	bne	a3,a4,ffffffffc0204c0c <file_open+0xda>
ffffffffc0204bea:	c00d                	beqz	s0,ffffffffc0204c0c <file_open+0xda>
ffffffffc0204bec:	5b98                	lw	a4,48(a5)
ffffffffc0204bee:	4689                	li	a3,2
ffffffffc0204bf0:	4f80                	lw	s0,24(a5)
ffffffffc0204bf2:	2705                	addiw	a4,a4,1
ffffffffc0204bf4:	c394                	sw	a3,0(a5)
ffffffffc0204bf6:	db98                	sw	a4,48(a5)
ffffffffc0204bf8:	b751                	j	ffffffffc0204b7c <file_open+0x4a>
ffffffffc0204bfa:	6522                	ld	a0,8(sp)
ffffffffc0204bfc:	3c5030ef          	jal	ra,ffffffffc02087c0 <vfs_close>
ffffffffc0204c00:	6502                	ld	a0,0(sp)
ffffffffc0204c02:	cb7ff0ef          	jal	ra,ffffffffc02048b8 <fd_array_free>
ffffffffc0204c06:	bf9d                	j	ffffffffc0204b7c <file_open+0x4a>
ffffffffc0204c08:	5475                	li	s0,-3
ffffffffc0204c0a:	bf8d                	j	ffffffffc0204b7c <file_open+0x4a>
ffffffffc0204c0c:	d93ff0ef          	jal	ra,ffffffffc020499e <fd_array_open.part.0>
ffffffffc0204c10:	00009697          	auipc	a3,0x9
ffffffffc0204c14:	bd868693          	addi	a3,a3,-1064 # ffffffffc020d7e8 <default_pmm_manager+0xcf0>
ffffffffc0204c18:	00007617          	auipc	a2,0x7
ffffffffc0204c1c:	3f860613          	addi	a2,a2,1016 # ffffffffc020c010 <commands+0x210>
ffffffffc0204c20:	0b500593          	li	a1,181
ffffffffc0204c24:	00009517          	auipc	a0,0x9
ffffffffc0204c28:	a8c50513          	addi	a0,a0,-1396 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc0204c2c:	873fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204c30 <file_close>:
ffffffffc0204c30:	04700713          	li	a4,71
ffffffffc0204c34:	04a76563          	bltu	a4,a0,ffffffffc0204c7e <file_close+0x4e>
ffffffffc0204c38:	00092717          	auipc	a4,0x92
ffffffffc0204c3c:	cb873703          	ld	a4,-840(a4) # ffffffffc02968f0 <current>
ffffffffc0204c40:	15073703          	ld	a4,336(a4)
ffffffffc0204c44:	1141                	addi	sp,sp,-16
ffffffffc0204c46:	e406                	sd	ra,8(sp)
ffffffffc0204c48:	cf0d                	beqz	a4,ffffffffc0204c82 <file_close+0x52>
ffffffffc0204c4a:	4b14                	lw	a3,16(a4)
ffffffffc0204c4c:	02d05b63          	blez	a3,ffffffffc0204c82 <file_close+0x52>
ffffffffc0204c50:	6718                	ld	a4,8(a4)
ffffffffc0204c52:	87aa                	mv	a5,a0
ffffffffc0204c54:	050e                	slli	a0,a0,0x3
ffffffffc0204c56:	8d1d                	sub	a0,a0,a5
ffffffffc0204c58:	050e                	slli	a0,a0,0x3
ffffffffc0204c5a:	953a                	add	a0,a0,a4
ffffffffc0204c5c:	4114                	lw	a3,0(a0)
ffffffffc0204c5e:	4709                	li	a4,2
ffffffffc0204c60:	00e69b63          	bne	a3,a4,ffffffffc0204c76 <file_close+0x46>
ffffffffc0204c64:	4d18                	lw	a4,24(a0)
ffffffffc0204c66:	00f71863          	bne	a4,a5,ffffffffc0204c76 <file_close+0x46>
ffffffffc0204c6a:	d75ff0ef          	jal	ra,ffffffffc02049de <fd_array_close>
ffffffffc0204c6e:	60a2                	ld	ra,8(sp)
ffffffffc0204c70:	4501                	li	a0,0
ffffffffc0204c72:	0141                	addi	sp,sp,16
ffffffffc0204c74:	8082                	ret
ffffffffc0204c76:	60a2                	ld	ra,8(sp)
ffffffffc0204c78:	5575                	li	a0,-3
ffffffffc0204c7a:	0141                	addi	sp,sp,16
ffffffffc0204c7c:	8082                	ret
ffffffffc0204c7e:	5575                	li	a0,-3
ffffffffc0204c80:	8082                	ret
ffffffffc0204c82:	b81ff0ef          	jal	ra,ffffffffc0204802 <get_fd_array.part.0>

ffffffffc0204c86 <file_read>:
ffffffffc0204c86:	715d                	addi	sp,sp,-80
ffffffffc0204c88:	e486                	sd	ra,72(sp)
ffffffffc0204c8a:	e0a2                	sd	s0,64(sp)
ffffffffc0204c8c:	fc26                	sd	s1,56(sp)
ffffffffc0204c8e:	f84a                	sd	s2,48(sp)
ffffffffc0204c90:	f44e                	sd	s3,40(sp)
ffffffffc0204c92:	f052                	sd	s4,32(sp)
ffffffffc0204c94:	0006b023          	sd	zero,0(a3)
ffffffffc0204c98:	04700793          	li	a5,71
ffffffffc0204c9c:	0aa7e463          	bltu	a5,a0,ffffffffc0204d44 <file_read+0xbe>
ffffffffc0204ca0:	00092797          	auipc	a5,0x92
ffffffffc0204ca4:	c507b783          	ld	a5,-944(a5) # ffffffffc02968f0 <current>
ffffffffc0204ca8:	1507b783          	ld	a5,336(a5)
ffffffffc0204cac:	cfd1                	beqz	a5,ffffffffc0204d48 <file_read+0xc2>
ffffffffc0204cae:	4b98                	lw	a4,16(a5)
ffffffffc0204cb0:	08e05c63          	blez	a4,ffffffffc0204d48 <file_read+0xc2>
ffffffffc0204cb4:	6780                	ld	s0,8(a5)
ffffffffc0204cb6:	00351793          	slli	a5,a0,0x3
ffffffffc0204cba:	8f89                	sub	a5,a5,a0
ffffffffc0204cbc:	078e                	slli	a5,a5,0x3
ffffffffc0204cbe:	943e                	add	s0,s0,a5
ffffffffc0204cc0:	00042983          	lw	s3,0(s0)
ffffffffc0204cc4:	4789                	li	a5,2
ffffffffc0204cc6:	06f99f63          	bne	s3,a5,ffffffffc0204d44 <file_read+0xbe>
ffffffffc0204cca:	4c1c                	lw	a5,24(s0)
ffffffffc0204ccc:	06a79c63          	bne	a5,a0,ffffffffc0204d44 <file_read+0xbe>
ffffffffc0204cd0:	641c                	ld	a5,8(s0)
ffffffffc0204cd2:	cbad                	beqz	a5,ffffffffc0204d44 <file_read+0xbe>
ffffffffc0204cd4:	581c                	lw	a5,48(s0)
ffffffffc0204cd6:	8a36                	mv	s4,a3
ffffffffc0204cd8:	7014                	ld	a3,32(s0)
ffffffffc0204cda:	2785                	addiw	a5,a5,1
ffffffffc0204cdc:	850a                	mv	a0,sp
ffffffffc0204cde:	d81c                	sw	a5,48(s0)
ffffffffc0204ce0:	792000ef          	jal	ra,ffffffffc0205472 <iobuf_init>
ffffffffc0204ce4:	02843903          	ld	s2,40(s0)
ffffffffc0204ce8:	84aa                	mv	s1,a0
ffffffffc0204cea:	06090163          	beqz	s2,ffffffffc0204d4c <file_read+0xc6>
ffffffffc0204cee:	07093783          	ld	a5,112(s2)
ffffffffc0204cf2:	cfa9                	beqz	a5,ffffffffc0204d4c <file_read+0xc6>
ffffffffc0204cf4:	6f9c                	ld	a5,24(a5)
ffffffffc0204cf6:	cbb9                	beqz	a5,ffffffffc0204d4c <file_read+0xc6>
ffffffffc0204cf8:	00009597          	auipc	a1,0x9
ffffffffc0204cfc:	b9858593          	addi	a1,a1,-1128 # ffffffffc020d890 <default_pmm_manager+0xd98>
ffffffffc0204d00:	854a                	mv	a0,s2
ffffffffc0204d02:	234030ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0204d06:	07093783          	ld	a5,112(s2)
ffffffffc0204d0a:	7408                	ld	a0,40(s0)
ffffffffc0204d0c:	85a6                	mv	a1,s1
ffffffffc0204d0e:	6f9c                	ld	a5,24(a5)
ffffffffc0204d10:	9782                	jalr	a5
ffffffffc0204d12:	689c                	ld	a5,16(s1)
ffffffffc0204d14:	6c94                	ld	a3,24(s1)
ffffffffc0204d16:	4018                	lw	a4,0(s0)
ffffffffc0204d18:	84aa                	mv	s1,a0
ffffffffc0204d1a:	8f95                	sub	a5,a5,a3
ffffffffc0204d1c:	03370063          	beq	a4,s3,ffffffffc0204d3c <file_read+0xb6>
ffffffffc0204d20:	00fa3023          	sd	a5,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0204d24:	8522                	mv	a0,s0
ffffffffc0204d26:	c0fff0ef          	jal	ra,ffffffffc0204934 <fd_array_release>
ffffffffc0204d2a:	60a6                	ld	ra,72(sp)
ffffffffc0204d2c:	6406                	ld	s0,64(sp)
ffffffffc0204d2e:	7942                	ld	s2,48(sp)
ffffffffc0204d30:	79a2                	ld	s3,40(sp)
ffffffffc0204d32:	7a02                	ld	s4,32(sp)
ffffffffc0204d34:	8526                	mv	a0,s1
ffffffffc0204d36:	74e2                	ld	s1,56(sp)
ffffffffc0204d38:	6161                	addi	sp,sp,80
ffffffffc0204d3a:	8082                	ret
ffffffffc0204d3c:	7018                	ld	a4,32(s0)
ffffffffc0204d3e:	973e                	add	a4,a4,a5
ffffffffc0204d40:	f018                	sd	a4,32(s0)
ffffffffc0204d42:	bff9                	j	ffffffffc0204d20 <file_read+0x9a>
ffffffffc0204d44:	54f5                	li	s1,-3
ffffffffc0204d46:	b7d5                	j	ffffffffc0204d2a <file_read+0xa4>
ffffffffc0204d48:	abbff0ef          	jal	ra,ffffffffc0204802 <get_fd_array.part.0>
ffffffffc0204d4c:	00009697          	auipc	a3,0x9
ffffffffc0204d50:	af468693          	addi	a3,a3,-1292 # ffffffffc020d840 <default_pmm_manager+0xd48>
ffffffffc0204d54:	00007617          	auipc	a2,0x7
ffffffffc0204d58:	2bc60613          	addi	a2,a2,700 # ffffffffc020c010 <commands+0x210>
ffffffffc0204d5c:	0de00593          	li	a1,222
ffffffffc0204d60:	00009517          	auipc	a0,0x9
ffffffffc0204d64:	95050513          	addi	a0,a0,-1712 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc0204d68:	f36fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204d6c <file_write>:
ffffffffc0204d6c:	715d                	addi	sp,sp,-80
ffffffffc0204d6e:	e486                	sd	ra,72(sp)
ffffffffc0204d70:	e0a2                	sd	s0,64(sp)
ffffffffc0204d72:	fc26                	sd	s1,56(sp)
ffffffffc0204d74:	f84a                	sd	s2,48(sp)
ffffffffc0204d76:	f44e                	sd	s3,40(sp)
ffffffffc0204d78:	f052                	sd	s4,32(sp)
ffffffffc0204d7a:	0006b023          	sd	zero,0(a3)
ffffffffc0204d7e:	04700793          	li	a5,71
ffffffffc0204d82:	0aa7e463          	bltu	a5,a0,ffffffffc0204e2a <file_write+0xbe>
ffffffffc0204d86:	00092797          	auipc	a5,0x92
ffffffffc0204d8a:	b6a7b783          	ld	a5,-1174(a5) # ffffffffc02968f0 <current>
ffffffffc0204d8e:	1507b783          	ld	a5,336(a5)
ffffffffc0204d92:	cfd1                	beqz	a5,ffffffffc0204e2e <file_write+0xc2>
ffffffffc0204d94:	4b98                	lw	a4,16(a5)
ffffffffc0204d96:	08e05c63          	blez	a4,ffffffffc0204e2e <file_write+0xc2>
ffffffffc0204d9a:	6780                	ld	s0,8(a5)
ffffffffc0204d9c:	00351793          	slli	a5,a0,0x3
ffffffffc0204da0:	8f89                	sub	a5,a5,a0
ffffffffc0204da2:	078e                	slli	a5,a5,0x3
ffffffffc0204da4:	943e                	add	s0,s0,a5
ffffffffc0204da6:	00042983          	lw	s3,0(s0)
ffffffffc0204daa:	4789                	li	a5,2
ffffffffc0204dac:	06f99f63          	bne	s3,a5,ffffffffc0204e2a <file_write+0xbe>
ffffffffc0204db0:	4c1c                	lw	a5,24(s0)
ffffffffc0204db2:	06a79c63          	bne	a5,a0,ffffffffc0204e2a <file_write+0xbe>
ffffffffc0204db6:	681c                	ld	a5,16(s0)
ffffffffc0204db8:	cbad                	beqz	a5,ffffffffc0204e2a <file_write+0xbe>
ffffffffc0204dba:	581c                	lw	a5,48(s0)
ffffffffc0204dbc:	8a36                	mv	s4,a3
ffffffffc0204dbe:	7014                	ld	a3,32(s0)
ffffffffc0204dc0:	2785                	addiw	a5,a5,1
ffffffffc0204dc2:	850a                	mv	a0,sp
ffffffffc0204dc4:	d81c                	sw	a5,48(s0)
ffffffffc0204dc6:	6ac000ef          	jal	ra,ffffffffc0205472 <iobuf_init>
ffffffffc0204dca:	02843903          	ld	s2,40(s0)
ffffffffc0204dce:	84aa                	mv	s1,a0
ffffffffc0204dd0:	06090163          	beqz	s2,ffffffffc0204e32 <file_write+0xc6>
ffffffffc0204dd4:	07093783          	ld	a5,112(s2)
ffffffffc0204dd8:	cfa9                	beqz	a5,ffffffffc0204e32 <file_write+0xc6>
ffffffffc0204dda:	739c                	ld	a5,32(a5)
ffffffffc0204ddc:	cbb9                	beqz	a5,ffffffffc0204e32 <file_write+0xc6>
ffffffffc0204dde:	00009597          	auipc	a1,0x9
ffffffffc0204de2:	b0a58593          	addi	a1,a1,-1270 # ffffffffc020d8e8 <default_pmm_manager+0xdf0>
ffffffffc0204de6:	854a                	mv	a0,s2
ffffffffc0204de8:	14e030ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0204dec:	07093783          	ld	a5,112(s2)
ffffffffc0204df0:	7408                	ld	a0,40(s0)
ffffffffc0204df2:	85a6                	mv	a1,s1
ffffffffc0204df4:	739c                	ld	a5,32(a5)
ffffffffc0204df6:	9782                	jalr	a5
ffffffffc0204df8:	689c                	ld	a5,16(s1)
ffffffffc0204dfa:	6c94                	ld	a3,24(s1)
ffffffffc0204dfc:	4018                	lw	a4,0(s0)
ffffffffc0204dfe:	84aa                	mv	s1,a0
ffffffffc0204e00:	8f95                	sub	a5,a5,a3
ffffffffc0204e02:	03370063          	beq	a4,s3,ffffffffc0204e22 <file_write+0xb6>
ffffffffc0204e06:	00fa3023          	sd	a5,0(s4)
ffffffffc0204e0a:	8522                	mv	a0,s0
ffffffffc0204e0c:	b29ff0ef          	jal	ra,ffffffffc0204934 <fd_array_release>
ffffffffc0204e10:	60a6                	ld	ra,72(sp)
ffffffffc0204e12:	6406                	ld	s0,64(sp)
ffffffffc0204e14:	7942                	ld	s2,48(sp)
ffffffffc0204e16:	79a2                	ld	s3,40(sp)
ffffffffc0204e18:	7a02                	ld	s4,32(sp)
ffffffffc0204e1a:	8526                	mv	a0,s1
ffffffffc0204e1c:	74e2                	ld	s1,56(sp)
ffffffffc0204e1e:	6161                	addi	sp,sp,80
ffffffffc0204e20:	8082                	ret
ffffffffc0204e22:	7018                	ld	a4,32(s0)
ffffffffc0204e24:	973e                	add	a4,a4,a5
ffffffffc0204e26:	f018                	sd	a4,32(s0)
ffffffffc0204e28:	bff9                	j	ffffffffc0204e06 <file_write+0x9a>
ffffffffc0204e2a:	54f5                	li	s1,-3
ffffffffc0204e2c:	b7d5                	j	ffffffffc0204e10 <file_write+0xa4>
ffffffffc0204e2e:	9d5ff0ef          	jal	ra,ffffffffc0204802 <get_fd_array.part.0>
ffffffffc0204e32:	00009697          	auipc	a3,0x9
ffffffffc0204e36:	a6668693          	addi	a3,a3,-1434 # ffffffffc020d898 <default_pmm_manager+0xda0>
ffffffffc0204e3a:	00007617          	auipc	a2,0x7
ffffffffc0204e3e:	1d660613          	addi	a2,a2,470 # ffffffffc020c010 <commands+0x210>
ffffffffc0204e42:	0f800593          	li	a1,248
ffffffffc0204e46:	00009517          	auipc	a0,0x9
ffffffffc0204e4a:	86a50513          	addi	a0,a0,-1942 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc0204e4e:	e50fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204e52 <file_seek>:
ffffffffc0204e52:	7139                	addi	sp,sp,-64
ffffffffc0204e54:	fc06                	sd	ra,56(sp)
ffffffffc0204e56:	f822                	sd	s0,48(sp)
ffffffffc0204e58:	f426                	sd	s1,40(sp)
ffffffffc0204e5a:	f04a                	sd	s2,32(sp)
ffffffffc0204e5c:	04700793          	li	a5,71
ffffffffc0204e60:	08a7e863          	bltu	a5,a0,ffffffffc0204ef0 <file_seek+0x9e>
ffffffffc0204e64:	00092797          	auipc	a5,0x92
ffffffffc0204e68:	a8c7b783          	ld	a5,-1396(a5) # ffffffffc02968f0 <current>
ffffffffc0204e6c:	1507b783          	ld	a5,336(a5)
ffffffffc0204e70:	cfdd                	beqz	a5,ffffffffc0204f2e <file_seek+0xdc>
ffffffffc0204e72:	4b98                	lw	a4,16(a5)
ffffffffc0204e74:	0ae05d63          	blez	a4,ffffffffc0204f2e <file_seek+0xdc>
ffffffffc0204e78:	6780                	ld	s0,8(a5)
ffffffffc0204e7a:	00351793          	slli	a5,a0,0x3
ffffffffc0204e7e:	8f89                	sub	a5,a5,a0
ffffffffc0204e80:	078e                	slli	a5,a5,0x3
ffffffffc0204e82:	943e                	add	s0,s0,a5
ffffffffc0204e84:	4018                	lw	a4,0(s0)
ffffffffc0204e86:	4789                	li	a5,2
ffffffffc0204e88:	06f71463          	bne	a4,a5,ffffffffc0204ef0 <file_seek+0x9e>
ffffffffc0204e8c:	4c1c                	lw	a5,24(s0)
ffffffffc0204e8e:	06a79163          	bne	a5,a0,ffffffffc0204ef0 <file_seek+0x9e>
ffffffffc0204e92:	581c                	lw	a5,48(s0)
ffffffffc0204e94:	4685                	li	a3,1
ffffffffc0204e96:	892e                	mv	s2,a1
ffffffffc0204e98:	2785                	addiw	a5,a5,1
ffffffffc0204e9a:	d81c                	sw	a5,48(s0)
ffffffffc0204e9c:	02d60063          	beq	a2,a3,ffffffffc0204ebc <file_seek+0x6a>
ffffffffc0204ea0:	06e60063          	beq	a2,a4,ffffffffc0204f00 <file_seek+0xae>
ffffffffc0204ea4:	54f5                	li	s1,-3
ffffffffc0204ea6:	ce11                	beqz	a2,ffffffffc0204ec2 <file_seek+0x70>
ffffffffc0204ea8:	8522                	mv	a0,s0
ffffffffc0204eaa:	a8bff0ef          	jal	ra,ffffffffc0204934 <fd_array_release>
ffffffffc0204eae:	70e2                	ld	ra,56(sp)
ffffffffc0204eb0:	7442                	ld	s0,48(sp)
ffffffffc0204eb2:	7902                	ld	s2,32(sp)
ffffffffc0204eb4:	8526                	mv	a0,s1
ffffffffc0204eb6:	74a2                	ld	s1,40(sp)
ffffffffc0204eb8:	6121                	addi	sp,sp,64
ffffffffc0204eba:	8082                	ret
ffffffffc0204ebc:	701c                	ld	a5,32(s0)
ffffffffc0204ebe:	00f58933          	add	s2,a1,a5
ffffffffc0204ec2:	7404                	ld	s1,40(s0)
ffffffffc0204ec4:	c4bd                	beqz	s1,ffffffffc0204f32 <file_seek+0xe0>
ffffffffc0204ec6:	78bc                	ld	a5,112(s1)
ffffffffc0204ec8:	c7ad                	beqz	a5,ffffffffc0204f32 <file_seek+0xe0>
ffffffffc0204eca:	6fbc                	ld	a5,88(a5)
ffffffffc0204ecc:	c3bd                	beqz	a5,ffffffffc0204f32 <file_seek+0xe0>
ffffffffc0204ece:	8526                	mv	a0,s1
ffffffffc0204ed0:	00009597          	auipc	a1,0x9
ffffffffc0204ed4:	a7058593          	addi	a1,a1,-1424 # ffffffffc020d940 <default_pmm_manager+0xe48>
ffffffffc0204ed8:	05e030ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0204edc:	78bc                	ld	a5,112(s1)
ffffffffc0204ede:	7408                	ld	a0,40(s0)
ffffffffc0204ee0:	85ca                	mv	a1,s2
ffffffffc0204ee2:	6fbc                	ld	a5,88(a5)
ffffffffc0204ee4:	9782                	jalr	a5
ffffffffc0204ee6:	84aa                	mv	s1,a0
ffffffffc0204ee8:	f161                	bnez	a0,ffffffffc0204ea8 <file_seek+0x56>
ffffffffc0204eea:	03243023          	sd	s2,32(s0)
ffffffffc0204eee:	bf6d                	j	ffffffffc0204ea8 <file_seek+0x56>
ffffffffc0204ef0:	70e2                	ld	ra,56(sp)
ffffffffc0204ef2:	7442                	ld	s0,48(sp)
ffffffffc0204ef4:	54f5                	li	s1,-3
ffffffffc0204ef6:	7902                	ld	s2,32(sp)
ffffffffc0204ef8:	8526                	mv	a0,s1
ffffffffc0204efa:	74a2                	ld	s1,40(sp)
ffffffffc0204efc:	6121                	addi	sp,sp,64
ffffffffc0204efe:	8082                	ret
ffffffffc0204f00:	7404                	ld	s1,40(s0)
ffffffffc0204f02:	c8a1                	beqz	s1,ffffffffc0204f52 <file_seek+0x100>
ffffffffc0204f04:	78bc                	ld	a5,112(s1)
ffffffffc0204f06:	c7b1                	beqz	a5,ffffffffc0204f52 <file_seek+0x100>
ffffffffc0204f08:	779c                	ld	a5,40(a5)
ffffffffc0204f0a:	c7a1                	beqz	a5,ffffffffc0204f52 <file_seek+0x100>
ffffffffc0204f0c:	8526                	mv	a0,s1
ffffffffc0204f0e:	00009597          	auipc	a1,0x9
ffffffffc0204f12:	92a58593          	addi	a1,a1,-1750 # ffffffffc020d838 <default_pmm_manager+0xd40>
ffffffffc0204f16:	020030ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0204f1a:	78bc                	ld	a5,112(s1)
ffffffffc0204f1c:	7408                	ld	a0,40(s0)
ffffffffc0204f1e:	858a                	mv	a1,sp
ffffffffc0204f20:	779c                	ld	a5,40(a5)
ffffffffc0204f22:	9782                	jalr	a5
ffffffffc0204f24:	84aa                	mv	s1,a0
ffffffffc0204f26:	f149                	bnez	a0,ffffffffc0204ea8 <file_seek+0x56>
ffffffffc0204f28:	67e2                	ld	a5,24(sp)
ffffffffc0204f2a:	993e                	add	s2,s2,a5
ffffffffc0204f2c:	bf59                	j	ffffffffc0204ec2 <file_seek+0x70>
ffffffffc0204f2e:	8d5ff0ef          	jal	ra,ffffffffc0204802 <get_fd_array.part.0>
ffffffffc0204f32:	00009697          	auipc	a3,0x9
ffffffffc0204f36:	9be68693          	addi	a3,a3,-1602 # ffffffffc020d8f0 <default_pmm_manager+0xdf8>
ffffffffc0204f3a:	00007617          	auipc	a2,0x7
ffffffffc0204f3e:	0d660613          	addi	a2,a2,214 # ffffffffc020c010 <commands+0x210>
ffffffffc0204f42:	11a00593          	li	a1,282
ffffffffc0204f46:	00008517          	auipc	a0,0x8
ffffffffc0204f4a:	76a50513          	addi	a0,a0,1898 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc0204f4e:	d50fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204f52:	00009697          	auipc	a3,0x9
ffffffffc0204f56:	89668693          	addi	a3,a3,-1898 # ffffffffc020d7e8 <default_pmm_manager+0xcf0>
ffffffffc0204f5a:	00007617          	auipc	a2,0x7
ffffffffc0204f5e:	0b660613          	addi	a2,a2,182 # ffffffffc020c010 <commands+0x210>
ffffffffc0204f62:	11200593          	li	a1,274
ffffffffc0204f66:	00008517          	auipc	a0,0x8
ffffffffc0204f6a:	74a50513          	addi	a0,a0,1866 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc0204f6e:	d30fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204f72 <file_fstat>:
ffffffffc0204f72:	1101                	addi	sp,sp,-32
ffffffffc0204f74:	ec06                	sd	ra,24(sp)
ffffffffc0204f76:	e822                	sd	s0,16(sp)
ffffffffc0204f78:	e426                	sd	s1,8(sp)
ffffffffc0204f7a:	e04a                	sd	s2,0(sp)
ffffffffc0204f7c:	04700793          	li	a5,71
ffffffffc0204f80:	06a7ef63          	bltu	a5,a0,ffffffffc0204ffe <file_fstat+0x8c>
ffffffffc0204f84:	00092797          	auipc	a5,0x92
ffffffffc0204f88:	96c7b783          	ld	a5,-1684(a5) # ffffffffc02968f0 <current>
ffffffffc0204f8c:	1507b783          	ld	a5,336(a5)
ffffffffc0204f90:	cfd9                	beqz	a5,ffffffffc020502e <file_fstat+0xbc>
ffffffffc0204f92:	4b98                	lw	a4,16(a5)
ffffffffc0204f94:	08e05d63          	blez	a4,ffffffffc020502e <file_fstat+0xbc>
ffffffffc0204f98:	6780                	ld	s0,8(a5)
ffffffffc0204f9a:	00351793          	slli	a5,a0,0x3
ffffffffc0204f9e:	8f89                	sub	a5,a5,a0
ffffffffc0204fa0:	078e                	slli	a5,a5,0x3
ffffffffc0204fa2:	943e                	add	s0,s0,a5
ffffffffc0204fa4:	4018                	lw	a4,0(s0)
ffffffffc0204fa6:	4789                	li	a5,2
ffffffffc0204fa8:	04f71b63          	bne	a4,a5,ffffffffc0204ffe <file_fstat+0x8c>
ffffffffc0204fac:	4c1c                	lw	a5,24(s0)
ffffffffc0204fae:	04a79863          	bne	a5,a0,ffffffffc0204ffe <file_fstat+0x8c>
ffffffffc0204fb2:	581c                	lw	a5,48(s0)
ffffffffc0204fb4:	02843903          	ld	s2,40(s0)
ffffffffc0204fb8:	2785                	addiw	a5,a5,1
ffffffffc0204fba:	d81c                	sw	a5,48(s0)
ffffffffc0204fbc:	04090963          	beqz	s2,ffffffffc020500e <file_fstat+0x9c>
ffffffffc0204fc0:	07093783          	ld	a5,112(s2)
ffffffffc0204fc4:	c7a9                	beqz	a5,ffffffffc020500e <file_fstat+0x9c>
ffffffffc0204fc6:	779c                	ld	a5,40(a5)
ffffffffc0204fc8:	c3b9                	beqz	a5,ffffffffc020500e <file_fstat+0x9c>
ffffffffc0204fca:	84ae                	mv	s1,a1
ffffffffc0204fcc:	854a                	mv	a0,s2
ffffffffc0204fce:	00009597          	auipc	a1,0x9
ffffffffc0204fd2:	86a58593          	addi	a1,a1,-1942 # ffffffffc020d838 <default_pmm_manager+0xd40>
ffffffffc0204fd6:	761020ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0204fda:	07093783          	ld	a5,112(s2)
ffffffffc0204fde:	7408                	ld	a0,40(s0)
ffffffffc0204fe0:	85a6                	mv	a1,s1
ffffffffc0204fe2:	779c                	ld	a5,40(a5)
ffffffffc0204fe4:	9782                	jalr	a5
ffffffffc0204fe6:	87aa                	mv	a5,a0
ffffffffc0204fe8:	8522                	mv	a0,s0
ffffffffc0204fea:	843e                	mv	s0,a5
ffffffffc0204fec:	949ff0ef          	jal	ra,ffffffffc0204934 <fd_array_release>
ffffffffc0204ff0:	60e2                	ld	ra,24(sp)
ffffffffc0204ff2:	8522                	mv	a0,s0
ffffffffc0204ff4:	6442                	ld	s0,16(sp)
ffffffffc0204ff6:	64a2                	ld	s1,8(sp)
ffffffffc0204ff8:	6902                	ld	s2,0(sp)
ffffffffc0204ffa:	6105                	addi	sp,sp,32
ffffffffc0204ffc:	8082                	ret
ffffffffc0204ffe:	5475                	li	s0,-3
ffffffffc0205000:	60e2                	ld	ra,24(sp)
ffffffffc0205002:	8522                	mv	a0,s0
ffffffffc0205004:	6442                	ld	s0,16(sp)
ffffffffc0205006:	64a2                	ld	s1,8(sp)
ffffffffc0205008:	6902                	ld	s2,0(sp)
ffffffffc020500a:	6105                	addi	sp,sp,32
ffffffffc020500c:	8082                	ret
ffffffffc020500e:	00008697          	auipc	a3,0x8
ffffffffc0205012:	7da68693          	addi	a3,a3,2010 # ffffffffc020d7e8 <default_pmm_manager+0xcf0>
ffffffffc0205016:	00007617          	auipc	a2,0x7
ffffffffc020501a:	ffa60613          	addi	a2,a2,-6 # ffffffffc020c010 <commands+0x210>
ffffffffc020501e:	12c00593          	li	a1,300
ffffffffc0205022:	00008517          	auipc	a0,0x8
ffffffffc0205026:	68e50513          	addi	a0,a0,1678 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc020502a:	c74fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020502e:	fd4ff0ef          	jal	ra,ffffffffc0204802 <get_fd_array.part.0>

ffffffffc0205032 <file_fsync>:
ffffffffc0205032:	1101                	addi	sp,sp,-32
ffffffffc0205034:	ec06                	sd	ra,24(sp)
ffffffffc0205036:	e822                	sd	s0,16(sp)
ffffffffc0205038:	e426                	sd	s1,8(sp)
ffffffffc020503a:	04700793          	li	a5,71
ffffffffc020503e:	06a7e863          	bltu	a5,a0,ffffffffc02050ae <file_fsync+0x7c>
ffffffffc0205042:	00092797          	auipc	a5,0x92
ffffffffc0205046:	8ae7b783          	ld	a5,-1874(a5) # ffffffffc02968f0 <current>
ffffffffc020504a:	1507b783          	ld	a5,336(a5)
ffffffffc020504e:	c7d9                	beqz	a5,ffffffffc02050dc <file_fsync+0xaa>
ffffffffc0205050:	4b98                	lw	a4,16(a5)
ffffffffc0205052:	08e05563          	blez	a4,ffffffffc02050dc <file_fsync+0xaa>
ffffffffc0205056:	6780                	ld	s0,8(a5)
ffffffffc0205058:	00351793          	slli	a5,a0,0x3
ffffffffc020505c:	8f89                	sub	a5,a5,a0
ffffffffc020505e:	078e                	slli	a5,a5,0x3
ffffffffc0205060:	943e                	add	s0,s0,a5
ffffffffc0205062:	4018                	lw	a4,0(s0)
ffffffffc0205064:	4789                	li	a5,2
ffffffffc0205066:	04f71463          	bne	a4,a5,ffffffffc02050ae <file_fsync+0x7c>
ffffffffc020506a:	4c1c                	lw	a5,24(s0)
ffffffffc020506c:	04a79163          	bne	a5,a0,ffffffffc02050ae <file_fsync+0x7c>
ffffffffc0205070:	581c                	lw	a5,48(s0)
ffffffffc0205072:	7404                	ld	s1,40(s0)
ffffffffc0205074:	2785                	addiw	a5,a5,1
ffffffffc0205076:	d81c                	sw	a5,48(s0)
ffffffffc0205078:	c0b1                	beqz	s1,ffffffffc02050bc <file_fsync+0x8a>
ffffffffc020507a:	78bc                	ld	a5,112(s1)
ffffffffc020507c:	c3a1                	beqz	a5,ffffffffc02050bc <file_fsync+0x8a>
ffffffffc020507e:	7b9c                	ld	a5,48(a5)
ffffffffc0205080:	cf95                	beqz	a5,ffffffffc02050bc <file_fsync+0x8a>
ffffffffc0205082:	00009597          	auipc	a1,0x9
ffffffffc0205086:	91658593          	addi	a1,a1,-1770 # ffffffffc020d998 <default_pmm_manager+0xea0>
ffffffffc020508a:	8526                	mv	a0,s1
ffffffffc020508c:	6ab020ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0205090:	78bc                	ld	a5,112(s1)
ffffffffc0205092:	7408                	ld	a0,40(s0)
ffffffffc0205094:	7b9c                	ld	a5,48(a5)
ffffffffc0205096:	9782                	jalr	a5
ffffffffc0205098:	87aa                	mv	a5,a0
ffffffffc020509a:	8522                	mv	a0,s0
ffffffffc020509c:	843e                	mv	s0,a5
ffffffffc020509e:	897ff0ef          	jal	ra,ffffffffc0204934 <fd_array_release>
ffffffffc02050a2:	60e2                	ld	ra,24(sp)
ffffffffc02050a4:	8522                	mv	a0,s0
ffffffffc02050a6:	6442                	ld	s0,16(sp)
ffffffffc02050a8:	64a2                	ld	s1,8(sp)
ffffffffc02050aa:	6105                	addi	sp,sp,32
ffffffffc02050ac:	8082                	ret
ffffffffc02050ae:	5475                	li	s0,-3
ffffffffc02050b0:	60e2                	ld	ra,24(sp)
ffffffffc02050b2:	8522                	mv	a0,s0
ffffffffc02050b4:	6442                	ld	s0,16(sp)
ffffffffc02050b6:	64a2                	ld	s1,8(sp)
ffffffffc02050b8:	6105                	addi	sp,sp,32
ffffffffc02050ba:	8082                	ret
ffffffffc02050bc:	00009697          	auipc	a3,0x9
ffffffffc02050c0:	88c68693          	addi	a3,a3,-1908 # ffffffffc020d948 <default_pmm_manager+0xe50>
ffffffffc02050c4:	00007617          	auipc	a2,0x7
ffffffffc02050c8:	f4c60613          	addi	a2,a2,-180 # ffffffffc020c010 <commands+0x210>
ffffffffc02050cc:	13a00593          	li	a1,314
ffffffffc02050d0:	00008517          	auipc	a0,0x8
ffffffffc02050d4:	5e050513          	addi	a0,a0,1504 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc02050d8:	bc6fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02050dc:	f26ff0ef          	jal	ra,ffffffffc0204802 <get_fd_array.part.0>

ffffffffc02050e0 <file_getdirentry>:
ffffffffc02050e0:	715d                	addi	sp,sp,-80
ffffffffc02050e2:	e486                	sd	ra,72(sp)
ffffffffc02050e4:	e0a2                	sd	s0,64(sp)
ffffffffc02050e6:	fc26                	sd	s1,56(sp)
ffffffffc02050e8:	f84a                	sd	s2,48(sp)
ffffffffc02050ea:	f44e                	sd	s3,40(sp)
ffffffffc02050ec:	04700793          	li	a5,71
ffffffffc02050f0:	0aa7e063          	bltu	a5,a0,ffffffffc0205190 <file_getdirentry+0xb0>
ffffffffc02050f4:	00091797          	auipc	a5,0x91
ffffffffc02050f8:	7fc7b783          	ld	a5,2044(a5) # ffffffffc02968f0 <current>
ffffffffc02050fc:	1507b783          	ld	a5,336(a5)
ffffffffc0205100:	c3e9                	beqz	a5,ffffffffc02051c2 <file_getdirentry+0xe2>
ffffffffc0205102:	4b98                	lw	a4,16(a5)
ffffffffc0205104:	0ae05f63          	blez	a4,ffffffffc02051c2 <file_getdirentry+0xe2>
ffffffffc0205108:	6780                	ld	s0,8(a5)
ffffffffc020510a:	00351793          	slli	a5,a0,0x3
ffffffffc020510e:	8f89                	sub	a5,a5,a0
ffffffffc0205110:	078e                	slli	a5,a5,0x3
ffffffffc0205112:	943e                	add	s0,s0,a5
ffffffffc0205114:	4018                	lw	a4,0(s0)
ffffffffc0205116:	4789                	li	a5,2
ffffffffc0205118:	06f71c63          	bne	a4,a5,ffffffffc0205190 <file_getdirentry+0xb0>
ffffffffc020511c:	4c1c                	lw	a5,24(s0)
ffffffffc020511e:	06a79963          	bne	a5,a0,ffffffffc0205190 <file_getdirentry+0xb0>
ffffffffc0205122:	581c                	lw	a5,48(s0)
ffffffffc0205124:	6194                	ld	a3,0(a1)
ffffffffc0205126:	84ae                	mv	s1,a1
ffffffffc0205128:	2785                	addiw	a5,a5,1
ffffffffc020512a:	10000613          	li	a2,256
ffffffffc020512e:	d81c                	sw	a5,48(s0)
ffffffffc0205130:	05a1                	addi	a1,a1,8
ffffffffc0205132:	850a                	mv	a0,sp
ffffffffc0205134:	33e000ef          	jal	ra,ffffffffc0205472 <iobuf_init>
ffffffffc0205138:	02843983          	ld	s3,40(s0)
ffffffffc020513c:	892a                	mv	s2,a0
ffffffffc020513e:	06098263          	beqz	s3,ffffffffc02051a2 <file_getdirentry+0xc2>
ffffffffc0205142:	0709b783          	ld	a5,112(s3) # 1070 <_binary_bin_swap_img_size-0x6c90>
ffffffffc0205146:	cfb1                	beqz	a5,ffffffffc02051a2 <file_getdirentry+0xc2>
ffffffffc0205148:	63bc                	ld	a5,64(a5)
ffffffffc020514a:	cfa1                	beqz	a5,ffffffffc02051a2 <file_getdirentry+0xc2>
ffffffffc020514c:	854e                	mv	a0,s3
ffffffffc020514e:	00009597          	auipc	a1,0x9
ffffffffc0205152:	8aa58593          	addi	a1,a1,-1878 # ffffffffc020d9f8 <default_pmm_manager+0xf00>
ffffffffc0205156:	5e1020ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc020515a:	0709b783          	ld	a5,112(s3)
ffffffffc020515e:	7408                	ld	a0,40(s0)
ffffffffc0205160:	85ca                	mv	a1,s2
ffffffffc0205162:	63bc                	ld	a5,64(a5)
ffffffffc0205164:	9782                	jalr	a5
ffffffffc0205166:	89aa                	mv	s3,a0
ffffffffc0205168:	e909                	bnez	a0,ffffffffc020517a <file_getdirentry+0x9a>
ffffffffc020516a:	609c                	ld	a5,0(s1)
ffffffffc020516c:	01093683          	ld	a3,16(s2)
ffffffffc0205170:	01893703          	ld	a4,24(s2)
ffffffffc0205174:	97b6                	add	a5,a5,a3
ffffffffc0205176:	8f99                	sub	a5,a5,a4
ffffffffc0205178:	e09c                	sd	a5,0(s1)
ffffffffc020517a:	8522                	mv	a0,s0
ffffffffc020517c:	fb8ff0ef          	jal	ra,ffffffffc0204934 <fd_array_release>
ffffffffc0205180:	60a6                	ld	ra,72(sp)
ffffffffc0205182:	6406                	ld	s0,64(sp)
ffffffffc0205184:	74e2                	ld	s1,56(sp)
ffffffffc0205186:	7942                	ld	s2,48(sp)
ffffffffc0205188:	854e                	mv	a0,s3
ffffffffc020518a:	79a2                	ld	s3,40(sp)
ffffffffc020518c:	6161                	addi	sp,sp,80
ffffffffc020518e:	8082                	ret
ffffffffc0205190:	60a6                	ld	ra,72(sp)
ffffffffc0205192:	6406                	ld	s0,64(sp)
ffffffffc0205194:	59f5                	li	s3,-3
ffffffffc0205196:	74e2                	ld	s1,56(sp)
ffffffffc0205198:	7942                	ld	s2,48(sp)
ffffffffc020519a:	854e                	mv	a0,s3
ffffffffc020519c:	79a2                	ld	s3,40(sp)
ffffffffc020519e:	6161                	addi	sp,sp,80
ffffffffc02051a0:	8082                	ret
ffffffffc02051a2:	00008697          	auipc	a3,0x8
ffffffffc02051a6:	7fe68693          	addi	a3,a3,2046 # ffffffffc020d9a0 <default_pmm_manager+0xea8>
ffffffffc02051aa:	00007617          	auipc	a2,0x7
ffffffffc02051ae:	e6660613          	addi	a2,a2,-410 # ffffffffc020c010 <commands+0x210>
ffffffffc02051b2:	14a00593          	li	a1,330
ffffffffc02051b6:	00008517          	auipc	a0,0x8
ffffffffc02051ba:	4fa50513          	addi	a0,a0,1274 # ffffffffc020d6b0 <default_pmm_manager+0xbb8>
ffffffffc02051be:	ae0fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02051c2:	e40ff0ef          	jal	ra,ffffffffc0204802 <get_fd_array.part.0>

ffffffffc02051c6 <file_dup>:
ffffffffc02051c6:	04700713          	li	a4,71
ffffffffc02051ca:	06a76463          	bltu	a4,a0,ffffffffc0205232 <file_dup+0x6c>
ffffffffc02051ce:	00091717          	auipc	a4,0x91
ffffffffc02051d2:	72273703          	ld	a4,1826(a4) # ffffffffc02968f0 <current>
ffffffffc02051d6:	15073703          	ld	a4,336(a4)
ffffffffc02051da:	1101                	addi	sp,sp,-32
ffffffffc02051dc:	ec06                	sd	ra,24(sp)
ffffffffc02051de:	e822                	sd	s0,16(sp)
ffffffffc02051e0:	cb39                	beqz	a4,ffffffffc0205236 <file_dup+0x70>
ffffffffc02051e2:	4b14                	lw	a3,16(a4)
ffffffffc02051e4:	04d05963          	blez	a3,ffffffffc0205236 <file_dup+0x70>
ffffffffc02051e8:	6700                	ld	s0,8(a4)
ffffffffc02051ea:	00351713          	slli	a4,a0,0x3
ffffffffc02051ee:	8f09                	sub	a4,a4,a0
ffffffffc02051f0:	070e                	slli	a4,a4,0x3
ffffffffc02051f2:	943a                	add	s0,s0,a4
ffffffffc02051f4:	4014                	lw	a3,0(s0)
ffffffffc02051f6:	4709                	li	a4,2
ffffffffc02051f8:	02e69863          	bne	a3,a4,ffffffffc0205228 <file_dup+0x62>
ffffffffc02051fc:	4c18                	lw	a4,24(s0)
ffffffffc02051fe:	02a71563          	bne	a4,a0,ffffffffc0205228 <file_dup+0x62>
ffffffffc0205202:	852e                	mv	a0,a1
ffffffffc0205204:	002c                	addi	a1,sp,8
ffffffffc0205206:	e1eff0ef          	jal	ra,ffffffffc0204824 <fd_array_alloc>
ffffffffc020520a:	c509                	beqz	a0,ffffffffc0205214 <file_dup+0x4e>
ffffffffc020520c:	60e2                	ld	ra,24(sp)
ffffffffc020520e:	6442                	ld	s0,16(sp)
ffffffffc0205210:	6105                	addi	sp,sp,32
ffffffffc0205212:	8082                	ret
ffffffffc0205214:	6522                	ld	a0,8(sp)
ffffffffc0205216:	85a2                	mv	a1,s0
ffffffffc0205218:	845ff0ef          	jal	ra,ffffffffc0204a5c <fd_array_dup>
ffffffffc020521c:	67a2                	ld	a5,8(sp)
ffffffffc020521e:	60e2                	ld	ra,24(sp)
ffffffffc0205220:	6442                	ld	s0,16(sp)
ffffffffc0205222:	4f88                	lw	a0,24(a5)
ffffffffc0205224:	6105                	addi	sp,sp,32
ffffffffc0205226:	8082                	ret
ffffffffc0205228:	60e2                	ld	ra,24(sp)
ffffffffc020522a:	6442                	ld	s0,16(sp)
ffffffffc020522c:	5575                	li	a0,-3
ffffffffc020522e:	6105                	addi	sp,sp,32
ffffffffc0205230:	8082                	ret
ffffffffc0205232:	5575                	li	a0,-3
ffffffffc0205234:	8082                	ret
ffffffffc0205236:	dccff0ef          	jal	ra,ffffffffc0204802 <get_fd_array.part.0>

ffffffffc020523a <fs_init>:
ffffffffc020523a:	1141                	addi	sp,sp,-16
ffffffffc020523c:	e406                	sd	ra,8(sp)
ffffffffc020523e:	717020ef          	jal	ra,ffffffffc0208154 <vfs_init>
ffffffffc0205242:	3ef030ef          	jal	ra,ffffffffc0208e30 <dev_init>
ffffffffc0205246:	60a2                	ld	ra,8(sp)
ffffffffc0205248:	0141                	addi	sp,sp,16
ffffffffc020524a:	53e0406f          	j	ffffffffc0209788 <sfs_init>

ffffffffc020524e <fs_cleanup>:
ffffffffc020524e:	1580306f          	j	ffffffffc02083a6 <vfs_cleanup>

ffffffffc0205252 <lock_files>:
ffffffffc0205252:	0561                	addi	a0,a0,24
ffffffffc0205254:	ba0ff06f          	j	ffffffffc02045f4 <down>

ffffffffc0205258 <unlock_files>:
ffffffffc0205258:	0561                	addi	a0,a0,24
ffffffffc020525a:	b96ff06f          	j	ffffffffc02045f0 <up>

ffffffffc020525e <files_create>:
ffffffffc020525e:	1141                	addi	sp,sp,-16
ffffffffc0205260:	6505                	lui	a0,0x1
ffffffffc0205262:	e022                	sd	s0,0(sp)
ffffffffc0205264:	e406                	sd	ra,8(sp)
ffffffffc0205266:	db5fc0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc020526a:	842a                	mv	s0,a0
ffffffffc020526c:	cd19                	beqz	a0,ffffffffc020528a <files_create+0x2c>
ffffffffc020526e:	03050793          	addi	a5,a0,48 # 1030 <_binary_bin_swap_img_size-0x6cd0>
ffffffffc0205272:	00043023          	sd	zero,0(s0)
ffffffffc0205276:	0561                	addi	a0,a0,24
ffffffffc0205278:	e41c                	sd	a5,8(s0)
ffffffffc020527a:	00042823          	sw	zero,16(s0)
ffffffffc020527e:	4585                	li	a1,1
ffffffffc0205280:	b6aff0ef          	jal	ra,ffffffffc02045ea <sem_init>
ffffffffc0205284:	6408                	ld	a0,8(s0)
ffffffffc0205286:	f3cff0ef          	jal	ra,ffffffffc02049c2 <fd_array_init>
ffffffffc020528a:	60a2                	ld	ra,8(sp)
ffffffffc020528c:	8522                	mv	a0,s0
ffffffffc020528e:	6402                	ld	s0,0(sp)
ffffffffc0205290:	0141                	addi	sp,sp,16
ffffffffc0205292:	8082                	ret

ffffffffc0205294 <files_destroy>:
ffffffffc0205294:	7179                	addi	sp,sp,-48
ffffffffc0205296:	f406                	sd	ra,40(sp)
ffffffffc0205298:	f022                	sd	s0,32(sp)
ffffffffc020529a:	ec26                	sd	s1,24(sp)
ffffffffc020529c:	e84a                	sd	s2,16(sp)
ffffffffc020529e:	e44e                	sd	s3,8(sp)
ffffffffc02052a0:	c52d                	beqz	a0,ffffffffc020530a <files_destroy+0x76>
ffffffffc02052a2:	491c                	lw	a5,16(a0)
ffffffffc02052a4:	89aa                	mv	s3,a0
ffffffffc02052a6:	e3b5                	bnez	a5,ffffffffc020530a <files_destroy+0x76>
ffffffffc02052a8:	6108                	ld	a0,0(a0)
ffffffffc02052aa:	c119                	beqz	a0,ffffffffc02052b0 <files_destroy+0x1c>
ffffffffc02052ac:	541020ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc02052b0:	0089b403          	ld	s0,8(s3)
ffffffffc02052b4:	6485                	lui	s1,0x1
ffffffffc02052b6:	fc048493          	addi	s1,s1,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02052ba:	94a2                	add	s1,s1,s0
ffffffffc02052bc:	4909                	li	s2,2
ffffffffc02052be:	401c                	lw	a5,0(s0)
ffffffffc02052c0:	03278063          	beq	a5,s2,ffffffffc02052e0 <files_destroy+0x4c>
ffffffffc02052c4:	e39d                	bnez	a5,ffffffffc02052ea <files_destroy+0x56>
ffffffffc02052c6:	03840413          	addi	s0,s0,56
ffffffffc02052ca:	fe849ae3          	bne	s1,s0,ffffffffc02052be <files_destroy+0x2a>
ffffffffc02052ce:	7402                	ld	s0,32(sp)
ffffffffc02052d0:	70a2                	ld	ra,40(sp)
ffffffffc02052d2:	64e2                	ld	s1,24(sp)
ffffffffc02052d4:	6942                	ld	s2,16(sp)
ffffffffc02052d6:	854e                	mv	a0,s3
ffffffffc02052d8:	69a2                	ld	s3,8(sp)
ffffffffc02052da:	6145                	addi	sp,sp,48
ffffffffc02052dc:	deffc06f          	j	ffffffffc02020ca <kfree>
ffffffffc02052e0:	8522                	mv	a0,s0
ffffffffc02052e2:	efcff0ef          	jal	ra,ffffffffc02049de <fd_array_close>
ffffffffc02052e6:	401c                	lw	a5,0(s0)
ffffffffc02052e8:	bff1                	j	ffffffffc02052c4 <files_destroy+0x30>
ffffffffc02052ea:	00008697          	auipc	a3,0x8
ffffffffc02052ee:	78e68693          	addi	a3,a3,1934 # ffffffffc020da78 <CSWTCH.79+0x58>
ffffffffc02052f2:	00007617          	auipc	a2,0x7
ffffffffc02052f6:	d1e60613          	addi	a2,a2,-738 # ffffffffc020c010 <commands+0x210>
ffffffffc02052fa:	03d00593          	li	a1,61
ffffffffc02052fe:	00008517          	auipc	a0,0x8
ffffffffc0205302:	76a50513          	addi	a0,a0,1898 # ffffffffc020da68 <CSWTCH.79+0x48>
ffffffffc0205306:	998fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020530a:	00008697          	auipc	a3,0x8
ffffffffc020530e:	72e68693          	addi	a3,a3,1838 # ffffffffc020da38 <CSWTCH.79+0x18>
ffffffffc0205312:	00007617          	auipc	a2,0x7
ffffffffc0205316:	cfe60613          	addi	a2,a2,-770 # ffffffffc020c010 <commands+0x210>
ffffffffc020531a:	03300593          	li	a1,51
ffffffffc020531e:	00008517          	auipc	a0,0x8
ffffffffc0205322:	74a50513          	addi	a0,a0,1866 # ffffffffc020da68 <CSWTCH.79+0x48>
ffffffffc0205326:	978fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020532a <files_closeall>:
ffffffffc020532a:	1101                	addi	sp,sp,-32
ffffffffc020532c:	ec06                	sd	ra,24(sp)
ffffffffc020532e:	e822                	sd	s0,16(sp)
ffffffffc0205330:	e426                	sd	s1,8(sp)
ffffffffc0205332:	e04a                	sd	s2,0(sp)
ffffffffc0205334:	c129                	beqz	a0,ffffffffc0205376 <files_closeall+0x4c>
ffffffffc0205336:	491c                	lw	a5,16(a0)
ffffffffc0205338:	02f05f63          	blez	a5,ffffffffc0205376 <files_closeall+0x4c>
ffffffffc020533c:	6504                	ld	s1,8(a0)
ffffffffc020533e:	6785                	lui	a5,0x1
ffffffffc0205340:	fc078793          	addi	a5,a5,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205344:	07048413          	addi	s0,s1,112
ffffffffc0205348:	4909                	li	s2,2
ffffffffc020534a:	94be                	add	s1,s1,a5
ffffffffc020534c:	a029                	j	ffffffffc0205356 <files_closeall+0x2c>
ffffffffc020534e:	03840413          	addi	s0,s0,56
ffffffffc0205352:	00848c63          	beq	s1,s0,ffffffffc020536a <files_closeall+0x40>
ffffffffc0205356:	401c                	lw	a5,0(s0)
ffffffffc0205358:	ff279be3          	bne	a5,s2,ffffffffc020534e <files_closeall+0x24>
ffffffffc020535c:	8522                	mv	a0,s0
ffffffffc020535e:	03840413          	addi	s0,s0,56
ffffffffc0205362:	e7cff0ef          	jal	ra,ffffffffc02049de <fd_array_close>
ffffffffc0205366:	fe8498e3          	bne	s1,s0,ffffffffc0205356 <files_closeall+0x2c>
ffffffffc020536a:	60e2                	ld	ra,24(sp)
ffffffffc020536c:	6442                	ld	s0,16(sp)
ffffffffc020536e:	64a2                	ld	s1,8(sp)
ffffffffc0205370:	6902                	ld	s2,0(sp)
ffffffffc0205372:	6105                	addi	sp,sp,32
ffffffffc0205374:	8082                	ret
ffffffffc0205376:	00008697          	auipc	a3,0x8
ffffffffc020537a:	30a68693          	addi	a3,a3,778 # ffffffffc020d680 <default_pmm_manager+0xb88>
ffffffffc020537e:	00007617          	auipc	a2,0x7
ffffffffc0205382:	c9260613          	addi	a2,a2,-878 # ffffffffc020c010 <commands+0x210>
ffffffffc0205386:	04500593          	li	a1,69
ffffffffc020538a:	00008517          	auipc	a0,0x8
ffffffffc020538e:	6de50513          	addi	a0,a0,1758 # ffffffffc020da68 <CSWTCH.79+0x48>
ffffffffc0205392:	90cfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205396 <dup_files>:
ffffffffc0205396:	7179                	addi	sp,sp,-48
ffffffffc0205398:	f406                	sd	ra,40(sp)
ffffffffc020539a:	f022                	sd	s0,32(sp)
ffffffffc020539c:	ec26                	sd	s1,24(sp)
ffffffffc020539e:	e84a                	sd	s2,16(sp)
ffffffffc02053a0:	e44e                	sd	s3,8(sp)
ffffffffc02053a2:	e052                	sd	s4,0(sp)
ffffffffc02053a4:	c52d                	beqz	a0,ffffffffc020540e <dup_files+0x78>
ffffffffc02053a6:	842e                	mv	s0,a1
ffffffffc02053a8:	c1bd                	beqz	a1,ffffffffc020540e <dup_files+0x78>
ffffffffc02053aa:	491c                	lw	a5,16(a0)
ffffffffc02053ac:	84aa                	mv	s1,a0
ffffffffc02053ae:	e3c1                	bnez	a5,ffffffffc020542e <dup_files+0x98>
ffffffffc02053b0:	499c                	lw	a5,16(a1)
ffffffffc02053b2:	06f05e63          	blez	a5,ffffffffc020542e <dup_files+0x98>
ffffffffc02053b6:	6188                	ld	a0,0(a1)
ffffffffc02053b8:	e088                	sd	a0,0(s1)
ffffffffc02053ba:	c119                	beqz	a0,ffffffffc02053c0 <dup_files+0x2a>
ffffffffc02053bc:	363020ef          	jal	ra,ffffffffc0207f1e <inode_ref_inc>
ffffffffc02053c0:	6400                	ld	s0,8(s0)
ffffffffc02053c2:	6905                	lui	s2,0x1
ffffffffc02053c4:	fc090913          	addi	s2,s2,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02053c8:	6484                	ld	s1,8(s1)
ffffffffc02053ca:	9922                	add	s2,s2,s0
ffffffffc02053cc:	4989                	li	s3,2
ffffffffc02053ce:	4a05                	li	s4,1
ffffffffc02053d0:	a039                	j	ffffffffc02053de <dup_files+0x48>
ffffffffc02053d2:	03840413          	addi	s0,s0,56
ffffffffc02053d6:	03848493          	addi	s1,s1,56
ffffffffc02053da:	02890163          	beq	s2,s0,ffffffffc02053fc <dup_files+0x66>
ffffffffc02053de:	401c                	lw	a5,0(s0)
ffffffffc02053e0:	ff3799e3          	bne	a5,s3,ffffffffc02053d2 <dup_files+0x3c>
ffffffffc02053e4:	0144a023          	sw	s4,0(s1)
ffffffffc02053e8:	85a2                	mv	a1,s0
ffffffffc02053ea:	8526                	mv	a0,s1
ffffffffc02053ec:	03840413          	addi	s0,s0,56
ffffffffc02053f0:	e6cff0ef          	jal	ra,ffffffffc0204a5c <fd_array_dup>
ffffffffc02053f4:	03848493          	addi	s1,s1,56
ffffffffc02053f8:	fe8913e3          	bne	s2,s0,ffffffffc02053de <dup_files+0x48>
ffffffffc02053fc:	70a2                	ld	ra,40(sp)
ffffffffc02053fe:	7402                	ld	s0,32(sp)
ffffffffc0205400:	64e2                	ld	s1,24(sp)
ffffffffc0205402:	6942                	ld	s2,16(sp)
ffffffffc0205404:	69a2                	ld	s3,8(sp)
ffffffffc0205406:	6a02                	ld	s4,0(sp)
ffffffffc0205408:	4501                	li	a0,0
ffffffffc020540a:	6145                	addi	sp,sp,48
ffffffffc020540c:	8082                	ret
ffffffffc020540e:	00008697          	auipc	a3,0x8
ffffffffc0205412:	fc268693          	addi	a3,a3,-62 # ffffffffc020d3d0 <default_pmm_manager+0x8d8>
ffffffffc0205416:	00007617          	auipc	a2,0x7
ffffffffc020541a:	bfa60613          	addi	a2,a2,-1030 # ffffffffc020c010 <commands+0x210>
ffffffffc020541e:	05300593          	li	a1,83
ffffffffc0205422:	00008517          	auipc	a0,0x8
ffffffffc0205426:	64650513          	addi	a0,a0,1606 # ffffffffc020da68 <CSWTCH.79+0x48>
ffffffffc020542a:	874fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020542e:	00008697          	auipc	a3,0x8
ffffffffc0205432:	66268693          	addi	a3,a3,1634 # ffffffffc020da90 <CSWTCH.79+0x70>
ffffffffc0205436:	00007617          	auipc	a2,0x7
ffffffffc020543a:	bda60613          	addi	a2,a2,-1062 # ffffffffc020c010 <commands+0x210>
ffffffffc020543e:	05400593          	li	a1,84
ffffffffc0205442:	00008517          	auipc	a0,0x8
ffffffffc0205446:	62650513          	addi	a0,a0,1574 # ffffffffc020da68 <CSWTCH.79+0x48>
ffffffffc020544a:	854fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020544e <iobuf_skip.part.0>:
ffffffffc020544e:	1141                	addi	sp,sp,-16
ffffffffc0205450:	00008697          	auipc	a3,0x8
ffffffffc0205454:	67068693          	addi	a3,a3,1648 # ffffffffc020dac0 <CSWTCH.79+0xa0>
ffffffffc0205458:	00007617          	auipc	a2,0x7
ffffffffc020545c:	bb860613          	addi	a2,a2,-1096 # ffffffffc020c010 <commands+0x210>
ffffffffc0205460:	04a00593          	li	a1,74
ffffffffc0205464:	00008517          	auipc	a0,0x8
ffffffffc0205468:	67450513          	addi	a0,a0,1652 # ffffffffc020dad8 <CSWTCH.79+0xb8>
ffffffffc020546c:	e406                	sd	ra,8(sp)
ffffffffc020546e:	830fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205472 <iobuf_init>:
ffffffffc0205472:	e10c                	sd	a1,0(a0)
ffffffffc0205474:	e514                	sd	a3,8(a0)
ffffffffc0205476:	ed10                	sd	a2,24(a0)
ffffffffc0205478:	e910                	sd	a2,16(a0)
ffffffffc020547a:	8082                	ret

ffffffffc020547c <iobuf_move>:
ffffffffc020547c:	7179                	addi	sp,sp,-48
ffffffffc020547e:	ec26                	sd	s1,24(sp)
ffffffffc0205480:	6d04                	ld	s1,24(a0)
ffffffffc0205482:	f022                	sd	s0,32(sp)
ffffffffc0205484:	e84a                	sd	s2,16(sp)
ffffffffc0205486:	e44e                	sd	s3,8(sp)
ffffffffc0205488:	f406                	sd	ra,40(sp)
ffffffffc020548a:	842a                	mv	s0,a0
ffffffffc020548c:	8932                	mv	s2,a2
ffffffffc020548e:	852e                	mv	a0,a1
ffffffffc0205490:	89ba                	mv	s3,a4
ffffffffc0205492:	00967363          	bgeu	a2,s1,ffffffffc0205498 <iobuf_move+0x1c>
ffffffffc0205496:	84b2                	mv	s1,a2
ffffffffc0205498:	c495                	beqz	s1,ffffffffc02054c4 <iobuf_move+0x48>
ffffffffc020549a:	600c                	ld	a1,0(s0)
ffffffffc020549c:	c681                	beqz	a3,ffffffffc02054a4 <iobuf_move+0x28>
ffffffffc020549e:	87ae                	mv	a5,a1
ffffffffc02054a0:	85aa                	mv	a1,a0
ffffffffc02054a2:	853e                	mv	a0,a5
ffffffffc02054a4:	8626                	mv	a2,s1
ffffffffc02054a6:	696060ef          	jal	ra,ffffffffc020bb3c <memmove>
ffffffffc02054aa:	6c1c                	ld	a5,24(s0)
ffffffffc02054ac:	0297ea63          	bltu	a5,s1,ffffffffc02054e0 <iobuf_move+0x64>
ffffffffc02054b0:	6014                	ld	a3,0(s0)
ffffffffc02054b2:	6418                	ld	a4,8(s0)
ffffffffc02054b4:	8f85                	sub	a5,a5,s1
ffffffffc02054b6:	96a6                	add	a3,a3,s1
ffffffffc02054b8:	9726                	add	a4,a4,s1
ffffffffc02054ba:	e014                	sd	a3,0(s0)
ffffffffc02054bc:	e418                	sd	a4,8(s0)
ffffffffc02054be:	ec1c                	sd	a5,24(s0)
ffffffffc02054c0:	40990933          	sub	s2,s2,s1
ffffffffc02054c4:	00098463          	beqz	s3,ffffffffc02054cc <iobuf_move+0x50>
ffffffffc02054c8:	0099b023          	sd	s1,0(s3)
ffffffffc02054cc:	4501                	li	a0,0
ffffffffc02054ce:	00091b63          	bnez	s2,ffffffffc02054e4 <iobuf_move+0x68>
ffffffffc02054d2:	70a2                	ld	ra,40(sp)
ffffffffc02054d4:	7402                	ld	s0,32(sp)
ffffffffc02054d6:	64e2                	ld	s1,24(sp)
ffffffffc02054d8:	6942                	ld	s2,16(sp)
ffffffffc02054da:	69a2                	ld	s3,8(sp)
ffffffffc02054dc:	6145                	addi	sp,sp,48
ffffffffc02054de:	8082                	ret
ffffffffc02054e0:	f6fff0ef          	jal	ra,ffffffffc020544e <iobuf_skip.part.0>
ffffffffc02054e4:	5571                	li	a0,-4
ffffffffc02054e6:	b7f5                	j	ffffffffc02054d2 <iobuf_move+0x56>

ffffffffc02054e8 <iobuf_skip>:
ffffffffc02054e8:	6d1c                	ld	a5,24(a0)
ffffffffc02054ea:	00b7eb63          	bltu	a5,a1,ffffffffc0205500 <iobuf_skip+0x18>
ffffffffc02054ee:	6114                	ld	a3,0(a0)
ffffffffc02054f0:	6518                	ld	a4,8(a0)
ffffffffc02054f2:	8f8d                	sub	a5,a5,a1
ffffffffc02054f4:	96ae                	add	a3,a3,a1
ffffffffc02054f6:	95ba                	add	a1,a1,a4
ffffffffc02054f8:	e114                	sd	a3,0(a0)
ffffffffc02054fa:	e50c                	sd	a1,8(a0)
ffffffffc02054fc:	ed1c                	sd	a5,24(a0)
ffffffffc02054fe:	8082                	ret
ffffffffc0205500:	1141                	addi	sp,sp,-16
ffffffffc0205502:	e406                	sd	ra,8(sp)
ffffffffc0205504:	f4bff0ef          	jal	ra,ffffffffc020544e <iobuf_skip.part.0>

ffffffffc0205508 <copy_path>:
ffffffffc0205508:	7139                	addi	sp,sp,-64
ffffffffc020550a:	f04a                	sd	s2,32(sp)
ffffffffc020550c:	00091917          	auipc	s2,0x91
ffffffffc0205510:	3e490913          	addi	s2,s2,996 # ffffffffc02968f0 <current>
ffffffffc0205514:	00093703          	ld	a4,0(s2)
ffffffffc0205518:	ec4e                	sd	s3,24(sp)
ffffffffc020551a:	89aa                	mv	s3,a0
ffffffffc020551c:	6505                	lui	a0,0x1
ffffffffc020551e:	f426                	sd	s1,40(sp)
ffffffffc0205520:	e852                	sd	s4,16(sp)
ffffffffc0205522:	fc06                	sd	ra,56(sp)
ffffffffc0205524:	f822                	sd	s0,48(sp)
ffffffffc0205526:	e456                	sd	s5,8(sp)
ffffffffc0205528:	02873a03          	ld	s4,40(a4)
ffffffffc020552c:	84ae                	mv	s1,a1
ffffffffc020552e:	aedfc0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0205532:	c141                	beqz	a0,ffffffffc02055b2 <copy_path+0xaa>
ffffffffc0205534:	842a                	mv	s0,a0
ffffffffc0205536:	040a0563          	beqz	s4,ffffffffc0205580 <copy_path+0x78>
ffffffffc020553a:	038a0a93          	addi	s5,s4,56
ffffffffc020553e:	8556                	mv	a0,s5
ffffffffc0205540:	8b4ff0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc0205544:	00093783          	ld	a5,0(s2)
ffffffffc0205548:	cba1                	beqz	a5,ffffffffc0205598 <copy_path+0x90>
ffffffffc020554a:	43dc                	lw	a5,4(a5)
ffffffffc020554c:	6685                	lui	a3,0x1
ffffffffc020554e:	8626                	mv	a2,s1
ffffffffc0205550:	04fa2823          	sw	a5,80(s4)
ffffffffc0205554:	85a2                	mv	a1,s0
ffffffffc0205556:	8552                	mv	a0,s4
ffffffffc0205558:	ec5fe0ef          	jal	ra,ffffffffc020441c <copy_string>
ffffffffc020555c:	c529                	beqz	a0,ffffffffc02055a6 <copy_path+0x9e>
ffffffffc020555e:	8556                	mv	a0,s5
ffffffffc0205560:	890ff0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0205564:	040a2823          	sw	zero,80(s4)
ffffffffc0205568:	0089b023          	sd	s0,0(s3)
ffffffffc020556c:	4501                	li	a0,0
ffffffffc020556e:	70e2                	ld	ra,56(sp)
ffffffffc0205570:	7442                	ld	s0,48(sp)
ffffffffc0205572:	74a2                	ld	s1,40(sp)
ffffffffc0205574:	7902                	ld	s2,32(sp)
ffffffffc0205576:	69e2                	ld	s3,24(sp)
ffffffffc0205578:	6a42                	ld	s4,16(sp)
ffffffffc020557a:	6aa2                	ld	s5,8(sp)
ffffffffc020557c:	6121                	addi	sp,sp,64
ffffffffc020557e:	8082                	ret
ffffffffc0205580:	85aa                	mv	a1,a0
ffffffffc0205582:	6685                	lui	a3,0x1
ffffffffc0205584:	8626                	mv	a2,s1
ffffffffc0205586:	4501                	li	a0,0
ffffffffc0205588:	e95fe0ef          	jal	ra,ffffffffc020441c <copy_string>
ffffffffc020558c:	fd71                	bnez	a0,ffffffffc0205568 <copy_path+0x60>
ffffffffc020558e:	8522                	mv	a0,s0
ffffffffc0205590:	b3bfc0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc0205594:	5575                	li	a0,-3
ffffffffc0205596:	bfe1                	j	ffffffffc020556e <copy_path+0x66>
ffffffffc0205598:	6685                	lui	a3,0x1
ffffffffc020559a:	8626                	mv	a2,s1
ffffffffc020559c:	85a2                	mv	a1,s0
ffffffffc020559e:	8552                	mv	a0,s4
ffffffffc02055a0:	e7dfe0ef          	jal	ra,ffffffffc020441c <copy_string>
ffffffffc02055a4:	fd4d                	bnez	a0,ffffffffc020555e <copy_path+0x56>
ffffffffc02055a6:	8556                	mv	a0,s5
ffffffffc02055a8:	848ff0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc02055ac:	040a2823          	sw	zero,80(s4)
ffffffffc02055b0:	bff9                	j	ffffffffc020558e <copy_path+0x86>
ffffffffc02055b2:	5571                	li	a0,-4
ffffffffc02055b4:	bf6d                	j	ffffffffc020556e <copy_path+0x66>

ffffffffc02055b6 <sysfile_open>:
ffffffffc02055b6:	7179                	addi	sp,sp,-48
ffffffffc02055b8:	872a                	mv	a4,a0
ffffffffc02055ba:	ec26                	sd	s1,24(sp)
ffffffffc02055bc:	0028                	addi	a0,sp,8
ffffffffc02055be:	84ae                	mv	s1,a1
ffffffffc02055c0:	85ba                	mv	a1,a4
ffffffffc02055c2:	f022                	sd	s0,32(sp)
ffffffffc02055c4:	f406                	sd	ra,40(sp)
ffffffffc02055c6:	f43ff0ef          	jal	ra,ffffffffc0205508 <copy_path>
ffffffffc02055ca:	842a                	mv	s0,a0
ffffffffc02055cc:	e909                	bnez	a0,ffffffffc02055de <sysfile_open+0x28>
ffffffffc02055ce:	6522                	ld	a0,8(sp)
ffffffffc02055d0:	85a6                	mv	a1,s1
ffffffffc02055d2:	d60ff0ef          	jal	ra,ffffffffc0204b32 <file_open>
ffffffffc02055d6:	842a                	mv	s0,a0
ffffffffc02055d8:	6522                	ld	a0,8(sp)
ffffffffc02055da:	af1fc0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02055de:	70a2                	ld	ra,40(sp)
ffffffffc02055e0:	8522                	mv	a0,s0
ffffffffc02055e2:	7402                	ld	s0,32(sp)
ffffffffc02055e4:	64e2                	ld	s1,24(sp)
ffffffffc02055e6:	6145                	addi	sp,sp,48
ffffffffc02055e8:	8082                	ret

ffffffffc02055ea <sysfile_close>:
ffffffffc02055ea:	e46ff06f          	j	ffffffffc0204c30 <file_close>

ffffffffc02055ee <sysfile_read>:
ffffffffc02055ee:	7159                	addi	sp,sp,-112
ffffffffc02055f0:	f0a2                	sd	s0,96(sp)
ffffffffc02055f2:	f486                	sd	ra,104(sp)
ffffffffc02055f4:	eca6                	sd	s1,88(sp)
ffffffffc02055f6:	e8ca                	sd	s2,80(sp)
ffffffffc02055f8:	e4ce                	sd	s3,72(sp)
ffffffffc02055fa:	e0d2                	sd	s4,64(sp)
ffffffffc02055fc:	fc56                	sd	s5,56(sp)
ffffffffc02055fe:	f85a                	sd	s6,48(sp)
ffffffffc0205600:	f45e                	sd	s7,40(sp)
ffffffffc0205602:	f062                	sd	s8,32(sp)
ffffffffc0205604:	ec66                	sd	s9,24(sp)
ffffffffc0205606:	4401                	li	s0,0
ffffffffc0205608:	ee19                	bnez	a2,ffffffffc0205626 <sysfile_read+0x38>
ffffffffc020560a:	70a6                	ld	ra,104(sp)
ffffffffc020560c:	8522                	mv	a0,s0
ffffffffc020560e:	7406                	ld	s0,96(sp)
ffffffffc0205610:	64e6                	ld	s1,88(sp)
ffffffffc0205612:	6946                	ld	s2,80(sp)
ffffffffc0205614:	69a6                	ld	s3,72(sp)
ffffffffc0205616:	6a06                	ld	s4,64(sp)
ffffffffc0205618:	7ae2                	ld	s5,56(sp)
ffffffffc020561a:	7b42                	ld	s6,48(sp)
ffffffffc020561c:	7ba2                	ld	s7,40(sp)
ffffffffc020561e:	7c02                	ld	s8,32(sp)
ffffffffc0205620:	6ce2                	ld	s9,24(sp)
ffffffffc0205622:	6165                	addi	sp,sp,112
ffffffffc0205624:	8082                	ret
ffffffffc0205626:	00091c97          	auipc	s9,0x91
ffffffffc020562a:	2cac8c93          	addi	s9,s9,714 # ffffffffc02968f0 <current>
ffffffffc020562e:	000cb783          	ld	a5,0(s9)
ffffffffc0205632:	84b2                	mv	s1,a2
ffffffffc0205634:	8b2e                	mv	s6,a1
ffffffffc0205636:	4601                	li	a2,0
ffffffffc0205638:	4585                	li	a1,1
ffffffffc020563a:	0287b903          	ld	s2,40(a5)
ffffffffc020563e:	8aaa                	mv	s5,a0
ffffffffc0205640:	c9eff0ef          	jal	ra,ffffffffc0204ade <file_testfd>
ffffffffc0205644:	c959                	beqz	a0,ffffffffc02056da <sysfile_read+0xec>
ffffffffc0205646:	6505                	lui	a0,0x1
ffffffffc0205648:	9d3fc0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc020564c:	89aa                	mv	s3,a0
ffffffffc020564e:	c941                	beqz	a0,ffffffffc02056de <sysfile_read+0xf0>
ffffffffc0205650:	4b81                	li	s7,0
ffffffffc0205652:	6a05                	lui	s4,0x1
ffffffffc0205654:	03890c13          	addi	s8,s2,56
ffffffffc0205658:	0744ec63          	bltu	s1,s4,ffffffffc02056d0 <sysfile_read+0xe2>
ffffffffc020565c:	e452                	sd	s4,8(sp)
ffffffffc020565e:	6605                	lui	a2,0x1
ffffffffc0205660:	0034                	addi	a3,sp,8
ffffffffc0205662:	85ce                	mv	a1,s3
ffffffffc0205664:	8556                	mv	a0,s5
ffffffffc0205666:	e20ff0ef          	jal	ra,ffffffffc0204c86 <file_read>
ffffffffc020566a:	66a2                	ld	a3,8(sp)
ffffffffc020566c:	842a                	mv	s0,a0
ffffffffc020566e:	ca9d                	beqz	a3,ffffffffc02056a4 <sysfile_read+0xb6>
ffffffffc0205670:	00090c63          	beqz	s2,ffffffffc0205688 <sysfile_read+0x9a>
ffffffffc0205674:	8562                	mv	a0,s8
ffffffffc0205676:	f7ffe0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc020567a:	000cb783          	ld	a5,0(s9)
ffffffffc020567e:	cfa1                	beqz	a5,ffffffffc02056d6 <sysfile_read+0xe8>
ffffffffc0205680:	43dc                	lw	a5,4(a5)
ffffffffc0205682:	66a2                	ld	a3,8(sp)
ffffffffc0205684:	04f92823          	sw	a5,80(s2)
ffffffffc0205688:	864e                	mv	a2,s3
ffffffffc020568a:	85da                	mv	a1,s6
ffffffffc020568c:	854a                	mv	a0,s2
ffffffffc020568e:	d5dfe0ef          	jal	ra,ffffffffc02043ea <copy_to_user>
ffffffffc0205692:	c50d                	beqz	a0,ffffffffc02056bc <sysfile_read+0xce>
ffffffffc0205694:	67a2                	ld	a5,8(sp)
ffffffffc0205696:	04f4e663          	bltu	s1,a5,ffffffffc02056e2 <sysfile_read+0xf4>
ffffffffc020569a:	9b3e                	add	s6,s6,a5
ffffffffc020569c:	8c9d                	sub	s1,s1,a5
ffffffffc020569e:	9bbe                	add	s7,s7,a5
ffffffffc02056a0:	02091263          	bnez	s2,ffffffffc02056c4 <sysfile_read+0xd6>
ffffffffc02056a4:	e401                	bnez	s0,ffffffffc02056ac <sysfile_read+0xbe>
ffffffffc02056a6:	67a2                	ld	a5,8(sp)
ffffffffc02056a8:	c391                	beqz	a5,ffffffffc02056ac <sysfile_read+0xbe>
ffffffffc02056aa:	f4dd                	bnez	s1,ffffffffc0205658 <sysfile_read+0x6a>
ffffffffc02056ac:	854e                	mv	a0,s3
ffffffffc02056ae:	a1dfc0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02056b2:	f40b8ce3          	beqz	s7,ffffffffc020560a <sysfile_read+0x1c>
ffffffffc02056b6:	000b841b          	sext.w	s0,s7
ffffffffc02056ba:	bf81                	j	ffffffffc020560a <sysfile_read+0x1c>
ffffffffc02056bc:	e011                	bnez	s0,ffffffffc02056c0 <sysfile_read+0xd2>
ffffffffc02056be:	5475                	li	s0,-3
ffffffffc02056c0:	fe0906e3          	beqz	s2,ffffffffc02056ac <sysfile_read+0xbe>
ffffffffc02056c4:	8562                	mv	a0,s8
ffffffffc02056c6:	f2bfe0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc02056ca:	04092823          	sw	zero,80(s2)
ffffffffc02056ce:	bfd9                	j	ffffffffc02056a4 <sysfile_read+0xb6>
ffffffffc02056d0:	e426                	sd	s1,8(sp)
ffffffffc02056d2:	8626                	mv	a2,s1
ffffffffc02056d4:	b771                	j	ffffffffc0205660 <sysfile_read+0x72>
ffffffffc02056d6:	66a2                	ld	a3,8(sp)
ffffffffc02056d8:	bf45                	j	ffffffffc0205688 <sysfile_read+0x9a>
ffffffffc02056da:	5475                	li	s0,-3
ffffffffc02056dc:	b73d                	j	ffffffffc020560a <sysfile_read+0x1c>
ffffffffc02056de:	5471                	li	s0,-4
ffffffffc02056e0:	b72d                	j	ffffffffc020560a <sysfile_read+0x1c>
ffffffffc02056e2:	00008697          	auipc	a3,0x8
ffffffffc02056e6:	40668693          	addi	a3,a3,1030 # ffffffffc020dae8 <CSWTCH.79+0xc8>
ffffffffc02056ea:	00007617          	auipc	a2,0x7
ffffffffc02056ee:	92660613          	addi	a2,a2,-1754 # ffffffffc020c010 <commands+0x210>
ffffffffc02056f2:	05500593          	li	a1,85
ffffffffc02056f6:	00008517          	auipc	a0,0x8
ffffffffc02056fa:	40250513          	addi	a0,a0,1026 # ffffffffc020daf8 <CSWTCH.79+0xd8>
ffffffffc02056fe:	da1fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205702 <sysfile_write>:
ffffffffc0205702:	7159                	addi	sp,sp,-112
ffffffffc0205704:	e8ca                	sd	s2,80(sp)
ffffffffc0205706:	f486                	sd	ra,104(sp)
ffffffffc0205708:	f0a2                	sd	s0,96(sp)
ffffffffc020570a:	eca6                	sd	s1,88(sp)
ffffffffc020570c:	e4ce                	sd	s3,72(sp)
ffffffffc020570e:	e0d2                	sd	s4,64(sp)
ffffffffc0205710:	fc56                	sd	s5,56(sp)
ffffffffc0205712:	f85a                	sd	s6,48(sp)
ffffffffc0205714:	f45e                	sd	s7,40(sp)
ffffffffc0205716:	f062                	sd	s8,32(sp)
ffffffffc0205718:	ec66                	sd	s9,24(sp)
ffffffffc020571a:	4901                	li	s2,0
ffffffffc020571c:	ee19                	bnez	a2,ffffffffc020573a <sysfile_write+0x38>
ffffffffc020571e:	70a6                	ld	ra,104(sp)
ffffffffc0205720:	7406                	ld	s0,96(sp)
ffffffffc0205722:	64e6                	ld	s1,88(sp)
ffffffffc0205724:	69a6                	ld	s3,72(sp)
ffffffffc0205726:	6a06                	ld	s4,64(sp)
ffffffffc0205728:	7ae2                	ld	s5,56(sp)
ffffffffc020572a:	7b42                	ld	s6,48(sp)
ffffffffc020572c:	7ba2                	ld	s7,40(sp)
ffffffffc020572e:	7c02                	ld	s8,32(sp)
ffffffffc0205730:	6ce2                	ld	s9,24(sp)
ffffffffc0205732:	854a                	mv	a0,s2
ffffffffc0205734:	6946                	ld	s2,80(sp)
ffffffffc0205736:	6165                	addi	sp,sp,112
ffffffffc0205738:	8082                	ret
ffffffffc020573a:	00091c17          	auipc	s8,0x91
ffffffffc020573e:	1b6c0c13          	addi	s8,s8,438 # ffffffffc02968f0 <current>
ffffffffc0205742:	000c3783          	ld	a5,0(s8)
ffffffffc0205746:	8432                	mv	s0,a2
ffffffffc0205748:	89ae                	mv	s3,a1
ffffffffc020574a:	4605                	li	a2,1
ffffffffc020574c:	4581                	li	a1,0
ffffffffc020574e:	7784                	ld	s1,40(a5)
ffffffffc0205750:	8baa                	mv	s7,a0
ffffffffc0205752:	b8cff0ef          	jal	ra,ffffffffc0204ade <file_testfd>
ffffffffc0205756:	cd59                	beqz	a0,ffffffffc02057f4 <sysfile_write+0xf2>
ffffffffc0205758:	6505                	lui	a0,0x1
ffffffffc020575a:	8c1fc0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc020575e:	8a2a                	mv	s4,a0
ffffffffc0205760:	cd41                	beqz	a0,ffffffffc02057f8 <sysfile_write+0xf6>
ffffffffc0205762:	4c81                	li	s9,0
ffffffffc0205764:	6a85                	lui	s5,0x1
ffffffffc0205766:	03848b13          	addi	s6,s1,56
ffffffffc020576a:	05546a63          	bltu	s0,s5,ffffffffc02057be <sysfile_write+0xbc>
ffffffffc020576e:	e456                	sd	s5,8(sp)
ffffffffc0205770:	c8a9                	beqz	s1,ffffffffc02057c2 <sysfile_write+0xc0>
ffffffffc0205772:	855a                	mv	a0,s6
ffffffffc0205774:	e81fe0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc0205778:	000c3783          	ld	a5,0(s8)
ffffffffc020577c:	c399                	beqz	a5,ffffffffc0205782 <sysfile_write+0x80>
ffffffffc020577e:	43dc                	lw	a5,4(a5)
ffffffffc0205780:	c8bc                	sw	a5,80(s1)
ffffffffc0205782:	66a2                	ld	a3,8(sp)
ffffffffc0205784:	4701                	li	a4,0
ffffffffc0205786:	864e                	mv	a2,s3
ffffffffc0205788:	85d2                	mv	a1,s4
ffffffffc020578a:	8526                	mv	a0,s1
ffffffffc020578c:	c2bfe0ef          	jal	ra,ffffffffc02043b6 <copy_from_user>
ffffffffc0205790:	c139                	beqz	a0,ffffffffc02057d6 <sysfile_write+0xd4>
ffffffffc0205792:	855a                	mv	a0,s6
ffffffffc0205794:	e5dfe0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0205798:	0404a823          	sw	zero,80(s1)
ffffffffc020579c:	6622                	ld	a2,8(sp)
ffffffffc020579e:	0034                	addi	a3,sp,8
ffffffffc02057a0:	85d2                	mv	a1,s4
ffffffffc02057a2:	855e                	mv	a0,s7
ffffffffc02057a4:	dc8ff0ef          	jal	ra,ffffffffc0204d6c <file_write>
ffffffffc02057a8:	67a2                	ld	a5,8(sp)
ffffffffc02057aa:	892a                	mv	s2,a0
ffffffffc02057ac:	ef85                	bnez	a5,ffffffffc02057e4 <sysfile_write+0xe2>
ffffffffc02057ae:	8552                	mv	a0,s4
ffffffffc02057b0:	91bfc0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02057b4:	f60c85e3          	beqz	s9,ffffffffc020571e <sysfile_write+0x1c>
ffffffffc02057b8:	000c891b          	sext.w	s2,s9
ffffffffc02057bc:	b78d                	j	ffffffffc020571e <sysfile_write+0x1c>
ffffffffc02057be:	e422                	sd	s0,8(sp)
ffffffffc02057c0:	f8cd                	bnez	s1,ffffffffc0205772 <sysfile_write+0x70>
ffffffffc02057c2:	66a2                	ld	a3,8(sp)
ffffffffc02057c4:	4701                	li	a4,0
ffffffffc02057c6:	864e                	mv	a2,s3
ffffffffc02057c8:	85d2                	mv	a1,s4
ffffffffc02057ca:	4501                	li	a0,0
ffffffffc02057cc:	bebfe0ef          	jal	ra,ffffffffc02043b6 <copy_from_user>
ffffffffc02057d0:	f571                	bnez	a0,ffffffffc020579c <sysfile_write+0x9a>
ffffffffc02057d2:	5975                	li	s2,-3
ffffffffc02057d4:	bfe9                	j	ffffffffc02057ae <sysfile_write+0xac>
ffffffffc02057d6:	855a                	mv	a0,s6
ffffffffc02057d8:	e19fe0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc02057dc:	5975                	li	s2,-3
ffffffffc02057de:	0404a823          	sw	zero,80(s1)
ffffffffc02057e2:	b7f1                	j	ffffffffc02057ae <sysfile_write+0xac>
ffffffffc02057e4:	00f46c63          	bltu	s0,a5,ffffffffc02057fc <sysfile_write+0xfa>
ffffffffc02057e8:	99be                	add	s3,s3,a5
ffffffffc02057ea:	8c1d                	sub	s0,s0,a5
ffffffffc02057ec:	9cbe                	add	s9,s9,a5
ffffffffc02057ee:	f161                	bnez	a0,ffffffffc02057ae <sysfile_write+0xac>
ffffffffc02057f0:	fc2d                	bnez	s0,ffffffffc020576a <sysfile_write+0x68>
ffffffffc02057f2:	bf75                	j	ffffffffc02057ae <sysfile_write+0xac>
ffffffffc02057f4:	5975                	li	s2,-3
ffffffffc02057f6:	b725                	j	ffffffffc020571e <sysfile_write+0x1c>
ffffffffc02057f8:	5971                	li	s2,-4
ffffffffc02057fa:	b715                	j	ffffffffc020571e <sysfile_write+0x1c>
ffffffffc02057fc:	00008697          	auipc	a3,0x8
ffffffffc0205800:	2ec68693          	addi	a3,a3,748 # ffffffffc020dae8 <CSWTCH.79+0xc8>
ffffffffc0205804:	00007617          	auipc	a2,0x7
ffffffffc0205808:	80c60613          	addi	a2,a2,-2036 # ffffffffc020c010 <commands+0x210>
ffffffffc020580c:	08a00593          	li	a1,138
ffffffffc0205810:	00008517          	auipc	a0,0x8
ffffffffc0205814:	2e850513          	addi	a0,a0,744 # ffffffffc020daf8 <CSWTCH.79+0xd8>
ffffffffc0205818:	c87fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020581c <sysfile_seek>:
ffffffffc020581c:	e36ff06f          	j	ffffffffc0204e52 <file_seek>

ffffffffc0205820 <sysfile_fstat>:
ffffffffc0205820:	715d                	addi	sp,sp,-80
ffffffffc0205822:	f44e                	sd	s3,40(sp)
ffffffffc0205824:	00091997          	auipc	s3,0x91
ffffffffc0205828:	0cc98993          	addi	s3,s3,204 # ffffffffc02968f0 <current>
ffffffffc020582c:	0009b703          	ld	a4,0(s3)
ffffffffc0205830:	fc26                	sd	s1,56(sp)
ffffffffc0205832:	84ae                	mv	s1,a1
ffffffffc0205834:	858a                	mv	a1,sp
ffffffffc0205836:	e0a2                	sd	s0,64(sp)
ffffffffc0205838:	f84a                	sd	s2,48(sp)
ffffffffc020583a:	e486                	sd	ra,72(sp)
ffffffffc020583c:	02873903          	ld	s2,40(a4)
ffffffffc0205840:	f052                	sd	s4,32(sp)
ffffffffc0205842:	f30ff0ef          	jal	ra,ffffffffc0204f72 <file_fstat>
ffffffffc0205846:	842a                	mv	s0,a0
ffffffffc0205848:	e91d                	bnez	a0,ffffffffc020587e <sysfile_fstat+0x5e>
ffffffffc020584a:	04090363          	beqz	s2,ffffffffc0205890 <sysfile_fstat+0x70>
ffffffffc020584e:	03890a13          	addi	s4,s2,56
ffffffffc0205852:	8552                	mv	a0,s4
ffffffffc0205854:	da1fe0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc0205858:	0009b783          	ld	a5,0(s3)
ffffffffc020585c:	c3b9                	beqz	a5,ffffffffc02058a2 <sysfile_fstat+0x82>
ffffffffc020585e:	43dc                	lw	a5,4(a5)
ffffffffc0205860:	02000693          	li	a3,32
ffffffffc0205864:	860a                	mv	a2,sp
ffffffffc0205866:	04f92823          	sw	a5,80(s2)
ffffffffc020586a:	85a6                	mv	a1,s1
ffffffffc020586c:	854a                	mv	a0,s2
ffffffffc020586e:	b7dfe0ef          	jal	ra,ffffffffc02043ea <copy_to_user>
ffffffffc0205872:	c121                	beqz	a0,ffffffffc02058b2 <sysfile_fstat+0x92>
ffffffffc0205874:	8552                	mv	a0,s4
ffffffffc0205876:	d7bfe0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020587a:	04092823          	sw	zero,80(s2)
ffffffffc020587e:	60a6                	ld	ra,72(sp)
ffffffffc0205880:	8522                	mv	a0,s0
ffffffffc0205882:	6406                	ld	s0,64(sp)
ffffffffc0205884:	74e2                	ld	s1,56(sp)
ffffffffc0205886:	7942                	ld	s2,48(sp)
ffffffffc0205888:	79a2                	ld	s3,40(sp)
ffffffffc020588a:	7a02                	ld	s4,32(sp)
ffffffffc020588c:	6161                	addi	sp,sp,80
ffffffffc020588e:	8082                	ret
ffffffffc0205890:	02000693          	li	a3,32
ffffffffc0205894:	860a                	mv	a2,sp
ffffffffc0205896:	85a6                	mv	a1,s1
ffffffffc0205898:	b53fe0ef          	jal	ra,ffffffffc02043ea <copy_to_user>
ffffffffc020589c:	f16d                	bnez	a0,ffffffffc020587e <sysfile_fstat+0x5e>
ffffffffc020589e:	5475                	li	s0,-3
ffffffffc02058a0:	bff9                	j	ffffffffc020587e <sysfile_fstat+0x5e>
ffffffffc02058a2:	02000693          	li	a3,32
ffffffffc02058a6:	860a                	mv	a2,sp
ffffffffc02058a8:	85a6                	mv	a1,s1
ffffffffc02058aa:	854a                	mv	a0,s2
ffffffffc02058ac:	b3ffe0ef          	jal	ra,ffffffffc02043ea <copy_to_user>
ffffffffc02058b0:	f171                	bnez	a0,ffffffffc0205874 <sysfile_fstat+0x54>
ffffffffc02058b2:	8552                	mv	a0,s4
ffffffffc02058b4:	d3dfe0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc02058b8:	5475                	li	s0,-3
ffffffffc02058ba:	04092823          	sw	zero,80(s2)
ffffffffc02058be:	b7c1                	j	ffffffffc020587e <sysfile_fstat+0x5e>

ffffffffc02058c0 <sysfile_fsync>:
ffffffffc02058c0:	f72ff06f          	j	ffffffffc0205032 <file_fsync>

ffffffffc02058c4 <sysfile_getcwd>:
ffffffffc02058c4:	715d                	addi	sp,sp,-80
ffffffffc02058c6:	f44e                	sd	s3,40(sp)
ffffffffc02058c8:	00091997          	auipc	s3,0x91
ffffffffc02058cc:	02898993          	addi	s3,s3,40 # ffffffffc02968f0 <current>
ffffffffc02058d0:	0009b783          	ld	a5,0(s3)
ffffffffc02058d4:	f84a                	sd	s2,48(sp)
ffffffffc02058d6:	e486                	sd	ra,72(sp)
ffffffffc02058d8:	e0a2                	sd	s0,64(sp)
ffffffffc02058da:	fc26                	sd	s1,56(sp)
ffffffffc02058dc:	f052                	sd	s4,32(sp)
ffffffffc02058de:	0287b903          	ld	s2,40(a5)
ffffffffc02058e2:	cda9                	beqz	a1,ffffffffc020593c <sysfile_getcwd+0x78>
ffffffffc02058e4:	842e                	mv	s0,a1
ffffffffc02058e6:	84aa                	mv	s1,a0
ffffffffc02058e8:	04090363          	beqz	s2,ffffffffc020592e <sysfile_getcwd+0x6a>
ffffffffc02058ec:	03890a13          	addi	s4,s2,56
ffffffffc02058f0:	8552                	mv	a0,s4
ffffffffc02058f2:	d03fe0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc02058f6:	0009b783          	ld	a5,0(s3)
ffffffffc02058fa:	c781                	beqz	a5,ffffffffc0205902 <sysfile_getcwd+0x3e>
ffffffffc02058fc:	43dc                	lw	a5,4(a5)
ffffffffc02058fe:	04f92823          	sw	a5,80(s2)
ffffffffc0205902:	4685                	li	a3,1
ffffffffc0205904:	8622                	mv	a2,s0
ffffffffc0205906:	85a6                	mv	a1,s1
ffffffffc0205908:	854a                	mv	a0,s2
ffffffffc020590a:	a19fe0ef          	jal	ra,ffffffffc0204322 <user_mem_check>
ffffffffc020590e:	e90d                	bnez	a0,ffffffffc0205940 <sysfile_getcwd+0x7c>
ffffffffc0205910:	5475                	li	s0,-3
ffffffffc0205912:	8552                	mv	a0,s4
ffffffffc0205914:	cddfe0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0205918:	04092823          	sw	zero,80(s2)
ffffffffc020591c:	60a6                	ld	ra,72(sp)
ffffffffc020591e:	8522                	mv	a0,s0
ffffffffc0205920:	6406                	ld	s0,64(sp)
ffffffffc0205922:	74e2                	ld	s1,56(sp)
ffffffffc0205924:	7942                	ld	s2,48(sp)
ffffffffc0205926:	79a2                	ld	s3,40(sp)
ffffffffc0205928:	7a02                	ld	s4,32(sp)
ffffffffc020592a:	6161                	addi	sp,sp,80
ffffffffc020592c:	8082                	ret
ffffffffc020592e:	862e                	mv	a2,a1
ffffffffc0205930:	4685                	li	a3,1
ffffffffc0205932:	85aa                	mv	a1,a0
ffffffffc0205934:	4501                	li	a0,0
ffffffffc0205936:	9edfe0ef          	jal	ra,ffffffffc0204322 <user_mem_check>
ffffffffc020593a:	ed09                	bnez	a0,ffffffffc0205954 <sysfile_getcwd+0x90>
ffffffffc020593c:	5475                	li	s0,-3
ffffffffc020593e:	bff9                	j	ffffffffc020591c <sysfile_getcwd+0x58>
ffffffffc0205940:	8622                	mv	a2,s0
ffffffffc0205942:	4681                	li	a3,0
ffffffffc0205944:	85a6                	mv	a1,s1
ffffffffc0205946:	850a                	mv	a0,sp
ffffffffc0205948:	b2bff0ef          	jal	ra,ffffffffc0205472 <iobuf_init>
ffffffffc020594c:	190030ef          	jal	ra,ffffffffc0208adc <vfs_getcwd>
ffffffffc0205950:	842a                	mv	s0,a0
ffffffffc0205952:	b7c1                	j	ffffffffc0205912 <sysfile_getcwd+0x4e>
ffffffffc0205954:	8622                	mv	a2,s0
ffffffffc0205956:	4681                	li	a3,0
ffffffffc0205958:	85a6                	mv	a1,s1
ffffffffc020595a:	850a                	mv	a0,sp
ffffffffc020595c:	b17ff0ef          	jal	ra,ffffffffc0205472 <iobuf_init>
ffffffffc0205960:	17c030ef          	jal	ra,ffffffffc0208adc <vfs_getcwd>
ffffffffc0205964:	842a                	mv	s0,a0
ffffffffc0205966:	bf5d                	j	ffffffffc020591c <sysfile_getcwd+0x58>

ffffffffc0205968 <sysfile_getdirentry>:
ffffffffc0205968:	7139                	addi	sp,sp,-64
ffffffffc020596a:	e852                	sd	s4,16(sp)
ffffffffc020596c:	00091a17          	auipc	s4,0x91
ffffffffc0205970:	f84a0a13          	addi	s4,s4,-124 # ffffffffc02968f0 <current>
ffffffffc0205974:	000a3703          	ld	a4,0(s4)
ffffffffc0205978:	ec4e                	sd	s3,24(sp)
ffffffffc020597a:	89aa                	mv	s3,a0
ffffffffc020597c:	10800513          	li	a0,264
ffffffffc0205980:	f426                	sd	s1,40(sp)
ffffffffc0205982:	f04a                	sd	s2,32(sp)
ffffffffc0205984:	fc06                	sd	ra,56(sp)
ffffffffc0205986:	f822                	sd	s0,48(sp)
ffffffffc0205988:	e456                	sd	s5,8(sp)
ffffffffc020598a:	7704                	ld	s1,40(a4)
ffffffffc020598c:	892e                	mv	s2,a1
ffffffffc020598e:	e8cfc0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0205992:	c169                	beqz	a0,ffffffffc0205a54 <sysfile_getdirentry+0xec>
ffffffffc0205994:	842a                	mv	s0,a0
ffffffffc0205996:	c8c1                	beqz	s1,ffffffffc0205a26 <sysfile_getdirentry+0xbe>
ffffffffc0205998:	03848a93          	addi	s5,s1,56
ffffffffc020599c:	8556                	mv	a0,s5
ffffffffc020599e:	c57fe0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc02059a2:	000a3783          	ld	a5,0(s4)
ffffffffc02059a6:	c399                	beqz	a5,ffffffffc02059ac <sysfile_getdirentry+0x44>
ffffffffc02059a8:	43dc                	lw	a5,4(a5)
ffffffffc02059aa:	c8bc                	sw	a5,80(s1)
ffffffffc02059ac:	4705                	li	a4,1
ffffffffc02059ae:	46a1                	li	a3,8
ffffffffc02059b0:	864a                	mv	a2,s2
ffffffffc02059b2:	85a2                	mv	a1,s0
ffffffffc02059b4:	8526                	mv	a0,s1
ffffffffc02059b6:	a01fe0ef          	jal	ra,ffffffffc02043b6 <copy_from_user>
ffffffffc02059ba:	e505                	bnez	a0,ffffffffc02059e2 <sysfile_getdirentry+0x7a>
ffffffffc02059bc:	8556                	mv	a0,s5
ffffffffc02059be:	c33fe0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc02059c2:	59f5                	li	s3,-3
ffffffffc02059c4:	0404a823          	sw	zero,80(s1)
ffffffffc02059c8:	8522                	mv	a0,s0
ffffffffc02059ca:	f00fc0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02059ce:	70e2                	ld	ra,56(sp)
ffffffffc02059d0:	7442                	ld	s0,48(sp)
ffffffffc02059d2:	74a2                	ld	s1,40(sp)
ffffffffc02059d4:	7902                	ld	s2,32(sp)
ffffffffc02059d6:	6a42                	ld	s4,16(sp)
ffffffffc02059d8:	6aa2                	ld	s5,8(sp)
ffffffffc02059da:	854e                	mv	a0,s3
ffffffffc02059dc:	69e2                	ld	s3,24(sp)
ffffffffc02059de:	6121                	addi	sp,sp,64
ffffffffc02059e0:	8082                	ret
ffffffffc02059e2:	8556                	mv	a0,s5
ffffffffc02059e4:	c0dfe0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc02059e8:	854e                	mv	a0,s3
ffffffffc02059ea:	85a2                	mv	a1,s0
ffffffffc02059ec:	0404a823          	sw	zero,80(s1)
ffffffffc02059f0:	ef0ff0ef          	jal	ra,ffffffffc02050e0 <file_getdirentry>
ffffffffc02059f4:	89aa                	mv	s3,a0
ffffffffc02059f6:	f969                	bnez	a0,ffffffffc02059c8 <sysfile_getdirentry+0x60>
ffffffffc02059f8:	8556                	mv	a0,s5
ffffffffc02059fa:	bfbfe0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc02059fe:	000a3783          	ld	a5,0(s4)
ffffffffc0205a02:	c399                	beqz	a5,ffffffffc0205a08 <sysfile_getdirentry+0xa0>
ffffffffc0205a04:	43dc                	lw	a5,4(a5)
ffffffffc0205a06:	c8bc                	sw	a5,80(s1)
ffffffffc0205a08:	10800693          	li	a3,264
ffffffffc0205a0c:	8622                	mv	a2,s0
ffffffffc0205a0e:	85ca                	mv	a1,s2
ffffffffc0205a10:	8526                	mv	a0,s1
ffffffffc0205a12:	9d9fe0ef          	jal	ra,ffffffffc02043ea <copy_to_user>
ffffffffc0205a16:	e111                	bnez	a0,ffffffffc0205a1a <sysfile_getdirentry+0xb2>
ffffffffc0205a18:	59f5                	li	s3,-3
ffffffffc0205a1a:	8556                	mv	a0,s5
ffffffffc0205a1c:	bd5fe0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0205a20:	0404a823          	sw	zero,80(s1)
ffffffffc0205a24:	b755                	j	ffffffffc02059c8 <sysfile_getdirentry+0x60>
ffffffffc0205a26:	85aa                	mv	a1,a0
ffffffffc0205a28:	4705                	li	a4,1
ffffffffc0205a2a:	46a1                	li	a3,8
ffffffffc0205a2c:	864a                	mv	a2,s2
ffffffffc0205a2e:	4501                	li	a0,0
ffffffffc0205a30:	987fe0ef          	jal	ra,ffffffffc02043b6 <copy_from_user>
ffffffffc0205a34:	cd11                	beqz	a0,ffffffffc0205a50 <sysfile_getdirentry+0xe8>
ffffffffc0205a36:	854e                	mv	a0,s3
ffffffffc0205a38:	85a2                	mv	a1,s0
ffffffffc0205a3a:	ea6ff0ef          	jal	ra,ffffffffc02050e0 <file_getdirentry>
ffffffffc0205a3e:	89aa                	mv	s3,a0
ffffffffc0205a40:	f541                	bnez	a0,ffffffffc02059c8 <sysfile_getdirentry+0x60>
ffffffffc0205a42:	10800693          	li	a3,264
ffffffffc0205a46:	8622                	mv	a2,s0
ffffffffc0205a48:	85ca                	mv	a1,s2
ffffffffc0205a4a:	9a1fe0ef          	jal	ra,ffffffffc02043ea <copy_to_user>
ffffffffc0205a4e:	fd2d                	bnez	a0,ffffffffc02059c8 <sysfile_getdirentry+0x60>
ffffffffc0205a50:	59f5                	li	s3,-3
ffffffffc0205a52:	bf9d                	j	ffffffffc02059c8 <sysfile_getdirentry+0x60>
ffffffffc0205a54:	59f1                	li	s3,-4
ffffffffc0205a56:	bfa5                	j	ffffffffc02059ce <sysfile_getdirentry+0x66>

ffffffffc0205a58 <sysfile_dup>:
ffffffffc0205a58:	f6eff06f          	j	ffffffffc02051c6 <file_dup>

ffffffffc0205a5c <kernel_thread_entry>:
ffffffffc0205a5c:	8526                	mv	a0,s1
ffffffffc0205a5e:	9402                	jalr	s0
ffffffffc0205a60:	5e6000ef          	jal	ra,ffffffffc0206046 <do_exit>

ffffffffc0205a64 <alloc_proc>:
ffffffffc0205a64:	1141                	addi	sp,sp,-16
ffffffffc0205a66:	15800513          	li	a0,344
ffffffffc0205a6a:	e022                	sd	s0,0(sp)
ffffffffc0205a6c:	e406                	sd	ra,8(sp)
ffffffffc0205a6e:	dacfc0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0205a72:	842a                	mv	s0,a0
ffffffffc0205a74:	c159                	beqz	a0,ffffffffc0205afa <alloc_proc+0x96>
ffffffffc0205a76:	57fd                	li	a5,-1
ffffffffc0205a78:	1782                	slli	a5,a5,0x20
ffffffffc0205a7a:	e11c                	sd	a5,0(a0)
ffffffffc0205a7c:	07000613          	li	a2,112
ffffffffc0205a80:	4581                	li	a1,0
ffffffffc0205a82:	00052423          	sw	zero,8(a0)
ffffffffc0205a86:	00053823          	sd	zero,16(a0)
ffffffffc0205a8a:	00053c23          	sd	zero,24(a0)
ffffffffc0205a8e:	02053023          	sd	zero,32(a0)
ffffffffc0205a92:	02053423          	sd	zero,40(a0)
ffffffffc0205a96:	03050513          	addi	a0,a0,48
ffffffffc0205a9a:	090060ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0205a9e:	00091797          	auipc	a5,0x91
ffffffffc0205aa2:	e227b783          	ld	a5,-478(a5) # ffffffffc02968c0 <boot_pgdir_pa>
ffffffffc0205aa6:	f45c                	sd	a5,168(s0)
ffffffffc0205aa8:	0a043023          	sd	zero,160(s0)
ffffffffc0205aac:	0a042823          	sw	zero,176(s0)
ffffffffc0205ab0:	4641                	li	a2,16
ffffffffc0205ab2:	4581                	li	a1,0
ffffffffc0205ab4:	0b440513          	addi	a0,s0,180
ffffffffc0205ab8:	072060ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0205abc:	11040793          	addi	a5,s0,272
ffffffffc0205ac0:	10f43c23          	sd	a5,280(s0)
ffffffffc0205ac4:	10f43823          	sd	a5,272(s0)
ffffffffc0205ac8:	4785                	li	a5,1
ffffffffc0205aca:	0e042623          	sw	zero,236(s0)
ffffffffc0205ace:	0e043c23          	sd	zero,248(s0)
ffffffffc0205ad2:	10043023          	sd	zero,256(s0)
ffffffffc0205ad6:	0e043823          	sd	zero,240(s0)
ffffffffc0205ada:	10043423          	sd	zero,264(s0)
ffffffffc0205ade:	12042023          	sw	zero,288(s0)
ffffffffc0205ae2:	12043423          	sd	zero,296(s0)
ffffffffc0205ae6:	12043c23          	sd	zero,312(s0)
ffffffffc0205aea:	12043823          	sd	zero,304(s0)
ffffffffc0205aee:	14043023          	sd	zero,320(s0)
ffffffffc0205af2:	14f42423          	sw	a5,328(s0)
ffffffffc0205af6:	14043823          	sd	zero,336(s0)
ffffffffc0205afa:	60a2                	ld	ra,8(sp)
ffffffffc0205afc:	8522                	mv	a0,s0
ffffffffc0205afe:	6402                	ld	s0,0(sp)
ffffffffc0205b00:	0141                	addi	sp,sp,16
ffffffffc0205b02:	8082                	ret

ffffffffc0205b04 <forkret>:
ffffffffc0205b04:	00091797          	auipc	a5,0x91
ffffffffc0205b08:	dec7b783          	ld	a5,-532(a5) # ffffffffc02968f0 <current>
ffffffffc0205b0c:	73c8                	ld	a0,160(a5)
ffffffffc0205b0e:	829fb06f          	j	ffffffffc0201336 <forkrets>

ffffffffc0205b12 <put_pgdir.isra.0>:
ffffffffc0205b12:	1141                	addi	sp,sp,-16
ffffffffc0205b14:	e406                	sd	ra,8(sp)
ffffffffc0205b16:	c02007b7          	lui	a5,0xc0200
ffffffffc0205b1a:	02f56e63          	bltu	a0,a5,ffffffffc0205b56 <put_pgdir.isra.0+0x44>
ffffffffc0205b1e:	00091697          	auipc	a3,0x91
ffffffffc0205b22:	dca6b683          	ld	a3,-566(a3) # ffffffffc02968e8 <va_pa_offset>
ffffffffc0205b26:	8d15                	sub	a0,a0,a3
ffffffffc0205b28:	8131                	srli	a0,a0,0xc
ffffffffc0205b2a:	00091797          	auipc	a5,0x91
ffffffffc0205b2e:	da67b783          	ld	a5,-602(a5) # ffffffffc02968d0 <npage>
ffffffffc0205b32:	02f57f63          	bgeu	a0,a5,ffffffffc0205b70 <put_pgdir.isra.0+0x5e>
ffffffffc0205b36:	0000a697          	auipc	a3,0xa
ffffffffc0205b3a:	37a6b683          	ld	a3,890(a3) # ffffffffc020feb0 <nbase>
ffffffffc0205b3e:	60a2                	ld	ra,8(sp)
ffffffffc0205b40:	8d15                	sub	a0,a0,a3
ffffffffc0205b42:	00091797          	auipc	a5,0x91
ffffffffc0205b46:	d967b783          	ld	a5,-618(a5) # ffffffffc02968d8 <pages>
ffffffffc0205b4a:	051a                	slli	a0,a0,0x6
ffffffffc0205b4c:	4585                	li	a1,1
ffffffffc0205b4e:	953e                	add	a0,a0,a5
ffffffffc0205b50:	0141                	addi	sp,sp,16
ffffffffc0205b52:	ee4fc06f          	j	ffffffffc0202236 <free_pages>
ffffffffc0205b56:	86aa                	mv	a3,a0
ffffffffc0205b58:	00007617          	auipc	a2,0x7
ffffffffc0205b5c:	08060613          	addi	a2,a2,128 # ffffffffc020cbd8 <default_pmm_manager+0xe0>
ffffffffc0205b60:	07700593          	li	a1,119
ffffffffc0205b64:	00007517          	auipc	a0,0x7
ffffffffc0205b68:	ff450513          	addi	a0,a0,-12 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc0205b6c:	933fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205b70:	00007617          	auipc	a2,0x7
ffffffffc0205b74:	09060613          	addi	a2,a2,144 # ffffffffc020cc00 <default_pmm_manager+0x108>
ffffffffc0205b78:	06900593          	li	a1,105
ffffffffc0205b7c:	00007517          	auipc	a0,0x7
ffffffffc0205b80:	fdc50513          	addi	a0,a0,-36 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc0205b84:	91bfa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205b88 <proc_run>:
ffffffffc0205b88:	7179                	addi	sp,sp,-48
ffffffffc0205b8a:	f026                	sd	s1,32(sp)
ffffffffc0205b8c:	00091497          	auipc	s1,0x91
ffffffffc0205b90:	d6448493          	addi	s1,s1,-668 # ffffffffc02968f0 <current>
ffffffffc0205b94:	ec4a                	sd	s2,24(sp)
ffffffffc0205b96:	0004b903          	ld	s2,0(s1)
ffffffffc0205b9a:	f406                	sd	ra,40(sp)
ffffffffc0205b9c:	e84e                	sd	s3,16(sp)
ffffffffc0205b9e:	02a90a63          	beq	s2,a0,ffffffffc0205bd2 <proc_run+0x4a>
ffffffffc0205ba2:	100027f3          	csrr	a5,sstatus
ffffffffc0205ba6:	8b89                	andi	a5,a5,2
ffffffffc0205ba8:	4981                	li	s3,0
ffffffffc0205baa:	e3a9                	bnez	a5,ffffffffc0205bec <proc_run+0x64>
ffffffffc0205bac:	755c                	ld	a5,168(a0)
ffffffffc0205bae:	577d                	li	a4,-1
ffffffffc0205bb0:	177e                	slli	a4,a4,0x3f
ffffffffc0205bb2:	83b1                	srli	a5,a5,0xc
ffffffffc0205bb4:	e088                	sd	a0,0(s1)
ffffffffc0205bb6:	8fd9                	or	a5,a5,a4
ffffffffc0205bb8:	18079073          	csrw	satp,a5
ffffffffc0205bbc:	12000073          	sfence.vma
ffffffffc0205bc0:	608c                	ld	a1,0(s1)
ffffffffc0205bc2:	03090513          	addi	a0,s2,48
ffffffffc0205bc6:	03058593          	addi	a1,a1,48
ffffffffc0205bca:	546010ef          	jal	ra,ffffffffc0207110 <switch_to>
ffffffffc0205bce:	00099863          	bnez	s3,ffffffffc0205bde <proc_run+0x56>
ffffffffc0205bd2:	70a2                	ld	ra,40(sp)
ffffffffc0205bd4:	7482                	ld	s1,32(sp)
ffffffffc0205bd6:	6962                	ld	s2,24(sp)
ffffffffc0205bd8:	69c2                	ld	s3,16(sp)
ffffffffc0205bda:	6145                	addi	sp,sp,48
ffffffffc0205bdc:	8082                	ret
ffffffffc0205bde:	70a2                	ld	ra,40(sp)
ffffffffc0205be0:	7482                	ld	s1,32(sp)
ffffffffc0205be2:	6962                	ld	s2,24(sp)
ffffffffc0205be4:	69c2                	ld	s3,16(sp)
ffffffffc0205be6:	6145                	addi	sp,sp,48
ffffffffc0205be8:	884fb06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0205bec:	e42a                	sd	a0,8(sp)
ffffffffc0205bee:	884fb0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205bf2:	6522                	ld	a0,8(sp)
ffffffffc0205bf4:	4985                	li	s3,1
ffffffffc0205bf6:	bf5d                	j	ffffffffc0205bac <proc_run+0x24>

ffffffffc0205bf8 <do_fork>:
ffffffffc0205bf8:	7119                	addi	sp,sp,-128
ffffffffc0205bfa:	ecce                	sd	s3,88(sp)
ffffffffc0205bfc:	00091997          	auipc	s3,0x91
ffffffffc0205c00:	d0c98993          	addi	s3,s3,-756 # ffffffffc0296908 <nr_process>
ffffffffc0205c04:	0009a703          	lw	a4,0(s3)
ffffffffc0205c08:	fc86                	sd	ra,120(sp)
ffffffffc0205c0a:	f8a2                	sd	s0,112(sp)
ffffffffc0205c0c:	f4a6                	sd	s1,104(sp)
ffffffffc0205c0e:	f0ca                	sd	s2,96(sp)
ffffffffc0205c10:	e8d2                	sd	s4,80(sp)
ffffffffc0205c12:	e4d6                	sd	s5,72(sp)
ffffffffc0205c14:	e0da                	sd	s6,64(sp)
ffffffffc0205c16:	fc5e                	sd	s7,56(sp)
ffffffffc0205c18:	f862                	sd	s8,48(sp)
ffffffffc0205c1a:	f466                	sd	s9,40(sp)
ffffffffc0205c1c:	f06a                	sd	s10,32(sp)
ffffffffc0205c1e:	ec6e                	sd	s11,24(sp)
ffffffffc0205c20:	6785                	lui	a5,0x1
ffffffffc0205c22:	32f75963          	bge	a4,a5,ffffffffc0205f54 <do_fork+0x35c>
ffffffffc0205c26:	892a                	mv	s2,a0
ffffffffc0205c28:	8a2e                	mv	s4,a1
ffffffffc0205c2a:	84b2                	mv	s1,a2
ffffffffc0205c2c:	e39ff0ef          	jal	ra,ffffffffc0205a64 <alloc_proc>
ffffffffc0205c30:	842a                	mv	s0,a0
ffffffffc0205c32:	28050163          	beqz	a0,ffffffffc0205eb4 <do_fork+0x2bc>
ffffffffc0205c36:	00091d97          	auipc	s11,0x91
ffffffffc0205c3a:	cbad8d93          	addi	s11,s11,-838 # ffffffffc02968f0 <current>
ffffffffc0205c3e:	000db783          	ld	a5,0(s11)
ffffffffc0205c42:	4509                	li	a0,2
ffffffffc0205c44:	1487a683          	lw	a3,328(a5) # 1148 <_binary_bin_swap_img_size-0x6bb8>
ffffffffc0205c48:	1407b703          	ld	a4,320(a5)
ffffffffc0205c4c:	f01c                	sd	a5,32(s0)
ffffffffc0205c4e:	14d42423          	sw	a3,328(s0)
ffffffffc0205c52:	14e43023          	sd	a4,320(s0)
ffffffffc0205c56:	0e07a623          	sw	zero,236(a5)
ffffffffc0205c5a:	d9efc0ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc0205c5e:	24050863          	beqz	a0,ffffffffc0205eae <do_fork+0x2b6>
ffffffffc0205c62:	00091b97          	auipc	s7,0x91
ffffffffc0205c66:	c76b8b93          	addi	s7,s7,-906 # ffffffffc02968d8 <pages>
ffffffffc0205c6a:	000bb683          	ld	a3,0(s7)
ffffffffc0205c6e:	00091b17          	auipc	s6,0x91
ffffffffc0205c72:	c62b0b13          	addi	s6,s6,-926 # ffffffffc02968d0 <npage>
ffffffffc0205c76:	0000aa97          	auipc	s5,0xa
ffffffffc0205c7a:	23aaba83          	ld	s5,570(s5) # ffffffffc020feb0 <nbase>
ffffffffc0205c7e:	40d506b3          	sub	a3,a0,a3
ffffffffc0205c82:	8699                	srai	a3,a3,0x6
ffffffffc0205c84:	5cfd                	li	s9,-1
ffffffffc0205c86:	000b3783          	ld	a5,0(s6)
ffffffffc0205c8a:	96d6                	add	a3,a3,s5
ffffffffc0205c8c:	00ccdc93          	srli	s9,s9,0xc
ffffffffc0205c90:	0196f733          	and	a4,a3,s9
ffffffffc0205c94:	06b2                	slli	a3,a3,0xc
ffffffffc0205c96:	34f77463          	bgeu	a4,a5,ffffffffc0205fde <do_fork+0x3e6>
ffffffffc0205c9a:	000db883          	ld	a7,0(s11)
ffffffffc0205c9e:	00091c17          	auipc	s8,0x91
ffffffffc0205ca2:	c4ac0c13          	addi	s8,s8,-950 # ffffffffc02968e8 <va_pa_offset>
ffffffffc0205ca6:	000c3703          	ld	a4,0(s8)
ffffffffc0205caa:	0288bd03          	ld	s10,40(a7) # 1028 <_binary_bin_swap_img_size-0x6cd8>
ffffffffc0205cae:	96ba                	add	a3,a3,a4
ffffffffc0205cb0:	e814                	sd	a3,16(s0)
ffffffffc0205cb2:	020d0a63          	beqz	s10,ffffffffc0205ce6 <do_fork+0xee>
ffffffffc0205cb6:	10097713          	andi	a4,s2,256
ffffffffc0205cba:	1e070f63          	beqz	a4,ffffffffc0205eb8 <do_fork+0x2c0>
ffffffffc0205cbe:	030d2683          	lw	a3,48(s10)
ffffffffc0205cc2:	018d3703          	ld	a4,24(s10)
ffffffffc0205cc6:	c0200637          	lui	a2,0xc0200
ffffffffc0205cca:	2685                	addiw	a3,a3,1
ffffffffc0205ccc:	02dd2823          	sw	a3,48(s10)
ffffffffc0205cd0:	03a43423          	sd	s10,40(s0)
ffffffffc0205cd4:	2ac76063          	bltu	a4,a2,ffffffffc0205f74 <do_fork+0x37c>
ffffffffc0205cd8:	000c3783          	ld	a5,0(s8)
ffffffffc0205cdc:	000db883          	ld	a7,0(s11)
ffffffffc0205ce0:	6814                	ld	a3,16(s0)
ffffffffc0205ce2:	8f1d                	sub	a4,a4,a5
ffffffffc0205ce4:	f458                	sd	a4,168(s0)
ffffffffc0205ce6:	6789                	lui	a5,0x2
ffffffffc0205ce8:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0205cec:	96be                	add	a3,a3,a5
ffffffffc0205cee:	f054                	sd	a3,160(s0)
ffffffffc0205cf0:	87b6                	mv	a5,a3
ffffffffc0205cf2:	12048813          	addi	a6,s1,288
ffffffffc0205cf6:	6088                	ld	a0,0(s1)
ffffffffc0205cf8:	648c                	ld	a1,8(s1)
ffffffffc0205cfa:	6890                	ld	a2,16(s1)
ffffffffc0205cfc:	6c98                	ld	a4,24(s1)
ffffffffc0205cfe:	e388                	sd	a0,0(a5)
ffffffffc0205d00:	e78c                	sd	a1,8(a5)
ffffffffc0205d02:	eb90                	sd	a2,16(a5)
ffffffffc0205d04:	ef98                	sd	a4,24(a5)
ffffffffc0205d06:	02048493          	addi	s1,s1,32
ffffffffc0205d0a:	02078793          	addi	a5,a5,32
ffffffffc0205d0e:	ff0494e3          	bne	s1,a6,ffffffffc0205cf6 <do_fork+0xfe>
ffffffffc0205d12:	0406b823          	sd	zero,80(a3)
ffffffffc0205d16:	140a0663          	beqz	s4,ffffffffc0205e62 <do_fork+0x26a>
ffffffffc0205d1a:	1508b483          	ld	s1,336(a7)
ffffffffc0205d1e:	00000797          	auipc	a5,0x0
ffffffffc0205d22:	de678793          	addi	a5,a5,-538 # ffffffffc0205b04 <forkret>
ffffffffc0205d26:	0146b823          	sd	s4,16(a3)
ffffffffc0205d2a:	f81c                	sd	a5,48(s0)
ffffffffc0205d2c:	fc14                	sd	a3,56(s0)
ffffffffc0205d2e:	28048863          	beqz	s1,ffffffffc0205fbe <do_fork+0x3c6>
ffffffffc0205d32:	00b95913          	srli	s2,s2,0xb
ffffffffc0205d36:	00197913          	andi	s2,s2,1
ffffffffc0205d3a:	12090663          	beqz	s2,ffffffffc0205e66 <do_fork+0x26e>
ffffffffc0205d3e:	4898                	lw	a4,16(s1)
ffffffffc0205d40:	0008b817          	auipc	a6,0x8b
ffffffffc0205d44:	34880813          	addi	a6,a6,840 # ffffffffc0291088 <last_pid.1>
ffffffffc0205d48:	00082783          	lw	a5,0(a6)
ffffffffc0205d4c:	2705                	addiw	a4,a4,1
ffffffffc0205d4e:	c898                	sw	a4,16(s1)
ffffffffc0205d50:	0017851b          	addiw	a0,a5,1
ffffffffc0205d54:	14943823          	sd	s1,336(s0)
ffffffffc0205d58:	00a82023          	sw	a0,0(a6)
ffffffffc0205d5c:	6789                	lui	a5,0x2
ffffffffc0205d5e:	08f55b63          	bge	a0,a5,ffffffffc0205df4 <do_fork+0x1fc>
ffffffffc0205d62:	0008b317          	auipc	t1,0x8b
ffffffffc0205d66:	32a30313          	addi	t1,t1,810 # ffffffffc029108c <next_safe.0>
ffffffffc0205d6a:	00032783          	lw	a5,0(t1)
ffffffffc0205d6e:	00090497          	auipc	s1,0x90
ffffffffc0205d72:	a8248493          	addi	s1,s1,-1406 # ffffffffc02957f0 <proc_list>
ffffffffc0205d76:	08f55763          	bge	a0,a5,ffffffffc0205e04 <do_fork+0x20c>
ffffffffc0205d7a:	c048                	sw	a0,4(s0)
ffffffffc0205d7c:	45a9                	li	a1,10
ffffffffc0205d7e:	2501                	sext.w	a0,a0
ffffffffc0205d80:	077050ef          	jal	ra,ffffffffc020b5f6 <hash32>
ffffffffc0205d84:	02051793          	slli	a5,a0,0x20
ffffffffc0205d88:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205d8c:	0008c797          	auipc	a5,0x8c
ffffffffc0205d90:	a6478793          	addi	a5,a5,-1436 # ffffffffc02917f0 <hash_list>
ffffffffc0205d94:	953e                	add	a0,a0,a5
ffffffffc0205d96:	650c                	ld	a1,8(a0)
ffffffffc0205d98:	7014                	ld	a3,32(s0)
ffffffffc0205d9a:	0d840793          	addi	a5,s0,216
ffffffffc0205d9e:	e19c                	sd	a5,0(a1)
ffffffffc0205da0:	6490                	ld	a2,8(s1)
ffffffffc0205da2:	e51c                	sd	a5,8(a0)
ffffffffc0205da4:	7af8                	ld	a4,240(a3)
ffffffffc0205da6:	0c840793          	addi	a5,s0,200
ffffffffc0205daa:	f06c                	sd	a1,224(s0)
ffffffffc0205dac:	ec68                	sd	a0,216(s0)
ffffffffc0205dae:	e21c                	sd	a5,0(a2)
ffffffffc0205db0:	e49c                	sd	a5,8(s1)
ffffffffc0205db2:	e870                	sd	a2,208(s0)
ffffffffc0205db4:	e464                	sd	s1,200(s0)
ffffffffc0205db6:	0e043c23          	sd	zero,248(s0)
ffffffffc0205dba:	10e43023          	sd	a4,256(s0)
ffffffffc0205dbe:	c311                	beqz	a4,ffffffffc0205dc2 <do_fork+0x1ca>
ffffffffc0205dc0:	ff60                	sd	s0,248(a4)
ffffffffc0205dc2:	0009a783          	lw	a5,0(s3)
ffffffffc0205dc6:	8522                	mv	a0,s0
ffffffffc0205dc8:	fae0                	sd	s0,240(a3)
ffffffffc0205dca:	2785                	addiw	a5,a5,1
ffffffffc0205dcc:	00f9a023          	sw	a5,0(s3)
ffffffffc0205dd0:	37b010ef          	jal	ra,ffffffffc020794a <wakeup_proc>
ffffffffc0205dd4:	4048                	lw	a0,4(s0)
ffffffffc0205dd6:	70e6                	ld	ra,120(sp)
ffffffffc0205dd8:	7446                	ld	s0,112(sp)
ffffffffc0205dda:	74a6                	ld	s1,104(sp)
ffffffffc0205ddc:	7906                	ld	s2,96(sp)
ffffffffc0205dde:	69e6                	ld	s3,88(sp)
ffffffffc0205de0:	6a46                	ld	s4,80(sp)
ffffffffc0205de2:	6aa6                	ld	s5,72(sp)
ffffffffc0205de4:	6b06                	ld	s6,64(sp)
ffffffffc0205de6:	7be2                	ld	s7,56(sp)
ffffffffc0205de8:	7c42                	ld	s8,48(sp)
ffffffffc0205dea:	7ca2                	ld	s9,40(sp)
ffffffffc0205dec:	7d02                	ld	s10,32(sp)
ffffffffc0205dee:	6de2                	ld	s11,24(sp)
ffffffffc0205df0:	6109                	addi	sp,sp,128
ffffffffc0205df2:	8082                	ret
ffffffffc0205df4:	4785                	li	a5,1
ffffffffc0205df6:	00f82023          	sw	a5,0(a6)
ffffffffc0205dfa:	4505                	li	a0,1
ffffffffc0205dfc:	0008b317          	auipc	t1,0x8b
ffffffffc0205e00:	29030313          	addi	t1,t1,656 # ffffffffc029108c <next_safe.0>
ffffffffc0205e04:	00090497          	auipc	s1,0x90
ffffffffc0205e08:	9ec48493          	addi	s1,s1,-1556 # ffffffffc02957f0 <proc_list>
ffffffffc0205e0c:	0084be03          	ld	t3,8(s1)
ffffffffc0205e10:	6789                	lui	a5,0x2
ffffffffc0205e12:	00f32023          	sw	a5,0(t1)
ffffffffc0205e16:	86aa                	mv	a3,a0
ffffffffc0205e18:	4581                	li	a1,0
ffffffffc0205e1a:	6e89                	lui	t4,0x2
ffffffffc0205e1c:	129e0763          	beq	t3,s1,ffffffffc0205f4a <do_fork+0x352>
ffffffffc0205e20:	88ae                	mv	a7,a1
ffffffffc0205e22:	87f2                	mv	a5,t3
ffffffffc0205e24:	6609                	lui	a2,0x2
ffffffffc0205e26:	a811                	j	ffffffffc0205e3a <do_fork+0x242>
ffffffffc0205e28:	00e6d663          	bge	a3,a4,ffffffffc0205e34 <do_fork+0x23c>
ffffffffc0205e2c:	00c75463          	bge	a4,a2,ffffffffc0205e34 <do_fork+0x23c>
ffffffffc0205e30:	863a                	mv	a2,a4
ffffffffc0205e32:	4885                	li	a7,1
ffffffffc0205e34:	679c                	ld	a5,8(a5)
ffffffffc0205e36:	00978d63          	beq	a5,s1,ffffffffc0205e50 <do_fork+0x258>
ffffffffc0205e3a:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_bin_swap_img_size-0x5dc4>
ffffffffc0205e3e:	fed715e3          	bne	a4,a3,ffffffffc0205e28 <do_fork+0x230>
ffffffffc0205e42:	2685                	addiw	a3,a3,1
ffffffffc0205e44:	0ec6da63          	bge	a3,a2,ffffffffc0205f38 <do_fork+0x340>
ffffffffc0205e48:	679c                	ld	a5,8(a5)
ffffffffc0205e4a:	4585                	li	a1,1
ffffffffc0205e4c:	fe9797e3          	bne	a5,s1,ffffffffc0205e3a <do_fork+0x242>
ffffffffc0205e50:	c581                	beqz	a1,ffffffffc0205e58 <do_fork+0x260>
ffffffffc0205e52:	00d82023          	sw	a3,0(a6)
ffffffffc0205e56:	8536                	mv	a0,a3
ffffffffc0205e58:	f20881e3          	beqz	a7,ffffffffc0205d7a <do_fork+0x182>
ffffffffc0205e5c:	00c32023          	sw	a2,0(t1)
ffffffffc0205e60:	bf29                	j	ffffffffc0205d7a <do_fork+0x182>
ffffffffc0205e62:	8a36                	mv	s4,a3
ffffffffc0205e64:	bd5d                	j	ffffffffc0205d1a <do_fork+0x122>
ffffffffc0205e66:	bf8ff0ef          	jal	ra,ffffffffc020525e <files_create>
ffffffffc0205e6a:	892a                	mv	s2,a0
ffffffffc0205e6c:	c911                	beqz	a0,ffffffffc0205e80 <do_fork+0x288>
ffffffffc0205e6e:	85a6                	mv	a1,s1
ffffffffc0205e70:	d26ff0ef          	jal	ra,ffffffffc0205396 <dup_files>
ffffffffc0205e74:	84ca                	mv	s1,s2
ffffffffc0205e76:	ec0504e3          	beqz	a0,ffffffffc0205d3e <do_fork+0x146>
ffffffffc0205e7a:	854a                	mv	a0,s2
ffffffffc0205e7c:	c18ff0ef          	jal	ra,ffffffffc0205294 <files_destroy>
ffffffffc0205e80:	6814                	ld	a3,16(s0)
ffffffffc0205e82:	c02007b7          	lui	a5,0xc0200
ffffffffc0205e86:	10f6e463          	bltu	a3,a5,ffffffffc0205f8e <do_fork+0x396>
ffffffffc0205e8a:	000c3783          	ld	a5,0(s8)
ffffffffc0205e8e:	000b3703          	ld	a4,0(s6)
ffffffffc0205e92:	40f687b3          	sub	a5,a3,a5
ffffffffc0205e96:	83b1                	srli	a5,a5,0xc
ffffffffc0205e98:	10e7f763          	bgeu	a5,a4,ffffffffc0205fa6 <do_fork+0x3ae>
ffffffffc0205e9c:	000bb503          	ld	a0,0(s7)
ffffffffc0205ea0:	415787b3          	sub	a5,a5,s5
ffffffffc0205ea4:	079a                	slli	a5,a5,0x6
ffffffffc0205ea6:	4589                	li	a1,2
ffffffffc0205ea8:	953e                	add	a0,a0,a5
ffffffffc0205eaa:	b8cfc0ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc0205eae:	8522                	mv	a0,s0
ffffffffc0205eb0:	a1afc0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc0205eb4:	5571                	li	a0,-4
ffffffffc0205eb6:	b705                	j	ffffffffc0205dd6 <do_fork+0x1de>
ffffffffc0205eb8:	de1fd0ef          	jal	ra,ffffffffc0203c98 <mm_create>
ffffffffc0205ebc:	e02a                	sd	a0,0(sp)
ffffffffc0205ebe:	d169                	beqz	a0,ffffffffc0205e80 <do_fork+0x288>
ffffffffc0205ec0:	4505                	li	a0,1
ffffffffc0205ec2:	b36fc0ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc0205ec6:	cd35                	beqz	a0,ffffffffc0205f42 <do_fork+0x34a>
ffffffffc0205ec8:	000bb683          	ld	a3,0(s7)
ffffffffc0205ecc:	000b3703          	ld	a4,0(s6)
ffffffffc0205ed0:	40d506b3          	sub	a3,a0,a3
ffffffffc0205ed4:	8699                	srai	a3,a3,0x6
ffffffffc0205ed6:	96d6                	add	a3,a3,s5
ffffffffc0205ed8:	0196fcb3          	and	s9,a3,s9
ffffffffc0205edc:	06b2                	slli	a3,a3,0xc
ffffffffc0205ede:	10ecf063          	bgeu	s9,a4,ffffffffc0205fde <do_fork+0x3e6>
ffffffffc0205ee2:	000c3c83          	ld	s9,0(s8)
ffffffffc0205ee6:	6605                	lui	a2,0x1
ffffffffc0205ee8:	00091597          	auipc	a1,0x91
ffffffffc0205eec:	9e05b583          	ld	a1,-1568(a1) # ffffffffc02968c8 <boot_pgdir_va>
ffffffffc0205ef0:	9cb6                	add	s9,s9,a3
ffffffffc0205ef2:	8566                	mv	a0,s9
ffffffffc0205ef4:	489050ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc0205ef8:	6782                	ld	a5,0(sp)
ffffffffc0205efa:	038d0713          	addi	a4,s10,56
ffffffffc0205efe:	853a                	mv	a0,a4
ffffffffc0205f00:	0197bc23          	sd	s9,24(a5) # ffffffffc0200018 <kern_entry+0x18>
ffffffffc0205f04:	e43a                	sd	a4,8(sp)
ffffffffc0205f06:	eeefe0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc0205f0a:	000db683          	ld	a3,0(s11)
ffffffffc0205f0e:	6722                	ld	a4,8(sp)
ffffffffc0205f10:	c681                	beqz	a3,ffffffffc0205f18 <do_fork+0x320>
ffffffffc0205f12:	42d4                	lw	a3,4(a3)
ffffffffc0205f14:	04dd2823          	sw	a3,80(s10)
ffffffffc0205f18:	6502                	ld	a0,0(sp)
ffffffffc0205f1a:	85ea                	mv	a1,s10
ffffffffc0205f1c:	e43a                	sd	a4,8(sp)
ffffffffc0205f1e:	fcbfd0ef          	jal	ra,ffffffffc0203ee8 <dup_mmap>
ffffffffc0205f22:	6722                	ld	a4,8(sp)
ffffffffc0205f24:	8caa                	mv	s9,a0
ffffffffc0205f26:	853a                	mv	a0,a4
ffffffffc0205f28:	ec8fe0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0205f2c:	040d2823          	sw	zero,80(s10)
ffffffffc0205f30:	020c9763          	bnez	s9,ffffffffc0205f5e <do_fork+0x366>
ffffffffc0205f34:	6d02                	ld	s10,0(sp)
ffffffffc0205f36:	b361                	j	ffffffffc0205cbe <do_fork+0xc6>
ffffffffc0205f38:	01d6c363          	blt	a3,t4,ffffffffc0205f3e <do_fork+0x346>
ffffffffc0205f3c:	4685                	li	a3,1
ffffffffc0205f3e:	4585                	li	a1,1
ffffffffc0205f40:	bdf1                	j	ffffffffc0205e1c <do_fork+0x224>
ffffffffc0205f42:	6502                	ld	a0,0(sp)
ffffffffc0205f44:	ea3fd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0205f48:	bf25                	j	ffffffffc0205e80 <do_fork+0x288>
ffffffffc0205f4a:	c599                	beqz	a1,ffffffffc0205f58 <do_fork+0x360>
ffffffffc0205f4c:	00d82023          	sw	a3,0(a6)
ffffffffc0205f50:	8536                	mv	a0,a3
ffffffffc0205f52:	b525                	j	ffffffffc0205d7a <do_fork+0x182>
ffffffffc0205f54:	556d                	li	a0,-5
ffffffffc0205f56:	b541                	j	ffffffffc0205dd6 <do_fork+0x1de>
ffffffffc0205f58:	00082503          	lw	a0,0(a6)
ffffffffc0205f5c:	bd39                	j	ffffffffc0205d7a <do_fork+0x182>
ffffffffc0205f5e:	6482                	ld	s1,0(sp)
ffffffffc0205f60:	8526                	mv	a0,s1
ffffffffc0205f62:	820fe0ef          	jal	ra,ffffffffc0203f82 <exit_mmap>
ffffffffc0205f66:	6c88                	ld	a0,24(s1)
ffffffffc0205f68:	babff0ef          	jal	ra,ffffffffc0205b12 <put_pgdir.isra.0>
ffffffffc0205f6c:	8526                	mv	a0,s1
ffffffffc0205f6e:	e79fd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0205f72:	b739                	j	ffffffffc0205e80 <do_fork+0x288>
ffffffffc0205f74:	86ba                	mv	a3,a4
ffffffffc0205f76:	00007617          	auipc	a2,0x7
ffffffffc0205f7a:	c6260613          	addi	a2,a2,-926 # ffffffffc020cbd8 <default_pmm_manager+0xe0>
ffffffffc0205f7e:	1c600593          	li	a1,454
ffffffffc0205f82:	00008517          	auipc	a0,0x8
ffffffffc0205f86:	b8e50513          	addi	a0,a0,-1138 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0205f8a:	d14fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f8e:	00007617          	auipc	a2,0x7
ffffffffc0205f92:	c4a60613          	addi	a2,a2,-950 # ffffffffc020cbd8 <default_pmm_manager+0xe0>
ffffffffc0205f96:	07700593          	li	a1,119
ffffffffc0205f9a:	00007517          	auipc	a0,0x7
ffffffffc0205f9e:	bbe50513          	addi	a0,a0,-1090 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc0205fa2:	cfcfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205fa6:	00007617          	auipc	a2,0x7
ffffffffc0205faa:	c5a60613          	addi	a2,a2,-934 # ffffffffc020cc00 <default_pmm_manager+0x108>
ffffffffc0205fae:	06900593          	li	a1,105
ffffffffc0205fb2:	00007517          	auipc	a0,0x7
ffffffffc0205fb6:	ba650513          	addi	a0,a0,-1114 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc0205fba:	ce4fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205fbe:	00008697          	auipc	a3,0x8
ffffffffc0205fc2:	b6a68693          	addi	a3,a3,-1174 # ffffffffc020db28 <CSWTCH.79+0x108>
ffffffffc0205fc6:	00006617          	auipc	a2,0x6
ffffffffc0205fca:	04a60613          	addi	a2,a2,74 # ffffffffc020c010 <commands+0x210>
ffffffffc0205fce:	1e600593          	li	a1,486
ffffffffc0205fd2:	00008517          	auipc	a0,0x8
ffffffffc0205fd6:	b3e50513          	addi	a0,a0,-1218 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0205fda:	cc4fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205fde:	00007617          	auipc	a2,0x7
ffffffffc0205fe2:	b5260613          	addi	a2,a2,-1198 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc0205fe6:	07100593          	li	a1,113
ffffffffc0205fea:	00007517          	auipc	a0,0x7
ffffffffc0205fee:	b6e50513          	addi	a0,a0,-1170 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc0205ff2:	cacfa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205ff6 <kernel_thread>:
ffffffffc0205ff6:	7129                	addi	sp,sp,-320
ffffffffc0205ff8:	fa22                	sd	s0,304(sp)
ffffffffc0205ffa:	f626                	sd	s1,296(sp)
ffffffffc0205ffc:	f24a                	sd	s2,288(sp)
ffffffffc0205ffe:	84ae                	mv	s1,a1
ffffffffc0206000:	892a                	mv	s2,a0
ffffffffc0206002:	8432                	mv	s0,a2
ffffffffc0206004:	4581                	li	a1,0
ffffffffc0206006:	12000613          	li	a2,288
ffffffffc020600a:	850a                	mv	a0,sp
ffffffffc020600c:	fe06                	sd	ra,312(sp)
ffffffffc020600e:	31d050ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0206012:	e0ca                	sd	s2,64(sp)
ffffffffc0206014:	e4a6                	sd	s1,72(sp)
ffffffffc0206016:	100027f3          	csrr	a5,sstatus
ffffffffc020601a:	edd7f793          	andi	a5,a5,-291
ffffffffc020601e:	1207e793          	ori	a5,a5,288
ffffffffc0206022:	e23e                	sd	a5,256(sp)
ffffffffc0206024:	860a                	mv	a2,sp
ffffffffc0206026:	10046513          	ori	a0,s0,256
ffffffffc020602a:	00000797          	auipc	a5,0x0
ffffffffc020602e:	a3278793          	addi	a5,a5,-1486 # ffffffffc0205a5c <kernel_thread_entry>
ffffffffc0206032:	4581                	li	a1,0
ffffffffc0206034:	e63e                	sd	a5,264(sp)
ffffffffc0206036:	bc3ff0ef          	jal	ra,ffffffffc0205bf8 <do_fork>
ffffffffc020603a:	70f2                	ld	ra,312(sp)
ffffffffc020603c:	7452                	ld	s0,304(sp)
ffffffffc020603e:	74b2                	ld	s1,296(sp)
ffffffffc0206040:	7912                	ld	s2,288(sp)
ffffffffc0206042:	6131                	addi	sp,sp,320
ffffffffc0206044:	8082                	ret

ffffffffc0206046 <do_exit>:
ffffffffc0206046:	7179                	addi	sp,sp,-48
ffffffffc0206048:	f022                	sd	s0,32(sp)
ffffffffc020604a:	00091417          	auipc	s0,0x91
ffffffffc020604e:	8a640413          	addi	s0,s0,-1882 # ffffffffc02968f0 <current>
ffffffffc0206052:	601c                	ld	a5,0(s0)
ffffffffc0206054:	f406                	sd	ra,40(sp)
ffffffffc0206056:	ec26                	sd	s1,24(sp)
ffffffffc0206058:	e84a                	sd	s2,16(sp)
ffffffffc020605a:	e44e                	sd	s3,8(sp)
ffffffffc020605c:	e052                	sd	s4,0(sp)
ffffffffc020605e:	00091717          	auipc	a4,0x91
ffffffffc0206062:	89a73703          	ld	a4,-1894(a4) # ffffffffc02968f8 <idleproc>
ffffffffc0206066:	10e78863          	beq	a5,a4,ffffffffc0206176 <do_exit+0x130>
ffffffffc020606a:	00091917          	auipc	s2,0x91
ffffffffc020606e:	89690913          	addi	s2,s2,-1898 # ffffffffc0296900 <initproc>
ffffffffc0206072:	00093703          	ld	a4,0(s2)
ffffffffc0206076:	12e78763          	beq	a5,a4,ffffffffc02061a4 <do_exit+0x15e>
ffffffffc020607a:	0287b983          	ld	s3,40(a5)
ffffffffc020607e:	84aa                	mv	s1,a0
ffffffffc0206080:	04098163          	beqz	s3,ffffffffc02060c2 <do_exit+0x7c>
ffffffffc0206084:	00091797          	auipc	a5,0x91
ffffffffc0206088:	83c7b783          	ld	a5,-1988(a5) # ffffffffc02968c0 <boot_pgdir_pa>
ffffffffc020608c:	577d                	li	a4,-1
ffffffffc020608e:	177e                	slli	a4,a4,0x3f
ffffffffc0206090:	83b1                	srli	a5,a5,0xc
ffffffffc0206092:	8fd9                	or	a5,a5,a4
ffffffffc0206094:	18079073          	csrw	satp,a5
ffffffffc0206098:	12000073          	sfence.vma
ffffffffc020609c:	0309a783          	lw	a5,48(s3)
ffffffffc02060a0:	fff7871b          	addiw	a4,a5,-1
ffffffffc02060a4:	02e9a823          	sw	a4,48(s3)
ffffffffc02060a8:	0e070363          	beqz	a4,ffffffffc020618e <do_exit+0x148>
ffffffffc02060ac:	601c                	ld	a5,0(s0)
ffffffffc02060ae:	1507b503          	ld	a0,336(a5)
ffffffffc02060b2:	0207b423          	sd	zero,40(a5)
ffffffffc02060b6:	c511                	beqz	a0,ffffffffc02060c2 <do_exit+0x7c>
ffffffffc02060b8:	491c                	lw	a5,16(a0)
ffffffffc02060ba:	fff7871b          	addiw	a4,a5,-1
ffffffffc02060be:	c918                	sw	a4,16(a0)
ffffffffc02060c0:	cb45                	beqz	a4,ffffffffc0206170 <do_exit+0x12a>
ffffffffc02060c2:	601c                	ld	a5,0(s0)
ffffffffc02060c4:	470d                	li	a4,3
ffffffffc02060c6:	c398                	sw	a4,0(a5)
ffffffffc02060c8:	0e97a423          	sw	s1,232(a5)
ffffffffc02060cc:	100027f3          	csrr	a5,sstatus
ffffffffc02060d0:	8b89                	andi	a5,a5,2
ffffffffc02060d2:	4481                	li	s1,0
ffffffffc02060d4:	0e079463          	bnez	a5,ffffffffc02061bc <do_exit+0x176>
ffffffffc02060d8:	601c                	ld	a5,0(s0)
ffffffffc02060da:	80000737          	lui	a4,0x80000
ffffffffc02060de:	0705                	addi	a4,a4,1
ffffffffc02060e0:	7388                	ld	a0,32(a5)
ffffffffc02060e2:	0ec52783          	lw	a5,236(a0)
ffffffffc02060e6:	8ff9                	and	a5,a5,a4
ffffffffc02060e8:	2781                	sext.w	a5,a5
ffffffffc02060ea:	e3c1                	bnez	a5,ffffffffc020616a <do_exit+0x124>
ffffffffc02060ec:	6010                	ld	a2,0(s0)
ffffffffc02060ee:	80000a37          	lui	s4,0x80000
ffffffffc02060f2:	498d                	li	s3,3
ffffffffc02060f4:	7a7c                	ld	a5,240(a2)
ffffffffc02060f6:	0a05                	addi	s4,s4,1
ffffffffc02060f8:	cb95                	beqz	a5,ffffffffc020612c <do_exit+0xe6>
ffffffffc02060fa:	1007b703          	ld	a4,256(a5)
ffffffffc02060fe:	7ff4                	ld	a3,248(a5)
ffffffffc0206100:	c311                	beqz	a4,ffffffffc0206104 <do_exit+0xbe>
ffffffffc0206102:	ff74                	sd	a3,248(a4)
ffffffffc0206104:	ceb1                	beqz	a3,ffffffffc0206160 <do_exit+0x11a>
ffffffffc0206106:	10e6b023          	sd	a4,256(a3)
ffffffffc020610a:	00093503          	ld	a0,0(s2)
ffffffffc020610e:	0e07bc23          	sd	zero,248(a5)
ffffffffc0206112:	7978                	ld	a4,240(a0)
ffffffffc0206114:	10e7b023          	sd	a4,256(a5)
ffffffffc0206118:	c311                	beqz	a4,ffffffffc020611c <do_exit+0xd6>
ffffffffc020611a:	ff7c                	sd	a5,248(a4)
ffffffffc020611c:	4398                	lw	a4,0(a5)
ffffffffc020611e:	f388                	sd	a0,32(a5)
ffffffffc0206120:	f97c                	sd	a5,240(a0)
ffffffffc0206122:	03370663          	beq	a4,s3,ffffffffc020614e <do_exit+0x108>
ffffffffc0206126:	6010                	ld	a2,0(s0)
ffffffffc0206128:	7a7c                	ld	a5,240(a2)
ffffffffc020612a:	fbe1                	bnez	a5,ffffffffc02060fa <do_exit+0xb4>
ffffffffc020612c:	ec85                	bnez	s1,ffffffffc0206164 <do_exit+0x11e>
ffffffffc020612e:	0cf010ef          	jal	ra,ffffffffc02079fc <schedule>
ffffffffc0206132:	601c                	ld	a5,0(s0)
ffffffffc0206134:	00008617          	auipc	a2,0x8
ffffffffc0206138:	a2c60613          	addi	a2,a2,-1492 # ffffffffc020db60 <CSWTCH.79+0x140>
ffffffffc020613c:	2cc00593          	li	a1,716
ffffffffc0206140:	43d4                	lw	a3,4(a5)
ffffffffc0206142:	00008517          	auipc	a0,0x8
ffffffffc0206146:	9ce50513          	addi	a0,a0,-1586 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc020614a:	b54fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020614e:	0ec52783          	lw	a5,236(a0)
ffffffffc0206152:	0147f7b3          	and	a5,a5,s4
ffffffffc0206156:	2781                	sext.w	a5,a5
ffffffffc0206158:	d7f9                	beqz	a5,ffffffffc0206126 <do_exit+0xe0>
ffffffffc020615a:	7f0010ef          	jal	ra,ffffffffc020794a <wakeup_proc>
ffffffffc020615e:	b7e1                	j	ffffffffc0206126 <do_exit+0xe0>
ffffffffc0206160:	fa78                	sd	a4,240(a2)
ffffffffc0206162:	b765                	j	ffffffffc020610a <do_exit+0xc4>
ffffffffc0206164:	b09fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0206168:	b7d9                	j	ffffffffc020612e <do_exit+0xe8>
ffffffffc020616a:	7e0010ef          	jal	ra,ffffffffc020794a <wakeup_proc>
ffffffffc020616e:	bfbd                	j	ffffffffc02060ec <do_exit+0xa6>
ffffffffc0206170:	924ff0ef          	jal	ra,ffffffffc0205294 <files_destroy>
ffffffffc0206174:	b7b9                	j	ffffffffc02060c2 <do_exit+0x7c>
ffffffffc0206176:	00008617          	auipc	a2,0x8
ffffffffc020617a:	9ca60613          	addi	a2,a2,-1590 # ffffffffc020db40 <CSWTCH.79+0x120>
ffffffffc020617e:	28300593          	li	a1,643
ffffffffc0206182:	00008517          	auipc	a0,0x8
ffffffffc0206186:	98e50513          	addi	a0,a0,-1650 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc020618a:	b14fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020618e:	854e                	mv	a0,s3
ffffffffc0206190:	df3fd0ef          	jal	ra,ffffffffc0203f82 <exit_mmap>
ffffffffc0206194:	0189b503          	ld	a0,24(s3)
ffffffffc0206198:	97bff0ef          	jal	ra,ffffffffc0205b12 <put_pgdir.isra.0>
ffffffffc020619c:	854e                	mv	a0,s3
ffffffffc020619e:	c49fd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc02061a2:	b729                	j	ffffffffc02060ac <do_exit+0x66>
ffffffffc02061a4:	00008617          	auipc	a2,0x8
ffffffffc02061a8:	9ac60613          	addi	a2,a2,-1620 # ffffffffc020db50 <CSWTCH.79+0x130>
ffffffffc02061ac:	28700593          	li	a1,647
ffffffffc02061b0:	00008517          	auipc	a0,0x8
ffffffffc02061b4:	96050513          	addi	a0,a0,-1696 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc02061b8:	ae6fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02061bc:	ab7fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02061c0:	4485                	li	s1,1
ffffffffc02061c2:	bf19                	j	ffffffffc02060d8 <do_exit+0x92>

ffffffffc02061c4 <do_wait.part.0>:
ffffffffc02061c4:	715d                	addi	sp,sp,-80
ffffffffc02061c6:	f84a                	sd	s2,48(sp)
ffffffffc02061c8:	f44e                	sd	s3,40(sp)
ffffffffc02061ca:	80000937          	lui	s2,0x80000
ffffffffc02061ce:	6989                	lui	s3,0x2
ffffffffc02061d0:	fc26                	sd	s1,56(sp)
ffffffffc02061d2:	f052                	sd	s4,32(sp)
ffffffffc02061d4:	ec56                	sd	s5,24(sp)
ffffffffc02061d6:	e85a                	sd	s6,16(sp)
ffffffffc02061d8:	e45e                	sd	s7,8(sp)
ffffffffc02061da:	e486                	sd	ra,72(sp)
ffffffffc02061dc:	e0a2                	sd	s0,64(sp)
ffffffffc02061de:	84aa                	mv	s1,a0
ffffffffc02061e0:	8a2e                	mv	s4,a1
ffffffffc02061e2:	00090b97          	auipc	s7,0x90
ffffffffc02061e6:	70eb8b93          	addi	s7,s7,1806 # ffffffffc02968f0 <current>
ffffffffc02061ea:	00050b1b          	sext.w	s6,a0
ffffffffc02061ee:	fff50a9b          	addiw	s5,a0,-1
ffffffffc02061f2:	19f9                	addi	s3,s3,-2
ffffffffc02061f4:	0905                	addi	s2,s2,1
ffffffffc02061f6:	ccbd                	beqz	s1,ffffffffc0206274 <do_wait.part.0+0xb0>
ffffffffc02061f8:	0359e863          	bltu	s3,s5,ffffffffc0206228 <do_wait.part.0+0x64>
ffffffffc02061fc:	45a9                	li	a1,10
ffffffffc02061fe:	855a                	mv	a0,s6
ffffffffc0206200:	3f6050ef          	jal	ra,ffffffffc020b5f6 <hash32>
ffffffffc0206204:	02051793          	slli	a5,a0,0x20
ffffffffc0206208:	01c7d513          	srli	a0,a5,0x1c
ffffffffc020620c:	0008b797          	auipc	a5,0x8b
ffffffffc0206210:	5e478793          	addi	a5,a5,1508 # ffffffffc02917f0 <hash_list>
ffffffffc0206214:	953e                	add	a0,a0,a5
ffffffffc0206216:	842a                	mv	s0,a0
ffffffffc0206218:	a029                	j	ffffffffc0206222 <do_wait.part.0+0x5e>
ffffffffc020621a:	f2c42783          	lw	a5,-212(s0)
ffffffffc020621e:	02978163          	beq	a5,s1,ffffffffc0206240 <do_wait.part.0+0x7c>
ffffffffc0206222:	6400                	ld	s0,8(s0)
ffffffffc0206224:	fe851be3          	bne	a0,s0,ffffffffc020621a <do_wait.part.0+0x56>
ffffffffc0206228:	5579                	li	a0,-2
ffffffffc020622a:	60a6                	ld	ra,72(sp)
ffffffffc020622c:	6406                	ld	s0,64(sp)
ffffffffc020622e:	74e2                	ld	s1,56(sp)
ffffffffc0206230:	7942                	ld	s2,48(sp)
ffffffffc0206232:	79a2                	ld	s3,40(sp)
ffffffffc0206234:	7a02                	ld	s4,32(sp)
ffffffffc0206236:	6ae2                	ld	s5,24(sp)
ffffffffc0206238:	6b42                	ld	s6,16(sp)
ffffffffc020623a:	6ba2                	ld	s7,8(sp)
ffffffffc020623c:	6161                	addi	sp,sp,80
ffffffffc020623e:	8082                	ret
ffffffffc0206240:	000bb683          	ld	a3,0(s7)
ffffffffc0206244:	f4843783          	ld	a5,-184(s0)
ffffffffc0206248:	fed790e3          	bne	a5,a3,ffffffffc0206228 <do_wait.part.0+0x64>
ffffffffc020624c:	f2842703          	lw	a4,-216(s0)
ffffffffc0206250:	478d                	li	a5,3
ffffffffc0206252:	10f70563          	beq	a4,a5,ffffffffc020635c <do_wait.part.0+0x198>
ffffffffc0206256:	4785                	li	a5,1
ffffffffc0206258:	c29c                	sw	a5,0(a3)
ffffffffc020625a:	0f26a623          	sw	s2,236(a3)
ffffffffc020625e:	79e010ef          	jal	ra,ffffffffc02079fc <schedule>
ffffffffc0206262:	000bb783          	ld	a5,0(s7)
ffffffffc0206266:	0b07a783          	lw	a5,176(a5)
ffffffffc020626a:	8b85                	andi	a5,a5,1
ffffffffc020626c:	d7c9                	beqz	a5,ffffffffc02061f6 <do_wait.part.0+0x32>
ffffffffc020626e:	555d                	li	a0,-9
ffffffffc0206270:	dd7ff0ef          	jal	ra,ffffffffc0206046 <do_exit>
ffffffffc0206274:	000bb683          	ld	a3,0(s7)
ffffffffc0206278:	7ae0                	ld	s0,240(a3)
ffffffffc020627a:	d45d                	beqz	s0,ffffffffc0206228 <do_wait.part.0+0x64>
ffffffffc020627c:	470d                	li	a4,3
ffffffffc020627e:	a021                	j	ffffffffc0206286 <do_wait.part.0+0xc2>
ffffffffc0206280:	10043403          	ld	s0,256(s0)
ffffffffc0206284:	d869                	beqz	s0,ffffffffc0206256 <do_wait.part.0+0x92>
ffffffffc0206286:	401c                	lw	a5,0(s0)
ffffffffc0206288:	fee79ce3          	bne	a5,a4,ffffffffc0206280 <do_wait.part.0+0xbc>
ffffffffc020628c:	00090797          	auipc	a5,0x90
ffffffffc0206290:	66c7b783          	ld	a5,1644(a5) # ffffffffc02968f8 <idleproc>
ffffffffc0206294:	0e878363          	beq	a5,s0,ffffffffc020637a <do_wait.part.0+0x1b6>
ffffffffc0206298:	00090797          	auipc	a5,0x90
ffffffffc020629c:	6687b783          	ld	a5,1640(a5) # ffffffffc0296900 <initproc>
ffffffffc02062a0:	0cf40d63          	beq	s0,a5,ffffffffc020637a <do_wait.part.0+0x1b6>
ffffffffc02062a4:	000a0663          	beqz	s4,ffffffffc02062b0 <do_wait.part.0+0xec>
ffffffffc02062a8:	0e842783          	lw	a5,232(s0)
ffffffffc02062ac:	00fa2023          	sw	a5,0(s4) # ffffffff80000000 <_binary_bin_sfs_img_size+0xffffffff7ff8ad00>
ffffffffc02062b0:	100027f3          	csrr	a5,sstatus
ffffffffc02062b4:	8b89                	andi	a5,a5,2
ffffffffc02062b6:	4581                	li	a1,0
ffffffffc02062b8:	efd1                	bnez	a5,ffffffffc0206354 <do_wait.part.0+0x190>
ffffffffc02062ba:	6c70                	ld	a2,216(s0)
ffffffffc02062bc:	7074                	ld	a3,224(s0)
ffffffffc02062be:	10043703          	ld	a4,256(s0)
ffffffffc02062c2:	7c7c                	ld	a5,248(s0)
ffffffffc02062c4:	e614                	sd	a3,8(a2)
ffffffffc02062c6:	e290                	sd	a2,0(a3)
ffffffffc02062c8:	6470                	ld	a2,200(s0)
ffffffffc02062ca:	6874                	ld	a3,208(s0)
ffffffffc02062cc:	e614                	sd	a3,8(a2)
ffffffffc02062ce:	e290                	sd	a2,0(a3)
ffffffffc02062d0:	c319                	beqz	a4,ffffffffc02062d6 <do_wait.part.0+0x112>
ffffffffc02062d2:	ff7c                	sd	a5,248(a4)
ffffffffc02062d4:	7c7c                	ld	a5,248(s0)
ffffffffc02062d6:	cfa5                	beqz	a5,ffffffffc020634e <do_wait.part.0+0x18a>
ffffffffc02062d8:	10e7b023          	sd	a4,256(a5)
ffffffffc02062dc:	00090717          	auipc	a4,0x90
ffffffffc02062e0:	62c70713          	addi	a4,a4,1580 # ffffffffc0296908 <nr_process>
ffffffffc02062e4:	431c                	lw	a5,0(a4)
ffffffffc02062e6:	0e043c23          	sd	zero,248(s0)
ffffffffc02062ea:	10043023          	sd	zero,256(s0)
ffffffffc02062ee:	37fd                	addiw	a5,a5,-1
ffffffffc02062f0:	c31c                	sw	a5,0(a4)
ffffffffc02062f2:	02043023          	sd	zero,32(s0)
ffffffffc02062f6:	e9a9                	bnez	a1,ffffffffc0206348 <do_wait.part.0+0x184>
ffffffffc02062f8:	000bb703          	ld	a4,0(s7)
ffffffffc02062fc:	6814                	ld	a3,16(s0)
ffffffffc02062fe:	c02007b7          	lui	a5,0xc0200
ffffffffc0206302:	0e072623          	sw	zero,236(a4)
ffffffffc0206306:	04f6ee63          	bltu	a3,a5,ffffffffc0206362 <do_wait.part.0+0x19e>
ffffffffc020630a:	00090797          	auipc	a5,0x90
ffffffffc020630e:	5de7b783          	ld	a5,1502(a5) # ffffffffc02968e8 <va_pa_offset>
ffffffffc0206312:	8e9d                	sub	a3,a3,a5
ffffffffc0206314:	82b1                	srli	a3,a3,0xc
ffffffffc0206316:	00090797          	auipc	a5,0x90
ffffffffc020631a:	5ba7b783          	ld	a5,1466(a5) # ffffffffc02968d0 <npage>
ffffffffc020631e:	06f6fa63          	bgeu	a3,a5,ffffffffc0206392 <do_wait.part.0+0x1ce>
ffffffffc0206322:	0000a517          	auipc	a0,0xa
ffffffffc0206326:	b8e53503          	ld	a0,-1138(a0) # ffffffffc020feb0 <nbase>
ffffffffc020632a:	8e89                	sub	a3,a3,a0
ffffffffc020632c:	069a                	slli	a3,a3,0x6
ffffffffc020632e:	00090517          	auipc	a0,0x90
ffffffffc0206332:	5aa53503          	ld	a0,1450(a0) # ffffffffc02968d8 <pages>
ffffffffc0206336:	9536                	add	a0,a0,a3
ffffffffc0206338:	4589                	li	a1,2
ffffffffc020633a:	efdfb0ef          	jal	ra,ffffffffc0202236 <free_pages>
ffffffffc020633e:	8522                	mv	a0,s0
ffffffffc0206340:	d8bfb0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc0206344:	4501                	li	a0,0
ffffffffc0206346:	b5d5                	j	ffffffffc020622a <do_wait.part.0+0x66>
ffffffffc0206348:	925fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020634c:	b775                	j	ffffffffc02062f8 <do_wait.part.0+0x134>
ffffffffc020634e:	701c                	ld	a5,32(s0)
ffffffffc0206350:	fbf8                	sd	a4,240(a5)
ffffffffc0206352:	b769                	j	ffffffffc02062dc <do_wait.part.0+0x118>
ffffffffc0206354:	91ffa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0206358:	4585                	li	a1,1
ffffffffc020635a:	b785                	j	ffffffffc02062ba <do_wait.part.0+0xf6>
ffffffffc020635c:	f2840413          	addi	s0,s0,-216
ffffffffc0206360:	b735                	j	ffffffffc020628c <do_wait.part.0+0xc8>
ffffffffc0206362:	00007617          	auipc	a2,0x7
ffffffffc0206366:	87660613          	addi	a2,a2,-1930 # ffffffffc020cbd8 <default_pmm_manager+0xe0>
ffffffffc020636a:	07700593          	li	a1,119
ffffffffc020636e:	00006517          	auipc	a0,0x6
ffffffffc0206372:	7ea50513          	addi	a0,a0,2026 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc0206376:	928fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020637a:	00008617          	auipc	a2,0x8
ffffffffc020637e:	80660613          	addi	a2,a2,-2042 # ffffffffc020db80 <CSWTCH.79+0x160>
ffffffffc0206382:	45100593          	li	a1,1105
ffffffffc0206386:	00007517          	auipc	a0,0x7
ffffffffc020638a:	78a50513          	addi	a0,a0,1930 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc020638e:	910fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206392:	00007617          	auipc	a2,0x7
ffffffffc0206396:	86e60613          	addi	a2,a2,-1938 # ffffffffc020cc00 <default_pmm_manager+0x108>
ffffffffc020639a:	06900593          	li	a1,105
ffffffffc020639e:	00006517          	auipc	a0,0x6
ffffffffc02063a2:	7ba50513          	addi	a0,a0,1978 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc02063a6:	8f8fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02063aa <init_main>:
ffffffffc02063aa:	1141                	addi	sp,sp,-16
ffffffffc02063ac:	00007517          	auipc	a0,0x7
ffffffffc02063b0:	7f450513          	addi	a0,a0,2036 # ffffffffc020dba0 <CSWTCH.79+0x180>
ffffffffc02063b4:	e406                	sd	ra,8(sp)
ffffffffc02063b6:	5b7010ef          	jal	ra,ffffffffc020816c <vfs_set_bootfs>
ffffffffc02063ba:	e179                	bnez	a0,ffffffffc0206480 <init_main+0xd6>
ffffffffc02063bc:	ebbfb0ef          	jal	ra,ffffffffc0202276 <nr_free_pages>
ffffffffc02063c0:	c57fb0ef          	jal	ra,ffffffffc0202016 <kallocated>
ffffffffc02063c4:	4601                	li	a2,0
ffffffffc02063c6:	4581                	li	a1,0
ffffffffc02063c8:	00001517          	auipc	a0,0x1
ffffffffc02063cc:	93e50513          	addi	a0,a0,-1730 # ffffffffc0206d06 <user_main>
ffffffffc02063d0:	c27ff0ef          	jal	ra,ffffffffc0205ff6 <kernel_thread>
ffffffffc02063d4:	00a04563          	bgtz	a0,ffffffffc02063de <init_main+0x34>
ffffffffc02063d8:	a841                	j	ffffffffc0206468 <init_main+0xbe>
ffffffffc02063da:	622010ef          	jal	ra,ffffffffc02079fc <schedule>
ffffffffc02063de:	4581                	li	a1,0
ffffffffc02063e0:	4501                	li	a0,0
ffffffffc02063e2:	de3ff0ef          	jal	ra,ffffffffc02061c4 <do_wait.part.0>
ffffffffc02063e6:	d975                	beqz	a0,ffffffffc02063da <init_main+0x30>
ffffffffc02063e8:	e67fe0ef          	jal	ra,ffffffffc020524e <fs_cleanup>
ffffffffc02063ec:	00007517          	auipc	a0,0x7
ffffffffc02063f0:	7fc50513          	addi	a0,a0,2044 # ffffffffc020dbe8 <CSWTCH.79+0x1c8>
ffffffffc02063f4:	db3f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02063f8:	00090797          	auipc	a5,0x90
ffffffffc02063fc:	5087b783          	ld	a5,1288(a5) # ffffffffc0296900 <initproc>
ffffffffc0206400:	7bf8                	ld	a4,240(a5)
ffffffffc0206402:	e339                	bnez	a4,ffffffffc0206448 <init_main+0x9e>
ffffffffc0206404:	7ff8                	ld	a4,248(a5)
ffffffffc0206406:	e329                	bnez	a4,ffffffffc0206448 <init_main+0x9e>
ffffffffc0206408:	1007b703          	ld	a4,256(a5)
ffffffffc020640c:	ef15                	bnez	a4,ffffffffc0206448 <init_main+0x9e>
ffffffffc020640e:	00090697          	auipc	a3,0x90
ffffffffc0206412:	4fa6a683          	lw	a3,1274(a3) # ffffffffc0296908 <nr_process>
ffffffffc0206416:	4709                	li	a4,2
ffffffffc0206418:	0ce69163          	bne	a3,a4,ffffffffc02064da <init_main+0x130>
ffffffffc020641c:	0008f717          	auipc	a4,0x8f
ffffffffc0206420:	3d470713          	addi	a4,a4,980 # ffffffffc02957f0 <proc_list>
ffffffffc0206424:	6714                	ld	a3,8(a4)
ffffffffc0206426:	0c878793          	addi	a5,a5,200
ffffffffc020642a:	08d79863          	bne	a5,a3,ffffffffc02064ba <init_main+0x110>
ffffffffc020642e:	6318                	ld	a4,0(a4)
ffffffffc0206430:	06e79563          	bne	a5,a4,ffffffffc020649a <init_main+0xf0>
ffffffffc0206434:	00008517          	auipc	a0,0x8
ffffffffc0206438:	89c50513          	addi	a0,a0,-1892 # ffffffffc020dcd0 <CSWTCH.79+0x2b0>
ffffffffc020643c:	d6bf90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206440:	60a2                	ld	ra,8(sp)
ffffffffc0206442:	4501                	li	a0,0
ffffffffc0206444:	0141                	addi	sp,sp,16
ffffffffc0206446:	8082                	ret
ffffffffc0206448:	00007697          	auipc	a3,0x7
ffffffffc020644c:	7c868693          	addi	a3,a3,1992 # ffffffffc020dc10 <CSWTCH.79+0x1f0>
ffffffffc0206450:	00006617          	auipc	a2,0x6
ffffffffc0206454:	bc060613          	addi	a2,a2,-1088 # ffffffffc020c010 <commands+0x210>
ffffffffc0206458:	4c900593          	li	a1,1225
ffffffffc020645c:	00007517          	auipc	a0,0x7
ffffffffc0206460:	6b450513          	addi	a0,a0,1716 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0206464:	83afa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206468:	00007617          	auipc	a2,0x7
ffffffffc020646c:	76060613          	addi	a2,a2,1888 # ffffffffc020dbc8 <CSWTCH.79+0x1a8>
ffffffffc0206470:	4bc00593          	li	a1,1212
ffffffffc0206474:	00007517          	auipc	a0,0x7
ffffffffc0206478:	69c50513          	addi	a0,a0,1692 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc020647c:	822fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206480:	86aa                	mv	a3,a0
ffffffffc0206482:	00007617          	auipc	a2,0x7
ffffffffc0206486:	72660613          	addi	a2,a2,1830 # ffffffffc020dba8 <CSWTCH.79+0x188>
ffffffffc020648a:	4b400593          	li	a1,1204
ffffffffc020648e:	00007517          	auipc	a0,0x7
ffffffffc0206492:	68250513          	addi	a0,a0,1666 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0206496:	808fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020649a:	00008697          	auipc	a3,0x8
ffffffffc020649e:	80668693          	addi	a3,a3,-2042 # ffffffffc020dca0 <CSWTCH.79+0x280>
ffffffffc02064a2:	00006617          	auipc	a2,0x6
ffffffffc02064a6:	b6e60613          	addi	a2,a2,-1170 # ffffffffc020c010 <commands+0x210>
ffffffffc02064aa:	4cc00593          	li	a1,1228
ffffffffc02064ae:	00007517          	auipc	a0,0x7
ffffffffc02064b2:	66250513          	addi	a0,a0,1634 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc02064b6:	fe9f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02064ba:	00007697          	auipc	a3,0x7
ffffffffc02064be:	7b668693          	addi	a3,a3,1974 # ffffffffc020dc70 <CSWTCH.79+0x250>
ffffffffc02064c2:	00006617          	auipc	a2,0x6
ffffffffc02064c6:	b4e60613          	addi	a2,a2,-1202 # ffffffffc020c010 <commands+0x210>
ffffffffc02064ca:	4cb00593          	li	a1,1227
ffffffffc02064ce:	00007517          	auipc	a0,0x7
ffffffffc02064d2:	64250513          	addi	a0,a0,1602 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc02064d6:	fc9f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02064da:	00007697          	auipc	a3,0x7
ffffffffc02064de:	78668693          	addi	a3,a3,1926 # ffffffffc020dc60 <CSWTCH.79+0x240>
ffffffffc02064e2:	00006617          	auipc	a2,0x6
ffffffffc02064e6:	b2e60613          	addi	a2,a2,-1234 # ffffffffc020c010 <commands+0x210>
ffffffffc02064ea:	4ca00593          	li	a1,1226
ffffffffc02064ee:	00007517          	auipc	a0,0x7
ffffffffc02064f2:	62250513          	addi	a0,a0,1570 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc02064f6:	fa9f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02064fa <do_execve>:
ffffffffc02064fa:	de010113          	addi	sp,sp,-544
ffffffffc02064fe:	21213023          	sd	s2,512(sp)
ffffffffc0206502:	00090917          	auipc	s2,0x90
ffffffffc0206506:	3ee90913          	addi	s2,s2,1006 # ffffffffc02968f0 <current>
ffffffffc020650a:	00093683          	ld	a3,0(s2)
ffffffffc020650e:	fbd2                	sd	s4,496(sp)
ffffffffc0206510:	fff58a1b          	addiw	s4,a1,-1
ffffffffc0206514:	efde                	sd	s7,472(sp)
ffffffffc0206516:	20113c23          	sd	ra,536(sp)
ffffffffc020651a:	20813823          	sd	s0,528(sp)
ffffffffc020651e:	20913423          	sd	s1,520(sp)
ffffffffc0206522:	ffce                	sd	s3,504(sp)
ffffffffc0206524:	f7d6                	sd	s5,488(sp)
ffffffffc0206526:	f3da                	sd	s6,480(sp)
ffffffffc0206528:	ebe2                	sd	s8,464(sp)
ffffffffc020652a:	e7e6                	sd	s9,456(sp)
ffffffffc020652c:	e3ea                	sd	s10,448(sp)
ffffffffc020652e:	ff6e                	sd	s11,440(sp)
ffffffffc0206530:	000a071b          	sext.w	a4,s4
ffffffffc0206534:	47fd                	li	a5,31
ffffffffc0206536:	0286bb83          	ld	s7,40(a3)
ffffffffc020653a:	36e7e663          	bltu	a5,a4,ffffffffc02068a6 <do_execve+0x3ac>
ffffffffc020653e:	842e                	mv	s0,a1
ffffffffc0206540:	84aa                	mv	s1,a0
ffffffffc0206542:	8cb2                	mv	s9,a2
ffffffffc0206544:	4581                	li	a1,0
ffffffffc0206546:	4641                	li	a2,16
ffffffffc0206548:	1088                	addi	a0,sp,96
ffffffffc020654a:	5e0050ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc020654e:	000b8c63          	beqz	s7,ffffffffc0206566 <do_execve+0x6c>
ffffffffc0206552:	038b8513          	addi	a0,s7,56
ffffffffc0206556:	89efe0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc020655a:	00093783          	ld	a5,0(s2)
ffffffffc020655e:	c781                	beqz	a5,ffffffffc0206566 <do_execve+0x6c>
ffffffffc0206560:	43dc                	lw	a5,4(a5)
ffffffffc0206562:	04fba823          	sw	a5,80(s7)
ffffffffc0206566:	24048163          	beqz	s1,ffffffffc02067a8 <do_execve+0x2ae>
ffffffffc020656a:	46c1                	li	a3,16
ffffffffc020656c:	8626                	mv	a2,s1
ffffffffc020656e:	108c                	addi	a1,sp,96
ffffffffc0206570:	855e                	mv	a0,s7
ffffffffc0206572:	eabfd0ef          	jal	ra,ffffffffc020441c <copy_string>
ffffffffc0206576:	68050a63          	beqz	a0,ffffffffc0206c0a <do_execve+0x710>
ffffffffc020657a:	00341a93          	slli	s5,s0,0x3
ffffffffc020657e:	4681                	li	a3,0
ffffffffc0206580:	8656                	mv	a2,s5
ffffffffc0206582:	85e6                	mv	a1,s9
ffffffffc0206584:	855e                	mv	a0,s7
ffffffffc0206586:	d9dfd0ef          	jal	ra,ffffffffc0204322 <user_mem_check>
ffffffffc020658a:	8b66                	mv	s6,s9
ffffffffc020658c:	30050f63          	beqz	a0,ffffffffc02068aa <do_execve+0x3b0>
ffffffffc0206590:	0b010c13          	addi	s8,sp,176
ffffffffc0206594:	4981                	li	s3,0
ffffffffc0206596:	6505                	lui	a0,0x1
ffffffffc0206598:	a83fb0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc020659c:	84aa                	mv	s1,a0
ffffffffc020659e:	18050a63          	beqz	a0,ffffffffc0206732 <do_execve+0x238>
ffffffffc02065a2:	000b3603          	ld	a2,0(s6)
ffffffffc02065a6:	85aa                	mv	a1,a0
ffffffffc02065a8:	6685                	lui	a3,0x1
ffffffffc02065aa:	855e                	mv	a0,s7
ffffffffc02065ac:	e71fd0ef          	jal	ra,ffffffffc020441c <copy_string>
ffffffffc02065b0:	1e050763          	beqz	a0,ffffffffc020679e <do_execve+0x2a4>
ffffffffc02065b4:	009c3023          	sd	s1,0(s8)
ffffffffc02065b8:	2985                	addiw	s3,s3,1
ffffffffc02065ba:	0c21                	addi	s8,s8,8
ffffffffc02065bc:	0b21                	addi	s6,s6,8
ffffffffc02065be:	fd341ce3          	bne	s0,s3,ffffffffc0206596 <do_execve+0x9c>
ffffffffc02065c2:	000cb483          	ld	s1,0(s9)
ffffffffc02065c6:	120b8863          	beqz	s7,ffffffffc02066f6 <do_execve+0x1fc>
ffffffffc02065ca:	038b8513          	addi	a0,s7,56
ffffffffc02065ce:	822fe0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc02065d2:	00093783          	ld	a5,0(s2)
ffffffffc02065d6:	040ba823          	sw	zero,80(s7)
ffffffffc02065da:	1507b503          	ld	a0,336(a5)
ffffffffc02065de:	d4dfe0ef          	jal	ra,ffffffffc020532a <files_closeall>
ffffffffc02065e2:	4581                	li	a1,0
ffffffffc02065e4:	8526                	mv	a0,s1
ffffffffc02065e6:	fd1fe0ef          	jal	ra,ffffffffc02055b6 <sysfile_open>
ffffffffc02065ea:	89aa                	mv	s3,a0
ffffffffc02065ec:	0e054063          	bltz	a0,ffffffffc02066cc <do_execve+0x1d2>
ffffffffc02065f0:	00090797          	auipc	a5,0x90
ffffffffc02065f4:	2d07b783          	ld	a5,720(a5) # ffffffffc02968c0 <boot_pgdir_pa>
ffffffffc02065f8:	577d                	li	a4,-1
ffffffffc02065fa:	177e                	slli	a4,a4,0x3f
ffffffffc02065fc:	83b1                	srli	a5,a5,0xc
ffffffffc02065fe:	8fd9                	or	a5,a5,a4
ffffffffc0206600:	18079073          	csrw	satp,a5
ffffffffc0206604:	12000073          	sfence.vma
ffffffffc0206608:	030ba783          	lw	a5,48(s7)
ffffffffc020660c:	fff7871b          	addiw	a4,a5,-1
ffffffffc0206610:	02eba823          	sw	a4,48(s7)
ffffffffc0206614:	1a070c63          	beqz	a4,ffffffffc02067cc <do_execve+0x2d2>
ffffffffc0206618:	00093783          	ld	a5,0(s2)
ffffffffc020661c:	0207b423          	sd	zero,40(a5)
ffffffffc0206620:	e78fd0ef          	jal	ra,ffffffffc0203c98 <mm_create>
ffffffffc0206624:	84aa                	mv	s1,a0
ffffffffc0206626:	64050e63          	beqz	a0,ffffffffc0206c82 <do_execve+0x788>
ffffffffc020662a:	4505                	li	a0,1
ffffffffc020662c:	bcdfb0ef          	jal	ra,ffffffffc02021f8 <alloc_pages>
ffffffffc0206630:	5e050763          	beqz	a0,ffffffffc0206c1e <do_execve+0x724>
ffffffffc0206634:	00090c17          	auipc	s8,0x90
ffffffffc0206638:	2a4c0c13          	addi	s8,s8,676 # ffffffffc02968d8 <pages>
ffffffffc020663c:	000c3683          	ld	a3,0(s8)
ffffffffc0206640:	0000a797          	auipc	a5,0xa
ffffffffc0206644:	8707b783          	ld	a5,-1936(a5) # ffffffffc020feb0 <nbase>
ffffffffc0206648:	00090c97          	auipc	s9,0x90
ffffffffc020664c:	288c8c93          	addi	s9,s9,648 # ffffffffc02968d0 <npage>
ffffffffc0206650:	40d506b3          	sub	a3,a0,a3
ffffffffc0206654:	8699                	srai	a3,a3,0x6
ffffffffc0206656:	96be                	add	a3,a3,a5
ffffffffc0206658:	000cb703          	ld	a4,0(s9)
ffffffffc020665c:	e43e                	sd	a5,8(sp)
ffffffffc020665e:	00c69793          	slli	a5,a3,0xc
ffffffffc0206662:	83b1                	srli	a5,a5,0xc
ffffffffc0206664:	06b2                	slli	a3,a3,0xc
ffffffffc0206666:	5ee7f263          	bgeu	a5,a4,ffffffffc0206c4a <do_execve+0x750>
ffffffffc020666a:	00090797          	auipc	a5,0x90
ffffffffc020666e:	27e78793          	addi	a5,a5,638 # ffffffffc02968e8 <va_pa_offset>
ffffffffc0206672:	0007bb03          	ld	s6,0(a5)
ffffffffc0206676:	6605                	lui	a2,0x1
ffffffffc0206678:	00090597          	auipc	a1,0x90
ffffffffc020667c:	2505b583          	ld	a1,592(a1) # ffffffffc02968c8 <boot_pgdir_va>
ffffffffc0206680:	9b36                	add	s6,s6,a3
ffffffffc0206682:	855a                	mv	a0,s6
ffffffffc0206684:	4f8050ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc0206688:	4601                	li	a2,0
ffffffffc020668a:	0164bc23          	sd	s6,24(s1)
ffffffffc020668e:	4581                	li	a1,0
ffffffffc0206690:	854e                	mv	a0,s3
ffffffffc0206692:	98aff0ef          	jal	ra,ffffffffc020581c <sysfile_seek>
ffffffffc0206696:	87aa                	mv	a5,a0
ffffffffc0206698:	e11d                	bnez	a0,ffffffffc02066be <do_execve+0x1c4>
ffffffffc020669a:	04000613          	li	a2,64
ffffffffc020669e:	188c                	addi	a1,sp,112
ffffffffc02066a0:	854e                	mv	a0,s3
ffffffffc02066a2:	f4dfe0ef          	jal	ra,ffffffffc02055ee <sysfile_read>
ffffffffc02066a6:	04000793          	li	a5,64
ffffffffc02066aa:	10f51b63          	bne	a0,a5,ffffffffc02067c0 <do_execve+0x2c6>
ffffffffc02066ae:	5746                	lw	a4,112(sp)
ffffffffc02066b0:	464c47b7          	lui	a5,0x464c4
ffffffffc02066b4:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
ffffffffc02066b8:	12f70563          	beq	a4,a5,ffffffffc02067e2 <do_execve+0x2e8>
ffffffffc02066bc:	57e1                	li	a5,-8
ffffffffc02066be:	6c88                	ld	a0,24(s1)
ffffffffc02066c0:	89be                	mv	s3,a5
ffffffffc02066c2:	c50ff0ef          	jal	ra,ffffffffc0205b12 <put_pgdir.isra.0>
ffffffffc02066c6:	8526                	mv	a0,s1
ffffffffc02066c8:	f1efd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc02066cc:	020a1793          	slli	a5,s4,0x20
ffffffffc02066d0:	147d                	addi	s0,s0,-1
ffffffffc02066d2:	1104                	addi	s1,sp,160
ffffffffc02066d4:	01d7da13          	srli	s4,a5,0x1d
ffffffffc02066d8:	040e                	slli	s0,s0,0x3
ffffffffc02066da:	94d6                	add	s1,s1,s5
ffffffffc02066dc:	191c                	addi	a5,sp,176
ffffffffc02066de:	943e                	add	s0,s0,a5
ffffffffc02066e0:	414484b3          	sub	s1,s1,s4
ffffffffc02066e4:	6008                	ld	a0,0(s0)
ffffffffc02066e6:	1461                	addi	s0,s0,-8
ffffffffc02066e8:	9e3fb0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02066ec:	fe849ce3          	bne	s1,s0,ffffffffc02066e4 <do_execve+0x1ea>
ffffffffc02066f0:	854e                	mv	a0,s3
ffffffffc02066f2:	955ff0ef          	jal	ra,ffffffffc0206046 <do_exit>
ffffffffc02066f6:	00093783          	ld	a5,0(s2)
ffffffffc02066fa:	1507b503          	ld	a0,336(a5)
ffffffffc02066fe:	c2dfe0ef          	jal	ra,ffffffffc020532a <files_closeall>
ffffffffc0206702:	4581                	li	a1,0
ffffffffc0206704:	8526                	mv	a0,s1
ffffffffc0206706:	eb1fe0ef          	jal	ra,ffffffffc02055b6 <sysfile_open>
ffffffffc020670a:	89aa                	mv	s3,a0
ffffffffc020670c:	fc0540e3          	bltz	a0,ffffffffc02066cc <do_execve+0x1d2>
ffffffffc0206710:	00093783          	ld	a5,0(s2)
ffffffffc0206714:	779c                	ld	a5,40(a5)
ffffffffc0206716:	f00785e3          	beqz	a5,ffffffffc0206620 <do_execve+0x126>
ffffffffc020671a:	00007617          	auipc	a2,0x7
ffffffffc020671e:	5e660613          	addi	a2,a2,1510 # ffffffffc020dd00 <CSWTCH.79+0x2e0>
ffffffffc0206722:	2ff00593          	li	a1,767
ffffffffc0206726:	00007517          	auipc	a0,0x7
ffffffffc020672a:	3ea50513          	addi	a0,a0,1002 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc020672e:	d71f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206732:	54f1                	li	s1,-4
ffffffffc0206734:	02098863          	beqz	s3,ffffffffc0206764 <do_execve+0x26a>
ffffffffc0206738:	fff98413          	addi	s0,s3,-1 # 1fff <_binary_bin_swap_img_size-0x5d01>
ffffffffc020673c:	00399793          	slli	a5,s3,0x3
ffffffffc0206740:	1118                	addi	a4,sp,160
ffffffffc0206742:	39fd                	addiw	s3,s3,-1
ffffffffc0206744:	97ba                	add	a5,a5,a4
ffffffffc0206746:	02099713          	slli	a4,s3,0x20
ffffffffc020674a:	01d75993          	srli	s3,a4,0x1d
ffffffffc020674e:	040e                	slli	s0,s0,0x3
ffffffffc0206750:	1918                	addi	a4,sp,176
ffffffffc0206752:	943a                	add	s0,s0,a4
ffffffffc0206754:	413789b3          	sub	s3,a5,s3
ffffffffc0206758:	6008                	ld	a0,0(s0)
ffffffffc020675a:	1461                	addi	s0,s0,-8
ffffffffc020675c:	96ffb0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc0206760:	ff341ce3          	bne	s0,s3,ffffffffc0206758 <do_execve+0x25e>
ffffffffc0206764:	000b8863          	beqz	s7,ffffffffc0206774 <do_execve+0x27a>
ffffffffc0206768:	038b8513          	addi	a0,s7,56
ffffffffc020676c:	e85fd0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0206770:	040ba823          	sw	zero,80(s7)
ffffffffc0206774:	21813083          	ld	ra,536(sp)
ffffffffc0206778:	21013403          	ld	s0,528(sp)
ffffffffc020677c:	20013903          	ld	s2,512(sp)
ffffffffc0206780:	79fe                	ld	s3,504(sp)
ffffffffc0206782:	7a5e                	ld	s4,496(sp)
ffffffffc0206784:	7abe                	ld	s5,488(sp)
ffffffffc0206786:	7b1e                	ld	s6,480(sp)
ffffffffc0206788:	6bfe                	ld	s7,472(sp)
ffffffffc020678a:	6c5e                	ld	s8,464(sp)
ffffffffc020678c:	6cbe                	ld	s9,456(sp)
ffffffffc020678e:	6d1e                	ld	s10,448(sp)
ffffffffc0206790:	7dfa                	ld	s11,440(sp)
ffffffffc0206792:	8526                	mv	a0,s1
ffffffffc0206794:	20813483          	ld	s1,520(sp)
ffffffffc0206798:	22010113          	addi	sp,sp,544
ffffffffc020679c:	8082                	ret
ffffffffc020679e:	8526                	mv	a0,s1
ffffffffc02067a0:	92bfb0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02067a4:	54f5                	li	s1,-3
ffffffffc02067a6:	b779                	j	ffffffffc0206734 <do_execve+0x23a>
ffffffffc02067a8:	00093783          	ld	a5,0(s2)
ffffffffc02067ac:	00007617          	auipc	a2,0x7
ffffffffc02067b0:	54460613          	addi	a2,a2,1348 # ffffffffc020dcf0 <CSWTCH.79+0x2d0>
ffffffffc02067b4:	45c1                	li	a1,16
ffffffffc02067b6:	43d4                	lw	a3,4(a5)
ffffffffc02067b8:	1088                	addi	a0,sp,96
ffffffffc02067ba:	280050ef          	jal	ra,ffffffffc020ba3a <snprintf>
ffffffffc02067be:	bb75                	j	ffffffffc020657a <do_execve+0x80>
ffffffffc02067c0:	0005079b          	sext.w	a5,a0
ffffffffc02067c4:	ee054de3          	bltz	a0,ffffffffc02066be <do_execve+0x1c4>
ffffffffc02067c8:	57fd                	li	a5,-1
ffffffffc02067ca:	bdd5                	j	ffffffffc02066be <do_execve+0x1c4>
ffffffffc02067cc:	855e                	mv	a0,s7
ffffffffc02067ce:	fb4fd0ef          	jal	ra,ffffffffc0203f82 <exit_mmap>
ffffffffc02067d2:	018bb503          	ld	a0,24(s7)
ffffffffc02067d6:	b3cff0ef          	jal	ra,ffffffffc0205b12 <put_pgdir.isra.0>
ffffffffc02067da:	855e                	mv	a0,s7
ffffffffc02067dc:	e0afd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc02067e0:	bd25                	j	ffffffffc0206618 <do_execve+0x11e>
ffffffffc02067e2:	0a815783          	lhu	a5,168(sp)
ffffffffc02067e6:	efa5                	bnez	a5,ffffffffc020685e <do_execve+0x364>
ffffffffc02067e8:	4701                	li	a4,0
ffffffffc02067ea:	46ad                	li	a3,11
ffffffffc02067ec:	00100637          	lui	a2,0x100
ffffffffc02067f0:	7ff005b7          	lui	a1,0x7ff00
ffffffffc02067f4:	8526                	mv	a0,s1
ffffffffc02067f6:	e42fd0ef          	jal	ra,ffffffffc0203e38 <mm_map>
ffffffffc02067fa:	87aa                	mv	a5,a0
ffffffffc02067fc:	46050563          	beqz	a0,ffffffffc0206c66 <do_execve+0x76c>
ffffffffc0206800:	8526                	mv	a0,s1
ffffffffc0206802:	e03e                	sd	a5,0(sp)
ffffffffc0206804:	f7efd0ef          	jal	ra,ffffffffc0203f82 <exit_mmap>
ffffffffc0206808:	6c88                	ld	a0,24(s1)
ffffffffc020680a:	b08ff0ef          	jal	ra,ffffffffc0205b12 <put_pgdir.isra.0>
ffffffffc020680e:	8526                	mv	a0,s1
ffffffffc0206810:	dd6fd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0206814:	6782                	ld	a5,0(sp)
ffffffffc0206816:	44079663          	bnez	a5,ffffffffc0206c62 <do_execve+0x768>
ffffffffc020681a:	111c                	addi	a5,sp,160
ffffffffc020681c:	9abe                	add	s5,s5,a5
ffffffffc020681e:	147d                	addi	s0,s0,-1
ffffffffc0206820:	020a1793          	slli	a5,s4,0x20
ffffffffc0206824:	01d7da13          	srli	s4,a5,0x1d
ffffffffc0206828:	040e                	slli	s0,s0,0x3
ffffffffc020682a:	191c                	addi	a5,sp,176
ffffffffc020682c:	943e                	add	s0,s0,a5
ffffffffc020682e:	414a8a33          	sub	s4,s5,s4
ffffffffc0206832:	6008                	ld	a0,0(s0)
ffffffffc0206834:	1461                	addi	s0,s0,-8
ffffffffc0206836:	895fb0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020683a:	ff441ce3          	bne	s0,s4,ffffffffc0206832 <do_execve+0x338>
ffffffffc020683e:	00093403          	ld	s0,0(s2)
ffffffffc0206842:	4641                	li	a2,16
ffffffffc0206844:	4581                	li	a1,0
ffffffffc0206846:	0b440413          	addi	s0,s0,180
ffffffffc020684a:	8522                	mv	a0,s0
ffffffffc020684c:	2de050ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0206850:	463d                	li	a2,15
ffffffffc0206852:	108c                	addi	a1,sp,96
ffffffffc0206854:	8522                	mv	a0,s0
ffffffffc0206856:	326050ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc020685a:	4481                	li	s1,0
ffffffffc020685c:	bf21                	j	ffffffffc0206774 <do_execve+0x27a>
ffffffffc020685e:	00379b13          	slli	s6,a5,0x3
ffffffffc0206862:	40fb07b3          	sub	a5,s6,a5
ffffffffc0206866:	00379b13          	slli	s6,a5,0x3
ffffffffc020686a:	855a                	mv	a0,s6
ffffffffc020686c:	faefb0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0206870:	e4aa                	sd	a0,72(sp)
ffffffffc0206872:	38050463          	beqz	a0,ffffffffc0206bfa <do_execve+0x700>
ffffffffc0206876:	65ca                	ld	a1,144(sp)
ffffffffc0206878:	4601                	li	a2,0
ffffffffc020687a:	854e                	mv	a0,s3
ffffffffc020687c:	fa1fe0ef          	jal	ra,ffffffffc020581c <sysfile_seek>
ffffffffc0206880:	87aa                	mv	a5,a0
ffffffffc0206882:	c905                	beqz	a0,ffffffffc02068b2 <do_execve+0x3b8>
ffffffffc0206884:	6526                	ld	a0,72(sp)
ffffffffc0206886:	e03e                	sd	a5,0(sp)
ffffffffc0206888:	843fb0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020688c:	6c88                	ld	a0,24(s1)
ffffffffc020688e:	a84ff0ef          	jal	ra,ffffffffc0205b12 <put_pgdir.isra.0>
ffffffffc0206892:	8526                	mv	a0,s1
ffffffffc0206894:	d52fd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0206898:	6782                	ld	a5,0(sp)
ffffffffc020689a:	6526                	ld	a0,72(sp)
ffffffffc020689c:	e03e                	sd	a5,0(sp)
ffffffffc020689e:	82dfb0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02068a2:	6782                	ld	a5,0(sp)
ffffffffc02068a4:	bf8d                	j	ffffffffc0206816 <do_execve+0x31c>
ffffffffc02068a6:	54f5                	li	s1,-3
ffffffffc02068a8:	b5f1                	j	ffffffffc0206774 <do_execve+0x27a>
ffffffffc02068aa:	54f5                	li	s1,-3
ffffffffc02068ac:	ea0b9ee3          	bnez	s7,ffffffffc0206768 <do_execve+0x26e>
ffffffffc02068b0:	b5d1                	j	ffffffffc0206774 <do_execve+0x27a>
ffffffffc02068b2:	65a6                	ld	a1,72(sp)
ffffffffc02068b4:	865a                	mv	a2,s6
ffffffffc02068b6:	854e                	mv	a0,s3
ffffffffc02068b8:	d37fe0ef          	jal	ra,ffffffffc02055ee <sysfile_read>
ffffffffc02068bc:	00ab0863          	beq	s6,a0,ffffffffc02068cc <do_execve+0x3d2>
ffffffffc02068c0:	0005079b          	sext.w	a5,a0
ffffffffc02068c4:	fc0540e3          	bltz	a0,ffffffffc0206884 <do_execve+0x38a>
ffffffffc02068c8:	57fd                	li	a5,-1
ffffffffc02068ca:	bf6d                	j	ffffffffc0206884 <do_execve+0x38a>
ffffffffc02068cc:	0a815703          	lhu	a4,168(sp)
ffffffffc02068d0:	00371793          	slli	a5,a4,0x3
ffffffffc02068d4:	8f99                	sub	a5,a5,a4
ffffffffc02068d6:	6726                	ld	a4,72(sp)
ffffffffc02068d8:	078e                	slli	a5,a5,0x3
ffffffffc02068da:	97ba                	add	a5,a5,a4
ffffffffc02068dc:	e8be                	sd	a5,80(sp)
ffffffffc02068de:	02f77963          	bgeu	a4,a5,ffffffffc0206910 <do_execve+0x416>
ffffffffc02068e2:	57fd                	li	a5,-1
ffffffffc02068e4:	83b1                	srli	a5,a5,0xc
ffffffffc02068e6:	8d3a                	mv	s10,a4
ffffffffc02068e8:	ec3e                	sd	a5,24(sp)
ffffffffc02068ea:	f856                	sd	s5,48(sp)
ffffffffc02068ec:	ecce                	sd	s3,88(sp)
ffffffffc02068ee:	e026                	sd	s1,0(sp)
ffffffffc02068f0:	fc22                	sd	s0,56(sp)
ffffffffc02068f2:	c2d2                	sw	s4,68(sp)
ffffffffc02068f4:	000d2783          	lw	a5,0(s10)
ffffffffc02068f8:	4705                	li	a4,1
ffffffffc02068fa:	10e78563          	beq	a5,a4,ffffffffc0206a04 <do_execve+0x50a>
ffffffffc02068fe:	67c6                	ld	a5,80(sp)
ffffffffc0206900:	038d0d13          	addi	s10,s10,56
ffffffffc0206904:	fefd68e3          	bltu	s10,a5,ffffffffc02068f4 <do_execve+0x3fa>
ffffffffc0206908:	7ac2                	ld	s5,48(sp)
ffffffffc020690a:	6482                	ld	s1,0(sp)
ffffffffc020690c:	7462                	ld	s0,56(sp)
ffffffffc020690e:	4a16                	lw	s4,68(sp)
ffffffffc0206910:	4701                	li	a4,0
ffffffffc0206912:	46ad                	li	a3,11
ffffffffc0206914:	00100637          	lui	a2,0x100
ffffffffc0206918:	7ff005b7          	lui	a1,0x7ff00
ffffffffc020691c:	8526                	mv	a0,s1
ffffffffc020691e:	d1afd0ef          	jal	ra,ffffffffc0203e38 <mm_map>
ffffffffc0206922:	87aa                	mv	a5,a0
ffffffffc0206924:	ed55                	bnez	a0,ffffffffc02069e0 <do_execve+0x4e6>
ffffffffc0206926:	6c88                	ld	a0,24(s1)
ffffffffc0206928:	467d                	li	a2,31
ffffffffc020692a:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc020692e:	a84fd0ef          	jal	ra,ffffffffc0203bb2 <pgdir_alloc_page>
ffffffffc0206932:	3a050a63          	beqz	a0,ffffffffc0206ce6 <do_execve+0x7ec>
ffffffffc0206936:	6c88                	ld	a0,24(s1)
ffffffffc0206938:	467d                	li	a2,31
ffffffffc020693a:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc020693e:	a74fd0ef          	jal	ra,ffffffffc0203bb2 <pgdir_alloc_page>
ffffffffc0206942:	38050263          	beqz	a0,ffffffffc0206cc6 <do_execve+0x7cc>
ffffffffc0206946:	6c88                	ld	a0,24(s1)
ffffffffc0206948:	467d                	li	a2,31
ffffffffc020694a:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc020694e:	a64fd0ef          	jal	ra,ffffffffc0203bb2 <pgdir_alloc_page>
ffffffffc0206952:	34050a63          	beqz	a0,ffffffffc0206ca6 <do_execve+0x7ac>
ffffffffc0206956:	6c88                	ld	a0,24(s1)
ffffffffc0206958:	467d                	li	a2,31
ffffffffc020695a:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc020695e:	a54fd0ef          	jal	ra,ffffffffc0203bb2 <pgdir_alloc_page>
ffffffffc0206962:	32050263          	beqz	a0,ffffffffc0206c86 <do_execve+0x78c>
ffffffffc0206966:	589c                	lw	a5,48(s1)
ffffffffc0206968:	00093703          	ld	a4,0(s2)
ffffffffc020696c:	6c94                	ld	a3,24(s1)
ffffffffc020696e:	2785                	addiw	a5,a5,1
ffffffffc0206970:	d89c                	sw	a5,48(s1)
ffffffffc0206972:	f704                	sd	s1,40(a4)
ffffffffc0206974:	c02007b7          	lui	a5,0xc0200
ffffffffc0206978:	2ef6e963          	bltu	a3,a5,ffffffffc0206c6a <do_execve+0x770>
ffffffffc020697c:	00090797          	auipc	a5,0x90
ffffffffc0206980:	f6c78793          	addi	a5,a5,-148 # ffffffffc02968e8 <va_pa_offset>
ffffffffc0206984:	639c                	ld	a5,0(a5)
ffffffffc0206986:	8e9d                	sub	a3,a3,a5
ffffffffc0206988:	f754                	sd	a3,168(a4)
ffffffffc020698a:	577d                	li	a4,-1
ffffffffc020698c:	00c6d793          	srli	a5,a3,0xc
ffffffffc0206990:	177e                	slli	a4,a4,0x3f
ffffffffc0206992:	8fd9                	or	a5,a5,a4
ffffffffc0206994:	18079073          	csrw	satp,a5
ffffffffc0206998:	12000073          	sfence.vma
ffffffffc020699c:	00093783          	ld	a5,0(s2)
ffffffffc02069a0:	12000613          	li	a2,288
ffffffffc02069a4:	4581                	li	a1,0
ffffffffc02069a6:	73c4                	ld	s1,160(a5)
ffffffffc02069a8:	1004b983          	ld	s3,256(s1)
ffffffffc02069ac:	8526                	mv	a0,s1
ffffffffc02069ae:	17c050ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc02069b2:	edd9f793          	andi	a5,s3,-291
ffffffffc02069b6:	66aa                	ld	a3,136(sp)
ffffffffc02069b8:	0207e793          	ori	a5,a5,32
ffffffffc02069bc:	4705                	li	a4,1
ffffffffc02069be:	10f4b023          	sd	a5,256(s1)
ffffffffc02069c2:	67a6                	ld	a5,72(sp)
ffffffffc02069c4:	077e                	slli	a4,a4,0x1f
ffffffffc02069c6:	e898                	sd	a4,16(s1)
ffffffffc02069c8:	10d4b423          	sd	a3,264(s1)
ffffffffc02069cc:	e40787e3          	beqz	a5,ffffffffc020681a <do_execve+0x320>
ffffffffc02069d0:	853e                	mv	a0,a5
ffffffffc02069d2:	ef8fb0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02069d6:	b591                	j	ffffffffc020681a <do_execve+0x320>
ffffffffc02069d8:	7ac2                	ld	s5,48(sp)
ffffffffc02069da:	6482                	ld	s1,0(sp)
ffffffffc02069dc:	7462                	ld	s0,56(sp)
ffffffffc02069de:	4a16                	lw	s4,68(sp)
ffffffffc02069e0:	69a6                	ld	s3,72(sp)
ffffffffc02069e2:	e03e                	sd	a5,0(sp)
ffffffffc02069e4:	854e                	mv	a0,s3
ffffffffc02069e6:	ee4fb0ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02069ea:	8526                	mv	a0,s1
ffffffffc02069ec:	d96fd0ef          	jal	ra,ffffffffc0203f82 <exit_mmap>
ffffffffc02069f0:	6c88                	ld	a0,24(s1)
ffffffffc02069f2:	920ff0ef          	jal	ra,ffffffffc0205b12 <put_pgdir.isra.0>
ffffffffc02069f6:	8526                	mv	a0,s1
ffffffffc02069f8:	beefd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc02069fc:	6782                	ld	a5,0(sp)
ffffffffc02069fe:	e0098ce3          	beqz	s3,ffffffffc0206816 <do_execve+0x31c>
ffffffffc0206a02:	bd61                	j	ffffffffc020689a <do_execve+0x3a0>
ffffffffc0206a04:	028d3603          	ld	a2,40(s10)
ffffffffc0206a08:	020d3783          	ld	a5,32(s10)
ffffffffc0206a0c:	22f66863          	bltu	a2,a5,ffffffffc0206c3c <do_execve+0x742>
ffffffffc0206a10:	004d2783          	lw	a5,4(s10)
ffffffffc0206a14:	0017f693          	andi	a3,a5,1
ffffffffc0206a18:	c291                	beqz	a3,ffffffffc0206a1c <do_execve+0x522>
ffffffffc0206a1a:	4691                	li	a3,4
ffffffffc0206a1c:	0027f713          	andi	a4,a5,2
ffffffffc0206a20:	8b91                	andi	a5,a5,4
ffffffffc0206a22:	c775                	beqz	a4,ffffffffc0206b0e <do_execve+0x614>
ffffffffc0206a24:	0026e693          	ori	a3,a3,2
ffffffffc0206a28:	c3e5                	beqz	a5,ffffffffc0206b08 <do_execve+0x60e>
ffffffffc0206a2a:	47cd                	li	a5,19
ffffffffc0206a2c:	0016e693          	ori	a3,a3,1
ffffffffc0206a30:	f03e                	sd	a5,32(sp)
ffffffffc0206a32:	0026f793          	andi	a5,a3,2
ffffffffc0206a36:	ebe9                	bnez	a5,ffffffffc0206b08 <do_execve+0x60e>
ffffffffc0206a38:	0046f793          	andi	a5,a3,4
ffffffffc0206a3c:	c789                	beqz	a5,ffffffffc0206a46 <do_execve+0x54c>
ffffffffc0206a3e:	7782                	ld	a5,32(sp)
ffffffffc0206a40:	0087e793          	ori	a5,a5,8
ffffffffc0206a44:	f03e                	sd	a5,32(sp)
ffffffffc0206a46:	010d3583          	ld	a1,16(s10)
ffffffffc0206a4a:	6502                	ld	a0,0(sp)
ffffffffc0206a4c:	4701                	li	a4,0
ffffffffc0206a4e:	beafd0ef          	jal	ra,ffffffffc0203e38 <mm_map>
ffffffffc0206a52:	1c051f63          	bnez	a0,ffffffffc0206c30 <do_execve+0x736>
ffffffffc0206a56:	010d3403          	ld	s0,16(s10)
ffffffffc0206a5a:	020d3b03          	ld	s6,32(s10)
ffffffffc0206a5e:	77fd                	lui	a5,0xfffff
ffffffffc0206a60:	00f474b3          	and	s1,s0,a5
ffffffffc0206a64:	9b22                	add	s6,s6,s0
ffffffffc0206a66:	1d647163          	bgeu	s0,s6,ffffffffc0206c28 <do_execve+0x72e>
ffffffffc0206a6a:	6a66                	ld	s4,88(sp)
ffffffffc0206a6c:	4a81                	li	s5,0
ffffffffc0206a6e:	f46a                	sd	s10,40(sp)
ffffffffc0206a70:	6782                	ld	a5,0(sp)
ffffffffc0206a72:	7602                	ld	a2,32(sp)
ffffffffc0206a74:	85a6                	mv	a1,s1
ffffffffc0206a76:	6f88                	ld	a0,24(a5)
ffffffffc0206a78:	93afd0ef          	jal	ra,ffffffffc0203bb2 <pgdir_alloc_page>
ffffffffc0206a7c:	8daa                	mv	s11,a0
ffffffffc0206a7e:	cd41                	beqz	a0,ffffffffc0206b16 <do_execve+0x61c>
ffffffffc0206a80:	6785                	lui	a5,0x1
ffffffffc0206a82:	00f48bb3          	add	s7,s1,a5
ffffffffc0206a86:	408b8d33          	sub	s10,s7,s0
ffffffffc0206a8a:	017b7463          	bgeu	s6,s7,ffffffffc0206a92 <do_execve+0x598>
ffffffffc0206a8e:	408b0d33          	sub	s10,s6,s0
ffffffffc0206a92:	000c3983          	ld	s3,0(s8)
ffffffffc0206a96:	6722                	ld	a4,8(sp)
ffffffffc0206a98:	000cb783          	ld	a5,0(s9)
ffffffffc0206a9c:	413d89b3          	sub	s3,s11,s3
ffffffffc0206aa0:	4069d993          	srai	s3,s3,0x6
ffffffffc0206aa4:	99ba                	add	s3,s3,a4
ffffffffc0206aa6:	6762                	ld	a4,24(sp)
ffffffffc0206aa8:	00e9f633          	and	a2,s3,a4
ffffffffc0206aac:	09b2                	slli	s3,s3,0xc
ffffffffc0206aae:	18f67d63          	bgeu	a2,a5,ffffffffc0206c48 <do_execve+0x74e>
ffffffffc0206ab2:	77a2                	ld	a5,40(sp)
ffffffffc0206ab4:	4601                	li	a2,0
ffffffffc0206ab6:	8552                	mv	a0,s4
ffffffffc0206ab8:	678c                	ld	a1,8(a5)
ffffffffc0206aba:	00090797          	auipc	a5,0x90
ffffffffc0206abe:	e2e78793          	addi	a5,a5,-466 # ffffffffc02968e8 <va_pa_offset>
ffffffffc0206ac2:	639c                	ld	a5,0(a5)
ffffffffc0206ac4:	95d6                	add	a1,a1,s5
ffffffffc0206ac6:	e83e                	sd	a5,16(sp)
ffffffffc0206ac8:	d55fe0ef          	jal	ra,ffffffffc020581c <sysfile_seek>
ffffffffc0206acc:	87aa                	mv	a5,a0
ffffffffc0206ace:	f00515e3          	bnez	a0,ffffffffc02069d8 <do_execve+0x4de>
ffffffffc0206ad2:	67c2                	ld	a5,16(sp)
ffffffffc0206ad4:	409405b3          	sub	a1,s0,s1
ffffffffc0206ad8:	866a                	mv	a2,s10
ffffffffc0206ada:	99be                	add	s3,s3,a5
ffffffffc0206adc:	95ce                	add	a1,a1,s3
ffffffffc0206ade:	8552                	mv	a0,s4
ffffffffc0206ae0:	b0ffe0ef          	jal	ra,ffffffffc02055ee <sysfile_read>
ffffffffc0206ae4:	00ad0c63          	beq	s10,a0,ffffffffc0206afc <do_execve+0x602>
ffffffffc0206ae8:	7ac2                	ld	s5,48(sp)
ffffffffc0206aea:	6482                	ld	s1,0(sp)
ffffffffc0206aec:	7462                	ld	s0,56(sp)
ffffffffc0206aee:	4a16                	lw	s4,68(sp)
ffffffffc0206af0:	0005079b          	sext.w	a5,a0
ffffffffc0206af4:	ee0546e3          	bltz	a0,ffffffffc02069e0 <do_execve+0x4e6>
ffffffffc0206af8:	57fd                	li	a5,-1
ffffffffc0206afa:	b5dd                	j	ffffffffc02069e0 <do_execve+0x4e6>
ffffffffc0206afc:	946a                	add	s0,s0,s10
ffffffffc0206afe:	9aea                	add	s5,s5,s10
ffffffffc0206b00:	03647163          	bgeu	s0,s6,ffffffffc0206b22 <do_execve+0x628>
ffffffffc0206b04:	84de                	mv	s1,s7
ffffffffc0206b06:	b7ad                	j	ffffffffc0206a70 <do_execve+0x576>
ffffffffc0206b08:	47dd                	li	a5,23
ffffffffc0206b0a:	f03e                	sd	a5,32(sp)
ffffffffc0206b0c:	b735                	j	ffffffffc0206a38 <do_execve+0x53e>
ffffffffc0206b0e:	4745                	li	a4,17
ffffffffc0206b10:	f03a                	sd	a4,32(sp)
ffffffffc0206b12:	d385                	beqz	a5,ffffffffc0206a32 <do_execve+0x538>
ffffffffc0206b14:	bf19                	j	ffffffffc0206a2a <do_execve+0x530>
ffffffffc0206b16:	7ac2                	ld	s5,48(sp)
ffffffffc0206b18:	6482                	ld	s1,0(sp)
ffffffffc0206b1a:	7462                	ld	s0,56(sp)
ffffffffc0206b1c:	4a16                	lw	s4,68(sp)
ffffffffc0206b1e:	4781                	li	a5,0
ffffffffc0206b20:	b5c1                	j	ffffffffc02069e0 <do_execve+0x4e6>
ffffffffc0206b22:	7d22                	ld	s10,40(sp)
ffffffffc0206b24:	8a5e                	mv	s4,s7
ffffffffc0206b26:	010d3a83          	ld	s5,16(s10)
ffffffffc0206b2a:	028d3783          	ld	a5,40(s10)
ffffffffc0206b2e:	9abe                	add	s5,s5,a5
ffffffffc0206b30:	05447d63          	bgeu	s0,s4,ffffffffc0206b8a <do_execve+0x690>
ffffffffc0206b34:	dd5405e3          	beq	s0,s5,ffffffffc02068fe <do_execve+0x404>
ffffffffc0206b38:	fc0d8fe3          	beqz	s11,ffffffffc0206b16 <do_execve+0x61c>
ffffffffc0206b3c:	6785                	lui	a5,0x1
ffffffffc0206b3e:	00f40533          	add	a0,s0,a5
ffffffffc0206b42:	41450533          	sub	a0,a0,s4
ffffffffc0206b46:	408a8b33          	sub	s6,s5,s0
ffffffffc0206b4a:	014ae463          	bltu	s5,s4,ffffffffc0206b52 <do_execve+0x658>
ffffffffc0206b4e:	408a0b33          	sub	s6,s4,s0
ffffffffc0206b52:	000c3783          	ld	a5,0(s8)
ffffffffc0206b56:	6722                	ld	a4,8(sp)
ffffffffc0206b58:	000cb603          	ld	a2,0(s9)
ffffffffc0206b5c:	40fd87b3          	sub	a5,s11,a5
ffffffffc0206b60:	8799                	srai	a5,a5,0x6
ffffffffc0206b62:	97ba                	add	a5,a5,a4
ffffffffc0206b64:	6762                	ld	a4,24(sp)
ffffffffc0206b66:	00c79693          	slli	a3,a5,0xc
ffffffffc0206b6a:	00e7f5b3          	and	a1,a5,a4
ffffffffc0206b6e:	0cc5fe63          	bgeu	a1,a2,ffffffffc0206c4a <do_execve+0x750>
ffffffffc0206b72:	00090797          	auipc	a5,0x90
ffffffffc0206b76:	d7678793          	addi	a5,a5,-650 # ffffffffc02968e8 <va_pa_offset>
ffffffffc0206b7a:	639c                	ld	a5,0(a5)
ffffffffc0206b7c:	865a                	mv	a2,s6
ffffffffc0206b7e:	4581                	li	a1,0
ffffffffc0206b80:	97b6                	add	a5,a5,a3
ffffffffc0206b82:	953e                	add	a0,a0,a5
ffffffffc0206b84:	7a7040ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0206b88:	945a                	add	s0,s0,s6
ffffffffc0206b8a:	d7547ae3          	bgeu	s0,s5,ffffffffc02068fe <do_execve+0x404>
ffffffffc0206b8e:	6482                	ld	s1,0(sp)
ffffffffc0206b90:	7982                	ld	s3,32(sp)
ffffffffc0206b92:	6b22                	ld	s6,8(sp)
ffffffffc0206b94:	a881                	j	ffffffffc0206be4 <do_execve+0x6ea>
ffffffffc0206b96:	6785                	lui	a5,0x1
ffffffffc0206b98:	41440733          	sub	a4,s0,s4
ffffffffc0206b9c:	9a3e                	add	s4,s4,a5
ffffffffc0206b9e:	408a0633          	sub	a2,s4,s0
ffffffffc0206ba2:	014af463          	bgeu	s5,s4,ffffffffc0206baa <do_execve+0x6b0>
ffffffffc0206ba6:	408a8633          	sub	a2,s5,s0
ffffffffc0206baa:	000c3783          	ld	a5,0(s8)
ffffffffc0206bae:	66e2                	ld	a3,24(sp)
ffffffffc0206bb0:	000cb583          	ld	a1,0(s9)
ffffffffc0206bb4:	40f507b3          	sub	a5,a0,a5
ffffffffc0206bb8:	8799                	srai	a5,a5,0x6
ffffffffc0206bba:	97da                	add	a5,a5,s6
ffffffffc0206bbc:	00d7f533          	and	a0,a5,a3
ffffffffc0206bc0:	00c79693          	slli	a3,a5,0xc
ffffffffc0206bc4:	08b57363          	bgeu	a0,a1,ffffffffc0206c4a <do_execve+0x750>
ffffffffc0206bc8:	00090797          	auipc	a5,0x90
ffffffffc0206bcc:	d2078793          	addi	a5,a5,-736 # ffffffffc02968e8 <va_pa_offset>
ffffffffc0206bd0:	639c                	ld	a5,0(a5)
ffffffffc0206bd2:	9432                	add	s0,s0,a2
ffffffffc0206bd4:	4581                	li	a1,0
ffffffffc0206bd6:	97b6                	add	a5,a5,a3
ffffffffc0206bd8:	00e78533          	add	a0,a5,a4
ffffffffc0206bdc:	74f040ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0206be0:	d1547fe3          	bgeu	s0,s5,ffffffffc02068fe <do_execve+0x404>
ffffffffc0206be4:	6c88                	ld	a0,24(s1)
ffffffffc0206be6:	864e                	mv	a2,s3
ffffffffc0206be8:	85d2                	mv	a1,s4
ffffffffc0206bea:	fc9fc0ef          	jal	ra,ffffffffc0203bb2 <pgdir_alloc_page>
ffffffffc0206bee:	f545                	bnez	a0,ffffffffc0206b96 <do_execve+0x69c>
ffffffffc0206bf0:	7ac2                	ld	s5,48(sp)
ffffffffc0206bf2:	7462                	ld	s0,56(sp)
ffffffffc0206bf4:	4a16                	lw	s4,68(sp)
ffffffffc0206bf6:	4781                	li	a5,0
ffffffffc0206bf8:	b3e5                	j	ffffffffc02069e0 <do_execve+0x4e6>
ffffffffc0206bfa:	6c88                	ld	a0,24(s1)
ffffffffc0206bfc:	59f1                	li	s3,-4
ffffffffc0206bfe:	f15fe0ef          	jal	ra,ffffffffc0205b12 <put_pgdir.isra.0>
ffffffffc0206c02:	8526                	mv	a0,s1
ffffffffc0206c04:	9e2fd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0206c08:	b4d1                	j	ffffffffc02066cc <do_execve+0x1d2>
ffffffffc0206c0a:	c80b8ee3          	beqz	s7,ffffffffc02068a6 <do_execve+0x3ac>
ffffffffc0206c0e:	038b8513          	addi	a0,s7,56
ffffffffc0206c12:	9dffd0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0206c16:	54f5                	li	s1,-3
ffffffffc0206c18:	040ba823          	sw	zero,80(s7)
ffffffffc0206c1c:	bea1                	j	ffffffffc0206774 <do_execve+0x27a>
ffffffffc0206c1e:	8526                	mv	a0,s1
ffffffffc0206c20:	9c6fd0ef          	jal	ra,ffffffffc0203de6 <mm_destroy>
ffffffffc0206c24:	59f1                	li	s3,-4
ffffffffc0206c26:	b45d                	j	ffffffffc02066cc <do_execve+0x1d2>
ffffffffc0206c28:	8aa2                	mv	s5,s0
ffffffffc0206c2a:	8a26                	mv	s4,s1
ffffffffc0206c2c:	4d81                	li	s11,0
ffffffffc0206c2e:	bdf5                	j	ffffffffc0206b2a <do_execve+0x630>
ffffffffc0206c30:	7ac2                	ld	s5,48(sp)
ffffffffc0206c32:	6482                	ld	s1,0(sp)
ffffffffc0206c34:	7462                	ld	s0,56(sp)
ffffffffc0206c36:	4a16                	lw	s4,68(sp)
ffffffffc0206c38:	87aa                	mv	a5,a0
ffffffffc0206c3a:	b35d                	j	ffffffffc02069e0 <do_execve+0x4e6>
ffffffffc0206c3c:	7ac2                	ld	s5,48(sp)
ffffffffc0206c3e:	6482                	ld	s1,0(sp)
ffffffffc0206c40:	7462                	ld	s0,56(sp)
ffffffffc0206c42:	4a16                	lw	s4,68(sp)
ffffffffc0206c44:	57e1                	li	a5,-8
ffffffffc0206c46:	bb69                	j	ffffffffc02069e0 <do_execve+0x4e6>
ffffffffc0206c48:	86ce                	mv	a3,s3
ffffffffc0206c4a:	00006617          	auipc	a2,0x6
ffffffffc0206c4e:	ee660613          	addi	a2,a2,-282 # ffffffffc020cb30 <default_pmm_manager+0x38>
ffffffffc0206c52:	07100593          	li	a1,113
ffffffffc0206c56:	00006517          	auipc	a0,0x6
ffffffffc0206c5a:	f0250513          	addi	a0,a0,-254 # ffffffffc020cb58 <default_pmm_manager+0x60>
ffffffffc0206c5e:	841f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c62:	89be                	mv	s3,a5
ffffffffc0206c64:	b4a5                	j	ffffffffc02066cc <do_execve+0x1d2>
ffffffffc0206c66:	e482                	sd	zero,72(sp)
ffffffffc0206c68:	b97d                	j	ffffffffc0206926 <do_execve+0x42c>
ffffffffc0206c6a:	00006617          	auipc	a2,0x6
ffffffffc0206c6e:	f6e60613          	addi	a2,a2,-146 # ffffffffc020cbd8 <default_pmm_manager+0xe0>
ffffffffc0206c72:	37e00593          	li	a1,894
ffffffffc0206c76:	00007517          	auipc	a0,0x7
ffffffffc0206c7a:	e9a50513          	addi	a0,a0,-358 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0206c7e:	821f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c82:	59f1                	li	s3,-4
ffffffffc0206c84:	b4a1                	j	ffffffffc02066cc <do_execve+0x1d2>
ffffffffc0206c86:	00007697          	auipc	a3,0x7
ffffffffc0206c8a:	17a68693          	addi	a3,a3,378 # ffffffffc020de00 <CSWTCH.79+0x3e0>
ffffffffc0206c8e:	00005617          	auipc	a2,0x5
ffffffffc0206c92:	38260613          	addi	a2,a2,898 # ffffffffc020c010 <commands+0x210>
ffffffffc0206c96:	37900593          	li	a1,889
ffffffffc0206c9a:	00007517          	auipc	a0,0x7
ffffffffc0206c9e:	e7650513          	addi	a0,a0,-394 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0206ca2:	ffcf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206ca6:	00007697          	auipc	a3,0x7
ffffffffc0206caa:	11268693          	addi	a3,a3,274 # ffffffffc020ddb8 <CSWTCH.79+0x398>
ffffffffc0206cae:	00005617          	auipc	a2,0x5
ffffffffc0206cb2:	36260613          	addi	a2,a2,866 # ffffffffc020c010 <commands+0x210>
ffffffffc0206cb6:	37800593          	li	a1,888
ffffffffc0206cba:	00007517          	auipc	a0,0x7
ffffffffc0206cbe:	e5650513          	addi	a0,a0,-426 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0206cc2:	fdcf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206cc6:	00007697          	auipc	a3,0x7
ffffffffc0206cca:	0aa68693          	addi	a3,a3,170 # ffffffffc020dd70 <CSWTCH.79+0x350>
ffffffffc0206cce:	00005617          	auipc	a2,0x5
ffffffffc0206cd2:	34260613          	addi	a2,a2,834 # ffffffffc020c010 <commands+0x210>
ffffffffc0206cd6:	37700593          	li	a1,887
ffffffffc0206cda:	00007517          	auipc	a0,0x7
ffffffffc0206cde:	e3650513          	addi	a0,a0,-458 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0206ce2:	fbcf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206ce6:	00007697          	auipc	a3,0x7
ffffffffc0206cea:	04268693          	addi	a3,a3,66 # ffffffffc020dd28 <CSWTCH.79+0x308>
ffffffffc0206cee:	00005617          	auipc	a2,0x5
ffffffffc0206cf2:	32260613          	addi	a2,a2,802 # ffffffffc020c010 <commands+0x210>
ffffffffc0206cf6:	37600593          	li	a1,886
ffffffffc0206cfa:	00007517          	auipc	a0,0x7
ffffffffc0206cfe:	e1650513          	addi	a0,a0,-490 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0206d02:	f9cf90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206d06 <user_main>:
ffffffffc0206d06:	7179                	addi	sp,sp,-48
ffffffffc0206d08:	e84a                	sd	s2,16(sp)
ffffffffc0206d0a:	00090917          	auipc	s2,0x90
ffffffffc0206d0e:	be690913          	addi	s2,s2,-1050 # ffffffffc02968f0 <current>
ffffffffc0206d12:	00093783          	ld	a5,0(s2)
ffffffffc0206d16:	00007617          	auipc	a2,0x7
ffffffffc0206d1a:	13260613          	addi	a2,a2,306 # ffffffffc020de48 <CSWTCH.79+0x428>
ffffffffc0206d1e:	00007517          	auipc	a0,0x7
ffffffffc0206d22:	13250513          	addi	a0,a0,306 # ffffffffc020de50 <CSWTCH.79+0x430>
ffffffffc0206d26:	43cc                	lw	a1,4(a5)
ffffffffc0206d28:	f406                	sd	ra,40(sp)
ffffffffc0206d2a:	f022                	sd	s0,32(sp)
ffffffffc0206d2c:	ec26                	sd	s1,24(sp)
ffffffffc0206d2e:	e032                	sd	a2,0(sp)
ffffffffc0206d30:	e402                	sd	zero,8(sp)
ffffffffc0206d32:	c74f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206d36:	6782                	ld	a5,0(sp)
ffffffffc0206d38:	cfb9                	beqz	a5,ffffffffc0206d96 <user_main+0x90>
ffffffffc0206d3a:	003c                	addi	a5,sp,8
ffffffffc0206d3c:	4401                	li	s0,0
ffffffffc0206d3e:	6398                	ld	a4,0(a5)
ffffffffc0206d40:	0405                	addi	s0,s0,1
ffffffffc0206d42:	07a1                	addi	a5,a5,8
ffffffffc0206d44:	ff6d                	bnez	a4,ffffffffc0206d3e <user_main+0x38>
ffffffffc0206d46:	00093783          	ld	a5,0(s2)
ffffffffc0206d4a:	12000613          	li	a2,288
ffffffffc0206d4e:	6b84                	ld	s1,16(a5)
ffffffffc0206d50:	73cc                	ld	a1,160(a5)
ffffffffc0206d52:	6789                	lui	a5,0x2
ffffffffc0206d54:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0206d58:	94be                	add	s1,s1,a5
ffffffffc0206d5a:	8526                	mv	a0,s1
ffffffffc0206d5c:	621040ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc0206d60:	00093783          	ld	a5,0(s2)
ffffffffc0206d64:	860a                	mv	a2,sp
ffffffffc0206d66:	0004059b          	sext.w	a1,s0
ffffffffc0206d6a:	f3c4                	sd	s1,160(a5)
ffffffffc0206d6c:	00007517          	auipc	a0,0x7
ffffffffc0206d70:	0dc50513          	addi	a0,a0,220 # ffffffffc020de48 <CSWTCH.79+0x428>
ffffffffc0206d74:	f86ff0ef          	jal	ra,ffffffffc02064fa <do_execve>
ffffffffc0206d78:	8126                	mv	sp,s1
ffffffffc0206d7a:	d62fa06f          	j	ffffffffc02012dc <__trapret>
ffffffffc0206d7e:	00007617          	auipc	a2,0x7
ffffffffc0206d82:	0fa60613          	addi	a2,a2,250 # ffffffffc020de78 <CSWTCH.79+0x458>
ffffffffc0206d86:	4aa00593          	li	a1,1194
ffffffffc0206d8a:	00007517          	auipc	a0,0x7
ffffffffc0206d8e:	d8650513          	addi	a0,a0,-634 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0206d92:	f0cf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206d96:	4401                	li	s0,0
ffffffffc0206d98:	b77d                	j	ffffffffc0206d46 <user_main+0x40>

ffffffffc0206d9a <do_yield>:
ffffffffc0206d9a:	00090797          	auipc	a5,0x90
ffffffffc0206d9e:	b567b783          	ld	a5,-1194(a5) # ffffffffc02968f0 <current>
ffffffffc0206da2:	4705                	li	a4,1
ffffffffc0206da4:	ef98                	sd	a4,24(a5)
ffffffffc0206da6:	4501                	li	a0,0
ffffffffc0206da8:	8082                	ret

ffffffffc0206daa <do_wait>:
ffffffffc0206daa:	1101                	addi	sp,sp,-32
ffffffffc0206dac:	e822                	sd	s0,16(sp)
ffffffffc0206dae:	e426                	sd	s1,8(sp)
ffffffffc0206db0:	ec06                	sd	ra,24(sp)
ffffffffc0206db2:	842e                	mv	s0,a1
ffffffffc0206db4:	84aa                	mv	s1,a0
ffffffffc0206db6:	c999                	beqz	a1,ffffffffc0206dcc <do_wait+0x22>
ffffffffc0206db8:	00090797          	auipc	a5,0x90
ffffffffc0206dbc:	b387b783          	ld	a5,-1224(a5) # ffffffffc02968f0 <current>
ffffffffc0206dc0:	7788                	ld	a0,40(a5)
ffffffffc0206dc2:	4685                	li	a3,1
ffffffffc0206dc4:	4611                	li	a2,4
ffffffffc0206dc6:	d5cfd0ef          	jal	ra,ffffffffc0204322 <user_mem_check>
ffffffffc0206dca:	c909                	beqz	a0,ffffffffc0206ddc <do_wait+0x32>
ffffffffc0206dcc:	85a2                	mv	a1,s0
ffffffffc0206dce:	6442                	ld	s0,16(sp)
ffffffffc0206dd0:	60e2                	ld	ra,24(sp)
ffffffffc0206dd2:	8526                	mv	a0,s1
ffffffffc0206dd4:	64a2                	ld	s1,8(sp)
ffffffffc0206dd6:	6105                	addi	sp,sp,32
ffffffffc0206dd8:	becff06f          	j	ffffffffc02061c4 <do_wait.part.0>
ffffffffc0206ddc:	60e2                	ld	ra,24(sp)
ffffffffc0206dde:	6442                	ld	s0,16(sp)
ffffffffc0206de0:	64a2                	ld	s1,8(sp)
ffffffffc0206de2:	5575                	li	a0,-3
ffffffffc0206de4:	6105                	addi	sp,sp,32
ffffffffc0206de6:	8082                	ret

ffffffffc0206de8 <do_kill>:
ffffffffc0206de8:	1141                	addi	sp,sp,-16
ffffffffc0206dea:	6789                	lui	a5,0x2
ffffffffc0206dec:	e406                	sd	ra,8(sp)
ffffffffc0206dee:	e022                	sd	s0,0(sp)
ffffffffc0206df0:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206df4:	17f9                	addi	a5,a5,-2
ffffffffc0206df6:	02e7e963          	bltu	a5,a4,ffffffffc0206e28 <do_kill+0x40>
ffffffffc0206dfa:	842a                	mv	s0,a0
ffffffffc0206dfc:	45a9                	li	a1,10
ffffffffc0206dfe:	2501                	sext.w	a0,a0
ffffffffc0206e00:	7f6040ef          	jal	ra,ffffffffc020b5f6 <hash32>
ffffffffc0206e04:	02051793          	slli	a5,a0,0x20
ffffffffc0206e08:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0206e0c:	0008b797          	auipc	a5,0x8b
ffffffffc0206e10:	9e478793          	addi	a5,a5,-1564 # ffffffffc02917f0 <hash_list>
ffffffffc0206e14:	953e                	add	a0,a0,a5
ffffffffc0206e16:	87aa                	mv	a5,a0
ffffffffc0206e18:	a029                	j	ffffffffc0206e22 <do_kill+0x3a>
ffffffffc0206e1a:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0206e1e:	00870b63          	beq	a4,s0,ffffffffc0206e34 <do_kill+0x4c>
ffffffffc0206e22:	679c                	ld	a5,8(a5)
ffffffffc0206e24:	fef51be3          	bne	a0,a5,ffffffffc0206e1a <do_kill+0x32>
ffffffffc0206e28:	5475                	li	s0,-3
ffffffffc0206e2a:	60a2                	ld	ra,8(sp)
ffffffffc0206e2c:	8522                	mv	a0,s0
ffffffffc0206e2e:	6402                	ld	s0,0(sp)
ffffffffc0206e30:	0141                	addi	sp,sp,16
ffffffffc0206e32:	8082                	ret
ffffffffc0206e34:	fd87a703          	lw	a4,-40(a5)
ffffffffc0206e38:	00177693          	andi	a3,a4,1
ffffffffc0206e3c:	e295                	bnez	a3,ffffffffc0206e60 <do_kill+0x78>
ffffffffc0206e3e:	4bd4                	lw	a3,20(a5)
ffffffffc0206e40:	00176713          	ori	a4,a4,1
ffffffffc0206e44:	fce7ac23          	sw	a4,-40(a5)
ffffffffc0206e48:	4401                	li	s0,0
ffffffffc0206e4a:	fe06d0e3          	bgez	a3,ffffffffc0206e2a <do_kill+0x42>
ffffffffc0206e4e:	f2878513          	addi	a0,a5,-216
ffffffffc0206e52:	2f9000ef          	jal	ra,ffffffffc020794a <wakeup_proc>
ffffffffc0206e56:	60a2                	ld	ra,8(sp)
ffffffffc0206e58:	8522                	mv	a0,s0
ffffffffc0206e5a:	6402                	ld	s0,0(sp)
ffffffffc0206e5c:	0141                	addi	sp,sp,16
ffffffffc0206e5e:	8082                	ret
ffffffffc0206e60:	545d                	li	s0,-9
ffffffffc0206e62:	b7e1                	j	ffffffffc0206e2a <do_kill+0x42>

ffffffffc0206e64 <proc_init>:
ffffffffc0206e64:	1101                	addi	sp,sp,-32
ffffffffc0206e66:	e426                	sd	s1,8(sp)
ffffffffc0206e68:	0008f797          	auipc	a5,0x8f
ffffffffc0206e6c:	98878793          	addi	a5,a5,-1656 # ffffffffc02957f0 <proc_list>
ffffffffc0206e70:	ec06                	sd	ra,24(sp)
ffffffffc0206e72:	e822                	sd	s0,16(sp)
ffffffffc0206e74:	e04a                	sd	s2,0(sp)
ffffffffc0206e76:	0008b497          	auipc	s1,0x8b
ffffffffc0206e7a:	97a48493          	addi	s1,s1,-1670 # ffffffffc02917f0 <hash_list>
ffffffffc0206e7e:	e79c                	sd	a5,8(a5)
ffffffffc0206e80:	e39c                	sd	a5,0(a5)
ffffffffc0206e82:	0008f717          	auipc	a4,0x8f
ffffffffc0206e86:	96e70713          	addi	a4,a4,-1682 # ffffffffc02957f0 <proc_list>
ffffffffc0206e8a:	87a6                	mv	a5,s1
ffffffffc0206e8c:	e79c                	sd	a5,8(a5)
ffffffffc0206e8e:	e39c                	sd	a5,0(a5)
ffffffffc0206e90:	07c1                	addi	a5,a5,16
ffffffffc0206e92:	fef71de3          	bne	a4,a5,ffffffffc0206e8c <proc_init+0x28>
ffffffffc0206e96:	bcffe0ef          	jal	ra,ffffffffc0205a64 <alloc_proc>
ffffffffc0206e9a:	00090917          	auipc	s2,0x90
ffffffffc0206e9e:	a5e90913          	addi	s2,s2,-1442 # ffffffffc02968f8 <idleproc>
ffffffffc0206ea2:	00a93023          	sd	a0,0(s2)
ffffffffc0206ea6:	842a                	mv	s0,a0
ffffffffc0206ea8:	12050863          	beqz	a0,ffffffffc0206fd8 <proc_init+0x174>
ffffffffc0206eac:	4789                	li	a5,2
ffffffffc0206eae:	e11c                	sd	a5,0(a0)
ffffffffc0206eb0:	0000a797          	auipc	a5,0xa
ffffffffc0206eb4:	15078793          	addi	a5,a5,336 # ffffffffc0211000 <bootstack>
ffffffffc0206eb8:	e91c                	sd	a5,16(a0)
ffffffffc0206eba:	4785                	li	a5,1
ffffffffc0206ebc:	ed1c                	sd	a5,24(a0)
ffffffffc0206ebe:	ba0fe0ef          	jal	ra,ffffffffc020525e <files_create>
ffffffffc0206ec2:	14a43823          	sd	a0,336(s0)
ffffffffc0206ec6:	0e050d63          	beqz	a0,ffffffffc0206fc0 <proc_init+0x15c>
ffffffffc0206eca:	00093403          	ld	s0,0(s2)
ffffffffc0206ece:	4641                	li	a2,16
ffffffffc0206ed0:	4581                	li	a1,0
ffffffffc0206ed2:	15043703          	ld	a4,336(s0)
ffffffffc0206ed6:	0b440413          	addi	s0,s0,180
ffffffffc0206eda:	8522                	mv	a0,s0
ffffffffc0206edc:	4b1c                	lw	a5,16(a4)
ffffffffc0206ede:	2785                	addiw	a5,a5,1
ffffffffc0206ee0:	cb1c                	sw	a5,16(a4)
ffffffffc0206ee2:	449040ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0206ee6:	463d                	li	a2,15
ffffffffc0206ee8:	00007597          	auipc	a1,0x7
ffffffffc0206eec:	ff058593          	addi	a1,a1,-16 # ffffffffc020ded8 <CSWTCH.79+0x4b8>
ffffffffc0206ef0:	8522                	mv	a0,s0
ffffffffc0206ef2:	48b040ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc0206ef6:	00090717          	auipc	a4,0x90
ffffffffc0206efa:	a1270713          	addi	a4,a4,-1518 # ffffffffc0296908 <nr_process>
ffffffffc0206efe:	431c                	lw	a5,0(a4)
ffffffffc0206f00:	00093683          	ld	a3,0(s2)
ffffffffc0206f04:	4601                	li	a2,0
ffffffffc0206f06:	2785                	addiw	a5,a5,1
ffffffffc0206f08:	4581                	li	a1,0
ffffffffc0206f0a:	fffff517          	auipc	a0,0xfffff
ffffffffc0206f0e:	4a050513          	addi	a0,a0,1184 # ffffffffc02063aa <init_main>
ffffffffc0206f12:	c31c                	sw	a5,0(a4)
ffffffffc0206f14:	00090797          	auipc	a5,0x90
ffffffffc0206f18:	9cd7be23          	sd	a3,-1572(a5) # ffffffffc02968f0 <current>
ffffffffc0206f1c:	8daff0ef          	jal	ra,ffffffffc0205ff6 <kernel_thread>
ffffffffc0206f20:	842a                	mv	s0,a0
ffffffffc0206f22:	08a05363          	blez	a0,ffffffffc0206fa8 <proc_init+0x144>
ffffffffc0206f26:	6789                	lui	a5,0x2
ffffffffc0206f28:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206f2c:	17f9                	addi	a5,a5,-2
ffffffffc0206f2e:	2501                	sext.w	a0,a0
ffffffffc0206f30:	02e7e363          	bltu	a5,a4,ffffffffc0206f56 <proc_init+0xf2>
ffffffffc0206f34:	45a9                	li	a1,10
ffffffffc0206f36:	6c0040ef          	jal	ra,ffffffffc020b5f6 <hash32>
ffffffffc0206f3a:	02051793          	slli	a5,a0,0x20
ffffffffc0206f3e:	01c7d693          	srli	a3,a5,0x1c
ffffffffc0206f42:	96a6                	add	a3,a3,s1
ffffffffc0206f44:	87b6                	mv	a5,a3
ffffffffc0206f46:	a029                	j	ffffffffc0206f50 <proc_init+0xec>
ffffffffc0206f48:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_bin_swap_img_size-0x5dd4>
ffffffffc0206f4c:	04870b63          	beq	a4,s0,ffffffffc0206fa2 <proc_init+0x13e>
ffffffffc0206f50:	679c                	ld	a5,8(a5)
ffffffffc0206f52:	fef69be3          	bne	a3,a5,ffffffffc0206f48 <proc_init+0xe4>
ffffffffc0206f56:	4781                	li	a5,0
ffffffffc0206f58:	0b478493          	addi	s1,a5,180
ffffffffc0206f5c:	4641                	li	a2,16
ffffffffc0206f5e:	4581                	li	a1,0
ffffffffc0206f60:	00090417          	auipc	s0,0x90
ffffffffc0206f64:	9a040413          	addi	s0,s0,-1632 # ffffffffc0296900 <initproc>
ffffffffc0206f68:	8526                	mv	a0,s1
ffffffffc0206f6a:	e01c                	sd	a5,0(s0)
ffffffffc0206f6c:	3bf040ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0206f70:	463d                	li	a2,15
ffffffffc0206f72:	00007597          	auipc	a1,0x7
ffffffffc0206f76:	f8e58593          	addi	a1,a1,-114 # ffffffffc020df00 <CSWTCH.79+0x4e0>
ffffffffc0206f7a:	8526                	mv	a0,s1
ffffffffc0206f7c:	401040ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc0206f80:	00093783          	ld	a5,0(s2)
ffffffffc0206f84:	c7d1                	beqz	a5,ffffffffc0207010 <proc_init+0x1ac>
ffffffffc0206f86:	43dc                	lw	a5,4(a5)
ffffffffc0206f88:	e7c1                	bnez	a5,ffffffffc0207010 <proc_init+0x1ac>
ffffffffc0206f8a:	601c                	ld	a5,0(s0)
ffffffffc0206f8c:	c3b5                	beqz	a5,ffffffffc0206ff0 <proc_init+0x18c>
ffffffffc0206f8e:	43d8                	lw	a4,4(a5)
ffffffffc0206f90:	4785                	li	a5,1
ffffffffc0206f92:	04f71f63          	bne	a4,a5,ffffffffc0206ff0 <proc_init+0x18c>
ffffffffc0206f96:	60e2                	ld	ra,24(sp)
ffffffffc0206f98:	6442                	ld	s0,16(sp)
ffffffffc0206f9a:	64a2                	ld	s1,8(sp)
ffffffffc0206f9c:	6902                	ld	s2,0(sp)
ffffffffc0206f9e:	6105                	addi	sp,sp,32
ffffffffc0206fa0:	8082                	ret
ffffffffc0206fa2:	f2878793          	addi	a5,a5,-216
ffffffffc0206fa6:	bf4d                	j	ffffffffc0206f58 <proc_init+0xf4>
ffffffffc0206fa8:	00007617          	auipc	a2,0x7
ffffffffc0206fac:	f3860613          	addi	a2,a2,-200 # ffffffffc020dee0 <CSWTCH.79+0x4c0>
ffffffffc0206fb0:	4f600593          	li	a1,1270
ffffffffc0206fb4:	00007517          	auipc	a0,0x7
ffffffffc0206fb8:	b5c50513          	addi	a0,a0,-1188 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0206fbc:	ce2f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206fc0:	00007617          	auipc	a2,0x7
ffffffffc0206fc4:	ef060613          	addi	a2,a2,-272 # ffffffffc020deb0 <CSWTCH.79+0x490>
ffffffffc0206fc8:	4ea00593          	li	a1,1258
ffffffffc0206fcc:	00007517          	auipc	a0,0x7
ffffffffc0206fd0:	b4450513          	addi	a0,a0,-1212 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0206fd4:	ccaf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206fd8:	00007617          	auipc	a2,0x7
ffffffffc0206fdc:	ec060613          	addi	a2,a2,-320 # ffffffffc020de98 <CSWTCH.79+0x478>
ffffffffc0206fe0:	4e000593          	li	a1,1248
ffffffffc0206fe4:	00007517          	auipc	a0,0x7
ffffffffc0206fe8:	b2c50513          	addi	a0,a0,-1236 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc0206fec:	cb2f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206ff0:	00007697          	auipc	a3,0x7
ffffffffc0206ff4:	f4068693          	addi	a3,a3,-192 # ffffffffc020df30 <CSWTCH.79+0x510>
ffffffffc0206ff8:	00005617          	auipc	a2,0x5
ffffffffc0206ffc:	01860613          	addi	a2,a2,24 # ffffffffc020c010 <commands+0x210>
ffffffffc0207000:	4fd00593          	li	a1,1277
ffffffffc0207004:	00007517          	auipc	a0,0x7
ffffffffc0207008:	b0c50513          	addi	a0,a0,-1268 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc020700c:	c92f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207010:	00007697          	auipc	a3,0x7
ffffffffc0207014:	ef868693          	addi	a3,a3,-264 # ffffffffc020df08 <CSWTCH.79+0x4e8>
ffffffffc0207018:	00005617          	auipc	a2,0x5
ffffffffc020701c:	ff860613          	addi	a2,a2,-8 # ffffffffc020c010 <commands+0x210>
ffffffffc0207020:	4fc00593          	li	a1,1276
ffffffffc0207024:	00007517          	auipc	a0,0x7
ffffffffc0207028:	aec50513          	addi	a0,a0,-1300 # ffffffffc020db10 <CSWTCH.79+0xf0>
ffffffffc020702c:	c72f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207030 <cpu_idle>:
ffffffffc0207030:	1141                	addi	sp,sp,-16
ffffffffc0207032:	e022                	sd	s0,0(sp)
ffffffffc0207034:	e406                	sd	ra,8(sp)
ffffffffc0207036:	00090417          	auipc	s0,0x90
ffffffffc020703a:	8ba40413          	addi	s0,s0,-1862 # ffffffffc02968f0 <current>
ffffffffc020703e:	6018                	ld	a4,0(s0)
ffffffffc0207040:	6f1c                	ld	a5,24(a4)
ffffffffc0207042:	dffd                	beqz	a5,ffffffffc0207040 <cpu_idle+0x10>
ffffffffc0207044:	1b9000ef          	jal	ra,ffffffffc02079fc <schedule>
ffffffffc0207048:	bfdd                	j	ffffffffc020703e <cpu_idle+0xe>

ffffffffc020704a <lab6_set_priority>:
ffffffffc020704a:	1101                	addi	sp,sp,-32
ffffffffc020704c:	e822                	sd	s0,16(sp)
ffffffffc020704e:	85aa                	mv	a1,a0
ffffffffc0207050:	842a                	mv	s0,a0
ffffffffc0207052:	00007517          	auipc	a0,0x7
ffffffffc0207056:	f0650513          	addi	a0,a0,-250 # ffffffffc020df58 <CSWTCH.79+0x538>
ffffffffc020705a:	e426                	sd	s1,8(sp)
ffffffffc020705c:	ec06                	sd	ra,24(sp)
ffffffffc020705e:	00090497          	auipc	s1,0x90
ffffffffc0207062:	89248493          	addi	s1,s1,-1902 # ffffffffc02968f0 <current>
ffffffffc0207066:	940f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020706a:	609c                	ld	a5,0(s1)
ffffffffc020706c:	ec09                	bnez	s0,ffffffffc0207086 <lab6_set_priority+0x3c>
ffffffffc020706e:	4705                	li	a4,1
ffffffffc0207070:	14e7a423          	sw	a4,328(a5)
ffffffffc0207074:	7c2000ef          	jal	ra,ffffffffc0207836 <sched_set_class_stride>
ffffffffc0207078:	6442                	ld	s0,16(sp)
ffffffffc020707a:	6088                	ld	a0,0(s1)
ffffffffc020707c:	60e2                	ld	ra,24(sp)
ffffffffc020707e:	64a2                	ld	s1,8(sp)
ffffffffc0207080:	6105                	addi	sp,sp,32
ffffffffc0207082:	01f0006f          	j	ffffffffc02078a0 <sched_update_proc>
ffffffffc0207086:	1487a423          	sw	s0,328(a5)
ffffffffc020708a:	b7ed                	j	ffffffffc0207074 <lab6_set_priority+0x2a>

ffffffffc020708c <do_sleep>:
ffffffffc020708c:	c539                	beqz	a0,ffffffffc02070da <do_sleep+0x4e>
ffffffffc020708e:	7179                	addi	sp,sp,-48
ffffffffc0207090:	f022                	sd	s0,32(sp)
ffffffffc0207092:	f406                	sd	ra,40(sp)
ffffffffc0207094:	842a                	mv	s0,a0
ffffffffc0207096:	100027f3          	csrr	a5,sstatus
ffffffffc020709a:	8b89                	andi	a5,a5,2
ffffffffc020709c:	e3a9                	bnez	a5,ffffffffc02070de <do_sleep+0x52>
ffffffffc020709e:	00090797          	auipc	a5,0x90
ffffffffc02070a2:	8527b783          	ld	a5,-1966(a5) # ffffffffc02968f0 <current>
ffffffffc02070a6:	0818                	addi	a4,sp,16
ffffffffc02070a8:	c02a                	sw	a0,0(sp)
ffffffffc02070aa:	ec3a                	sd	a4,24(sp)
ffffffffc02070ac:	e83a                	sd	a4,16(sp)
ffffffffc02070ae:	e43e                	sd	a5,8(sp)
ffffffffc02070b0:	4705                	li	a4,1
ffffffffc02070b2:	c398                	sw	a4,0(a5)
ffffffffc02070b4:	80000737          	lui	a4,0x80000
ffffffffc02070b8:	840a                	mv	s0,sp
ffffffffc02070ba:	0709                	addi	a4,a4,2
ffffffffc02070bc:	0ee7a623          	sw	a4,236(a5)
ffffffffc02070c0:	8522                	mv	a0,s0
ffffffffc02070c2:	1fb000ef          	jal	ra,ffffffffc0207abc <add_timer>
ffffffffc02070c6:	137000ef          	jal	ra,ffffffffc02079fc <schedule>
ffffffffc02070ca:	8522                	mv	a0,s0
ffffffffc02070cc:	2b9000ef          	jal	ra,ffffffffc0207b84 <del_timer>
ffffffffc02070d0:	70a2                	ld	ra,40(sp)
ffffffffc02070d2:	7402                	ld	s0,32(sp)
ffffffffc02070d4:	4501                	li	a0,0
ffffffffc02070d6:	6145                	addi	sp,sp,48
ffffffffc02070d8:	8082                	ret
ffffffffc02070da:	4501                	li	a0,0
ffffffffc02070dc:	8082                	ret
ffffffffc02070de:	b95f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02070e2:	00090797          	auipc	a5,0x90
ffffffffc02070e6:	80e7b783          	ld	a5,-2034(a5) # ffffffffc02968f0 <current>
ffffffffc02070ea:	0818                	addi	a4,sp,16
ffffffffc02070ec:	c022                	sw	s0,0(sp)
ffffffffc02070ee:	e43e                	sd	a5,8(sp)
ffffffffc02070f0:	ec3a                	sd	a4,24(sp)
ffffffffc02070f2:	e83a                	sd	a4,16(sp)
ffffffffc02070f4:	4705                	li	a4,1
ffffffffc02070f6:	c398                	sw	a4,0(a5)
ffffffffc02070f8:	80000737          	lui	a4,0x80000
ffffffffc02070fc:	0709                	addi	a4,a4,2
ffffffffc02070fe:	840a                	mv	s0,sp
ffffffffc0207100:	8522                	mv	a0,s0
ffffffffc0207102:	0ee7a623          	sw	a4,236(a5)
ffffffffc0207106:	1b7000ef          	jal	ra,ffffffffc0207abc <add_timer>
ffffffffc020710a:	b63f90ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020710e:	bf65                	j	ffffffffc02070c6 <do_sleep+0x3a>

ffffffffc0207110 <switch_to>:
ffffffffc0207110:	00153023          	sd	ra,0(a0)
ffffffffc0207114:	00253423          	sd	sp,8(a0)
ffffffffc0207118:	e900                	sd	s0,16(a0)
ffffffffc020711a:	ed04                	sd	s1,24(a0)
ffffffffc020711c:	03253023          	sd	s2,32(a0)
ffffffffc0207120:	03353423          	sd	s3,40(a0)
ffffffffc0207124:	03453823          	sd	s4,48(a0)
ffffffffc0207128:	03553c23          	sd	s5,56(a0)
ffffffffc020712c:	05653023          	sd	s6,64(a0)
ffffffffc0207130:	05753423          	sd	s7,72(a0)
ffffffffc0207134:	05853823          	sd	s8,80(a0)
ffffffffc0207138:	05953c23          	sd	s9,88(a0)
ffffffffc020713c:	07a53023          	sd	s10,96(a0)
ffffffffc0207140:	07b53423          	sd	s11,104(a0)
ffffffffc0207144:	0005b083          	ld	ra,0(a1)
ffffffffc0207148:	0085b103          	ld	sp,8(a1)
ffffffffc020714c:	6980                	ld	s0,16(a1)
ffffffffc020714e:	6d84                	ld	s1,24(a1)
ffffffffc0207150:	0205b903          	ld	s2,32(a1)
ffffffffc0207154:	0285b983          	ld	s3,40(a1)
ffffffffc0207158:	0305ba03          	ld	s4,48(a1)
ffffffffc020715c:	0385ba83          	ld	s5,56(a1)
ffffffffc0207160:	0405bb03          	ld	s6,64(a1)
ffffffffc0207164:	0485bb83          	ld	s7,72(a1)
ffffffffc0207168:	0505bc03          	ld	s8,80(a1)
ffffffffc020716c:	0585bc83          	ld	s9,88(a1)
ffffffffc0207170:	0605bd03          	ld	s10,96(a1)
ffffffffc0207174:	0685bd83          	ld	s11,104(a1)
ffffffffc0207178:	8082                	ret

ffffffffc020717a <RR_init>:
ffffffffc020717a:	e508                	sd	a0,8(a0)
ffffffffc020717c:	e108                	sd	a0,0(a0)
ffffffffc020717e:	00052823          	sw	zero,16(a0)
ffffffffc0207182:	8082                	ret

ffffffffc0207184 <RR_pick_next>:
ffffffffc0207184:	651c                	ld	a5,8(a0)
ffffffffc0207186:	00f50563          	beq	a0,a5,ffffffffc0207190 <RR_pick_next+0xc>
ffffffffc020718a:	ef078513          	addi	a0,a5,-272
ffffffffc020718e:	8082                	ret
ffffffffc0207190:	4501                	li	a0,0
ffffffffc0207192:	8082                	ret

ffffffffc0207194 <RR_proc_tick>:
ffffffffc0207194:	1205a783          	lw	a5,288(a1)
ffffffffc0207198:	00f05563          	blez	a5,ffffffffc02071a2 <RR_proc_tick+0xe>
ffffffffc020719c:	37fd                	addiw	a5,a5,-1
ffffffffc020719e:	12f5a023          	sw	a5,288(a1)
ffffffffc02071a2:	e399                	bnez	a5,ffffffffc02071a8 <RR_proc_tick+0x14>
ffffffffc02071a4:	4785                	li	a5,1
ffffffffc02071a6:	ed9c                	sd	a5,24(a1)
ffffffffc02071a8:	8082                	ret

ffffffffc02071aa <RR_dequeue>:
ffffffffc02071aa:	1185b703          	ld	a4,280(a1)
ffffffffc02071ae:	11058793          	addi	a5,a1,272
ffffffffc02071b2:	02e78363          	beq	a5,a4,ffffffffc02071d8 <RR_dequeue+0x2e>
ffffffffc02071b6:	1085b683          	ld	a3,264(a1)
ffffffffc02071ba:	00a69f63          	bne	a3,a0,ffffffffc02071d8 <RR_dequeue+0x2e>
ffffffffc02071be:	1105b503          	ld	a0,272(a1)
ffffffffc02071c2:	4a90                	lw	a2,16(a3)
ffffffffc02071c4:	e518                	sd	a4,8(a0)
ffffffffc02071c6:	e308                	sd	a0,0(a4)
ffffffffc02071c8:	10f5bc23          	sd	a5,280(a1)
ffffffffc02071cc:	10f5b823          	sd	a5,272(a1)
ffffffffc02071d0:	fff6079b          	addiw	a5,a2,-1
ffffffffc02071d4:	ca9c                	sw	a5,16(a3)
ffffffffc02071d6:	8082                	ret
ffffffffc02071d8:	1141                	addi	sp,sp,-16
ffffffffc02071da:	00007697          	auipc	a3,0x7
ffffffffc02071de:	d9668693          	addi	a3,a3,-618 # ffffffffc020df70 <CSWTCH.79+0x550>
ffffffffc02071e2:	00005617          	auipc	a2,0x5
ffffffffc02071e6:	e2e60613          	addi	a2,a2,-466 # ffffffffc020c010 <commands+0x210>
ffffffffc02071ea:	03c00593          	li	a1,60
ffffffffc02071ee:	00007517          	auipc	a0,0x7
ffffffffc02071f2:	dba50513          	addi	a0,a0,-582 # ffffffffc020dfa8 <CSWTCH.79+0x588>
ffffffffc02071f6:	e406                	sd	ra,8(sp)
ffffffffc02071f8:	aa6f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02071fc <RR_enqueue>:
ffffffffc02071fc:	1185b703          	ld	a4,280(a1)
ffffffffc0207200:	11058793          	addi	a5,a1,272
ffffffffc0207204:	02e79d63          	bne	a5,a4,ffffffffc020723e <RR_enqueue+0x42>
ffffffffc0207208:	6118                	ld	a4,0(a0)
ffffffffc020720a:	1205a683          	lw	a3,288(a1)
ffffffffc020720e:	e11c                	sd	a5,0(a0)
ffffffffc0207210:	e71c                	sd	a5,8(a4)
ffffffffc0207212:	10a5bc23          	sd	a0,280(a1)
ffffffffc0207216:	10e5b823          	sd	a4,272(a1)
ffffffffc020721a:	495c                	lw	a5,20(a0)
ffffffffc020721c:	ea89                	bnez	a3,ffffffffc020722e <RR_enqueue+0x32>
ffffffffc020721e:	12f5a023          	sw	a5,288(a1)
ffffffffc0207222:	491c                	lw	a5,16(a0)
ffffffffc0207224:	10a5b423          	sd	a0,264(a1)
ffffffffc0207228:	2785                	addiw	a5,a5,1
ffffffffc020722a:	c91c                	sw	a5,16(a0)
ffffffffc020722c:	8082                	ret
ffffffffc020722e:	fed7c8e3          	blt	a5,a3,ffffffffc020721e <RR_enqueue+0x22>
ffffffffc0207232:	491c                	lw	a5,16(a0)
ffffffffc0207234:	10a5b423          	sd	a0,264(a1)
ffffffffc0207238:	2785                	addiw	a5,a5,1
ffffffffc020723a:	c91c                	sw	a5,16(a0)
ffffffffc020723c:	8082                	ret
ffffffffc020723e:	1141                	addi	sp,sp,-16
ffffffffc0207240:	00007697          	auipc	a3,0x7
ffffffffc0207244:	d8868693          	addi	a3,a3,-632 # ffffffffc020dfc8 <CSWTCH.79+0x5a8>
ffffffffc0207248:	00005617          	auipc	a2,0x5
ffffffffc020724c:	dc860613          	addi	a2,a2,-568 # ffffffffc020c010 <commands+0x210>
ffffffffc0207250:	02800593          	li	a1,40
ffffffffc0207254:	00007517          	auipc	a0,0x7
ffffffffc0207258:	d5450513          	addi	a0,a0,-684 # ffffffffc020dfa8 <CSWTCH.79+0x588>
ffffffffc020725c:	e406                	sd	ra,8(sp)
ffffffffc020725e:	a40f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207262 <stride_init>:
ffffffffc0207262:	e508                	sd	a0,8(a0)
ffffffffc0207264:	e108                	sd	a0,0(a0)
ffffffffc0207266:	00053c23          	sd	zero,24(a0)
ffffffffc020726a:	00052823          	sw	zero,16(a0)
ffffffffc020726e:	8082                	ret

ffffffffc0207270 <stride_pick_next>:
ffffffffc0207270:	6d1c                	ld	a5,24(a0)
ffffffffc0207272:	c785                	beqz	a5,ffffffffc020729a <stride_pick_next+0x2a>
ffffffffc0207274:	5398                	lw	a4,32(a5)
ffffffffc0207276:	ed878513          	addi	a0,a5,-296
ffffffffc020727a:	0007069b          	sext.w	a3,a4
ffffffffc020727e:	ce81                	beqz	a3,ffffffffc0207296 <stride_pick_next+0x26>
ffffffffc0207280:	02071693          	slli	a3,a4,0x20
ffffffffc0207284:	4705                	li	a4,1
ffffffffc0207286:	9281                	srli	a3,a3,0x20
ffffffffc0207288:	1722                	slli	a4,a4,0x28
ffffffffc020728a:	02d75733          	divu	a4,a4,a3
ffffffffc020728e:	6f94                	ld	a3,24(a5)
ffffffffc0207290:	9736                	add	a4,a4,a3
ffffffffc0207292:	ef98                	sd	a4,24(a5)
ffffffffc0207294:	8082                	ret
ffffffffc0207296:	4705                	li	a4,1
ffffffffc0207298:	b7e5                	j	ffffffffc0207280 <stride_pick_next+0x10>
ffffffffc020729a:	4501                	li	a0,0
ffffffffc020729c:	8082                	ret

ffffffffc020729e <stride_proc_tick>:
ffffffffc020729e:	1205a783          	lw	a5,288(a1)
ffffffffc02072a2:	00f05563          	blez	a5,ffffffffc02072ac <stride_proc_tick+0xe>
ffffffffc02072a6:	37fd                	addiw	a5,a5,-1
ffffffffc02072a8:	12f5a023          	sw	a5,288(a1)
ffffffffc02072ac:	e399                	bnez	a5,ffffffffc02072b2 <stride_proc_tick+0x14>
ffffffffc02072ae:	4785                	li	a5,1
ffffffffc02072b0:	ed9c                	sd	a5,24(a1)
ffffffffc02072b2:	8082                	ret

ffffffffc02072b4 <skew_heap_merge.constprop.0>:
ffffffffc02072b4:	7139                	addi	sp,sp,-64
ffffffffc02072b6:	f822                	sd	s0,48(sp)
ffffffffc02072b8:	fc06                	sd	ra,56(sp)
ffffffffc02072ba:	f426                	sd	s1,40(sp)
ffffffffc02072bc:	f04a                	sd	s2,32(sp)
ffffffffc02072be:	ec4e                	sd	s3,24(sp)
ffffffffc02072c0:	e852                	sd	s4,16(sp)
ffffffffc02072c2:	e456                	sd	s5,8(sp)
ffffffffc02072c4:	e05a                	sd	s6,0(sp)
ffffffffc02072c6:	842e                	mv	s0,a1
ffffffffc02072c8:	c925                	beqz	a0,ffffffffc0207338 <skew_heap_merge.constprop.0+0x84>
ffffffffc02072ca:	84aa                	mv	s1,a0
ffffffffc02072cc:	c1ed                	beqz	a1,ffffffffc02073ae <skew_heap_merge.constprop.0+0xfa>
ffffffffc02072ce:	6d1c                	ld	a5,24(a0)
ffffffffc02072d0:	6d98                	ld	a4,24(a1)
ffffffffc02072d2:	40e786b3          	sub	a3,a5,a4
ffffffffc02072d6:	0606cc63          	bltz	a3,ffffffffc020734e <skew_heap_merge.constprop.0+0x9a>
ffffffffc02072da:	0105b903          	ld	s2,16(a1)
ffffffffc02072de:	0085ba03          	ld	s4,8(a1)
ffffffffc02072e2:	04090763          	beqz	s2,ffffffffc0207330 <skew_heap_merge.constprop.0+0x7c>
ffffffffc02072e6:	01893703          	ld	a4,24(s2)
ffffffffc02072ea:	40e786b3          	sub	a3,a5,a4
ffffffffc02072ee:	0c06c263          	bltz	a3,ffffffffc02073b2 <skew_heap_merge.constprop.0+0xfe>
ffffffffc02072f2:	01093983          	ld	s3,16(s2)
ffffffffc02072f6:	00893a83          	ld	s5,8(s2)
ffffffffc02072fa:	10098c63          	beqz	s3,ffffffffc0207412 <skew_heap_merge.constprop.0+0x15e>
ffffffffc02072fe:	0189b703          	ld	a4,24(s3)
ffffffffc0207302:	8f99                	sub	a5,a5,a4
ffffffffc0207304:	1407c863          	bltz	a5,ffffffffc0207454 <skew_heap_merge.constprop.0+0x1a0>
ffffffffc0207308:	0109b583          	ld	a1,16(s3)
ffffffffc020730c:	0089b483          	ld	s1,8(s3)
ffffffffc0207310:	fa5ff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc0207314:	00a9b423          	sd	a0,8(s3)
ffffffffc0207318:	0099b823          	sd	s1,16(s3)
ffffffffc020731c:	c119                	beqz	a0,ffffffffc0207322 <skew_heap_merge.constprop.0+0x6e>
ffffffffc020731e:	01353023          	sd	s3,0(a0)
ffffffffc0207322:	01393423          	sd	s3,8(s2)
ffffffffc0207326:	01593823          	sd	s5,16(s2)
ffffffffc020732a:	0129b023          	sd	s2,0(s3)
ffffffffc020732e:	84ca                	mv	s1,s2
ffffffffc0207330:	e404                	sd	s1,8(s0)
ffffffffc0207332:	01443823          	sd	s4,16(s0)
ffffffffc0207336:	e080                	sd	s0,0(s1)
ffffffffc0207338:	8522                	mv	a0,s0
ffffffffc020733a:	70e2                	ld	ra,56(sp)
ffffffffc020733c:	7442                	ld	s0,48(sp)
ffffffffc020733e:	74a2                	ld	s1,40(sp)
ffffffffc0207340:	7902                	ld	s2,32(sp)
ffffffffc0207342:	69e2                	ld	s3,24(sp)
ffffffffc0207344:	6a42                	ld	s4,16(sp)
ffffffffc0207346:	6aa2                	ld	s5,8(sp)
ffffffffc0207348:	6b02                	ld	s6,0(sp)
ffffffffc020734a:	6121                	addi	sp,sp,64
ffffffffc020734c:	8082                	ret
ffffffffc020734e:	01053903          	ld	s2,16(a0)
ffffffffc0207352:	00853a03          	ld	s4,8(a0)
ffffffffc0207356:	04090863          	beqz	s2,ffffffffc02073a6 <skew_heap_merge.constprop.0+0xf2>
ffffffffc020735a:	01893783          	ld	a5,24(s2)
ffffffffc020735e:	40e78733          	sub	a4,a5,a4
ffffffffc0207362:	08074963          	bltz	a4,ffffffffc02073f4 <skew_heap_merge.constprop.0+0x140>
ffffffffc0207366:	0105b983          	ld	s3,16(a1)
ffffffffc020736a:	0085ba83          	ld	s5,8(a1)
ffffffffc020736e:	02098663          	beqz	s3,ffffffffc020739a <skew_heap_merge.constprop.0+0xe6>
ffffffffc0207372:	0189b703          	ld	a4,24(s3)
ffffffffc0207376:	8f99                	sub	a5,a5,a4
ffffffffc0207378:	0a07cf63          	bltz	a5,ffffffffc0207436 <skew_heap_merge.constprop.0+0x182>
ffffffffc020737c:	0109b583          	ld	a1,16(s3)
ffffffffc0207380:	0089bb03          	ld	s6,8(s3)
ffffffffc0207384:	854a                	mv	a0,s2
ffffffffc0207386:	f2fff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc020738a:	00a9b423          	sd	a0,8(s3)
ffffffffc020738e:	0169b823          	sd	s6,16(s3)
ffffffffc0207392:	894e                	mv	s2,s3
ffffffffc0207394:	c119                	beqz	a0,ffffffffc020739a <skew_heap_merge.constprop.0+0xe6>
ffffffffc0207396:	01253023          	sd	s2,0(a0)
ffffffffc020739a:	01243423          	sd	s2,8(s0)
ffffffffc020739e:	01543823          	sd	s5,16(s0)
ffffffffc02073a2:	00893023          	sd	s0,0(s2)
ffffffffc02073a6:	e480                	sd	s0,8(s1)
ffffffffc02073a8:	0144b823          	sd	s4,16(s1)
ffffffffc02073ac:	e004                	sd	s1,0(s0)
ffffffffc02073ae:	8526                	mv	a0,s1
ffffffffc02073b0:	b769                	j	ffffffffc020733a <skew_heap_merge.constprop.0+0x86>
ffffffffc02073b2:	01053983          	ld	s3,16(a0)
ffffffffc02073b6:	00853a83          	ld	s5,8(a0)
ffffffffc02073ba:	02098663          	beqz	s3,ffffffffc02073e6 <skew_heap_merge.constprop.0+0x132>
ffffffffc02073be:	0189b783          	ld	a5,24(s3)
ffffffffc02073c2:	40e78733          	sub	a4,a5,a4
ffffffffc02073c6:	04074863          	bltz	a4,ffffffffc0207416 <skew_heap_merge.constprop.0+0x162>
ffffffffc02073ca:	01093583          	ld	a1,16(s2)
ffffffffc02073ce:	00893b03          	ld	s6,8(s2)
ffffffffc02073d2:	854e                	mv	a0,s3
ffffffffc02073d4:	ee1ff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc02073d8:	00a93423          	sd	a0,8(s2)
ffffffffc02073dc:	01693823          	sd	s6,16(s2)
ffffffffc02073e0:	c119                	beqz	a0,ffffffffc02073e6 <skew_heap_merge.constprop.0+0x132>
ffffffffc02073e2:	01253023          	sd	s2,0(a0)
ffffffffc02073e6:	0124b423          	sd	s2,8(s1)
ffffffffc02073ea:	0154b823          	sd	s5,16(s1)
ffffffffc02073ee:	00993023          	sd	s1,0(s2)
ffffffffc02073f2:	bf3d                	j	ffffffffc0207330 <skew_heap_merge.constprop.0+0x7c>
ffffffffc02073f4:	01093503          	ld	a0,16(s2)
ffffffffc02073f8:	00893983          	ld	s3,8(s2)
ffffffffc02073fc:	844a                	mv	s0,s2
ffffffffc02073fe:	eb7ff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc0207402:	00a93423          	sd	a0,8(s2)
ffffffffc0207406:	01393823          	sd	s3,16(s2)
ffffffffc020740a:	dd51                	beqz	a0,ffffffffc02073a6 <skew_heap_merge.constprop.0+0xf2>
ffffffffc020740c:	01253023          	sd	s2,0(a0)
ffffffffc0207410:	bf59                	j	ffffffffc02073a6 <skew_heap_merge.constprop.0+0xf2>
ffffffffc0207412:	89a6                	mv	s3,s1
ffffffffc0207414:	b739                	j	ffffffffc0207322 <skew_heap_merge.constprop.0+0x6e>
ffffffffc0207416:	0109b503          	ld	a0,16(s3)
ffffffffc020741a:	0089bb03          	ld	s6,8(s3)
ffffffffc020741e:	85ca                	mv	a1,s2
ffffffffc0207420:	e95ff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc0207424:	00a9b423          	sd	a0,8(s3)
ffffffffc0207428:	0169b823          	sd	s6,16(s3)
ffffffffc020742c:	894e                	mv	s2,s3
ffffffffc020742e:	dd45                	beqz	a0,ffffffffc02073e6 <skew_heap_merge.constprop.0+0x132>
ffffffffc0207430:	01253023          	sd	s2,0(a0)
ffffffffc0207434:	bf4d                	j	ffffffffc02073e6 <skew_heap_merge.constprop.0+0x132>
ffffffffc0207436:	01093503          	ld	a0,16(s2)
ffffffffc020743a:	00893b03          	ld	s6,8(s2)
ffffffffc020743e:	85ce                	mv	a1,s3
ffffffffc0207440:	e75ff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc0207444:	00a93423          	sd	a0,8(s2)
ffffffffc0207448:	01693823          	sd	s6,16(s2)
ffffffffc020744c:	d539                	beqz	a0,ffffffffc020739a <skew_heap_merge.constprop.0+0xe6>
ffffffffc020744e:	01253023          	sd	s2,0(a0)
ffffffffc0207452:	b7a1                	j	ffffffffc020739a <skew_heap_merge.constprop.0+0xe6>
ffffffffc0207454:	6908                	ld	a0,16(a0)
ffffffffc0207456:	0084bb03          	ld	s6,8(s1)
ffffffffc020745a:	85ce                	mv	a1,s3
ffffffffc020745c:	e59ff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc0207460:	e488                	sd	a0,8(s1)
ffffffffc0207462:	0164b823          	sd	s6,16(s1)
ffffffffc0207466:	d555                	beqz	a0,ffffffffc0207412 <skew_heap_merge.constprop.0+0x15e>
ffffffffc0207468:	e104                	sd	s1,0(a0)
ffffffffc020746a:	89a6                	mv	s3,s1
ffffffffc020746c:	bd5d                	j	ffffffffc0207322 <skew_heap_merge.constprop.0+0x6e>

ffffffffc020746e <stride_dequeue>:
ffffffffc020746e:	1085b783          	ld	a5,264(a1)
ffffffffc0207472:	715d                	addi	sp,sp,-80
ffffffffc0207474:	e0a2                	sd	s0,64(sp)
ffffffffc0207476:	e486                	sd	ra,72(sp)
ffffffffc0207478:	fc26                	sd	s1,56(sp)
ffffffffc020747a:	f84a                	sd	s2,48(sp)
ffffffffc020747c:	f44e                	sd	s3,40(sp)
ffffffffc020747e:	f052                	sd	s4,32(sp)
ffffffffc0207480:	ec56                	sd	s5,24(sp)
ffffffffc0207482:	e85a                	sd	s6,16(sp)
ffffffffc0207484:	e45e                	sd	s7,8(sp)
ffffffffc0207486:	e062                	sd	s8,0(sp)
ffffffffc0207488:	01052803          	lw	a6,16(a0)
ffffffffc020748c:	842e                	mv	s0,a1
ffffffffc020748e:	00a79463          	bne	a5,a0,ffffffffc0207496 <stride_dequeue+0x28>
ffffffffc0207492:	02081e63          	bnez	a6,ffffffffc02074ce <stride_dequeue+0x60>
ffffffffc0207496:	14043783          	ld	a5,320(s0)
ffffffffc020749a:	14842703          	lw	a4,328(s0)
ffffffffc020749e:	4054                	lw	a3,4(s0)
ffffffffc02074a0:	6406                	ld	s0,64(sp)
ffffffffc02074a2:	60a6                	ld	ra,72(sp)
ffffffffc02074a4:	74e2                	ld	s1,56(sp)
ffffffffc02074a6:	7942                	ld	s2,48(sp)
ffffffffc02074a8:	79a2                	ld	s3,40(sp)
ffffffffc02074aa:	7a02                	ld	s4,32(sp)
ffffffffc02074ac:	6ae2                	ld	s5,24(sp)
ffffffffc02074ae:	6b42                	ld	s6,16(sp)
ffffffffc02074b0:	6ba2                	ld	s7,8(sp)
ffffffffc02074b2:	6c02                	ld	s8,0(sp)
ffffffffc02074b4:	00007617          	auipc	a2,0x7
ffffffffc02074b8:	b4460613          	addi	a2,a2,-1212 # ffffffffc020dff8 <CSWTCH.79+0x5d8>
ffffffffc02074bc:	06d00593          	li	a1,109
ffffffffc02074c0:	00007517          	auipc	a0,0x7
ffffffffc02074c4:	ba050513          	addi	a0,a0,-1120 # ffffffffc020e060 <CSWTCH.79+0x640>
ffffffffc02074c8:	6161                	addi	sp,sp,80
ffffffffc02074ca:	83cf906f          	j	ffffffffc0200506 <__warn>
ffffffffc02074ce:	1305b983          	ld	s3,304(a1)
ffffffffc02074d2:	01853b03          	ld	s6,24(a0)
ffffffffc02074d6:	1285ba03          	ld	s4,296(a1)
ffffffffc02074da:	1385b903          	ld	s2,312(a1)
ffffffffc02074de:	84aa                	mv	s1,a0
ffffffffc02074e0:	0e098363          	beqz	s3,ffffffffc02075c6 <stride_dequeue+0x158>
ffffffffc02074e4:	10090d63          	beqz	s2,ffffffffc02075fe <stride_dequeue+0x190>
ffffffffc02074e8:	0189b783          	ld	a5,24(s3)
ffffffffc02074ec:	01893703          	ld	a4,24(s2)
ffffffffc02074f0:	40e786b3          	sub	a3,a5,a4
ffffffffc02074f4:	0806c363          	bltz	a3,ffffffffc020757a <stride_dequeue+0x10c>
ffffffffc02074f8:	01093a83          	ld	s5,16(s2)
ffffffffc02074fc:	00893b83          	ld	s7,8(s2)
ffffffffc0207500:	020a8863          	beqz	s5,ffffffffc0207530 <stride_dequeue+0xc2>
ffffffffc0207504:	018ab703          	ld	a4,24(s5)
ffffffffc0207508:	8f99                	sub	a5,a5,a4
ffffffffc020750a:	0e07ce63          	bltz	a5,ffffffffc0207606 <stride_dequeue+0x198>
ffffffffc020750e:	010ab583          	ld	a1,16(s5)
ffffffffc0207512:	008abc03          	ld	s8,8(s5)
ffffffffc0207516:	854e                	mv	a0,s3
ffffffffc0207518:	d9dff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc020751c:	00aab423          	sd	a0,8(s5)
ffffffffc0207520:	018ab823          	sd	s8,16(s5)
ffffffffc0207524:	0104a803          	lw	a6,16(s1)
ffffffffc0207528:	c119                	beqz	a0,ffffffffc020752e <stride_dequeue+0xc0>
ffffffffc020752a:	01553023          	sd	s5,0(a0)
ffffffffc020752e:	89d6                	mv	s3,s5
ffffffffc0207530:	01393423          	sd	s3,8(s2)
ffffffffc0207534:	01793823          	sd	s7,16(s2)
ffffffffc0207538:	0129b023          	sd	s2,0(s3)
ffffffffc020753c:	01493023          	sd	s4,0(s2)
ffffffffc0207540:	080a0863          	beqz	s4,ffffffffc02075d0 <stride_dequeue+0x162>
ffffffffc0207544:	008a3703          	ld	a4,8(s4)
ffffffffc0207548:	12840793          	addi	a5,s0,296
ffffffffc020754c:	08f70463          	beq	a4,a5,ffffffffc02075d4 <stride_dequeue+0x166>
ffffffffc0207550:	012a3823          	sd	s2,16(s4)
ffffffffc0207554:	387d                	addiw	a6,a6,-1
ffffffffc0207556:	0164bc23          	sd	s6,24(s1)
ffffffffc020755a:	0104a823          	sw	a6,16(s1)
ffffffffc020755e:	60a6                	ld	ra,72(sp)
ffffffffc0207560:	10043423          	sd	zero,264(s0)
ffffffffc0207564:	6406                	ld	s0,64(sp)
ffffffffc0207566:	74e2                	ld	s1,56(sp)
ffffffffc0207568:	7942                	ld	s2,48(sp)
ffffffffc020756a:	79a2                	ld	s3,40(sp)
ffffffffc020756c:	7a02                	ld	s4,32(sp)
ffffffffc020756e:	6ae2                	ld	s5,24(sp)
ffffffffc0207570:	6b42                	ld	s6,16(sp)
ffffffffc0207572:	6ba2                	ld	s7,8(sp)
ffffffffc0207574:	6c02                	ld	s8,0(sp)
ffffffffc0207576:	6161                	addi	sp,sp,80
ffffffffc0207578:	8082                	ret
ffffffffc020757a:	0109ba83          	ld	s5,16(s3)
ffffffffc020757e:	0089bb83          	ld	s7,8(s3)
ffffffffc0207582:	020a8863          	beqz	s5,ffffffffc02075b2 <stride_dequeue+0x144>
ffffffffc0207586:	018ab783          	ld	a5,24(s5)
ffffffffc020758a:	40e78733          	sub	a4,a5,a4
ffffffffc020758e:	04074663          	bltz	a4,ffffffffc02075da <stride_dequeue+0x16c>
ffffffffc0207592:	01093583          	ld	a1,16(s2)
ffffffffc0207596:	00893c03          	ld	s8,8(s2)
ffffffffc020759a:	8556                	mv	a0,s5
ffffffffc020759c:	d19ff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc02075a0:	00a93423          	sd	a0,8(s2)
ffffffffc02075a4:	01893823          	sd	s8,16(s2)
ffffffffc02075a8:	0104a803          	lw	a6,16(s1)
ffffffffc02075ac:	c119                	beqz	a0,ffffffffc02075b2 <stride_dequeue+0x144>
ffffffffc02075ae:	01253023          	sd	s2,0(a0)
ffffffffc02075b2:	0129b423          	sd	s2,8(s3)
ffffffffc02075b6:	0179b823          	sd	s7,16(s3)
ffffffffc02075ba:	01393023          	sd	s3,0(s2)
ffffffffc02075be:	894e                	mv	s2,s3
ffffffffc02075c0:	01493023          	sd	s4,0(s2)
ffffffffc02075c4:	bfb5                	j	ffffffffc0207540 <stride_dequeue+0xd2>
ffffffffc02075c6:	f6090de3          	beqz	s2,ffffffffc0207540 <stride_dequeue+0xd2>
ffffffffc02075ca:	01493023          	sd	s4,0(s2)
ffffffffc02075ce:	bf8d                	j	ffffffffc0207540 <stride_dequeue+0xd2>
ffffffffc02075d0:	8b4a                	mv	s6,s2
ffffffffc02075d2:	b749                	j	ffffffffc0207554 <stride_dequeue+0xe6>
ffffffffc02075d4:	012a3423          	sd	s2,8(s4)
ffffffffc02075d8:	bfb5                	j	ffffffffc0207554 <stride_dequeue+0xe6>
ffffffffc02075da:	010ab503          	ld	a0,16(s5)
ffffffffc02075de:	008abc03          	ld	s8,8(s5)
ffffffffc02075e2:	85ca                	mv	a1,s2
ffffffffc02075e4:	cd1ff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc02075e8:	00aab423          	sd	a0,8(s5)
ffffffffc02075ec:	018ab823          	sd	s8,16(s5)
ffffffffc02075f0:	0104a803          	lw	a6,16(s1)
ffffffffc02075f4:	c119                	beqz	a0,ffffffffc02075fa <stride_dequeue+0x18c>
ffffffffc02075f6:	01553023          	sd	s5,0(a0)
ffffffffc02075fa:	8956                	mv	s2,s5
ffffffffc02075fc:	bf5d                	j	ffffffffc02075b2 <stride_dequeue+0x144>
ffffffffc02075fe:	894e                	mv	s2,s3
ffffffffc0207600:	01493023          	sd	s4,0(s2)
ffffffffc0207604:	bf35                	j	ffffffffc0207540 <stride_dequeue+0xd2>
ffffffffc0207606:	0109b503          	ld	a0,16(s3)
ffffffffc020760a:	0089bc03          	ld	s8,8(s3)
ffffffffc020760e:	85d6                	mv	a1,s5
ffffffffc0207610:	ca5ff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc0207614:	00a9b423          	sd	a0,8(s3)
ffffffffc0207618:	0189b823          	sd	s8,16(s3)
ffffffffc020761c:	0104a803          	lw	a6,16(s1)
ffffffffc0207620:	d901                	beqz	a0,ffffffffc0207530 <stride_dequeue+0xc2>
ffffffffc0207622:	01353023          	sd	s3,0(a0)
ffffffffc0207626:	b729                	j	ffffffffc0207530 <stride_dequeue+0xc2>

ffffffffc0207628 <stride_enqueue>:
ffffffffc0207628:	7139                	addi	sp,sp,-64
ffffffffc020762a:	f04a                	sd	s2,32(sp)
ffffffffc020762c:	01853903          	ld	s2,24(a0)
ffffffffc0207630:	f822                	sd	s0,48(sp)
ffffffffc0207632:	f426                	sd	s1,40(sp)
ffffffffc0207634:	fc06                	sd	ra,56(sp)
ffffffffc0207636:	ec4e                	sd	s3,24(sp)
ffffffffc0207638:	e852                	sd	s4,16(sp)
ffffffffc020763a:	e456                	sd	s5,8(sp)
ffffffffc020763c:	1205b423          	sd	zero,296(a1)
ffffffffc0207640:	1205bc23          	sd	zero,312(a1)
ffffffffc0207644:	1205b823          	sd	zero,304(a1)
ffffffffc0207648:	842e                	mv	s0,a1
ffffffffc020764a:	84aa                	mv	s1,a0
ffffffffc020764c:	12858593          	addi	a1,a1,296
ffffffffc0207650:	00090d63          	beqz	s2,ffffffffc020766a <stride_enqueue+0x42>
ffffffffc0207654:	14043703          	ld	a4,320(s0)
ffffffffc0207658:	01893783          	ld	a5,24(s2)
ffffffffc020765c:	8f99                	sub	a5,a5,a4
ffffffffc020765e:	0207cd63          	bltz	a5,ffffffffc0207698 <stride_enqueue+0x70>
ffffffffc0207662:	13243823          	sd	s2,304(s0)
ffffffffc0207666:	00b93023          	sd	a1,0(s2)
ffffffffc020766a:	12042783          	lw	a5,288(s0)
ffffffffc020766e:	ec8c                	sd	a1,24(s1)
ffffffffc0207670:	48d8                	lw	a4,20(s1)
ffffffffc0207672:	c399                	beqz	a5,ffffffffc0207678 <stride_enqueue+0x50>
ffffffffc0207674:	00f75463          	bge	a4,a5,ffffffffc020767c <stride_enqueue+0x54>
ffffffffc0207678:	12e42023          	sw	a4,288(s0)
ffffffffc020767c:	489c                	lw	a5,16(s1)
ffffffffc020767e:	70e2                	ld	ra,56(sp)
ffffffffc0207680:	10943423          	sd	s1,264(s0)
ffffffffc0207684:	7442                	ld	s0,48(sp)
ffffffffc0207686:	2785                	addiw	a5,a5,1
ffffffffc0207688:	c89c                	sw	a5,16(s1)
ffffffffc020768a:	7902                	ld	s2,32(sp)
ffffffffc020768c:	74a2                	ld	s1,40(sp)
ffffffffc020768e:	69e2                	ld	s3,24(sp)
ffffffffc0207690:	6a42                	ld	s4,16(sp)
ffffffffc0207692:	6aa2                	ld	s5,8(sp)
ffffffffc0207694:	6121                	addi	sp,sp,64
ffffffffc0207696:	8082                	ret
ffffffffc0207698:	01093983          	ld	s3,16(s2)
ffffffffc020769c:	00893a03          	ld	s4,8(s2)
ffffffffc02076a0:	00098c63          	beqz	s3,ffffffffc02076b8 <stride_enqueue+0x90>
ffffffffc02076a4:	0189b783          	ld	a5,24(s3)
ffffffffc02076a8:	40e78733          	sub	a4,a5,a4
ffffffffc02076ac:	00074e63          	bltz	a4,ffffffffc02076c8 <stride_enqueue+0xa0>
ffffffffc02076b0:	13343823          	sd	s3,304(s0)
ffffffffc02076b4:	00b9b023          	sd	a1,0(s3)
ffffffffc02076b8:	00b93423          	sd	a1,8(s2)
ffffffffc02076bc:	01493823          	sd	s4,16(s2)
ffffffffc02076c0:	0125b023          	sd	s2,0(a1)
ffffffffc02076c4:	85ca                	mv	a1,s2
ffffffffc02076c6:	b755                	j	ffffffffc020766a <stride_enqueue+0x42>
ffffffffc02076c8:	0109b503          	ld	a0,16(s3)
ffffffffc02076cc:	0089ba83          	ld	s5,8(s3)
ffffffffc02076d0:	be5ff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc02076d4:	00a9b423          	sd	a0,8(s3)
ffffffffc02076d8:	0159b823          	sd	s5,16(s3)
ffffffffc02076dc:	85ce                	mv	a1,s3
ffffffffc02076de:	dd69                	beqz	a0,ffffffffc02076b8 <stride_enqueue+0x90>
ffffffffc02076e0:	01353023          	sd	s3,0(a0)
ffffffffc02076e4:	bfd1                	j	ffffffffc02076b8 <stride_enqueue+0x90>

ffffffffc02076e6 <stride_switch_in>:
ffffffffc02076e6:	715d                	addi	sp,sp,-80
ffffffffc02076e8:	f84a                	sd	s2,48(sp)
ffffffffc02076ea:	00853903          	ld	s2,8(a0)
ffffffffc02076ee:	e486                	sd	ra,72(sp)
ffffffffc02076f0:	e0a2                	sd	s0,64(sp)
ffffffffc02076f2:	fc26                	sd	s1,56(sp)
ffffffffc02076f4:	f44e                	sd	s3,40(sp)
ffffffffc02076f6:	f052                	sd	s4,32(sp)
ffffffffc02076f8:	ec56                	sd	s5,24(sp)
ffffffffc02076fa:	e85a                	sd	s6,16(sp)
ffffffffc02076fc:	e45e                	sd	s7,8(sp)
ffffffffc02076fe:	e062                	sd	s8,0(sp)
ffffffffc0207700:	00052823          	sw	zero,16(a0)
ffffffffc0207704:	06a90463          	beq	s2,a0,ffffffffc020776c <stride_switch_in+0x86>
ffffffffc0207708:	01853983          	ld	s3,24(a0)
ffffffffc020770c:	84aa                	mv	s1,a0
ffffffffc020770e:	00093783          	ld	a5,0(s2)
ffffffffc0207712:	844a                	mv	s0,s2
ffffffffc0207714:	00893903          	ld	s2,8(s2)
ffffffffc0207718:	01840593          	addi	a1,s0,24
ffffffffc020771c:	0127b423          	sd	s2,8(a5)
ffffffffc0207720:	00f93023          	sd	a5,0(s2)
ffffffffc0207724:	e400                	sd	s0,8(s0)
ffffffffc0207726:	e000                	sd	s0,0(s0)
ffffffffc0207728:	00043c23          	sd	zero,24(s0)
ffffffffc020772c:	02043423          	sd	zero,40(s0)
ffffffffc0207730:	02043023          	sd	zero,32(s0)
ffffffffc0207734:	06098e63          	beqz	s3,ffffffffc02077b0 <stride_switch_in+0xca>
ffffffffc0207738:	7818                	ld	a4,48(s0)
ffffffffc020773a:	0189b783          	ld	a5,24(s3)
ffffffffc020773e:	8f99                	sub	a5,a5,a4
ffffffffc0207740:	0407c263          	bltz	a5,ffffffffc0207784 <stride_switch_in+0x9e>
ffffffffc0207744:	03343023          	sd	s3,32(s0)
ffffffffc0207748:	00b9b023          	sd	a1,0(s3)
ffffffffc020774c:	89ae                	mv	s3,a1
ffffffffc020774e:	481c                	lw	a5,16(s0)
ffffffffc0207750:	0134bc23          	sd	s3,24(s1)
ffffffffc0207754:	48d8                	lw	a4,20(s1)
ffffffffc0207756:	c399                	beqz	a5,ffffffffc020775c <stride_switch_in+0x76>
ffffffffc0207758:	00f75363          	bge	a4,a5,ffffffffc020775e <stride_switch_in+0x78>
ffffffffc020775c:	c818                	sw	a4,16(s0)
ffffffffc020775e:	489c                	lw	a5,16(s1)
ffffffffc0207760:	fe943c23          	sd	s1,-8(s0)
ffffffffc0207764:	2785                	addiw	a5,a5,1
ffffffffc0207766:	c89c                	sw	a5,16(s1)
ffffffffc0207768:	fa9913e3          	bne	s2,s1,ffffffffc020770e <stride_switch_in+0x28>
ffffffffc020776c:	60a6                	ld	ra,72(sp)
ffffffffc020776e:	6406                	ld	s0,64(sp)
ffffffffc0207770:	74e2                	ld	s1,56(sp)
ffffffffc0207772:	7942                	ld	s2,48(sp)
ffffffffc0207774:	79a2                	ld	s3,40(sp)
ffffffffc0207776:	7a02                	ld	s4,32(sp)
ffffffffc0207778:	6ae2                	ld	s5,24(sp)
ffffffffc020777a:	6b42                	ld	s6,16(sp)
ffffffffc020777c:	6ba2                	ld	s7,8(sp)
ffffffffc020777e:	6c02                	ld	s8,0(sp)
ffffffffc0207780:	6161                	addi	sp,sp,80
ffffffffc0207782:	8082                	ret
ffffffffc0207784:	0109ba03          	ld	s4,16(s3)
ffffffffc0207788:	0089ba83          	ld	s5,8(s3)
ffffffffc020778c:	000a0b63          	beqz	s4,ffffffffc02077a2 <stride_switch_in+0xbc>
ffffffffc0207790:	018a3783          	ld	a5,24(s4)
ffffffffc0207794:	8f99                	sub	a5,a5,a4
ffffffffc0207796:	0007cf63          	bltz	a5,ffffffffc02077b4 <stride_switch_in+0xce>
ffffffffc020779a:	03443023          	sd	s4,32(s0)
ffffffffc020779e:	00ba3023          	sd	a1,0(s4)
ffffffffc02077a2:	00b9b423          	sd	a1,8(s3)
ffffffffc02077a6:	0159b823          	sd	s5,16(s3)
ffffffffc02077aa:	0135b023          	sd	s3,0(a1)
ffffffffc02077ae:	b745                	j	ffffffffc020774e <stride_switch_in+0x68>
ffffffffc02077b0:	89ae                	mv	s3,a1
ffffffffc02077b2:	bf71                	j	ffffffffc020774e <stride_switch_in+0x68>
ffffffffc02077b4:	010a3b03          	ld	s6,16(s4)
ffffffffc02077b8:	008a3b83          	ld	s7,8(s4)
ffffffffc02077bc:	000b0c63          	beqz	s6,ffffffffc02077d4 <stride_switch_in+0xee>
ffffffffc02077c0:	018b3783          	ld	a5,24(s6)
ffffffffc02077c4:	40e78733          	sub	a4,a5,a4
ffffffffc02077c8:	00074e63          	bltz	a4,ffffffffc02077e4 <stride_switch_in+0xfe>
ffffffffc02077cc:	03643023          	sd	s6,32(s0)
ffffffffc02077d0:	00bb3023          	sd	a1,0(s6)
ffffffffc02077d4:	00ba3423          	sd	a1,8(s4)
ffffffffc02077d8:	017a3823          	sd	s7,16(s4)
ffffffffc02077dc:	0145b023          	sd	s4,0(a1)
ffffffffc02077e0:	85d2                	mv	a1,s4
ffffffffc02077e2:	b7c1                	j	ffffffffc02077a2 <stride_switch_in+0xbc>
ffffffffc02077e4:	010b3503          	ld	a0,16(s6)
ffffffffc02077e8:	008b3c03          	ld	s8,8(s6)
ffffffffc02077ec:	ac9ff0ef          	jal	ra,ffffffffc02072b4 <skew_heap_merge.constprop.0>
ffffffffc02077f0:	00ab3423          	sd	a0,8(s6)
ffffffffc02077f4:	018b3823          	sd	s8,16(s6)
ffffffffc02077f8:	85da                	mv	a1,s6
ffffffffc02077fa:	dd69                	beqz	a0,ffffffffc02077d4 <stride_switch_in+0xee>
ffffffffc02077fc:	01653023          	sd	s6,0(a0)
ffffffffc0207800:	bfd1                	j	ffffffffc02077d4 <stride_switch_in+0xee>

ffffffffc0207802 <sched_init>:
ffffffffc0207802:	0008a717          	auipc	a4,0x8a
ffffffffc0207806:	81e70713          	addi	a4,a4,-2018 # ffffffffc0291020 <default_sched_class>
ffffffffc020780a:	0008e797          	auipc	a5,0x8e
ffffffffc020780e:	01678793          	addi	a5,a5,22 # ffffffffc0295820 <timer_list>
ffffffffc0207812:	6714                	ld	a3,8(a4)
ffffffffc0207814:	0008e517          	auipc	a0,0x8e
ffffffffc0207818:	fec50513          	addi	a0,a0,-20 # ffffffffc0295800 <__rq>
ffffffffc020781c:	e79c                	sd	a5,8(a5)
ffffffffc020781e:	e39c                	sd	a5,0(a5)
ffffffffc0207820:	4795                	li	a5,5
ffffffffc0207822:	c95c                	sw	a5,20(a0)
ffffffffc0207824:	0008f797          	auipc	a5,0x8f
ffffffffc0207828:	0ee7ba23          	sd	a4,244(a5) # ffffffffc0296918 <sched_class>
ffffffffc020782c:	0008f797          	auipc	a5,0x8f
ffffffffc0207830:	0ea7b223          	sd	a0,228(a5) # ffffffffc0296910 <rq>
ffffffffc0207834:	8682                	jr	a3

ffffffffc0207836 <sched_set_class_stride>:
ffffffffc0207836:	1101                	addi	sp,sp,-32
ffffffffc0207838:	ec06                	sd	ra,24(sp)
ffffffffc020783a:	e822                	sd	s0,16(sp)
ffffffffc020783c:	e426                	sd	s1,8(sp)
ffffffffc020783e:	100027f3          	csrr	a5,sstatus
ffffffffc0207842:	8b89                	andi	a5,a5,2
ffffffffc0207844:	0008f417          	auipc	s0,0x8f
ffffffffc0207848:	0d440413          	addi	s0,s0,212 # ffffffffc0296918 <sched_class>
ffffffffc020784c:	e785                	bnez	a5,ffffffffc0207874 <sched_set_class_stride+0x3e>
ffffffffc020784e:	601c                	ld	a5,0(s0)
ffffffffc0207850:	0008a497          	auipc	s1,0x8a
ffffffffc0207854:	80048493          	addi	s1,s1,-2048 # ffffffffc0291050 <stride_sched_class>
ffffffffc0207858:	00978963          	beq	a5,s1,ffffffffc020786a <sched_set_class_stride+0x34>
ffffffffc020785c:	0008f517          	auipc	a0,0x8f
ffffffffc0207860:	0b453503          	ld	a0,180(a0) # ffffffffc0296910 <rq>
ffffffffc0207864:	e83ff0ef          	jal	ra,ffffffffc02076e6 <stride_switch_in>
ffffffffc0207868:	e004                	sd	s1,0(s0)
ffffffffc020786a:	60e2                	ld	ra,24(sp)
ffffffffc020786c:	6442                	ld	s0,16(sp)
ffffffffc020786e:	64a2                	ld	s1,8(sp)
ffffffffc0207870:	6105                	addi	sp,sp,32
ffffffffc0207872:	8082                	ret
ffffffffc0207874:	bfef90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207878:	601c                	ld	a5,0(s0)
ffffffffc020787a:	00089497          	auipc	s1,0x89
ffffffffc020787e:	7d648493          	addi	s1,s1,2006 # ffffffffc0291050 <stride_sched_class>
ffffffffc0207882:	00978963          	beq	a5,s1,ffffffffc0207894 <sched_set_class_stride+0x5e>
ffffffffc0207886:	0008f517          	auipc	a0,0x8f
ffffffffc020788a:	08a53503          	ld	a0,138(a0) # ffffffffc0296910 <rq>
ffffffffc020788e:	e59ff0ef          	jal	ra,ffffffffc02076e6 <stride_switch_in>
ffffffffc0207892:	e004                	sd	s1,0(s0)
ffffffffc0207894:	6442                	ld	s0,16(sp)
ffffffffc0207896:	60e2                	ld	ra,24(sp)
ffffffffc0207898:	64a2                	ld	s1,8(sp)
ffffffffc020789a:	6105                	addi	sp,sp,32
ffffffffc020789c:	bd0f906f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc02078a0 <sched_update_proc>:
ffffffffc02078a0:	7179                	addi	sp,sp,-48
ffffffffc02078a2:	f022                	sd	s0,32(sp)
ffffffffc02078a4:	f406                	sd	ra,40(sp)
ffffffffc02078a6:	ec26                	sd	s1,24(sp)
ffffffffc02078a8:	e84a                	sd	s2,16(sp)
ffffffffc02078aa:	e44e                	sd	s3,8(sp)
ffffffffc02078ac:	e052                	sd	s4,0(sp)
ffffffffc02078ae:	842a                	mv	s0,a0
ffffffffc02078b0:	100027f3          	csrr	a5,sstatus
ffffffffc02078b4:	8b89                	andi	a5,a5,2
ffffffffc02078b6:	0008f497          	auipc	s1,0x8f
ffffffffc02078ba:	04248493          	addi	s1,s1,66 # ffffffffc02968f8 <idleproc>
ffffffffc02078be:	e385                	bnez	a5,ffffffffc02078de <sched_update_proc+0x3e>
ffffffffc02078c0:	609c                	ld	a5,0(s1)
ffffffffc02078c2:	00f50663          	beq	a0,a5,ffffffffc02078ce <sched_update_proc+0x2e>
ffffffffc02078c6:	4118                	lw	a4,0(a0)
ffffffffc02078c8:	4789                	li	a5,2
ffffffffc02078ca:	02f70c63          	beq	a4,a5,ffffffffc0207902 <sched_update_proc+0x62>
ffffffffc02078ce:	70a2                	ld	ra,40(sp)
ffffffffc02078d0:	7402                	ld	s0,32(sp)
ffffffffc02078d2:	64e2                	ld	s1,24(sp)
ffffffffc02078d4:	6942                	ld	s2,16(sp)
ffffffffc02078d6:	69a2                	ld	s3,8(sp)
ffffffffc02078d8:	6a02                	ld	s4,0(sp)
ffffffffc02078da:	6145                	addi	sp,sp,48
ffffffffc02078dc:	8082                	ret
ffffffffc02078de:	b94f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02078e2:	609c                	ld	a5,0(s1)
ffffffffc02078e4:	00f40663          	beq	s0,a5,ffffffffc02078f0 <sched_update_proc+0x50>
ffffffffc02078e8:	4018                	lw	a4,0(s0)
ffffffffc02078ea:	4789                	li	a5,2
ffffffffc02078ec:	04f70d63          	beq	a4,a5,ffffffffc0207946 <sched_update_proc+0xa6>
ffffffffc02078f0:	7402                	ld	s0,32(sp)
ffffffffc02078f2:	70a2                	ld	ra,40(sp)
ffffffffc02078f4:	64e2                	ld	s1,24(sp)
ffffffffc02078f6:	6942                	ld	s2,16(sp)
ffffffffc02078f8:	69a2                	ld	s3,8(sp)
ffffffffc02078fa:	6a02                	ld	s4,0(sp)
ffffffffc02078fc:	6145                	addi	sp,sp,48
ffffffffc02078fe:	b6ef906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207902:	4901                	li	s2,0
ffffffffc0207904:	10843783          	ld	a5,264(s0)
ffffffffc0207908:	cf85                	beqz	a5,ffffffffc0207940 <sched_update_proc+0xa0>
ffffffffc020790a:	4b9c                	lw	a5,16(a5)
ffffffffc020790c:	cb95                	beqz	a5,ffffffffc0207940 <sched_update_proc+0xa0>
ffffffffc020790e:	0008fa17          	auipc	s4,0x8f
ffffffffc0207912:	00aa0a13          	addi	s4,s4,10 # ffffffffc0296918 <sched_class>
ffffffffc0207916:	000a3783          	ld	a5,0(s4)
ffffffffc020791a:	0008f997          	auipc	s3,0x8f
ffffffffc020791e:	ff698993          	addi	s3,s3,-10 # ffffffffc0296910 <rq>
ffffffffc0207922:	0009b503          	ld	a0,0(s3)
ffffffffc0207926:	6f9c                	ld	a5,24(a5)
ffffffffc0207928:	85a2                	mv	a1,s0
ffffffffc020792a:	9782                	jalr	a5
ffffffffc020792c:	609c                	ld	a5,0(s1)
ffffffffc020792e:	00f40963          	beq	s0,a5,ffffffffc0207940 <sched_update_proc+0xa0>
ffffffffc0207932:	000a3783          	ld	a5,0(s4)
ffffffffc0207936:	0009b503          	ld	a0,0(s3)
ffffffffc020793a:	85a2                	mv	a1,s0
ffffffffc020793c:	6b9c                	ld	a5,16(a5)
ffffffffc020793e:	9782                	jalr	a5
ffffffffc0207940:	fa0918e3          	bnez	s2,ffffffffc02078f0 <sched_update_proc+0x50>
ffffffffc0207944:	b769                	j	ffffffffc02078ce <sched_update_proc+0x2e>
ffffffffc0207946:	4905                	li	s2,1
ffffffffc0207948:	bf75                	j	ffffffffc0207904 <sched_update_proc+0x64>

ffffffffc020794a <wakeup_proc>:
ffffffffc020794a:	4118                	lw	a4,0(a0)
ffffffffc020794c:	1101                	addi	sp,sp,-32
ffffffffc020794e:	ec06                	sd	ra,24(sp)
ffffffffc0207950:	e822                	sd	s0,16(sp)
ffffffffc0207952:	e426                	sd	s1,8(sp)
ffffffffc0207954:	478d                	li	a5,3
ffffffffc0207956:	08f70363          	beq	a4,a5,ffffffffc02079dc <wakeup_proc+0x92>
ffffffffc020795a:	842a                	mv	s0,a0
ffffffffc020795c:	100027f3          	csrr	a5,sstatus
ffffffffc0207960:	8b89                	andi	a5,a5,2
ffffffffc0207962:	4481                	li	s1,0
ffffffffc0207964:	e7bd                	bnez	a5,ffffffffc02079d2 <wakeup_proc+0x88>
ffffffffc0207966:	4789                	li	a5,2
ffffffffc0207968:	04f70863          	beq	a4,a5,ffffffffc02079b8 <wakeup_proc+0x6e>
ffffffffc020796c:	c01c                	sw	a5,0(s0)
ffffffffc020796e:	0e042623          	sw	zero,236(s0)
ffffffffc0207972:	0008f797          	auipc	a5,0x8f
ffffffffc0207976:	f7e7b783          	ld	a5,-130(a5) # ffffffffc02968f0 <current>
ffffffffc020797a:	02878363          	beq	a5,s0,ffffffffc02079a0 <wakeup_proc+0x56>
ffffffffc020797e:	0008f797          	auipc	a5,0x8f
ffffffffc0207982:	f7a7b783          	ld	a5,-134(a5) # ffffffffc02968f8 <idleproc>
ffffffffc0207986:	00f40d63          	beq	s0,a5,ffffffffc02079a0 <wakeup_proc+0x56>
ffffffffc020798a:	0008f797          	auipc	a5,0x8f
ffffffffc020798e:	f8e7b783          	ld	a5,-114(a5) # ffffffffc0296918 <sched_class>
ffffffffc0207992:	6b9c                	ld	a5,16(a5)
ffffffffc0207994:	85a2                	mv	a1,s0
ffffffffc0207996:	0008f517          	auipc	a0,0x8f
ffffffffc020799a:	f7a53503          	ld	a0,-134(a0) # ffffffffc0296910 <rq>
ffffffffc020799e:	9782                	jalr	a5
ffffffffc02079a0:	e491                	bnez	s1,ffffffffc02079ac <wakeup_proc+0x62>
ffffffffc02079a2:	60e2                	ld	ra,24(sp)
ffffffffc02079a4:	6442                	ld	s0,16(sp)
ffffffffc02079a6:	64a2                	ld	s1,8(sp)
ffffffffc02079a8:	6105                	addi	sp,sp,32
ffffffffc02079aa:	8082                	ret
ffffffffc02079ac:	6442                	ld	s0,16(sp)
ffffffffc02079ae:	60e2                	ld	ra,24(sp)
ffffffffc02079b0:	64a2                	ld	s1,8(sp)
ffffffffc02079b2:	6105                	addi	sp,sp,32
ffffffffc02079b4:	ab8f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02079b8:	00006617          	auipc	a2,0x6
ffffffffc02079bc:	72060613          	addi	a2,a2,1824 # ffffffffc020e0d8 <CSWTCH.79+0x6b8>
ffffffffc02079c0:	07800593          	li	a1,120
ffffffffc02079c4:	00006517          	auipc	a0,0x6
ffffffffc02079c8:	6fc50513          	addi	a0,a0,1788 # ffffffffc020e0c0 <CSWTCH.79+0x6a0>
ffffffffc02079cc:	b3bf80ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc02079d0:	bfc1                	j	ffffffffc02079a0 <wakeup_proc+0x56>
ffffffffc02079d2:	aa0f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02079d6:	4018                	lw	a4,0(s0)
ffffffffc02079d8:	4485                	li	s1,1
ffffffffc02079da:	b771                	j	ffffffffc0207966 <wakeup_proc+0x1c>
ffffffffc02079dc:	00006697          	auipc	a3,0x6
ffffffffc02079e0:	6c468693          	addi	a3,a3,1732 # ffffffffc020e0a0 <CSWTCH.79+0x680>
ffffffffc02079e4:	00004617          	auipc	a2,0x4
ffffffffc02079e8:	62c60613          	addi	a2,a2,1580 # ffffffffc020c010 <commands+0x210>
ffffffffc02079ec:	06900593          	li	a1,105
ffffffffc02079f0:	00006517          	auipc	a0,0x6
ffffffffc02079f4:	6d050513          	addi	a0,a0,1744 # ffffffffc020e0c0 <CSWTCH.79+0x6a0>
ffffffffc02079f8:	aa7f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02079fc <schedule>:
ffffffffc02079fc:	7179                	addi	sp,sp,-48
ffffffffc02079fe:	f406                	sd	ra,40(sp)
ffffffffc0207a00:	f022                	sd	s0,32(sp)
ffffffffc0207a02:	ec26                	sd	s1,24(sp)
ffffffffc0207a04:	e84a                	sd	s2,16(sp)
ffffffffc0207a06:	e44e                	sd	s3,8(sp)
ffffffffc0207a08:	e052                	sd	s4,0(sp)
ffffffffc0207a0a:	100027f3          	csrr	a5,sstatus
ffffffffc0207a0e:	8b89                	andi	a5,a5,2
ffffffffc0207a10:	4a01                	li	s4,0
ffffffffc0207a12:	e3cd                	bnez	a5,ffffffffc0207ab4 <schedule+0xb8>
ffffffffc0207a14:	0008f497          	auipc	s1,0x8f
ffffffffc0207a18:	edc48493          	addi	s1,s1,-292 # ffffffffc02968f0 <current>
ffffffffc0207a1c:	608c                	ld	a1,0(s1)
ffffffffc0207a1e:	0008f997          	auipc	s3,0x8f
ffffffffc0207a22:	efa98993          	addi	s3,s3,-262 # ffffffffc0296918 <sched_class>
ffffffffc0207a26:	0008f917          	auipc	s2,0x8f
ffffffffc0207a2a:	eea90913          	addi	s2,s2,-278 # ffffffffc0296910 <rq>
ffffffffc0207a2e:	4194                	lw	a3,0(a1)
ffffffffc0207a30:	0005bc23          	sd	zero,24(a1)
ffffffffc0207a34:	4709                	li	a4,2
ffffffffc0207a36:	0009b783          	ld	a5,0(s3)
ffffffffc0207a3a:	00093503          	ld	a0,0(s2)
ffffffffc0207a3e:	04e68e63          	beq	a3,a4,ffffffffc0207a9a <schedule+0x9e>
ffffffffc0207a42:	739c                	ld	a5,32(a5)
ffffffffc0207a44:	9782                	jalr	a5
ffffffffc0207a46:	842a                	mv	s0,a0
ffffffffc0207a48:	c521                	beqz	a0,ffffffffc0207a90 <schedule+0x94>
ffffffffc0207a4a:	0009b783          	ld	a5,0(s3)
ffffffffc0207a4e:	00093503          	ld	a0,0(s2)
ffffffffc0207a52:	85a2                	mv	a1,s0
ffffffffc0207a54:	6f9c                	ld	a5,24(a5)
ffffffffc0207a56:	9782                	jalr	a5
ffffffffc0207a58:	441c                	lw	a5,8(s0)
ffffffffc0207a5a:	6098                	ld	a4,0(s1)
ffffffffc0207a5c:	2785                	addiw	a5,a5,1
ffffffffc0207a5e:	c41c                	sw	a5,8(s0)
ffffffffc0207a60:	00870563          	beq	a4,s0,ffffffffc0207a6a <schedule+0x6e>
ffffffffc0207a64:	8522                	mv	a0,s0
ffffffffc0207a66:	922fe0ef          	jal	ra,ffffffffc0205b88 <proc_run>
ffffffffc0207a6a:	000a1a63          	bnez	s4,ffffffffc0207a7e <schedule+0x82>
ffffffffc0207a6e:	70a2                	ld	ra,40(sp)
ffffffffc0207a70:	7402                	ld	s0,32(sp)
ffffffffc0207a72:	64e2                	ld	s1,24(sp)
ffffffffc0207a74:	6942                	ld	s2,16(sp)
ffffffffc0207a76:	69a2                	ld	s3,8(sp)
ffffffffc0207a78:	6a02                	ld	s4,0(sp)
ffffffffc0207a7a:	6145                	addi	sp,sp,48
ffffffffc0207a7c:	8082                	ret
ffffffffc0207a7e:	7402                	ld	s0,32(sp)
ffffffffc0207a80:	70a2                	ld	ra,40(sp)
ffffffffc0207a82:	64e2                	ld	s1,24(sp)
ffffffffc0207a84:	6942                	ld	s2,16(sp)
ffffffffc0207a86:	69a2                	ld	s3,8(sp)
ffffffffc0207a88:	6a02                	ld	s4,0(sp)
ffffffffc0207a8a:	6145                	addi	sp,sp,48
ffffffffc0207a8c:	9e0f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207a90:	0008f417          	auipc	s0,0x8f
ffffffffc0207a94:	e6843403          	ld	s0,-408(s0) # ffffffffc02968f8 <idleproc>
ffffffffc0207a98:	b7c1                	j	ffffffffc0207a58 <schedule+0x5c>
ffffffffc0207a9a:	0008f717          	auipc	a4,0x8f
ffffffffc0207a9e:	e5e73703          	ld	a4,-418(a4) # ffffffffc02968f8 <idleproc>
ffffffffc0207aa2:	fae580e3          	beq	a1,a4,ffffffffc0207a42 <schedule+0x46>
ffffffffc0207aa6:	6b9c                	ld	a5,16(a5)
ffffffffc0207aa8:	9782                	jalr	a5
ffffffffc0207aaa:	0009b783          	ld	a5,0(s3)
ffffffffc0207aae:	00093503          	ld	a0,0(s2)
ffffffffc0207ab2:	bf41                	j	ffffffffc0207a42 <schedule+0x46>
ffffffffc0207ab4:	9bef90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207ab8:	4a05                	li	s4,1
ffffffffc0207aba:	bfa9                	j	ffffffffc0207a14 <schedule+0x18>

ffffffffc0207abc <add_timer>:
ffffffffc0207abc:	1141                	addi	sp,sp,-16
ffffffffc0207abe:	e022                	sd	s0,0(sp)
ffffffffc0207ac0:	e406                	sd	ra,8(sp)
ffffffffc0207ac2:	842a                	mv	s0,a0
ffffffffc0207ac4:	100027f3          	csrr	a5,sstatus
ffffffffc0207ac8:	8b89                	andi	a5,a5,2
ffffffffc0207aca:	4501                	li	a0,0
ffffffffc0207acc:	eba5                	bnez	a5,ffffffffc0207b3c <add_timer+0x80>
ffffffffc0207ace:	401c                	lw	a5,0(s0)
ffffffffc0207ad0:	cbb5                	beqz	a5,ffffffffc0207b44 <add_timer+0x88>
ffffffffc0207ad2:	6418                	ld	a4,8(s0)
ffffffffc0207ad4:	cb25                	beqz	a4,ffffffffc0207b44 <add_timer+0x88>
ffffffffc0207ad6:	6c18                	ld	a4,24(s0)
ffffffffc0207ad8:	01040593          	addi	a1,s0,16
ffffffffc0207adc:	08e59463          	bne	a1,a4,ffffffffc0207b64 <add_timer+0xa8>
ffffffffc0207ae0:	0008e617          	auipc	a2,0x8e
ffffffffc0207ae4:	d4060613          	addi	a2,a2,-704 # ffffffffc0295820 <timer_list>
ffffffffc0207ae8:	6618                	ld	a4,8(a2)
ffffffffc0207aea:	00c71863          	bne	a4,a2,ffffffffc0207afa <add_timer+0x3e>
ffffffffc0207aee:	a80d                	j	ffffffffc0207b20 <add_timer+0x64>
ffffffffc0207af0:	6718                	ld	a4,8(a4)
ffffffffc0207af2:	9f95                	subw	a5,a5,a3
ffffffffc0207af4:	c01c                	sw	a5,0(s0)
ffffffffc0207af6:	02c70563          	beq	a4,a2,ffffffffc0207b20 <add_timer+0x64>
ffffffffc0207afa:	ff072683          	lw	a3,-16(a4)
ffffffffc0207afe:	fed7f9e3          	bgeu	a5,a3,ffffffffc0207af0 <add_timer+0x34>
ffffffffc0207b02:	40f687bb          	subw	a5,a3,a5
ffffffffc0207b06:	fef72823          	sw	a5,-16(a4)
ffffffffc0207b0a:	631c                	ld	a5,0(a4)
ffffffffc0207b0c:	e30c                	sd	a1,0(a4)
ffffffffc0207b0e:	e78c                	sd	a1,8(a5)
ffffffffc0207b10:	ec18                	sd	a4,24(s0)
ffffffffc0207b12:	e81c                	sd	a5,16(s0)
ffffffffc0207b14:	c105                	beqz	a0,ffffffffc0207b34 <add_timer+0x78>
ffffffffc0207b16:	6402                	ld	s0,0(sp)
ffffffffc0207b18:	60a2                	ld	ra,8(sp)
ffffffffc0207b1a:	0141                	addi	sp,sp,16
ffffffffc0207b1c:	950f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207b20:	0008e717          	auipc	a4,0x8e
ffffffffc0207b24:	d0070713          	addi	a4,a4,-768 # ffffffffc0295820 <timer_list>
ffffffffc0207b28:	631c                	ld	a5,0(a4)
ffffffffc0207b2a:	e30c                	sd	a1,0(a4)
ffffffffc0207b2c:	e78c                	sd	a1,8(a5)
ffffffffc0207b2e:	ec18                	sd	a4,24(s0)
ffffffffc0207b30:	e81c                	sd	a5,16(s0)
ffffffffc0207b32:	f175                	bnez	a0,ffffffffc0207b16 <add_timer+0x5a>
ffffffffc0207b34:	60a2                	ld	ra,8(sp)
ffffffffc0207b36:	6402                	ld	s0,0(sp)
ffffffffc0207b38:	0141                	addi	sp,sp,16
ffffffffc0207b3a:	8082                	ret
ffffffffc0207b3c:	936f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207b40:	4505                	li	a0,1
ffffffffc0207b42:	b771                	j	ffffffffc0207ace <add_timer+0x12>
ffffffffc0207b44:	00006697          	auipc	a3,0x6
ffffffffc0207b48:	5b468693          	addi	a3,a3,1460 # ffffffffc020e0f8 <CSWTCH.79+0x6d8>
ffffffffc0207b4c:	00004617          	auipc	a2,0x4
ffffffffc0207b50:	4c460613          	addi	a2,a2,1220 # ffffffffc020c010 <commands+0x210>
ffffffffc0207b54:	0a000593          	li	a1,160
ffffffffc0207b58:	00006517          	auipc	a0,0x6
ffffffffc0207b5c:	56850513          	addi	a0,a0,1384 # ffffffffc020e0c0 <CSWTCH.79+0x6a0>
ffffffffc0207b60:	93ff80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207b64:	00006697          	auipc	a3,0x6
ffffffffc0207b68:	5c468693          	addi	a3,a3,1476 # ffffffffc020e128 <CSWTCH.79+0x708>
ffffffffc0207b6c:	00004617          	auipc	a2,0x4
ffffffffc0207b70:	4a460613          	addi	a2,a2,1188 # ffffffffc020c010 <commands+0x210>
ffffffffc0207b74:	0a100593          	li	a1,161
ffffffffc0207b78:	00006517          	auipc	a0,0x6
ffffffffc0207b7c:	54850513          	addi	a0,a0,1352 # ffffffffc020e0c0 <CSWTCH.79+0x6a0>
ffffffffc0207b80:	91ff80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207b84 <del_timer>:
ffffffffc0207b84:	1101                	addi	sp,sp,-32
ffffffffc0207b86:	e822                	sd	s0,16(sp)
ffffffffc0207b88:	ec06                	sd	ra,24(sp)
ffffffffc0207b8a:	e426                	sd	s1,8(sp)
ffffffffc0207b8c:	842a                	mv	s0,a0
ffffffffc0207b8e:	100027f3          	csrr	a5,sstatus
ffffffffc0207b92:	8b89                	andi	a5,a5,2
ffffffffc0207b94:	01050493          	addi	s1,a0,16
ffffffffc0207b98:	eb9d                	bnez	a5,ffffffffc0207bce <del_timer+0x4a>
ffffffffc0207b9a:	6d1c                	ld	a5,24(a0)
ffffffffc0207b9c:	02978463          	beq	a5,s1,ffffffffc0207bc4 <del_timer+0x40>
ffffffffc0207ba0:	4114                	lw	a3,0(a0)
ffffffffc0207ba2:	6918                	ld	a4,16(a0)
ffffffffc0207ba4:	ce81                	beqz	a3,ffffffffc0207bbc <del_timer+0x38>
ffffffffc0207ba6:	0008e617          	auipc	a2,0x8e
ffffffffc0207baa:	c7a60613          	addi	a2,a2,-902 # ffffffffc0295820 <timer_list>
ffffffffc0207bae:	00c78763          	beq	a5,a2,ffffffffc0207bbc <del_timer+0x38>
ffffffffc0207bb2:	ff07a603          	lw	a2,-16(a5)
ffffffffc0207bb6:	9eb1                	addw	a3,a3,a2
ffffffffc0207bb8:	fed7a823          	sw	a3,-16(a5)
ffffffffc0207bbc:	e71c                	sd	a5,8(a4)
ffffffffc0207bbe:	e398                	sd	a4,0(a5)
ffffffffc0207bc0:	ec04                	sd	s1,24(s0)
ffffffffc0207bc2:	e804                	sd	s1,16(s0)
ffffffffc0207bc4:	60e2                	ld	ra,24(sp)
ffffffffc0207bc6:	6442                	ld	s0,16(sp)
ffffffffc0207bc8:	64a2                	ld	s1,8(sp)
ffffffffc0207bca:	6105                	addi	sp,sp,32
ffffffffc0207bcc:	8082                	ret
ffffffffc0207bce:	8a4f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207bd2:	6c1c                	ld	a5,24(s0)
ffffffffc0207bd4:	02978463          	beq	a5,s1,ffffffffc0207bfc <del_timer+0x78>
ffffffffc0207bd8:	4014                	lw	a3,0(s0)
ffffffffc0207bda:	6818                	ld	a4,16(s0)
ffffffffc0207bdc:	ce81                	beqz	a3,ffffffffc0207bf4 <del_timer+0x70>
ffffffffc0207bde:	0008e617          	auipc	a2,0x8e
ffffffffc0207be2:	c4260613          	addi	a2,a2,-958 # ffffffffc0295820 <timer_list>
ffffffffc0207be6:	00c78763          	beq	a5,a2,ffffffffc0207bf4 <del_timer+0x70>
ffffffffc0207bea:	ff07a603          	lw	a2,-16(a5)
ffffffffc0207bee:	9eb1                	addw	a3,a3,a2
ffffffffc0207bf0:	fed7a823          	sw	a3,-16(a5)
ffffffffc0207bf4:	e71c                	sd	a5,8(a4)
ffffffffc0207bf6:	e398                	sd	a4,0(a5)
ffffffffc0207bf8:	ec04                	sd	s1,24(s0)
ffffffffc0207bfa:	e804                	sd	s1,16(s0)
ffffffffc0207bfc:	6442                	ld	s0,16(sp)
ffffffffc0207bfe:	60e2                	ld	ra,24(sp)
ffffffffc0207c00:	64a2                	ld	s1,8(sp)
ffffffffc0207c02:	6105                	addi	sp,sp,32
ffffffffc0207c04:	868f906f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc0207c08 <run_timer_list>:
ffffffffc0207c08:	7139                	addi	sp,sp,-64
ffffffffc0207c0a:	fc06                	sd	ra,56(sp)
ffffffffc0207c0c:	f822                	sd	s0,48(sp)
ffffffffc0207c0e:	f426                	sd	s1,40(sp)
ffffffffc0207c10:	f04a                	sd	s2,32(sp)
ffffffffc0207c12:	ec4e                	sd	s3,24(sp)
ffffffffc0207c14:	e852                	sd	s4,16(sp)
ffffffffc0207c16:	e456                	sd	s5,8(sp)
ffffffffc0207c18:	e05a                	sd	s6,0(sp)
ffffffffc0207c1a:	100027f3          	csrr	a5,sstatus
ffffffffc0207c1e:	8b89                	andi	a5,a5,2
ffffffffc0207c20:	4b01                	li	s6,0
ffffffffc0207c22:	efe9                	bnez	a5,ffffffffc0207cfc <run_timer_list+0xf4>
ffffffffc0207c24:	0008e997          	auipc	s3,0x8e
ffffffffc0207c28:	bfc98993          	addi	s3,s3,-1028 # ffffffffc0295820 <timer_list>
ffffffffc0207c2c:	0089b403          	ld	s0,8(s3)
ffffffffc0207c30:	07340a63          	beq	s0,s3,ffffffffc0207ca4 <run_timer_list+0x9c>
ffffffffc0207c34:	ff042783          	lw	a5,-16(s0)
ffffffffc0207c38:	ff040913          	addi	s2,s0,-16
ffffffffc0207c3c:	0e078763          	beqz	a5,ffffffffc0207d2a <run_timer_list+0x122>
ffffffffc0207c40:	fff7871b          	addiw	a4,a5,-1
ffffffffc0207c44:	fee42823          	sw	a4,-16(s0)
ffffffffc0207c48:	ef31                	bnez	a4,ffffffffc0207ca4 <run_timer_list+0x9c>
ffffffffc0207c4a:	00006a97          	auipc	s5,0x6
ffffffffc0207c4e:	546a8a93          	addi	s5,s5,1350 # ffffffffc020e190 <CSWTCH.79+0x770>
ffffffffc0207c52:	00006a17          	auipc	s4,0x6
ffffffffc0207c56:	46ea0a13          	addi	s4,s4,1134 # ffffffffc020e0c0 <CSWTCH.79+0x6a0>
ffffffffc0207c5a:	a005                	j	ffffffffc0207c7a <run_timer_list+0x72>
ffffffffc0207c5c:	0a07d763          	bgez	a5,ffffffffc0207d0a <run_timer_list+0x102>
ffffffffc0207c60:	8526                	mv	a0,s1
ffffffffc0207c62:	ce9ff0ef          	jal	ra,ffffffffc020794a <wakeup_proc>
ffffffffc0207c66:	854a                	mv	a0,s2
ffffffffc0207c68:	f1dff0ef          	jal	ra,ffffffffc0207b84 <del_timer>
ffffffffc0207c6c:	03340c63          	beq	s0,s3,ffffffffc0207ca4 <run_timer_list+0x9c>
ffffffffc0207c70:	ff042783          	lw	a5,-16(s0)
ffffffffc0207c74:	ff040913          	addi	s2,s0,-16
ffffffffc0207c78:	e795                	bnez	a5,ffffffffc0207ca4 <run_timer_list+0x9c>
ffffffffc0207c7a:	00893483          	ld	s1,8(s2)
ffffffffc0207c7e:	6400                	ld	s0,8(s0)
ffffffffc0207c80:	0ec4a783          	lw	a5,236(s1)
ffffffffc0207c84:	ffe1                	bnez	a5,ffffffffc0207c5c <run_timer_list+0x54>
ffffffffc0207c86:	40d4                	lw	a3,4(s1)
ffffffffc0207c88:	8656                	mv	a2,s5
ffffffffc0207c8a:	0e000593          	li	a1,224
ffffffffc0207c8e:	8552                	mv	a0,s4
ffffffffc0207c90:	877f80ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc0207c94:	8526                	mv	a0,s1
ffffffffc0207c96:	cb5ff0ef          	jal	ra,ffffffffc020794a <wakeup_proc>
ffffffffc0207c9a:	854a                	mv	a0,s2
ffffffffc0207c9c:	ee9ff0ef          	jal	ra,ffffffffc0207b84 <del_timer>
ffffffffc0207ca0:	fd3418e3          	bne	s0,s3,ffffffffc0207c70 <run_timer_list+0x68>
ffffffffc0207ca4:	0008f597          	auipc	a1,0x8f
ffffffffc0207ca8:	c4c5b583          	ld	a1,-948(a1) # ffffffffc02968f0 <current>
ffffffffc0207cac:	c18d                	beqz	a1,ffffffffc0207cce <run_timer_list+0xc6>
ffffffffc0207cae:	0008f797          	auipc	a5,0x8f
ffffffffc0207cb2:	c4a7b783          	ld	a5,-950(a5) # ffffffffc02968f8 <idleproc>
ffffffffc0207cb6:	04f58763          	beq	a1,a5,ffffffffc0207d04 <run_timer_list+0xfc>
ffffffffc0207cba:	0008f797          	auipc	a5,0x8f
ffffffffc0207cbe:	c5e7b783          	ld	a5,-930(a5) # ffffffffc0296918 <sched_class>
ffffffffc0207cc2:	779c                	ld	a5,40(a5)
ffffffffc0207cc4:	0008f517          	auipc	a0,0x8f
ffffffffc0207cc8:	c4c53503          	ld	a0,-948(a0) # ffffffffc0296910 <rq>
ffffffffc0207ccc:	9782                	jalr	a5
ffffffffc0207cce:	000b1c63          	bnez	s6,ffffffffc0207ce6 <run_timer_list+0xde>
ffffffffc0207cd2:	70e2                	ld	ra,56(sp)
ffffffffc0207cd4:	7442                	ld	s0,48(sp)
ffffffffc0207cd6:	74a2                	ld	s1,40(sp)
ffffffffc0207cd8:	7902                	ld	s2,32(sp)
ffffffffc0207cda:	69e2                	ld	s3,24(sp)
ffffffffc0207cdc:	6a42                	ld	s4,16(sp)
ffffffffc0207cde:	6aa2                	ld	s5,8(sp)
ffffffffc0207ce0:	6b02                	ld	s6,0(sp)
ffffffffc0207ce2:	6121                	addi	sp,sp,64
ffffffffc0207ce4:	8082                	ret
ffffffffc0207ce6:	7442                	ld	s0,48(sp)
ffffffffc0207ce8:	70e2                	ld	ra,56(sp)
ffffffffc0207cea:	74a2                	ld	s1,40(sp)
ffffffffc0207cec:	7902                	ld	s2,32(sp)
ffffffffc0207cee:	69e2                	ld	s3,24(sp)
ffffffffc0207cf0:	6a42                	ld	s4,16(sp)
ffffffffc0207cf2:	6aa2                	ld	s5,8(sp)
ffffffffc0207cf4:	6b02                	ld	s6,0(sp)
ffffffffc0207cf6:	6121                	addi	sp,sp,64
ffffffffc0207cf8:	f75f806f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207cfc:	f77f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207d00:	4b05                	li	s6,1
ffffffffc0207d02:	b70d                	j	ffffffffc0207c24 <run_timer_list+0x1c>
ffffffffc0207d04:	4785                	li	a5,1
ffffffffc0207d06:	ed9c                	sd	a5,24(a1)
ffffffffc0207d08:	b7d9                	j	ffffffffc0207cce <run_timer_list+0xc6>
ffffffffc0207d0a:	00006697          	auipc	a3,0x6
ffffffffc0207d0e:	45e68693          	addi	a3,a3,1118 # ffffffffc020e168 <CSWTCH.79+0x748>
ffffffffc0207d12:	00004617          	auipc	a2,0x4
ffffffffc0207d16:	2fe60613          	addi	a2,a2,766 # ffffffffc020c010 <commands+0x210>
ffffffffc0207d1a:	0dc00593          	li	a1,220
ffffffffc0207d1e:	00006517          	auipc	a0,0x6
ffffffffc0207d22:	3a250513          	addi	a0,a0,930 # ffffffffc020e0c0 <CSWTCH.79+0x6a0>
ffffffffc0207d26:	f78f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207d2a:	00006697          	auipc	a3,0x6
ffffffffc0207d2e:	42668693          	addi	a3,a3,1062 # ffffffffc020e150 <CSWTCH.79+0x730>
ffffffffc0207d32:	00004617          	auipc	a2,0x4
ffffffffc0207d36:	2de60613          	addi	a2,a2,734 # ffffffffc020c010 <commands+0x210>
ffffffffc0207d3a:	0d400593          	li	a1,212
ffffffffc0207d3e:	00006517          	auipc	a0,0x6
ffffffffc0207d42:	38250513          	addi	a0,a0,898 # ffffffffc020e0c0 <CSWTCH.79+0x6a0>
ffffffffc0207d46:	f58f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207d4a <sys_getpid>:
ffffffffc0207d4a:	0008f797          	auipc	a5,0x8f
ffffffffc0207d4e:	ba67b783          	ld	a5,-1114(a5) # ffffffffc02968f0 <current>
ffffffffc0207d52:	43c8                	lw	a0,4(a5)
ffffffffc0207d54:	8082                	ret

ffffffffc0207d56 <sys_pgdir>:
ffffffffc0207d56:	4501                	li	a0,0
ffffffffc0207d58:	8082                	ret

ffffffffc0207d5a <sys_gettime>:
ffffffffc0207d5a:	0008f797          	auipc	a5,0x8f
ffffffffc0207d5e:	b467b783          	ld	a5,-1210(a5) # ffffffffc02968a0 <ticks>
ffffffffc0207d62:	0027951b          	slliw	a0,a5,0x2
ffffffffc0207d66:	9d3d                	addw	a0,a0,a5
ffffffffc0207d68:	0015151b          	slliw	a0,a0,0x1
ffffffffc0207d6c:	8082                	ret

ffffffffc0207d6e <sys_lab6_set_priority>:
ffffffffc0207d6e:	4108                	lw	a0,0(a0)
ffffffffc0207d70:	1141                	addi	sp,sp,-16
ffffffffc0207d72:	e406                	sd	ra,8(sp)
ffffffffc0207d74:	ad6ff0ef          	jal	ra,ffffffffc020704a <lab6_set_priority>
ffffffffc0207d78:	60a2                	ld	ra,8(sp)
ffffffffc0207d7a:	4501                	li	a0,0
ffffffffc0207d7c:	0141                	addi	sp,sp,16
ffffffffc0207d7e:	8082                	ret

ffffffffc0207d80 <sys_dup>:
ffffffffc0207d80:	450c                	lw	a1,8(a0)
ffffffffc0207d82:	4108                	lw	a0,0(a0)
ffffffffc0207d84:	cd5fd06f          	j	ffffffffc0205a58 <sysfile_dup>

ffffffffc0207d88 <sys_getdirentry>:
ffffffffc0207d88:	650c                	ld	a1,8(a0)
ffffffffc0207d8a:	4108                	lw	a0,0(a0)
ffffffffc0207d8c:	bddfd06f          	j	ffffffffc0205968 <sysfile_getdirentry>

ffffffffc0207d90 <sys_getcwd>:
ffffffffc0207d90:	650c                	ld	a1,8(a0)
ffffffffc0207d92:	6108                	ld	a0,0(a0)
ffffffffc0207d94:	b31fd06f          	j	ffffffffc02058c4 <sysfile_getcwd>

ffffffffc0207d98 <sys_fsync>:
ffffffffc0207d98:	4108                	lw	a0,0(a0)
ffffffffc0207d9a:	b27fd06f          	j	ffffffffc02058c0 <sysfile_fsync>

ffffffffc0207d9e <sys_fstat>:
ffffffffc0207d9e:	650c                	ld	a1,8(a0)
ffffffffc0207da0:	4108                	lw	a0,0(a0)
ffffffffc0207da2:	a7ffd06f          	j	ffffffffc0205820 <sysfile_fstat>

ffffffffc0207da6 <sys_seek>:
ffffffffc0207da6:	4910                	lw	a2,16(a0)
ffffffffc0207da8:	650c                	ld	a1,8(a0)
ffffffffc0207daa:	4108                	lw	a0,0(a0)
ffffffffc0207dac:	a71fd06f          	j	ffffffffc020581c <sysfile_seek>

ffffffffc0207db0 <sys_write>:
ffffffffc0207db0:	6910                	ld	a2,16(a0)
ffffffffc0207db2:	650c                	ld	a1,8(a0)
ffffffffc0207db4:	4108                	lw	a0,0(a0)
ffffffffc0207db6:	94dfd06f          	j	ffffffffc0205702 <sysfile_write>

ffffffffc0207dba <sys_read>:
ffffffffc0207dba:	6910                	ld	a2,16(a0)
ffffffffc0207dbc:	650c                	ld	a1,8(a0)
ffffffffc0207dbe:	4108                	lw	a0,0(a0)
ffffffffc0207dc0:	82ffd06f          	j	ffffffffc02055ee <sysfile_read>

ffffffffc0207dc4 <sys_close>:
ffffffffc0207dc4:	4108                	lw	a0,0(a0)
ffffffffc0207dc6:	825fd06f          	j	ffffffffc02055ea <sysfile_close>

ffffffffc0207dca <sys_open>:
ffffffffc0207dca:	450c                	lw	a1,8(a0)
ffffffffc0207dcc:	6108                	ld	a0,0(a0)
ffffffffc0207dce:	fe8fd06f          	j	ffffffffc02055b6 <sysfile_open>

ffffffffc0207dd2 <sys_putc>:
ffffffffc0207dd2:	4108                	lw	a0,0(a0)
ffffffffc0207dd4:	1141                	addi	sp,sp,-16
ffffffffc0207dd6:	e406                	sd	ra,8(sp)
ffffffffc0207dd8:	c0af80ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0207ddc:	60a2                	ld	ra,8(sp)
ffffffffc0207dde:	4501                	li	a0,0
ffffffffc0207de0:	0141                	addi	sp,sp,16
ffffffffc0207de2:	8082                	ret

ffffffffc0207de4 <sys_kill>:
ffffffffc0207de4:	4108                	lw	a0,0(a0)
ffffffffc0207de6:	802ff06f          	j	ffffffffc0206de8 <do_kill>

ffffffffc0207dea <sys_sleep>:
ffffffffc0207dea:	4108                	lw	a0,0(a0)
ffffffffc0207dec:	aa0ff06f          	j	ffffffffc020708c <do_sleep>

ffffffffc0207df0 <sys_yield>:
ffffffffc0207df0:	fabfe06f          	j	ffffffffc0206d9a <do_yield>

ffffffffc0207df4 <sys_exec>:
ffffffffc0207df4:	6910                	ld	a2,16(a0)
ffffffffc0207df6:	450c                	lw	a1,8(a0)
ffffffffc0207df8:	6108                	ld	a0,0(a0)
ffffffffc0207dfa:	f00fe06f          	j	ffffffffc02064fa <do_execve>

ffffffffc0207dfe <sys_wait>:
ffffffffc0207dfe:	650c                	ld	a1,8(a0)
ffffffffc0207e00:	4108                	lw	a0,0(a0)
ffffffffc0207e02:	fa9fe06f          	j	ffffffffc0206daa <do_wait>

ffffffffc0207e06 <sys_fork>:
ffffffffc0207e06:	0008f797          	auipc	a5,0x8f
ffffffffc0207e0a:	aea7b783          	ld	a5,-1302(a5) # ffffffffc02968f0 <current>
ffffffffc0207e0e:	73d0                	ld	a2,160(a5)
ffffffffc0207e10:	4501                	li	a0,0
ffffffffc0207e12:	6a0c                	ld	a1,16(a2)
ffffffffc0207e14:	de5fd06f          	j	ffffffffc0205bf8 <do_fork>

ffffffffc0207e18 <sys_exit>:
ffffffffc0207e18:	4108                	lw	a0,0(a0)
ffffffffc0207e1a:	a2cfe06f          	j	ffffffffc0206046 <do_exit>

ffffffffc0207e1e <syscall>:
ffffffffc0207e1e:	715d                	addi	sp,sp,-80
ffffffffc0207e20:	fc26                	sd	s1,56(sp)
ffffffffc0207e22:	0008f497          	auipc	s1,0x8f
ffffffffc0207e26:	ace48493          	addi	s1,s1,-1330 # ffffffffc02968f0 <current>
ffffffffc0207e2a:	6098                	ld	a4,0(s1)
ffffffffc0207e2c:	e0a2                	sd	s0,64(sp)
ffffffffc0207e2e:	f84a                	sd	s2,48(sp)
ffffffffc0207e30:	7340                	ld	s0,160(a4)
ffffffffc0207e32:	e486                	sd	ra,72(sp)
ffffffffc0207e34:	0ff00793          	li	a5,255
ffffffffc0207e38:	05042903          	lw	s2,80(s0)
ffffffffc0207e3c:	0327ee63          	bltu	a5,s2,ffffffffc0207e78 <syscall+0x5a>
ffffffffc0207e40:	00391713          	slli	a4,s2,0x3
ffffffffc0207e44:	00006797          	auipc	a5,0x6
ffffffffc0207e48:	3b478793          	addi	a5,a5,948 # ffffffffc020e1f8 <syscalls>
ffffffffc0207e4c:	97ba                	add	a5,a5,a4
ffffffffc0207e4e:	639c                	ld	a5,0(a5)
ffffffffc0207e50:	c785                	beqz	a5,ffffffffc0207e78 <syscall+0x5a>
ffffffffc0207e52:	6c28                	ld	a0,88(s0)
ffffffffc0207e54:	702c                	ld	a1,96(s0)
ffffffffc0207e56:	7430                	ld	a2,104(s0)
ffffffffc0207e58:	7834                	ld	a3,112(s0)
ffffffffc0207e5a:	7c38                	ld	a4,120(s0)
ffffffffc0207e5c:	e42a                	sd	a0,8(sp)
ffffffffc0207e5e:	e82e                	sd	a1,16(sp)
ffffffffc0207e60:	ec32                	sd	a2,24(sp)
ffffffffc0207e62:	f036                	sd	a3,32(sp)
ffffffffc0207e64:	f43a                	sd	a4,40(sp)
ffffffffc0207e66:	0028                	addi	a0,sp,8
ffffffffc0207e68:	9782                	jalr	a5
ffffffffc0207e6a:	60a6                	ld	ra,72(sp)
ffffffffc0207e6c:	e828                	sd	a0,80(s0)
ffffffffc0207e6e:	6406                	ld	s0,64(sp)
ffffffffc0207e70:	74e2                	ld	s1,56(sp)
ffffffffc0207e72:	7942                	ld	s2,48(sp)
ffffffffc0207e74:	6161                	addi	sp,sp,80
ffffffffc0207e76:	8082                	ret
ffffffffc0207e78:	8522                	mv	a0,s0
ffffffffc0207e7a:	910f90ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0207e7e:	609c                	ld	a5,0(s1)
ffffffffc0207e80:	86ca                	mv	a3,s2
ffffffffc0207e82:	00006617          	auipc	a2,0x6
ffffffffc0207e86:	32e60613          	addi	a2,a2,814 # ffffffffc020e1b0 <CSWTCH.79+0x790>
ffffffffc0207e8a:	43d8                	lw	a4,4(a5)
ffffffffc0207e8c:	0d800593          	li	a1,216
ffffffffc0207e90:	0b478793          	addi	a5,a5,180
ffffffffc0207e94:	00006517          	auipc	a0,0x6
ffffffffc0207e98:	34c50513          	addi	a0,a0,844 # ffffffffc020e1e0 <CSWTCH.79+0x7c0>
ffffffffc0207e9c:	e02f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207ea0 <__alloc_inode>:
ffffffffc0207ea0:	1141                	addi	sp,sp,-16
ffffffffc0207ea2:	e022                	sd	s0,0(sp)
ffffffffc0207ea4:	842a                	mv	s0,a0
ffffffffc0207ea6:	07800513          	li	a0,120
ffffffffc0207eaa:	e406                	sd	ra,8(sp)
ffffffffc0207eac:	96efa0ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0207eb0:	c111                	beqz	a0,ffffffffc0207eb4 <__alloc_inode+0x14>
ffffffffc0207eb2:	cd20                	sw	s0,88(a0)
ffffffffc0207eb4:	60a2                	ld	ra,8(sp)
ffffffffc0207eb6:	6402                	ld	s0,0(sp)
ffffffffc0207eb8:	0141                	addi	sp,sp,16
ffffffffc0207eba:	8082                	ret

ffffffffc0207ebc <inode_init>:
ffffffffc0207ebc:	4785                	li	a5,1
ffffffffc0207ebe:	06052023          	sw	zero,96(a0)
ffffffffc0207ec2:	f92c                	sd	a1,112(a0)
ffffffffc0207ec4:	f530                	sd	a2,104(a0)
ffffffffc0207ec6:	cd7c                	sw	a5,92(a0)
ffffffffc0207ec8:	8082                	ret

ffffffffc0207eca <inode_kill>:
ffffffffc0207eca:	4d78                	lw	a4,92(a0)
ffffffffc0207ecc:	1141                	addi	sp,sp,-16
ffffffffc0207ece:	e406                	sd	ra,8(sp)
ffffffffc0207ed0:	e719                	bnez	a4,ffffffffc0207ede <inode_kill+0x14>
ffffffffc0207ed2:	513c                	lw	a5,96(a0)
ffffffffc0207ed4:	e78d                	bnez	a5,ffffffffc0207efe <inode_kill+0x34>
ffffffffc0207ed6:	60a2                	ld	ra,8(sp)
ffffffffc0207ed8:	0141                	addi	sp,sp,16
ffffffffc0207eda:	9f0fa06f          	j	ffffffffc02020ca <kfree>
ffffffffc0207ede:	00007697          	auipc	a3,0x7
ffffffffc0207ee2:	b1a68693          	addi	a3,a3,-1254 # ffffffffc020e9f8 <syscalls+0x800>
ffffffffc0207ee6:	00004617          	auipc	a2,0x4
ffffffffc0207eea:	12a60613          	addi	a2,a2,298 # ffffffffc020c010 <commands+0x210>
ffffffffc0207eee:	02900593          	li	a1,41
ffffffffc0207ef2:	00007517          	auipc	a0,0x7
ffffffffc0207ef6:	b2650513          	addi	a0,a0,-1242 # ffffffffc020ea18 <syscalls+0x820>
ffffffffc0207efa:	da4f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207efe:	00007697          	auipc	a3,0x7
ffffffffc0207f02:	b3268693          	addi	a3,a3,-1230 # ffffffffc020ea30 <syscalls+0x838>
ffffffffc0207f06:	00004617          	auipc	a2,0x4
ffffffffc0207f0a:	10a60613          	addi	a2,a2,266 # ffffffffc020c010 <commands+0x210>
ffffffffc0207f0e:	02a00593          	li	a1,42
ffffffffc0207f12:	00007517          	auipc	a0,0x7
ffffffffc0207f16:	b0650513          	addi	a0,a0,-1274 # ffffffffc020ea18 <syscalls+0x820>
ffffffffc0207f1a:	d84f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207f1e <inode_ref_inc>:
ffffffffc0207f1e:	4d7c                	lw	a5,92(a0)
ffffffffc0207f20:	2785                	addiw	a5,a5,1
ffffffffc0207f22:	cd7c                	sw	a5,92(a0)
ffffffffc0207f24:	0007851b          	sext.w	a0,a5
ffffffffc0207f28:	8082                	ret

ffffffffc0207f2a <inode_open_inc>:
ffffffffc0207f2a:	513c                	lw	a5,96(a0)
ffffffffc0207f2c:	2785                	addiw	a5,a5,1
ffffffffc0207f2e:	d13c                	sw	a5,96(a0)
ffffffffc0207f30:	0007851b          	sext.w	a0,a5
ffffffffc0207f34:	8082                	ret

ffffffffc0207f36 <inode_check>:
ffffffffc0207f36:	1141                	addi	sp,sp,-16
ffffffffc0207f38:	e406                	sd	ra,8(sp)
ffffffffc0207f3a:	c90d                	beqz	a0,ffffffffc0207f6c <inode_check+0x36>
ffffffffc0207f3c:	793c                	ld	a5,112(a0)
ffffffffc0207f3e:	c79d                	beqz	a5,ffffffffc0207f6c <inode_check+0x36>
ffffffffc0207f40:	6398                	ld	a4,0(a5)
ffffffffc0207f42:	4625d7b7          	lui	a5,0x4625d
ffffffffc0207f46:	0786                	slli	a5,a5,0x1
ffffffffc0207f48:	47678793          	addi	a5,a5,1142 # 4625d476 <_binary_bin_sfs_img_size+0x461e8176>
ffffffffc0207f4c:	08f71063          	bne	a4,a5,ffffffffc0207fcc <inode_check+0x96>
ffffffffc0207f50:	4d78                	lw	a4,92(a0)
ffffffffc0207f52:	513c                	lw	a5,96(a0)
ffffffffc0207f54:	04f74c63          	blt	a4,a5,ffffffffc0207fac <inode_check+0x76>
ffffffffc0207f58:	0407ca63          	bltz	a5,ffffffffc0207fac <inode_check+0x76>
ffffffffc0207f5c:	66c1                	lui	a3,0x10
ffffffffc0207f5e:	02d75763          	bge	a4,a3,ffffffffc0207f8c <inode_check+0x56>
ffffffffc0207f62:	02d7d563          	bge	a5,a3,ffffffffc0207f8c <inode_check+0x56>
ffffffffc0207f66:	60a2                	ld	ra,8(sp)
ffffffffc0207f68:	0141                	addi	sp,sp,16
ffffffffc0207f6a:	8082                	ret
ffffffffc0207f6c:	00007697          	auipc	a3,0x7
ffffffffc0207f70:	ae468693          	addi	a3,a3,-1308 # ffffffffc020ea50 <syscalls+0x858>
ffffffffc0207f74:	00004617          	auipc	a2,0x4
ffffffffc0207f78:	09c60613          	addi	a2,a2,156 # ffffffffc020c010 <commands+0x210>
ffffffffc0207f7c:	06e00593          	li	a1,110
ffffffffc0207f80:	00007517          	auipc	a0,0x7
ffffffffc0207f84:	a9850513          	addi	a0,a0,-1384 # ffffffffc020ea18 <syscalls+0x820>
ffffffffc0207f88:	d16f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207f8c:	00007697          	auipc	a3,0x7
ffffffffc0207f90:	b4468693          	addi	a3,a3,-1212 # ffffffffc020ead0 <syscalls+0x8d8>
ffffffffc0207f94:	00004617          	auipc	a2,0x4
ffffffffc0207f98:	07c60613          	addi	a2,a2,124 # ffffffffc020c010 <commands+0x210>
ffffffffc0207f9c:	07200593          	li	a1,114
ffffffffc0207fa0:	00007517          	auipc	a0,0x7
ffffffffc0207fa4:	a7850513          	addi	a0,a0,-1416 # ffffffffc020ea18 <syscalls+0x820>
ffffffffc0207fa8:	cf6f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207fac:	00007697          	auipc	a3,0x7
ffffffffc0207fb0:	af468693          	addi	a3,a3,-1292 # ffffffffc020eaa0 <syscalls+0x8a8>
ffffffffc0207fb4:	00004617          	auipc	a2,0x4
ffffffffc0207fb8:	05c60613          	addi	a2,a2,92 # ffffffffc020c010 <commands+0x210>
ffffffffc0207fbc:	07100593          	li	a1,113
ffffffffc0207fc0:	00007517          	auipc	a0,0x7
ffffffffc0207fc4:	a5850513          	addi	a0,a0,-1448 # ffffffffc020ea18 <syscalls+0x820>
ffffffffc0207fc8:	cd6f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207fcc:	00007697          	auipc	a3,0x7
ffffffffc0207fd0:	aac68693          	addi	a3,a3,-1364 # ffffffffc020ea78 <syscalls+0x880>
ffffffffc0207fd4:	00004617          	auipc	a2,0x4
ffffffffc0207fd8:	03c60613          	addi	a2,a2,60 # ffffffffc020c010 <commands+0x210>
ffffffffc0207fdc:	06f00593          	li	a1,111
ffffffffc0207fe0:	00007517          	auipc	a0,0x7
ffffffffc0207fe4:	a3850513          	addi	a0,a0,-1480 # ffffffffc020ea18 <syscalls+0x820>
ffffffffc0207fe8:	cb6f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207fec <inode_ref_dec>:
ffffffffc0207fec:	4d7c                	lw	a5,92(a0)
ffffffffc0207fee:	1101                	addi	sp,sp,-32
ffffffffc0207ff0:	ec06                	sd	ra,24(sp)
ffffffffc0207ff2:	e822                	sd	s0,16(sp)
ffffffffc0207ff4:	e426                	sd	s1,8(sp)
ffffffffc0207ff6:	e04a                	sd	s2,0(sp)
ffffffffc0207ff8:	06f05e63          	blez	a5,ffffffffc0208074 <inode_ref_dec+0x88>
ffffffffc0207ffc:	fff7849b          	addiw	s1,a5,-1
ffffffffc0208000:	cd64                	sw	s1,92(a0)
ffffffffc0208002:	842a                	mv	s0,a0
ffffffffc0208004:	e09d                	bnez	s1,ffffffffc020802a <inode_ref_dec+0x3e>
ffffffffc0208006:	793c                	ld	a5,112(a0)
ffffffffc0208008:	c7b1                	beqz	a5,ffffffffc0208054 <inode_ref_dec+0x68>
ffffffffc020800a:	0487b903          	ld	s2,72(a5)
ffffffffc020800e:	04090363          	beqz	s2,ffffffffc0208054 <inode_ref_dec+0x68>
ffffffffc0208012:	00007597          	auipc	a1,0x7
ffffffffc0208016:	b6e58593          	addi	a1,a1,-1170 # ffffffffc020eb80 <syscalls+0x988>
ffffffffc020801a:	f1dff0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc020801e:	8522                	mv	a0,s0
ffffffffc0208020:	9902                	jalr	s2
ffffffffc0208022:	c501                	beqz	a0,ffffffffc020802a <inode_ref_dec+0x3e>
ffffffffc0208024:	57c5                	li	a5,-15
ffffffffc0208026:	00f51963          	bne	a0,a5,ffffffffc0208038 <inode_ref_dec+0x4c>
ffffffffc020802a:	60e2                	ld	ra,24(sp)
ffffffffc020802c:	6442                	ld	s0,16(sp)
ffffffffc020802e:	6902                	ld	s2,0(sp)
ffffffffc0208030:	8526                	mv	a0,s1
ffffffffc0208032:	64a2                	ld	s1,8(sp)
ffffffffc0208034:	6105                	addi	sp,sp,32
ffffffffc0208036:	8082                	ret
ffffffffc0208038:	85aa                	mv	a1,a0
ffffffffc020803a:	00007517          	auipc	a0,0x7
ffffffffc020803e:	b4e50513          	addi	a0,a0,-1202 # ffffffffc020eb88 <syscalls+0x990>
ffffffffc0208042:	964f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0208046:	60e2                	ld	ra,24(sp)
ffffffffc0208048:	6442                	ld	s0,16(sp)
ffffffffc020804a:	6902                	ld	s2,0(sp)
ffffffffc020804c:	8526                	mv	a0,s1
ffffffffc020804e:	64a2                	ld	s1,8(sp)
ffffffffc0208050:	6105                	addi	sp,sp,32
ffffffffc0208052:	8082                	ret
ffffffffc0208054:	00007697          	auipc	a3,0x7
ffffffffc0208058:	adc68693          	addi	a3,a3,-1316 # ffffffffc020eb30 <syscalls+0x938>
ffffffffc020805c:	00004617          	auipc	a2,0x4
ffffffffc0208060:	fb460613          	addi	a2,a2,-76 # ffffffffc020c010 <commands+0x210>
ffffffffc0208064:	04400593          	li	a1,68
ffffffffc0208068:	00007517          	auipc	a0,0x7
ffffffffc020806c:	9b050513          	addi	a0,a0,-1616 # ffffffffc020ea18 <syscalls+0x820>
ffffffffc0208070:	c2ef80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208074:	00007697          	auipc	a3,0x7
ffffffffc0208078:	a9c68693          	addi	a3,a3,-1380 # ffffffffc020eb10 <syscalls+0x918>
ffffffffc020807c:	00004617          	auipc	a2,0x4
ffffffffc0208080:	f9460613          	addi	a2,a2,-108 # ffffffffc020c010 <commands+0x210>
ffffffffc0208084:	03f00593          	li	a1,63
ffffffffc0208088:	00007517          	auipc	a0,0x7
ffffffffc020808c:	99050513          	addi	a0,a0,-1648 # ffffffffc020ea18 <syscalls+0x820>
ffffffffc0208090:	c0ef80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208094 <inode_open_dec>:
ffffffffc0208094:	513c                	lw	a5,96(a0)
ffffffffc0208096:	1101                	addi	sp,sp,-32
ffffffffc0208098:	ec06                	sd	ra,24(sp)
ffffffffc020809a:	e822                	sd	s0,16(sp)
ffffffffc020809c:	e426                	sd	s1,8(sp)
ffffffffc020809e:	e04a                	sd	s2,0(sp)
ffffffffc02080a0:	06f05b63          	blez	a5,ffffffffc0208116 <inode_open_dec+0x82>
ffffffffc02080a4:	fff7849b          	addiw	s1,a5,-1
ffffffffc02080a8:	d124                	sw	s1,96(a0)
ffffffffc02080aa:	842a                	mv	s0,a0
ffffffffc02080ac:	e085                	bnez	s1,ffffffffc02080cc <inode_open_dec+0x38>
ffffffffc02080ae:	793c                	ld	a5,112(a0)
ffffffffc02080b0:	c3b9                	beqz	a5,ffffffffc02080f6 <inode_open_dec+0x62>
ffffffffc02080b2:	0107b903          	ld	s2,16(a5)
ffffffffc02080b6:	04090063          	beqz	s2,ffffffffc02080f6 <inode_open_dec+0x62>
ffffffffc02080ba:	00007597          	auipc	a1,0x7
ffffffffc02080be:	b5e58593          	addi	a1,a1,-1186 # ffffffffc020ec18 <syscalls+0xa20>
ffffffffc02080c2:	e75ff0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc02080c6:	8522                	mv	a0,s0
ffffffffc02080c8:	9902                	jalr	s2
ffffffffc02080ca:	e901                	bnez	a0,ffffffffc02080da <inode_open_dec+0x46>
ffffffffc02080cc:	60e2                	ld	ra,24(sp)
ffffffffc02080ce:	6442                	ld	s0,16(sp)
ffffffffc02080d0:	6902                	ld	s2,0(sp)
ffffffffc02080d2:	8526                	mv	a0,s1
ffffffffc02080d4:	64a2                	ld	s1,8(sp)
ffffffffc02080d6:	6105                	addi	sp,sp,32
ffffffffc02080d8:	8082                	ret
ffffffffc02080da:	85aa                	mv	a1,a0
ffffffffc02080dc:	00007517          	auipc	a0,0x7
ffffffffc02080e0:	b4450513          	addi	a0,a0,-1212 # ffffffffc020ec20 <syscalls+0xa28>
ffffffffc02080e4:	8c2f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02080e8:	60e2                	ld	ra,24(sp)
ffffffffc02080ea:	6442                	ld	s0,16(sp)
ffffffffc02080ec:	6902                	ld	s2,0(sp)
ffffffffc02080ee:	8526                	mv	a0,s1
ffffffffc02080f0:	64a2                	ld	s1,8(sp)
ffffffffc02080f2:	6105                	addi	sp,sp,32
ffffffffc02080f4:	8082                	ret
ffffffffc02080f6:	00007697          	auipc	a3,0x7
ffffffffc02080fa:	ad268693          	addi	a3,a3,-1326 # ffffffffc020ebc8 <syscalls+0x9d0>
ffffffffc02080fe:	00004617          	auipc	a2,0x4
ffffffffc0208102:	f1260613          	addi	a2,a2,-238 # ffffffffc020c010 <commands+0x210>
ffffffffc0208106:	06100593          	li	a1,97
ffffffffc020810a:	00007517          	auipc	a0,0x7
ffffffffc020810e:	90e50513          	addi	a0,a0,-1778 # ffffffffc020ea18 <syscalls+0x820>
ffffffffc0208112:	b8cf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208116:	00007697          	auipc	a3,0x7
ffffffffc020811a:	a9268693          	addi	a3,a3,-1390 # ffffffffc020eba8 <syscalls+0x9b0>
ffffffffc020811e:	00004617          	auipc	a2,0x4
ffffffffc0208122:	ef260613          	addi	a2,a2,-270 # ffffffffc020c010 <commands+0x210>
ffffffffc0208126:	05c00593          	li	a1,92
ffffffffc020812a:	00007517          	auipc	a0,0x7
ffffffffc020812e:	8ee50513          	addi	a0,a0,-1810 # ffffffffc020ea18 <syscalls+0x820>
ffffffffc0208132:	b6cf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208136 <__alloc_fs>:
ffffffffc0208136:	1141                	addi	sp,sp,-16
ffffffffc0208138:	e022                	sd	s0,0(sp)
ffffffffc020813a:	842a                	mv	s0,a0
ffffffffc020813c:	0d800513          	li	a0,216
ffffffffc0208140:	e406                	sd	ra,8(sp)
ffffffffc0208142:	ed9f90ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0208146:	c119                	beqz	a0,ffffffffc020814c <__alloc_fs+0x16>
ffffffffc0208148:	0a852823          	sw	s0,176(a0)
ffffffffc020814c:	60a2                	ld	ra,8(sp)
ffffffffc020814e:	6402                	ld	s0,0(sp)
ffffffffc0208150:	0141                	addi	sp,sp,16
ffffffffc0208152:	8082                	ret

ffffffffc0208154 <vfs_init>:
ffffffffc0208154:	1141                	addi	sp,sp,-16
ffffffffc0208156:	4585                	li	a1,1
ffffffffc0208158:	0008d517          	auipc	a0,0x8d
ffffffffc020815c:	6d850513          	addi	a0,a0,1752 # ffffffffc0295830 <bootfs_sem>
ffffffffc0208160:	e406                	sd	ra,8(sp)
ffffffffc0208162:	c88fc0ef          	jal	ra,ffffffffc02045ea <sem_init>
ffffffffc0208166:	60a2                	ld	ra,8(sp)
ffffffffc0208168:	0141                	addi	sp,sp,16
ffffffffc020816a:	a40d                	j	ffffffffc020838c <vfs_devlist_init>

ffffffffc020816c <vfs_set_bootfs>:
ffffffffc020816c:	7179                	addi	sp,sp,-48
ffffffffc020816e:	f022                	sd	s0,32(sp)
ffffffffc0208170:	f406                	sd	ra,40(sp)
ffffffffc0208172:	ec26                	sd	s1,24(sp)
ffffffffc0208174:	e402                	sd	zero,8(sp)
ffffffffc0208176:	842a                	mv	s0,a0
ffffffffc0208178:	c915                	beqz	a0,ffffffffc02081ac <vfs_set_bootfs+0x40>
ffffffffc020817a:	03a00593          	li	a1,58
ffffffffc020817e:	197030ef          	jal	ra,ffffffffc020bb14 <strchr>
ffffffffc0208182:	c135                	beqz	a0,ffffffffc02081e6 <vfs_set_bootfs+0x7a>
ffffffffc0208184:	00154783          	lbu	a5,1(a0)
ffffffffc0208188:	efb9                	bnez	a5,ffffffffc02081e6 <vfs_set_bootfs+0x7a>
ffffffffc020818a:	8522                	mv	a0,s0
ffffffffc020818c:	11f000ef          	jal	ra,ffffffffc0208aaa <vfs_chdir>
ffffffffc0208190:	842a                	mv	s0,a0
ffffffffc0208192:	c519                	beqz	a0,ffffffffc02081a0 <vfs_set_bootfs+0x34>
ffffffffc0208194:	70a2                	ld	ra,40(sp)
ffffffffc0208196:	8522                	mv	a0,s0
ffffffffc0208198:	7402                	ld	s0,32(sp)
ffffffffc020819a:	64e2                	ld	s1,24(sp)
ffffffffc020819c:	6145                	addi	sp,sp,48
ffffffffc020819e:	8082                	ret
ffffffffc02081a0:	0028                	addi	a0,sp,8
ffffffffc02081a2:	013000ef          	jal	ra,ffffffffc02089b4 <vfs_get_curdir>
ffffffffc02081a6:	842a                	mv	s0,a0
ffffffffc02081a8:	f575                	bnez	a0,ffffffffc0208194 <vfs_set_bootfs+0x28>
ffffffffc02081aa:	6422                	ld	s0,8(sp)
ffffffffc02081ac:	0008d517          	auipc	a0,0x8d
ffffffffc02081b0:	68450513          	addi	a0,a0,1668 # ffffffffc0295830 <bootfs_sem>
ffffffffc02081b4:	c40fc0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc02081b8:	0008e797          	auipc	a5,0x8e
ffffffffc02081bc:	76878793          	addi	a5,a5,1896 # ffffffffc0296920 <bootfs_node>
ffffffffc02081c0:	6384                	ld	s1,0(a5)
ffffffffc02081c2:	0008d517          	auipc	a0,0x8d
ffffffffc02081c6:	66e50513          	addi	a0,a0,1646 # ffffffffc0295830 <bootfs_sem>
ffffffffc02081ca:	e380                	sd	s0,0(a5)
ffffffffc02081cc:	4401                	li	s0,0
ffffffffc02081ce:	c22fc0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc02081d2:	d0e9                	beqz	s1,ffffffffc0208194 <vfs_set_bootfs+0x28>
ffffffffc02081d4:	8526                	mv	a0,s1
ffffffffc02081d6:	e17ff0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc02081da:	70a2                	ld	ra,40(sp)
ffffffffc02081dc:	8522                	mv	a0,s0
ffffffffc02081de:	7402                	ld	s0,32(sp)
ffffffffc02081e0:	64e2                	ld	s1,24(sp)
ffffffffc02081e2:	6145                	addi	sp,sp,48
ffffffffc02081e4:	8082                	ret
ffffffffc02081e6:	5475                	li	s0,-3
ffffffffc02081e8:	b775                	j	ffffffffc0208194 <vfs_set_bootfs+0x28>

ffffffffc02081ea <vfs_get_bootfs>:
ffffffffc02081ea:	1101                	addi	sp,sp,-32
ffffffffc02081ec:	e426                	sd	s1,8(sp)
ffffffffc02081ee:	0008e497          	auipc	s1,0x8e
ffffffffc02081f2:	73248493          	addi	s1,s1,1842 # ffffffffc0296920 <bootfs_node>
ffffffffc02081f6:	609c                	ld	a5,0(s1)
ffffffffc02081f8:	ec06                	sd	ra,24(sp)
ffffffffc02081fa:	e822                	sd	s0,16(sp)
ffffffffc02081fc:	c3a1                	beqz	a5,ffffffffc020823c <vfs_get_bootfs+0x52>
ffffffffc02081fe:	842a                	mv	s0,a0
ffffffffc0208200:	0008d517          	auipc	a0,0x8d
ffffffffc0208204:	63050513          	addi	a0,a0,1584 # ffffffffc0295830 <bootfs_sem>
ffffffffc0208208:	becfc0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc020820c:	6084                	ld	s1,0(s1)
ffffffffc020820e:	c08d                	beqz	s1,ffffffffc0208230 <vfs_get_bootfs+0x46>
ffffffffc0208210:	8526                	mv	a0,s1
ffffffffc0208212:	d0dff0ef          	jal	ra,ffffffffc0207f1e <inode_ref_inc>
ffffffffc0208216:	0008d517          	auipc	a0,0x8d
ffffffffc020821a:	61a50513          	addi	a0,a0,1562 # ffffffffc0295830 <bootfs_sem>
ffffffffc020821e:	bd2fc0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0208222:	4501                	li	a0,0
ffffffffc0208224:	e004                	sd	s1,0(s0)
ffffffffc0208226:	60e2                	ld	ra,24(sp)
ffffffffc0208228:	6442                	ld	s0,16(sp)
ffffffffc020822a:	64a2                	ld	s1,8(sp)
ffffffffc020822c:	6105                	addi	sp,sp,32
ffffffffc020822e:	8082                	ret
ffffffffc0208230:	0008d517          	auipc	a0,0x8d
ffffffffc0208234:	60050513          	addi	a0,a0,1536 # ffffffffc0295830 <bootfs_sem>
ffffffffc0208238:	bb8fc0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020823c:	5541                	li	a0,-16
ffffffffc020823e:	b7e5                	j	ffffffffc0208226 <vfs_get_bootfs+0x3c>

ffffffffc0208240 <vfs_do_add>:
ffffffffc0208240:	7139                	addi	sp,sp,-64
ffffffffc0208242:	fc06                	sd	ra,56(sp)
ffffffffc0208244:	f822                	sd	s0,48(sp)
ffffffffc0208246:	f426                	sd	s1,40(sp)
ffffffffc0208248:	f04a                	sd	s2,32(sp)
ffffffffc020824a:	ec4e                	sd	s3,24(sp)
ffffffffc020824c:	e852                	sd	s4,16(sp)
ffffffffc020824e:	e456                	sd	s5,8(sp)
ffffffffc0208250:	e05a                	sd	s6,0(sp)
ffffffffc0208252:	0e050b63          	beqz	a0,ffffffffc0208348 <vfs_do_add+0x108>
ffffffffc0208256:	842a                	mv	s0,a0
ffffffffc0208258:	8a2e                	mv	s4,a1
ffffffffc020825a:	8b32                	mv	s6,a2
ffffffffc020825c:	8ab6                	mv	s5,a3
ffffffffc020825e:	c5cd                	beqz	a1,ffffffffc0208308 <vfs_do_add+0xc8>
ffffffffc0208260:	4db8                	lw	a4,88(a1)
ffffffffc0208262:	6785                	lui	a5,0x1
ffffffffc0208264:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208268:	0af71163          	bne	a4,a5,ffffffffc020830a <vfs_do_add+0xca>
ffffffffc020826c:	8522                	mv	a0,s0
ffffffffc020826e:	01b030ef          	jal	ra,ffffffffc020ba88 <strlen>
ffffffffc0208272:	47fd                	li	a5,31
ffffffffc0208274:	0ca7e663          	bltu	a5,a0,ffffffffc0208340 <vfs_do_add+0x100>
ffffffffc0208278:	8522                	mv	a0,s0
ffffffffc020827a:	f7bf70ef          	jal	ra,ffffffffc02001f4 <strdup>
ffffffffc020827e:	84aa                	mv	s1,a0
ffffffffc0208280:	c171                	beqz	a0,ffffffffc0208344 <vfs_do_add+0x104>
ffffffffc0208282:	03000513          	li	a0,48
ffffffffc0208286:	d95f90ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc020828a:	89aa                	mv	s3,a0
ffffffffc020828c:	c92d                	beqz	a0,ffffffffc02082fe <vfs_do_add+0xbe>
ffffffffc020828e:	0008d517          	auipc	a0,0x8d
ffffffffc0208292:	5ca50513          	addi	a0,a0,1482 # ffffffffc0295858 <vdev_list_sem>
ffffffffc0208296:	0008d917          	auipc	s2,0x8d
ffffffffc020829a:	5b290913          	addi	s2,s2,1458 # ffffffffc0295848 <vdev_list>
ffffffffc020829e:	b56fc0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc02082a2:	844a                	mv	s0,s2
ffffffffc02082a4:	a039                	j	ffffffffc02082b2 <vfs_do_add+0x72>
ffffffffc02082a6:	fe043503          	ld	a0,-32(s0)
ffffffffc02082aa:	85a6                	mv	a1,s1
ffffffffc02082ac:	025030ef          	jal	ra,ffffffffc020bad0 <strcmp>
ffffffffc02082b0:	cd2d                	beqz	a0,ffffffffc020832a <vfs_do_add+0xea>
ffffffffc02082b2:	6400                	ld	s0,8(s0)
ffffffffc02082b4:	ff2419e3          	bne	s0,s2,ffffffffc02082a6 <vfs_do_add+0x66>
ffffffffc02082b8:	6418                	ld	a4,8(s0)
ffffffffc02082ba:	02098793          	addi	a5,s3,32
ffffffffc02082be:	0099b023          	sd	s1,0(s3)
ffffffffc02082c2:	0149b423          	sd	s4,8(s3)
ffffffffc02082c6:	0159bc23          	sd	s5,24(s3)
ffffffffc02082ca:	0169b823          	sd	s6,16(s3)
ffffffffc02082ce:	e31c                	sd	a5,0(a4)
ffffffffc02082d0:	0289b023          	sd	s0,32(s3)
ffffffffc02082d4:	02e9b423          	sd	a4,40(s3)
ffffffffc02082d8:	0008d517          	auipc	a0,0x8d
ffffffffc02082dc:	58050513          	addi	a0,a0,1408 # ffffffffc0295858 <vdev_list_sem>
ffffffffc02082e0:	e41c                	sd	a5,8(s0)
ffffffffc02082e2:	4401                	li	s0,0
ffffffffc02082e4:	b0cfc0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc02082e8:	70e2                	ld	ra,56(sp)
ffffffffc02082ea:	8522                	mv	a0,s0
ffffffffc02082ec:	7442                	ld	s0,48(sp)
ffffffffc02082ee:	74a2                	ld	s1,40(sp)
ffffffffc02082f0:	7902                	ld	s2,32(sp)
ffffffffc02082f2:	69e2                	ld	s3,24(sp)
ffffffffc02082f4:	6a42                	ld	s4,16(sp)
ffffffffc02082f6:	6aa2                	ld	s5,8(sp)
ffffffffc02082f8:	6b02                	ld	s6,0(sp)
ffffffffc02082fa:	6121                	addi	sp,sp,64
ffffffffc02082fc:	8082                	ret
ffffffffc02082fe:	5471                	li	s0,-4
ffffffffc0208300:	8526                	mv	a0,s1
ffffffffc0208302:	dc9f90ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc0208306:	b7cd                	j	ffffffffc02082e8 <vfs_do_add+0xa8>
ffffffffc0208308:	d2b5                	beqz	a3,ffffffffc020826c <vfs_do_add+0x2c>
ffffffffc020830a:	00007697          	auipc	a3,0x7
ffffffffc020830e:	95e68693          	addi	a3,a3,-1698 # ffffffffc020ec68 <syscalls+0xa70>
ffffffffc0208312:	00004617          	auipc	a2,0x4
ffffffffc0208316:	cfe60613          	addi	a2,a2,-770 # ffffffffc020c010 <commands+0x210>
ffffffffc020831a:	08f00593          	li	a1,143
ffffffffc020831e:	00007517          	auipc	a0,0x7
ffffffffc0208322:	93250513          	addi	a0,a0,-1742 # ffffffffc020ec50 <syscalls+0xa58>
ffffffffc0208326:	978f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020832a:	0008d517          	auipc	a0,0x8d
ffffffffc020832e:	52e50513          	addi	a0,a0,1326 # ffffffffc0295858 <vdev_list_sem>
ffffffffc0208332:	abefc0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0208336:	854e                	mv	a0,s3
ffffffffc0208338:	d93f90ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020833c:	5425                	li	s0,-23
ffffffffc020833e:	b7c9                	j	ffffffffc0208300 <vfs_do_add+0xc0>
ffffffffc0208340:	5451                	li	s0,-12
ffffffffc0208342:	b75d                	j	ffffffffc02082e8 <vfs_do_add+0xa8>
ffffffffc0208344:	5471                	li	s0,-4
ffffffffc0208346:	b74d                	j	ffffffffc02082e8 <vfs_do_add+0xa8>
ffffffffc0208348:	00007697          	auipc	a3,0x7
ffffffffc020834c:	8f868693          	addi	a3,a3,-1800 # ffffffffc020ec40 <syscalls+0xa48>
ffffffffc0208350:	00004617          	auipc	a2,0x4
ffffffffc0208354:	cc060613          	addi	a2,a2,-832 # ffffffffc020c010 <commands+0x210>
ffffffffc0208358:	08e00593          	li	a1,142
ffffffffc020835c:	00007517          	auipc	a0,0x7
ffffffffc0208360:	8f450513          	addi	a0,a0,-1804 # ffffffffc020ec50 <syscalls+0xa58>
ffffffffc0208364:	93af80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208368 <find_mount.part.0>:
ffffffffc0208368:	1141                	addi	sp,sp,-16
ffffffffc020836a:	00007697          	auipc	a3,0x7
ffffffffc020836e:	8d668693          	addi	a3,a3,-1834 # ffffffffc020ec40 <syscalls+0xa48>
ffffffffc0208372:	00004617          	auipc	a2,0x4
ffffffffc0208376:	c9e60613          	addi	a2,a2,-866 # ffffffffc020c010 <commands+0x210>
ffffffffc020837a:	0cd00593          	li	a1,205
ffffffffc020837e:	00007517          	auipc	a0,0x7
ffffffffc0208382:	8d250513          	addi	a0,a0,-1838 # ffffffffc020ec50 <syscalls+0xa58>
ffffffffc0208386:	e406                	sd	ra,8(sp)
ffffffffc0208388:	916f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020838c <vfs_devlist_init>:
ffffffffc020838c:	0008d797          	auipc	a5,0x8d
ffffffffc0208390:	4bc78793          	addi	a5,a5,1212 # ffffffffc0295848 <vdev_list>
ffffffffc0208394:	4585                	li	a1,1
ffffffffc0208396:	0008d517          	auipc	a0,0x8d
ffffffffc020839a:	4c250513          	addi	a0,a0,1218 # ffffffffc0295858 <vdev_list_sem>
ffffffffc020839e:	e79c                	sd	a5,8(a5)
ffffffffc02083a0:	e39c                	sd	a5,0(a5)
ffffffffc02083a2:	a48fc06f          	j	ffffffffc02045ea <sem_init>

ffffffffc02083a6 <vfs_cleanup>:
ffffffffc02083a6:	1101                	addi	sp,sp,-32
ffffffffc02083a8:	e426                	sd	s1,8(sp)
ffffffffc02083aa:	0008d497          	auipc	s1,0x8d
ffffffffc02083ae:	49e48493          	addi	s1,s1,1182 # ffffffffc0295848 <vdev_list>
ffffffffc02083b2:	649c                	ld	a5,8(s1)
ffffffffc02083b4:	ec06                	sd	ra,24(sp)
ffffffffc02083b6:	e822                	sd	s0,16(sp)
ffffffffc02083b8:	02978e63          	beq	a5,s1,ffffffffc02083f4 <vfs_cleanup+0x4e>
ffffffffc02083bc:	0008d517          	auipc	a0,0x8d
ffffffffc02083c0:	49c50513          	addi	a0,a0,1180 # ffffffffc0295858 <vdev_list_sem>
ffffffffc02083c4:	a30fc0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc02083c8:	6480                	ld	s0,8(s1)
ffffffffc02083ca:	00940b63          	beq	s0,s1,ffffffffc02083e0 <vfs_cleanup+0x3a>
ffffffffc02083ce:	ff043783          	ld	a5,-16(s0)
ffffffffc02083d2:	853e                	mv	a0,a5
ffffffffc02083d4:	c399                	beqz	a5,ffffffffc02083da <vfs_cleanup+0x34>
ffffffffc02083d6:	6bfc                	ld	a5,208(a5)
ffffffffc02083d8:	9782                	jalr	a5
ffffffffc02083da:	6400                	ld	s0,8(s0)
ffffffffc02083dc:	fe9419e3          	bne	s0,s1,ffffffffc02083ce <vfs_cleanup+0x28>
ffffffffc02083e0:	6442                	ld	s0,16(sp)
ffffffffc02083e2:	60e2                	ld	ra,24(sp)
ffffffffc02083e4:	64a2                	ld	s1,8(sp)
ffffffffc02083e6:	0008d517          	auipc	a0,0x8d
ffffffffc02083ea:	47250513          	addi	a0,a0,1138 # ffffffffc0295858 <vdev_list_sem>
ffffffffc02083ee:	6105                	addi	sp,sp,32
ffffffffc02083f0:	a00fc06f          	j	ffffffffc02045f0 <up>
ffffffffc02083f4:	60e2                	ld	ra,24(sp)
ffffffffc02083f6:	6442                	ld	s0,16(sp)
ffffffffc02083f8:	64a2                	ld	s1,8(sp)
ffffffffc02083fa:	6105                	addi	sp,sp,32
ffffffffc02083fc:	8082                	ret

ffffffffc02083fe <vfs_get_root>:
ffffffffc02083fe:	7179                	addi	sp,sp,-48
ffffffffc0208400:	f406                	sd	ra,40(sp)
ffffffffc0208402:	f022                	sd	s0,32(sp)
ffffffffc0208404:	ec26                	sd	s1,24(sp)
ffffffffc0208406:	e84a                	sd	s2,16(sp)
ffffffffc0208408:	e44e                	sd	s3,8(sp)
ffffffffc020840a:	e052                	sd	s4,0(sp)
ffffffffc020840c:	c541                	beqz	a0,ffffffffc0208494 <vfs_get_root+0x96>
ffffffffc020840e:	0008d917          	auipc	s2,0x8d
ffffffffc0208412:	43a90913          	addi	s2,s2,1082 # ffffffffc0295848 <vdev_list>
ffffffffc0208416:	00893783          	ld	a5,8(s2)
ffffffffc020841a:	07278b63          	beq	a5,s2,ffffffffc0208490 <vfs_get_root+0x92>
ffffffffc020841e:	89aa                	mv	s3,a0
ffffffffc0208420:	0008d517          	auipc	a0,0x8d
ffffffffc0208424:	43850513          	addi	a0,a0,1080 # ffffffffc0295858 <vdev_list_sem>
ffffffffc0208428:	8a2e                	mv	s4,a1
ffffffffc020842a:	844a                	mv	s0,s2
ffffffffc020842c:	9c8fc0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc0208430:	a801                	j	ffffffffc0208440 <vfs_get_root+0x42>
ffffffffc0208432:	fe043583          	ld	a1,-32(s0)
ffffffffc0208436:	854e                	mv	a0,s3
ffffffffc0208438:	698030ef          	jal	ra,ffffffffc020bad0 <strcmp>
ffffffffc020843c:	84aa                	mv	s1,a0
ffffffffc020843e:	c505                	beqz	a0,ffffffffc0208466 <vfs_get_root+0x68>
ffffffffc0208440:	6400                	ld	s0,8(s0)
ffffffffc0208442:	ff2418e3          	bne	s0,s2,ffffffffc0208432 <vfs_get_root+0x34>
ffffffffc0208446:	54cd                	li	s1,-13
ffffffffc0208448:	0008d517          	auipc	a0,0x8d
ffffffffc020844c:	41050513          	addi	a0,a0,1040 # ffffffffc0295858 <vdev_list_sem>
ffffffffc0208450:	9a0fc0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0208454:	70a2                	ld	ra,40(sp)
ffffffffc0208456:	7402                	ld	s0,32(sp)
ffffffffc0208458:	6942                	ld	s2,16(sp)
ffffffffc020845a:	69a2                	ld	s3,8(sp)
ffffffffc020845c:	6a02                	ld	s4,0(sp)
ffffffffc020845e:	8526                	mv	a0,s1
ffffffffc0208460:	64e2                	ld	s1,24(sp)
ffffffffc0208462:	6145                	addi	sp,sp,48
ffffffffc0208464:	8082                	ret
ffffffffc0208466:	ff043503          	ld	a0,-16(s0)
ffffffffc020846a:	c519                	beqz	a0,ffffffffc0208478 <vfs_get_root+0x7a>
ffffffffc020846c:	617c                	ld	a5,192(a0)
ffffffffc020846e:	9782                	jalr	a5
ffffffffc0208470:	c519                	beqz	a0,ffffffffc020847e <vfs_get_root+0x80>
ffffffffc0208472:	00aa3023          	sd	a0,0(s4)
ffffffffc0208476:	bfc9                	j	ffffffffc0208448 <vfs_get_root+0x4a>
ffffffffc0208478:	ff843783          	ld	a5,-8(s0)
ffffffffc020847c:	c399                	beqz	a5,ffffffffc0208482 <vfs_get_root+0x84>
ffffffffc020847e:	54c9                	li	s1,-14
ffffffffc0208480:	b7e1                	j	ffffffffc0208448 <vfs_get_root+0x4a>
ffffffffc0208482:	fe843503          	ld	a0,-24(s0)
ffffffffc0208486:	a99ff0ef          	jal	ra,ffffffffc0207f1e <inode_ref_inc>
ffffffffc020848a:	fe843503          	ld	a0,-24(s0)
ffffffffc020848e:	b7cd                	j	ffffffffc0208470 <vfs_get_root+0x72>
ffffffffc0208490:	54cd                	li	s1,-13
ffffffffc0208492:	b7c9                	j	ffffffffc0208454 <vfs_get_root+0x56>
ffffffffc0208494:	00006697          	auipc	a3,0x6
ffffffffc0208498:	7ac68693          	addi	a3,a3,1964 # ffffffffc020ec40 <syscalls+0xa48>
ffffffffc020849c:	00004617          	auipc	a2,0x4
ffffffffc02084a0:	b7460613          	addi	a2,a2,-1164 # ffffffffc020c010 <commands+0x210>
ffffffffc02084a4:	04500593          	li	a1,69
ffffffffc02084a8:	00006517          	auipc	a0,0x6
ffffffffc02084ac:	7a850513          	addi	a0,a0,1960 # ffffffffc020ec50 <syscalls+0xa58>
ffffffffc02084b0:	feff70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02084b4 <vfs_get_devname>:
ffffffffc02084b4:	0008d697          	auipc	a3,0x8d
ffffffffc02084b8:	39468693          	addi	a3,a3,916 # ffffffffc0295848 <vdev_list>
ffffffffc02084bc:	87b6                	mv	a5,a3
ffffffffc02084be:	e511                	bnez	a0,ffffffffc02084ca <vfs_get_devname+0x16>
ffffffffc02084c0:	a829                	j	ffffffffc02084da <vfs_get_devname+0x26>
ffffffffc02084c2:	ff07b703          	ld	a4,-16(a5)
ffffffffc02084c6:	00a70763          	beq	a4,a0,ffffffffc02084d4 <vfs_get_devname+0x20>
ffffffffc02084ca:	679c                	ld	a5,8(a5)
ffffffffc02084cc:	fed79be3          	bne	a5,a3,ffffffffc02084c2 <vfs_get_devname+0xe>
ffffffffc02084d0:	4501                	li	a0,0
ffffffffc02084d2:	8082                	ret
ffffffffc02084d4:	fe07b503          	ld	a0,-32(a5)
ffffffffc02084d8:	8082                	ret
ffffffffc02084da:	1141                	addi	sp,sp,-16
ffffffffc02084dc:	00006697          	auipc	a3,0x6
ffffffffc02084e0:	7ec68693          	addi	a3,a3,2028 # ffffffffc020ecc8 <syscalls+0xad0>
ffffffffc02084e4:	00004617          	auipc	a2,0x4
ffffffffc02084e8:	b2c60613          	addi	a2,a2,-1236 # ffffffffc020c010 <commands+0x210>
ffffffffc02084ec:	06a00593          	li	a1,106
ffffffffc02084f0:	00006517          	auipc	a0,0x6
ffffffffc02084f4:	76050513          	addi	a0,a0,1888 # ffffffffc020ec50 <syscalls+0xa58>
ffffffffc02084f8:	e406                	sd	ra,8(sp)
ffffffffc02084fa:	fa5f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02084fe <vfs_add_dev>:
ffffffffc02084fe:	86b2                	mv	a3,a2
ffffffffc0208500:	4601                	li	a2,0
ffffffffc0208502:	d3fff06f          	j	ffffffffc0208240 <vfs_do_add>

ffffffffc0208506 <vfs_mount>:
ffffffffc0208506:	7179                	addi	sp,sp,-48
ffffffffc0208508:	e84a                	sd	s2,16(sp)
ffffffffc020850a:	892a                	mv	s2,a0
ffffffffc020850c:	0008d517          	auipc	a0,0x8d
ffffffffc0208510:	34c50513          	addi	a0,a0,844 # ffffffffc0295858 <vdev_list_sem>
ffffffffc0208514:	e44e                	sd	s3,8(sp)
ffffffffc0208516:	f406                	sd	ra,40(sp)
ffffffffc0208518:	f022                	sd	s0,32(sp)
ffffffffc020851a:	ec26                	sd	s1,24(sp)
ffffffffc020851c:	89ae                	mv	s3,a1
ffffffffc020851e:	8d6fc0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc0208522:	08090a63          	beqz	s2,ffffffffc02085b6 <vfs_mount+0xb0>
ffffffffc0208526:	0008d497          	auipc	s1,0x8d
ffffffffc020852a:	32248493          	addi	s1,s1,802 # ffffffffc0295848 <vdev_list>
ffffffffc020852e:	6480                	ld	s0,8(s1)
ffffffffc0208530:	00941663          	bne	s0,s1,ffffffffc020853c <vfs_mount+0x36>
ffffffffc0208534:	a8ad                	j	ffffffffc02085ae <vfs_mount+0xa8>
ffffffffc0208536:	6400                	ld	s0,8(s0)
ffffffffc0208538:	06940b63          	beq	s0,s1,ffffffffc02085ae <vfs_mount+0xa8>
ffffffffc020853c:	ff843783          	ld	a5,-8(s0)
ffffffffc0208540:	dbfd                	beqz	a5,ffffffffc0208536 <vfs_mount+0x30>
ffffffffc0208542:	fe043503          	ld	a0,-32(s0)
ffffffffc0208546:	85ca                	mv	a1,s2
ffffffffc0208548:	588030ef          	jal	ra,ffffffffc020bad0 <strcmp>
ffffffffc020854c:	f56d                	bnez	a0,ffffffffc0208536 <vfs_mount+0x30>
ffffffffc020854e:	ff043783          	ld	a5,-16(s0)
ffffffffc0208552:	e3a5                	bnez	a5,ffffffffc02085b2 <vfs_mount+0xac>
ffffffffc0208554:	fe043783          	ld	a5,-32(s0)
ffffffffc0208558:	c3c9                	beqz	a5,ffffffffc02085da <vfs_mount+0xd4>
ffffffffc020855a:	ff843783          	ld	a5,-8(s0)
ffffffffc020855e:	cfb5                	beqz	a5,ffffffffc02085da <vfs_mount+0xd4>
ffffffffc0208560:	fe843503          	ld	a0,-24(s0)
ffffffffc0208564:	c939                	beqz	a0,ffffffffc02085ba <vfs_mount+0xb4>
ffffffffc0208566:	4d38                	lw	a4,88(a0)
ffffffffc0208568:	6785                	lui	a5,0x1
ffffffffc020856a:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020856e:	04f71663          	bne	a4,a5,ffffffffc02085ba <vfs_mount+0xb4>
ffffffffc0208572:	ff040593          	addi	a1,s0,-16
ffffffffc0208576:	9982                	jalr	s3
ffffffffc0208578:	84aa                	mv	s1,a0
ffffffffc020857a:	ed01                	bnez	a0,ffffffffc0208592 <vfs_mount+0x8c>
ffffffffc020857c:	ff043783          	ld	a5,-16(s0)
ffffffffc0208580:	cfad                	beqz	a5,ffffffffc02085fa <vfs_mount+0xf4>
ffffffffc0208582:	fe043583          	ld	a1,-32(s0)
ffffffffc0208586:	00006517          	auipc	a0,0x6
ffffffffc020858a:	7d250513          	addi	a0,a0,2002 # ffffffffc020ed58 <syscalls+0xb60>
ffffffffc020858e:	c19f70ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0208592:	0008d517          	auipc	a0,0x8d
ffffffffc0208596:	2c650513          	addi	a0,a0,710 # ffffffffc0295858 <vdev_list_sem>
ffffffffc020859a:	856fc0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020859e:	70a2                	ld	ra,40(sp)
ffffffffc02085a0:	7402                	ld	s0,32(sp)
ffffffffc02085a2:	6942                	ld	s2,16(sp)
ffffffffc02085a4:	69a2                	ld	s3,8(sp)
ffffffffc02085a6:	8526                	mv	a0,s1
ffffffffc02085a8:	64e2                	ld	s1,24(sp)
ffffffffc02085aa:	6145                	addi	sp,sp,48
ffffffffc02085ac:	8082                	ret
ffffffffc02085ae:	54cd                	li	s1,-13
ffffffffc02085b0:	b7cd                	j	ffffffffc0208592 <vfs_mount+0x8c>
ffffffffc02085b2:	54c5                	li	s1,-15
ffffffffc02085b4:	bff9                	j	ffffffffc0208592 <vfs_mount+0x8c>
ffffffffc02085b6:	db3ff0ef          	jal	ra,ffffffffc0208368 <find_mount.part.0>
ffffffffc02085ba:	00006697          	auipc	a3,0x6
ffffffffc02085be:	74e68693          	addi	a3,a3,1870 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc02085c2:	00004617          	auipc	a2,0x4
ffffffffc02085c6:	a4e60613          	addi	a2,a2,-1458 # ffffffffc020c010 <commands+0x210>
ffffffffc02085ca:	0ed00593          	li	a1,237
ffffffffc02085ce:	00006517          	auipc	a0,0x6
ffffffffc02085d2:	68250513          	addi	a0,a0,1666 # ffffffffc020ec50 <syscalls+0xa58>
ffffffffc02085d6:	ec9f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02085da:	00006697          	auipc	a3,0x6
ffffffffc02085de:	6fe68693          	addi	a3,a3,1790 # ffffffffc020ecd8 <syscalls+0xae0>
ffffffffc02085e2:	00004617          	auipc	a2,0x4
ffffffffc02085e6:	a2e60613          	addi	a2,a2,-1490 # ffffffffc020c010 <commands+0x210>
ffffffffc02085ea:	0eb00593          	li	a1,235
ffffffffc02085ee:	00006517          	auipc	a0,0x6
ffffffffc02085f2:	66250513          	addi	a0,a0,1634 # ffffffffc020ec50 <syscalls+0xa58>
ffffffffc02085f6:	ea9f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02085fa:	00006697          	auipc	a3,0x6
ffffffffc02085fe:	74668693          	addi	a3,a3,1862 # ffffffffc020ed40 <syscalls+0xb48>
ffffffffc0208602:	00004617          	auipc	a2,0x4
ffffffffc0208606:	a0e60613          	addi	a2,a2,-1522 # ffffffffc020c010 <commands+0x210>
ffffffffc020860a:	0ef00593          	li	a1,239
ffffffffc020860e:	00006517          	auipc	a0,0x6
ffffffffc0208612:	64250513          	addi	a0,a0,1602 # ffffffffc020ec50 <syscalls+0xa58>
ffffffffc0208616:	e89f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020861a <vfs_open>:
ffffffffc020861a:	711d                	addi	sp,sp,-96
ffffffffc020861c:	e4a6                	sd	s1,72(sp)
ffffffffc020861e:	e0ca                	sd	s2,64(sp)
ffffffffc0208620:	fc4e                	sd	s3,56(sp)
ffffffffc0208622:	ec86                	sd	ra,88(sp)
ffffffffc0208624:	e8a2                	sd	s0,80(sp)
ffffffffc0208626:	f852                	sd	s4,48(sp)
ffffffffc0208628:	f456                	sd	s5,40(sp)
ffffffffc020862a:	0035f793          	andi	a5,a1,3
ffffffffc020862e:	84ae                	mv	s1,a1
ffffffffc0208630:	892a                	mv	s2,a0
ffffffffc0208632:	89b2                	mv	s3,a2
ffffffffc0208634:	0e078663          	beqz	a5,ffffffffc0208720 <vfs_open+0x106>
ffffffffc0208638:	470d                	li	a4,3
ffffffffc020863a:	0105fa93          	andi	s5,a1,16
ffffffffc020863e:	0ce78f63          	beq	a5,a4,ffffffffc020871c <vfs_open+0x102>
ffffffffc0208642:	002c                	addi	a1,sp,8
ffffffffc0208644:	854a                	mv	a0,s2
ffffffffc0208646:	2ae000ef          	jal	ra,ffffffffc02088f4 <vfs_lookup>
ffffffffc020864a:	842a                	mv	s0,a0
ffffffffc020864c:	0044fa13          	andi	s4,s1,4
ffffffffc0208650:	e159                	bnez	a0,ffffffffc02086d6 <vfs_open+0xbc>
ffffffffc0208652:	00c4f793          	andi	a5,s1,12
ffffffffc0208656:	4731                	li	a4,12
ffffffffc0208658:	0ee78263          	beq	a5,a4,ffffffffc020873c <vfs_open+0x122>
ffffffffc020865c:	6422                	ld	s0,8(sp)
ffffffffc020865e:	12040163          	beqz	s0,ffffffffc0208780 <vfs_open+0x166>
ffffffffc0208662:	783c                	ld	a5,112(s0)
ffffffffc0208664:	cff1                	beqz	a5,ffffffffc0208740 <vfs_open+0x126>
ffffffffc0208666:	679c                	ld	a5,8(a5)
ffffffffc0208668:	cfe1                	beqz	a5,ffffffffc0208740 <vfs_open+0x126>
ffffffffc020866a:	8522                	mv	a0,s0
ffffffffc020866c:	00006597          	auipc	a1,0x6
ffffffffc0208670:	7cc58593          	addi	a1,a1,1996 # ffffffffc020ee38 <syscalls+0xc40>
ffffffffc0208674:	8c3ff0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0208678:	783c                	ld	a5,112(s0)
ffffffffc020867a:	6522                	ld	a0,8(sp)
ffffffffc020867c:	85a6                	mv	a1,s1
ffffffffc020867e:	679c                	ld	a5,8(a5)
ffffffffc0208680:	9782                	jalr	a5
ffffffffc0208682:	842a                	mv	s0,a0
ffffffffc0208684:	6522                	ld	a0,8(sp)
ffffffffc0208686:	e845                	bnez	s0,ffffffffc0208736 <vfs_open+0x11c>
ffffffffc0208688:	015a6a33          	or	s4,s4,s5
ffffffffc020868c:	89fff0ef          	jal	ra,ffffffffc0207f2a <inode_open_inc>
ffffffffc0208690:	020a0663          	beqz	s4,ffffffffc02086bc <vfs_open+0xa2>
ffffffffc0208694:	64a2                	ld	s1,8(sp)
ffffffffc0208696:	c4e9                	beqz	s1,ffffffffc0208760 <vfs_open+0x146>
ffffffffc0208698:	78bc                	ld	a5,112(s1)
ffffffffc020869a:	c3f9                	beqz	a5,ffffffffc0208760 <vfs_open+0x146>
ffffffffc020869c:	73bc                	ld	a5,96(a5)
ffffffffc020869e:	c3e9                	beqz	a5,ffffffffc0208760 <vfs_open+0x146>
ffffffffc02086a0:	00006597          	auipc	a1,0x6
ffffffffc02086a4:	7f858593          	addi	a1,a1,2040 # ffffffffc020ee98 <syscalls+0xca0>
ffffffffc02086a8:	8526                	mv	a0,s1
ffffffffc02086aa:	88dff0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc02086ae:	78bc                	ld	a5,112(s1)
ffffffffc02086b0:	6522                	ld	a0,8(sp)
ffffffffc02086b2:	4581                	li	a1,0
ffffffffc02086b4:	73bc                	ld	a5,96(a5)
ffffffffc02086b6:	9782                	jalr	a5
ffffffffc02086b8:	87aa                	mv	a5,a0
ffffffffc02086ba:	e92d                	bnez	a0,ffffffffc020872c <vfs_open+0x112>
ffffffffc02086bc:	67a2                	ld	a5,8(sp)
ffffffffc02086be:	00f9b023          	sd	a5,0(s3)
ffffffffc02086c2:	60e6                	ld	ra,88(sp)
ffffffffc02086c4:	8522                	mv	a0,s0
ffffffffc02086c6:	6446                	ld	s0,80(sp)
ffffffffc02086c8:	64a6                	ld	s1,72(sp)
ffffffffc02086ca:	6906                	ld	s2,64(sp)
ffffffffc02086cc:	79e2                	ld	s3,56(sp)
ffffffffc02086ce:	7a42                	ld	s4,48(sp)
ffffffffc02086d0:	7aa2                	ld	s5,40(sp)
ffffffffc02086d2:	6125                	addi	sp,sp,96
ffffffffc02086d4:	8082                	ret
ffffffffc02086d6:	57c1                	li	a5,-16
ffffffffc02086d8:	fef515e3          	bne	a0,a5,ffffffffc02086c2 <vfs_open+0xa8>
ffffffffc02086dc:	fe0a03e3          	beqz	s4,ffffffffc02086c2 <vfs_open+0xa8>
ffffffffc02086e0:	0810                	addi	a2,sp,16
ffffffffc02086e2:	082c                	addi	a1,sp,24
ffffffffc02086e4:	854a                	mv	a0,s2
ffffffffc02086e6:	2a4000ef          	jal	ra,ffffffffc020898a <vfs_lookup_parent>
ffffffffc02086ea:	842a                	mv	s0,a0
ffffffffc02086ec:	f979                	bnez	a0,ffffffffc02086c2 <vfs_open+0xa8>
ffffffffc02086ee:	6462                	ld	s0,24(sp)
ffffffffc02086f0:	c845                	beqz	s0,ffffffffc02087a0 <vfs_open+0x186>
ffffffffc02086f2:	783c                	ld	a5,112(s0)
ffffffffc02086f4:	c7d5                	beqz	a5,ffffffffc02087a0 <vfs_open+0x186>
ffffffffc02086f6:	77bc                	ld	a5,104(a5)
ffffffffc02086f8:	c7c5                	beqz	a5,ffffffffc02087a0 <vfs_open+0x186>
ffffffffc02086fa:	8522                	mv	a0,s0
ffffffffc02086fc:	00006597          	auipc	a1,0x6
ffffffffc0208700:	6d458593          	addi	a1,a1,1748 # ffffffffc020edd0 <syscalls+0xbd8>
ffffffffc0208704:	833ff0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0208708:	783c                	ld	a5,112(s0)
ffffffffc020870a:	65c2                	ld	a1,16(sp)
ffffffffc020870c:	6562                	ld	a0,24(sp)
ffffffffc020870e:	77bc                	ld	a5,104(a5)
ffffffffc0208710:	4034d613          	srai	a2,s1,0x3
ffffffffc0208714:	0034                	addi	a3,sp,8
ffffffffc0208716:	8a05                	andi	a2,a2,1
ffffffffc0208718:	9782                	jalr	a5
ffffffffc020871a:	b789                	j	ffffffffc020865c <vfs_open+0x42>
ffffffffc020871c:	5475                	li	s0,-3
ffffffffc020871e:	b755                	j	ffffffffc02086c2 <vfs_open+0xa8>
ffffffffc0208720:	0105fa93          	andi	s5,a1,16
ffffffffc0208724:	5475                	li	s0,-3
ffffffffc0208726:	f80a9ee3          	bnez	s5,ffffffffc02086c2 <vfs_open+0xa8>
ffffffffc020872a:	bf21                	j	ffffffffc0208642 <vfs_open+0x28>
ffffffffc020872c:	6522                	ld	a0,8(sp)
ffffffffc020872e:	843e                	mv	s0,a5
ffffffffc0208730:	965ff0ef          	jal	ra,ffffffffc0208094 <inode_open_dec>
ffffffffc0208734:	6522                	ld	a0,8(sp)
ffffffffc0208736:	8b7ff0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc020873a:	b761                	j	ffffffffc02086c2 <vfs_open+0xa8>
ffffffffc020873c:	5425                	li	s0,-23
ffffffffc020873e:	b751                	j	ffffffffc02086c2 <vfs_open+0xa8>
ffffffffc0208740:	00006697          	auipc	a3,0x6
ffffffffc0208744:	6a868693          	addi	a3,a3,1704 # ffffffffc020ede8 <syscalls+0xbf0>
ffffffffc0208748:	00004617          	auipc	a2,0x4
ffffffffc020874c:	8c860613          	addi	a2,a2,-1848 # ffffffffc020c010 <commands+0x210>
ffffffffc0208750:	03300593          	li	a1,51
ffffffffc0208754:	00006517          	auipc	a0,0x6
ffffffffc0208758:	66450513          	addi	a0,a0,1636 # ffffffffc020edb8 <syscalls+0xbc0>
ffffffffc020875c:	d43f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208760:	00006697          	auipc	a3,0x6
ffffffffc0208764:	6e068693          	addi	a3,a3,1760 # ffffffffc020ee40 <syscalls+0xc48>
ffffffffc0208768:	00004617          	auipc	a2,0x4
ffffffffc020876c:	8a860613          	addi	a2,a2,-1880 # ffffffffc020c010 <commands+0x210>
ffffffffc0208770:	03a00593          	li	a1,58
ffffffffc0208774:	00006517          	auipc	a0,0x6
ffffffffc0208778:	64450513          	addi	a0,a0,1604 # ffffffffc020edb8 <syscalls+0xbc0>
ffffffffc020877c:	d23f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208780:	00006697          	auipc	a3,0x6
ffffffffc0208784:	65868693          	addi	a3,a3,1624 # ffffffffc020edd8 <syscalls+0xbe0>
ffffffffc0208788:	00004617          	auipc	a2,0x4
ffffffffc020878c:	88860613          	addi	a2,a2,-1912 # ffffffffc020c010 <commands+0x210>
ffffffffc0208790:	03100593          	li	a1,49
ffffffffc0208794:	00006517          	auipc	a0,0x6
ffffffffc0208798:	62450513          	addi	a0,a0,1572 # ffffffffc020edb8 <syscalls+0xbc0>
ffffffffc020879c:	d03f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02087a0:	00006697          	auipc	a3,0x6
ffffffffc02087a4:	5c868693          	addi	a3,a3,1480 # ffffffffc020ed68 <syscalls+0xb70>
ffffffffc02087a8:	00004617          	auipc	a2,0x4
ffffffffc02087ac:	86860613          	addi	a2,a2,-1944 # ffffffffc020c010 <commands+0x210>
ffffffffc02087b0:	02c00593          	li	a1,44
ffffffffc02087b4:	00006517          	auipc	a0,0x6
ffffffffc02087b8:	60450513          	addi	a0,a0,1540 # ffffffffc020edb8 <syscalls+0xbc0>
ffffffffc02087bc:	ce3f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02087c0 <vfs_close>:
ffffffffc02087c0:	1141                	addi	sp,sp,-16
ffffffffc02087c2:	e406                	sd	ra,8(sp)
ffffffffc02087c4:	e022                	sd	s0,0(sp)
ffffffffc02087c6:	842a                	mv	s0,a0
ffffffffc02087c8:	8cdff0ef          	jal	ra,ffffffffc0208094 <inode_open_dec>
ffffffffc02087cc:	8522                	mv	a0,s0
ffffffffc02087ce:	81fff0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc02087d2:	60a2                	ld	ra,8(sp)
ffffffffc02087d4:	6402                	ld	s0,0(sp)
ffffffffc02087d6:	4501                	li	a0,0
ffffffffc02087d8:	0141                	addi	sp,sp,16
ffffffffc02087da:	8082                	ret

ffffffffc02087dc <get_device>:
ffffffffc02087dc:	7179                	addi	sp,sp,-48
ffffffffc02087de:	ec26                	sd	s1,24(sp)
ffffffffc02087e0:	e84a                	sd	s2,16(sp)
ffffffffc02087e2:	f406                	sd	ra,40(sp)
ffffffffc02087e4:	f022                	sd	s0,32(sp)
ffffffffc02087e6:	00054303          	lbu	t1,0(a0)
ffffffffc02087ea:	892e                	mv	s2,a1
ffffffffc02087ec:	84b2                	mv	s1,a2
ffffffffc02087ee:	02030463          	beqz	t1,ffffffffc0208816 <get_device+0x3a>
ffffffffc02087f2:	00150413          	addi	s0,a0,1
ffffffffc02087f6:	86a2                	mv	a3,s0
ffffffffc02087f8:	879a                	mv	a5,t1
ffffffffc02087fa:	4701                	li	a4,0
ffffffffc02087fc:	03a00813          	li	a6,58
ffffffffc0208800:	02f00893          	li	a7,47
ffffffffc0208804:	03078263          	beq	a5,a6,ffffffffc0208828 <get_device+0x4c>
ffffffffc0208808:	05178963          	beq	a5,a7,ffffffffc020885a <get_device+0x7e>
ffffffffc020880c:	0006c783          	lbu	a5,0(a3)
ffffffffc0208810:	2705                	addiw	a4,a4,1
ffffffffc0208812:	0685                	addi	a3,a3,1
ffffffffc0208814:	fbe5                	bnez	a5,ffffffffc0208804 <get_device+0x28>
ffffffffc0208816:	7402                	ld	s0,32(sp)
ffffffffc0208818:	00a93023          	sd	a0,0(s2)
ffffffffc020881c:	70a2                	ld	ra,40(sp)
ffffffffc020881e:	6942                	ld	s2,16(sp)
ffffffffc0208820:	8526                	mv	a0,s1
ffffffffc0208822:	64e2                	ld	s1,24(sp)
ffffffffc0208824:	6145                	addi	sp,sp,48
ffffffffc0208826:	a279                	j	ffffffffc02089b4 <vfs_get_curdir>
ffffffffc0208828:	cb15                	beqz	a4,ffffffffc020885c <get_device+0x80>
ffffffffc020882a:	00e507b3          	add	a5,a0,a4
ffffffffc020882e:	0705                	addi	a4,a4,1
ffffffffc0208830:	00078023          	sb	zero,0(a5)
ffffffffc0208834:	972a                	add	a4,a4,a0
ffffffffc0208836:	02f00613          	li	a2,47
ffffffffc020883a:	00074783          	lbu	a5,0(a4)
ffffffffc020883e:	86ba                	mv	a3,a4
ffffffffc0208840:	0705                	addi	a4,a4,1
ffffffffc0208842:	fec78ce3          	beq	a5,a2,ffffffffc020883a <get_device+0x5e>
ffffffffc0208846:	7402                	ld	s0,32(sp)
ffffffffc0208848:	70a2                	ld	ra,40(sp)
ffffffffc020884a:	00d93023          	sd	a3,0(s2)
ffffffffc020884e:	85a6                	mv	a1,s1
ffffffffc0208850:	6942                	ld	s2,16(sp)
ffffffffc0208852:	64e2                	ld	s1,24(sp)
ffffffffc0208854:	6145                	addi	sp,sp,48
ffffffffc0208856:	ba9ff06f          	j	ffffffffc02083fe <vfs_get_root>
ffffffffc020885a:	ff55                	bnez	a4,ffffffffc0208816 <get_device+0x3a>
ffffffffc020885c:	02f00793          	li	a5,47
ffffffffc0208860:	04f30563          	beq	t1,a5,ffffffffc02088aa <get_device+0xce>
ffffffffc0208864:	03a00793          	li	a5,58
ffffffffc0208868:	06f31663          	bne	t1,a5,ffffffffc02088d4 <get_device+0xf8>
ffffffffc020886c:	0028                	addi	a0,sp,8
ffffffffc020886e:	146000ef          	jal	ra,ffffffffc02089b4 <vfs_get_curdir>
ffffffffc0208872:	e515                	bnez	a0,ffffffffc020889e <get_device+0xc2>
ffffffffc0208874:	67a2                	ld	a5,8(sp)
ffffffffc0208876:	77a8                	ld	a0,104(a5)
ffffffffc0208878:	cd15                	beqz	a0,ffffffffc02088b4 <get_device+0xd8>
ffffffffc020887a:	617c                	ld	a5,192(a0)
ffffffffc020887c:	9782                	jalr	a5
ffffffffc020887e:	87aa                	mv	a5,a0
ffffffffc0208880:	6522                	ld	a0,8(sp)
ffffffffc0208882:	e09c                	sd	a5,0(s1)
ffffffffc0208884:	f68ff0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc0208888:	02f00713          	li	a4,47
ffffffffc020888c:	a011                	j	ffffffffc0208890 <get_device+0xb4>
ffffffffc020888e:	0405                	addi	s0,s0,1
ffffffffc0208890:	00044783          	lbu	a5,0(s0)
ffffffffc0208894:	fee78de3          	beq	a5,a4,ffffffffc020888e <get_device+0xb2>
ffffffffc0208898:	00893023          	sd	s0,0(s2)
ffffffffc020889c:	4501                	li	a0,0
ffffffffc020889e:	70a2                	ld	ra,40(sp)
ffffffffc02088a0:	7402                	ld	s0,32(sp)
ffffffffc02088a2:	64e2                	ld	s1,24(sp)
ffffffffc02088a4:	6942                	ld	s2,16(sp)
ffffffffc02088a6:	6145                	addi	sp,sp,48
ffffffffc02088a8:	8082                	ret
ffffffffc02088aa:	8526                	mv	a0,s1
ffffffffc02088ac:	93fff0ef          	jal	ra,ffffffffc02081ea <vfs_get_bootfs>
ffffffffc02088b0:	dd61                	beqz	a0,ffffffffc0208888 <get_device+0xac>
ffffffffc02088b2:	b7f5                	j	ffffffffc020889e <get_device+0xc2>
ffffffffc02088b4:	00006697          	auipc	a3,0x6
ffffffffc02088b8:	61c68693          	addi	a3,a3,1564 # ffffffffc020eed0 <syscalls+0xcd8>
ffffffffc02088bc:	00003617          	auipc	a2,0x3
ffffffffc02088c0:	75460613          	addi	a2,a2,1876 # ffffffffc020c010 <commands+0x210>
ffffffffc02088c4:	03900593          	li	a1,57
ffffffffc02088c8:	00006517          	auipc	a0,0x6
ffffffffc02088cc:	5f050513          	addi	a0,a0,1520 # ffffffffc020eeb8 <syscalls+0xcc0>
ffffffffc02088d0:	bcff70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02088d4:	00006697          	auipc	a3,0x6
ffffffffc02088d8:	5d468693          	addi	a3,a3,1492 # ffffffffc020eea8 <syscalls+0xcb0>
ffffffffc02088dc:	00003617          	auipc	a2,0x3
ffffffffc02088e0:	73460613          	addi	a2,a2,1844 # ffffffffc020c010 <commands+0x210>
ffffffffc02088e4:	03300593          	li	a1,51
ffffffffc02088e8:	00006517          	auipc	a0,0x6
ffffffffc02088ec:	5d050513          	addi	a0,a0,1488 # ffffffffc020eeb8 <syscalls+0xcc0>
ffffffffc02088f0:	baff70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02088f4 <vfs_lookup>:
ffffffffc02088f4:	7139                	addi	sp,sp,-64
ffffffffc02088f6:	f426                	sd	s1,40(sp)
ffffffffc02088f8:	0830                	addi	a2,sp,24
ffffffffc02088fa:	84ae                	mv	s1,a1
ffffffffc02088fc:	002c                	addi	a1,sp,8
ffffffffc02088fe:	f822                	sd	s0,48(sp)
ffffffffc0208900:	fc06                	sd	ra,56(sp)
ffffffffc0208902:	f04a                	sd	s2,32(sp)
ffffffffc0208904:	e42a                	sd	a0,8(sp)
ffffffffc0208906:	ed7ff0ef          	jal	ra,ffffffffc02087dc <get_device>
ffffffffc020890a:	842a                	mv	s0,a0
ffffffffc020890c:	ed1d                	bnez	a0,ffffffffc020894a <vfs_lookup+0x56>
ffffffffc020890e:	67a2                	ld	a5,8(sp)
ffffffffc0208910:	6962                	ld	s2,24(sp)
ffffffffc0208912:	0007c783          	lbu	a5,0(a5)
ffffffffc0208916:	c3a9                	beqz	a5,ffffffffc0208958 <vfs_lookup+0x64>
ffffffffc0208918:	04090963          	beqz	s2,ffffffffc020896a <vfs_lookup+0x76>
ffffffffc020891c:	07093783          	ld	a5,112(s2)
ffffffffc0208920:	c7a9                	beqz	a5,ffffffffc020896a <vfs_lookup+0x76>
ffffffffc0208922:	7bbc                	ld	a5,112(a5)
ffffffffc0208924:	c3b9                	beqz	a5,ffffffffc020896a <vfs_lookup+0x76>
ffffffffc0208926:	854a                	mv	a0,s2
ffffffffc0208928:	00006597          	auipc	a1,0x6
ffffffffc020892c:	61058593          	addi	a1,a1,1552 # ffffffffc020ef38 <syscalls+0xd40>
ffffffffc0208930:	e06ff0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0208934:	07093783          	ld	a5,112(s2)
ffffffffc0208938:	65a2                	ld	a1,8(sp)
ffffffffc020893a:	6562                	ld	a0,24(sp)
ffffffffc020893c:	7bbc                	ld	a5,112(a5)
ffffffffc020893e:	8626                	mv	a2,s1
ffffffffc0208940:	9782                	jalr	a5
ffffffffc0208942:	842a                	mv	s0,a0
ffffffffc0208944:	6562                	ld	a0,24(sp)
ffffffffc0208946:	ea6ff0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc020894a:	70e2                	ld	ra,56(sp)
ffffffffc020894c:	8522                	mv	a0,s0
ffffffffc020894e:	7442                	ld	s0,48(sp)
ffffffffc0208950:	74a2                	ld	s1,40(sp)
ffffffffc0208952:	7902                	ld	s2,32(sp)
ffffffffc0208954:	6121                	addi	sp,sp,64
ffffffffc0208956:	8082                	ret
ffffffffc0208958:	70e2                	ld	ra,56(sp)
ffffffffc020895a:	8522                	mv	a0,s0
ffffffffc020895c:	7442                	ld	s0,48(sp)
ffffffffc020895e:	0124b023          	sd	s2,0(s1)
ffffffffc0208962:	74a2                	ld	s1,40(sp)
ffffffffc0208964:	7902                	ld	s2,32(sp)
ffffffffc0208966:	6121                	addi	sp,sp,64
ffffffffc0208968:	8082                	ret
ffffffffc020896a:	00006697          	auipc	a3,0x6
ffffffffc020896e:	57e68693          	addi	a3,a3,1406 # ffffffffc020eee8 <syscalls+0xcf0>
ffffffffc0208972:	00003617          	auipc	a2,0x3
ffffffffc0208976:	69e60613          	addi	a2,a2,1694 # ffffffffc020c010 <commands+0x210>
ffffffffc020897a:	04f00593          	li	a1,79
ffffffffc020897e:	00006517          	auipc	a0,0x6
ffffffffc0208982:	53a50513          	addi	a0,a0,1338 # ffffffffc020eeb8 <syscalls+0xcc0>
ffffffffc0208986:	b19f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020898a <vfs_lookup_parent>:
ffffffffc020898a:	7139                	addi	sp,sp,-64
ffffffffc020898c:	f822                	sd	s0,48(sp)
ffffffffc020898e:	f426                	sd	s1,40(sp)
ffffffffc0208990:	842e                	mv	s0,a1
ffffffffc0208992:	84b2                	mv	s1,a2
ffffffffc0208994:	002c                	addi	a1,sp,8
ffffffffc0208996:	0830                	addi	a2,sp,24
ffffffffc0208998:	fc06                	sd	ra,56(sp)
ffffffffc020899a:	e42a                	sd	a0,8(sp)
ffffffffc020899c:	e41ff0ef          	jal	ra,ffffffffc02087dc <get_device>
ffffffffc02089a0:	e509                	bnez	a0,ffffffffc02089aa <vfs_lookup_parent+0x20>
ffffffffc02089a2:	67a2                	ld	a5,8(sp)
ffffffffc02089a4:	e09c                	sd	a5,0(s1)
ffffffffc02089a6:	67e2                	ld	a5,24(sp)
ffffffffc02089a8:	e01c                	sd	a5,0(s0)
ffffffffc02089aa:	70e2                	ld	ra,56(sp)
ffffffffc02089ac:	7442                	ld	s0,48(sp)
ffffffffc02089ae:	74a2                	ld	s1,40(sp)
ffffffffc02089b0:	6121                	addi	sp,sp,64
ffffffffc02089b2:	8082                	ret

ffffffffc02089b4 <vfs_get_curdir>:
ffffffffc02089b4:	0008e797          	auipc	a5,0x8e
ffffffffc02089b8:	f3c7b783          	ld	a5,-196(a5) # ffffffffc02968f0 <current>
ffffffffc02089bc:	1507b783          	ld	a5,336(a5)
ffffffffc02089c0:	1101                	addi	sp,sp,-32
ffffffffc02089c2:	e426                	sd	s1,8(sp)
ffffffffc02089c4:	6384                	ld	s1,0(a5)
ffffffffc02089c6:	ec06                	sd	ra,24(sp)
ffffffffc02089c8:	e822                	sd	s0,16(sp)
ffffffffc02089ca:	cc81                	beqz	s1,ffffffffc02089e2 <vfs_get_curdir+0x2e>
ffffffffc02089cc:	842a                	mv	s0,a0
ffffffffc02089ce:	8526                	mv	a0,s1
ffffffffc02089d0:	d4eff0ef          	jal	ra,ffffffffc0207f1e <inode_ref_inc>
ffffffffc02089d4:	4501                	li	a0,0
ffffffffc02089d6:	e004                	sd	s1,0(s0)
ffffffffc02089d8:	60e2                	ld	ra,24(sp)
ffffffffc02089da:	6442                	ld	s0,16(sp)
ffffffffc02089dc:	64a2                	ld	s1,8(sp)
ffffffffc02089de:	6105                	addi	sp,sp,32
ffffffffc02089e0:	8082                	ret
ffffffffc02089e2:	5541                	li	a0,-16
ffffffffc02089e4:	bfd5                	j	ffffffffc02089d8 <vfs_get_curdir+0x24>

ffffffffc02089e6 <vfs_set_curdir>:
ffffffffc02089e6:	7139                	addi	sp,sp,-64
ffffffffc02089e8:	f04a                	sd	s2,32(sp)
ffffffffc02089ea:	0008e917          	auipc	s2,0x8e
ffffffffc02089ee:	f0690913          	addi	s2,s2,-250 # ffffffffc02968f0 <current>
ffffffffc02089f2:	00093783          	ld	a5,0(s2)
ffffffffc02089f6:	f822                	sd	s0,48(sp)
ffffffffc02089f8:	842a                	mv	s0,a0
ffffffffc02089fa:	1507b503          	ld	a0,336(a5)
ffffffffc02089fe:	ec4e                	sd	s3,24(sp)
ffffffffc0208a00:	fc06                	sd	ra,56(sp)
ffffffffc0208a02:	f426                	sd	s1,40(sp)
ffffffffc0208a04:	84ffc0ef          	jal	ra,ffffffffc0205252 <lock_files>
ffffffffc0208a08:	00093783          	ld	a5,0(s2)
ffffffffc0208a0c:	1507b503          	ld	a0,336(a5)
ffffffffc0208a10:	00053983          	ld	s3,0(a0)
ffffffffc0208a14:	07340963          	beq	s0,s3,ffffffffc0208a86 <vfs_set_curdir+0xa0>
ffffffffc0208a18:	cc39                	beqz	s0,ffffffffc0208a76 <vfs_set_curdir+0x90>
ffffffffc0208a1a:	783c                	ld	a5,112(s0)
ffffffffc0208a1c:	c7bd                	beqz	a5,ffffffffc0208a8a <vfs_set_curdir+0xa4>
ffffffffc0208a1e:	6bbc                	ld	a5,80(a5)
ffffffffc0208a20:	c7ad                	beqz	a5,ffffffffc0208a8a <vfs_set_curdir+0xa4>
ffffffffc0208a22:	00006597          	auipc	a1,0x6
ffffffffc0208a26:	58658593          	addi	a1,a1,1414 # ffffffffc020efa8 <syscalls+0xdb0>
ffffffffc0208a2a:	8522                	mv	a0,s0
ffffffffc0208a2c:	d0aff0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0208a30:	783c                	ld	a5,112(s0)
ffffffffc0208a32:	006c                	addi	a1,sp,12
ffffffffc0208a34:	8522                	mv	a0,s0
ffffffffc0208a36:	6bbc                	ld	a5,80(a5)
ffffffffc0208a38:	9782                	jalr	a5
ffffffffc0208a3a:	84aa                	mv	s1,a0
ffffffffc0208a3c:	e901                	bnez	a0,ffffffffc0208a4c <vfs_set_curdir+0x66>
ffffffffc0208a3e:	47b2                	lw	a5,12(sp)
ffffffffc0208a40:	669d                	lui	a3,0x7
ffffffffc0208a42:	6709                	lui	a4,0x2
ffffffffc0208a44:	8ff5                	and	a5,a5,a3
ffffffffc0208a46:	54b9                	li	s1,-18
ffffffffc0208a48:	02e78063          	beq	a5,a4,ffffffffc0208a68 <vfs_set_curdir+0x82>
ffffffffc0208a4c:	00093783          	ld	a5,0(s2)
ffffffffc0208a50:	1507b503          	ld	a0,336(a5)
ffffffffc0208a54:	805fc0ef          	jal	ra,ffffffffc0205258 <unlock_files>
ffffffffc0208a58:	70e2                	ld	ra,56(sp)
ffffffffc0208a5a:	7442                	ld	s0,48(sp)
ffffffffc0208a5c:	7902                	ld	s2,32(sp)
ffffffffc0208a5e:	69e2                	ld	s3,24(sp)
ffffffffc0208a60:	8526                	mv	a0,s1
ffffffffc0208a62:	74a2                	ld	s1,40(sp)
ffffffffc0208a64:	6121                	addi	sp,sp,64
ffffffffc0208a66:	8082                	ret
ffffffffc0208a68:	8522                	mv	a0,s0
ffffffffc0208a6a:	cb4ff0ef          	jal	ra,ffffffffc0207f1e <inode_ref_inc>
ffffffffc0208a6e:	00093783          	ld	a5,0(s2)
ffffffffc0208a72:	1507b503          	ld	a0,336(a5)
ffffffffc0208a76:	e100                	sd	s0,0(a0)
ffffffffc0208a78:	4481                	li	s1,0
ffffffffc0208a7a:	fc098de3          	beqz	s3,ffffffffc0208a54 <vfs_set_curdir+0x6e>
ffffffffc0208a7e:	854e                	mv	a0,s3
ffffffffc0208a80:	d6cff0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc0208a84:	b7e1                	j	ffffffffc0208a4c <vfs_set_curdir+0x66>
ffffffffc0208a86:	4481                	li	s1,0
ffffffffc0208a88:	b7f1                	j	ffffffffc0208a54 <vfs_set_curdir+0x6e>
ffffffffc0208a8a:	00006697          	auipc	a3,0x6
ffffffffc0208a8e:	4b668693          	addi	a3,a3,1206 # ffffffffc020ef40 <syscalls+0xd48>
ffffffffc0208a92:	00003617          	auipc	a2,0x3
ffffffffc0208a96:	57e60613          	addi	a2,a2,1406 # ffffffffc020c010 <commands+0x210>
ffffffffc0208a9a:	04300593          	li	a1,67
ffffffffc0208a9e:	00006517          	auipc	a0,0x6
ffffffffc0208aa2:	4f250513          	addi	a0,a0,1266 # ffffffffc020ef90 <syscalls+0xd98>
ffffffffc0208aa6:	9f9f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208aaa <vfs_chdir>:
ffffffffc0208aaa:	1101                	addi	sp,sp,-32
ffffffffc0208aac:	002c                	addi	a1,sp,8
ffffffffc0208aae:	e822                	sd	s0,16(sp)
ffffffffc0208ab0:	ec06                	sd	ra,24(sp)
ffffffffc0208ab2:	e43ff0ef          	jal	ra,ffffffffc02088f4 <vfs_lookup>
ffffffffc0208ab6:	842a                	mv	s0,a0
ffffffffc0208ab8:	c511                	beqz	a0,ffffffffc0208ac4 <vfs_chdir+0x1a>
ffffffffc0208aba:	60e2                	ld	ra,24(sp)
ffffffffc0208abc:	8522                	mv	a0,s0
ffffffffc0208abe:	6442                	ld	s0,16(sp)
ffffffffc0208ac0:	6105                	addi	sp,sp,32
ffffffffc0208ac2:	8082                	ret
ffffffffc0208ac4:	6522                	ld	a0,8(sp)
ffffffffc0208ac6:	f21ff0ef          	jal	ra,ffffffffc02089e6 <vfs_set_curdir>
ffffffffc0208aca:	842a                	mv	s0,a0
ffffffffc0208acc:	6522                	ld	a0,8(sp)
ffffffffc0208ace:	d1eff0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc0208ad2:	60e2                	ld	ra,24(sp)
ffffffffc0208ad4:	8522                	mv	a0,s0
ffffffffc0208ad6:	6442                	ld	s0,16(sp)
ffffffffc0208ad8:	6105                	addi	sp,sp,32
ffffffffc0208ada:	8082                	ret

ffffffffc0208adc <vfs_getcwd>:
ffffffffc0208adc:	0008e797          	auipc	a5,0x8e
ffffffffc0208ae0:	e147b783          	ld	a5,-492(a5) # ffffffffc02968f0 <current>
ffffffffc0208ae4:	1507b783          	ld	a5,336(a5)
ffffffffc0208ae8:	7179                	addi	sp,sp,-48
ffffffffc0208aea:	ec26                	sd	s1,24(sp)
ffffffffc0208aec:	6384                	ld	s1,0(a5)
ffffffffc0208aee:	f406                	sd	ra,40(sp)
ffffffffc0208af0:	f022                	sd	s0,32(sp)
ffffffffc0208af2:	e84a                	sd	s2,16(sp)
ffffffffc0208af4:	ccbd                	beqz	s1,ffffffffc0208b72 <vfs_getcwd+0x96>
ffffffffc0208af6:	892a                	mv	s2,a0
ffffffffc0208af8:	8526                	mv	a0,s1
ffffffffc0208afa:	c24ff0ef          	jal	ra,ffffffffc0207f1e <inode_ref_inc>
ffffffffc0208afe:	74a8                	ld	a0,104(s1)
ffffffffc0208b00:	c93d                	beqz	a0,ffffffffc0208b76 <vfs_getcwd+0x9a>
ffffffffc0208b02:	9b3ff0ef          	jal	ra,ffffffffc02084b4 <vfs_get_devname>
ffffffffc0208b06:	842a                	mv	s0,a0
ffffffffc0208b08:	781020ef          	jal	ra,ffffffffc020ba88 <strlen>
ffffffffc0208b0c:	862a                	mv	a2,a0
ffffffffc0208b0e:	85a2                	mv	a1,s0
ffffffffc0208b10:	4701                	li	a4,0
ffffffffc0208b12:	4685                	li	a3,1
ffffffffc0208b14:	854a                	mv	a0,s2
ffffffffc0208b16:	967fc0ef          	jal	ra,ffffffffc020547c <iobuf_move>
ffffffffc0208b1a:	842a                	mv	s0,a0
ffffffffc0208b1c:	c919                	beqz	a0,ffffffffc0208b32 <vfs_getcwd+0x56>
ffffffffc0208b1e:	8526                	mv	a0,s1
ffffffffc0208b20:	cccff0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc0208b24:	70a2                	ld	ra,40(sp)
ffffffffc0208b26:	8522                	mv	a0,s0
ffffffffc0208b28:	7402                	ld	s0,32(sp)
ffffffffc0208b2a:	64e2                	ld	s1,24(sp)
ffffffffc0208b2c:	6942                	ld	s2,16(sp)
ffffffffc0208b2e:	6145                	addi	sp,sp,48
ffffffffc0208b30:	8082                	ret
ffffffffc0208b32:	03a00793          	li	a5,58
ffffffffc0208b36:	4701                	li	a4,0
ffffffffc0208b38:	4685                	li	a3,1
ffffffffc0208b3a:	4605                	li	a2,1
ffffffffc0208b3c:	00f10593          	addi	a1,sp,15
ffffffffc0208b40:	854a                	mv	a0,s2
ffffffffc0208b42:	00f107a3          	sb	a5,15(sp)
ffffffffc0208b46:	937fc0ef          	jal	ra,ffffffffc020547c <iobuf_move>
ffffffffc0208b4a:	842a                	mv	s0,a0
ffffffffc0208b4c:	f969                	bnez	a0,ffffffffc0208b1e <vfs_getcwd+0x42>
ffffffffc0208b4e:	78bc                	ld	a5,112(s1)
ffffffffc0208b50:	c3b9                	beqz	a5,ffffffffc0208b96 <vfs_getcwd+0xba>
ffffffffc0208b52:	7f9c                	ld	a5,56(a5)
ffffffffc0208b54:	c3a9                	beqz	a5,ffffffffc0208b96 <vfs_getcwd+0xba>
ffffffffc0208b56:	00006597          	auipc	a1,0x6
ffffffffc0208b5a:	4b258593          	addi	a1,a1,1202 # ffffffffc020f008 <syscalls+0xe10>
ffffffffc0208b5e:	8526                	mv	a0,s1
ffffffffc0208b60:	bd6ff0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0208b64:	78bc                	ld	a5,112(s1)
ffffffffc0208b66:	85ca                	mv	a1,s2
ffffffffc0208b68:	8526                	mv	a0,s1
ffffffffc0208b6a:	7f9c                	ld	a5,56(a5)
ffffffffc0208b6c:	9782                	jalr	a5
ffffffffc0208b6e:	842a                	mv	s0,a0
ffffffffc0208b70:	b77d                	j	ffffffffc0208b1e <vfs_getcwd+0x42>
ffffffffc0208b72:	5441                	li	s0,-16
ffffffffc0208b74:	bf45                	j	ffffffffc0208b24 <vfs_getcwd+0x48>
ffffffffc0208b76:	00006697          	auipc	a3,0x6
ffffffffc0208b7a:	35a68693          	addi	a3,a3,858 # ffffffffc020eed0 <syscalls+0xcd8>
ffffffffc0208b7e:	00003617          	auipc	a2,0x3
ffffffffc0208b82:	49260613          	addi	a2,a2,1170 # ffffffffc020c010 <commands+0x210>
ffffffffc0208b86:	06e00593          	li	a1,110
ffffffffc0208b8a:	00006517          	auipc	a0,0x6
ffffffffc0208b8e:	40650513          	addi	a0,a0,1030 # ffffffffc020ef90 <syscalls+0xd98>
ffffffffc0208b92:	90df70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208b96:	00006697          	auipc	a3,0x6
ffffffffc0208b9a:	41a68693          	addi	a3,a3,1050 # ffffffffc020efb0 <syscalls+0xdb8>
ffffffffc0208b9e:	00003617          	auipc	a2,0x3
ffffffffc0208ba2:	47260613          	addi	a2,a2,1138 # ffffffffc020c010 <commands+0x210>
ffffffffc0208ba6:	07800593          	li	a1,120
ffffffffc0208baa:	00006517          	auipc	a0,0x6
ffffffffc0208bae:	3e650513          	addi	a0,a0,998 # ffffffffc020ef90 <syscalls+0xd98>
ffffffffc0208bb2:	8edf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208bb6 <dev_lookup>:
ffffffffc0208bb6:	0005c783          	lbu	a5,0(a1)
ffffffffc0208bba:	e385                	bnez	a5,ffffffffc0208bda <dev_lookup+0x24>
ffffffffc0208bbc:	1101                	addi	sp,sp,-32
ffffffffc0208bbe:	e822                	sd	s0,16(sp)
ffffffffc0208bc0:	e426                	sd	s1,8(sp)
ffffffffc0208bc2:	ec06                	sd	ra,24(sp)
ffffffffc0208bc4:	84aa                	mv	s1,a0
ffffffffc0208bc6:	8432                	mv	s0,a2
ffffffffc0208bc8:	b56ff0ef          	jal	ra,ffffffffc0207f1e <inode_ref_inc>
ffffffffc0208bcc:	60e2                	ld	ra,24(sp)
ffffffffc0208bce:	e004                	sd	s1,0(s0)
ffffffffc0208bd0:	6442                	ld	s0,16(sp)
ffffffffc0208bd2:	64a2                	ld	s1,8(sp)
ffffffffc0208bd4:	4501                	li	a0,0
ffffffffc0208bd6:	6105                	addi	sp,sp,32
ffffffffc0208bd8:	8082                	ret
ffffffffc0208bda:	5541                	li	a0,-16
ffffffffc0208bdc:	8082                	ret

ffffffffc0208bde <dev_fstat>:
ffffffffc0208bde:	1101                	addi	sp,sp,-32
ffffffffc0208be0:	e426                	sd	s1,8(sp)
ffffffffc0208be2:	84ae                	mv	s1,a1
ffffffffc0208be4:	e822                	sd	s0,16(sp)
ffffffffc0208be6:	02000613          	li	a2,32
ffffffffc0208bea:	842a                	mv	s0,a0
ffffffffc0208bec:	4581                	li	a1,0
ffffffffc0208bee:	8526                	mv	a0,s1
ffffffffc0208bf0:	ec06                	sd	ra,24(sp)
ffffffffc0208bf2:	739020ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0208bf6:	c429                	beqz	s0,ffffffffc0208c40 <dev_fstat+0x62>
ffffffffc0208bf8:	783c                	ld	a5,112(s0)
ffffffffc0208bfa:	c3b9                	beqz	a5,ffffffffc0208c40 <dev_fstat+0x62>
ffffffffc0208bfc:	6bbc                	ld	a5,80(a5)
ffffffffc0208bfe:	c3a9                	beqz	a5,ffffffffc0208c40 <dev_fstat+0x62>
ffffffffc0208c00:	00006597          	auipc	a1,0x6
ffffffffc0208c04:	3a858593          	addi	a1,a1,936 # ffffffffc020efa8 <syscalls+0xdb0>
ffffffffc0208c08:	8522                	mv	a0,s0
ffffffffc0208c0a:	b2cff0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0208c0e:	783c                	ld	a5,112(s0)
ffffffffc0208c10:	85a6                	mv	a1,s1
ffffffffc0208c12:	8522                	mv	a0,s0
ffffffffc0208c14:	6bbc                	ld	a5,80(a5)
ffffffffc0208c16:	9782                	jalr	a5
ffffffffc0208c18:	ed19                	bnez	a0,ffffffffc0208c36 <dev_fstat+0x58>
ffffffffc0208c1a:	4c38                	lw	a4,88(s0)
ffffffffc0208c1c:	6785                	lui	a5,0x1
ffffffffc0208c1e:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208c22:	02f71f63          	bne	a4,a5,ffffffffc0208c60 <dev_fstat+0x82>
ffffffffc0208c26:	6018                	ld	a4,0(s0)
ffffffffc0208c28:	641c                	ld	a5,8(s0)
ffffffffc0208c2a:	4685                	li	a3,1
ffffffffc0208c2c:	e494                	sd	a3,8(s1)
ffffffffc0208c2e:	02e787b3          	mul	a5,a5,a4
ffffffffc0208c32:	e898                	sd	a4,16(s1)
ffffffffc0208c34:	ec9c                	sd	a5,24(s1)
ffffffffc0208c36:	60e2                	ld	ra,24(sp)
ffffffffc0208c38:	6442                	ld	s0,16(sp)
ffffffffc0208c3a:	64a2                	ld	s1,8(sp)
ffffffffc0208c3c:	6105                	addi	sp,sp,32
ffffffffc0208c3e:	8082                	ret
ffffffffc0208c40:	00006697          	auipc	a3,0x6
ffffffffc0208c44:	30068693          	addi	a3,a3,768 # ffffffffc020ef40 <syscalls+0xd48>
ffffffffc0208c48:	00003617          	auipc	a2,0x3
ffffffffc0208c4c:	3c860613          	addi	a2,a2,968 # ffffffffc020c010 <commands+0x210>
ffffffffc0208c50:	04200593          	li	a1,66
ffffffffc0208c54:	00006517          	auipc	a0,0x6
ffffffffc0208c58:	3c450513          	addi	a0,a0,964 # ffffffffc020f018 <syscalls+0xe20>
ffffffffc0208c5c:	843f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208c60:	00006697          	auipc	a3,0x6
ffffffffc0208c64:	0a868693          	addi	a3,a3,168 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc0208c68:	00003617          	auipc	a2,0x3
ffffffffc0208c6c:	3a860613          	addi	a2,a2,936 # ffffffffc020c010 <commands+0x210>
ffffffffc0208c70:	04500593          	li	a1,69
ffffffffc0208c74:	00006517          	auipc	a0,0x6
ffffffffc0208c78:	3a450513          	addi	a0,a0,932 # ffffffffc020f018 <syscalls+0xe20>
ffffffffc0208c7c:	823f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208c80 <dev_ioctl>:
ffffffffc0208c80:	c909                	beqz	a0,ffffffffc0208c92 <dev_ioctl+0x12>
ffffffffc0208c82:	4d34                	lw	a3,88(a0)
ffffffffc0208c84:	6705                	lui	a4,0x1
ffffffffc0208c86:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208c8a:	00e69463          	bne	a3,a4,ffffffffc0208c92 <dev_ioctl+0x12>
ffffffffc0208c8e:	751c                	ld	a5,40(a0)
ffffffffc0208c90:	8782                	jr	a5
ffffffffc0208c92:	1141                	addi	sp,sp,-16
ffffffffc0208c94:	00006697          	auipc	a3,0x6
ffffffffc0208c98:	07468693          	addi	a3,a3,116 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc0208c9c:	00003617          	auipc	a2,0x3
ffffffffc0208ca0:	37460613          	addi	a2,a2,884 # ffffffffc020c010 <commands+0x210>
ffffffffc0208ca4:	03500593          	li	a1,53
ffffffffc0208ca8:	00006517          	auipc	a0,0x6
ffffffffc0208cac:	37050513          	addi	a0,a0,880 # ffffffffc020f018 <syscalls+0xe20>
ffffffffc0208cb0:	e406                	sd	ra,8(sp)
ffffffffc0208cb2:	fecf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208cb6 <dev_tryseek>:
ffffffffc0208cb6:	c51d                	beqz	a0,ffffffffc0208ce4 <dev_tryseek+0x2e>
ffffffffc0208cb8:	4d38                	lw	a4,88(a0)
ffffffffc0208cba:	6785                	lui	a5,0x1
ffffffffc0208cbc:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208cc0:	02f71263          	bne	a4,a5,ffffffffc0208ce4 <dev_tryseek+0x2e>
ffffffffc0208cc4:	611c                	ld	a5,0(a0)
ffffffffc0208cc6:	cf89                	beqz	a5,ffffffffc0208ce0 <dev_tryseek+0x2a>
ffffffffc0208cc8:	6518                	ld	a4,8(a0)
ffffffffc0208cca:	02e5f6b3          	remu	a3,a1,a4
ffffffffc0208cce:	ea89                	bnez	a3,ffffffffc0208ce0 <dev_tryseek+0x2a>
ffffffffc0208cd0:	0005c863          	bltz	a1,ffffffffc0208ce0 <dev_tryseek+0x2a>
ffffffffc0208cd4:	02e787b3          	mul	a5,a5,a4
ffffffffc0208cd8:	00f5f463          	bgeu	a1,a5,ffffffffc0208ce0 <dev_tryseek+0x2a>
ffffffffc0208cdc:	4501                	li	a0,0
ffffffffc0208cde:	8082                	ret
ffffffffc0208ce0:	5575                	li	a0,-3
ffffffffc0208ce2:	8082                	ret
ffffffffc0208ce4:	1141                	addi	sp,sp,-16
ffffffffc0208ce6:	00006697          	auipc	a3,0x6
ffffffffc0208cea:	02268693          	addi	a3,a3,34 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc0208cee:	00003617          	auipc	a2,0x3
ffffffffc0208cf2:	32260613          	addi	a2,a2,802 # ffffffffc020c010 <commands+0x210>
ffffffffc0208cf6:	05f00593          	li	a1,95
ffffffffc0208cfa:	00006517          	auipc	a0,0x6
ffffffffc0208cfe:	31e50513          	addi	a0,a0,798 # ffffffffc020f018 <syscalls+0xe20>
ffffffffc0208d02:	e406                	sd	ra,8(sp)
ffffffffc0208d04:	f9af70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208d08 <dev_gettype>:
ffffffffc0208d08:	c10d                	beqz	a0,ffffffffc0208d2a <dev_gettype+0x22>
ffffffffc0208d0a:	4d38                	lw	a4,88(a0)
ffffffffc0208d0c:	6785                	lui	a5,0x1
ffffffffc0208d0e:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208d12:	00f71c63          	bne	a4,a5,ffffffffc0208d2a <dev_gettype+0x22>
ffffffffc0208d16:	6118                	ld	a4,0(a0)
ffffffffc0208d18:	6795                	lui	a5,0x5
ffffffffc0208d1a:	c701                	beqz	a4,ffffffffc0208d22 <dev_gettype+0x1a>
ffffffffc0208d1c:	c19c                	sw	a5,0(a1)
ffffffffc0208d1e:	4501                	li	a0,0
ffffffffc0208d20:	8082                	ret
ffffffffc0208d22:	6791                	lui	a5,0x4
ffffffffc0208d24:	c19c                	sw	a5,0(a1)
ffffffffc0208d26:	4501                	li	a0,0
ffffffffc0208d28:	8082                	ret
ffffffffc0208d2a:	1141                	addi	sp,sp,-16
ffffffffc0208d2c:	00006697          	auipc	a3,0x6
ffffffffc0208d30:	fdc68693          	addi	a3,a3,-36 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc0208d34:	00003617          	auipc	a2,0x3
ffffffffc0208d38:	2dc60613          	addi	a2,a2,732 # ffffffffc020c010 <commands+0x210>
ffffffffc0208d3c:	05300593          	li	a1,83
ffffffffc0208d40:	00006517          	auipc	a0,0x6
ffffffffc0208d44:	2d850513          	addi	a0,a0,728 # ffffffffc020f018 <syscalls+0xe20>
ffffffffc0208d48:	e406                	sd	ra,8(sp)
ffffffffc0208d4a:	f54f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208d4e <dev_write>:
ffffffffc0208d4e:	c911                	beqz	a0,ffffffffc0208d62 <dev_write+0x14>
ffffffffc0208d50:	4d34                	lw	a3,88(a0)
ffffffffc0208d52:	6705                	lui	a4,0x1
ffffffffc0208d54:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208d58:	00e69563          	bne	a3,a4,ffffffffc0208d62 <dev_write+0x14>
ffffffffc0208d5c:	711c                	ld	a5,32(a0)
ffffffffc0208d5e:	4605                	li	a2,1
ffffffffc0208d60:	8782                	jr	a5
ffffffffc0208d62:	1141                	addi	sp,sp,-16
ffffffffc0208d64:	00006697          	auipc	a3,0x6
ffffffffc0208d68:	fa468693          	addi	a3,a3,-92 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc0208d6c:	00003617          	auipc	a2,0x3
ffffffffc0208d70:	2a460613          	addi	a2,a2,676 # ffffffffc020c010 <commands+0x210>
ffffffffc0208d74:	02c00593          	li	a1,44
ffffffffc0208d78:	00006517          	auipc	a0,0x6
ffffffffc0208d7c:	2a050513          	addi	a0,a0,672 # ffffffffc020f018 <syscalls+0xe20>
ffffffffc0208d80:	e406                	sd	ra,8(sp)
ffffffffc0208d82:	f1cf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208d86 <dev_read>:
ffffffffc0208d86:	c911                	beqz	a0,ffffffffc0208d9a <dev_read+0x14>
ffffffffc0208d88:	4d34                	lw	a3,88(a0)
ffffffffc0208d8a:	6705                	lui	a4,0x1
ffffffffc0208d8c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208d90:	00e69563          	bne	a3,a4,ffffffffc0208d9a <dev_read+0x14>
ffffffffc0208d94:	711c                	ld	a5,32(a0)
ffffffffc0208d96:	4601                	li	a2,0
ffffffffc0208d98:	8782                	jr	a5
ffffffffc0208d9a:	1141                	addi	sp,sp,-16
ffffffffc0208d9c:	00006697          	auipc	a3,0x6
ffffffffc0208da0:	f6c68693          	addi	a3,a3,-148 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc0208da4:	00003617          	auipc	a2,0x3
ffffffffc0208da8:	26c60613          	addi	a2,a2,620 # ffffffffc020c010 <commands+0x210>
ffffffffc0208dac:	02300593          	li	a1,35
ffffffffc0208db0:	00006517          	auipc	a0,0x6
ffffffffc0208db4:	26850513          	addi	a0,a0,616 # ffffffffc020f018 <syscalls+0xe20>
ffffffffc0208db8:	e406                	sd	ra,8(sp)
ffffffffc0208dba:	ee4f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208dbe <dev_close>:
ffffffffc0208dbe:	c909                	beqz	a0,ffffffffc0208dd0 <dev_close+0x12>
ffffffffc0208dc0:	4d34                	lw	a3,88(a0)
ffffffffc0208dc2:	6705                	lui	a4,0x1
ffffffffc0208dc4:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208dc8:	00e69463          	bne	a3,a4,ffffffffc0208dd0 <dev_close+0x12>
ffffffffc0208dcc:	6d1c                	ld	a5,24(a0)
ffffffffc0208dce:	8782                	jr	a5
ffffffffc0208dd0:	1141                	addi	sp,sp,-16
ffffffffc0208dd2:	00006697          	auipc	a3,0x6
ffffffffc0208dd6:	f3668693          	addi	a3,a3,-202 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc0208dda:	00003617          	auipc	a2,0x3
ffffffffc0208dde:	23660613          	addi	a2,a2,566 # ffffffffc020c010 <commands+0x210>
ffffffffc0208de2:	45e9                	li	a1,26
ffffffffc0208de4:	00006517          	auipc	a0,0x6
ffffffffc0208de8:	23450513          	addi	a0,a0,564 # ffffffffc020f018 <syscalls+0xe20>
ffffffffc0208dec:	e406                	sd	ra,8(sp)
ffffffffc0208dee:	eb0f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208df2 <dev_open>:
ffffffffc0208df2:	03c5f713          	andi	a4,a1,60
ffffffffc0208df6:	eb11                	bnez	a4,ffffffffc0208e0a <dev_open+0x18>
ffffffffc0208df8:	c919                	beqz	a0,ffffffffc0208e0e <dev_open+0x1c>
ffffffffc0208dfa:	4d34                	lw	a3,88(a0)
ffffffffc0208dfc:	6705                	lui	a4,0x1
ffffffffc0208dfe:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208e02:	00e69663          	bne	a3,a4,ffffffffc0208e0e <dev_open+0x1c>
ffffffffc0208e06:	691c                	ld	a5,16(a0)
ffffffffc0208e08:	8782                	jr	a5
ffffffffc0208e0a:	5575                	li	a0,-3
ffffffffc0208e0c:	8082                	ret
ffffffffc0208e0e:	1141                	addi	sp,sp,-16
ffffffffc0208e10:	00006697          	auipc	a3,0x6
ffffffffc0208e14:	ef868693          	addi	a3,a3,-264 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc0208e18:	00003617          	auipc	a2,0x3
ffffffffc0208e1c:	1f860613          	addi	a2,a2,504 # ffffffffc020c010 <commands+0x210>
ffffffffc0208e20:	45c5                	li	a1,17
ffffffffc0208e22:	00006517          	auipc	a0,0x6
ffffffffc0208e26:	1f650513          	addi	a0,a0,502 # ffffffffc020f018 <syscalls+0xe20>
ffffffffc0208e2a:	e406                	sd	ra,8(sp)
ffffffffc0208e2c:	e72f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208e30 <dev_init>:
ffffffffc0208e30:	1141                	addi	sp,sp,-16
ffffffffc0208e32:	e406                	sd	ra,8(sp)
ffffffffc0208e34:	542000ef          	jal	ra,ffffffffc0209376 <dev_init_stdin>
ffffffffc0208e38:	65a000ef          	jal	ra,ffffffffc0209492 <dev_init_stdout>
ffffffffc0208e3c:	60a2                	ld	ra,8(sp)
ffffffffc0208e3e:	0141                	addi	sp,sp,16
ffffffffc0208e40:	a439                	j	ffffffffc020904e <dev_init_disk0>

ffffffffc0208e42 <dev_create_inode>:
ffffffffc0208e42:	6505                	lui	a0,0x1
ffffffffc0208e44:	1141                	addi	sp,sp,-16
ffffffffc0208e46:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208e4a:	e022                	sd	s0,0(sp)
ffffffffc0208e4c:	e406                	sd	ra,8(sp)
ffffffffc0208e4e:	852ff0ef          	jal	ra,ffffffffc0207ea0 <__alloc_inode>
ffffffffc0208e52:	842a                	mv	s0,a0
ffffffffc0208e54:	c901                	beqz	a0,ffffffffc0208e64 <dev_create_inode+0x22>
ffffffffc0208e56:	4601                	li	a2,0
ffffffffc0208e58:	00006597          	auipc	a1,0x6
ffffffffc0208e5c:	1d858593          	addi	a1,a1,472 # ffffffffc020f030 <dev_node_ops>
ffffffffc0208e60:	85cff0ef          	jal	ra,ffffffffc0207ebc <inode_init>
ffffffffc0208e64:	60a2                	ld	ra,8(sp)
ffffffffc0208e66:	8522                	mv	a0,s0
ffffffffc0208e68:	6402                	ld	s0,0(sp)
ffffffffc0208e6a:	0141                	addi	sp,sp,16
ffffffffc0208e6c:	8082                	ret

ffffffffc0208e6e <disk0_open>:
ffffffffc0208e6e:	4501                	li	a0,0
ffffffffc0208e70:	8082                	ret

ffffffffc0208e72 <disk0_close>:
ffffffffc0208e72:	4501                	li	a0,0
ffffffffc0208e74:	8082                	ret

ffffffffc0208e76 <disk0_ioctl>:
ffffffffc0208e76:	5531                	li	a0,-20
ffffffffc0208e78:	8082                	ret

ffffffffc0208e7a <disk0_io>:
ffffffffc0208e7a:	659c                	ld	a5,8(a1)
ffffffffc0208e7c:	7159                	addi	sp,sp,-112
ffffffffc0208e7e:	eca6                	sd	s1,88(sp)
ffffffffc0208e80:	f45e                	sd	s7,40(sp)
ffffffffc0208e82:	6d84                	ld	s1,24(a1)
ffffffffc0208e84:	6b85                	lui	s7,0x1
ffffffffc0208e86:	1bfd                	addi	s7,s7,-1
ffffffffc0208e88:	e4ce                	sd	s3,72(sp)
ffffffffc0208e8a:	43f7d993          	srai	s3,a5,0x3f
ffffffffc0208e8e:	0179f9b3          	and	s3,s3,s7
ffffffffc0208e92:	99be                	add	s3,s3,a5
ffffffffc0208e94:	8fc5                	or	a5,a5,s1
ffffffffc0208e96:	f486                	sd	ra,104(sp)
ffffffffc0208e98:	f0a2                	sd	s0,96(sp)
ffffffffc0208e9a:	e8ca                	sd	s2,80(sp)
ffffffffc0208e9c:	e0d2                	sd	s4,64(sp)
ffffffffc0208e9e:	fc56                	sd	s5,56(sp)
ffffffffc0208ea0:	f85a                	sd	s6,48(sp)
ffffffffc0208ea2:	f062                	sd	s8,32(sp)
ffffffffc0208ea4:	ec66                	sd	s9,24(sp)
ffffffffc0208ea6:	e86a                	sd	s10,16(sp)
ffffffffc0208ea8:	0177f7b3          	and	a5,a5,s7
ffffffffc0208eac:	10079d63          	bnez	a5,ffffffffc0208fc6 <disk0_io+0x14c>
ffffffffc0208eb0:	40c9d993          	srai	s3,s3,0xc
ffffffffc0208eb4:	00c4d713          	srli	a4,s1,0xc
ffffffffc0208eb8:	2981                	sext.w	s3,s3
ffffffffc0208eba:	2701                	sext.w	a4,a4
ffffffffc0208ebc:	00e987bb          	addw	a5,s3,a4
ffffffffc0208ec0:	6114                	ld	a3,0(a0)
ffffffffc0208ec2:	1782                	slli	a5,a5,0x20
ffffffffc0208ec4:	9381                	srli	a5,a5,0x20
ffffffffc0208ec6:	10f6e063          	bltu	a3,a5,ffffffffc0208fc6 <disk0_io+0x14c>
ffffffffc0208eca:	4501                	li	a0,0
ffffffffc0208ecc:	ef19                	bnez	a4,ffffffffc0208eea <disk0_io+0x70>
ffffffffc0208ece:	70a6                	ld	ra,104(sp)
ffffffffc0208ed0:	7406                	ld	s0,96(sp)
ffffffffc0208ed2:	64e6                	ld	s1,88(sp)
ffffffffc0208ed4:	6946                	ld	s2,80(sp)
ffffffffc0208ed6:	69a6                	ld	s3,72(sp)
ffffffffc0208ed8:	6a06                	ld	s4,64(sp)
ffffffffc0208eda:	7ae2                	ld	s5,56(sp)
ffffffffc0208edc:	7b42                	ld	s6,48(sp)
ffffffffc0208ede:	7ba2                	ld	s7,40(sp)
ffffffffc0208ee0:	7c02                	ld	s8,32(sp)
ffffffffc0208ee2:	6ce2                	ld	s9,24(sp)
ffffffffc0208ee4:	6d42                	ld	s10,16(sp)
ffffffffc0208ee6:	6165                	addi	sp,sp,112
ffffffffc0208ee8:	8082                	ret
ffffffffc0208eea:	0008d517          	auipc	a0,0x8d
ffffffffc0208eee:	98650513          	addi	a0,a0,-1658 # ffffffffc0295870 <disk0_sem>
ffffffffc0208ef2:	8b2e                	mv	s6,a1
ffffffffc0208ef4:	8c32                	mv	s8,a2
ffffffffc0208ef6:	0008ea97          	auipc	s5,0x8e
ffffffffc0208efa:	a32a8a93          	addi	s5,s5,-1486 # ffffffffc0296928 <disk0_buffer>
ffffffffc0208efe:	ef6fb0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc0208f02:	6c91                	lui	s9,0x4
ffffffffc0208f04:	e4b9                	bnez	s1,ffffffffc0208f52 <disk0_io+0xd8>
ffffffffc0208f06:	a845                	j	ffffffffc0208fb6 <disk0_io+0x13c>
ffffffffc0208f08:	00c4d413          	srli	s0,s1,0xc
ffffffffc0208f0c:	0034169b          	slliw	a3,s0,0x3
ffffffffc0208f10:	00068d1b          	sext.w	s10,a3
ffffffffc0208f14:	1682                	slli	a3,a3,0x20
ffffffffc0208f16:	2401                	sext.w	s0,s0
ffffffffc0208f18:	9281                	srli	a3,a3,0x20
ffffffffc0208f1a:	8926                	mv	s2,s1
ffffffffc0208f1c:	00399a1b          	slliw	s4,s3,0x3
ffffffffc0208f20:	862e                	mv	a2,a1
ffffffffc0208f22:	4509                	li	a0,2
ffffffffc0208f24:	85d2                	mv	a1,s4
ffffffffc0208f26:	c1bf70ef          	jal	ra,ffffffffc0200b40 <ide_read_secs>
ffffffffc0208f2a:	e165                	bnez	a0,ffffffffc020900a <disk0_io+0x190>
ffffffffc0208f2c:	000ab583          	ld	a1,0(s5)
ffffffffc0208f30:	0038                	addi	a4,sp,8
ffffffffc0208f32:	4685                	li	a3,1
ffffffffc0208f34:	864a                	mv	a2,s2
ffffffffc0208f36:	855a                	mv	a0,s6
ffffffffc0208f38:	d44fc0ef          	jal	ra,ffffffffc020547c <iobuf_move>
ffffffffc0208f3c:	67a2                	ld	a5,8(sp)
ffffffffc0208f3e:	09279663          	bne	a5,s2,ffffffffc0208fca <disk0_io+0x150>
ffffffffc0208f42:	017977b3          	and	a5,s2,s7
ffffffffc0208f46:	e3d1                	bnez	a5,ffffffffc0208fca <disk0_io+0x150>
ffffffffc0208f48:	412484b3          	sub	s1,s1,s2
ffffffffc0208f4c:	013409bb          	addw	s3,s0,s3
ffffffffc0208f50:	c0bd                	beqz	s1,ffffffffc0208fb6 <disk0_io+0x13c>
ffffffffc0208f52:	000ab583          	ld	a1,0(s5)
ffffffffc0208f56:	000c1b63          	bnez	s8,ffffffffc0208f6c <disk0_io+0xf2>
ffffffffc0208f5a:	fb94e7e3          	bltu	s1,s9,ffffffffc0208f08 <disk0_io+0x8e>
ffffffffc0208f5e:	02000693          	li	a3,32
ffffffffc0208f62:	02000d13          	li	s10,32
ffffffffc0208f66:	4411                	li	s0,4
ffffffffc0208f68:	6911                	lui	s2,0x4
ffffffffc0208f6a:	bf4d                	j	ffffffffc0208f1c <disk0_io+0xa2>
ffffffffc0208f6c:	0038                	addi	a4,sp,8
ffffffffc0208f6e:	4681                	li	a3,0
ffffffffc0208f70:	6611                	lui	a2,0x4
ffffffffc0208f72:	855a                	mv	a0,s6
ffffffffc0208f74:	d08fc0ef          	jal	ra,ffffffffc020547c <iobuf_move>
ffffffffc0208f78:	6422                	ld	s0,8(sp)
ffffffffc0208f7a:	c825                	beqz	s0,ffffffffc0208fea <disk0_io+0x170>
ffffffffc0208f7c:	0684e763          	bltu	s1,s0,ffffffffc0208fea <disk0_io+0x170>
ffffffffc0208f80:	017477b3          	and	a5,s0,s7
ffffffffc0208f84:	e3bd                	bnez	a5,ffffffffc0208fea <disk0_io+0x170>
ffffffffc0208f86:	8031                	srli	s0,s0,0xc
ffffffffc0208f88:	0034179b          	slliw	a5,s0,0x3
ffffffffc0208f8c:	000ab603          	ld	a2,0(s5)
ffffffffc0208f90:	0039991b          	slliw	s2,s3,0x3
ffffffffc0208f94:	02079693          	slli	a3,a5,0x20
ffffffffc0208f98:	9281                	srli	a3,a3,0x20
ffffffffc0208f9a:	85ca                	mv	a1,s2
ffffffffc0208f9c:	4509                	li	a0,2
ffffffffc0208f9e:	2401                	sext.w	s0,s0
ffffffffc0208fa0:	00078a1b          	sext.w	s4,a5
ffffffffc0208fa4:	c33f70ef          	jal	ra,ffffffffc0200bd6 <ide_write_secs>
ffffffffc0208fa8:	e151                	bnez	a0,ffffffffc020902c <disk0_io+0x1b2>
ffffffffc0208faa:	6922                	ld	s2,8(sp)
ffffffffc0208fac:	013409bb          	addw	s3,s0,s3
ffffffffc0208fb0:	412484b3          	sub	s1,s1,s2
ffffffffc0208fb4:	fcd9                	bnez	s1,ffffffffc0208f52 <disk0_io+0xd8>
ffffffffc0208fb6:	0008d517          	auipc	a0,0x8d
ffffffffc0208fba:	8ba50513          	addi	a0,a0,-1862 # ffffffffc0295870 <disk0_sem>
ffffffffc0208fbe:	e32fb0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0208fc2:	4501                	li	a0,0
ffffffffc0208fc4:	b729                	j	ffffffffc0208ece <disk0_io+0x54>
ffffffffc0208fc6:	5575                	li	a0,-3
ffffffffc0208fc8:	b719                	j	ffffffffc0208ece <disk0_io+0x54>
ffffffffc0208fca:	00006697          	auipc	a3,0x6
ffffffffc0208fce:	1de68693          	addi	a3,a3,478 # ffffffffc020f1a8 <dev_node_ops+0x178>
ffffffffc0208fd2:	00003617          	auipc	a2,0x3
ffffffffc0208fd6:	03e60613          	addi	a2,a2,62 # ffffffffc020c010 <commands+0x210>
ffffffffc0208fda:	06200593          	li	a1,98
ffffffffc0208fde:	00006517          	auipc	a0,0x6
ffffffffc0208fe2:	11250513          	addi	a0,a0,274 # ffffffffc020f0f0 <dev_node_ops+0xc0>
ffffffffc0208fe6:	cb8f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208fea:	00006697          	auipc	a3,0x6
ffffffffc0208fee:	0c668693          	addi	a3,a3,198 # ffffffffc020f0b0 <dev_node_ops+0x80>
ffffffffc0208ff2:	00003617          	auipc	a2,0x3
ffffffffc0208ff6:	01e60613          	addi	a2,a2,30 # ffffffffc020c010 <commands+0x210>
ffffffffc0208ffa:	05700593          	li	a1,87
ffffffffc0208ffe:	00006517          	auipc	a0,0x6
ffffffffc0209002:	0f250513          	addi	a0,a0,242 # ffffffffc020f0f0 <dev_node_ops+0xc0>
ffffffffc0209006:	c98f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020900a:	88aa                	mv	a7,a0
ffffffffc020900c:	886a                	mv	a6,s10
ffffffffc020900e:	87a2                	mv	a5,s0
ffffffffc0209010:	8752                	mv	a4,s4
ffffffffc0209012:	86ce                	mv	a3,s3
ffffffffc0209014:	00006617          	auipc	a2,0x6
ffffffffc0209018:	14c60613          	addi	a2,a2,332 # ffffffffc020f160 <dev_node_ops+0x130>
ffffffffc020901c:	02d00593          	li	a1,45
ffffffffc0209020:	00006517          	auipc	a0,0x6
ffffffffc0209024:	0d050513          	addi	a0,a0,208 # ffffffffc020f0f0 <dev_node_ops+0xc0>
ffffffffc0209028:	c76f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020902c:	88aa                	mv	a7,a0
ffffffffc020902e:	8852                	mv	a6,s4
ffffffffc0209030:	87a2                	mv	a5,s0
ffffffffc0209032:	874a                	mv	a4,s2
ffffffffc0209034:	86ce                	mv	a3,s3
ffffffffc0209036:	00006617          	auipc	a2,0x6
ffffffffc020903a:	0da60613          	addi	a2,a2,218 # ffffffffc020f110 <dev_node_ops+0xe0>
ffffffffc020903e:	03700593          	li	a1,55
ffffffffc0209042:	00006517          	auipc	a0,0x6
ffffffffc0209046:	0ae50513          	addi	a0,a0,174 # ffffffffc020f0f0 <dev_node_ops+0xc0>
ffffffffc020904a:	c54f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020904e <dev_init_disk0>:
ffffffffc020904e:	1101                	addi	sp,sp,-32
ffffffffc0209050:	ec06                	sd	ra,24(sp)
ffffffffc0209052:	e822                	sd	s0,16(sp)
ffffffffc0209054:	e426                	sd	s1,8(sp)
ffffffffc0209056:	dedff0ef          	jal	ra,ffffffffc0208e42 <dev_create_inode>
ffffffffc020905a:	c541                	beqz	a0,ffffffffc02090e2 <dev_init_disk0+0x94>
ffffffffc020905c:	4d38                	lw	a4,88(a0)
ffffffffc020905e:	6485                	lui	s1,0x1
ffffffffc0209060:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0209064:	842a                	mv	s0,a0
ffffffffc0209066:	0cf71f63          	bne	a4,a5,ffffffffc0209144 <dev_init_disk0+0xf6>
ffffffffc020906a:	4509                	li	a0,2
ffffffffc020906c:	a89f70ef          	jal	ra,ffffffffc0200af4 <ide_device_valid>
ffffffffc0209070:	cd55                	beqz	a0,ffffffffc020912c <dev_init_disk0+0xde>
ffffffffc0209072:	4509                	li	a0,2
ffffffffc0209074:	aa5f70ef          	jal	ra,ffffffffc0200b18 <ide_device_size>
ffffffffc0209078:	00355793          	srli	a5,a0,0x3
ffffffffc020907c:	e01c                	sd	a5,0(s0)
ffffffffc020907e:	00000797          	auipc	a5,0x0
ffffffffc0209082:	df078793          	addi	a5,a5,-528 # ffffffffc0208e6e <disk0_open>
ffffffffc0209086:	e81c                	sd	a5,16(s0)
ffffffffc0209088:	00000797          	auipc	a5,0x0
ffffffffc020908c:	dea78793          	addi	a5,a5,-534 # ffffffffc0208e72 <disk0_close>
ffffffffc0209090:	ec1c                	sd	a5,24(s0)
ffffffffc0209092:	00000797          	auipc	a5,0x0
ffffffffc0209096:	de878793          	addi	a5,a5,-536 # ffffffffc0208e7a <disk0_io>
ffffffffc020909a:	f01c                	sd	a5,32(s0)
ffffffffc020909c:	00000797          	auipc	a5,0x0
ffffffffc02090a0:	dda78793          	addi	a5,a5,-550 # ffffffffc0208e76 <disk0_ioctl>
ffffffffc02090a4:	f41c                	sd	a5,40(s0)
ffffffffc02090a6:	4585                	li	a1,1
ffffffffc02090a8:	0008c517          	auipc	a0,0x8c
ffffffffc02090ac:	7c850513          	addi	a0,a0,1992 # ffffffffc0295870 <disk0_sem>
ffffffffc02090b0:	e404                	sd	s1,8(s0)
ffffffffc02090b2:	d38fb0ef          	jal	ra,ffffffffc02045ea <sem_init>
ffffffffc02090b6:	6511                	lui	a0,0x4
ffffffffc02090b8:	f63f80ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc02090bc:	0008e797          	auipc	a5,0x8e
ffffffffc02090c0:	86a7b623          	sd	a0,-1940(a5) # ffffffffc0296928 <disk0_buffer>
ffffffffc02090c4:	c921                	beqz	a0,ffffffffc0209114 <dev_init_disk0+0xc6>
ffffffffc02090c6:	4605                	li	a2,1
ffffffffc02090c8:	85a2                	mv	a1,s0
ffffffffc02090ca:	00006517          	auipc	a0,0x6
ffffffffc02090ce:	16e50513          	addi	a0,a0,366 # ffffffffc020f238 <dev_node_ops+0x208>
ffffffffc02090d2:	c2cff0ef          	jal	ra,ffffffffc02084fe <vfs_add_dev>
ffffffffc02090d6:	e115                	bnez	a0,ffffffffc02090fa <dev_init_disk0+0xac>
ffffffffc02090d8:	60e2                	ld	ra,24(sp)
ffffffffc02090da:	6442                	ld	s0,16(sp)
ffffffffc02090dc:	64a2                	ld	s1,8(sp)
ffffffffc02090de:	6105                	addi	sp,sp,32
ffffffffc02090e0:	8082                	ret
ffffffffc02090e2:	00006617          	auipc	a2,0x6
ffffffffc02090e6:	0f660613          	addi	a2,a2,246 # ffffffffc020f1d8 <dev_node_ops+0x1a8>
ffffffffc02090ea:	08700593          	li	a1,135
ffffffffc02090ee:	00006517          	auipc	a0,0x6
ffffffffc02090f2:	00250513          	addi	a0,a0,2 # ffffffffc020f0f0 <dev_node_ops+0xc0>
ffffffffc02090f6:	ba8f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02090fa:	86aa                	mv	a3,a0
ffffffffc02090fc:	00006617          	auipc	a2,0x6
ffffffffc0209100:	14460613          	addi	a2,a2,324 # ffffffffc020f240 <dev_node_ops+0x210>
ffffffffc0209104:	08d00593          	li	a1,141
ffffffffc0209108:	00006517          	auipc	a0,0x6
ffffffffc020910c:	fe850513          	addi	a0,a0,-24 # ffffffffc020f0f0 <dev_node_ops+0xc0>
ffffffffc0209110:	b8ef70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209114:	00006617          	auipc	a2,0x6
ffffffffc0209118:	10460613          	addi	a2,a2,260 # ffffffffc020f218 <dev_node_ops+0x1e8>
ffffffffc020911c:	07f00593          	li	a1,127
ffffffffc0209120:	00006517          	auipc	a0,0x6
ffffffffc0209124:	fd050513          	addi	a0,a0,-48 # ffffffffc020f0f0 <dev_node_ops+0xc0>
ffffffffc0209128:	b76f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020912c:	00006617          	auipc	a2,0x6
ffffffffc0209130:	0cc60613          	addi	a2,a2,204 # ffffffffc020f1f8 <dev_node_ops+0x1c8>
ffffffffc0209134:	07300593          	li	a1,115
ffffffffc0209138:	00006517          	auipc	a0,0x6
ffffffffc020913c:	fb850513          	addi	a0,a0,-72 # ffffffffc020f0f0 <dev_node_ops+0xc0>
ffffffffc0209140:	b5ef70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209144:	00006697          	auipc	a3,0x6
ffffffffc0209148:	bc468693          	addi	a3,a3,-1084 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc020914c:	00003617          	auipc	a2,0x3
ffffffffc0209150:	ec460613          	addi	a2,a2,-316 # ffffffffc020c010 <commands+0x210>
ffffffffc0209154:	08900593          	li	a1,137
ffffffffc0209158:	00006517          	auipc	a0,0x6
ffffffffc020915c:	f9850513          	addi	a0,a0,-104 # ffffffffc020f0f0 <dev_node_ops+0xc0>
ffffffffc0209160:	b3ef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209164 <stdin_open>:
ffffffffc0209164:	4501                	li	a0,0
ffffffffc0209166:	e191                	bnez	a1,ffffffffc020916a <stdin_open+0x6>
ffffffffc0209168:	8082                	ret
ffffffffc020916a:	5575                	li	a0,-3
ffffffffc020916c:	8082                	ret

ffffffffc020916e <stdin_close>:
ffffffffc020916e:	4501                	li	a0,0
ffffffffc0209170:	8082                	ret

ffffffffc0209172 <stdin_ioctl>:
ffffffffc0209172:	5575                	li	a0,-3
ffffffffc0209174:	8082                	ret

ffffffffc0209176 <stdin_io>:
ffffffffc0209176:	7135                	addi	sp,sp,-160
ffffffffc0209178:	ed06                	sd	ra,152(sp)
ffffffffc020917a:	e922                	sd	s0,144(sp)
ffffffffc020917c:	e526                	sd	s1,136(sp)
ffffffffc020917e:	e14a                	sd	s2,128(sp)
ffffffffc0209180:	fcce                	sd	s3,120(sp)
ffffffffc0209182:	f8d2                	sd	s4,112(sp)
ffffffffc0209184:	f4d6                	sd	s5,104(sp)
ffffffffc0209186:	f0da                	sd	s6,96(sp)
ffffffffc0209188:	ecde                	sd	s7,88(sp)
ffffffffc020918a:	e8e2                	sd	s8,80(sp)
ffffffffc020918c:	e4e6                	sd	s9,72(sp)
ffffffffc020918e:	e0ea                	sd	s10,64(sp)
ffffffffc0209190:	fc6e                	sd	s11,56(sp)
ffffffffc0209192:	14061163          	bnez	a2,ffffffffc02092d4 <stdin_io+0x15e>
ffffffffc0209196:	0005bd83          	ld	s11,0(a1)
ffffffffc020919a:	0185bd03          	ld	s10,24(a1)
ffffffffc020919e:	8b2e                	mv	s6,a1
ffffffffc02091a0:	100027f3          	csrr	a5,sstatus
ffffffffc02091a4:	8b89                	andi	a5,a5,2
ffffffffc02091a6:	10079e63          	bnez	a5,ffffffffc02092c2 <stdin_io+0x14c>
ffffffffc02091aa:	4401                	li	s0,0
ffffffffc02091ac:	100d0963          	beqz	s10,ffffffffc02092be <stdin_io+0x148>
ffffffffc02091b0:	0008d997          	auipc	s3,0x8d
ffffffffc02091b4:	78098993          	addi	s3,s3,1920 # ffffffffc0296930 <p_rpos>
ffffffffc02091b8:	0009b783          	ld	a5,0(s3)
ffffffffc02091bc:	800004b7          	lui	s1,0x80000
ffffffffc02091c0:	6c85                	lui	s9,0x1
ffffffffc02091c2:	4a81                	li	s5,0
ffffffffc02091c4:	0008da17          	auipc	s4,0x8d
ffffffffc02091c8:	774a0a13          	addi	s4,s4,1908 # ffffffffc0296938 <p_wpos>
ffffffffc02091cc:	0491                	addi	s1,s1,4
ffffffffc02091ce:	0008c917          	auipc	s2,0x8c
ffffffffc02091d2:	6ba90913          	addi	s2,s2,1722 # ffffffffc0295888 <__wait_queue>
ffffffffc02091d6:	1cfd                	addi	s9,s9,-1
ffffffffc02091d8:	000a3703          	ld	a4,0(s4)
ffffffffc02091dc:	000a8c1b          	sext.w	s8,s5
ffffffffc02091e0:	8be2                	mv	s7,s8
ffffffffc02091e2:	02e7d763          	bge	a5,a4,ffffffffc0209210 <stdin_io+0x9a>
ffffffffc02091e6:	a859                	j	ffffffffc020927c <stdin_io+0x106>
ffffffffc02091e8:	815fe0ef          	jal	ra,ffffffffc02079fc <schedule>
ffffffffc02091ec:	100027f3          	csrr	a5,sstatus
ffffffffc02091f0:	8b89                	andi	a5,a5,2
ffffffffc02091f2:	4401                	li	s0,0
ffffffffc02091f4:	ef8d                	bnez	a5,ffffffffc020922e <stdin_io+0xb8>
ffffffffc02091f6:	0028                	addi	a0,sp,8
ffffffffc02091f8:	c8efb0ef          	jal	ra,ffffffffc0204686 <wait_in_queue>
ffffffffc02091fc:	e121                	bnez	a0,ffffffffc020923c <stdin_io+0xc6>
ffffffffc02091fe:	47c2                	lw	a5,16(sp)
ffffffffc0209200:	04979563          	bne	a5,s1,ffffffffc020924a <stdin_io+0xd4>
ffffffffc0209204:	0009b783          	ld	a5,0(s3)
ffffffffc0209208:	000a3703          	ld	a4,0(s4)
ffffffffc020920c:	06e7c863          	blt	a5,a4,ffffffffc020927c <stdin_io+0x106>
ffffffffc0209210:	8626                	mv	a2,s1
ffffffffc0209212:	002c                	addi	a1,sp,8
ffffffffc0209214:	854a                	mv	a0,s2
ffffffffc0209216:	d9afb0ef          	jal	ra,ffffffffc02047b0 <wait_current_set>
ffffffffc020921a:	d479                	beqz	s0,ffffffffc02091e8 <stdin_io+0x72>
ffffffffc020921c:	a51f70ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0209220:	fdcfe0ef          	jal	ra,ffffffffc02079fc <schedule>
ffffffffc0209224:	100027f3          	csrr	a5,sstatus
ffffffffc0209228:	8b89                	andi	a5,a5,2
ffffffffc020922a:	4401                	li	s0,0
ffffffffc020922c:	d7e9                	beqz	a5,ffffffffc02091f6 <stdin_io+0x80>
ffffffffc020922e:	a45f70ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0209232:	0028                	addi	a0,sp,8
ffffffffc0209234:	4405                	li	s0,1
ffffffffc0209236:	c50fb0ef          	jal	ra,ffffffffc0204686 <wait_in_queue>
ffffffffc020923a:	d171                	beqz	a0,ffffffffc02091fe <stdin_io+0x88>
ffffffffc020923c:	002c                	addi	a1,sp,8
ffffffffc020923e:	854a                	mv	a0,s2
ffffffffc0209240:	becfb0ef          	jal	ra,ffffffffc020462c <wait_queue_del>
ffffffffc0209244:	47c2                	lw	a5,16(sp)
ffffffffc0209246:	fa978fe3          	beq	a5,s1,ffffffffc0209204 <stdin_io+0x8e>
ffffffffc020924a:	e435                	bnez	s0,ffffffffc02092b6 <stdin_io+0x140>
ffffffffc020924c:	060b8963          	beqz	s7,ffffffffc02092be <stdin_io+0x148>
ffffffffc0209250:	018b3783          	ld	a5,24(s6)
ffffffffc0209254:	41578ab3          	sub	s5,a5,s5
ffffffffc0209258:	015b3c23          	sd	s5,24(s6)
ffffffffc020925c:	60ea                	ld	ra,152(sp)
ffffffffc020925e:	644a                	ld	s0,144(sp)
ffffffffc0209260:	64aa                	ld	s1,136(sp)
ffffffffc0209262:	690a                	ld	s2,128(sp)
ffffffffc0209264:	79e6                	ld	s3,120(sp)
ffffffffc0209266:	7a46                	ld	s4,112(sp)
ffffffffc0209268:	7aa6                	ld	s5,104(sp)
ffffffffc020926a:	7b06                	ld	s6,96(sp)
ffffffffc020926c:	6c46                	ld	s8,80(sp)
ffffffffc020926e:	6ca6                	ld	s9,72(sp)
ffffffffc0209270:	6d06                	ld	s10,64(sp)
ffffffffc0209272:	7de2                	ld	s11,56(sp)
ffffffffc0209274:	855e                	mv	a0,s7
ffffffffc0209276:	6be6                	ld	s7,88(sp)
ffffffffc0209278:	610d                	addi	sp,sp,160
ffffffffc020927a:	8082                	ret
ffffffffc020927c:	43f7d713          	srai	a4,a5,0x3f
ffffffffc0209280:	03475693          	srli	a3,a4,0x34
ffffffffc0209284:	00d78733          	add	a4,a5,a3
ffffffffc0209288:	01977733          	and	a4,a4,s9
ffffffffc020928c:	8f15                	sub	a4,a4,a3
ffffffffc020928e:	0008c697          	auipc	a3,0x8c
ffffffffc0209292:	60a68693          	addi	a3,a3,1546 # ffffffffc0295898 <stdin_buffer>
ffffffffc0209296:	9736                	add	a4,a4,a3
ffffffffc0209298:	00074683          	lbu	a3,0(a4)
ffffffffc020929c:	0785                	addi	a5,a5,1
ffffffffc020929e:	015d8733          	add	a4,s11,s5
ffffffffc02092a2:	00d70023          	sb	a3,0(a4)
ffffffffc02092a6:	00f9b023          	sd	a5,0(s3)
ffffffffc02092aa:	0a85                	addi	s5,s5,1
ffffffffc02092ac:	001c0b9b          	addiw	s7,s8,1
ffffffffc02092b0:	f3aae4e3          	bltu	s5,s10,ffffffffc02091d8 <stdin_io+0x62>
ffffffffc02092b4:	dc51                	beqz	s0,ffffffffc0209250 <stdin_io+0xda>
ffffffffc02092b6:	9b7f70ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02092ba:	f80b9be3          	bnez	s7,ffffffffc0209250 <stdin_io+0xda>
ffffffffc02092be:	4b81                	li	s7,0
ffffffffc02092c0:	bf71                	j	ffffffffc020925c <stdin_io+0xe6>
ffffffffc02092c2:	9b1f70ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02092c6:	4405                	li	s0,1
ffffffffc02092c8:	ee0d14e3          	bnez	s10,ffffffffc02091b0 <stdin_io+0x3a>
ffffffffc02092cc:	9a1f70ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02092d0:	4b81                	li	s7,0
ffffffffc02092d2:	b769                	j	ffffffffc020925c <stdin_io+0xe6>
ffffffffc02092d4:	5bf5                	li	s7,-3
ffffffffc02092d6:	b759                	j	ffffffffc020925c <stdin_io+0xe6>

ffffffffc02092d8 <dev_stdin_write>:
ffffffffc02092d8:	e111                	bnez	a0,ffffffffc02092dc <dev_stdin_write+0x4>
ffffffffc02092da:	8082                	ret
ffffffffc02092dc:	1101                	addi	sp,sp,-32
ffffffffc02092de:	e822                	sd	s0,16(sp)
ffffffffc02092e0:	ec06                	sd	ra,24(sp)
ffffffffc02092e2:	e426                	sd	s1,8(sp)
ffffffffc02092e4:	842a                	mv	s0,a0
ffffffffc02092e6:	100027f3          	csrr	a5,sstatus
ffffffffc02092ea:	8b89                	andi	a5,a5,2
ffffffffc02092ec:	4481                	li	s1,0
ffffffffc02092ee:	e3c1                	bnez	a5,ffffffffc020936e <dev_stdin_write+0x96>
ffffffffc02092f0:	0008d597          	auipc	a1,0x8d
ffffffffc02092f4:	64858593          	addi	a1,a1,1608 # ffffffffc0296938 <p_wpos>
ffffffffc02092f8:	6198                	ld	a4,0(a1)
ffffffffc02092fa:	6605                	lui	a2,0x1
ffffffffc02092fc:	fff60513          	addi	a0,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0209300:	43f75693          	srai	a3,a4,0x3f
ffffffffc0209304:	92d1                	srli	a3,a3,0x34
ffffffffc0209306:	00d707b3          	add	a5,a4,a3
ffffffffc020930a:	8fe9                	and	a5,a5,a0
ffffffffc020930c:	8f95                	sub	a5,a5,a3
ffffffffc020930e:	0008c697          	auipc	a3,0x8c
ffffffffc0209312:	58a68693          	addi	a3,a3,1418 # ffffffffc0295898 <stdin_buffer>
ffffffffc0209316:	97b6                	add	a5,a5,a3
ffffffffc0209318:	00878023          	sb	s0,0(a5)
ffffffffc020931c:	0008d797          	auipc	a5,0x8d
ffffffffc0209320:	6147b783          	ld	a5,1556(a5) # ffffffffc0296930 <p_rpos>
ffffffffc0209324:	40f707b3          	sub	a5,a4,a5
ffffffffc0209328:	00c7d463          	bge	a5,a2,ffffffffc0209330 <dev_stdin_write+0x58>
ffffffffc020932c:	0705                	addi	a4,a4,1
ffffffffc020932e:	e198                	sd	a4,0(a1)
ffffffffc0209330:	0008c517          	auipc	a0,0x8c
ffffffffc0209334:	55850513          	addi	a0,a0,1368 # ffffffffc0295888 <__wait_queue>
ffffffffc0209338:	b42fb0ef          	jal	ra,ffffffffc020467a <wait_queue_empty>
ffffffffc020933c:	cd09                	beqz	a0,ffffffffc0209356 <dev_stdin_write+0x7e>
ffffffffc020933e:	e491                	bnez	s1,ffffffffc020934a <dev_stdin_write+0x72>
ffffffffc0209340:	60e2                	ld	ra,24(sp)
ffffffffc0209342:	6442                	ld	s0,16(sp)
ffffffffc0209344:	64a2                	ld	s1,8(sp)
ffffffffc0209346:	6105                	addi	sp,sp,32
ffffffffc0209348:	8082                	ret
ffffffffc020934a:	6442                	ld	s0,16(sp)
ffffffffc020934c:	60e2                	ld	ra,24(sp)
ffffffffc020934e:	64a2                	ld	s1,8(sp)
ffffffffc0209350:	6105                	addi	sp,sp,32
ffffffffc0209352:	91bf706f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0209356:	800005b7          	lui	a1,0x80000
ffffffffc020935a:	4605                	li	a2,1
ffffffffc020935c:	0591                	addi	a1,a1,4
ffffffffc020935e:	0008c517          	auipc	a0,0x8c
ffffffffc0209362:	52a50513          	addi	a0,a0,1322 # ffffffffc0295888 <__wait_queue>
ffffffffc0209366:	b7cfb0ef          	jal	ra,ffffffffc02046e2 <wakeup_queue>
ffffffffc020936a:	d8f9                	beqz	s1,ffffffffc0209340 <dev_stdin_write+0x68>
ffffffffc020936c:	bff9                	j	ffffffffc020934a <dev_stdin_write+0x72>
ffffffffc020936e:	905f70ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0209372:	4485                	li	s1,1
ffffffffc0209374:	bfb5                	j	ffffffffc02092f0 <dev_stdin_write+0x18>

ffffffffc0209376 <dev_init_stdin>:
ffffffffc0209376:	1141                	addi	sp,sp,-16
ffffffffc0209378:	e406                	sd	ra,8(sp)
ffffffffc020937a:	e022                	sd	s0,0(sp)
ffffffffc020937c:	ac7ff0ef          	jal	ra,ffffffffc0208e42 <dev_create_inode>
ffffffffc0209380:	c93d                	beqz	a0,ffffffffc02093f6 <dev_init_stdin+0x80>
ffffffffc0209382:	4d38                	lw	a4,88(a0)
ffffffffc0209384:	6785                	lui	a5,0x1
ffffffffc0209386:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020938a:	842a                	mv	s0,a0
ffffffffc020938c:	08f71e63          	bne	a4,a5,ffffffffc0209428 <dev_init_stdin+0xb2>
ffffffffc0209390:	4785                	li	a5,1
ffffffffc0209392:	e41c                	sd	a5,8(s0)
ffffffffc0209394:	00000797          	auipc	a5,0x0
ffffffffc0209398:	dd078793          	addi	a5,a5,-560 # ffffffffc0209164 <stdin_open>
ffffffffc020939c:	e81c                	sd	a5,16(s0)
ffffffffc020939e:	00000797          	auipc	a5,0x0
ffffffffc02093a2:	dd078793          	addi	a5,a5,-560 # ffffffffc020916e <stdin_close>
ffffffffc02093a6:	ec1c                	sd	a5,24(s0)
ffffffffc02093a8:	00000797          	auipc	a5,0x0
ffffffffc02093ac:	dce78793          	addi	a5,a5,-562 # ffffffffc0209176 <stdin_io>
ffffffffc02093b0:	f01c                	sd	a5,32(s0)
ffffffffc02093b2:	00000797          	auipc	a5,0x0
ffffffffc02093b6:	dc078793          	addi	a5,a5,-576 # ffffffffc0209172 <stdin_ioctl>
ffffffffc02093ba:	f41c                	sd	a5,40(s0)
ffffffffc02093bc:	0008c517          	auipc	a0,0x8c
ffffffffc02093c0:	4cc50513          	addi	a0,a0,1228 # ffffffffc0295888 <__wait_queue>
ffffffffc02093c4:	00043023          	sd	zero,0(s0)
ffffffffc02093c8:	0008d797          	auipc	a5,0x8d
ffffffffc02093cc:	5607b823          	sd	zero,1392(a5) # ffffffffc0296938 <p_wpos>
ffffffffc02093d0:	0008d797          	auipc	a5,0x8d
ffffffffc02093d4:	5607b023          	sd	zero,1376(a5) # ffffffffc0296930 <p_rpos>
ffffffffc02093d8:	a4efb0ef          	jal	ra,ffffffffc0204626 <wait_queue_init>
ffffffffc02093dc:	4601                	li	a2,0
ffffffffc02093de:	85a2                	mv	a1,s0
ffffffffc02093e0:	00006517          	auipc	a0,0x6
ffffffffc02093e4:	ec050513          	addi	a0,a0,-320 # ffffffffc020f2a0 <dev_node_ops+0x270>
ffffffffc02093e8:	916ff0ef          	jal	ra,ffffffffc02084fe <vfs_add_dev>
ffffffffc02093ec:	e10d                	bnez	a0,ffffffffc020940e <dev_init_stdin+0x98>
ffffffffc02093ee:	60a2                	ld	ra,8(sp)
ffffffffc02093f0:	6402                	ld	s0,0(sp)
ffffffffc02093f2:	0141                	addi	sp,sp,16
ffffffffc02093f4:	8082                	ret
ffffffffc02093f6:	00006617          	auipc	a2,0x6
ffffffffc02093fa:	e6a60613          	addi	a2,a2,-406 # ffffffffc020f260 <dev_node_ops+0x230>
ffffffffc02093fe:	07500593          	li	a1,117
ffffffffc0209402:	00006517          	auipc	a0,0x6
ffffffffc0209406:	e7e50513          	addi	a0,a0,-386 # ffffffffc020f280 <dev_node_ops+0x250>
ffffffffc020940a:	894f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020940e:	86aa                	mv	a3,a0
ffffffffc0209410:	00006617          	auipc	a2,0x6
ffffffffc0209414:	e9860613          	addi	a2,a2,-360 # ffffffffc020f2a8 <dev_node_ops+0x278>
ffffffffc0209418:	07b00593          	li	a1,123
ffffffffc020941c:	00006517          	auipc	a0,0x6
ffffffffc0209420:	e6450513          	addi	a0,a0,-412 # ffffffffc020f280 <dev_node_ops+0x250>
ffffffffc0209424:	87af70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209428:	00006697          	auipc	a3,0x6
ffffffffc020942c:	8e068693          	addi	a3,a3,-1824 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc0209430:	00003617          	auipc	a2,0x3
ffffffffc0209434:	be060613          	addi	a2,a2,-1056 # ffffffffc020c010 <commands+0x210>
ffffffffc0209438:	07700593          	li	a1,119
ffffffffc020943c:	00006517          	auipc	a0,0x6
ffffffffc0209440:	e4450513          	addi	a0,a0,-444 # ffffffffc020f280 <dev_node_ops+0x250>
ffffffffc0209444:	85af70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209448 <stdout_open>:
ffffffffc0209448:	4785                	li	a5,1
ffffffffc020944a:	4501                	li	a0,0
ffffffffc020944c:	00f59363          	bne	a1,a5,ffffffffc0209452 <stdout_open+0xa>
ffffffffc0209450:	8082                	ret
ffffffffc0209452:	5575                	li	a0,-3
ffffffffc0209454:	8082                	ret

ffffffffc0209456 <stdout_close>:
ffffffffc0209456:	4501                	li	a0,0
ffffffffc0209458:	8082                	ret

ffffffffc020945a <stdout_ioctl>:
ffffffffc020945a:	5575                	li	a0,-3
ffffffffc020945c:	8082                	ret

ffffffffc020945e <stdout_io>:
ffffffffc020945e:	ca05                	beqz	a2,ffffffffc020948e <stdout_io+0x30>
ffffffffc0209460:	6d9c                	ld	a5,24(a1)
ffffffffc0209462:	1101                	addi	sp,sp,-32
ffffffffc0209464:	e822                	sd	s0,16(sp)
ffffffffc0209466:	e426                	sd	s1,8(sp)
ffffffffc0209468:	ec06                	sd	ra,24(sp)
ffffffffc020946a:	6180                	ld	s0,0(a1)
ffffffffc020946c:	84ae                	mv	s1,a1
ffffffffc020946e:	cb91                	beqz	a5,ffffffffc0209482 <stdout_io+0x24>
ffffffffc0209470:	00044503          	lbu	a0,0(s0)
ffffffffc0209474:	0405                	addi	s0,s0,1
ffffffffc0209476:	d6df60ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc020947a:	6c9c                	ld	a5,24(s1)
ffffffffc020947c:	17fd                	addi	a5,a5,-1
ffffffffc020947e:	ec9c                	sd	a5,24(s1)
ffffffffc0209480:	fbe5                	bnez	a5,ffffffffc0209470 <stdout_io+0x12>
ffffffffc0209482:	60e2                	ld	ra,24(sp)
ffffffffc0209484:	6442                	ld	s0,16(sp)
ffffffffc0209486:	64a2                	ld	s1,8(sp)
ffffffffc0209488:	4501                	li	a0,0
ffffffffc020948a:	6105                	addi	sp,sp,32
ffffffffc020948c:	8082                	ret
ffffffffc020948e:	5575                	li	a0,-3
ffffffffc0209490:	8082                	ret

ffffffffc0209492 <dev_init_stdout>:
ffffffffc0209492:	1141                	addi	sp,sp,-16
ffffffffc0209494:	e406                	sd	ra,8(sp)
ffffffffc0209496:	9adff0ef          	jal	ra,ffffffffc0208e42 <dev_create_inode>
ffffffffc020949a:	c939                	beqz	a0,ffffffffc02094f0 <dev_init_stdout+0x5e>
ffffffffc020949c:	4d38                	lw	a4,88(a0)
ffffffffc020949e:	6785                	lui	a5,0x1
ffffffffc02094a0:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02094a4:	85aa                	mv	a1,a0
ffffffffc02094a6:	06f71e63          	bne	a4,a5,ffffffffc0209522 <dev_init_stdout+0x90>
ffffffffc02094aa:	4785                	li	a5,1
ffffffffc02094ac:	e51c                	sd	a5,8(a0)
ffffffffc02094ae:	00000797          	auipc	a5,0x0
ffffffffc02094b2:	f9a78793          	addi	a5,a5,-102 # ffffffffc0209448 <stdout_open>
ffffffffc02094b6:	e91c                	sd	a5,16(a0)
ffffffffc02094b8:	00000797          	auipc	a5,0x0
ffffffffc02094bc:	f9e78793          	addi	a5,a5,-98 # ffffffffc0209456 <stdout_close>
ffffffffc02094c0:	ed1c                	sd	a5,24(a0)
ffffffffc02094c2:	00000797          	auipc	a5,0x0
ffffffffc02094c6:	f9c78793          	addi	a5,a5,-100 # ffffffffc020945e <stdout_io>
ffffffffc02094ca:	f11c                	sd	a5,32(a0)
ffffffffc02094cc:	00000797          	auipc	a5,0x0
ffffffffc02094d0:	f8e78793          	addi	a5,a5,-114 # ffffffffc020945a <stdout_ioctl>
ffffffffc02094d4:	00053023          	sd	zero,0(a0)
ffffffffc02094d8:	f51c                	sd	a5,40(a0)
ffffffffc02094da:	4601                	li	a2,0
ffffffffc02094dc:	00006517          	auipc	a0,0x6
ffffffffc02094e0:	e2c50513          	addi	a0,a0,-468 # ffffffffc020f308 <dev_node_ops+0x2d8>
ffffffffc02094e4:	81aff0ef          	jal	ra,ffffffffc02084fe <vfs_add_dev>
ffffffffc02094e8:	e105                	bnez	a0,ffffffffc0209508 <dev_init_stdout+0x76>
ffffffffc02094ea:	60a2                	ld	ra,8(sp)
ffffffffc02094ec:	0141                	addi	sp,sp,16
ffffffffc02094ee:	8082                	ret
ffffffffc02094f0:	00006617          	auipc	a2,0x6
ffffffffc02094f4:	dd860613          	addi	a2,a2,-552 # ffffffffc020f2c8 <dev_node_ops+0x298>
ffffffffc02094f8:	03700593          	li	a1,55
ffffffffc02094fc:	00006517          	auipc	a0,0x6
ffffffffc0209500:	dec50513          	addi	a0,a0,-532 # ffffffffc020f2e8 <dev_node_ops+0x2b8>
ffffffffc0209504:	f9bf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209508:	86aa                	mv	a3,a0
ffffffffc020950a:	00006617          	auipc	a2,0x6
ffffffffc020950e:	e0660613          	addi	a2,a2,-506 # ffffffffc020f310 <dev_node_ops+0x2e0>
ffffffffc0209512:	03d00593          	li	a1,61
ffffffffc0209516:	00006517          	auipc	a0,0x6
ffffffffc020951a:	dd250513          	addi	a0,a0,-558 # ffffffffc020f2e8 <dev_node_ops+0x2b8>
ffffffffc020951e:	f81f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209522:	00005697          	auipc	a3,0x5
ffffffffc0209526:	7e668693          	addi	a3,a3,2022 # ffffffffc020ed08 <syscalls+0xb10>
ffffffffc020952a:	00003617          	auipc	a2,0x3
ffffffffc020952e:	ae660613          	addi	a2,a2,-1306 # ffffffffc020c010 <commands+0x210>
ffffffffc0209532:	03900593          	li	a1,57
ffffffffc0209536:	00006517          	auipc	a0,0x6
ffffffffc020953a:	db250513          	addi	a0,a0,-590 # ffffffffc020f2e8 <dev_node_ops+0x2b8>
ffffffffc020953e:	f61f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209542 <bitmap_translate.part.0>:
ffffffffc0209542:	1141                	addi	sp,sp,-16
ffffffffc0209544:	00006697          	auipc	a3,0x6
ffffffffc0209548:	dec68693          	addi	a3,a3,-532 # ffffffffc020f330 <dev_node_ops+0x300>
ffffffffc020954c:	00003617          	auipc	a2,0x3
ffffffffc0209550:	ac460613          	addi	a2,a2,-1340 # ffffffffc020c010 <commands+0x210>
ffffffffc0209554:	04c00593          	li	a1,76
ffffffffc0209558:	00006517          	auipc	a0,0x6
ffffffffc020955c:	df050513          	addi	a0,a0,-528 # ffffffffc020f348 <dev_node_ops+0x318>
ffffffffc0209560:	e406                	sd	ra,8(sp)
ffffffffc0209562:	f3df60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209566 <bitmap_create>:
ffffffffc0209566:	7139                	addi	sp,sp,-64
ffffffffc0209568:	fc06                	sd	ra,56(sp)
ffffffffc020956a:	f822                	sd	s0,48(sp)
ffffffffc020956c:	f426                	sd	s1,40(sp)
ffffffffc020956e:	f04a                	sd	s2,32(sp)
ffffffffc0209570:	ec4e                	sd	s3,24(sp)
ffffffffc0209572:	e852                	sd	s4,16(sp)
ffffffffc0209574:	e456                	sd	s5,8(sp)
ffffffffc0209576:	c14d                	beqz	a0,ffffffffc0209618 <bitmap_create+0xb2>
ffffffffc0209578:	842a                	mv	s0,a0
ffffffffc020957a:	4541                	li	a0,16
ffffffffc020957c:	a9ff80ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0209580:	84aa                	mv	s1,a0
ffffffffc0209582:	cd25                	beqz	a0,ffffffffc02095fa <bitmap_create+0x94>
ffffffffc0209584:	02041a13          	slli	s4,s0,0x20
ffffffffc0209588:	020a5a13          	srli	s4,s4,0x20
ffffffffc020958c:	01fa0793          	addi	a5,s4,31
ffffffffc0209590:	0057d993          	srli	s3,a5,0x5
ffffffffc0209594:	00299a93          	slli	s5,s3,0x2
ffffffffc0209598:	8556                	mv	a0,s5
ffffffffc020959a:	894e                	mv	s2,s3
ffffffffc020959c:	a7ff80ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc02095a0:	c53d                	beqz	a0,ffffffffc020960e <bitmap_create+0xa8>
ffffffffc02095a2:	0134a223          	sw	s3,4(s1) # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc02095a6:	c080                	sw	s0,0(s1)
ffffffffc02095a8:	8656                	mv	a2,s5
ffffffffc02095aa:	0ff00593          	li	a1,255
ffffffffc02095ae:	57c020ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc02095b2:	e488                	sd	a0,8(s1)
ffffffffc02095b4:	0996                	slli	s3,s3,0x5
ffffffffc02095b6:	053a0263          	beq	s4,s3,ffffffffc02095fa <bitmap_create+0x94>
ffffffffc02095ba:	fff9079b          	addiw	a5,s2,-1
ffffffffc02095be:	0057969b          	slliw	a3,a5,0x5
ffffffffc02095c2:	0054561b          	srliw	a2,s0,0x5
ffffffffc02095c6:	40d4073b          	subw	a4,s0,a3
ffffffffc02095ca:	0054541b          	srliw	s0,s0,0x5
ffffffffc02095ce:	08f61463          	bne	a2,a5,ffffffffc0209656 <bitmap_create+0xf0>
ffffffffc02095d2:	fff7069b          	addiw	a3,a4,-1
ffffffffc02095d6:	47f9                	li	a5,30
ffffffffc02095d8:	04d7ef63          	bltu	a5,a3,ffffffffc0209636 <bitmap_create+0xd0>
ffffffffc02095dc:	1402                	slli	s0,s0,0x20
ffffffffc02095de:	8079                	srli	s0,s0,0x1e
ffffffffc02095e0:	9522                	add	a0,a0,s0
ffffffffc02095e2:	411c                	lw	a5,0(a0)
ffffffffc02095e4:	4585                	li	a1,1
ffffffffc02095e6:	02000613          	li	a2,32
ffffffffc02095ea:	00e596bb          	sllw	a3,a1,a4
ffffffffc02095ee:	8fb5                	xor	a5,a5,a3
ffffffffc02095f0:	2705                	addiw	a4,a4,1
ffffffffc02095f2:	2781                	sext.w	a5,a5
ffffffffc02095f4:	fec71be3          	bne	a4,a2,ffffffffc02095ea <bitmap_create+0x84>
ffffffffc02095f8:	c11c                	sw	a5,0(a0)
ffffffffc02095fa:	70e2                	ld	ra,56(sp)
ffffffffc02095fc:	7442                	ld	s0,48(sp)
ffffffffc02095fe:	7902                	ld	s2,32(sp)
ffffffffc0209600:	69e2                	ld	s3,24(sp)
ffffffffc0209602:	6a42                	ld	s4,16(sp)
ffffffffc0209604:	6aa2                	ld	s5,8(sp)
ffffffffc0209606:	8526                	mv	a0,s1
ffffffffc0209608:	74a2                	ld	s1,40(sp)
ffffffffc020960a:	6121                	addi	sp,sp,64
ffffffffc020960c:	8082                	ret
ffffffffc020960e:	8526                	mv	a0,s1
ffffffffc0209610:	abbf80ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc0209614:	4481                	li	s1,0
ffffffffc0209616:	b7d5                	j	ffffffffc02095fa <bitmap_create+0x94>
ffffffffc0209618:	00006697          	auipc	a3,0x6
ffffffffc020961c:	d4868693          	addi	a3,a3,-696 # ffffffffc020f360 <dev_node_ops+0x330>
ffffffffc0209620:	00003617          	auipc	a2,0x3
ffffffffc0209624:	9f060613          	addi	a2,a2,-1552 # ffffffffc020c010 <commands+0x210>
ffffffffc0209628:	45d5                	li	a1,21
ffffffffc020962a:	00006517          	auipc	a0,0x6
ffffffffc020962e:	d1e50513          	addi	a0,a0,-738 # ffffffffc020f348 <dev_node_ops+0x318>
ffffffffc0209632:	e6df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209636:	00006697          	auipc	a3,0x6
ffffffffc020963a:	d6a68693          	addi	a3,a3,-662 # ffffffffc020f3a0 <dev_node_ops+0x370>
ffffffffc020963e:	00003617          	auipc	a2,0x3
ffffffffc0209642:	9d260613          	addi	a2,a2,-1582 # ffffffffc020c010 <commands+0x210>
ffffffffc0209646:	02b00593          	li	a1,43
ffffffffc020964a:	00006517          	auipc	a0,0x6
ffffffffc020964e:	cfe50513          	addi	a0,a0,-770 # ffffffffc020f348 <dev_node_ops+0x318>
ffffffffc0209652:	e4df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209656:	00006697          	auipc	a3,0x6
ffffffffc020965a:	d3268693          	addi	a3,a3,-718 # ffffffffc020f388 <dev_node_ops+0x358>
ffffffffc020965e:	00003617          	auipc	a2,0x3
ffffffffc0209662:	9b260613          	addi	a2,a2,-1614 # ffffffffc020c010 <commands+0x210>
ffffffffc0209666:	02a00593          	li	a1,42
ffffffffc020966a:	00006517          	auipc	a0,0x6
ffffffffc020966e:	cde50513          	addi	a0,a0,-802 # ffffffffc020f348 <dev_node_ops+0x318>
ffffffffc0209672:	e2df60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209676 <bitmap_alloc>:
ffffffffc0209676:	4150                	lw	a2,4(a0)
ffffffffc0209678:	651c                	ld	a5,8(a0)
ffffffffc020967a:	c231                	beqz	a2,ffffffffc02096be <bitmap_alloc+0x48>
ffffffffc020967c:	4701                	li	a4,0
ffffffffc020967e:	a029                	j	ffffffffc0209688 <bitmap_alloc+0x12>
ffffffffc0209680:	2705                	addiw	a4,a4,1
ffffffffc0209682:	0791                	addi	a5,a5,4
ffffffffc0209684:	02e60d63          	beq	a2,a4,ffffffffc02096be <bitmap_alloc+0x48>
ffffffffc0209688:	4394                	lw	a3,0(a5)
ffffffffc020968a:	dafd                	beqz	a3,ffffffffc0209680 <bitmap_alloc+0xa>
ffffffffc020968c:	4501                	li	a0,0
ffffffffc020968e:	4885                	li	a7,1
ffffffffc0209690:	8e36                	mv	t3,a3
ffffffffc0209692:	02000313          	li	t1,32
ffffffffc0209696:	a021                	j	ffffffffc020969e <bitmap_alloc+0x28>
ffffffffc0209698:	2505                	addiw	a0,a0,1
ffffffffc020969a:	02650463          	beq	a0,t1,ffffffffc02096c2 <bitmap_alloc+0x4c>
ffffffffc020969e:	00a8983b          	sllw	a6,a7,a0
ffffffffc02096a2:	0106f633          	and	a2,a3,a6
ffffffffc02096a6:	2601                	sext.w	a2,a2
ffffffffc02096a8:	da65                	beqz	a2,ffffffffc0209698 <bitmap_alloc+0x22>
ffffffffc02096aa:	010e4833          	xor	a6,t3,a6
ffffffffc02096ae:	0057171b          	slliw	a4,a4,0x5
ffffffffc02096b2:	9f29                	addw	a4,a4,a0
ffffffffc02096b4:	0107a023          	sw	a6,0(a5)
ffffffffc02096b8:	c198                	sw	a4,0(a1)
ffffffffc02096ba:	4501                	li	a0,0
ffffffffc02096bc:	8082                	ret
ffffffffc02096be:	5571                	li	a0,-4
ffffffffc02096c0:	8082                	ret
ffffffffc02096c2:	1141                	addi	sp,sp,-16
ffffffffc02096c4:	00004697          	auipc	a3,0x4
ffffffffc02096c8:	9cc68693          	addi	a3,a3,-1588 # ffffffffc020d090 <default_pmm_manager+0x598>
ffffffffc02096cc:	00003617          	auipc	a2,0x3
ffffffffc02096d0:	94460613          	addi	a2,a2,-1724 # ffffffffc020c010 <commands+0x210>
ffffffffc02096d4:	04300593          	li	a1,67
ffffffffc02096d8:	00006517          	auipc	a0,0x6
ffffffffc02096dc:	c7050513          	addi	a0,a0,-912 # ffffffffc020f348 <dev_node_ops+0x318>
ffffffffc02096e0:	e406                	sd	ra,8(sp)
ffffffffc02096e2:	dbdf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02096e6 <bitmap_test>:
ffffffffc02096e6:	411c                	lw	a5,0(a0)
ffffffffc02096e8:	00f5ff63          	bgeu	a1,a5,ffffffffc0209706 <bitmap_test+0x20>
ffffffffc02096ec:	651c                	ld	a5,8(a0)
ffffffffc02096ee:	0055d71b          	srliw	a4,a1,0x5
ffffffffc02096f2:	070a                	slli	a4,a4,0x2
ffffffffc02096f4:	97ba                	add	a5,a5,a4
ffffffffc02096f6:	4388                	lw	a0,0(a5)
ffffffffc02096f8:	4785                	li	a5,1
ffffffffc02096fa:	00b795bb          	sllw	a1,a5,a1
ffffffffc02096fe:	8d6d                	and	a0,a0,a1
ffffffffc0209700:	1502                	slli	a0,a0,0x20
ffffffffc0209702:	9101                	srli	a0,a0,0x20
ffffffffc0209704:	8082                	ret
ffffffffc0209706:	1141                	addi	sp,sp,-16
ffffffffc0209708:	e406                	sd	ra,8(sp)
ffffffffc020970a:	e39ff0ef          	jal	ra,ffffffffc0209542 <bitmap_translate.part.0>

ffffffffc020970e <bitmap_free>:
ffffffffc020970e:	411c                	lw	a5,0(a0)
ffffffffc0209710:	1141                	addi	sp,sp,-16
ffffffffc0209712:	e406                	sd	ra,8(sp)
ffffffffc0209714:	02f5f463          	bgeu	a1,a5,ffffffffc020973c <bitmap_free+0x2e>
ffffffffc0209718:	651c                	ld	a5,8(a0)
ffffffffc020971a:	0055d71b          	srliw	a4,a1,0x5
ffffffffc020971e:	070a                	slli	a4,a4,0x2
ffffffffc0209720:	97ba                	add	a5,a5,a4
ffffffffc0209722:	4398                	lw	a4,0(a5)
ffffffffc0209724:	4685                	li	a3,1
ffffffffc0209726:	00b695bb          	sllw	a1,a3,a1
ffffffffc020972a:	00b776b3          	and	a3,a4,a1
ffffffffc020972e:	2681                	sext.w	a3,a3
ffffffffc0209730:	ea81                	bnez	a3,ffffffffc0209740 <bitmap_free+0x32>
ffffffffc0209732:	60a2                	ld	ra,8(sp)
ffffffffc0209734:	8f4d                	or	a4,a4,a1
ffffffffc0209736:	c398                	sw	a4,0(a5)
ffffffffc0209738:	0141                	addi	sp,sp,16
ffffffffc020973a:	8082                	ret
ffffffffc020973c:	e07ff0ef          	jal	ra,ffffffffc0209542 <bitmap_translate.part.0>
ffffffffc0209740:	00006697          	auipc	a3,0x6
ffffffffc0209744:	c8868693          	addi	a3,a3,-888 # ffffffffc020f3c8 <dev_node_ops+0x398>
ffffffffc0209748:	00003617          	auipc	a2,0x3
ffffffffc020974c:	8c860613          	addi	a2,a2,-1848 # ffffffffc020c010 <commands+0x210>
ffffffffc0209750:	05f00593          	li	a1,95
ffffffffc0209754:	00006517          	auipc	a0,0x6
ffffffffc0209758:	bf450513          	addi	a0,a0,-1036 # ffffffffc020f348 <dev_node_ops+0x318>
ffffffffc020975c:	d43f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209760 <bitmap_destroy>:
ffffffffc0209760:	1141                	addi	sp,sp,-16
ffffffffc0209762:	e022                	sd	s0,0(sp)
ffffffffc0209764:	842a                	mv	s0,a0
ffffffffc0209766:	6508                	ld	a0,8(a0)
ffffffffc0209768:	e406                	sd	ra,8(sp)
ffffffffc020976a:	961f80ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020976e:	8522                	mv	a0,s0
ffffffffc0209770:	6402                	ld	s0,0(sp)
ffffffffc0209772:	60a2                	ld	ra,8(sp)
ffffffffc0209774:	0141                	addi	sp,sp,16
ffffffffc0209776:	955f806f          	j	ffffffffc02020ca <kfree>

ffffffffc020977a <bitmap_getdata>:
ffffffffc020977a:	c589                	beqz	a1,ffffffffc0209784 <bitmap_getdata+0xa>
ffffffffc020977c:	00456783          	lwu	a5,4(a0)
ffffffffc0209780:	078a                	slli	a5,a5,0x2
ffffffffc0209782:	e19c                	sd	a5,0(a1)
ffffffffc0209784:	6508                	ld	a0,8(a0)
ffffffffc0209786:	8082                	ret

ffffffffc0209788 <sfs_init>:
ffffffffc0209788:	1141                	addi	sp,sp,-16
ffffffffc020978a:	00006517          	auipc	a0,0x6
ffffffffc020978e:	aae50513          	addi	a0,a0,-1362 # ffffffffc020f238 <dev_node_ops+0x208>
ffffffffc0209792:	e406                	sd	ra,8(sp)
ffffffffc0209794:	554000ef          	jal	ra,ffffffffc0209ce8 <sfs_mount>
ffffffffc0209798:	e501                	bnez	a0,ffffffffc02097a0 <sfs_init+0x18>
ffffffffc020979a:	60a2                	ld	ra,8(sp)
ffffffffc020979c:	0141                	addi	sp,sp,16
ffffffffc020979e:	8082                	ret
ffffffffc02097a0:	86aa                	mv	a3,a0
ffffffffc02097a2:	00006617          	auipc	a2,0x6
ffffffffc02097a6:	c3660613          	addi	a2,a2,-970 # ffffffffc020f3d8 <dev_node_ops+0x3a8>
ffffffffc02097aa:	45c1                	li	a1,16
ffffffffc02097ac:	00006517          	auipc	a0,0x6
ffffffffc02097b0:	c4c50513          	addi	a0,a0,-948 # ffffffffc020f3f8 <dev_node_ops+0x3c8>
ffffffffc02097b4:	cebf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02097b8 <sfs_unmount>:
ffffffffc02097b8:	1141                	addi	sp,sp,-16
ffffffffc02097ba:	e406                	sd	ra,8(sp)
ffffffffc02097bc:	e022                	sd	s0,0(sp)
ffffffffc02097be:	cd1d                	beqz	a0,ffffffffc02097fc <sfs_unmount+0x44>
ffffffffc02097c0:	0b052783          	lw	a5,176(a0)
ffffffffc02097c4:	842a                	mv	s0,a0
ffffffffc02097c6:	eb9d                	bnez	a5,ffffffffc02097fc <sfs_unmount+0x44>
ffffffffc02097c8:	7158                	ld	a4,160(a0)
ffffffffc02097ca:	09850793          	addi	a5,a0,152
ffffffffc02097ce:	02f71563          	bne	a4,a5,ffffffffc02097f8 <sfs_unmount+0x40>
ffffffffc02097d2:	613c                	ld	a5,64(a0)
ffffffffc02097d4:	e7a1                	bnez	a5,ffffffffc020981c <sfs_unmount+0x64>
ffffffffc02097d6:	7d08                	ld	a0,56(a0)
ffffffffc02097d8:	f89ff0ef          	jal	ra,ffffffffc0209760 <bitmap_destroy>
ffffffffc02097dc:	6428                	ld	a0,72(s0)
ffffffffc02097de:	8edf80ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02097e2:	7448                	ld	a0,168(s0)
ffffffffc02097e4:	8e7f80ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02097e8:	8522                	mv	a0,s0
ffffffffc02097ea:	8e1f80ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc02097ee:	4501                	li	a0,0
ffffffffc02097f0:	60a2                	ld	ra,8(sp)
ffffffffc02097f2:	6402                	ld	s0,0(sp)
ffffffffc02097f4:	0141                	addi	sp,sp,16
ffffffffc02097f6:	8082                	ret
ffffffffc02097f8:	5545                	li	a0,-15
ffffffffc02097fa:	bfdd                	j	ffffffffc02097f0 <sfs_unmount+0x38>
ffffffffc02097fc:	00006697          	auipc	a3,0x6
ffffffffc0209800:	c1468693          	addi	a3,a3,-1004 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc0209804:	00003617          	auipc	a2,0x3
ffffffffc0209808:	80c60613          	addi	a2,a2,-2036 # ffffffffc020c010 <commands+0x210>
ffffffffc020980c:	04100593          	li	a1,65
ffffffffc0209810:	00006517          	auipc	a0,0x6
ffffffffc0209814:	c3050513          	addi	a0,a0,-976 # ffffffffc020f440 <dev_node_ops+0x410>
ffffffffc0209818:	c87f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020981c:	00006697          	auipc	a3,0x6
ffffffffc0209820:	c3c68693          	addi	a3,a3,-964 # ffffffffc020f458 <dev_node_ops+0x428>
ffffffffc0209824:	00002617          	auipc	a2,0x2
ffffffffc0209828:	7ec60613          	addi	a2,a2,2028 # ffffffffc020c010 <commands+0x210>
ffffffffc020982c:	04500593          	li	a1,69
ffffffffc0209830:	00006517          	auipc	a0,0x6
ffffffffc0209834:	c1050513          	addi	a0,a0,-1008 # ffffffffc020f440 <dev_node_ops+0x410>
ffffffffc0209838:	c67f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020983c <sfs_cleanup>:
ffffffffc020983c:	1101                	addi	sp,sp,-32
ffffffffc020983e:	ec06                	sd	ra,24(sp)
ffffffffc0209840:	e822                	sd	s0,16(sp)
ffffffffc0209842:	e426                	sd	s1,8(sp)
ffffffffc0209844:	e04a                	sd	s2,0(sp)
ffffffffc0209846:	c525                	beqz	a0,ffffffffc02098ae <sfs_cleanup+0x72>
ffffffffc0209848:	0b052783          	lw	a5,176(a0)
ffffffffc020984c:	84aa                	mv	s1,a0
ffffffffc020984e:	e3a5                	bnez	a5,ffffffffc02098ae <sfs_cleanup+0x72>
ffffffffc0209850:	4158                	lw	a4,4(a0)
ffffffffc0209852:	4514                	lw	a3,8(a0)
ffffffffc0209854:	00c50913          	addi	s2,a0,12
ffffffffc0209858:	85ca                	mv	a1,s2
ffffffffc020985a:	40d7063b          	subw	a2,a4,a3
ffffffffc020985e:	00006517          	auipc	a0,0x6
ffffffffc0209862:	c1250513          	addi	a0,a0,-1006 # ffffffffc020f470 <dev_node_ops+0x440>
ffffffffc0209866:	941f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020986a:	02000413          	li	s0,32
ffffffffc020986e:	a019                	j	ffffffffc0209874 <sfs_cleanup+0x38>
ffffffffc0209870:	347d                	addiw	s0,s0,-1
ffffffffc0209872:	c819                	beqz	s0,ffffffffc0209888 <sfs_cleanup+0x4c>
ffffffffc0209874:	7cdc                	ld	a5,184(s1)
ffffffffc0209876:	8526                	mv	a0,s1
ffffffffc0209878:	9782                	jalr	a5
ffffffffc020987a:	f97d                	bnez	a0,ffffffffc0209870 <sfs_cleanup+0x34>
ffffffffc020987c:	60e2                	ld	ra,24(sp)
ffffffffc020987e:	6442                	ld	s0,16(sp)
ffffffffc0209880:	64a2                	ld	s1,8(sp)
ffffffffc0209882:	6902                	ld	s2,0(sp)
ffffffffc0209884:	6105                	addi	sp,sp,32
ffffffffc0209886:	8082                	ret
ffffffffc0209888:	6442                	ld	s0,16(sp)
ffffffffc020988a:	60e2                	ld	ra,24(sp)
ffffffffc020988c:	64a2                	ld	s1,8(sp)
ffffffffc020988e:	86ca                	mv	a3,s2
ffffffffc0209890:	6902                	ld	s2,0(sp)
ffffffffc0209892:	872a                	mv	a4,a0
ffffffffc0209894:	00006617          	auipc	a2,0x6
ffffffffc0209898:	bfc60613          	addi	a2,a2,-1028 # ffffffffc020f490 <dev_node_ops+0x460>
ffffffffc020989c:	05f00593          	li	a1,95
ffffffffc02098a0:	00006517          	auipc	a0,0x6
ffffffffc02098a4:	ba050513          	addi	a0,a0,-1120 # ffffffffc020f440 <dev_node_ops+0x410>
ffffffffc02098a8:	6105                	addi	sp,sp,32
ffffffffc02098aa:	c5df606f          	j	ffffffffc0200506 <__warn>
ffffffffc02098ae:	00006697          	auipc	a3,0x6
ffffffffc02098b2:	b6268693          	addi	a3,a3,-1182 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc02098b6:	00002617          	auipc	a2,0x2
ffffffffc02098ba:	75a60613          	addi	a2,a2,1882 # ffffffffc020c010 <commands+0x210>
ffffffffc02098be:	05400593          	li	a1,84
ffffffffc02098c2:	00006517          	auipc	a0,0x6
ffffffffc02098c6:	b7e50513          	addi	a0,a0,-1154 # ffffffffc020f440 <dev_node_ops+0x410>
ffffffffc02098ca:	bd5f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02098ce <sfs_sync>:
ffffffffc02098ce:	7179                	addi	sp,sp,-48
ffffffffc02098d0:	f406                	sd	ra,40(sp)
ffffffffc02098d2:	f022                	sd	s0,32(sp)
ffffffffc02098d4:	ec26                	sd	s1,24(sp)
ffffffffc02098d6:	e84a                	sd	s2,16(sp)
ffffffffc02098d8:	e44e                	sd	s3,8(sp)
ffffffffc02098da:	e052                	sd	s4,0(sp)
ffffffffc02098dc:	cd4d                	beqz	a0,ffffffffc0209996 <sfs_sync+0xc8>
ffffffffc02098de:	0b052783          	lw	a5,176(a0)
ffffffffc02098e2:	8a2a                	mv	s4,a0
ffffffffc02098e4:	ebcd                	bnez	a5,ffffffffc0209996 <sfs_sync+0xc8>
ffffffffc02098e6:	4f1010ef          	jal	ra,ffffffffc020b5d6 <lock_sfs_fs>
ffffffffc02098ea:	0a0a3403          	ld	s0,160(s4)
ffffffffc02098ee:	098a0913          	addi	s2,s4,152
ffffffffc02098f2:	02890763          	beq	s2,s0,ffffffffc0209920 <sfs_sync+0x52>
ffffffffc02098f6:	00004997          	auipc	s3,0x4
ffffffffc02098fa:	0a298993          	addi	s3,s3,162 # ffffffffc020d998 <default_pmm_manager+0xea0>
ffffffffc02098fe:	7c1c                	ld	a5,56(s0)
ffffffffc0209900:	fc840493          	addi	s1,s0,-56
ffffffffc0209904:	cbb5                	beqz	a5,ffffffffc0209978 <sfs_sync+0xaa>
ffffffffc0209906:	7b9c                	ld	a5,48(a5)
ffffffffc0209908:	cba5                	beqz	a5,ffffffffc0209978 <sfs_sync+0xaa>
ffffffffc020990a:	85ce                	mv	a1,s3
ffffffffc020990c:	8526                	mv	a0,s1
ffffffffc020990e:	e28fe0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0209912:	7c1c                	ld	a5,56(s0)
ffffffffc0209914:	8526                	mv	a0,s1
ffffffffc0209916:	7b9c                	ld	a5,48(a5)
ffffffffc0209918:	9782                	jalr	a5
ffffffffc020991a:	6400                	ld	s0,8(s0)
ffffffffc020991c:	fe8911e3          	bne	s2,s0,ffffffffc02098fe <sfs_sync+0x30>
ffffffffc0209920:	8552                	mv	a0,s4
ffffffffc0209922:	4c5010ef          	jal	ra,ffffffffc020b5e6 <unlock_sfs_fs>
ffffffffc0209926:	040a3783          	ld	a5,64(s4)
ffffffffc020992a:	4501                	li	a0,0
ffffffffc020992c:	eb89                	bnez	a5,ffffffffc020993e <sfs_sync+0x70>
ffffffffc020992e:	70a2                	ld	ra,40(sp)
ffffffffc0209930:	7402                	ld	s0,32(sp)
ffffffffc0209932:	64e2                	ld	s1,24(sp)
ffffffffc0209934:	6942                	ld	s2,16(sp)
ffffffffc0209936:	69a2                	ld	s3,8(sp)
ffffffffc0209938:	6a02                	ld	s4,0(sp)
ffffffffc020993a:	6145                	addi	sp,sp,48
ffffffffc020993c:	8082                	ret
ffffffffc020993e:	040a3023          	sd	zero,64(s4)
ffffffffc0209942:	8552                	mv	a0,s4
ffffffffc0209944:	377010ef          	jal	ra,ffffffffc020b4ba <sfs_sync_super>
ffffffffc0209948:	cd01                	beqz	a0,ffffffffc0209960 <sfs_sync+0x92>
ffffffffc020994a:	70a2                	ld	ra,40(sp)
ffffffffc020994c:	7402                	ld	s0,32(sp)
ffffffffc020994e:	4785                	li	a5,1
ffffffffc0209950:	04fa3023          	sd	a5,64(s4)
ffffffffc0209954:	64e2                	ld	s1,24(sp)
ffffffffc0209956:	6942                	ld	s2,16(sp)
ffffffffc0209958:	69a2                	ld	s3,8(sp)
ffffffffc020995a:	6a02                	ld	s4,0(sp)
ffffffffc020995c:	6145                	addi	sp,sp,48
ffffffffc020995e:	8082                	ret
ffffffffc0209960:	8552                	mv	a0,s4
ffffffffc0209962:	39f010ef          	jal	ra,ffffffffc020b500 <sfs_sync_freemap>
ffffffffc0209966:	f175                	bnez	a0,ffffffffc020994a <sfs_sync+0x7c>
ffffffffc0209968:	70a2                	ld	ra,40(sp)
ffffffffc020996a:	7402                	ld	s0,32(sp)
ffffffffc020996c:	64e2                	ld	s1,24(sp)
ffffffffc020996e:	6942                	ld	s2,16(sp)
ffffffffc0209970:	69a2                	ld	s3,8(sp)
ffffffffc0209972:	6a02                	ld	s4,0(sp)
ffffffffc0209974:	6145                	addi	sp,sp,48
ffffffffc0209976:	8082                	ret
ffffffffc0209978:	00004697          	auipc	a3,0x4
ffffffffc020997c:	fd068693          	addi	a3,a3,-48 # ffffffffc020d948 <default_pmm_manager+0xe50>
ffffffffc0209980:	00002617          	auipc	a2,0x2
ffffffffc0209984:	69060613          	addi	a2,a2,1680 # ffffffffc020c010 <commands+0x210>
ffffffffc0209988:	45ed                	li	a1,27
ffffffffc020998a:	00006517          	auipc	a0,0x6
ffffffffc020998e:	ab650513          	addi	a0,a0,-1354 # ffffffffc020f440 <dev_node_ops+0x410>
ffffffffc0209992:	b0df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209996:	00006697          	auipc	a3,0x6
ffffffffc020999a:	a7a68693          	addi	a3,a3,-1414 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc020999e:	00002617          	auipc	a2,0x2
ffffffffc02099a2:	67260613          	addi	a2,a2,1650 # ffffffffc020c010 <commands+0x210>
ffffffffc02099a6:	45d5                	li	a1,21
ffffffffc02099a8:	00006517          	auipc	a0,0x6
ffffffffc02099ac:	a9850513          	addi	a0,a0,-1384 # ffffffffc020f440 <dev_node_ops+0x410>
ffffffffc02099b0:	aeff60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02099b4 <sfs_get_root>:
ffffffffc02099b4:	1101                	addi	sp,sp,-32
ffffffffc02099b6:	ec06                	sd	ra,24(sp)
ffffffffc02099b8:	cd09                	beqz	a0,ffffffffc02099d2 <sfs_get_root+0x1e>
ffffffffc02099ba:	0b052783          	lw	a5,176(a0)
ffffffffc02099be:	eb91                	bnez	a5,ffffffffc02099d2 <sfs_get_root+0x1e>
ffffffffc02099c0:	4605                	li	a2,1
ffffffffc02099c2:	002c                	addi	a1,sp,8
ffffffffc02099c4:	328010ef          	jal	ra,ffffffffc020acec <sfs_load_inode>
ffffffffc02099c8:	e50d                	bnez	a0,ffffffffc02099f2 <sfs_get_root+0x3e>
ffffffffc02099ca:	60e2                	ld	ra,24(sp)
ffffffffc02099cc:	6522                	ld	a0,8(sp)
ffffffffc02099ce:	6105                	addi	sp,sp,32
ffffffffc02099d0:	8082                	ret
ffffffffc02099d2:	00006697          	auipc	a3,0x6
ffffffffc02099d6:	a3e68693          	addi	a3,a3,-1474 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc02099da:	00002617          	auipc	a2,0x2
ffffffffc02099de:	63660613          	addi	a2,a2,1590 # ffffffffc020c010 <commands+0x210>
ffffffffc02099e2:	03600593          	li	a1,54
ffffffffc02099e6:	00006517          	auipc	a0,0x6
ffffffffc02099ea:	a5a50513          	addi	a0,a0,-1446 # ffffffffc020f440 <dev_node_ops+0x410>
ffffffffc02099ee:	ab1f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02099f2:	86aa                	mv	a3,a0
ffffffffc02099f4:	00006617          	auipc	a2,0x6
ffffffffc02099f8:	abc60613          	addi	a2,a2,-1348 # ffffffffc020f4b0 <dev_node_ops+0x480>
ffffffffc02099fc:	03700593          	li	a1,55
ffffffffc0209a00:	00006517          	auipc	a0,0x6
ffffffffc0209a04:	a4050513          	addi	a0,a0,-1472 # ffffffffc020f440 <dev_node_ops+0x410>
ffffffffc0209a08:	a97f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209a0c <sfs_do_mount>:
ffffffffc0209a0c:	6518                	ld	a4,8(a0)
ffffffffc0209a0e:	7171                	addi	sp,sp,-176
ffffffffc0209a10:	f506                	sd	ra,168(sp)
ffffffffc0209a12:	f122                	sd	s0,160(sp)
ffffffffc0209a14:	ed26                	sd	s1,152(sp)
ffffffffc0209a16:	e94a                	sd	s2,144(sp)
ffffffffc0209a18:	e54e                	sd	s3,136(sp)
ffffffffc0209a1a:	e152                	sd	s4,128(sp)
ffffffffc0209a1c:	fcd6                	sd	s5,120(sp)
ffffffffc0209a1e:	f8da                	sd	s6,112(sp)
ffffffffc0209a20:	f4de                	sd	s7,104(sp)
ffffffffc0209a22:	f0e2                	sd	s8,96(sp)
ffffffffc0209a24:	ece6                	sd	s9,88(sp)
ffffffffc0209a26:	e8ea                	sd	s10,80(sp)
ffffffffc0209a28:	e4ee                	sd	s11,72(sp)
ffffffffc0209a2a:	6785                	lui	a5,0x1
ffffffffc0209a2c:	24f71663          	bne	a4,a5,ffffffffc0209c78 <sfs_do_mount+0x26c>
ffffffffc0209a30:	892a                	mv	s2,a0
ffffffffc0209a32:	4501                	li	a0,0
ffffffffc0209a34:	8aae                	mv	s5,a1
ffffffffc0209a36:	f00fe0ef          	jal	ra,ffffffffc0208136 <__alloc_fs>
ffffffffc0209a3a:	842a                	mv	s0,a0
ffffffffc0209a3c:	24050463          	beqz	a0,ffffffffc0209c84 <sfs_do_mount+0x278>
ffffffffc0209a40:	0b052b03          	lw	s6,176(a0)
ffffffffc0209a44:	260b1263          	bnez	s6,ffffffffc0209ca8 <sfs_do_mount+0x29c>
ffffffffc0209a48:	03253823          	sd	s2,48(a0)
ffffffffc0209a4c:	6505                	lui	a0,0x1
ffffffffc0209a4e:	dccf80ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0209a52:	e428                	sd	a0,72(s0)
ffffffffc0209a54:	84aa                	mv	s1,a0
ffffffffc0209a56:	16050363          	beqz	a0,ffffffffc0209bbc <sfs_do_mount+0x1b0>
ffffffffc0209a5a:	85aa                	mv	a1,a0
ffffffffc0209a5c:	4681                	li	a3,0
ffffffffc0209a5e:	6605                	lui	a2,0x1
ffffffffc0209a60:	1008                	addi	a0,sp,32
ffffffffc0209a62:	a11fb0ef          	jal	ra,ffffffffc0205472 <iobuf_init>
ffffffffc0209a66:	02093783          	ld	a5,32(s2)
ffffffffc0209a6a:	85aa                	mv	a1,a0
ffffffffc0209a6c:	4601                	li	a2,0
ffffffffc0209a6e:	854a                	mv	a0,s2
ffffffffc0209a70:	9782                	jalr	a5
ffffffffc0209a72:	8a2a                	mv	s4,a0
ffffffffc0209a74:	10051e63          	bnez	a0,ffffffffc0209b90 <sfs_do_mount+0x184>
ffffffffc0209a78:	408c                	lw	a1,0(s1)
ffffffffc0209a7a:	2f8dc637          	lui	a2,0x2f8dc
ffffffffc0209a7e:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
ffffffffc0209a82:	14c59863          	bne	a1,a2,ffffffffc0209bd2 <sfs_do_mount+0x1c6>
ffffffffc0209a86:	40dc                	lw	a5,4(s1)
ffffffffc0209a88:	00093603          	ld	a2,0(s2)
ffffffffc0209a8c:	02079713          	slli	a4,a5,0x20
ffffffffc0209a90:	9301                	srli	a4,a4,0x20
ffffffffc0209a92:	12e66763          	bltu	a2,a4,ffffffffc0209bc0 <sfs_do_mount+0x1b4>
ffffffffc0209a96:	020485a3          	sb	zero,43(s1)
ffffffffc0209a9a:	0084af03          	lw	t5,8(s1)
ffffffffc0209a9e:	00c4ae83          	lw	t4,12(s1)
ffffffffc0209aa2:	0104ae03          	lw	t3,16(s1)
ffffffffc0209aa6:	0144a303          	lw	t1,20(s1)
ffffffffc0209aaa:	0184a883          	lw	a7,24(s1)
ffffffffc0209aae:	01c4a803          	lw	a6,28(s1)
ffffffffc0209ab2:	5090                	lw	a2,32(s1)
ffffffffc0209ab4:	50d4                	lw	a3,36(s1)
ffffffffc0209ab6:	5498                	lw	a4,40(s1)
ffffffffc0209ab8:	6511                	lui	a0,0x4
ffffffffc0209aba:	c00c                	sw	a1,0(s0)
ffffffffc0209abc:	c05c                	sw	a5,4(s0)
ffffffffc0209abe:	01e42423          	sw	t5,8(s0)
ffffffffc0209ac2:	01d42623          	sw	t4,12(s0)
ffffffffc0209ac6:	01c42823          	sw	t3,16(s0)
ffffffffc0209aca:	00642a23          	sw	t1,20(s0)
ffffffffc0209ace:	01142c23          	sw	a7,24(s0)
ffffffffc0209ad2:	01042e23          	sw	a6,28(s0)
ffffffffc0209ad6:	d010                	sw	a2,32(s0)
ffffffffc0209ad8:	d054                	sw	a3,36(s0)
ffffffffc0209ada:	d418                	sw	a4,40(s0)
ffffffffc0209adc:	d3ef80ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc0209ae0:	f448                	sd	a0,168(s0)
ffffffffc0209ae2:	8c2a                	mv	s8,a0
ffffffffc0209ae4:	18050c63          	beqz	a0,ffffffffc0209c7c <sfs_do_mount+0x270>
ffffffffc0209ae8:	6711                	lui	a4,0x4
ffffffffc0209aea:	87aa                	mv	a5,a0
ffffffffc0209aec:	972a                	add	a4,a4,a0
ffffffffc0209aee:	e79c                	sd	a5,8(a5)
ffffffffc0209af0:	e39c                	sd	a5,0(a5)
ffffffffc0209af2:	07c1                	addi	a5,a5,16
ffffffffc0209af4:	fee79de3          	bne	a5,a4,ffffffffc0209aee <sfs_do_mount+0xe2>
ffffffffc0209af8:	0044eb83          	lwu	s7,4(s1)
ffffffffc0209afc:	67a1                	lui	a5,0x8
ffffffffc0209afe:	fff78993          	addi	s3,a5,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc0209b02:	9bce                	add	s7,s7,s3
ffffffffc0209b04:	77e1                	lui	a5,0xffff8
ffffffffc0209b06:	00fbfbb3          	and	s7,s7,a5
ffffffffc0209b0a:	2b81                	sext.w	s7,s7
ffffffffc0209b0c:	855e                	mv	a0,s7
ffffffffc0209b0e:	a59ff0ef          	jal	ra,ffffffffc0209566 <bitmap_create>
ffffffffc0209b12:	fc08                	sd	a0,56(s0)
ffffffffc0209b14:	8d2a                	mv	s10,a0
ffffffffc0209b16:	14050f63          	beqz	a0,ffffffffc0209c74 <sfs_do_mount+0x268>
ffffffffc0209b1a:	0044e783          	lwu	a5,4(s1)
ffffffffc0209b1e:	082c                	addi	a1,sp,24
ffffffffc0209b20:	97ce                	add	a5,a5,s3
ffffffffc0209b22:	00f7d713          	srli	a4,a5,0xf
ffffffffc0209b26:	e43a                	sd	a4,8(sp)
ffffffffc0209b28:	40f7d993          	srai	s3,a5,0xf
ffffffffc0209b2c:	c4fff0ef          	jal	ra,ffffffffc020977a <bitmap_getdata>
ffffffffc0209b30:	14050c63          	beqz	a0,ffffffffc0209c88 <sfs_do_mount+0x27c>
ffffffffc0209b34:	00c9979b          	slliw	a5,s3,0xc
ffffffffc0209b38:	66e2                	ld	a3,24(sp)
ffffffffc0209b3a:	1782                	slli	a5,a5,0x20
ffffffffc0209b3c:	9381                	srli	a5,a5,0x20
ffffffffc0209b3e:	14d79563          	bne	a5,a3,ffffffffc0209c88 <sfs_do_mount+0x27c>
ffffffffc0209b42:	6722                	ld	a4,8(sp)
ffffffffc0209b44:	6d89                	lui	s11,0x2
ffffffffc0209b46:	89aa                	mv	s3,a0
ffffffffc0209b48:	00c71c93          	slli	s9,a4,0xc
ffffffffc0209b4c:	9caa                	add	s9,s9,a0
ffffffffc0209b4e:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0209b52:	e711                	bnez	a4,ffffffffc0209b5e <sfs_do_mount+0x152>
ffffffffc0209b54:	a079                	j	ffffffffc0209be2 <sfs_do_mount+0x1d6>
ffffffffc0209b56:	6785                	lui	a5,0x1
ffffffffc0209b58:	99be                	add	s3,s3,a5
ffffffffc0209b5a:	093c8463          	beq	s9,s3,ffffffffc0209be2 <sfs_do_mount+0x1d6>
ffffffffc0209b5e:	013d86bb          	addw	a3,s11,s3
ffffffffc0209b62:	1682                	slli	a3,a3,0x20
ffffffffc0209b64:	6605                	lui	a2,0x1
ffffffffc0209b66:	85ce                	mv	a1,s3
ffffffffc0209b68:	9281                	srli	a3,a3,0x20
ffffffffc0209b6a:	1008                	addi	a0,sp,32
ffffffffc0209b6c:	907fb0ef          	jal	ra,ffffffffc0205472 <iobuf_init>
ffffffffc0209b70:	02093783          	ld	a5,32(s2)
ffffffffc0209b74:	85aa                	mv	a1,a0
ffffffffc0209b76:	4601                	li	a2,0
ffffffffc0209b78:	854a                	mv	a0,s2
ffffffffc0209b7a:	9782                	jalr	a5
ffffffffc0209b7c:	dd69                	beqz	a0,ffffffffc0209b56 <sfs_do_mount+0x14a>
ffffffffc0209b7e:	e42a                	sd	a0,8(sp)
ffffffffc0209b80:	856a                	mv	a0,s10
ffffffffc0209b82:	bdfff0ef          	jal	ra,ffffffffc0209760 <bitmap_destroy>
ffffffffc0209b86:	67a2                	ld	a5,8(sp)
ffffffffc0209b88:	8a3e                	mv	s4,a5
ffffffffc0209b8a:	8562                	mv	a0,s8
ffffffffc0209b8c:	d3ef80ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc0209b90:	8526                	mv	a0,s1
ffffffffc0209b92:	d38f80ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc0209b96:	8522                	mv	a0,s0
ffffffffc0209b98:	d32f80ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc0209b9c:	70aa                	ld	ra,168(sp)
ffffffffc0209b9e:	740a                	ld	s0,160(sp)
ffffffffc0209ba0:	64ea                	ld	s1,152(sp)
ffffffffc0209ba2:	694a                	ld	s2,144(sp)
ffffffffc0209ba4:	69aa                	ld	s3,136(sp)
ffffffffc0209ba6:	7ae6                	ld	s5,120(sp)
ffffffffc0209ba8:	7b46                	ld	s6,112(sp)
ffffffffc0209baa:	7ba6                	ld	s7,104(sp)
ffffffffc0209bac:	7c06                	ld	s8,96(sp)
ffffffffc0209bae:	6ce6                	ld	s9,88(sp)
ffffffffc0209bb0:	6d46                	ld	s10,80(sp)
ffffffffc0209bb2:	6da6                	ld	s11,72(sp)
ffffffffc0209bb4:	8552                	mv	a0,s4
ffffffffc0209bb6:	6a0a                	ld	s4,128(sp)
ffffffffc0209bb8:	614d                	addi	sp,sp,176
ffffffffc0209bba:	8082                	ret
ffffffffc0209bbc:	5a71                	li	s4,-4
ffffffffc0209bbe:	bfe1                	j	ffffffffc0209b96 <sfs_do_mount+0x18a>
ffffffffc0209bc0:	85be                	mv	a1,a5
ffffffffc0209bc2:	00006517          	auipc	a0,0x6
ffffffffc0209bc6:	94650513          	addi	a0,a0,-1722 # ffffffffc020f508 <dev_node_ops+0x4d8>
ffffffffc0209bca:	ddcf60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0209bce:	5a75                	li	s4,-3
ffffffffc0209bd0:	b7c1                	j	ffffffffc0209b90 <sfs_do_mount+0x184>
ffffffffc0209bd2:	00006517          	auipc	a0,0x6
ffffffffc0209bd6:	8fe50513          	addi	a0,a0,-1794 # ffffffffc020f4d0 <dev_node_ops+0x4a0>
ffffffffc0209bda:	dccf60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0209bde:	5a75                	li	s4,-3
ffffffffc0209be0:	bf45                	j	ffffffffc0209b90 <sfs_do_mount+0x184>
ffffffffc0209be2:	00442903          	lw	s2,4(s0)
ffffffffc0209be6:	4481                	li	s1,0
ffffffffc0209be8:	080b8c63          	beqz	s7,ffffffffc0209c80 <sfs_do_mount+0x274>
ffffffffc0209bec:	85a6                	mv	a1,s1
ffffffffc0209bee:	856a                	mv	a0,s10
ffffffffc0209bf0:	af7ff0ef          	jal	ra,ffffffffc02096e6 <bitmap_test>
ffffffffc0209bf4:	c111                	beqz	a0,ffffffffc0209bf8 <sfs_do_mount+0x1ec>
ffffffffc0209bf6:	2b05                	addiw	s6,s6,1
ffffffffc0209bf8:	2485                	addiw	s1,s1,1
ffffffffc0209bfa:	fe9b99e3          	bne	s7,s1,ffffffffc0209bec <sfs_do_mount+0x1e0>
ffffffffc0209bfe:	441c                	lw	a5,8(s0)
ffffffffc0209c00:	0d679463          	bne	a5,s6,ffffffffc0209cc8 <sfs_do_mount+0x2bc>
ffffffffc0209c04:	4585                	li	a1,1
ffffffffc0209c06:	05040513          	addi	a0,s0,80
ffffffffc0209c0a:	04043023          	sd	zero,64(s0)
ffffffffc0209c0e:	9ddfa0ef          	jal	ra,ffffffffc02045ea <sem_init>
ffffffffc0209c12:	4585                	li	a1,1
ffffffffc0209c14:	06840513          	addi	a0,s0,104
ffffffffc0209c18:	9d3fa0ef          	jal	ra,ffffffffc02045ea <sem_init>
ffffffffc0209c1c:	4585                	li	a1,1
ffffffffc0209c1e:	08040513          	addi	a0,s0,128
ffffffffc0209c22:	9c9fa0ef          	jal	ra,ffffffffc02045ea <sem_init>
ffffffffc0209c26:	09840793          	addi	a5,s0,152
ffffffffc0209c2a:	f05c                	sd	a5,160(s0)
ffffffffc0209c2c:	ec5c                	sd	a5,152(s0)
ffffffffc0209c2e:	874a                	mv	a4,s2
ffffffffc0209c30:	86da                	mv	a3,s6
ffffffffc0209c32:	4169063b          	subw	a2,s2,s6
ffffffffc0209c36:	00c40593          	addi	a1,s0,12
ffffffffc0209c3a:	00006517          	auipc	a0,0x6
ffffffffc0209c3e:	95e50513          	addi	a0,a0,-1698 # ffffffffc020f598 <dev_node_ops+0x568>
ffffffffc0209c42:	d64f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0209c46:	00000797          	auipc	a5,0x0
ffffffffc0209c4a:	c8878793          	addi	a5,a5,-888 # ffffffffc02098ce <sfs_sync>
ffffffffc0209c4e:	fc5c                	sd	a5,184(s0)
ffffffffc0209c50:	00000797          	auipc	a5,0x0
ffffffffc0209c54:	d6478793          	addi	a5,a5,-668 # ffffffffc02099b4 <sfs_get_root>
ffffffffc0209c58:	e07c                	sd	a5,192(s0)
ffffffffc0209c5a:	00000797          	auipc	a5,0x0
ffffffffc0209c5e:	b5e78793          	addi	a5,a5,-1186 # ffffffffc02097b8 <sfs_unmount>
ffffffffc0209c62:	e47c                	sd	a5,200(s0)
ffffffffc0209c64:	00000797          	auipc	a5,0x0
ffffffffc0209c68:	bd878793          	addi	a5,a5,-1064 # ffffffffc020983c <sfs_cleanup>
ffffffffc0209c6c:	e87c                	sd	a5,208(s0)
ffffffffc0209c6e:	008ab023          	sd	s0,0(s5)
ffffffffc0209c72:	b72d                	j	ffffffffc0209b9c <sfs_do_mount+0x190>
ffffffffc0209c74:	5a71                	li	s4,-4
ffffffffc0209c76:	bf11                	j	ffffffffc0209b8a <sfs_do_mount+0x17e>
ffffffffc0209c78:	5a49                	li	s4,-14
ffffffffc0209c7a:	b70d                	j	ffffffffc0209b9c <sfs_do_mount+0x190>
ffffffffc0209c7c:	5a71                	li	s4,-4
ffffffffc0209c7e:	bf09                	j	ffffffffc0209b90 <sfs_do_mount+0x184>
ffffffffc0209c80:	4b01                	li	s6,0
ffffffffc0209c82:	bfb5                	j	ffffffffc0209bfe <sfs_do_mount+0x1f2>
ffffffffc0209c84:	5a71                	li	s4,-4
ffffffffc0209c86:	bf19                	j	ffffffffc0209b9c <sfs_do_mount+0x190>
ffffffffc0209c88:	00006697          	auipc	a3,0x6
ffffffffc0209c8c:	8b068693          	addi	a3,a3,-1872 # ffffffffc020f538 <dev_node_ops+0x508>
ffffffffc0209c90:	00002617          	auipc	a2,0x2
ffffffffc0209c94:	38060613          	addi	a2,a2,896 # ffffffffc020c010 <commands+0x210>
ffffffffc0209c98:	08300593          	li	a1,131
ffffffffc0209c9c:	00005517          	auipc	a0,0x5
ffffffffc0209ca0:	7a450513          	addi	a0,a0,1956 # ffffffffc020f440 <dev_node_ops+0x410>
ffffffffc0209ca4:	ffaf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209ca8:	00005697          	auipc	a3,0x5
ffffffffc0209cac:	76868693          	addi	a3,a3,1896 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc0209cb0:	00002617          	auipc	a2,0x2
ffffffffc0209cb4:	36060613          	addi	a2,a2,864 # ffffffffc020c010 <commands+0x210>
ffffffffc0209cb8:	0a300593          	li	a1,163
ffffffffc0209cbc:	00005517          	auipc	a0,0x5
ffffffffc0209cc0:	78450513          	addi	a0,a0,1924 # ffffffffc020f440 <dev_node_ops+0x410>
ffffffffc0209cc4:	fdaf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209cc8:	00006697          	auipc	a3,0x6
ffffffffc0209ccc:	8a068693          	addi	a3,a3,-1888 # ffffffffc020f568 <dev_node_ops+0x538>
ffffffffc0209cd0:	00002617          	auipc	a2,0x2
ffffffffc0209cd4:	34060613          	addi	a2,a2,832 # ffffffffc020c010 <commands+0x210>
ffffffffc0209cd8:	0e000593          	li	a1,224
ffffffffc0209cdc:	00005517          	auipc	a0,0x5
ffffffffc0209ce0:	76450513          	addi	a0,a0,1892 # ffffffffc020f440 <dev_node_ops+0x410>
ffffffffc0209ce4:	fbaf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209ce8 <sfs_mount>:
ffffffffc0209ce8:	00000597          	auipc	a1,0x0
ffffffffc0209cec:	d2458593          	addi	a1,a1,-732 # ffffffffc0209a0c <sfs_do_mount>
ffffffffc0209cf0:	817fe06f          	j	ffffffffc0208506 <vfs_mount>

ffffffffc0209cf4 <sfs_opendir>:
ffffffffc0209cf4:	0235f593          	andi	a1,a1,35
ffffffffc0209cf8:	4501                	li	a0,0
ffffffffc0209cfa:	e191                	bnez	a1,ffffffffc0209cfe <sfs_opendir+0xa>
ffffffffc0209cfc:	8082                	ret
ffffffffc0209cfe:	553d                	li	a0,-17
ffffffffc0209d00:	8082                	ret

ffffffffc0209d02 <sfs_openfile>:
ffffffffc0209d02:	4501                	li	a0,0
ffffffffc0209d04:	8082                	ret

ffffffffc0209d06 <sfs_gettype>:
ffffffffc0209d06:	1141                	addi	sp,sp,-16
ffffffffc0209d08:	e406                	sd	ra,8(sp)
ffffffffc0209d0a:	c939                	beqz	a0,ffffffffc0209d60 <sfs_gettype+0x5a>
ffffffffc0209d0c:	4d34                	lw	a3,88(a0)
ffffffffc0209d0e:	6785                	lui	a5,0x1
ffffffffc0209d10:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209d14:	04e69663          	bne	a3,a4,ffffffffc0209d60 <sfs_gettype+0x5a>
ffffffffc0209d18:	6114                	ld	a3,0(a0)
ffffffffc0209d1a:	4709                	li	a4,2
ffffffffc0209d1c:	0046d683          	lhu	a3,4(a3)
ffffffffc0209d20:	02e68a63          	beq	a3,a4,ffffffffc0209d54 <sfs_gettype+0x4e>
ffffffffc0209d24:	470d                	li	a4,3
ffffffffc0209d26:	02e68163          	beq	a3,a4,ffffffffc0209d48 <sfs_gettype+0x42>
ffffffffc0209d2a:	4705                	li	a4,1
ffffffffc0209d2c:	00e68f63          	beq	a3,a4,ffffffffc0209d4a <sfs_gettype+0x44>
ffffffffc0209d30:	00006617          	auipc	a2,0x6
ffffffffc0209d34:	8d860613          	addi	a2,a2,-1832 # ffffffffc020f608 <dev_node_ops+0x5d8>
ffffffffc0209d38:	37700593          	li	a1,887
ffffffffc0209d3c:	00006517          	auipc	a0,0x6
ffffffffc0209d40:	8b450513          	addi	a0,a0,-1868 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc0209d44:	f5af60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d48:	678d                	lui	a5,0x3
ffffffffc0209d4a:	60a2                	ld	ra,8(sp)
ffffffffc0209d4c:	c19c                	sw	a5,0(a1)
ffffffffc0209d4e:	4501                	li	a0,0
ffffffffc0209d50:	0141                	addi	sp,sp,16
ffffffffc0209d52:	8082                	ret
ffffffffc0209d54:	60a2                	ld	ra,8(sp)
ffffffffc0209d56:	6789                	lui	a5,0x2
ffffffffc0209d58:	c19c                	sw	a5,0(a1)
ffffffffc0209d5a:	4501                	li	a0,0
ffffffffc0209d5c:	0141                	addi	sp,sp,16
ffffffffc0209d5e:	8082                	ret
ffffffffc0209d60:	00006697          	auipc	a3,0x6
ffffffffc0209d64:	85868693          	addi	a3,a3,-1960 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc0209d68:	00002617          	auipc	a2,0x2
ffffffffc0209d6c:	2a860613          	addi	a2,a2,680 # ffffffffc020c010 <commands+0x210>
ffffffffc0209d70:	36b00593          	li	a1,875
ffffffffc0209d74:	00006517          	auipc	a0,0x6
ffffffffc0209d78:	87c50513          	addi	a0,a0,-1924 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc0209d7c:	f22f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209d80 <sfs_fsync>:
ffffffffc0209d80:	7179                	addi	sp,sp,-48
ffffffffc0209d82:	ec26                	sd	s1,24(sp)
ffffffffc0209d84:	7524                	ld	s1,104(a0)
ffffffffc0209d86:	f406                	sd	ra,40(sp)
ffffffffc0209d88:	f022                	sd	s0,32(sp)
ffffffffc0209d8a:	e84a                	sd	s2,16(sp)
ffffffffc0209d8c:	e44e                	sd	s3,8(sp)
ffffffffc0209d8e:	c4bd                	beqz	s1,ffffffffc0209dfc <sfs_fsync+0x7c>
ffffffffc0209d90:	0b04a783          	lw	a5,176(s1)
ffffffffc0209d94:	e7a5                	bnez	a5,ffffffffc0209dfc <sfs_fsync+0x7c>
ffffffffc0209d96:	4d38                	lw	a4,88(a0)
ffffffffc0209d98:	6785                	lui	a5,0x1
ffffffffc0209d9a:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209d9e:	842a                	mv	s0,a0
ffffffffc0209da0:	06f71e63          	bne	a4,a5,ffffffffc0209e1c <sfs_fsync+0x9c>
ffffffffc0209da4:	691c                	ld	a5,16(a0)
ffffffffc0209da6:	4901                	li	s2,0
ffffffffc0209da8:	eb89                	bnez	a5,ffffffffc0209dba <sfs_fsync+0x3a>
ffffffffc0209daa:	70a2                	ld	ra,40(sp)
ffffffffc0209dac:	7402                	ld	s0,32(sp)
ffffffffc0209dae:	64e2                	ld	s1,24(sp)
ffffffffc0209db0:	69a2                	ld	s3,8(sp)
ffffffffc0209db2:	854a                	mv	a0,s2
ffffffffc0209db4:	6942                	ld	s2,16(sp)
ffffffffc0209db6:	6145                	addi	sp,sp,48
ffffffffc0209db8:	8082                	ret
ffffffffc0209dba:	02050993          	addi	s3,a0,32
ffffffffc0209dbe:	854e                	mv	a0,s3
ffffffffc0209dc0:	835fa0ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc0209dc4:	681c                	ld	a5,16(s0)
ffffffffc0209dc6:	ef81                	bnez	a5,ffffffffc0209dde <sfs_fsync+0x5e>
ffffffffc0209dc8:	854e                	mv	a0,s3
ffffffffc0209dca:	827fa0ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc0209dce:	70a2                	ld	ra,40(sp)
ffffffffc0209dd0:	7402                	ld	s0,32(sp)
ffffffffc0209dd2:	64e2                	ld	s1,24(sp)
ffffffffc0209dd4:	69a2                	ld	s3,8(sp)
ffffffffc0209dd6:	854a                	mv	a0,s2
ffffffffc0209dd8:	6942                	ld	s2,16(sp)
ffffffffc0209dda:	6145                	addi	sp,sp,48
ffffffffc0209ddc:	8082                	ret
ffffffffc0209dde:	4414                	lw	a3,8(s0)
ffffffffc0209de0:	600c                	ld	a1,0(s0)
ffffffffc0209de2:	00043823          	sd	zero,16(s0)
ffffffffc0209de6:	4701                	li	a4,0
ffffffffc0209de8:	04000613          	li	a2,64
ffffffffc0209dec:	8526                	mv	a0,s1
ffffffffc0209dee:	638010ef          	jal	ra,ffffffffc020b426 <sfs_wbuf>
ffffffffc0209df2:	892a                	mv	s2,a0
ffffffffc0209df4:	d971                	beqz	a0,ffffffffc0209dc8 <sfs_fsync+0x48>
ffffffffc0209df6:	4785                	li	a5,1
ffffffffc0209df8:	e81c                	sd	a5,16(s0)
ffffffffc0209dfa:	b7f9                	j	ffffffffc0209dc8 <sfs_fsync+0x48>
ffffffffc0209dfc:	00005697          	auipc	a3,0x5
ffffffffc0209e00:	61468693          	addi	a3,a3,1556 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc0209e04:	00002617          	auipc	a2,0x2
ffffffffc0209e08:	20c60613          	addi	a2,a2,524 # ffffffffc020c010 <commands+0x210>
ffffffffc0209e0c:	2af00593          	li	a1,687
ffffffffc0209e10:	00005517          	auipc	a0,0x5
ffffffffc0209e14:	7e050513          	addi	a0,a0,2016 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc0209e18:	e86f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209e1c:	00005697          	auipc	a3,0x5
ffffffffc0209e20:	79c68693          	addi	a3,a3,1948 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc0209e24:	00002617          	auipc	a2,0x2
ffffffffc0209e28:	1ec60613          	addi	a2,a2,492 # ffffffffc020c010 <commands+0x210>
ffffffffc0209e2c:	2b000593          	li	a1,688
ffffffffc0209e30:	00005517          	auipc	a0,0x5
ffffffffc0209e34:	7c050513          	addi	a0,a0,1984 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc0209e38:	e66f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209e3c <sfs_fstat>:
ffffffffc0209e3c:	1101                	addi	sp,sp,-32
ffffffffc0209e3e:	e426                	sd	s1,8(sp)
ffffffffc0209e40:	84ae                	mv	s1,a1
ffffffffc0209e42:	e822                	sd	s0,16(sp)
ffffffffc0209e44:	02000613          	li	a2,32
ffffffffc0209e48:	842a                	mv	s0,a0
ffffffffc0209e4a:	4581                	li	a1,0
ffffffffc0209e4c:	8526                	mv	a0,s1
ffffffffc0209e4e:	ec06                	sd	ra,24(sp)
ffffffffc0209e50:	4db010ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc0209e54:	c439                	beqz	s0,ffffffffc0209ea2 <sfs_fstat+0x66>
ffffffffc0209e56:	783c                	ld	a5,112(s0)
ffffffffc0209e58:	c7a9                	beqz	a5,ffffffffc0209ea2 <sfs_fstat+0x66>
ffffffffc0209e5a:	6bbc                	ld	a5,80(a5)
ffffffffc0209e5c:	c3b9                	beqz	a5,ffffffffc0209ea2 <sfs_fstat+0x66>
ffffffffc0209e5e:	00005597          	auipc	a1,0x5
ffffffffc0209e62:	14a58593          	addi	a1,a1,330 # ffffffffc020efa8 <syscalls+0xdb0>
ffffffffc0209e66:	8522                	mv	a0,s0
ffffffffc0209e68:	8cefe0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0209e6c:	783c                	ld	a5,112(s0)
ffffffffc0209e6e:	85a6                	mv	a1,s1
ffffffffc0209e70:	8522                	mv	a0,s0
ffffffffc0209e72:	6bbc                	ld	a5,80(a5)
ffffffffc0209e74:	9782                	jalr	a5
ffffffffc0209e76:	e10d                	bnez	a0,ffffffffc0209e98 <sfs_fstat+0x5c>
ffffffffc0209e78:	4c38                	lw	a4,88(s0)
ffffffffc0209e7a:	6785                	lui	a5,0x1
ffffffffc0209e7c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209e80:	04f71163          	bne	a4,a5,ffffffffc0209ec2 <sfs_fstat+0x86>
ffffffffc0209e84:	601c                	ld	a5,0(s0)
ffffffffc0209e86:	0067d683          	lhu	a3,6(a5)
ffffffffc0209e8a:	0087e703          	lwu	a4,8(a5)
ffffffffc0209e8e:	0007e783          	lwu	a5,0(a5)
ffffffffc0209e92:	e494                	sd	a3,8(s1)
ffffffffc0209e94:	e898                	sd	a4,16(s1)
ffffffffc0209e96:	ec9c                	sd	a5,24(s1)
ffffffffc0209e98:	60e2                	ld	ra,24(sp)
ffffffffc0209e9a:	6442                	ld	s0,16(sp)
ffffffffc0209e9c:	64a2                	ld	s1,8(sp)
ffffffffc0209e9e:	6105                	addi	sp,sp,32
ffffffffc0209ea0:	8082                	ret
ffffffffc0209ea2:	00005697          	auipc	a3,0x5
ffffffffc0209ea6:	09e68693          	addi	a3,a3,158 # ffffffffc020ef40 <syscalls+0xd48>
ffffffffc0209eaa:	00002617          	auipc	a2,0x2
ffffffffc0209eae:	16660613          	addi	a2,a2,358 # ffffffffc020c010 <commands+0x210>
ffffffffc0209eb2:	2a000593          	li	a1,672
ffffffffc0209eb6:	00005517          	auipc	a0,0x5
ffffffffc0209eba:	73a50513          	addi	a0,a0,1850 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc0209ebe:	de0f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209ec2:	00005697          	auipc	a3,0x5
ffffffffc0209ec6:	6f668693          	addi	a3,a3,1782 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc0209eca:	00002617          	auipc	a2,0x2
ffffffffc0209ece:	14660613          	addi	a2,a2,326 # ffffffffc020c010 <commands+0x210>
ffffffffc0209ed2:	2a300593          	li	a1,675
ffffffffc0209ed6:	00005517          	auipc	a0,0x5
ffffffffc0209eda:	71a50513          	addi	a0,a0,1818 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc0209ede:	dc0f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209ee2 <sfs_tryseek>:
ffffffffc0209ee2:	080007b7          	lui	a5,0x8000
ffffffffc0209ee6:	04f5fd63          	bgeu	a1,a5,ffffffffc0209f40 <sfs_tryseek+0x5e>
ffffffffc0209eea:	1101                	addi	sp,sp,-32
ffffffffc0209eec:	e822                	sd	s0,16(sp)
ffffffffc0209eee:	ec06                	sd	ra,24(sp)
ffffffffc0209ef0:	e426                	sd	s1,8(sp)
ffffffffc0209ef2:	842a                	mv	s0,a0
ffffffffc0209ef4:	c921                	beqz	a0,ffffffffc0209f44 <sfs_tryseek+0x62>
ffffffffc0209ef6:	4d38                	lw	a4,88(a0)
ffffffffc0209ef8:	6785                	lui	a5,0x1
ffffffffc0209efa:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209efe:	04f71363          	bne	a4,a5,ffffffffc0209f44 <sfs_tryseek+0x62>
ffffffffc0209f02:	611c                	ld	a5,0(a0)
ffffffffc0209f04:	84ae                	mv	s1,a1
ffffffffc0209f06:	0007e783          	lwu	a5,0(a5)
ffffffffc0209f0a:	02b7d563          	bge	a5,a1,ffffffffc0209f34 <sfs_tryseek+0x52>
ffffffffc0209f0e:	793c                	ld	a5,112(a0)
ffffffffc0209f10:	cbb1                	beqz	a5,ffffffffc0209f64 <sfs_tryseek+0x82>
ffffffffc0209f12:	73bc                	ld	a5,96(a5)
ffffffffc0209f14:	cba1                	beqz	a5,ffffffffc0209f64 <sfs_tryseek+0x82>
ffffffffc0209f16:	00005597          	auipc	a1,0x5
ffffffffc0209f1a:	f8258593          	addi	a1,a1,-126 # ffffffffc020ee98 <syscalls+0xca0>
ffffffffc0209f1e:	818fe0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0209f22:	783c                	ld	a5,112(s0)
ffffffffc0209f24:	8522                	mv	a0,s0
ffffffffc0209f26:	6442                	ld	s0,16(sp)
ffffffffc0209f28:	60e2                	ld	ra,24(sp)
ffffffffc0209f2a:	73bc                	ld	a5,96(a5)
ffffffffc0209f2c:	85a6                	mv	a1,s1
ffffffffc0209f2e:	64a2                	ld	s1,8(sp)
ffffffffc0209f30:	6105                	addi	sp,sp,32
ffffffffc0209f32:	8782                	jr	a5
ffffffffc0209f34:	60e2                	ld	ra,24(sp)
ffffffffc0209f36:	6442                	ld	s0,16(sp)
ffffffffc0209f38:	64a2                	ld	s1,8(sp)
ffffffffc0209f3a:	4501                	li	a0,0
ffffffffc0209f3c:	6105                	addi	sp,sp,32
ffffffffc0209f3e:	8082                	ret
ffffffffc0209f40:	5575                	li	a0,-3
ffffffffc0209f42:	8082                	ret
ffffffffc0209f44:	00005697          	auipc	a3,0x5
ffffffffc0209f48:	67468693          	addi	a3,a3,1652 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc0209f4c:	00002617          	auipc	a2,0x2
ffffffffc0209f50:	0c460613          	addi	a2,a2,196 # ffffffffc020c010 <commands+0x210>
ffffffffc0209f54:	38200593          	li	a1,898
ffffffffc0209f58:	00005517          	auipc	a0,0x5
ffffffffc0209f5c:	69850513          	addi	a0,a0,1688 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc0209f60:	d3ef60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209f64:	00005697          	auipc	a3,0x5
ffffffffc0209f68:	edc68693          	addi	a3,a3,-292 # ffffffffc020ee40 <syscalls+0xc48>
ffffffffc0209f6c:	00002617          	auipc	a2,0x2
ffffffffc0209f70:	0a460613          	addi	a2,a2,164 # ffffffffc020c010 <commands+0x210>
ffffffffc0209f74:	38400593          	li	a1,900
ffffffffc0209f78:	00005517          	auipc	a0,0x5
ffffffffc0209f7c:	67850513          	addi	a0,a0,1656 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc0209f80:	d1ef60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209f84 <sfs_close>:
ffffffffc0209f84:	1141                	addi	sp,sp,-16
ffffffffc0209f86:	e406                	sd	ra,8(sp)
ffffffffc0209f88:	e022                	sd	s0,0(sp)
ffffffffc0209f8a:	c11d                	beqz	a0,ffffffffc0209fb0 <sfs_close+0x2c>
ffffffffc0209f8c:	793c                	ld	a5,112(a0)
ffffffffc0209f8e:	842a                	mv	s0,a0
ffffffffc0209f90:	c385                	beqz	a5,ffffffffc0209fb0 <sfs_close+0x2c>
ffffffffc0209f92:	7b9c                	ld	a5,48(a5)
ffffffffc0209f94:	cf91                	beqz	a5,ffffffffc0209fb0 <sfs_close+0x2c>
ffffffffc0209f96:	00004597          	auipc	a1,0x4
ffffffffc0209f9a:	a0258593          	addi	a1,a1,-1534 # ffffffffc020d998 <default_pmm_manager+0xea0>
ffffffffc0209f9e:	f99fd0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc0209fa2:	783c                	ld	a5,112(s0)
ffffffffc0209fa4:	8522                	mv	a0,s0
ffffffffc0209fa6:	6402                	ld	s0,0(sp)
ffffffffc0209fa8:	60a2                	ld	ra,8(sp)
ffffffffc0209faa:	7b9c                	ld	a5,48(a5)
ffffffffc0209fac:	0141                	addi	sp,sp,16
ffffffffc0209fae:	8782                	jr	a5
ffffffffc0209fb0:	00004697          	auipc	a3,0x4
ffffffffc0209fb4:	99868693          	addi	a3,a3,-1640 # ffffffffc020d948 <default_pmm_manager+0xe50>
ffffffffc0209fb8:	00002617          	auipc	a2,0x2
ffffffffc0209fbc:	05860613          	addi	a2,a2,88 # ffffffffc020c010 <commands+0x210>
ffffffffc0209fc0:	21c00593          	li	a1,540
ffffffffc0209fc4:	00005517          	auipc	a0,0x5
ffffffffc0209fc8:	62c50513          	addi	a0,a0,1580 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc0209fcc:	cd2f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209fd0 <sfs_io.part.0>:
ffffffffc0209fd0:	1141                	addi	sp,sp,-16
ffffffffc0209fd2:	00005697          	auipc	a3,0x5
ffffffffc0209fd6:	5e668693          	addi	a3,a3,1510 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc0209fda:	00002617          	auipc	a2,0x2
ffffffffc0209fde:	03660613          	addi	a2,a2,54 # ffffffffc020c010 <commands+0x210>
ffffffffc0209fe2:	27f00593          	li	a1,639
ffffffffc0209fe6:	00005517          	auipc	a0,0x5
ffffffffc0209fea:	60a50513          	addi	a0,a0,1546 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc0209fee:	e406                	sd	ra,8(sp)
ffffffffc0209ff0:	caef60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209ff4 <sfs_block_free>:
ffffffffc0209ff4:	1101                	addi	sp,sp,-32
ffffffffc0209ff6:	e426                	sd	s1,8(sp)
ffffffffc0209ff8:	ec06                	sd	ra,24(sp)
ffffffffc0209ffa:	e822                	sd	s0,16(sp)
ffffffffc0209ffc:	4154                	lw	a3,4(a0)
ffffffffc0209ffe:	84ae                	mv	s1,a1
ffffffffc020a000:	c595                	beqz	a1,ffffffffc020a02c <sfs_block_free+0x38>
ffffffffc020a002:	02d5f563          	bgeu	a1,a3,ffffffffc020a02c <sfs_block_free+0x38>
ffffffffc020a006:	842a                	mv	s0,a0
ffffffffc020a008:	7d08                	ld	a0,56(a0)
ffffffffc020a00a:	edcff0ef          	jal	ra,ffffffffc02096e6 <bitmap_test>
ffffffffc020a00e:	ed05                	bnez	a0,ffffffffc020a046 <sfs_block_free+0x52>
ffffffffc020a010:	7c08                	ld	a0,56(s0)
ffffffffc020a012:	85a6                	mv	a1,s1
ffffffffc020a014:	efaff0ef          	jal	ra,ffffffffc020970e <bitmap_free>
ffffffffc020a018:	441c                	lw	a5,8(s0)
ffffffffc020a01a:	4705                	li	a4,1
ffffffffc020a01c:	60e2                	ld	ra,24(sp)
ffffffffc020a01e:	2785                	addiw	a5,a5,1
ffffffffc020a020:	e038                	sd	a4,64(s0)
ffffffffc020a022:	c41c                	sw	a5,8(s0)
ffffffffc020a024:	6442                	ld	s0,16(sp)
ffffffffc020a026:	64a2                	ld	s1,8(sp)
ffffffffc020a028:	6105                	addi	sp,sp,32
ffffffffc020a02a:	8082                	ret
ffffffffc020a02c:	8726                	mv	a4,s1
ffffffffc020a02e:	00005617          	auipc	a2,0x5
ffffffffc020a032:	5f260613          	addi	a2,a2,1522 # ffffffffc020f620 <dev_node_ops+0x5f0>
ffffffffc020a036:	05300593          	li	a1,83
ffffffffc020a03a:	00005517          	auipc	a0,0x5
ffffffffc020a03e:	5b650513          	addi	a0,a0,1462 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a042:	c5cf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a046:	00005697          	auipc	a3,0x5
ffffffffc020a04a:	61268693          	addi	a3,a3,1554 # ffffffffc020f658 <dev_node_ops+0x628>
ffffffffc020a04e:	00002617          	auipc	a2,0x2
ffffffffc020a052:	fc260613          	addi	a2,a2,-62 # ffffffffc020c010 <commands+0x210>
ffffffffc020a056:	06a00593          	li	a1,106
ffffffffc020a05a:	00005517          	auipc	a0,0x5
ffffffffc020a05e:	59650513          	addi	a0,a0,1430 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a062:	c3cf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a066 <sfs_reclaim>:
ffffffffc020a066:	1101                	addi	sp,sp,-32
ffffffffc020a068:	e426                	sd	s1,8(sp)
ffffffffc020a06a:	7524                	ld	s1,104(a0)
ffffffffc020a06c:	ec06                	sd	ra,24(sp)
ffffffffc020a06e:	e822                	sd	s0,16(sp)
ffffffffc020a070:	e04a                	sd	s2,0(sp)
ffffffffc020a072:	0e048a63          	beqz	s1,ffffffffc020a166 <sfs_reclaim+0x100>
ffffffffc020a076:	0b04a783          	lw	a5,176(s1)
ffffffffc020a07a:	0e079663          	bnez	a5,ffffffffc020a166 <sfs_reclaim+0x100>
ffffffffc020a07e:	4d38                	lw	a4,88(a0)
ffffffffc020a080:	6785                	lui	a5,0x1
ffffffffc020a082:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a086:	842a                	mv	s0,a0
ffffffffc020a088:	10f71f63          	bne	a4,a5,ffffffffc020a1a6 <sfs_reclaim+0x140>
ffffffffc020a08c:	8526                	mv	a0,s1
ffffffffc020a08e:	548010ef          	jal	ra,ffffffffc020b5d6 <lock_sfs_fs>
ffffffffc020a092:	4c1c                	lw	a5,24(s0)
ffffffffc020a094:	0ef05963          	blez	a5,ffffffffc020a186 <sfs_reclaim+0x120>
ffffffffc020a098:	fff7871b          	addiw	a4,a5,-1
ffffffffc020a09c:	cc18                	sw	a4,24(s0)
ffffffffc020a09e:	eb59                	bnez	a4,ffffffffc020a134 <sfs_reclaim+0xce>
ffffffffc020a0a0:	05c42903          	lw	s2,92(s0)
ffffffffc020a0a4:	08091863          	bnez	s2,ffffffffc020a134 <sfs_reclaim+0xce>
ffffffffc020a0a8:	601c                	ld	a5,0(s0)
ffffffffc020a0aa:	0067d783          	lhu	a5,6(a5)
ffffffffc020a0ae:	e785                	bnez	a5,ffffffffc020a0d6 <sfs_reclaim+0x70>
ffffffffc020a0b0:	783c                	ld	a5,112(s0)
ffffffffc020a0b2:	10078a63          	beqz	a5,ffffffffc020a1c6 <sfs_reclaim+0x160>
ffffffffc020a0b6:	73bc                	ld	a5,96(a5)
ffffffffc020a0b8:	10078763          	beqz	a5,ffffffffc020a1c6 <sfs_reclaim+0x160>
ffffffffc020a0bc:	00005597          	auipc	a1,0x5
ffffffffc020a0c0:	ddc58593          	addi	a1,a1,-548 # ffffffffc020ee98 <syscalls+0xca0>
ffffffffc020a0c4:	8522                	mv	a0,s0
ffffffffc020a0c6:	e71fd0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc020a0ca:	783c                	ld	a5,112(s0)
ffffffffc020a0cc:	4581                	li	a1,0
ffffffffc020a0ce:	8522                	mv	a0,s0
ffffffffc020a0d0:	73bc                	ld	a5,96(a5)
ffffffffc020a0d2:	9782                	jalr	a5
ffffffffc020a0d4:	e559                	bnez	a0,ffffffffc020a162 <sfs_reclaim+0xfc>
ffffffffc020a0d6:	681c                	ld	a5,16(s0)
ffffffffc020a0d8:	c39d                	beqz	a5,ffffffffc020a0fe <sfs_reclaim+0x98>
ffffffffc020a0da:	783c                	ld	a5,112(s0)
ffffffffc020a0dc:	10078563          	beqz	a5,ffffffffc020a1e6 <sfs_reclaim+0x180>
ffffffffc020a0e0:	7b9c                	ld	a5,48(a5)
ffffffffc020a0e2:	10078263          	beqz	a5,ffffffffc020a1e6 <sfs_reclaim+0x180>
ffffffffc020a0e6:	8522                	mv	a0,s0
ffffffffc020a0e8:	00004597          	auipc	a1,0x4
ffffffffc020a0ec:	8b058593          	addi	a1,a1,-1872 # ffffffffc020d998 <default_pmm_manager+0xea0>
ffffffffc020a0f0:	e47fd0ef          	jal	ra,ffffffffc0207f36 <inode_check>
ffffffffc020a0f4:	783c                	ld	a5,112(s0)
ffffffffc020a0f6:	8522                	mv	a0,s0
ffffffffc020a0f8:	7b9c                	ld	a5,48(a5)
ffffffffc020a0fa:	9782                	jalr	a5
ffffffffc020a0fc:	e13d                	bnez	a0,ffffffffc020a162 <sfs_reclaim+0xfc>
ffffffffc020a0fe:	7c18                	ld	a4,56(s0)
ffffffffc020a100:	603c                	ld	a5,64(s0)
ffffffffc020a102:	8526                	mv	a0,s1
ffffffffc020a104:	e71c                	sd	a5,8(a4)
ffffffffc020a106:	e398                	sd	a4,0(a5)
ffffffffc020a108:	6438                	ld	a4,72(s0)
ffffffffc020a10a:	683c                	ld	a5,80(s0)
ffffffffc020a10c:	e71c                	sd	a5,8(a4)
ffffffffc020a10e:	e398                	sd	a4,0(a5)
ffffffffc020a110:	4d6010ef          	jal	ra,ffffffffc020b5e6 <unlock_sfs_fs>
ffffffffc020a114:	6008                	ld	a0,0(s0)
ffffffffc020a116:	00655783          	lhu	a5,6(a0)
ffffffffc020a11a:	cb85                	beqz	a5,ffffffffc020a14a <sfs_reclaim+0xe4>
ffffffffc020a11c:	faff70ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020a120:	8522                	mv	a0,s0
ffffffffc020a122:	da9fd0ef          	jal	ra,ffffffffc0207eca <inode_kill>
ffffffffc020a126:	60e2                	ld	ra,24(sp)
ffffffffc020a128:	6442                	ld	s0,16(sp)
ffffffffc020a12a:	64a2                	ld	s1,8(sp)
ffffffffc020a12c:	854a                	mv	a0,s2
ffffffffc020a12e:	6902                	ld	s2,0(sp)
ffffffffc020a130:	6105                	addi	sp,sp,32
ffffffffc020a132:	8082                	ret
ffffffffc020a134:	5945                	li	s2,-15
ffffffffc020a136:	8526                	mv	a0,s1
ffffffffc020a138:	4ae010ef          	jal	ra,ffffffffc020b5e6 <unlock_sfs_fs>
ffffffffc020a13c:	60e2                	ld	ra,24(sp)
ffffffffc020a13e:	6442                	ld	s0,16(sp)
ffffffffc020a140:	64a2                	ld	s1,8(sp)
ffffffffc020a142:	854a                	mv	a0,s2
ffffffffc020a144:	6902                	ld	s2,0(sp)
ffffffffc020a146:	6105                	addi	sp,sp,32
ffffffffc020a148:	8082                	ret
ffffffffc020a14a:	440c                	lw	a1,8(s0)
ffffffffc020a14c:	8526                	mv	a0,s1
ffffffffc020a14e:	ea7ff0ef          	jal	ra,ffffffffc0209ff4 <sfs_block_free>
ffffffffc020a152:	6008                	ld	a0,0(s0)
ffffffffc020a154:	5d4c                	lw	a1,60(a0)
ffffffffc020a156:	d1f9                	beqz	a1,ffffffffc020a11c <sfs_reclaim+0xb6>
ffffffffc020a158:	8526                	mv	a0,s1
ffffffffc020a15a:	e9bff0ef          	jal	ra,ffffffffc0209ff4 <sfs_block_free>
ffffffffc020a15e:	6008                	ld	a0,0(s0)
ffffffffc020a160:	bf75                	j	ffffffffc020a11c <sfs_reclaim+0xb6>
ffffffffc020a162:	892a                	mv	s2,a0
ffffffffc020a164:	bfc9                	j	ffffffffc020a136 <sfs_reclaim+0xd0>
ffffffffc020a166:	00005697          	auipc	a3,0x5
ffffffffc020a16a:	2aa68693          	addi	a3,a3,682 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc020a16e:	00002617          	auipc	a2,0x2
ffffffffc020a172:	ea260613          	addi	a2,a2,-350 # ffffffffc020c010 <commands+0x210>
ffffffffc020a176:	34000593          	li	a1,832
ffffffffc020a17a:	00005517          	auipc	a0,0x5
ffffffffc020a17e:	47650513          	addi	a0,a0,1142 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a182:	b1cf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a186:	00005697          	auipc	a3,0x5
ffffffffc020a18a:	4f268693          	addi	a3,a3,1266 # ffffffffc020f678 <dev_node_ops+0x648>
ffffffffc020a18e:	00002617          	auipc	a2,0x2
ffffffffc020a192:	e8260613          	addi	a2,a2,-382 # ffffffffc020c010 <commands+0x210>
ffffffffc020a196:	34600593          	li	a1,838
ffffffffc020a19a:	00005517          	auipc	a0,0x5
ffffffffc020a19e:	45650513          	addi	a0,a0,1110 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a1a2:	afcf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a1a6:	00005697          	auipc	a3,0x5
ffffffffc020a1aa:	41268693          	addi	a3,a3,1042 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc020a1ae:	00002617          	auipc	a2,0x2
ffffffffc020a1b2:	e6260613          	addi	a2,a2,-414 # ffffffffc020c010 <commands+0x210>
ffffffffc020a1b6:	34100593          	li	a1,833
ffffffffc020a1ba:	00005517          	auipc	a0,0x5
ffffffffc020a1be:	43650513          	addi	a0,a0,1078 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a1c2:	adcf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a1c6:	00005697          	auipc	a3,0x5
ffffffffc020a1ca:	c7a68693          	addi	a3,a3,-902 # ffffffffc020ee40 <syscalls+0xc48>
ffffffffc020a1ce:	00002617          	auipc	a2,0x2
ffffffffc020a1d2:	e4260613          	addi	a2,a2,-446 # ffffffffc020c010 <commands+0x210>
ffffffffc020a1d6:	34b00593          	li	a1,843
ffffffffc020a1da:	00005517          	auipc	a0,0x5
ffffffffc020a1de:	41650513          	addi	a0,a0,1046 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a1e2:	abcf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a1e6:	00003697          	auipc	a3,0x3
ffffffffc020a1ea:	76268693          	addi	a3,a3,1890 # ffffffffc020d948 <default_pmm_manager+0xe50>
ffffffffc020a1ee:	00002617          	auipc	a2,0x2
ffffffffc020a1f2:	e2260613          	addi	a2,a2,-478 # ffffffffc020c010 <commands+0x210>
ffffffffc020a1f6:	35000593          	li	a1,848
ffffffffc020a1fa:	00005517          	auipc	a0,0x5
ffffffffc020a1fe:	3f650513          	addi	a0,a0,1014 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a202:	a9cf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a206 <sfs_block_alloc>:
ffffffffc020a206:	1101                	addi	sp,sp,-32
ffffffffc020a208:	e822                	sd	s0,16(sp)
ffffffffc020a20a:	842a                	mv	s0,a0
ffffffffc020a20c:	7d08                	ld	a0,56(a0)
ffffffffc020a20e:	e426                	sd	s1,8(sp)
ffffffffc020a210:	ec06                	sd	ra,24(sp)
ffffffffc020a212:	84ae                	mv	s1,a1
ffffffffc020a214:	c62ff0ef          	jal	ra,ffffffffc0209676 <bitmap_alloc>
ffffffffc020a218:	e90d                	bnez	a0,ffffffffc020a24a <sfs_block_alloc+0x44>
ffffffffc020a21a:	441c                	lw	a5,8(s0)
ffffffffc020a21c:	cbad                	beqz	a5,ffffffffc020a28e <sfs_block_alloc+0x88>
ffffffffc020a21e:	37fd                	addiw	a5,a5,-1
ffffffffc020a220:	c41c                	sw	a5,8(s0)
ffffffffc020a222:	408c                	lw	a1,0(s1)
ffffffffc020a224:	4785                	li	a5,1
ffffffffc020a226:	e03c                	sd	a5,64(s0)
ffffffffc020a228:	4054                	lw	a3,4(s0)
ffffffffc020a22a:	c58d                	beqz	a1,ffffffffc020a254 <sfs_block_alloc+0x4e>
ffffffffc020a22c:	02d5f463          	bgeu	a1,a3,ffffffffc020a254 <sfs_block_alloc+0x4e>
ffffffffc020a230:	7c08                	ld	a0,56(s0)
ffffffffc020a232:	cb4ff0ef          	jal	ra,ffffffffc02096e6 <bitmap_test>
ffffffffc020a236:	ed05                	bnez	a0,ffffffffc020a26e <sfs_block_alloc+0x68>
ffffffffc020a238:	8522                	mv	a0,s0
ffffffffc020a23a:	6442                	ld	s0,16(sp)
ffffffffc020a23c:	408c                	lw	a1,0(s1)
ffffffffc020a23e:	60e2                	ld	ra,24(sp)
ffffffffc020a240:	64a2                	ld	s1,8(sp)
ffffffffc020a242:	4605                	li	a2,1
ffffffffc020a244:	6105                	addi	sp,sp,32
ffffffffc020a246:	3300106f          	j	ffffffffc020b576 <sfs_clear_block>
ffffffffc020a24a:	60e2                	ld	ra,24(sp)
ffffffffc020a24c:	6442                	ld	s0,16(sp)
ffffffffc020a24e:	64a2                	ld	s1,8(sp)
ffffffffc020a250:	6105                	addi	sp,sp,32
ffffffffc020a252:	8082                	ret
ffffffffc020a254:	872e                	mv	a4,a1
ffffffffc020a256:	00005617          	auipc	a2,0x5
ffffffffc020a25a:	3ca60613          	addi	a2,a2,970 # ffffffffc020f620 <dev_node_ops+0x5f0>
ffffffffc020a25e:	05300593          	li	a1,83
ffffffffc020a262:	00005517          	auipc	a0,0x5
ffffffffc020a266:	38e50513          	addi	a0,a0,910 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a26a:	a34f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a26e:	00005697          	auipc	a3,0x5
ffffffffc020a272:	44268693          	addi	a3,a3,1090 # ffffffffc020f6b0 <dev_node_ops+0x680>
ffffffffc020a276:	00002617          	auipc	a2,0x2
ffffffffc020a27a:	d9a60613          	addi	a2,a2,-614 # ffffffffc020c010 <commands+0x210>
ffffffffc020a27e:	06100593          	li	a1,97
ffffffffc020a282:	00005517          	auipc	a0,0x5
ffffffffc020a286:	36e50513          	addi	a0,a0,878 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a28a:	a14f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a28e:	00005697          	auipc	a3,0x5
ffffffffc020a292:	40268693          	addi	a3,a3,1026 # ffffffffc020f690 <dev_node_ops+0x660>
ffffffffc020a296:	00002617          	auipc	a2,0x2
ffffffffc020a29a:	d7a60613          	addi	a2,a2,-646 # ffffffffc020c010 <commands+0x210>
ffffffffc020a29e:	05f00593          	li	a1,95
ffffffffc020a2a2:	00005517          	auipc	a0,0x5
ffffffffc020a2a6:	34e50513          	addi	a0,a0,846 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a2aa:	9f4f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a2ae <sfs_bmap_load_nolock>:
ffffffffc020a2ae:	7159                	addi	sp,sp,-112
ffffffffc020a2b0:	f85a                	sd	s6,48(sp)
ffffffffc020a2b2:	0005bb03          	ld	s6,0(a1)
ffffffffc020a2b6:	f45e                	sd	s7,40(sp)
ffffffffc020a2b8:	f486                	sd	ra,104(sp)
ffffffffc020a2ba:	008b2b83          	lw	s7,8(s6)
ffffffffc020a2be:	f0a2                	sd	s0,96(sp)
ffffffffc020a2c0:	eca6                	sd	s1,88(sp)
ffffffffc020a2c2:	e8ca                	sd	s2,80(sp)
ffffffffc020a2c4:	e4ce                	sd	s3,72(sp)
ffffffffc020a2c6:	e0d2                	sd	s4,64(sp)
ffffffffc020a2c8:	fc56                	sd	s5,56(sp)
ffffffffc020a2ca:	f062                	sd	s8,32(sp)
ffffffffc020a2cc:	ec66                	sd	s9,24(sp)
ffffffffc020a2ce:	18cbe363          	bltu	s7,a2,ffffffffc020a454 <sfs_bmap_load_nolock+0x1a6>
ffffffffc020a2d2:	47ad                	li	a5,11
ffffffffc020a2d4:	8aae                	mv	s5,a1
ffffffffc020a2d6:	8432                	mv	s0,a2
ffffffffc020a2d8:	84aa                	mv	s1,a0
ffffffffc020a2da:	89b6                	mv	s3,a3
ffffffffc020a2dc:	04c7f563          	bgeu	a5,a2,ffffffffc020a326 <sfs_bmap_load_nolock+0x78>
ffffffffc020a2e0:	ff46071b          	addiw	a4,a2,-12
ffffffffc020a2e4:	0007069b          	sext.w	a3,a4
ffffffffc020a2e8:	3ff00793          	li	a5,1023
ffffffffc020a2ec:	1ad7e163          	bltu	a5,a3,ffffffffc020a48e <sfs_bmap_load_nolock+0x1e0>
ffffffffc020a2f0:	03cb2a03          	lw	s4,60(s6)
ffffffffc020a2f4:	02071793          	slli	a5,a4,0x20
ffffffffc020a2f8:	c602                	sw	zero,12(sp)
ffffffffc020a2fa:	c452                	sw	s4,8(sp)
ffffffffc020a2fc:	01e7dc13          	srli	s8,a5,0x1e
ffffffffc020a300:	0e0a1e63          	bnez	s4,ffffffffc020a3fc <sfs_bmap_load_nolock+0x14e>
ffffffffc020a304:	0acb8663          	beq	s7,a2,ffffffffc020a3b0 <sfs_bmap_load_nolock+0x102>
ffffffffc020a308:	4a01                	li	s4,0
ffffffffc020a30a:	40d4                	lw	a3,4(s1)
ffffffffc020a30c:	8752                	mv	a4,s4
ffffffffc020a30e:	00005617          	auipc	a2,0x5
ffffffffc020a312:	31260613          	addi	a2,a2,786 # ffffffffc020f620 <dev_node_ops+0x5f0>
ffffffffc020a316:	05300593          	li	a1,83
ffffffffc020a31a:	00005517          	auipc	a0,0x5
ffffffffc020a31e:	2d650513          	addi	a0,a0,726 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a322:	97cf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a326:	02061793          	slli	a5,a2,0x20
ffffffffc020a32a:	01e7da13          	srli	s4,a5,0x1e
ffffffffc020a32e:	9a5a                	add	s4,s4,s6
ffffffffc020a330:	00ca2583          	lw	a1,12(s4)
ffffffffc020a334:	c22e                	sw	a1,4(sp)
ffffffffc020a336:	ed99                	bnez	a1,ffffffffc020a354 <sfs_bmap_load_nolock+0xa6>
ffffffffc020a338:	fccb98e3          	bne	s7,a2,ffffffffc020a308 <sfs_bmap_load_nolock+0x5a>
ffffffffc020a33c:	004c                	addi	a1,sp,4
ffffffffc020a33e:	ec9ff0ef          	jal	ra,ffffffffc020a206 <sfs_block_alloc>
ffffffffc020a342:	892a                	mv	s2,a0
ffffffffc020a344:	e921                	bnez	a0,ffffffffc020a394 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a346:	4592                	lw	a1,4(sp)
ffffffffc020a348:	4705                	li	a4,1
ffffffffc020a34a:	00ba2623          	sw	a1,12(s4)
ffffffffc020a34e:	00eab823          	sd	a4,16(s5)
ffffffffc020a352:	d9dd                	beqz	a1,ffffffffc020a308 <sfs_bmap_load_nolock+0x5a>
ffffffffc020a354:	40d4                	lw	a3,4(s1)
ffffffffc020a356:	10d5ff63          	bgeu	a1,a3,ffffffffc020a474 <sfs_bmap_load_nolock+0x1c6>
ffffffffc020a35a:	7c88                	ld	a0,56(s1)
ffffffffc020a35c:	b8aff0ef          	jal	ra,ffffffffc02096e6 <bitmap_test>
ffffffffc020a360:	18051363          	bnez	a0,ffffffffc020a4e6 <sfs_bmap_load_nolock+0x238>
ffffffffc020a364:	4a12                	lw	s4,4(sp)
ffffffffc020a366:	fa0a02e3          	beqz	s4,ffffffffc020a30a <sfs_bmap_load_nolock+0x5c>
ffffffffc020a36a:	40dc                	lw	a5,4(s1)
ffffffffc020a36c:	f8fa7fe3          	bgeu	s4,a5,ffffffffc020a30a <sfs_bmap_load_nolock+0x5c>
ffffffffc020a370:	7c88                	ld	a0,56(s1)
ffffffffc020a372:	85d2                	mv	a1,s4
ffffffffc020a374:	b72ff0ef          	jal	ra,ffffffffc02096e6 <bitmap_test>
ffffffffc020a378:	12051763          	bnez	a0,ffffffffc020a4a6 <sfs_bmap_load_nolock+0x1f8>
ffffffffc020a37c:	008b9763          	bne	s7,s0,ffffffffc020a38a <sfs_bmap_load_nolock+0xdc>
ffffffffc020a380:	008b2783          	lw	a5,8(s6)
ffffffffc020a384:	2785                	addiw	a5,a5,1
ffffffffc020a386:	00fb2423          	sw	a5,8(s6)
ffffffffc020a38a:	4901                	li	s2,0
ffffffffc020a38c:	00098463          	beqz	s3,ffffffffc020a394 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a390:	0149a023          	sw	s4,0(s3)
ffffffffc020a394:	70a6                	ld	ra,104(sp)
ffffffffc020a396:	7406                	ld	s0,96(sp)
ffffffffc020a398:	64e6                	ld	s1,88(sp)
ffffffffc020a39a:	69a6                	ld	s3,72(sp)
ffffffffc020a39c:	6a06                	ld	s4,64(sp)
ffffffffc020a39e:	7ae2                	ld	s5,56(sp)
ffffffffc020a3a0:	7b42                	ld	s6,48(sp)
ffffffffc020a3a2:	7ba2                	ld	s7,40(sp)
ffffffffc020a3a4:	7c02                	ld	s8,32(sp)
ffffffffc020a3a6:	6ce2                	ld	s9,24(sp)
ffffffffc020a3a8:	854a                	mv	a0,s2
ffffffffc020a3aa:	6946                	ld	s2,80(sp)
ffffffffc020a3ac:	6165                	addi	sp,sp,112
ffffffffc020a3ae:	8082                	ret
ffffffffc020a3b0:	002c                	addi	a1,sp,8
ffffffffc020a3b2:	e55ff0ef          	jal	ra,ffffffffc020a206 <sfs_block_alloc>
ffffffffc020a3b6:	892a                	mv	s2,a0
ffffffffc020a3b8:	00c10c93          	addi	s9,sp,12
ffffffffc020a3bc:	fd61                	bnez	a0,ffffffffc020a394 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a3be:	85e6                	mv	a1,s9
ffffffffc020a3c0:	8526                	mv	a0,s1
ffffffffc020a3c2:	e45ff0ef          	jal	ra,ffffffffc020a206 <sfs_block_alloc>
ffffffffc020a3c6:	892a                	mv	s2,a0
ffffffffc020a3c8:	e925                	bnez	a0,ffffffffc020a438 <sfs_bmap_load_nolock+0x18a>
ffffffffc020a3ca:	46a2                	lw	a3,8(sp)
ffffffffc020a3cc:	85e6                	mv	a1,s9
ffffffffc020a3ce:	8762                	mv	a4,s8
ffffffffc020a3d0:	4611                	li	a2,4
ffffffffc020a3d2:	8526                	mv	a0,s1
ffffffffc020a3d4:	052010ef          	jal	ra,ffffffffc020b426 <sfs_wbuf>
ffffffffc020a3d8:	45b2                	lw	a1,12(sp)
ffffffffc020a3da:	892a                	mv	s2,a0
ffffffffc020a3dc:	e939                	bnez	a0,ffffffffc020a432 <sfs_bmap_load_nolock+0x184>
ffffffffc020a3de:	03cb2683          	lw	a3,60(s6)
ffffffffc020a3e2:	4722                	lw	a4,8(sp)
ffffffffc020a3e4:	c22e                	sw	a1,4(sp)
ffffffffc020a3e6:	f6d706e3          	beq	a4,a3,ffffffffc020a352 <sfs_bmap_load_nolock+0xa4>
ffffffffc020a3ea:	eef1                	bnez	a3,ffffffffc020a4c6 <sfs_bmap_load_nolock+0x218>
ffffffffc020a3ec:	02eb2e23          	sw	a4,60(s6)
ffffffffc020a3f0:	4705                	li	a4,1
ffffffffc020a3f2:	00eab823          	sd	a4,16(s5)
ffffffffc020a3f6:	f00589e3          	beqz	a1,ffffffffc020a308 <sfs_bmap_load_nolock+0x5a>
ffffffffc020a3fa:	bfa9                	j	ffffffffc020a354 <sfs_bmap_load_nolock+0xa6>
ffffffffc020a3fc:	00c10c93          	addi	s9,sp,12
ffffffffc020a400:	8762                	mv	a4,s8
ffffffffc020a402:	86d2                	mv	a3,s4
ffffffffc020a404:	4611                	li	a2,4
ffffffffc020a406:	85e6                	mv	a1,s9
ffffffffc020a408:	79f000ef          	jal	ra,ffffffffc020b3a6 <sfs_rbuf>
ffffffffc020a40c:	892a                	mv	s2,a0
ffffffffc020a40e:	f159                	bnez	a0,ffffffffc020a394 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a410:	45b2                	lw	a1,12(sp)
ffffffffc020a412:	e995                	bnez	a1,ffffffffc020a446 <sfs_bmap_load_nolock+0x198>
ffffffffc020a414:	fa8b85e3          	beq	s7,s0,ffffffffc020a3be <sfs_bmap_load_nolock+0x110>
ffffffffc020a418:	03cb2703          	lw	a4,60(s6)
ffffffffc020a41c:	47a2                	lw	a5,8(sp)
ffffffffc020a41e:	c202                	sw	zero,4(sp)
ffffffffc020a420:	eee784e3          	beq	a5,a4,ffffffffc020a308 <sfs_bmap_load_nolock+0x5a>
ffffffffc020a424:	e34d                	bnez	a4,ffffffffc020a4c6 <sfs_bmap_load_nolock+0x218>
ffffffffc020a426:	02fb2e23          	sw	a5,60(s6)
ffffffffc020a42a:	4785                	li	a5,1
ffffffffc020a42c:	00fab823          	sd	a5,16(s5)
ffffffffc020a430:	bde1                	j	ffffffffc020a308 <sfs_bmap_load_nolock+0x5a>
ffffffffc020a432:	8526                	mv	a0,s1
ffffffffc020a434:	bc1ff0ef          	jal	ra,ffffffffc0209ff4 <sfs_block_free>
ffffffffc020a438:	45a2                	lw	a1,8(sp)
ffffffffc020a43a:	f4ba0de3          	beq	s4,a1,ffffffffc020a394 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a43e:	8526                	mv	a0,s1
ffffffffc020a440:	bb5ff0ef          	jal	ra,ffffffffc0209ff4 <sfs_block_free>
ffffffffc020a444:	bf81                	j	ffffffffc020a394 <sfs_bmap_load_nolock+0xe6>
ffffffffc020a446:	03cb2683          	lw	a3,60(s6)
ffffffffc020a44a:	4722                	lw	a4,8(sp)
ffffffffc020a44c:	c22e                	sw	a1,4(sp)
ffffffffc020a44e:	f8e69ee3          	bne	a3,a4,ffffffffc020a3ea <sfs_bmap_load_nolock+0x13c>
ffffffffc020a452:	b709                	j	ffffffffc020a354 <sfs_bmap_load_nolock+0xa6>
ffffffffc020a454:	00005697          	auipc	a3,0x5
ffffffffc020a458:	28468693          	addi	a3,a3,644 # ffffffffc020f6d8 <dev_node_ops+0x6a8>
ffffffffc020a45c:	00002617          	auipc	a2,0x2
ffffffffc020a460:	bb460613          	addi	a2,a2,-1100 # ffffffffc020c010 <commands+0x210>
ffffffffc020a464:	16400593          	li	a1,356
ffffffffc020a468:	00005517          	auipc	a0,0x5
ffffffffc020a46c:	18850513          	addi	a0,a0,392 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a470:	82ef60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a474:	872e                	mv	a4,a1
ffffffffc020a476:	00005617          	auipc	a2,0x5
ffffffffc020a47a:	1aa60613          	addi	a2,a2,426 # ffffffffc020f620 <dev_node_ops+0x5f0>
ffffffffc020a47e:	05300593          	li	a1,83
ffffffffc020a482:	00005517          	auipc	a0,0x5
ffffffffc020a486:	16e50513          	addi	a0,a0,366 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a48a:	814f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a48e:	00005617          	auipc	a2,0x5
ffffffffc020a492:	27a60613          	addi	a2,a2,634 # ffffffffc020f708 <dev_node_ops+0x6d8>
ffffffffc020a496:	11e00593          	li	a1,286
ffffffffc020a49a:	00005517          	auipc	a0,0x5
ffffffffc020a49e:	15650513          	addi	a0,a0,342 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a4a2:	ffdf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a4a6:	00005697          	auipc	a3,0x5
ffffffffc020a4aa:	1b268693          	addi	a3,a3,434 # ffffffffc020f658 <dev_node_ops+0x628>
ffffffffc020a4ae:	00002617          	auipc	a2,0x2
ffffffffc020a4b2:	b6260613          	addi	a2,a2,-1182 # ffffffffc020c010 <commands+0x210>
ffffffffc020a4b6:	16b00593          	li	a1,363
ffffffffc020a4ba:	00005517          	auipc	a0,0x5
ffffffffc020a4be:	13650513          	addi	a0,a0,310 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a4c2:	fddf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a4c6:	00005697          	auipc	a3,0x5
ffffffffc020a4ca:	22a68693          	addi	a3,a3,554 # ffffffffc020f6f0 <dev_node_ops+0x6c0>
ffffffffc020a4ce:	00002617          	auipc	a2,0x2
ffffffffc020a4d2:	b4260613          	addi	a2,a2,-1214 # ffffffffc020c010 <commands+0x210>
ffffffffc020a4d6:	11800593          	li	a1,280
ffffffffc020a4da:	00005517          	auipc	a0,0x5
ffffffffc020a4de:	11650513          	addi	a0,a0,278 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a4e2:	fbdf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a4e6:	00005697          	auipc	a3,0x5
ffffffffc020a4ea:	25268693          	addi	a3,a3,594 # ffffffffc020f738 <dev_node_ops+0x708>
ffffffffc020a4ee:	00002617          	auipc	a2,0x2
ffffffffc020a4f2:	b2260613          	addi	a2,a2,-1246 # ffffffffc020c010 <commands+0x210>
ffffffffc020a4f6:	12100593          	li	a1,289
ffffffffc020a4fa:	00005517          	auipc	a0,0x5
ffffffffc020a4fe:	0f650513          	addi	a0,a0,246 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a502:	f9df50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a506 <sfs_io_nolock>:
ffffffffc020a506:	7175                	addi	sp,sp,-144
ffffffffc020a508:	f0d2                	sd	s4,96(sp)
ffffffffc020a50a:	8a2e                	mv	s4,a1
ffffffffc020a50c:	618c                	ld	a1,0(a1)
ffffffffc020a50e:	e506                	sd	ra,136(sp)
ffffffffc020a510:	e122                	sd	s0,128(sp)
ffffffffc020a512:	0045d883          	lhu	a7,4(a1)
ffffffffc020a516:	fca6                	sd	s1,120(sp)
ffffffffc020a518:	f8ca                	sd	s2,112(sp)
ffffffffc020a51a:	f4ce                	sd	s3,104(sp)
ffffffffc020a51c:	ecd6                	sd	s5,88(sp)
ffffffffc020a51e:	e8da                	sd	s6,80(sp)
ffffffffc020a520:	e4de                	sd	s7,72(sp)
ffffffffc020a522:	e0e2                	sd	s8,64(sp)
ffffffffc020a524:	fc66                	sd	s9,56(sp)
ffffffffc020a526:	f86a                	sd	s10,48(sp)
ffffffffc020a528:	f46e                	sd	s11,40(sp)
ffffffffc020a52a:	4809                	li	a6,2
ffffffffc020a52c:	e03a                	sd	a4,0(sp)
ffffffffc020a52e:	15088763          	beq	a7,a6,ffffffffc020a67c <sfs_io_nolock+0x176>
ffffffffc020a532:	8b36                	mv	s6,a3
ffffffffc020a534:	6682                	ld	a3,0(sp)
ffffffffc020a536:	08000737          	lui	a4,0x8000
ffffffffc020a53a:	8ab2                	mv	s5,a2
ffffffffc020a53c:	6284                	ld	s1,0(a3)
ffffffffc020a53e:	0006b023          	sd	zero,0(a3)
ffffffffc020a542:	86da                	mv	a3,s6
ffffffffc020a544:	94da                	add	s1,s1,s6
ffffffffc020a546:	8626                	mv	a2,s1
ffffffffc020a548:	12eb7563          	bgeu	s6,a4,ffffffffc020a672 <sfs_io_nolock+0x16c>
ffffffffc020a54c:	1364c363          	blt	s1,s6,ffffffffc020a672 <sfs_io_nolock+0x16c>
ffffffffc020a550:	4d81                	li	s11,0
ffffffffc020a552:	0e9b0063          	beq	s6,s1,ffffffffc020a632 <sfs_io_nolock+0x12c>
ffffffffc020a556:	89aa                	mv	s3,a0
ffffffffc020a558:	0e977d63          	bgeu	a4,s1,ffffffffc020a652 <sfs_io_nolock+0x14c>
ffffffffc020a55c:	cf89                	beqz	a5,ffffffffc020a576 <sfs_io_nolock+0x70>
ffffffffc020a55e:	00001797          	auipc	a5,0x1
ffffffffc020a562:	de878793          	addi	a5,a5,-536 # ffffffffc020b346 <sfs_wblock>
ffffffffc020a566:	080004b7          	lui	s1,0x8000
ffffffffc020a56a:	e43e                	sd	a5,8(sp)
ffffffffc020a56c:	00001c17          	auipc	s8,0x1
ffffffffc020a570:	ebac0c13          	addi	s8,s8,-326 # ffffffffc020b426 <sfs_wbuf>
ffffffffc020a574:	a035                	j	ffffffffc020a5a0 <sfs_io_nolock+0x9a>
ffffffffc020a576:	08000637          	lui	a2,0x8000
ffffffffc020a57a:	0005e483          	lwu	s1,0(a1)
ffffffffc020a57e:	4d81                	li	s11,0
ffffffffc020a580:	0a9b5963          	bge	s6,s1,ffffffffc020a632 <sfs_io_nolock+0x12c>
ffffffffc020a584:	00965363          	bge	a2,s1,ffffffffc020a58a <sfs_io_nolock+0x84>
ffffffffc020a588:	84b2                	mv	s1,a2
ffffffffc020a58a:	00001797          	auipc	a5,0x1
ffffffffc020a58e:	d5c78793          	addi	a5,a5,-676 # ffffffffc020b2e6 <sfs_rblock>
ffffffffc020a592:	e43e                	sd	a5,8(sp)
ffffffffc020a594:	00001c17          	auipc	s8,0x1
ffffffffc020a598:	e12c0c13          	addi	s8,s8,-494 # ffffffffc020b3a6 <sfs_rbuf>
ffffffffc020a59c:	0c9b7d63          	bgeu	s6,s1,ffffffffc020a676 <sfs_io_nolock+0x170>
ffffffffc020a5a0:	6785                	lui	a5,0x1
ffffffffc020a5a2:	8cda                	mv	s9,s6
ffffffffc020a5a4:	4901                	li	s2,0
ffffffffc020a5a6:	fff78b93          	addi	s7,a5,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc020a5aa:	a811                	j	ffffffffc020a5be <sfs_io_nolock+0xb8>
ffffffffc020a5ac:	86b2                	mv	a3,a2
ffffffffc020a5ae:	876a                	mv	a4,s10
ffffffffc020a5b0:	8622                	mv	a2,s0
ffffffffc020a5b2:	854e                	mv	a0,s3
ffffffffc020a5b4:	9c02                	jalr	s8
ffffffffc020a5b6:	e939                	bnez	a0,ffffffffc020a60c <sfs_io_nolock+0x106>
ffffffffc020a5b8:	9922                	add	s2,s2,s0
ffffffffc020a5ba:	0a9cf763          	bgeu	s9,s1,ffffffffc020a668 <sfs_io_nolock+0x162>
ffffffffc020a5be:	00ccd613          	srli	a2,s9,0xc
ffffffffc020a5c2:	0016069b          	addiw	a3,a2,1
ffffffffc020a5c6:	00c6969b          	slliw	a3,a3,0xc
ffffffffc020a5ca:	017cfd33          	and	s10,s9,s7
ffffffffc020a5ce:	8466                	mv	s0,s9
ffffffffc020a5d0:	02069c93          	slli	s9,a3,0x20
ffffffffc020a5d4:	020cdc93          	srli	s9,s9,0x20
ffffffffc020a5d8:	2601                	sext.w	a2,a2
ffffffffc020a5da:	0194f363          	bgeu	s1,s9,ffffffffc020a5e0 <sfs_io_nolock+0xda>
ffffffffc020a5de:	8ca6                	mv	s9,s1
ffffffffc020a5e0:	0874                	addi	a3,sp,28
ffffffffc020a5e2:	85d2                	mv	a1,s4
ffffffffc020a5e4:	854e                	mv	a0,s3
ffffffffc020a5e6:	cc9ff0ef          	jal	ra,ffffffffc020a2ae <sfs_bmap_load_nolock>
ffffffffc020a5ea:	408c8433          	sub	s0,s9,s0
ffffffffc020a5ee:	8daa                	mv	s11,a0
ffffffffc020a5f0:	ed25                	bnez	a0,ffffffffc020a668 <sfs_io_nolock+0x162>
ffffffffc020a5f2:	4672                	lw	a2,28(sp)
ffffffffc020a5f4:	012a85b3          	add	a1,s5,s2
ffffffffc020a5f8:	fa0d1ae3          	bnez	s10,ffffffffc020a5ac <sfs_io_nolock+0xa6>
ffffffffc020a5fc:	6785                	lui	a5,0x1
ffffffffc020a5fe:	faf417e3          	bne	s0,a5,ffffffffc020a5ac <sfs_io_nolock+0xa6>
ffffffffc020a602:	67a2                	ld	a5,8(sp)
ffffffffc020a604:	4685                	li	a3,1
ffffffffc020a606:	854e                	mv	a0,s3
ffffffffc020a608:	9782                	jalr	a5
ffffffffc020a60a:	d55d                	beqz	a0,ffffffffc020a5b8 <sfs_io_nolock+0xb2>
ffffffffc020a60c:	000a3583          	ld	a1,0(s4)
ffffffffc020a610:	012b06b3          	add	a3,s6,s2
ffffffffc020a614:	8daa                	mv	s11,a0
ffffffffc020a616:	6702                	ld	a4,0(sp)
ffffffffc020a618:	0005e783          	lwu	a5,0(a1)
ffffffffc020a61c:	01273023          	sd	s2,0(a4) # 8000000 <_binary_bin_sfs_img_size+0x7f8ad00>
ffffffffc020a620:	00d7f963          	bgeu	a5,a3,ffffffffc020a632 <sfs_io_nolock+0x12c>
ffffffffc020a624:	012b093b          	addw	s2,s6,s2
ffffffffc020a628:	0125a023          	sw	s2,0(a1)
ffffffffc020a62c:	4785                	li	a5,1
ffffffffc020a62e:	00fa3823          	sd	a5,16(s4)
ffffffffc020a632:	60aa                	ld	ra,136(sp)
ffffffffc020a634:	640a                	ld	s0,128(sp)
ffffffffc020a636:	74e6                	ld	s1,120(sp)
ffffffffc020a638:	7946                	ld	s2,112(sp)
ffffffffc020a63a:	79a6                	ld	s3,104(sp)
ffffffffc020a63c:	7a06                	ld	s4,96(sp)
ffffffffc020a63e:	6ae6                	ld	s5,88(sp)
ffffffffc020a640:	6b46                	ld	s6,80(sp)
ffffffffc020a642:	6ba6                	ld	s7,72(sp)
ffffffffc020a644:	6c06                	ld	s8,64(sp)
ffffffffc020a646:	7ce2                	ld	s9,56(sp)
ffffffffc020a648:	7d42                	ld	s10,48(sp)
ffffffffc020a64a:	856e                	mv	a0,s11
ffffffffc020a64c:	7da2                	ld	s11,40(sp)
ffffffffc020a64e:	6149                	addi	sp,sp,144
ffffffffc020a650:	8082                	ret
ffffffffc020a652:	d785                	beqz	a5,ffffffffc020a57a <sfs_io_nolock+0x74>
ffffffffc020a654:	00001797          	auipc	a5,0x1
ffffffffc020a658:	cf278793          	addi	a5,a5,-782 # ffffffffc020b346 <sfs_wblock>
ffffffffc020a65c:	e43e                	sd	a5,8(sp)
ffffffffc020a65e:	00001c17          	auipc	s8,0x1
ffffffffc020a662:	dc8c0c13          	addi	s8,s8,-568 # ffffffffc020b426 <sfs_wbuf>
ffffffffc020a666:	bf1d                	j	ffffffffc020a59c <sfs_io_nolock+0x96>
ffffffffc020a668:	000a3583          	ld	a1,0(s4)
ffffffffc020a66c:	012b06b3          	add	a3,s6,s2
ffffffffc020a670:	b75d                	j	ffffffffc020a616 <sfs_io_nolock+0x110>
ffffffffc020a672:	5df5                	li	s11,-3
ffffffffc020a674:	bf7d                	j	ffffffffc020a632 <sfs_io_nolock+0x12c>
ffffffffc020a676:	4901                	li	s2,0
ffffffffc020a678:	4d81                	li	s11,0
ffffffffc020a67a:	bf71                	j	ffffffffc020a616 <sfs_io_nolock+0x110>
ffffffffc020a67c:	00005697          	auipc	a3,0x5
ffffffffc020a680:	0e468693          	addi	a3,a3,228 # ffffffffc020f760 <dev_node_ops+0x730>
ffffffffc020a684:	00002617          	auipc	a2,0x2
ffffffffc020a688:	98c60613          	addi	a2,a2,-1652 # ffffffffc020c010 <commands+0x210>
ffffffffc020a68c:	22b00593          	li	a1,555
ffffffffc020a690:	00005517          	auipc	a0,0x5
ffffffffc020a694:	f6050513          	addi	a0,a0,-160 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a698:	e07f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a69c <sfs_read>:
ffffffffc020a69c:	7139                	addi	sp,sp,-64
ffffffffc020a69e:	f04a                	sd	s2,32(sp)
ffffffffc020a6a0:	06853903          	ld	s2,104(a0)
ffffffffc020a6a4:	fc06                	sd	ra,56(sp)
ffffffffc020a6a6:	f822                	sd	s0,48(sp)
ffffffffc020a6a8:	f426                	sd	s1,40(sp)
ffffffffc020a6aa:	ec4e                	sd	s3,24(sp)
ffffffffc020a6ac:	04090f63          	beqz	s2,ffffffffc020a70a <sfs_read+0x6e>
ffffffffc020a6b0:	0b092783          	lw	a5,176(s2)
ffffffffc020a6b4:	ebb9                	bnez	a5,ffffffffc020a70a <sfs_read+0x6e>
ffffffffc020a6b6:	4d38                	lw	a4,88(a0)
ffffffffc020a6b8:	6785                	lui	a5,0x1
ffffffffc020a6ba:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a6be:	842a                	mv	s0,a0
ffffffffc020a6c0:	06f71563          	bne	a4,a5,ffffffffc020a72a <sfs_read+0x8e>
ffffffffc020a6c4:	02050993          	addi	s3,a0,32
ffffffffc020a6c8:	854e                	mv	a0,s3
ffffffffc020a6ca:	84ae                	mv	s1,a1
ffffffffc020a6cc:	f29f90ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc020a6d0:	0184b803          	ld	a6,24(s1) # 8000018 <_binary_bin_sfs_img_size+0x7f8ad18>
ffffffffc020a6d4:	6494                	ld	a3,8(s1)
ffffffffc020a6d6:	6090                	ld	a2,0(s1)
ffffffffc020a6d8:	85a2                	mv	a1,s0
ffffffffc020a6da:	4781                	li	a5,0
ffffffffc020a6dc:	0038                	addi	a4,sp,8
ffffffffc020a6de:	854a                	mv	a0,s2
ffffffffc020a6e0:	e442                	sd	a6,8(sp)
ffffffffc020a6e2:	e25ff0ef          	jal	ra,ffffffffc020a506 <sfs_io_nolock>
ffffffffc020a6e6:	65a2                	ld	a1,8(sp)
ffffffffc020a6e8:	842a                	mv	s0,a0
ffffffffc020a6ea:	ed81                	bnez	a1,ffffffffc020a702 <sfs_read+0x66>
ffffffffc020a6ec:	854e                	mv	a0,s3
ffffffffc020a6ee:	f03f90ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020a6f2:	70e2                	ld	ra,56(sp)
ffffffffc020a6f4:	8522                	mv	a0,s0
ffffffffc020a6f6:	7442                	ld	s0,48(sp)
ffffffffc020a6f8:	74a2                	ld	s1,40(sp)
ffffffffc020a6fa:	7902                	ld	s2,32(sp)
ffffffffc020a6fc:	69e2                	ld	s3,24(sp)
ffffffffc020a6fe:	6121                	addi	sp,sp,64
ffffffffc020a700:	8082                	ret
ffffffffc020a702:	8526                	mv	a0,s1
ffffffffc020a704:	de5fa0ef          	jal	ra,ffffffffc02054e8 <iobuf_skip>
ffffffffc020a708:	b7d5                	j	ffffffffc020a6ec <sfs_read+0x50>
ffffffffc020a70a:	00005697          	auipc	a3,0x5
ffffffffc020a70e:	d0668693          	addi	a3,a3,-762 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc020a712:	00002617          	auipc	a2,0x2
ffffffffc020a716:	8fe60613          	addi	a2,a2,-1794 # ffffffffc020c010 <commands+0x210>
ffffffffc020a71a:	27e00593          	li	a1,638
ffffffffc020a71e:	00005517          	auipc	a0,0x5
ffffffffc020a722:	ed250513          	addi	a0,a0,-302 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a726:	d79f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a72a:	8a7ff0ef          	jal	ra,ffffffffc0209fd0 <sfs_io.part.0>

ffffffffc020a72e <sfs_write>:
ffffffffc020a72e:	7139                	addi	sp,sp,-64
ffffffffc020a730:	f04a                	sd	s2,32(sp)
ffffffffc020a732:	06853903          	ld	s2,104(a0)
ffffffffc020a736:	fc06                	sd	ra,56(sp)
ffffffffc020a738:	f822                	sd	s0,48(sp)
ffffffffc020a73a:	f426                	sd	s1,40(sp)
ffffffffc020a73c:	ec4e                	sd	s3,24(sp)
ffffffffc020a73e:	04090f63          	beqz	s2,ffffffffc020a79c <sfs_write+0x6e>
ffffffffc020a742:	0b092783          	lw	a5,176(s2)
ffffffffc020a746:	ebb9                	bnez	a5,ffffffffc020a79c <sfs_write+0x6e>
ffffffffc020a748:	4d38                	lw	a4,88(a0)
ffffffffc020a74a:	6785                	lui	a5,0x1
ffffffffc020a74c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a750:	842a                	mv	s0,a0
ffffffffc020a752:	06f71563          	bne	a4,a5,ffffffffc020a7bc <sfs_write+0x8e>
ffffffffc020a756:	02050993          	addi	s3,a0,32
ffffffffc020a75a:	854e                	mv	a0,s3
ffffffffc020a75c:	84ae                	mv	s1,a1
ffffffffc020a75e:	e97f90ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc020a762:	0184b803          	ld	a6,24(s1)
ffffffffc020a766:	6494                	ld	a3,8(s1)
ffffffffc020a768:	6090                	ld	a2,0(s1)
ffffffffc020a76a:	85a2                	mv	a1,s0
ffffffffc020a76c:	4785                	li	a5,1
ffffffffc020a76e:	0038                	addi	a4,sp,8
ffffffffc020a770:	854a                	mv	a0,s2
ffffffffc020a772:	e442                	sd	a6,8(sp)
ffffffffc020a774:	d93ff0ef          	jal	ra,ffffffffc020a506 <sfs_io_nolock>
ffffffffc020a778:	65a2                	ld	a1,8(sp)
ffffffffc020a77a:	842a                	mv	s0,a0
ffffffffc020a77c:	ed81                	bnez	a1,ffffffffc020a794 <sfs_write+0x66>
ffffffffc020a77e:	854e                	mv	a0,s3
ffffffffc020a780:	e71f90ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020a784:	70e2                	ld	ra,56(sp)
ffffffffc020a786:	8522                	mv	a0,s0
ffffffffc020a788:	7442                	ld	s0,48(sp)
ffffffffc020a78a:	74a2                	ld	s1,40(sp)
ffffffffc020a78c:	7902                	ld	s2,32(sp)
ffffffffc020a78e:	69e2                	ld	s3,24(sp)
ffffffffc020a790:	6121                	addi	sp,sp,64
ffffffffc020a792:	8082                	ret
ffffffffc020a794:	8526                	mv	a0,s1
ffffffffc020a796:	d53fa0ef          	jal	ra,ffffffffc02054e8 <iobuf_skip>
ffffffffc020a79a:	b7d5                	j	ffffffffc020a77e <sfs_write+0x50>
ffffffffc020a79c:	00005697          	auipc	a3,0x5
ffffffffc020a7a0:	c7468693          	addi	a3,a3,-908 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc020a7a4:	00002617          	auipc	a2,0x2
ffffffffc020a7a8:	86c60613          	addi	a2,a2,-1940 # ffffffffc020c010 <commands+0x210>
ffffffffc020a7ac:	27e00593          	li	a1,638
ffffffffc020a7b0:	00005517          	auipc	a0,0x5
ffffffffc020a7b4:	e4050513          	addi	a0,a0,-448 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a7b8:	ce7f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a7bc:	815ff0ef          	jal	ra,ffffffffc0209fd0 <sfs_io.part.0>

ffffffffc020a7c0 <sfs_dirent_read_nolock>:
ffffffffc020a7c0:	6198                	ld	a4,0(a1)
ffffffffc020a7c2:	7179                	addi	sp,sp,-48
ffffffffc020a7c4:	f406                	sd	ra,40(sp)
ffffffffc020a7c6:	00475883          	lhu	a7,4(a4)
ffffffffc020a7ca:	f022                	sd	s0,32(sp)
ffffffffc020a7cc:	ec26                	sd	s1,24(sp)
ffffffffc020a7ce:	4809                	li	a6,2
ffffffffc020a7d0:	05089b63          	bne	a7,a6,ffffffffc020a826 <sfs_dirent_read_nolock+0x66>
ffffffffc020a7d4:	4718                	lw	a4,8(a4)
ffffffffc020a7d6:	87b2                	mv	a5,a2
ffffffffc020a7d8:	2601                	sext.w	a2,a2
ffffffffc020a7da:	04e7f663          	bgeu	a5,a4,ffffffffc020a826 <sfs_dirent_read_nolock+0x66>
ffffffffc020a7de:	84b6                	mv	s1,a3
ffffffffc020a7e0:	0074                	addi	a3,sp,12
ffffffffc020a7e2:	842a                	mv	s0,a0
ffffffffc020a7e4:	acbff0ef          	jal	ra,ffffffffc020a2ae <sfs_bmap_load_nolock>
ffffffffc020a7e8:	c511                	beqz	a0,ffffffffc020a7f4 <sfs_dirent_read_nolock+0x34>
ffffffffc020a7ea:	70a2                	ld	ra,40(sp)
ffffffffc020a7ec:	7402                	ld	s0,32(sp)
ffffffffc020a7ee:	64e2                	ld	s1,24(sp)
ffffffffc020a7f0:	6145                	addi	sp,sp,48
ffffffffc020a7f2:	8082                	ret
ffffffffc020a7f4:	45b2                	lw	a1,12(sp)
ffffffffc020a7f6:	4054                	lw	a3,4(s0)
ffffffffc020a7f8:	c5b9                	beqz	a1,ffffffffc020a846 <sfs_dirent_read_nolock+0x86>
ffffffffc020a7fa:	04d5f663          	bgeu	a1,a3,ffffffffc020a846 <sfs_dirent_read_nolock+0x86>
ffffffffc020a7fe:	7c08                	ld	a0,56(s0)
ffffffffc020a800:	ee7fe0ef          	jal	ra,ffffffffc02096e6 <bitmap_test>
ffffffffc020a804:	ed31                	bnez	a0,ffffffffc020a860 <sfs_dirent_read_nolock+0xa0>
ffffffffc020a806:	46b2                	lw	a3,12(sp)
ffffffffc020a808:	4701                	li	a4,0
ffffffffc020a80a:	10400613          	li	a2,260
ffffffffc020a80e:	85a6                	mv	a1,s1
ffffffffc020a810:	8522                	mv	a0,s0
ffffffffc020a812:	395000ef          	jal	ra,ffffffffc020b3a6 <sfs_rbuf>
ffffffffc020a816:	f971                	bnez	a0,ffffffffc020a7ea <sfs_dirent_read_nolock+0x2a>
ffffffffc020a818:	100481a3          	sb	zero,259(s1)
ffffffffc020a81c:	70a2                	ld	ra,40(sp)
ffffffffc020a81e:	7402                	ld	s0,32(sp)
ffffffffc020a820:	64e2                	ld	s1,24(sp)
ffffffffc020a822:	6145                	addi	sp,sp,48
ffffffffc020a824:	8082                	ret
ffffffffc020a826:	00005697          	auipc	a3,0x5
ffffffffc020a82a:	f5a68693          	addi	a3,a3,-166 # ffffffffc020f780 <dev_node_ops+0x750>
ffffffffc020a82e:	00001617          	auipc	a2,0x1
ffffffffc020a832:	7e260613          	addi	a2,a2,2018 # ffffffffc020c010 <commands+0x210>
ffffffffc020a836:	18e00593          	li	a1,398
ffffffffc020a83a:	00005517          	auipc	a0,0x5
ffffffffc020a83e:	db650513          	addi	a0,a0,-586 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a842:	c5df50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a846:	872e                	mv	a4,a1
ffffffffc020a848:	00005617          	auipc	a2,0x5
ffffffffc020a84c:	dd860613          	addi	a2,a2,-552 # ffffffffc020f620 <dev_node_ops+0x5f0>
ffffffffc020a850:	05300593          	li	a1,83
ffffffffc020a854:	00005517          	auipc	a0,0x5
ffffffffc020a858:	d9c50513          	addi	a0,a0,-612 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a85c:	c43f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a860:	00005697          	auipc	a3,0x5
ffffffffc020a864:	df868693          	addi	a3,a3,-520 # ffffffffc020f658 <dev_node_ops+0x628>
ffffffffc020a868:	00001617          	auipc	a2,0x1
ffffffffc020a86c:	7a860613          	addi	a2,a2,1960 # ffffffffc020c010 <commands+0x210>
ffffffffc020a870:	19500593          	li	a1,405
ffffffffc020a874:	00005517          	auipc	a0,0x5
ffffffffc020a878:	d7c50513          	addi	a0,a0,-644 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a87c:	c23f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a880 <sfs_getdirentry>:
ffffffffc020a880:	715d                	addi	sp,sp,-80
ffffffffc020a882:	ec56                	sd	s5,24(sp)
ffffffffc020a884:	8aaa                	mv	s5,a0
ffffffffc020a886:	10400513          	li	a0,260
ffffffffc020a88a:	e85a                	sd	s6,16(sp)
ffffffffc020a88c:	e486                	sd	ra,72(sp)
ffffffffc020a88e:	e0a2                	sd	s0,64(sp)
ffffffffc020a890:	fc26                	sd	s1,56(sp)
ffffffffc020a892:	f84a                	sd	s2,48(sp)
ffffffffc020a894:	f44e                	sd	s3,40(sp)
ffffffffc020a896:	f052                	sd	s4,32(sp)
ffffffffc020a898:	e45e                	sd	s7,8(sp)
ffffffffc020a89a:	e062                	sd	s8,0(sp)
ffffffffc020a89c:	8b2e                	mv	s6,a1
ffffffffc020a89e:	f7cf70ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc020a8a2:	cd61                	beqz	a0,ffffffffc020a97a <sfs_getdirentry+0xfa>
ffffffffc020a8a4:	068abb83          	ld	s7,104(s5)
ffffffffc020a8a8:	0c0b8b63          	beqz	s7,ffffffffc020a97e <sfs_getdirentry+0xfe>
ffffffffc020a8ac:	0b0ba783          	lw	a5,176(s7) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020a8b0:	e7f9                	bnez	a5,ffffffffc020a97e <sfs_getdirentry+0xfe>
ffffffffc020a8b2:	058aa703          	lw	a4,88(s5)
ffffffffc020a8b6:	6785                	lui	a5,0x1
ffffffffc020a8b8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a8bc:	0ef71163          	bne	a4,a5,ffffffffc020a99e <sfs_getdirentry+0x11e>
ffffffffc020a8c0:	008b3983          	ld	s3,8(s6)
ffffffffc020a8c4:	892a                	mv	s2,a0
ffffffffc020a8c6:	0a09c163          	bltz	s3,ffffffffc020a968 <sfs_getdirentry+0xe8>
ffffffffc020a8ca:	0ff9f793          	zext.b	a5,s3
ffffffffc020a8ce:	efc9                	bnez	a5,ffffffffc020a968 <sfs_getdirentry+0xe8>
ffffffffc020a8d0:	000ab783          	ld	a5,0(s5)
ffffffffc020a8d4:	0089d993          	srli	s3,s3,0x8
ffffffffc020a8d8:	2981                	sext.w	s3,s3
ffffffffc020a8da:	479c                	lw	a5,8(a5)
ffffffffc020a8dc:	0937eb63          	bltu	a5,s3,ffffffffc020a972 <sfs_getdirentry+0xf2>
ffffffffc020a8e0:	020a8c13          	addi	s8,s5,32
ffffffffc020a8e4:	8562                	mv	a0,s8
ffffffffc020a8e6:	d0ff90ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc020a8ea:	000ab783          	ld	a5,0(s5)
ffffffffc020a8ee:	0087aa03          	lw	s4,8(a5)
ffffffffc020a8f2:	07405663          	blez	s4,ffffffffc020a95e <sfs_getdirentry+0xde>
ffffffffc020a8f6:	4481                	li	s1,0
ffffffffc020a8f8:	a811                	j	ffffffffc020a90c <sfs_getdirentry+0x8c>
ffffffffc020a8fa:	00092783          	lw	a5,0(s2)
ffffffffc020a8fe:	c781                	beqz	a5,ffffffffc020a906 <sfs_getdirentry+0x86>
ffffffffc020a900:	02098263          	beqz	s3,ffffffffc020a924 <sfs_getdirentry+0xa4>
ffffffffc020a904:	39fd                	addiw	s3,s3,-1
ffffffffc020a906:	2485                	addiw	s1,s1,1
ffffffffc020a908:	049a0b63          	beq	s4,s1,ffffffffc020a95e <sfs_getdirentry+0xde>
ffffffffc020a90c:	86ca                	mv	a3,s2
ffffffffc020a90e:	8626                	mv	a2,s1
ffffffffc020a910:	85d6                	mv	a1,s5
ffffffffc020a912:	855e                	mv	a0,s7
ffffffffc020a914:	eadff0ef          	jal	ra,ffffffffc020a7c0 <sfs_dirent_read_nolock>
ffffffffc020a918:	842a                	mv	s0,a0
ffffffffc020a91a:	d165                	beqz	a0,ffffffffc020a8fa <sfs_getdirentry+0x7a>
ffffffffc020a91c:	8562                	mv	a0,s8
ffffffffc020a91e:	cd3f90ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020a922:	a831                	j	ffffffffc020a93e <sfs_getdirentry+0xbe>
ffffffffc020a924:	8562                	mv	a0,s8
ffffffffc020a926:	ccbf90ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020a92a:	4701                	li	a4,0
ffffffffc020a92c:	4685                	li	a3,1
ffffffffc020a92e:	10000613          	li	a2,256
ffffffffc020a932:	00490593          	addi	a1,s2,4
ffffffffc020a936:	855a                	mv	a0,s6
ffffffffc020a938:	b45fa0ef          	jal	ra,ffffffffc020547c <iobuf_move>
ffffffffc020a93c:	842a                	mv	s0,a0
ffffffffc020a93e:	854a                	mv	a0,s2
ffffffffc020a940:	f8af70ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020a944:	60a6                	ld	ra,72(sp)
ffffffffc020a946:	8522                	mv	a0,s0
ffffffffc020a948:	6406                	ld	s0,64(sp)
ffffffffc020a94a:	74e2                	ld	s1,56(sp)
ffffffffc020a94c:	7942                	ld	s2,48(sp)
ffffffffc020a94e:	79a2                	ld	s3,40(sp)
ffffffffc020a950:	7a02                	ld	s4,32(sp)
ffffffffc020a952:	6ae2                	ld	s5,24(sp)
ffffffffc020a954:	6b42                	ld	s6,16(sp)
ffffffffc020a956:	6ba2                	ld	s7,8(sp)
ffffffffc020a958:	6c02                	ld	s8,0(sp)
ffffffffc020a95a:	6161                	addi	sp,sp,80
ffffffffc020a95c:	8082                	ret
ffffffffc020a95e:	8562                	mv	a0,s8
ffffffffc020a960:	5441                	li	s0,-16
ffffffffc020a962:	c8ff90ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020a966:	bfe1                	j	ffffffffc020a93e <sfs_getdirentry+0xbe>
ffffffffc020a968:	854a                	mv	a0,s2
ffffffffc020a96a:	f60f70ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020a96e:	5475                	li	s0,-3
ffffffffc020a970:	bfd1                	j	ffffffffc020a944 <sfs_getdirentry+0xc4>
ffffffffc020a972:	f58f70ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020a976:	5441                	li	s0,-16
ffffffffc020a978:	b7f1                	j	ffffffffc020a944 <sfs_getdirentry+0xc4>
ffffffffc020a97a:	5471                	li	s0,-4
ffffffffc020a97c:	b7e1                	j	ffffffffc020a944 <sfs_getdirentry+0xc4>
ffffffffc020a97e:	00005697          	auipc	a3,0x5
ffffffffc020a982:	a9268693          	addi	a3,a3,-1390 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc020a986:	00001617          	auipc	a2,0x1
ffffffffc020a98a:	68a60613          	addi	a2,a2,1674 # ffffffffc020c010 <commands+0x210>
ffffffffc020a98e:	32200593          	li	a1,802
ffffffffc020a992:	00005517          	auipc	a0,0x5
ffffffffc020a996:	c5e50513          	addi	a0,a0,-930 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a99a:	b05f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a99e:	00005697          	auipc	a3,0x5
ffffffffc020a9a2:	c1a68693          	addi	a3,a3,-998 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc020a9a6:	00001617          	auipc	a2,0x1
ffffffffc020a9aa:	66a60613          	addi	a2,a2,1642 # ffffffffc020c010 <commands+0x210>
ffffffffc020a9ae:	32300593          	li	a1,803
ffffffffc020a9b2:	00005517          	auipc	a0,0x5
ffffffffc020a9b6:	c3e50513          	addi	a0,a0,-962 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020a9ba:	ae5f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a9be <sfs_dirent_search_nolock.constprop.0>:
ffffffffc020a9be:	715d                	addi	sp,sp,-80
ffffffffc020a9c0:	f052                	sd	s4,32(sp)
ffffffffc020a9c2:	8a2a                	mv	s4,a0
ffffffffc020a9c4:	8532                	mv	a0,a2
ffffffffc020a9c6:	f44e                	sd	s3,40(sp)
ffffffffc020a9c8:	e85a                	sd	s6,16(sp)
ffffffffc020a9ca:	e45e                	sd	s7,8(sp)
ffffffffc020a9cc:	e486                	sd	ra,72(sp)
ffffffffc020a9ce:	e0a2                	sd	s0,64(sp)
ffffffffc020a9d0:	fc26                	sd	s1,56(sp)
ffffffffc020a9d2:	f84a                	sd	s2,48(sp)
ffffffffc020a9d4:	ec56                	sd	s5,24(sp)
ffffffffc020a9d6:	e062                	sd	s8,0(sp)
ffffffffc020a9d8:	8b32                	mv	s6,a2
ffffffffc020a9da:	89ae                	mv	s3,a1
ffffffffc020a9dc:	8bb6                	mv	s7,a3
ffffffffc020a9de:	0aa010ef          	jal	ra,ffffffffc020ba88 <strlen>
ffffffffc020a9e2:	0ff00793          	li	a5,255
ffffffffc020a9e6:	06a7ef63          	bltu	a5,a0,ffffffffc020aa64 <sfs_dirent_search_nolock.constprop.0+0xa6>
ffffffffc020a9ea:	10400513          	li	a0,260
ffffffffc020a9ee:	e2cf70ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc020a9f2:	892a                	mv	s2,a0
ffffffffc020a9f4:	c535                	beqz	a0,ffffffffc020aa60 <sfs_dirent_search_nolock.constprop.0+0xa2>
ffffffffc020a9f6:	0009b783          	ld	a5,0(s3)
ffffffffc020a9fa:	0087aa83          	lw	s5,8(a5)
ffffffffc020a9fe:	05505a63          	blez	s5,ffffffffc020aa52 <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020aa02:	4481                	li	s1,0
ffffffffc020aa04:	00450c13          	addi	s8,a0,4
ffffffffc020aa08:	a829                	j	ffffffffc020aa22 <sfs_dirent_search_nolock.constprop.0+0x64>
ffffffffc020aa0a:	00092783          	lw	a5,0(s2)
ffffffffc020aa0e:	c799                	beqz	a5,ffffffffc020aa1c <sfs_dirent_search_nolock.constprop.0+0x5e>
ffffffffc020aa10:	85e2                	mv	a1,s8
ffffffffc020aa12:	855a                	mv	a0,s6
ffffffffc020aa14:	0bc010ef          	jal	ra,ffffffffc020bad0 <strcmp>
ffffffffc020aa18:	842a                	mv	s0,a0
ffffffffc020aa1a:	cd15                	beqz	a0,ffffffffc020aa56 <sfs_dirent_search_nolock.constprop.0+0x98>
ffffffffc020aa1c:	2485                	addiw	s1,s1,1
ffffffffc020aa1e:	029a8a63          	beq	s5,s1,ffffffffc020aa52 <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020aa22:	86ca                	mv	a3,s2
ffffffffc020aa24:	8626                	mv	a2,s1
ffffffffc020aa26:	85ce                	mv	a1,s3
ffffffffc020aa28:	8552                	mv	a0,s4
ffffffffc020aa2a:	d97ff0ef          	jal	ra,ffffffffc020a7c0 <sfs_dirent_read_nolock>
ffffffffc020aa2e:	842a                	mv	s0,a0
ffffffffc020aa30:	dd69                	beqz	a0,ffffffffc020aa0a <sfs_dirent_search_nolock.constprop.0+0x4c>
ffffffffc020aa32:	854a                	mv	a0,s2
ffffffffc020aa34:	e96f70ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020aa38:	60a6                	ld	ra,72(sp)
ffffffffc020aa3a:	8522                	mv	a0,s0
ffffffffc020aa3c:	6406                	ld	s0,64(sp)
ffffffffc020aa3e:	74e2                	ld	s1,56(sp)
ffffffffc020aa40:	7942                	ld	s2,48(sp)
ffffffffc020aa42:	79a2                	ld	s3,40(sp)
ffffffffc020aa44:	7a02                	ld	s4,32(sp)
ffffffffc020aa46:	6ae2                	ld	s5,24(sp)
ffffffffc020aa48:	6b42                	ld	s6,16(sp)
ffffffffc020aa4a:	6ba2                	ld	s7,8(sp)
ffffffffc020aa4c:	6c02                	ld	s8,0(sp)
ffffffffc020aa4e:	6161                	addi	sp,sp,80
ffffffffc020aa50:	8082                	ret
ffffffffc020aa52:	5441                	li	s0,-16
ffffffffc020aa54:	bff9                	j	ffffffffc020aa32 <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020aa56:	00092783          	lw	a5,0(s2)
ffffffffc020aa5a:	00fba023          	sw	a5,0(s7)
ffffffffc020aa5e:	bfd1                	j	ffffffffc020aa32 <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020aa60:	5471                	li	s0,-4
ffffffffc020aa62:	bfd9                	j	ffffffffc020aa38 <sfs_dirent_search_nolock.constprop.0+0x7a>
ffffffffc020aa64:	00005697          	auipc	a3,0x5
ffffffffc020aa68:	d6c68693          	addi	a3,a3,-660 # ffffffffc020f7d0 <dev_node_ops+0x7a0>
ffffffffc020aa6c:	00001617          	auipc	a2,0x1
ffffffffc020aa70:	5a460613          	addi	a2,a2,1444 # ffffffffc020c010 <commands+0x210>
ffffffffc020aa74:	1ba00593          	li	a1,442
ffffffffc020aa78:	00005517          	auipc	a0,0x5
ffffffffc020aa7c:	b7850513          	addi	a0,a0,-1160 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020aa80:	a1ff50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020aa84 <sfs_truncfile>:
ffffffffc020aa84:	7175                	addi	sp,sp,-144
ffffffffc020aa86:	e506                	sd	ra,136(sp)
ffffffffc020aa88:	e122                	sd	s0,128(sp)
ffffffffc020aa8a:	fca6                	sd	s1,120(sp)
ffffffffc020aa8c:	f8ca                	sd	s2,112(sp)
ffffffffc020aa8e:	f4ce                	sd	s3,104(sp)
ffffffffc020aa90:	f0d2                	sd	s4,96(sp)
ffffffffc020aa92:	ecd6                	sd	s5,88(sp)
ffffffffc020aa94:	e8da                	sd	s6,80(sp)
ffffffffc020aa96:	e4de                	sd	s7,72(sp)
ffffffffc020aa98:	e0e2                	sd	s8,64(sp)
ffffffffc020aa9a:	fc66                	sd	s9,56(sp)
ffffffffc020aa9c:	f86a                	sd	s10,48(sp)
ffffffffc020aa9e:	f46e                	sd	s11,40(sp)
ffffffffc020aaa0:	080007b7          	lui	a5,0x8000
ffffffffc020aaa4:	16b7e463          	bltu	a5,a1,ffffffffc020ac0c <sfs_truncfile+0x188>
ffffffffc020aaa8:	06853c83          	ld	s9,104(a0)
ffffffffc020aaac:	89aa                	mv	s3,a0
ffffffffc020aaae:	160c8163          	beqz	s9,ffffffffc020ac10 <sfs_truncfile+0x18c>
ffffffffc020aab2:	0b0ca783          	lw	a5,176(s9) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020aab6:	14079d63          	bnez	a5,ffffffffc020ac10 <sfs_truncfile+0x18c>
ffffffffc020aaba:	4d38                	lw	a4,88(a0)
ffffffffc020aabc:	6405                	lui	s0,0x1
ffffffffc020aabe:	23540793          	addi	a5,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020aac2:	16f71763          	bne	a4,a5,ffffffffc020ac30 <sfs_truncfile+0x1ac>
ffffffffc020aac6:	00053a83          	ld	s5,0(a0)
ffffffffc020aaca:	147d                	addi	s0,s0,-1
ffffffffc020aacc:	942e                	add	s0,s0,a1
ffffffffc020aace:	000ae783          	lwu	a5,0(s5)
ffffffffc020aad2:	8031                	srli	s0,s0,0xc
ffffffffc020aad4:	8a2e                	mv	s4,a1
ffffffffc020aad6:	2401                	sext.w	s0,s0
ffffffffc020aad8:	02b79763          	bne	a5,a1,ffffffffc020ab06 <sfs_truncfile+0x82>
ffffffffc020aadc:	008aa783          	lw	a5,8(s5)
ffffffffc020aae0:	4901                	li	s2,0
ffffffffc020aae2:	18879763          	bne	a5,s0,ffffffffc020ac70 <sfs_truncfile+0x1ec>
ffffffffc020aae6:	60aa                	ld	ra,136(sp)
ffffffffc020aae8:	640a                	ld	s0,128(sp)
ffffffffc020aaea:	74e6                	ld	s1,120(sp)
ffffffffc020aaec:	79a6                	ld	s3,104(sp)
ffffffffc020aaee:	7a06                	ld	s4,96(sp)
ffffffffc020aaf0:	6ae6                	ld	s5,88(sp)
ffffffffc020aaf2:	6b46                	ld	s6,80(sp)
ffffffffc020aaf4:	6ba6                	ld	s7,72(sp)
ffffffffc020aaf6:	6c06                	ld	s8,64(sp)
ffffffffc020aaf8:	7ce2                	ld	s9,56(sp)
ffffffffc020aafa:	7d42                	ld	s10,48(sp)
ffffffffc020aafc:	7da2                	ld	s11,40(sp)
ffffffffc020aafe:	854a                	mv	a0,s2
ffffffffc020ab00:	7946                	ld	s2,112(sp)
ffffffffc020ab02:	6149                	addi	sp,sp,144
ffffffffc020ab04:	8082                	ret
ffffffffc020ab06:	02050b13          	addi	s6,a0,32
ffffffffc020ab0a:	855a                	mv	a0,s6
ffffffffc020ab0c:	ae9f90ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc020ab10:	008aa483          	lw	s1,8(s5)
ffffffffc020ab14:	0a84e663          	bltu	s1,s0,ffffffffc020abc0 <sfs_truncfile+0x13c>
ffffffffc020ab18:	0c947163          	bgeu	s0,s1,ffffffffc020abda <sfs_truncfile+0x156>
ffffffffc020ab1c:	4dad                	li	s11,11
ffffffffc020ab1e:	4b85                	li	s7,1
ffffffffc020ab20:	a09d                	j	ffffffffc020ab86 <sfs_truncfile+0x102>
ffffffffc020ab22:	ff37091b          	addiw	s2,a4,-13
ffffffffc020ab26:	0009079b          	sext.w	a5,s2
ffffffffc020ab2a:	3ff00713          	li	a4,1023
ffffffffc020ab2e:	04f76563          	bltu	a4,a5,ffffffffc020ab78 <sfs_truncfile+0xf4>
ffffffffc020ab32:	03cd2c03          	lw	s8,60(s10)
ffffffffc020ab36:	040c0163          	beqz	s8,ffffffffc020ab78 <sfs_truncfile+0xf4>
ffffffffc020ab3a:	004ca783          	lw	a5,4(s9)
ffffffffc020ab3e:	18fc7963          	bgeu	s8,a5,ffffffffc020acd0 <sfs_truncfile+0x24c>
ffffffffc020ab42:	038cb503          	ld	a0,56(s9)
ffffffffc020ab46:	85e2                	mv	a1,s8
ffffffffc020ab48:	b9ffe0ef          	jal	ra,ffffffffc02096e6 <bitmap_test>
ffffffffc020ab4c:	16051263          	bnez	a0,ffffffffc020acb0 <sfs_truncfile+0x22c>
ffffffffc020ab50:	02091793          	slli	a5,s2,0x20
ffffffffc020ab54:	01e7d713          	srli	a4,a5,0x1e
ffffffffc020ab58:	86e2                	mv	a3,s8
ffffffffc020ab5a:	4611                	li	a2,4
ffffffffc020ab5c:	082c                	addi	a1,sp,24
ffffffffc020ab5e:	8566                	mv	a0,s9
ffffffffc020ab60:	e43a                	sd	a4,8(sp)
ffffffffc020ab62:	ce02                	sw	zero,28(sp)
ffffffffc020ab64:	043000ef          	jal	ra,ffffffffc020b3a6 <sfs_rbuf>
ffffffffc020ab68:	892a                	mv	s2,a0
ffffffffc020ab6a:	e141                	bnez	a0,ffffffffc020abea <sfs_truncfile+0x166>
ffffffffc020ab6c:	47e2                	lw	a5,24(sp)
ffffffffc020ab6e:	6722                	ld	a4,8(sp)
ffffffffc020ab70:	e3c9                	bnez	a5,ffffffffc020abf2 <sfs_truncfile+0x16e>
ffffffffc020ab72:	008d2603          	lw	a2,8(s10)
ffffffffc020ab76:	367d                	addiw	a2,a2,-1
ffffffffc020ab78:	00cd2423          	sw	a2,8(s10)
ffffffffc020ab7c:	0179b823          	sd	s7,16(s3)
ffffffffc020ab80:	34fd                	addiw	s1,s1,-1
ffffffffc020ab82:	04940a63          	beq	s0,s1,ffffffffc020abd6 <sfs_truncfile+0x152>
ffffffffc020ab86:	0009bd03          	ld	s10,0(s3)
ffffffffc020ab8a:	008d2703          	lw	a4,8(s10)
ffffffffc020ab8e:	c369                	beqz	a4,ffffffffc020ac50 <sfs_truncfile+0x1cc>
ffffffffc020ab90:	fff7079b          	addiw	a5,a4,-1
ffffffffc020ab94:	0007861b          	sext.w	a2,a5
ffffffffc020ab98:	f8cde5e3          	bltu	s11,a2,ffffffffc020ab22 <sfs_truncfile+0x9e>
ffffffffc020ab9c:	02079713          	slli	a4,a5,0x20
ffffffffc020aba0:	01e75793          	srli	a5,a4,0x1e
ffffffffc020aba4:	00fd0933          	add	s2,s10,a5
ffffffffc020aba8:	00c92583          	lw	a1,12(s2)
ffffffffc020abac:	d5f1                	beqz	a1,ffffffffc020ab78 <sfs_truncfile+0xf4>
ffffffffc020abae:	8566                	mv	a0,s9
ffffffffc020abb0:	c44ff0ef          	jal	ra,ffffffffc0209ff4 <sfs_block_free>
ffffffffc020abb4:	00092623          	sw	zero,12(s2)
ffffffffc020abb8:	008d2603          	lw	a2,8(s10)
ffffffffc020abbc:	367d                	addiw	a2,a2,-1
ffffffffc020abbe:	bf6d                	j	ffffffffc020ab78 <sfs_truncfile+0xf4>
ffffffffc020abc0:	4681                	li	a3,0
ffffffffc020abc2:	8626                	mv	a2,s1
ffffffffc020abc4:	85ce                	mv	a1,s3
ffffffffc020abc6:	8566                	mv	a0,s9
ffffffffc020abc8:	ee6ff0ef          	jal	ra,ffffffffc020a2ae <sfs_bmap_load_nolock>
ffffffffc020abcc:	892a                	mv	s2,a0
ffffffffc020abce:	ed11                	bnez	a0,ffffffffc020abea <sfs_truncfile+0x166>
ffffffffc020abd0:	2485                	addiw	s1,s1,1
ffffffffc020abd2:	fe9417e3          	bne	s0,s1,ffffffffc020abc0 <sfs_truncfile+0x13c>
ffffffffc020abd6:	008aa483          	lw	s1,8(s5)
ffffffffc020abda:	0a941b63          	bne	s0,s1,ffffffffc020ac90 <sfs_truncfile+0x20c>
ffffffffc020abde:	014aa023          	sw	s4,0(s5)
ffffffffc020abe2:	4785                	li	a5,1
ffffffffc020abe4:	00f9b823          	sd	a5,16(s3)
ffffffffc020abe8:	4901                	li	s2,0
ffffffffc020abea:	855a                	mv	a0,s6
ffffffffc020abec:	a05f90ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020abf0:	bddd                	j	ffffffffc020aae6 <sfs_truncfile+0x62>
ffffffffc020abf2:	86e2                	mv	a3,s8
ffffffffc020abf4:	4611                	li	a2,4
ffffffffc020abf6:	086c                	addi	a1,sp,28
ffffffffc020abf8:	8566                	mv	a0,s9
ffffffffc020abfa:	02d000ef          	jal	ra,ffffffffc020b426 <sfs_wbuf>
ffffffffc020abfe:	892a                	mv	s2,a0
ffffffffc020ac00:	f56d                	bnez	a0,ffffffffc020abea <sfs_truncfile+0x166>
ffffffffc020ac02:	45e2                	lw	a1,24(sp)
ffffffffc020ac04:	8566                	mv	a0,s9
ffffffffc020ac06:	beeff0ef          	jal	ra,ffffffffc0209ff4 <sfs_block_free>
ffffffffc020ac0a:	b7a5                	j	ffffffffc020ab72 <sfs_truncfile+0xee>
ffffffffc020ac0c:	5975                	li	s2,-3
ffffffffc020ac0e:	bde1                	j	ffffffffc020aae6 <sfs_truncfile+0x62>
ffffffffc020ac10:	00005697          	auipc	a3,0x5
ffffffffc020ac14:	80068693          	addi	a3,a3,-2048 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc020ac18:	00001617          	auipc	a2,0x1
ffffffffc020ac1c:	3f860613          	addi	a2,a2,1016 # ffffffffc020c010 <commands+0x210>
ffffffffc020ac20:	39100593          	li	a1,913
ffffffffc020ac24:	00005517          	auipc	a0,0x5
ffffffffc020ac28:	9cc50513          	addi	a0,a0,-1588 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020ac2c:	873f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ac30:	00005697          	auipc	a3,0x5
ffffffffc020ac34:	98868693          	addi	a3,a3,-1656 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc020ac38:	00001617          	auipc	a2,0x1
ffffffffc020ac3c:	3d860613          	addi	a2,a2,984 # ffffffffc020c010 <commands+0x210>
ffffffffc020ac40:	39200593          	li	a1,914
ffffffffc020ac44:	00005517          	auipc	a0,0x5
ffffffffc020ac48:	9ac50513          	addi	a0,a0,-1620 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020ac4c:	853f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ac50:	00005697          	auipc	a3,0x5
ffffffffc020ac54:	bc068693          	addi	a3,a3,-1088 # ffffffffc020f810 <dev_node_ops+0x7e0>
ffffffffc020ac58:	00001617          	auipc	a2,0x1
ffffffffc020ac5c:	3b860613          	addi	a2,a2,952 # ffffffffc020c010 <commands+0x210>
ffffffffc020ac60:	17b00593          	li	a1,379
ffffffffc020ac64:	00005517          	auipc	a0,0x5
ffffffffc020ac68:	98c50513          	addi	a0,a0,-1652 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020ac6c:	833f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ac70:	00005697          	auipc	a3,0x5
ffffffffc020ac74:	b8868693          	addi	a3,a3,-1144 # ffffffffc020f7f8 <dev_node_ops+0x7c8>
ffffffffc020ac78:	00001617          	auipc	a2,0x1
ffffffffc020ac7c:	39860613          	addi	a2,a2,920 # ffffffffc020c010 <commands+0x210>
ffffffffc020ac80:	39900593          	li	a1,921
ffffffffc020ac84:	00005517          	auipc	a0,0x5
ffffffffc020ac88:	96c50513          	addi	a0,a0,-1684 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020ac8c:	813f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ac90:	00005697          	auipc	a3,0x5
ffffffffc020ac94:	bd068693          	addi	a3,a3,-1072 # ffffffffc020f860 <dev_node_ops+0x830>
ffffffffc020ac98:	00001617          	auipc	a2,0x1
ffffffffc020ac9c:	37860613          	addi	a2,a2,888 # ffffffffc020c010 <commands+0x210>
ffffffffc020aca0:	3b200593          	li	a1,946
ffffffffc020aca4:	00005517          	auipc	a0,0x5
ffffffffc020aca8:	94c50513          	addi	a0,a0,-1716 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020acac:	ff2f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020acb0:	00005697          	auipc	a3,0x5
ffffffffc020acb4:	b7868693          	addi	a3,a3,-1160 # ffffffffc020f828 <dev_node_ops+0x7f8>
ffffffffc020acb8:	00001617          	auipc	a2,0x1
ffffffffc020acbc:	35860613          	addi	a2,a2,856 # ffffffffc020c010 <commands+0x210>
ffffffffc020acc0:	12b00593          	li	a1,299
ffffffffc020acc4:	00005517          	auipc	a0,0x5
ffffffffc020acc8:	92c50513          	addi	a0,a0,-1748 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020accc:	fd2f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020acd0:	8762                	mv	a4,s8
ffffffffc020acd2:	86be                	mv	a3,a5
ffffffffc020acd4:	00005617          	auipc	a2,0x5
ffffffffc020acd8:	94c60613          	addi	a2,a2,-1716 # ffffffffc020f620 <dev_node_ops+0x5f0>
ffffffffc020acdc:	05300593          	li	a1,83
ffffffffc020ace0:	00005517          	auipc	a0,0x5
ffffffffc020ace4:	91050513          	addi	a0,a0,-1776 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020ace8:	fb6f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020acec <sfs_load_inode>:
ffffffffc020acec:	7139                	addi	sp,sp,-64
ffffffffc020acee:	fc06                	sd	ra,56(sp)
ffffffffc020acf0:	f822                	sd	s0,48(sp)
ffffffffc020acf2:	f426                	sd	s1,40(sp)
ffffffffc020acf4:	f04a                	sd	s2,32(sp)
ffffffffc020acf6:	84b2                	mv	s1,a2
ffffffffc020acf8:	892a                	mv	s2,a0
ffffffffc020acfa:	ec4e                	sd	s3,24(sp)
ffffffffc020acfc:	e852                	sd	s4,16(sp)
ffffffffc020acfe:	89ae                	mv	s3,a1
ffffffffc020ad00:	e456                	sd	s5,8(sp)
ffffffffc020ad02:	0d5000ef          	jal	ra,ffffffffc020b5d6 <lock_sfs_fs>
ffffffffc020ad06:	45a9                	li	a1,10
ffffffffc020ad08:	8526                	mv	a0,s1
ffffffffc020ad0a:	0a893403          	ld	s0,168(s2)
ffffffffc020ad0e:	0e9000ef          	jal	ra,ffffffffc020b5f6 <hash32>
ffffffffc020ad12:	02051793          	slli	a5,a0,0x20
ffffffffc020ad16:	01c7d713          	srli	a4,a5,0x1c
ffffffffc020ad1a:	9722                	add	a4,a4,s0
ffffffffc020ad1c:	843a                	mv	s0,a4
ffffffffc020ad1e:	a029                	j	ffffffffc020ad28 <sfs_load_inode+0x3c>
ffffffffc020ad20:	fc042783          	lw	a5,-64(s0)
ffffffffc020ad24:	10978863          	beq	a5,s1,ffffffffc020ae34 <sfs_load_inode+0x148>
ffffffffc020ad28:	6400                	ld	s0,8(s0)
ffffffffc020ad2a:	fe871be3          	bne	a4,s0,ffffffffc020ad20 <sfs_load_inode+0x34>
ffffffffc020ad2e:	04000513          	li	a0,64
ffffffffc020ad32:	ae8f70ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc020ad36:	8aaa                	mv	s5,a0
ffffffffc020ad38:	16050563          	beqz	a0,ffffffffc020aea2 <sfs_load_inode+0x1b6>
ffffffffc020ad3c:	00492683          	lw	a3,4(s2)
ffffffffc020ad40:	18048363          	beqz	s1,ffffffffc020aec6 <sfs_load_inode+0x1da>
ffffffffc020ad44:	18d4f163          	bgeu	s1,a3,ffffffffc020aec6 <sfs_load_inode+0x1da>
ffffffffc020ad48:	03893503          	ld	a0,56(s2)
ffffffffc020ad4c:	85a6                	mv	a1,s1
ffffffffc020ad4e:	999fe0ef          	jal	ra,ffffffffc02096e6 <bitmap_test>
ffffffffc020ad52:	18051763          	bnez	a0,ffffffffc020aee0 <sfs_load_inode+0x1f4>
ffffffffc020ad56:	4701                	li	a4,0
ffffffffc020ad58:	86a6                	mv	a3,s1
ffffffffc020ad5a:	04000613          	li	a2,64
ffffffffc020ad5e:	85d6                	mv	a1,s5
ffffffffc020ad60:	854a                	mv	a0,s2
ffffffffc020ad62:	644000ef          	jal	ra,ffffffffc020b3a6 <sfs_rbuf>
ffffffffc020ad66:	842a                	mv	s0,a0
ffffffffc020ad68:	0e051563          	bnez	a0,ffffffffc020ae52 <sfs_load_inode+0x166>
ffffffffc020ad6c:	006ad783          	lhu	a5,6(s5)
ffffffffc020ad70:	12078b63          	beqz	a5,ffffffffc020aea6 <sfs_load_inode+0x1ba>
ffffffffc020ad74:	6405                	lui	s0,0x1
ffffffffc020ad76:	23540513          	addi	a0,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020ad7a:	926fd0ef          	jal	ra,ffffffffc0207ea0 <__alloc_inode>
ffffffffc020ad7e:	8a2a                	mv	s4,a0
ffffffffc020ad80:	c961                	beqz	a0,ffffffffc020ae50 <sfs_load_inode+0x164>
ffffffffc020ad82:	004ad683          	lhu	a3,4(s5)
ffffffffc020ad86:	4785                	li	a5,1
ffffffffc020ad88:	0cf69c63          	bne	a3,a5,ffffffffc020ae60 <sfs_load_inode+0x174>
ffffffffc020ad8c:	864a                	mv	a2,s2
ffffffffc020ad8e:	00005597          	auipc	a1,0x5
ffffffffc020ad92:	be258593          	addi	a1,a1,-1054 # ffffffffc020f970 <sfs_node_fileops>
ffffffffc020ad96:	926fd0ef          	jal	ra,ffffffffc0207ebc <inode_init>
ffffffffc020ad9a:	058a2783          	lw	a5,88(s4)
ffffffffc020ad9e:	23540413          	addi	s0,s0,565
ffffffffc020ada2:	0e879063          	bne	a5,s0,ffffffffc020ae82 <sfs_load_inode+0x196>
ffffffffc020ada6:	4785                	li	a5,1
ffffffffc020ada8:	00fa2c23          	sw	a5,24(s4)
ffffffffc020adac:	015a3023          	sd	s5,0(s4)
ffffffffc020adb0:	009a2423          	sw	s1,8(s4)
ffffffffc020adb4:	000a3823          	sd	zero,16(s4)
ffffffffc020adb8:	4585                	li	a1,1
ffffffffc020adba:	020a0513          	addi	a0,s4,32
ffffffffc020adbe:	82df90ef          	jal	ra,ffffffffc02045ea <sem_init>
ffffffffc020adc2:	058a2703          	lw	a4,88(s4)
ffffffffc020adc6:	6785                	lui	a5,0x1
ffffffffc020adc8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020adcc:	14f71663          	bne	a4,a5,ffffffffc020af18 <sfs_load_inode+0x22c>
ffffffffc020add0:	0a093703          	ld	a4,160(s2)
ffffffffc020add4:	038a0793          	addi	a5,s4,56
ffffffffc020add8:	008a2503          	lw	a0,8(s4)
ffffffffc020addc:	e31c                	sd	a5,0(a4)
ffffffffc020adde:	0af93023          	sd	a5,160(s2)
ffffffffc020ade2:	09890793          	addi	a5,s2,152
ffffffffc020ade6:	0a893403          	ld	s0,168(s2)
ffffffffc020adea:	45a9                	li	a1,10
ffffffffc020adec:	04ea3023          	sd	a4,64(s4)
ffffffffc020adf0:	02fa3c23          	sd	a5,56(s4)
ffffffffc020adf4:	003000ef          	jal	ra,ffffffffc020b5f6 <hash32>
ffffffffc020adf8:	02051713          	slli	a4,a0,0x20
ffffffffc020adfc:	01c75793          	srli	a5,a4,0x1c
ffffffffc020ae00:	97a2                	add	a5,a5,s0
ffffffffc020ae02:	6798                	ld	a4,8(a5)
ffffffffc020ae04:	048a0693          	addi	a3,s4,72
ffffffffc020ae08:	e314                	sd	a3,0(a4)
ffffffffc020ae0a:	e794                	sd	a3,8(a5)
ffffffffc020ae0c:	04ea3823          	sd	a4,80(s4)
ffffffffc020ae10:	04fa3423          	sd	a5,72(s4)
ffffffffc020ae14:	854a                	mv	a0,s2
ffffffffc020ae16:	7d0000ef          	jal	ra,ffffffffc020b5e6 <unlock_sfs_fs>
ffffffffc020ae1a:	4401                	li	s0,0
ffffffffc020ae1c:	0149b023          	sd	s4,0(s3)
ffffffffc020ae20:	70e2                	ld	ra,56(sp)
ffffffffc020ae22:	8522                	mv	a0,s0
ffffffffc020ae24:	7442                	ld	s0,48(sp)
ffffffffc020ae26:	74a2                	ld	s1,40(sp)
ffffffffc020ae28:	7902                	ld	s2,32(sp)
ffffffffc020ae2a:	69e2                	ld	s3,24(sp)
ffffffffc020ae2c:	6a42                	ld	s4,16(sp)
ffffffffc020ae2e:	6aa2                	ld	s5,8(sp)
ffffffffc020ae30:	6121                	addi	sp,sp,64
ffffffffc020ae32:	8082                	ret
ffffffffc020ae34:	fb840a13          	addi	s4,s0,-72
ffffffffc020ae38:	8552                	mv	a0,s4
ffffffffc020ae3a:	8e4fd0ef          	jal	ra,ffffffffc0207f1e <inode_ref_inc>
ffffffffc020ae3e:	4785                	li	a5,1
ffffffffc020ae40:	fcf51ae3          	bne	a0,a5,ffffffffc020ae14 <sfs_load_inode+0x128>
ffffffffc020ae44:	fd042783          	lw	a5,-48(s0)
ffffffffc020ae48:	2785                	addiw	a5,a5,1
ffffffffc020ae4a:	fcf42823          	sw	a5,-48(s0)
ffffffffc020ae4e:	b7d9                	j	ffffffffc020ae14 <sfs_load_inode+0x128>
ffffffffc020ae50:	5471                	li	s0,-4
ffffffffc020ae52:	8556                	mv	a0,s5
ffffffffc020ae54:	a76f70ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020ae58:	854a                	mv	a0,s2
ffffffffc020ae5a:	78c000ef          	jal	ra,ffffffffc020b5e6 <unlock_sfs_fs>
ffffffffc020ae5e:	b7c9                	j	ffffffffc020ae20 <sfs_load_inode+0x134>
ffffffffc020ae60:	4789                	li	a5,2
ffffffffc020ae62:	08f69f63          	bne	a3,a5,ffffffffc020af00 <sfs_load_inode+0x214>
ffffffffc020ae66:	864a                	mv	a2,s2
ffffffffc020ae68:	00005597          	auipc	a1,0x5
ffffffffc020ae6c:	a8858593          	addi	a1,a1,-1400 # ffffffffc020f8f0 <sfs_node_dirops>
ffffffffc020ae70:	84cfd0ef          	jal	ra,ffffffffc0207ebc <inode_init>
ffffffffc020ae74:	058a2703          	lw	a4,88(s4)
ffffffffc020ae78:	6785                	lui	a5,0x1
ffffffffc020ae7a:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020ae7e:	f2f704e3          	beq	a4,a5,ffffffffc020ada6 <sfs_load_inode+0xba>
ffffffffc020ae82:	00004697          	auipc	a3,0x4
ffffffffc020ae86:	73668693          	addi	a3,a3,1846 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc020ae8a:	00001617          	auipc	a2,0x1
ffffffffc020ae8e:	18660613          	addi	a2,a2,390 # ffffffffc020c010 <commands+0x210>
ffffffffc020ae92:	07700593          	li	a1,119
ffffffffc020ae96:	00004517          	auipc	a0,0x4
ffffffffc020ae9a:	75a50513          	addi	a0,a0,1882 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020ae9e:	e00f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020aea2:	5471                	li	s0,-4
ffffffffc020aea4:	bf55                	j	ffffffffc020ae58 <sfs_load_inode+0x16c>
ffffffffc020aea6:	00005697          	auipc	a3,0x5
ffffffffc020aeaa:	9d268693          	addi	a3,a3,-1582 # ffffffffc020f878 <dev_node_ops+0x848>
ffffffffc020aeae:	00001617          	auipc	a2,0x1
ffffffffc020aeb2:	16260613          	addi	a2,a2,354 # ffffffffc020c010 <commands+0x210>
ffffffffc020aeb6:	0ad00593          	li	a1,173
ffffffffc020aeba:	00004517          	auipc	a0,0x4
ffffffffc020aebe:	73650513          	addi	a0,a0,1846 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020aec2:	ddcf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020aec6:	8726                	mv	a4,s1
ffffffffc020aec8:	00004617          	auipc	a2,0x4
ffffffffc020aecc:	75860613          	addi	a2,a2,1880 # ffffffffc020f620 <dev_node_ops+0x5f0>
ffffffffc020aed0:	05300593          	li	a1,83
ffffffffc020aed4:	00004517          	auipc	a0,0x4
ffffffffc020aed8:	71c50513          	addi	a0,a0,1820 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020aedc:	dc2f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020aee0:	00004697          	auipc	a3,0x4
ffffffffc020aee4:	77868693          	addi	a3,a3,1912 # ffffffffc020f658 <dev_node_ops+0x628>
ffffffffc020aee8:	00001617          	auipc	a2,0x1
ffffffffc020aeec:	12860613          	addi	a2,a2,296 # ffffffffc020c010 <commands+0x210>
ffffffffc020aef0:	0a800593          	li	a1,168
ffffffffc020aef4:	00004517          	auipc	a0,0x4
ffffffffc020aef8:	6fc50513          	addi	a0,a0,1788 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020aefc:	da2f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020af00:	00004617          	auipc	a2,0x4
ffffffffc020af04:	70860613          	addi	a2,a2,1800 # ffffffffc020f608 <dev_node_ops+0x5d8>
ffffffffc020af08:	02e00593          	li	a1,46
ffffffffc020af0c:	00004517          	auipc	a0,0x4
ffffffffc020af10:	6e450513          	addi	a0,a0,1764 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020af14:	d8af50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020af18:	00004697          	auipc	a3,0x4
ffffffffc020af1c:	6a068693          	addi	a3,a3,1696 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc020af20:	00001617          	auipc	a2,0x1
ffffffffc020af24:	0f060613          	addi	a2,a2,240 # ffffffffc020c010 <commands+0x210>
ffffffffc020af28:	0b100593          	li	a1,177
ffffffffc020af2c:	00004517          	auipc	a0,0x4
ffffffffc020af30:	6c450513          	addi	a0,a0,1732 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020af34:	d6af50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020af38 <sfs_lookup>:
ffffffffc020af38:	7139                	addi	sp,sp,-64
ffffffffc020af3a:	ec4e                	sd	s3,24(sp)
ffffffffc020af3c:	06853983          	ld	s3,104(a0)
ffffffffc020af40:	fc06                	sd	ra,56(sp)
ffffffffc020af42:	f822                	sd	s0,48(sp)
ffffffffc020af44:	f426                	sd	s1,40(sp)
ffffffffc020af46:	f04a                	sd	s2,32(sp)
ffffffffc020af48:	e852                	sd	s4,16(sp)
ffffffffc020af4a:	0a098c63          	beqz	s3,ffffffffc020b002 <sfs_lookup+0xca>
ffffffffc020af4e:	0b09a783          	lw	a5,176(s3)
ffffffffc020af52:	ebc5                	bnez	a5,ffffffffc020b002 <sfs_lookup+0xca>
ffffffffc020af54:	0005c783          	lbu	a5,0(a1)
ffffffffc020af58:	84ae                	mv	s1,a1
ffffffffc020af5a:	c7c1                	beqz	a5,ffffffffc020afe2 <sfs_lookup+0xaa>
ffffffffc020af5c:	02f00713          	li	a4,47
ffffffffc020af60:	08e78163          	beq	a5,a4,ffffffffc020afe2 <sfs_lookup+0xaa>
ffffffffc020af64:	842a                	mv	s0,a0
ffffffffc020af66:	8a32                	mv	s4,a2
ffffffffc020af68:	fb7fc0ef          	jal	ra,ffffffffc0207f1e <inode_ref_inc>
ffffffffc020af6c:	4c38                	lw	a4,88(s0)
ffffffffc020af6e:	6785                	lui	a5,0x1
ffffffffc020af70:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020af74:	0af71763          	bne	a4,a5,ffffffffc020b022 <sfs_lookup+0xea>
ffffffffc020af78:	6018                	ld	a4,0(s0)
ffffffffc020af7a:	4789                	li	a5,2
ffffffffc020af7c:	00475703          	lhu	a4,4(a4)
ffffffffc020af80:	04f71c63          	bne	a4,a5,ffffffffc020afd8 <sfs_lookup+0xa0>
ffffffffc020af84:	02040913          	addi	s2,s0,32
ffffffffc020af88:	854a                	mv	a0,s2
ffffffffc020af8a:	e6af90ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc020af8e:	8626                	mv	a2,s1
ffffffffc020af90:	0054                	addi	a3,sp,4
ffffffffc020af92:	85a2                	mv	a1,s0
ffffffffc020af94:	854e                	mv	a0,s3
ffffffffc020af96:	a29ff0ef          	jal	ra,ffffffffc020a9be <sfs_dirent_search_nolock.constprop.0>
ffffffffc020af9a:	84aa                	mv	s1,a0
ffffffffc020af9c:	854a                	mv	a0,s2
ffffffffc020af9e:	e52f90ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020afa2:	cc89                	beqz	s1,ffffffffc020afbc <sfs_lookup+0x84>
ffffffffc020afa4:	8522                	mv	a0,s0
ffffffffc020afa6:	846fd0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc020afaa:	70e2                	ld	ra,56(sp)
ffffffffc020afac:	7442                	ld	s0,48(sp)
ffffffffc020afae:	7902                	ld	s2,32(sp)
ffffffffc020afb0:	69e2                	ld	s3,24(sp)
ffffffffc020afb2:	6a42                	ld	s4,16(sp)
ffffffffc020afb4:	8526                	mv	a0,s1
ffffffffc020afb6:	74a2                	ld	s1,40(sp)
ffffffffc020afb8:	6121                	addi	sp,sp,64
ffffffffc020afba:	8082                	ret
ffffffffc020afbc:	4612                	lw	a2,4(sp)
ffffffffc020afbe:	002c                	addi	a1,sp,8
ffffffffc020afc0:	854e                	mv	a0,s3
ffffffffc020afc2:	d2bff0ef          	jal	ra,ffffffffc020acec <sfs_load_inode>
ffffffffc020afc6:	84aa                	mv	s1,a0
ffffffffc020afc8:	8522                	mv	a0,s0
ffffffffc020afca:	822fd0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc020afce:	fcf1                	bnez	s1,ffffffffc020afaa <sfs_lookup+0x72>
ffffffffc020afd0:	67a2                	ld	a5,8(sp)
ffffffffc020afd2:	00fa3023          	sd	a5,0(s4)
ffffffffc020afd6:	bfd1                	j	ffffffffc020afaa <sfs_lookup+0x72>
ffffffffc020afd8:	8522                	mv	a0,s0
ffffffffc020afda:	812fd0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc020afde:	54b9                	li	s1,-18
ffffffffc020afe0:	b7e9                	j	ffffffffc020afaa <sfs_lookup+0x72>
ffffffffc020afe2:	00005697          	auipc	a3,0x5
ffffffffc020afe6:	8ae68693          	addi	a3,a3,-1874 # ffffffffc020f890 <dev_node_ops+0x860>
ffffffffc020afea:	00001617          	auipc	a2,0x1
ffffffffc020afee:	02660613          	addi	a2,a2,38 # ffffffffc020c010 <commands+0x210>
ffffffffc020aff2:	3c300593          	li	a1,963
ffffffffc020aff6:	00004517          	auipc	a0,0x4
ffffffffc020affa:	5fa50513          	addi	a0,a0,1530 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020affe:	ca0f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020b002:	00004697          	auipc	a3,0x4
ffffffffc020b006:	40e68693          	addi	a3,a3,1038 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc020b00a:	00001617          	auipc	a2,0x1
ffffffffc020b00e:	00660613          	addi	a2,a2,6 # ffffffffc020c010 <commands+0x210>
ffffffffc020b012:	3c200593          	li	a1,962
ffffffffc020b016:	00004517          	auipc	a0,0x4
ffffffffc020b01a:	5da50513          	addi	a0,a0,1498 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020b01e:	c80f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020b022:	00004697          	auipc	a3,0x4
ffffffffc020b026:	59668693          	addi	a3,a3,1430 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc020b02a:	00001617          	auipc	a2,0x1
ffffffffc020b02e:	fe660613          	addi	a2,a2,-26 # ffffffffc020c010 <commands+0x210>
ffffffffc020b032:	3c500593          	li	a1,965
ffffffffc020b036:	00004517          	auipc	a0,0x4
ffffffffc020b03a:	5ba50513          	addi	a0,a0,1466 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020b03e:	c60f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020b042 <sfs_namefile>:
ffffffffc020b042:	6d98                	ld	a4,24(a1)
ffffffffc020b044:	7175                	addi	sp,sp,-144
ffffffffc020b046:	e506                	sd	ra,136(sp)
ffffffffc020b048:	e122                	sd	s0,128(sp)
ffffffffc020b04a:	fca6                	sd	s1,120(sp)
ffffffffc020b04c:	f8ca                	sd	s2,112(sp)
ffffffffc020b04e:	f4ce                	sd	s3,104(sp)
ffffffffc020b050:	f0d2                	sd	s4,96(sp)
ffffffffc020b052:	ecd6                	sd	s5,88(sp)
ffffffffc020b054:	e8da                	sd	s6,80(sp)
ffffffffc020b056:	e4de                	sd	s7,72(sp)
ffffffffc020b058:	e0e2                	sd	s8,64(sp)
ffffffffc020b05a:	fc66                	sd	s9,56(sp)
ffffffffc020b05c:	f86a                	sd	s10,48(sp)
ffffffffc020b05e:	f46e                	sd	s11,40(sp)
ffffffffc020b060:	e42e                	sd	a1,8(sp)
ffffffffc020b062:	4789                	li	a5,2
ffffffffc020b064:	1ae7f363          	bgeu	a5,a4,ffffffffc020b20a <sfs_namefile+0x1c8>
ffffffffc020b068:	89aa                	mv	s3,a0
ffffffffc020b06a:	10400513          	li	a0,260
ffffffffc020b06e:	fadf60ef          	jal	ra,ffffffffc020201a <kmalloc>
ffffffffc020b072:	842a                	mv	s0,a0
ffffffffc020b074:	18050b63          	beqz	a0,ffffffffc020b20a <sfs_namefile+0x1c8>
ffffffffc020b078:	0689b483          	ld	s1,104(s3)
ffffffffc020b07c:	1e048963          	beqz	s1,ffffffffc020b26e <sfs_namefile+0x22c>
ffffffffc020b080:	0b04a783          	lw	a5,176(s1)
ffffffffc020b084:	1e079563          	bnez	a5,ffffffffc020b26e <sfs_namefile+0x22c>
ffffffffc020b088:	0589ac83          	lw	s9,88(s3)
ffffffffc020b08c:	6785                	lui	a5,0x1
ffffffffc020b08e:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020b092:	1afc9e63          	bne	s9,a5,ffffffffc020b24e <sfs_namefile+0x20c>
ffffffffc020b096:	6722                	ld	a4,8(sp)
ffffffffc020b098:	854e                	mv	a0,s3
ffffffffc020b09a:	8ace                	mv	s5,s3
ffffffffc020b09c:	6f1c                	ld	a5,24(a4)
ffffffffc020b09e:	00073b03          	ld	s6,0(a4)
ffffffffc020b0a2:	02098a13          	addi	s4,s3,32
ffffffffc020b0a6:	ffe78b93          	addi	s7,a5,-2
ffffffffc020b0aa:	9b3e                	add	s6,s6,a5
ffffffffc020b0ac:	00005d17          	auipc	s10,0x5
ffffffffc020b0b0:	804d0d13          	addi	s10,s10,-2044 # ffffffffc020f8b0 <dev_node_ops+0x880>
ffffffffc020b0b4:	e6bfc0ef          	jal	ra,ffffffffc0207f1e <inode_ref_inc>
ffffffffc020b0b8:	00440c13          	addi	s8,s0,4
ffffffffc020b0bc:	e066                	sd	s9,0(sp)
ffffffffc020b0be:	8552                	mv	a0,s4
ffffffffc020b0c0:	d34f90ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc020b0c4:	0854                	addi	a3,sp,20
ffffffffc020b0c6:	866a                	mv	a2,s10
ffffffffc020b0c8:	85d6                	mv	a1,s5
ffffffffc020b0ca:	8526                	mv	a0,s1
ffffffffc020b0cc:	8f3ff0ef          	jal	ra,ffffffffc020a9be <sfs_dirent_search_nolock.constprop.0>
ffffffffc020b0d0:	8daa                	mv	s11,a0
ffffffffc020b0d2:	8552                	mv	a0,s4
ffffffffc020b0d4:	d1cf90ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020b0d8:	020d8863          	beqz	s11,ffffffffc020b108 <sfs_namefile+0xc6>
ffffffffc020b0dc:	854e                	mv	a0,s3
ffffffffc020b0de:	f0ffc0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc020b0e2:	8522                	mv	a0,s0
ffffffffc020b0e4:	fe7f60ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020b0e8:	60aa                	ld	ra,136(sp)
ffffffffc020b0ea:	640a                	ld	s0,128(sp)
ffffffffc020b0ec:	74e6                	ld	s1,120(sp)
ffffffffc020b0ee:	7946                	ld	s2,112(sp)
ffffffffc020b0f0:	79a6                	ld	s3,104(sp)
ffffffffc020b0f2:	7a06                	ld	s4,96(sp)
ffffffffc020b0f4:	6ae6                	ld	s5,88(sp)
ffffffffc020b0f6:	6b46                	ld	s6,80(sp)
ffffffffc020b0f8:	6ba6                	ld	s7,72(sp)
ffffffffc020b0fa:	6c06                	ld	s8,64(sp)
ffffffffc020b0fc:	7ce2                	ld	s9,56(sp)
ffffffffc020b0fe:	7d42                	ld	s10,48(sp)
ffffffffc020b100:	856e                	mv	a0,s11
ffffffffc020b102:	7da2                	ld	s11,40(sp)
ffffffffc020b104:	6149                	addi	sp,sp,144
ffffffffc020b106:	8082                	ret
ffffffffc020b108:	4652                	lw	a2,20(sp)
ffffffffc020b10a:	082c                	addi	a1,sp,24
ffffffffc020b10c:	8526                	mv	a0,s1
ffffffffc020b10e:	bdfff0ef          	jal	ra,ffffffffc020acec <sfs_load_inode>
ffffffffc020b112:	8daa                	mv	s11,a0
ffffffffc020b114:	f561                	bnez	a0,ffffffffc020b0dc <sfs_namefile+0x9a>
ffffffffc020b116:	854e                	mv	a0,s3
ffffffffc020b118:	008aa903          	lw	s2,8(s5)
ffffffffc020b11c:	ed1fc0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc020b120:	6ce2                	ld	s9,24(sp)
ffffffffc020b122:	0b3c8463          	beq	s9,s3,ffffffffc020b1ca <sfs_namefile+0x188>
ffffffffc020b126:	100c8463          	beqz	s9,ffffffffc020b22e <sfs_namefile+0x1ec>
ffffffffc020b12a:	058ca703          	lw	a4,88(s9)
ffffffffc020b12e:	6782                	ld	a5,0(sp)
ffffffffc020b130:	0ef71f63          	bne	a4,a5,ffffffffc020b22e <sfs_namefile+0x1ec>
ffffffffc020b134:	008ca703          	lw	a4,8(s9)
ffffffffc020b138:	8ae6                	mv	s5,s9
ffffffffc020b13a:	0d270a63          	beq	a4,s2,ffffffffc020b20e <sfs_namefile+0x1cc>
ffffffffc020b13e:	000cb703          	ld	a4,0(s9)
ffffffffc020b142:	4789                	li	a5,2
ffffffffc020b144:	00475703          	lhu	a4,4(a4)
ffffffffc020b148:	0cf71363          	bne	a4,a5,ffffffffc020b20e <sfs_namefile+0x1cc>
ffffffffc020b14c:	020c8a13          	addi	s4,s9,32
ffffffffc020b150:	8552                	mv	a0,s4
ffffffffc020b152:	ca2f90ef          	jal	ra,ffffffffc02045f4 <down>
ffffffffc020b156:	000cb703          	ld	a4,0(s9)
ffffffffc020b15a:	00872983          	lw	s3,8(a4)
ffffffffc020b15e:	01304963          	bgtz	s3,ffffffffc020b170 <sfs_namefile+0x12e>
ffffffffc020b162:	a899                	j	ffffffffc020b1b8 <sfs_namefile+0x176>
ffffffffc020b164:	4018                	lw	a4,0(s0)
ffffffffc020b166:	01270e63          	beq	a4,s2,ffffffffc020b182 <sfs_namefile+0x140>
ffffffffc020b16a:	2d85                	addiw	s11,s11,1
ffffffffc020b16c:	05b98663          	beq	s3,s11,ffffffffc020b1b8 <sfs_namefile+0x176>
ffffffffc020b170:	86a2                	mv	a3,s0
ffffffffc020b172:	866e                	mv	a2,s11
ffffffffc020b174:	85e6                	mv	a1,s9
ffffffffc020b176:	8526                	mv	a0,s1
ffffffffc020b178:	e48ff0ef          	jal	ra,ffffffffc020a7c0 <sfs_dirent_read_nolock>
ffffffffc020b17c:	872a                	mv	a4,a0
ffffffffc020b17e:	d17d                	beqz	a0,ffffffffc020b164 <sfs_namefile+0x122>
ffffffffc020b180:	a82d                	j	ffffffffc020b1ba <sfs_namefile+0x178>
ffffffffc020b182:	8552                	mv	a0,s4
ffffffffc020b184:	c6cf90ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020b188:	8562                	mv	a0,s8
ffffffffc020b18a:	0ff000ef          	jal	ra,ffffffffc020ba88 <strlen>
ffffffffc020b18e:	00150793          	addi	a5,a0,1
ffffffffc020b192:	862a                	mv	a2,a0
ffffffffc020b194:	06fbe863          	bltu	s7,a5,ffffffffc020b204 <sfs_namefile+0x1c2>
ffffffffc020b198:	fff64913          	not	s2,a2
ffffffffc020b19c:	995a                	add	s2,s2,s6
ffffffffc020b19e:	85e2                	mv	a1,s8
ffffffffc020b1a0:	854a                	mv	a0,s2
ffffffffc020b1a2:	40fb8bb3          	sub	s7,s7,a5
ffffffffc020b1a6:	1d7000ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc020b1aa:	02f00793          	li	a5,47
ffffffffc020b1ae:	fefb0fa3          	sb	a5,-1(s6)
ffffffffc020b1b2:	89e6                	mv	s3,s9
ffffffffc020b1b4:	8b4a                	mv	s6,s2
ffffffffc020b1b6:	b721                	j	ffffffffc020b0be <sfs_namefile+0x7c>
ffffffffc020b1b8:	5741                	li	a4,-16
ffffffffc020b1ba:	8552                	mv	a0,s4
ffffffffc020b1bc:	e03a                	sd	a4,0(sp)
ffffffffc020b1be:	c32f90ef          	jal	ra,ffffffffc02045f0 <up>
ffffffffc020b1c2:	6702                	ld	a4,0(sp)
ffffffffc020b1c4:	89e6                	mv	s3,s9
ffffffffc020b1c6:	8dba                	mv	s11,a4
ffffffffc020b1c8:	bf11                	j	ffffffffc020b0dc <sfs_namefile+0x9a>
ffffffffc020b1ca:	854e                	mv	a0,s3
ffffffffc020b1cc:	e21fc0ef          	jal	ra,ffffffffc0207fec <inode_ref_dec>
ffffffffc020b1d0:	64a2                	ld	s1,8(sp)
ffffffffc020b1d2:	85da                	mv	a1,s6
ffffffffc020b1d4:	6c98                	ld	a4,24(s1)
ffffffffc020b1d6:	6088                	ld	a0,0(s1)
ffffffffc020b1d8:	1779                	addi	a4,a4,-2
ffffffffc020b1da:	41770bb3          	sub	s7,a4,s7
ffffffffc020b1de:	865e                	mv	a2,s7
ffffffffc020b1e0:	0505                	addi	a0,a0,1
ffffffffc020b1e2:	15b000ef          	jal	ra,ffffffffc020bb3c <memmove>
ffffffffc020b1e6:	02f00713          	li	a4,47
ffffffffc020b1ea:	fee50fa3          	sb	a4,-1(a0)
ffffffffc020b1ee:	955e                	add	a0,a0,s7
ffffffffc020b1f0:	00050023          	sb	zero,0(a0)
ffffffffc020b1f4:	85de                	mv	a1,s7
ffffffffc020b1f6:	8526                	mv	a0,s1
ffffffffc020b1f8:	af0fa0ef          	jal	ra,ffffffffc02054e8 <iobuf_skip>
ffffffffc020b1fc:	8522                	mv	a0,s0
ffffffffc020b1fe:	ecdf60ef          	jal	ra,ffffffffc02020ca <kfree>
ffffffffc020b202:	b5dd                	j	ffffffffc020b0e8 <sfs_namefile+0xa6>
ffffffffc020b204:	89e6                	mv	s3,s9
ffffffffc020b206:	5df1                	li	s11,-4
ffffffffc020b208:	bdd1                	j	ffffffffc020b0dc <sfs_namefile+0x9a>
ffffffffc020b20a:	5df1                	li	s11,-4
ffffffffc020b20c:	bdf1                	j	ffffffffc020b0e8 <sfs_namefile+0xa6>
ffffffffc020b20e:	00004697          	auipc	a3,0x4
ffffffffc020b212:	6aa68693          	addi	a3,a3,1706 # ffffffffc020f8b8 <dev_node_ops+0x888>
ffffffffc020b216:	00001617          	auipc	a2,0x1
ffffffffc020b21a:	dfa60613          	addi	a2,a2,-518 # ffffffffc020c010 <commands+0x210>
ffffffffc020b21e:	2e100593          	li	a1,737
ffffffffc020b222:	00004517          	auipc	a0,0x4
ffffffffc020b226:	3ce50513          	addi	a0,a0,974 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020b22a:	a74f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020b22e:	00004697          	auipc	a3,0x4
ffffffffc020b232:	38a68693          	addi	a3,a3,906 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc020b236:	00001617          	auipc	a2,0x1
ffffffffc020b23a:	dda60613          	addi	a2,a2,-550 # ffffffffc020c010 <commands+0x210>
ffffffffc020b23e:	2e000593          	li	a1,736
ffffffffc020b242:	00004517          	auipc	a0,0x4
ffffffffc020b246:	3ae50513          	addi	a0,a0,942 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020b24a:	a54f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020b24e:	00004697          	auipc	a3,0x4
ffffffffc020b252:	36a68693          	addi	a3,a3,874 # ffffffffc020f5b8 <dev_node_ops+0x588>
ffffffffc020b256:	00001617          	auipc	a2,0x1
ffffffffc020b25a:	dba60613          	addi	a2,a2,-582 # ffffffffc020c010 <commands+0x210>
ffffffffc020b25e:	2cd00593          	li	a1,717
ffffffffc020b262:	00004517          	auipc	a0,0x4
ffffffffc020b266:	38e50513          	addi	a0,a0,910 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020b26a:	a34f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020b26e:	00004697          	auipc	a3,0x4
ffffffffc020b272:	1a268693          	addi	a3,a3,418 # ffffffffc020f410 <dev_node_ops+0x3e0>
ffffffffc020b276:	00001617          	auipc	a2,0x1
ffffffffc020b27a:	d9a60613          	addi	a2,a2,-614 # ffffffffc020c010 <commands+0x210>
ffffffffc020b27e:	2cc00593          	li	a1,716
ffffffffc020b282:	00004517          	auipc	a0,0x4
ffffffffc020b286:	36e50513          	addi	a0,a0,878 # ffffffffc020f5f0 <dev_node_ops+0x5c0>
ffffffffc020b28a:	a14f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020b28e <sfs_rwblock_nolock>:
ffffffffc020b28e:	7139                	addi	sp,sp,-64
ffffffffc020b290:	f822                	sd	s0,48(sp)
ffffffffc020b292:	f426                	sd	s1,40(sp)
ffffffffc020b294:	fc06                	sd	ra,56(sp)
ffffffffc020b296:	842a                	mv	s0,a0
ffffffffc020b298:	84b6                	mv	s1,a3
ffffffffc020b29a:	e211                	bnez	a2,ffffffffc020b29e <sfs_rwblock_nolock+0x10>
ffffffffc020b29c:	e715                	bnez	a4,ffffffffc020b2c8 <sfs_rwblock_nolock+0x3a>
ffffffffc020b29e:	405c                	lw	a5,4(s0)
ffffffffc020b2a0:	02f67463          	bgeu	a2,a5,ffffffffc020b2c8 <sfs_rwblock_nolock+0x3a>
ffffffffc020b2a4:	00c6169b          	slliw	a3,a2,0xc
ffffffffc020b2a8:	1682                	slli	a3,a3,0x20
ffffffffc020b2aa:	6605                	lui	a2,0x1
ffffffffc020b2ac:	9281                	srli	a3,a3,0x20
ffffffffc020b2ae:	850a                	mv	a0,sp
ffffffffc020b2b0:	9c2fa0ef          	jal	ra,ffffffffc0205472 <iobuf_init>
ffffffffc020b2b4:	85aa                	mv	a1,a0
ffffffffc020b2b6:	7808                	ld	a0,48(s0)
ffffffffc020b2b8:	8626                	mv	a2,s1
ffffffffc020b2ba:	7118                	ld	a4,32(a0)
ffffffffc020b2bc:	9702                	jalr	a4
ffffffffc020b2be:	70e2                	ld	ra,56(sp)
ffffffffc020b2c0:	7442                	ld	s0,48(sp)
ffffffffc020b2c2:	74a2                	ld	s1,40(sp)
ffffffffc020b2c4:	6121                	addi	sp,sp,64
ffffffffc020b2c6:	8082                	ret
ffffffffc020b2c8:	00004697          	auipc	a3,0x4
ffffffffc020b2cc:	72868693          	addi	a3,a3,1832 # ffffffffc020f9f0 <sfs_node_fileops+0x80>
ffffffffc020b2d0:	00001617          	auipc	a2,0x1
ffffffffc020b2d4:	d4060613          	addi	a2,a2,-704 # ffffffffc020c010 <commands+0x210>
ffffffffc020b2d8:	45d5                	li	a1,21
ffffffffc020b2da:	00004517          	auipc	a0,0x4
ffffffffc020b2de:	74e50513          	addi	a0,a0,1870 # ffffffffc020fa28 <sfs_node_fileops+0xb8>
ffffffffc020b2e2:	9bcf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020b2e6 <sfs_rblock>:
ffffffffc020b2e6:	7139                	addi	sp,sp,-64
ffffffffc020b2e8:	ec4e                	sd	s3,24(sp)
ffffffffc020b2ea:	89b6                	mv	s3,a3
ffffffffc020b2ec:	f822                	sd	s0,48(sp)
ffffffffc020b2ee:	f04a                	sd	s2,32(sp)
ffffffffc020b2f0:	e852                	sd	s4,16(sp)
ffffffffc020b2f2:	fc06                	sd	ra,56(sp)
ffffffffc020b2f4:	f426                	sd	s1,40(sp)
ffffffffc020b2f6:	e456                	sd	s5,8(sp)
ffffffffc020b2f8:	8a2a                	mv	s4,a0
ffffffffc020b2fa:	892e                	mv	s2,a1
ffffffffc020b2fc:	8432                	mv	s0,a2
ffffffffc020b2fe:	2e0000ef          	jal	ra,ffffffffc020b5de <lock_sfs_io>
ffffffffc020b302:	04098063          	beqz	s3,ffffffffc020b342 <sfs_rblock+0x5c>
ffffffffc020b306:	013409bb          	addw	s3,s0,s3
ffffffffc020b30a:	6a85                	lui	s5,0x1
ffffffffc020b30c:	a021                	j	ffffffffc020b314 <sfs_rblock+0x2e>
ffffffffc020b30e:	9956                	add	s2,s2,s5
ffffffffc020b310:	02898963          	beq	s3,s0,ffffffffc020b342 <sfs_rblock+0x5c>
ffffffffc020b314:	8622                	mv	a2,s0
ffffffffc020b316:	85ca                	mv	a1,s2
ffffffffc020b318:	4705                	li	a4,1
ffffffffc020b31a:	4681                	li	a3,0
ffffffffc020b31c:	8552                	mv	a0,s4
ffffffffc020b31e:	f71ff0ef          	jal	ra,ffffffffc020b28e <sfs_rwblock_nolock>
ffffffffc020b322:	84aa                	mv	s1,a0
ffffffffc020b324:	2405                	addiw	s0,s0,1
ffffffffc020b326:	d565                	beqz	a0,ffffffffc020b30e <sfs_rblock+0x28>
ffffffffc020b328:	8552                	mv	a0,s4
ffffffffc020b32a:	2c4000ef          	jal	ra,ffffffffc020b5ee <unlock_sfs_io>
ffffffffc020b32e:	70e2                	ld	ra,56(sp)
ffffffffc020b330:	7442                	ld	s0,48(sp)
ffffffffc020b332:	7902                	ld	s2,32(sp)
ffffffffc020b334:	69e2                	ld	s3,24(sp)
ffffffffc020b336:	6a42                	ld	s4,16(sp)
ffffffffc020b338:	6aa2                	ld	s5,8(sp)
ffffffffc020b33a:	8526                	mv	a0,s1
ffffffffc020b33c:	74a2                	ld	s1,40(sp)
ffffffffc020b33e:	6121                	addi	sp,sp,64
ffffffffc020b340:	8082                	ret
ffffffffc020b342:	4481                	li	s1,0
ffffffffc020b344:	b7d5                	j	ffffffffc020b328 <sfs_rblock+0x42>

ffffffffc020b346 <sfs_wblock>:
ffffffffc020b346:	7139                	addi	sp,sp,-64
ffffffffc020b348:	ec4e                	sd	s3,24(sp)
ffffffffc020b34a:	89b6                	mv	s3,a3
ffffffffc020b34c:	f822                	sd	s0,48(sp)
ffffffffc020b34e:	f04a                	sd	s2,32(sp)
ffffffffc020b350:	e852                	sd	s4,16(sp)
ffffffffc020b352:	fc06                	sd	ra,56(sp)
ffffffffc020b354:	f426                	sd	s1,40(sp)
ffffffffc020b356:	e456                	sd	s5,8(sp)
ffffffffc020b358:	8a2a                	mv	s4,a0
ffffffffc020b35a:	892e                	mv	s2,a1
ffffffffc020b35c:	8432                	mv	s0,a2
ffffffffc020b35e:	280000ef          	jal	ra,ffffffffc020b5de <lock_sfs_io>
ffffffffc020b362:	04098063          	beqz	s3,ffffffffc020b3a2 <sfs_wblock+0x5c>
ffffffffc020b366:	013409bb          	addw	s3,s0,s3
ffffffffc020b36a:	6a85                	lui	s5,0x1
ffffffffc020b36c:	a021                	j	ffffffffc020b374 <sfs_wblock+0x2e>
ffffffffc020b36e:	9956                	add	s2,s2,s5
ffffffffc020b370:	02898963          	beq	s3,s0,ffffffffc020b3a2 <sfs_wblock+0x5c>
ffffffffc020b374:	8622                	mv	a2,s0
ffffffffc020b376:	85ca                	mv	a1,s2
ffffffffc020b378:	4705                	li	a4,1
ffffffffc020b37a:	4685                	li	a3,1
ffffffffc020b37c:	8552                	mv	a0,s4
ffffffffc020b37e:	f11ff0ef          	jal	ra,ffffffffc020b28e <sfs_rwblock_nolock>
ffffffffc020b382:	84aa                	mv	s1,a0
ffffffffc020b384:	2405                	addiw	s0,s0,1
ffffffffc020b386:	d565                	beqz	a0,ffffffffc020b36e <sfs_wblock+0x28>
ffffffffc020b388:	8552                	mv	a0,s4
ffffffffc020b38a:	264000ef          	jal	ra,ffffffffc020b5ee <unlock_sfs_io>
ffffffffc020b38e:	70e2                	ld	ra,56(sp)
ffffffffc020b390:	7442                	ld	s0,48(sp)
ffffffffc020b392:	7902                	ld	s2,32(sp)
ffffffffc020b394:	69e2                	ld	s3,24(sp)
ffffffffc020b396:	6a42                	ld	s4,16(sp)
ffffffffc020b398:	6aa2                	ld	s5,8(sp)
ffffffffc020b39a:	8526                	mv	a0,s1
ffffffffc020b39c:	74a2                	ld	s1,40(sp)
ffffffffc020b39e:	6121                	addi	sp,sp,64
ffffffffc020b3a0:	8082                	ret
ffffffffc020b3a2:	4481                	li	s1,0
ffffffffc020b3a4:	b7d5                	j	ffffffffc020b388 <sfs_wblock+0x42>

ffffffffc020b3a6 <sfs_rbuf>:
ffffffffc020b3a6:	7179                	addi	sp,sp,-48
ffffffffc020b3a8:	f406                	sd	ra,40(sp)
ffffffffc020b3aa:	f022                	sd	s0,32(sp)
ffffffffc020b3ac:	ec26                	sd	s1,24(sp)
ffffffffc020b3ae:	e84a                	sd	s2,16(sp)
ffffffffc020b3b0:	e44e                	sd	s3,8(sp)
ffffffffc020b3b2:	e052                	sd	s4,0(sp)
ffffffffc020b3b4:	6785                	lui	a5,0x1
ffffffffc020b3b6:	04f77863          	bgeu	a4,a5,ffffffffc020b406 <sfs_rbuf+0x60>
ffffffffc020b3ba:	84ba                	mv	s1,a4
ffffffffc020b3bc:	9732                	add	a4,a4,a2
ffffffffc020b3be:	89b2                	mv	s3,a2
ffffffffc020b3c0:	04e7e363          	bltu	a5,a4,ffffffffc020b406 <sfs_rbuf+0x60>
ffffffffc020b3c4:	8936                	mv	s2,a3
ffffffffc020b3c6:	842a                	mv	s0,a0
ffffffffc020b3c8:	8a2e                	mv	s4,a1
ffffffffc020b3ca:	214000ef          	jal	ra,ffffffffc020b5de <lock_sfs_io>
ffffffffc020b3ce:	642c                	ld	a1,72(s0)
ffffffffc020b3d0:	864a                	mv	a2,s2
ffffffffc020b3d2:	4705                	li	a4,1
ffffffffc020b3d4:	4681                	li	a3,0
ffffffffc020b3d6:	8522                	mv	a0,s0
ffffffffc020b3d8:	eb7ff0ef          	jal	ra,ffffffffc020b28e <sfs_rwblock_nolock>
ffffffffc020b3dc:	892a                	mv	s2,a0
ffffffffc020b3de:	cd09                	beqz	a0,ffffffffc020b3f8 <sfs_rbuf+0x52>
ffffffffc020b3e0:	8522                	mv	a0,s0
ffffffffc020b3e2:	20c000ef          	jal	ra,ffffffffc020b5ee <unlock_sfs_io>
ffffffffc020b3e6:	70a2                	ld	ra,40(sp)
ffffffffc020b3e8:	7402                	ld	s0,32(sp)
ffffffffc020b3ea:	64e2                	ld	s1,24(sp)
ffffffffc020b3ec:	69a2                	ld	s3,8(sp)
ffffffffc020b3ee:	6a02                	ld	s4,0(sp)
ffffffffc020b3f0:	854a                	mv	a0,s2
ffffffffc020b3f2:	6942                	ld	s2,16(sp)
ffffffffc020b3f4:	6145                	addi	sp,sp,48
ffffffffc020b3f6:	8082                	ret
ffffffffc020b3f8:	642c                	ld	a1,72(s0)
ffffffffc020b3fa:	864e                	mv	a2,s3
ffffffffc020b3fc:	8552                	mv	a0,s4
ffffffffc020b3fe:	95a6                	add	a1,a1,s1
ffffffffc020b400:	77c000ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc020b404:	bff1                	j	ffffffffc020b3e0 <sfs_rbuf+0x3a>
ffffffffc020b406:	00004697          	auipc	a3,0x4
ffffffffc020b40a:	63a68693          	addi	a3,a3,1594 # ffffffffc020fa40 <sfs_node_fileops+0xd0>
ffffffffc020b40e:	00001617          	auipc	a2,0x1
ffffffffc020b412:	c0260613          	addi	a2,a2,-1022 # ffffffffc020c010 <commands+0x210>
ffffffffc020b416:	05500593          	li	a1,85
ffffffffc020b41a:	00004517          	auipc	a0,0x4
ffffffffc020b41e:	60e50513          	addi	a0,a0,1550 # ffffffffc020fa28 <sfs_node_fileops+0xb8>
ffffffffc020b422:	87cf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020b426 <sfs_wbuf>:
ffffffffc020b426:	7139                	addi	sp,sp,-64
ffffffffc020b428:	fc06                	sd	ra,56(sp)
ffffffffc020b42a:	f822                	sd	s0,48(sp)
ffffffffc020b42c:	f426                	sd	s1,40(sp)
ffffffffc020b42e:	f04a                	sd	s2,32(sp)
ffffffffc020b430:	ec4e                	sd	s3,24(sp)
ffffffffc020b432:	e852                	sd	s4,16(sp)
ffffffffc020b434:	e456                	sd	s5,8(sp)
ffffffffc020b436:	6785                	lui	a5,0x1
ffffffffc020b438:	06f77163          	bgeu	a4,a5,ffffffffc020b49a <sfs_wbuf+0x74>
ffffffffc020b43c:	893a                	mv	s2,a4
ffffffffc020b43e:	9732                	add	a4,a4,a2
ffffffffc020b440:	8a32                	mv	s4,a2
ffffffffc020b442:	04e7ec63          	bltu	a5,a4,ffffffffc020b49a <sfs_wbuf+0x74>
ffffffffc020b446:	842a                	mv	s0,a0
ffffffffc020b448:	89b6                	mv	s3,a3
ffffffffc020b44a:	8aae                	mv	s5,a1
ffffffffc020b44c:	192000ef          	jal	ra,ffffffffc020b5de <lock_sfs_io>
ffffffffc020b450:	642c                	ld	a1,72(s0)
ffffffffc020b452:	4705                	li	a4,1
ffffffffc020b454:	4681                	li	a3,0
ffffffffc020b456:	864e                	mv	a2,s3
ffffffffc020b458:	8522                	mv	a0,s0
ffffffffc020b45a:	e35ff0ef          	jal	ra,ffffffffc020b28e <sfs_rwblock_nolock>
ffffffffc020b45e:	84aa                	mv	s1,a0
ffffffffc020b460:	cd11                	beqz	a0,ffffffffc020b47c <sfs_wbuf+0x56>
ffffffffc020b462:	8522                	mv	a0,s0
ffffffffc020b464:	18a000ef          	jal	ra,ffffffffc020b5ee <unlock_sfs_io>
ffffffffc020b468:	70e2                	ld	ra,56(sp)
ffffffffc020b46a:	7442                	ld	s0,48(sp)
ffffffffc020b46c:	7902                	ld	s2,32(sp)
ffffffffc020b46e:	69e2                	ld	s3,24(sp)
ffffffffc020b470:	6a42                	ld	s4,16(sp)
ffffffffc020b472:	6aa2                	ld	s5,8(sp)
ffffffffc020b474:	8526                	mv	a0,s1
ffffffffc020b476:	74a2                	ld	s1,40(sp)
ffffffffc020b478:	6121                	addi	sp,sp,64
ffffffffc020b47a:	8082                	ret
ffffffffc020b47c:	6428                	ld	a0,72(s0)
ffffffffc020b47e:	8652                	mv	a2,s4
ffffffffc020b480:	85d6                	mv	a1,s5
ffffffffc020b482:	954a                	add	a0,a0,s2
ffffffffc020b484:	6f8000ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc020b488:	642c                	ld	a1,72(s0)
ffffffffc020b48a:	4705                	li	a4,1
ffffffffc020b48c:	4685                	li	a3,1
ffffffffc020b48e:	864e                	mv	a2,s3
ffffffffc020b490:	8522                	mv	a0,s0
ffffffffc020b492:	dfdff0ef          	jal	ra,ffffffffc020b28e <sfs_rwblock_nolock>
ffffffffc020b496:	84aa                	mv	s1,a0
ffffffffc020b498:	b7e9                	j	ffffffffc020b462 <sfs_wbuf+0x3c>
ffffffffc020b49a:	00004697          	auipc	a3,0x4
ffffffffc020b49e:	5a668693          	addi	a3,a3,1446 # ffffffffc020fa40 <sfs_node_fileops+0xd0>
ffffffffc020b4a2:	00001617          	auipc	a2,0x1
ffffffffc020b4a6:	b6e60613          	addi	a2,a2,-1170 # ffffffffc020c010 <commands+0x210>
ffffffffc020b4aa:	06b00593          	li	a1,107
ffffffffc020b4ae:	00004517          	auipc	a0,0x4
ffffffffc020b4b2:	57a50513          	addi	a0,a0,1402 # ffffffffc020fa28 <sfs_node_fileops+0xb8>
ffffffffc020b4b6:	fe9f40ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020b4ba <sfs_sync_super>:
ffffffffc020b4ba:	1101                	addi	sp,sp,-32
ffffffffc020b4bc:	ec06                	sd	ra,24(sp)
ffffffffc020b4be:	e822                	sd	s0,16(sp)
ffffffffc020b4c0:	e426                	sd	s1,8(sp)
ffffffffc020b4c2:	842a                	mv	s0,a0
ffffffffc020b4c4:	11a000ef          	jal	ra,ffffffffc020b5de <lock_sfs_io>
ffffffffc020b4c8:	6428                	ld	a0,72(s0)
ffffffffc020b4ca:	6605                	lui	a2,0x1
ffffffffc020b4cc:	4581                	li	a1,0
ffffffffc020b4ce:	65c000ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc020b4d2:	6428                	ld	a0,72(s0)
ffffffffc020b4d4:	85a2                	mv	a1,s0
ffffffffc020b4d6:	02c00613          	li	a2,44
ffffffffc020b4da:	6a2000ef          	jal	ra,ffffffffc020bb7c <memcpy>
ffffffffc020b4de:	642c                	ld	a1,72(s0)
ffffffffc020b4e0:	4701                	li	a4,0
ffffffffc020b4e2:	4685                	li	a3,1
ffffffffc020b4e4:	4601                	li	a2,0
ffffffffc020b4e6:	8522                	mv	a0,s0
ffffffffc020b4e8:	da7ff0ef          	jal	ra,ffffffffc020b28e <sfs_rwblock_nolock>
ffffffffc020b4ec:	84aa                	mv	s1,a0
ffffffffc020b4ee:	8522                	mv	a0,s0
ffffffffc020b4f0:	0fe000ef          	jal	ra,ffffffffc020b5ee <unlock_sfs_io>
ffffffffc020b4f4:	60e2                	ld	ra,24(sp)
ffffffffc020b4f6:	6442                	ld	s0,16(sp)
ffffffffc020b4f8:	8526                	mv	a0,s1
ffffffffc020b4fa:	64a2                	ld	s1,8(sp)
ffffffffc020b4fc:	6105                	addi	sp,sp,32
ffffffffc020b4fe:	8082                	ret

ffffffffc020b500 <sfs_sync_freemap>:
ffffffffc020b500:	7139                	addi	sp,sp,-64
ffffffffc020b502:	ec4e                	sd	s3,24(sp)
ffffffffc020b504:	e852                	sd	s4,16(sp)
ffffffffc020b506:	00456983          	lwu	s3,4(a0)
ffffffffc020b50a:	8a2a                	mv	s4,a0
ffffffffc020b50c:	7d08                	ld	a0,56(a0)
ffffffffc020b50e:	67a1                	lui	a5,0x8
ffffffffc020b510:	17fd                	addi	a5,a5,-1
ffffffffc020b512:	4581                	li	a1,0
ffffffffc020b514:	f822                	sd	s0,48(sp)
ffffffffc020b516:	fc06                	sd	ra,56(sp)
ffffffffc020b518:	f426                	sd	s1,40(sp)
ffffffffc020b51a:	f04a                	sd	s2,32(sp)
ffffffffc020b51c:	e456                	sd	s5,8(sp)
ffffffffc020b51e:	99be                	add	s3,s3,a5
ffffffffc020b520:	a5afe0ef          	jal	ra,ffffffffc020977a <bitmap_getdata>
ffffffffc020b524:	00f9d993          	srli	s3,s3,0xf
ffffffffc020b528:	842a                	mv	s0,a0
ffffffffc020b52a:	8552                	mv	a0,s4
ffffffffc020b52c:	0b2000ef          	jal	ra,ffffffffc020b5de <lock_sfs_io>
ffffffffc020b530:	04098163          	beqz	s3,ffffffffc020b572 <sfs_sync_freemap+0x72>
ffffffffc020b534:	09b2                	slli	s3,s3,0xc
ffffffffc020b536:	99a2                	add	s3,s3,s0
ffffffffc020b538:	4909                	li	s2,2
ffffffffc020b53a:	6a85                	lui	s5,0x1
ffffffffc020b53c:	a021                	j	ffffffffc020b544 <sfs_sync_freemap+0x44>
ffffffffc020b53e:	2905                	addiw	s2,s2,1
ffffffffc020b540:	02898963          	beq	s3,s0,ffffffffc020b572 <sfs_sync_freemap+0x72>
ffffffffc020b544:	85a2                	mv	a1,s0
ffffffffc020b546:	864a                	mv	a2,s2
ffffffffc020b548:	4705                	li	a4,1
ffffffffc020b54a:	4685                	li	a3,1
ffffffffc020b54c:	8552                	mv	a0,s4
ffffffffc020b54e:	d41ff0ef          	jal	ra,ffffffffc020b28e <sfs_rwblock_nolock>
ffffffffc020b552:	84aa                	mv	s1,a0
ffffffffc020b554:	9456                	add	s0,s0,s5
ffffffffc020b556:	d565                	beqz	a0,ffffffffc020b53e <sfs_sync_freemap+0x3e>
ffffffffc020b558:	8552                	mv	a0,s4
ffffffffc020b55a:	094000ef          	jal	ra,ffffffffc020b5ee <unlock_sfs_io>
ffffffffc020b55e:	70e2                	ld	ra,56(sp)
ffffffffc020b560:	7442                	ld	s0,48(sp)
ffffffffc020b562:	7902                	ld	s2,32(sp)
ffffffffc020b564:	69e2                	ld	s3,24(sp)
ffffffffc020b566:	6a42                	ld	s4,16(sp)
ffffffffc020b568:	6aa2                	ld	s5,8(sp)
ffffffffc020b56a:	8526                	mv	a0,s1
ffffffffc020b56c:	74a2                	ld	s1,40(sp)
ffffffffc020b56e:	6121                	addi	sp,sp,64
ffffffffc020b570:	8082                	ret
ffffffffc020b572:	4481                	li	s1,0
ffffffffc020b574:	b7d5                	j	ffffffffc020b558 <sfs_sync_freemap+0x58>

ffffffffc020b576 <sfs_clear_block>:
ffffffffc020b576:	7179                	addi	sp,sp,-48
ffffffffc020b578:	f022                	sd	s0,32(sp)
ffffffffc020b57a:	e84a                	sd	s2,16(sp)
ffffffffc020b57c:	e44e                	sd	s3,8(sp)
ffffffffc020b57e:	f406                	sd	ra,40(sp)
ffffffffc020b580:	89b2                	mv	s3,a2
ffffffffc020b582:	ec26                	sd	s1,24(sp)
ffffffffc020b584:	892a                	mv	s2,a0
ffffffffc020b586:	842e                	mv	s0,a1
ffffffffc020b588:	056000ef          	jal	ra,ffffffffc020b5de <lock_sfs_io>
ffffffffc020b58c:	04893503          	ld	a0,72(s2)
ffffffffc020b590:	6605                	lui	a2,0x1
ffffffffc020b592:	4581                	li	a1,0
ffffffffc020b594:	596000ef          	jal	ra,ffffffffc020bb2a <memset>
ffffffffc020b598:	02098d63          	beqz	s3,ffffffffc020b5d2 <sfs_clear_block+0x5c>
ffffffffc020b59c:	013409bb          	addw	s3,s0,s3
ffffffffc020b5a0:	a019                	j	ffffffffc020b5a6 <sfs_clear_block+0x30>
ffffffffc020b5a2:	02898863          	beq	s3,s0,ffffffffc020b5d2 <sfs_clear_block+0x5c>
ffffffffc020b5a6:	04893583          	ld	a1,72(s2)
ffffffffc020b5aa:	8622                	mv	a2,s0
ffffffffc020b5ac:	4705                	li	a4,1
ffffffffc020b5ae:	4685                	li	a3,1
ffffffffc020b5b0:	854a                	mv	a0,s2
ffffffffc020b5b2:	cddff0ef          	jal	ra,ffffffffc020b28e <sfs_rwblock_nolock>
ffffffffc020b5b6:	84aa                	mv	s1,a0
ffffffffc020b5b8:	2405                	addiw	s0,s0,1
ffffffffc020b5ba:	d565                	beqz	a0,ffffffffc020b5a2 <sfs_clear_block+0x2c>
ffffffffc020b5bc:	854a                	mv	a0,s2
ffffffffc020b5be:	030000ef          	jal	ra,ffffffffc020b5ee <unlock_sfs_io>
ffffffffc020b5c2:	70a2                	ld	ra,40(sp)
ffffffffc020b5c4:	7402                	ld	s0,32(sp)
ffffffffc020b5c6:	6942                	ld	s2,16(sp)
ffffffffc020b5c8:	69a2                	ld	s3,8(sp)
ffffffffc020b5ca:	8526                	mv	a0,s1
ffffffffc020b5cc:	64e2                	ld	s1,24(sp)
ffffffffc020b5ce:	6145                	addi	sp,sp,48
ffffffffc020b5d0:	8082                	ret
ffffffffc020b5d2:	4481                	li	s1,0
ffffffffc020b5d4:	b7e5                	j	ffffffffc020b5bc <sfs_clear_block+0x46>

ffffffffc020b5d6 <lock_sfs_fs>:
ffffffffc020b5d6:	05050513          	addi	a0,a0,80
ffffffffc020b5da:	81af906f          	j	ffffffffc02045f4 <down>

ffffffffc020b5de <lock_sfs_io>:
ffffffffc020b5de:	06850513          	addi	a0,a0,104
ffffffffc020b5e2:	812f906f          	j	ffffffffc02045f4 <down>

ffffffffc020b5e6 <unlock_sfs_fs>:
ffffffffc020b5e6:	05050513          	addi	a0,a0,80
ffffffffc020b5ea:	806f906f          	j	ffffffffc02045f0 <up>

ffffffffc020b5ee <unlock_sfs_io>:
ffffffffc020b5ee:	06850513          	addi	a0,a0,104
ffffffffc020b5f2:	ffff806f          	j	ffffffffc02045f0 <up>

ffffffffc020b5f6 <hash32>:
ffffffffc020b5f6:	9e3707b7          	lui	a5,0x9e370
ffffffffc020b5fa:	2785                	addiw	a5,a5,1
ffffffffc020b5fc:	02a7853b          	mulw	a0,a5,a0
ffffffffc020b600:	02000793          	li	a5,32
ffffffffc020b604:	9f8d                	subw	a5,a5,a1
ffffffffc020b606:	00f5553b          	srlw	a0,a0,a5
ffffffffc020b60a:	8082                	ret

ffffffffc020b60c <printnum>:
ffffffffc020b60c:	02071893          	slli	a7,a4,0x20
ffffffffc020b610:	7139                	addi	sp,sp,-64
ffffffffc020b612:	0208d893          	srli	a7,a7,0x20
ffffffffc020b616:	e456                	sd	s5,8(sp)
ffffffffc020b618:	0316fab3          	remu	s5,a3,a7
ffffffffc020b61c:	f822                	sd	s0,48(sp)
ffffffffc020b61e:	f426                	sd	s1,40(sp)
ffffffffc020b620:	f04a                	sd	s2,32(sp)
ffffffffc020b622:	ec4e                	sd	s3,24(sp)
ffffffffc020b624:	fc06                	sd	ra,56(sp)
ffffffffc020b626:	e852                	sd	s4,16(sp)
ffffffffc020b628:	84aa                	mv	s1,a0
ffffffffc020b62a:	89ae                	mv	s3,a1
ffffffffc020b62c:	8932                	mv	s2,a2
ffffffffc020b62e:	fff7841b          	addiw	s0,a5,-1
ffffffffc020b632:	2a81                	sext.w	s5,s5
ffffffffc020b634:	0516f163          	bgeu	a3,a7,ffffffffc020b676 <printnum+0x6a>
ffffffffc020b638:	8a42                	mv	s4,a6
ffffffffc020b63a:	00805863          	blez	s0,ffffffffc020b64a <printnum+0x3e>
ffffffffc020b63e:	347d                	addiw	s0,s0,-1
ffffffffc020b640:	864e                	mv	a2,s3
ffffffffc020b642:	85ca                	mv	a1,s2
ffffffffc020b644:	8552                	mv	a0,s4
ffffffffc020b646:	9482                	jalr	s1
ffffffffc020b648:	f87d                	bnez	s0,ffffffffc020b63e <printnum+0x32>
ffffffffc020b64a:	1a82                	slli	s5,s5,0x20
ffffffffc020b64c:	00004797          	auipc	a5,0x4
ffffffffc020b650:	43c78793          	addi	a5,a5,1084 # ffffffffc020fa88 <sfs_node_fileops+0x118>
ffffffffc020b654:	020ada93          	srli	s5,s5,0x20
ffffffffc020b658:	9abe                	add	s5,s5,a5
ffffffffc020b65a:	7442                	ld	s0,48(sp)
ffffffffc020b65c:	000ac503          	lbu	a0,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020b660:	70e2                	ld	ra,56(sp)
ffffffffc020b662:	6a42                	ld	s4,16(sp)
ffffffffc020b664:	6aa2                	ld	s5,8(sp)
ffffffffc020b666:	864e                	mv	a2,s3
ffffffffc020b668:	85ca                	mv	a1,s2
ffffffffc020b66a:	69e2                	ld	s3,24(sp)
ffffffffc020b66c:	7902                	ld	s2,32(sp)
ffffffffc020b66e:	87a6                	mv	a5,s1
ffffffffc020b670:	74a2                	ld	s1,40(sp)
ffffffffc020b672:	6121                	addi	sp,sp,64
ffffffffc020b674:	8782                	jr	a5
ffffffffc020b676:	0316d6b3          	divu	a3,a3,a7
ffffffffc020b67a:	87a2                	mv	a5,s0
ffffffffc020b67c:	f91ff0ef          	jal	ra,ffffffffc020b60c <printnum>
ffffffffc020b680:	b7e9                	j	ffffffffc020b64a <printnum+0x3e>

ffffffffc020b682 <sprintputch>:
ffffffffc020b682:	499c                	lw	a5,16(a1)
ffffffffc020b684:	6198                	ld	a4,0(a1)
ffffffffc020b686:	6594                	ld	a3,8(a1)
ffffffffc020b688:	2785                	addiw	a5,a5,1
ffffffffc020b68a:	c99c                	sw	a5,16(a1)
ffffffffc020b68c:	00d77763          	bgeu	a4,a3,ffffffffc020b69a <sprintputch+0x18>
ffffffffc020b690:	00170793          	addi	a5,a4,1
ffffffffc020b694:	e19c                	sd	a5,0(a1)
ffffffffc020b696:	00a70023          	sb	a0,0(a4)
ffffffffc020b69a:	8082                	ret

ffffffffc020b69c <vprintfmt>:
ffffffffc020b69c:	7119                	addi	sp,sp,-128
ffffffffc020b69e:	f4a6                	sd	s1,104(sp)
ffffffffc020b6a0:	f0ca                	sd	s2,96(sp)
ffffffffc020b6a2:	ecce                	sd	s3,88(sp)
ffffffffc020b6a4:	e8d2                	sd	s4,80(sp)
ffffffffc020b6a6:	e4d6                	sd	s5,72(sp)
ffffffffc020b6a8:	e0da                	sd	s6,64(sp)
ffffffffc020b6aa:	fc5e                	sd	s7,56(sp)
ffffffffc020b6ac:	ec6e                	sd	s11,24(sp)
ffffffffc020b6ae:	fc86                	sd	ra,120(sp)
ffffffffc020b6b0:	f8a2                	sd	s0,112(sp)
ffffffffc020b6b2:	f862                	sd	s8,48(sp)
ffffffffc020b6b4:	f466                	sd	s9,40(sp)
ffffffffc020b6b6:	f06a                	sd	s10,32(sp)
ffffffffc020b6b8:	89aa                	mv	s3,a0
ffffffffc020b6ba:	892e                	mv	s2,a1
ffffffffc020b6bc:	84b2                	mv	s1,a2
ffffffffc020b6be:	8db6                	mv	s11,a3
ffffffffc020b6c0:	8aba                	mv	s5,a4
ffffffffc020b6c2:	02500a13          	li	s4,37
ffffffffc020b6c6:	5bfd                	li	s7,-1
ffffffffc020b6c8:	00004b17          	auipc	s6,0x4
ffffffffc020b6cc:	3ecb0b13          	addi	s6,s6,1004 # ffffffffc020fab4 <sfs_node_fileops+0x144>
ffffffffc020b6d0:	000dc503          	lbu	a0,0(s11) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020b6d4:	001d8413          	addi	s0,s11,1
ffffffffc020b6d8:	01450b63          	beq	a0,s4,ffffffffc020b6ee <vprintfmt+0x52>
ffffffffc020b6dc:	c129                	beqz	a0,ffffffffc020b71e <vprintfmt+0x82>
ffffffffc020b6de:	864a                	mv	a2,s2
ffffffffc020b6e0:	85a6                	mv	a1,s1
ffffffffc020b6e2:	0405                	addi	s0,s0,1
ffffffffc020b6e4:	9982                	jalr	s3
ffffffffc020b6e6:	fff44503          	lbu	a0,-1(s0)
ffffffffc020b6ea:	ff4519e3          	bne	a0,s4,ffffffffc020b6dc <vprintfmt+0x40>
ffffffffc020b6ee:	00044583          	lbu	a1,0(s0)
ffffffffc020b6f2:	02000813          	li	a6,32
ffffffffc020b6f6:	4d01                	li	s10,0
ffffffffc020b6f8:	4301                	li	t1,0
ffffffffc020b6fa:	5cfd                	li	s9,-1
ffffffffc020b6fc:	5c7d                	li	s8,-1
ffffffffc020b6fe:	05500513          	li	a0,85
ffffffffc020b702:	48a5                	li	a7,9
ffffffffc020b704:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b708:	0ff67613          	zext.b	a2,a2
ffffffffc020b70c:	00140d93          	addi	s11,s0,1
ffffffffc020b710:	04c56263          	bltu	a0,a2,ffffffffc020b754 <vprintfmt+0xb8>
ffffffffc020b714:	060a                	slli	a2,a2,0x2
ffffffffc020b716:	965a                	add	a2,a2,s6
ffffffffc020b718:	4214                	lw	a3,0(a2)
ffffffffc020b71a:	96da                	add	a3,a3,s6
ffffffffc020b71c:	8682                	jr	a3
ffffffffc020b71e:	70e6                	ld	ra,120(sp)
ffffffffc020b720:	7446                	ld	s0,112(sp)
ffffffffc020b722:	74a6                	ld	s1,104(sp)
ffffffffc020b724:	7906                	ld	s2,96(sp)
ffffffffc020b726:	69e6                	ld	s3,88(sp)
ffffffffc020b728:	6a46                	ld	s4,80(sp)
ffffffffc020b72a:	6aa6                	ld	s5,72(sp)
ffffffffc020b72c:	6b06                	ld	s6,64(sp)
ffffffffc020b72e:	7be2                	ld	s7,56(sp)
ffffffffc020b730:	7c42                	ld	s8,48(sp)
ffffffffc020b732:	7ca2                	ld	s9,40(sp)
ffffffffc020b734:	7d02                	ld	s10,32(sp)
ffffffffc020b736:	6de2                	ld	s11,24(sp)
ffffffffc020b738:	6109                	addi	sp,sp,128
ffffffffc020b73a:	8082                	ret
ffffffffc020b73c:	882e                	mv	a6,a1
ffffffffc020b73e:	00144583          	lbu	a1,1(s0)
ffffffffc020b742:	846e                	mv	s0,s11
ffffffffc020b744:	00140d93          	addi	s11,s0,1
ffffffffc020b748:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b74c:	0ff67613          	zext.b	a2,a2
ffffffffc020b750:	fcc572e3          	bgeu	a0,a2,ffffffffc020b714 <vprintfmt+0x78>
ffffffffc020b754:	864a                	mv	a2,s2
ffffffffc020b756:	85a6                	mv	a1,s1
ffffffffc020b758:	02500513          	li	a0,37
ffffffffc020b75c:	9982                	jalr	s3
ffffffffc020b75e:	fff44783          	lbu	a5,-1(s0)
ffffffffc020b762:	8da2                	mv	s11,s0
ffffffffc020b764:	f74786e3          	beq	a5,s4,ffffffffc020b6d0 <vprintfmt+0x34>
ffffffffc020b768:	ffedc783          	lbu	a5,-2(s11)
ffffffffc020b76c:	1dfd                	addi	s11,s11,-1
ffffffffc020b76e:	ff479de3          	bne	a5,s4,ffffffffc020b768 <vprintfmt+0xcc>
ffffffffc020b772:	bfb9                	j	ffffffffc020b6d0 <vprintfmt+0x34>
ffffffffc020b774:	fd058c9b          	addiw	s9,a1,-48
ffffffffc020b778:	00144583          	lbu	a1,1(s0)
ffffffffc020b77c:	846e                	mv	s0,s11
ffffffffc020b77e:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b782:	0005861b          	sext.w	a2,a1
ffffffffc020b786:	02d8e463          	bltu	a7,a3,ffffffffc020b7ae <vprintfmt+0x112>
ffffffffc020b78a:	00144583          	lbu	a1,1(s0)
ffffffffc020b78e:	002c969b          	slliw	a3,s9,0x2
ffffffffc020b792:	0196873b          	addw	a4,a3,s9
ffffffffc020b796:	0017171b          	slliw	a4,a4,0x1
ffffffffc020b79a:	9f31                	addw	a4,a4,a2
ffffffffc020b79c:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b7a0:	0405                	addi	s0,s0,1
ffffffffc020b7a2:	fd070c9b          	addiw	s9,a4,-48
ffffffffc020b7a6:	0005861b          	sext.w	a2,a1
ffffffffc020b7aa:	fed8f0e3          	bgeu	a7,a3,ffffffffc020b78a <vprintfmt+0xee>
ffffffffc020b7ae:	f40c5be3          	bgez	s8,ffffffffc020b704 <vprintfmt+0x68>
ffffffffc020b7b2:	8c66                	mv	s8,s9
ffffffffc020b7b4:	5cfd                	li	s9,-1
ffffffffc020b7b6:	b7b9                	j	ffffffffc020b704 <vprintfmt+0x68>
ffffffffc020b7b8:	fffc4693          	not	a3,s8
ffffffffc020b7bc:	96fd                	srai	a3,a3,0x3f
ffffffffc020b7be:	00dc77b3          	and	a5,s8,a3
ffffffffc020b7c2:	00144583          	lbu	a1,1(s0)
ffffffffc020b7c6:	00078c1b          	sext.w	s8,a5
ffffffffc020b7ca:	846e                	mv	s0,s11
ffffffffc020b7cc:	bf25                	j	ffffffffc020b704 <vprintfmt+0x68>
ffffffffc020b7ce:	000aac83          	lw	s9,0(s5)
ffffffffc020b7d2:	00144583          	lbu	a1,1(s0)
ffffffffc020b7d6:	0aa1                	addi	s5,s5,8
ffffffffc020b7d8:	846e                	mv	s0,s11
ffffffffc020b7da:	bfd1                	j	ffffffffc020b7ae <vprintfmt+0x112>
ffffffffc020b7dc:	4705                	li	a4,1
ffffffffc020b7de:	008a8613          	addi	a2,s5,8
ffffffffc020b7e2:	00674463          	blt	a4,t1,ffffffffc020b7ea <vprintfmt+0x14e>
ffffffffc020b7e6:	1c030c63          	beqz	t1,ffffffffc020b9be <vprintfmt+0x322>
ffffffffc020b7ea:	000ab683          	ld	a3,0(s5)
ffffffffc020b7ee:	4741                	li	a4,16
ffffffffc020b7f0:	8ab2                	mv	s5,a2
ffffffffc020b7f2:	2801                	sext.w	a6,a6
ffffffffc020b7f4:	87e2                	mv	a5,s8
ffffffffc020b7f6:	8626                	mv	a2,s1
ffffffffc020b7f8:	85ca                	mv	a1,s2
ffffffffc020b7fa:	854e                	mv	a0,s3
ffffffffc020b7fc:	e11ff0ef          	jal	ra,ffffffffc020b60c <printnum>
ffffffffc020b800:	bdc1                	j	ffffffffc020b6d0 <vprintfmt+0x34>
ffffffffc020b802:	000aa503          	lw	a0,0(s5)
ffffffffc020b806:	864a                	mv	a2,s2
ffffffffc020b808:	85a6                	mv	a1,s1
ffffffffc020b80a:	0aa1                	addi	s5,s5,8
ffffffffc020b80c:	9982                	jalr	s3
ffffffffc020b80e:	b5c9                	j	ffffffffc020b6d0 <vprintfmt+0x34>
ffffffffc020b810:	4705                	li	a4,1
ffffffffc020b812:	008a8613          	addi	a2,s5,8
ffffffffc020b816:	00674463          	blt	a4,t1,ffffffffc020b81e <vprintfmt+0x182>
ffffffffc020b81a:	18030d63          	beqz	t1,ffffffffc020b9b4 <vprintfmt+0x318>
ffffffffc020b81e:	000ab683          	ld	a3,0(s5)
ffffffffc020b822:	4729                	li	a4,10
ffffffffc020b824:	8ab2                	mv	s5,a2
ffffffffc020b826:	b7f1                	j	ffffffffc020b7f2 <vprintfmt+0x156>
ffffffffc020b828:	00144583          	lbu	a1,1(s0)
ffffffffc020b82c:	4d05                	li	s10,1
ffffffffc020b82e:	846e                	mv	s0,s11
ffffffffc020b830:	bdd1                	j	ffffffffc020b704 <vprintfmt+0x68>
ffffffffc020b832:	864a                	mv	a2,s2
ffffffffc020b834:	85a6                	mv	a1,s1
ffffffffc020b836:	02500513          	li	a0,37
ffffffffc020b83a:	9982                	jalr	s3
ffffffffc020b83c:	bd51                	j	ffffffffc020b6d0 <vprintfmt+0x34>
ffffffffc020b83e:	00144583          	lbu	a1,1(s0)
ffffffffc020b842:	2305                	addiw	t1,t1,1
ffffffffc020b844:	846e                	mv	s0,s11
ffffffffc020b846:	bd7d                	j	ffffffffc020b704 <vprintfmt+0x68>
ffffffffc020b848:	4705                	li	a4,1
ffffffffc020b84a:	008a8613          	addi	a2,s5,8
ffffffffc020b84e:	00674463          	blt	a4,t1,ffffffffc020b856 <vprintfmt+0x1ba>
ffffffffc020b852:	14030c63          	beqz	t1,ffffffffc020b9aa <vprintfmt+0x30e>
ffffffffc020b856:	000ab683          	ld	a3,0(s5)
ffffffffc020b85a:	4721                	li	a4,8
ffffffffc020b85c:	8ab2                	mv	s5,a2
ffffffffc020b85e:	bf51                	j	ffffffffc020b7f2 <vprintfmt+0x156>
ffffffffc020b860:	03000513          	li	a0,48
ffffffffc020b864:	864a                	mv	a2,s2
ffffffffc020b866:	85a6                	mv	a1,s1
ffffffffc020b868:	e042                	sd	a6,0(sp)
ffffffffc020b86a:	9982                	jalr	s3
ffffffffc020b86c:	864a                	mv	a2,s2
ffffffffc020b86e:	85a6                	mv	a1,s1
ffffffffc020b870:	07800513          	li	a0,120
ffffffffc020b874:	9982                	jalr	s3
ffffffffc020b876:	0aa1                	addi	s5,s5,8
ffffffffc020b878:	6802                	ld	a6,0(sp)
ffffffffc020b87a:	4741                	li	a4,16
ffffffffc020b87c:	ff8ab683          	ld	a3,-8(s5)
ffffffffc020b880:	bf8d                	j	ffffffffc020b7f2 <vprintfmt+0x156>
ffffffffc020b882:	000ab403          	ld	s0,0(s5)
ffffffffc020b886:	008a8793          	addi	a5,s5,8
ffffffffc020b88a:	e03e                	sd	a5,0(sp)
ffffffffc020b88c:	14040c63          	beqz	s0,ffffffffc020b9e4 <vprintfmt+0x348>
ffffffffc020b890:	11805063          	blez	s8,ffffffffc020b990 <vprintfmt+0x2f4>
ffffffffc020b894:	02d00693          	li	a3,45
ffffffffc020b898:	0cd81963          	bne	a6,a3,ffffffffc020b96a <vprintfmt+0x2ce>
ffffffffc020b89c:	00044683          	lbu	a3,0(s0)
ffffffffc020b8a0:	0006851b          	sext.w	a0,a3
ffffffffc020b8a4:	ce8d                	beqz	a3,ffffffffc020b8de <vprintfmt+0x242>
ffffffffc020b8a6:	00140a93          	addi	s5,s0,1
ffffffffc020b8aa:	05e00413          	li	s0,94
ffffffffc020b8ae:	000cc563          	bltz	s9,ffffffffc020b8b8 <vprintfmt+0x21c>
ffffffffc020b8b2:	3cfd                	addiw	s9,s9,-1
ffffffffc020b8b4:	037c8363          	beq	s9,s7,ffffffffc020b8da <vprintfmt+0x23e>
ffffffffc020b8b8:	864a                	mv	a2,s2
ffffffffc020b8ba:	85a6                	mv	a1,s1
ffffffffc020b8bc:	100d0663          	beqz	s10,ffffffffc020b9c8 <vprintfmt+0x32c>
ffffffffc020b8c0:	3681                	addiw	a3,a3,-32
ffffffffc020b8c2:	10d47363          	bgeu	s0,a3,ffffffffc020b9c8 <vprintfmt+0x32c>
ffffffffc020b8c6:	03f00513          	li	a0,63
ffffffffc020b8ca:	9982                	jalr	s3
ffffffffc020b8cc:	000ac683          	lbu	a3,0(s5)
ffffffffc020b8d0:	3c7d                	addiw	s8,s8,-1
ffffffffc020b8d2:	0a85                	addi	s5,s5,1
ffffffffc020b8d4:	0006851b          	sext.w	a0,a3
ffffffffc020b8d8:	faf9                	bnez	a3,ffffffffc020b8ae <vprintfmt+0x212>
ffffffffc020b8da:	01805a63          	blez	s8,ffffffffc020b8ee <vprintfmt+0x252>
ffffffffc020b8de:	3c7d                	addiw	s8,s8,-1
ffffffffc020b8e0:	864a                	mv	a2,s2
ffffffffc020b8e2:	85a6                	mv	a1,s1
ffffffffc020b8e4:	02000513          	li	a0,32
ffffffffc020b8e8:	9982                	jalr	s3
ffffffffc020b8ea:	fe0c1ae3          	bnez	s8,ffffffffc020b8de <vprintfmt+0x242>
ffffffffc020b8ee:	6a82                	ld	s5,0(sp)
ffffffffc020b8f0:	b3c5                	j	ffffffffc020b6d0 <vprintfmt+0x34>
ffffffffc020b8f2:	4705                	li	a4,1
ffffffffc020b8f4:	008a8d13          	addi	s10,s5,8
ffffffffc020b8f8:	00674463          	blt	a4,t1,ffffffffc020b900 <vprintfmt+0x264>
ffffffffc020b8fc:	0a030463          	beqz	t1,ffffffffc020b9a4 <vprintfmt+0x308>
ffffffffc020b900:	000ab403          	ld	s0,0(s5)
ffffffffc020b904:	0c044463          	bltz	s0,ffffffffc020b9cc <vprintfmt+0x330>
ffffffffc020b908:	86a2                	mv	a3,s0
ffffffffc020b90a:	8aea                	mv	s5,s10
ffffffffc020b90c:	4729                	li	a4,10
ffffffffc020b90e:	b5d5                	j	ffffffffc020b7f2 <vprintfmt+0x156>
ffffffffc020b910:	000aa783          	lw	a5,0(s5)
ffffffffc020b914:	46e1                	li	a3,24
ffffffffc020b916:	0aa1                	addi	s5,s5,8
ffffffffc020b918:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc020b91c:	8fb9                	xor	a5,a5,a4
ffffffffc020b91e:	40e7873b          	subw	a4,a5,a4
ffffffffc020b922:	02e6c663          	blt	a3,a4,ffffffffc020b94e <vprintfmt+0x2b2>
ffffffffc020b926:	00371793          	slli	a5,a4,0x3
ffffffffc020b92a:	00004697          	auipc	a3,0x4
ffffffffc020b92e:	4be68693          	addi	a3,a3,1214 # ffffffffc020fde8 <error_string>
ffffffffc020b932:	97b6                	add	a5,a5,a3
ffffffffc020b934:	639c                	ld	a5,0(a5)
ffffffffc020b936:	cf81                	beqz	a5,ffffffffc020b94e <vprintfmt+0x2b2>
ffffffffc020b938:	873e                	mv	a4,a5
ffffffffc020b93a:	00000697          	auipc	a3,0x0
ffffffffc020b93e:	28668693          	addi	a3,a3,646 # ffffffffc020bbc0 <etext+0x2c>
ffffffffc020b942:	8626                	mv	a2,s1
ffffffffc020b944:	85ca                	mv	a1,s2
ffffffffc020b946:	854e                	mv	a0,s3
ffffffffc020b948:	0d4000ef          	jal	ra,ffffffffc020ba1c <printfmt>
ffffffffc020b94c:	b351                	j	ffffffffc020b6d0 <vprintfmt+0x34>
ffffffffc020b94e:	00004697          	auipc	a3,0x4
ffffffffc020b952:	15a68693          	addi	a3,a3,346 # ffffffffc020faa8 <sfs_node_fileops+0x138>
ffffffffc020b956:	8626                	mv	a2,s1
ffffffffc020b958:	85ca                	mv	a1,s2
ffffffffc020b95a:	854e                	mv	a0,s3
ffffffffc020b95c:	0c0000ef          	jal	ra,ffffffffc020ba1c <printfmt>
ffffffffc020b960:	bb85                	j	ffffffffc020b6d0 <vprintfmt+0x34>
ffffffffc020b962:	00004417          	auipc	s0,0x4
ffffffffc020b966:	13e40413          	addi	s0,s0,318 # ffffffffc020faa0 <sfs_node_fileops+0x130>
ffffffffc020b96a:	85e6                	mv	a1,s9
ffffffffc020b96c:	8522                	mv	a0,s0
ffffffffc020b96e:	e442                	sd	a6,8(sp)
ffffffffc020b970:	132000ef          	jal	ra,ffffffffc020baa2 <strnlen>
ffffffffc020b974:	40ac0c3b          	subw	s8,s8,a0
ffffffffc020b978:	01805c63          	blez	s8,ffffffffc020b990 <vprintfmt+0x2f4>
ffffffffc020b97c:	6822                	ld	a6,8(sp)
ffffffffc020b97e:	00080a9b          	sext.w	s5,a6
ffffffffc020b982:	3c7d                	addiw	s8,s8,-1
ffffffffc020b984:	864a                	mv	a2,s2
ffffffffc020b986:	85a6                	mv	a1,s1
ffffffffc020b988:	8556                	mv	a0,s5
ffffffffc020b98a:	9982                	jalr	s3
ffffffffc020b98c:	fe0c1be3          	bnez	s8,ffffffffc020b982 <vprintfmt+0x2e6>
ffffffffc020b990:	00044683          	lbu	a3,0(s0)
ffffffffc020b994:	00140a93          	addi	s5,s0,1
ffffffffc020b998:	0006851b          	sext.w	a0,a3
ffffffffc020b99c:	daa9                	beqz	a3,ffffffffc020b8ee <vprintfmt+0x252>
ffffffffc020b99e:	05e00413          	li	s0,94
ffffffffc020b9a2:	b731                	j	ffffffffc020b8ae <vprintfmt+0x212>
ffffffffc020b9a4:	000aa403          	lw	s0,0(s5)
ffffffffc020b9a8:	bfb1                	j	ffffffffc020b904 <vprintfmt+0x268>
ffffffffc020b9aa:	000ae683          	lwu	a3,0(s5)
ffffffffc020b9ae:	4721                	li	a4,8
ffffffffc020b9b0:	8ab2                	mv	s5,a2
ffffffffc020b9b2:	b581                	j	ffffffffc020b7f2 <vprintfmt+0x156>
ffffffffc020b9b4:	000ae683          	lwu	a3,0(s5)
ffffffffc020b9b8:	4729                	li	a4,10
ffffffffc020b9ba:	8ab2                	mv	s5,a2
ffffffffc020b9bc:	bd1d                	j	ffffffffc020b7f2 <vprintfmt+0x156>
ffffffffc020b9be:	000ae683          	lwu	a3,0(s5)
ffffffffc020b9c2:	4741                	li	a4,16
ffffffffc020b9c4:	8ab2                	mv	s5,a2
ffffffffc020b9c6:	b535                	j	ffffffffc020b7f2 <vprintfmt+0x156>
ffffffffc020b9c8:	9982                	jalr	s3
ffffffffc020b9ca:	b709                	j	ffffffffc020b8cc <vprintfmt+0x230>
ffffffffc020b9cc:	864a                	mv	a2,s2
ffffffffc020b9ce:	85a6                	mv	a1,s1
ffffffffc020b9d0:	02d00513          	li	a0,45
ffffffffc020b9d4:	e042                	sd	a6,0(sp)
ffffffffc020b9d6:	9982                	jalr	s3
ffffffffc020b9d8:	6802                	ld	a6,0(sp)
ffffffffc020b9da:	8aea                	mv	s5,s10
ffffffffc020b9dc:	408006b3          	neg	a3,s0
ffffffffc020b9e0:	4729                	li	a4,10
ffffffffc020b9e2:	bd01                	j	ffffffffc020b7f2 <vprintfmt+0x156>
ffffffffc020b9e4:	03805163          	blez	s8,ffffffffc020ba06 <vprintfmt+0x36a>
ffffffffc020b9e8:	02d00693          	li	a3,45
ffffffffc020b9ec:	f6d81be3          	bne	a6,a3,ffffffffc020b962 <vprintfmt+0x2c6>
ffffffffc020b9f0:	00004417          	auipc	s0,0x4
ffffffffc020b9f4:	0b040413          	addi	s0,s0,176 # ffffffffc020faa0 <sfs_node_fileops+0x130>
ffffffffc020b9f8:	02800693          	li	a3,40
ffffffffc020b9fc:	02800513          	li	a0,40
ffffffffc020ba00:	00140a93          	addi	s5,s0,1
ffffffffc020ba04:	b55d                	j	ffffffffc020b8aa <vprintfmt+0x20e>
ffffffffc020ba06:	00004a97          	auipc	s5,0x4
ffffffffc020ba0a:	09ba8a93          	addi	s5,s5,155 # ffffffffc020faa1 <sfs_node_fileops+0x131>
ffffffffc020ba0e:	02800513          	li	a0,40
ffffffffc020ba12:	02800693          	li	a3,40
ffffffffc020ba16:	05e00413          	li	s0,94
ffffffffc020ba1a:	bd51                	j	ffffffffc020b8ae <vprintfmt+0x212>

ffffffffc020ba1c <printfmt>:
ffffffffc020ba1c:	7139                	addi	sp,sp,-64
ffffffffc020ba1e:	02010313          	addi	t1,sp,32
ffffffffc020ba22:	f03a                	sd	a4,32(sp)
ffffffffc020ba24:	871a                	mv	a4,t1
ffffffffc020ba26:	ec06                	sd	ra,24(sp)
ffffffffc020ba28:	f43e                	sd	a5,40(sp)
ffffffffc020ba2a:	f842                	sd	a6,48(sp)
ffffffffc020ba2c:	fc46                	sd	a7,56(sp)
ffffffffc020ba2e:	e41a                	sd	t1,8(sp)
ffffffffc020ba30:	c6dff0ef          	jal	ra,ffffffffc020b69c <vprintfmt>
ffffffffc020ba34:	60e2                	ld	ra,24(sp)
ffffffffc020ba36:	6121                	addi	sp,sp,64
ffffffffc020ba38:	8082                	ret

ffffffffc020ba3a <snprintf>:
ffffffffc020ba3a:	711d                	addi	sp,sp,-96
ffffffffc020ba3c:	15fd                	addi	a1,a1,-1
ffffffffc020ba3e:	03810313          	addi	t1,sp,56
ffffffffc020ba42:	95aa                	add	a1,a1,a0
ffffffffc020ba44:	f406                	sd	ra,40(sp)
ffffffffc020ba46:	fc36                	sd	a3,56(sp)
ffffffffc020ba48:	e0ba                	sd	a4,64(sp)
ffffffffc020ba4a:	e4be                	sd	a5,72(sp)
ffffffffc020ba4c:	e8c2                	sd	a6,80(sp)
ffffffffc020ba4e:	ecc6                	sd	a7,88(sp)
ffffffffc020ba50:	e01a                	sd	t1,0(sp)
ffffffffc020ba52:	e42a                	sd	a0,8(sp)
ffffffffc020ba54:	e82e                	sd	a1,16(sp)
ffffffffc020ba56:	cc02                	sw	zero,24(sp)
ffffffffc020ba58:	c515                	beqz	a0,ffffffffc020ba84 <snprintf+0x4a>
ffffffffc020ba5a:	02a5e563          	bltu	a1,a0,ffffffffc020ba84 <snprintf+0x4a>
ffffffffc020ba5e:	75dd                	lui	a1,0xffff7
ffffffffc020ba60:	86b2                	mv	a3,a2
ffffffffc020ba62:	00000517          	auipc	a0,0x0
ffffffffc020ba66:	c2050513          	addi	a0,a0,-992 # ffffffffc020b682 <sprintputch>
ffffffffc020ba6a:	871a                	mv	a4,t1
ffffffffc020ba6c:	0030                	addi	a2,sp,8
ffffffffc020ba6e:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd60199>
ffffffffc020ba72:	c2bff0ef          	jal	ra,ffffffffc020b69c <vprintfmt>
ffffffffc020ba76:	67a2                	ld	a5,8(sp)
ffffffffc020ba78:	00078023          	sb	zero,0(a5)
ffffffffc020ba7c:	4562                	lw	a0,24(sp)
ffffffffc020ba7e:	70a2                	ld	ra,40(sp)
ffffffffc020ba80:	6125                	addi	sp,sp,96
ffffffffc020ba82:	8082                	ret
ffffffffc020ba84:	5575                	li	a0,-3
ffffffffc020ba86:	bfe5                	j	ffffffffc020ba7e <snprintf+0x44>

ffffffffc020ba88 <strlen>:
ffffffffc020ba88:	00054783          	lbu	a5,0(a0)
ffffffffc020ba8c:	872a                	mv	a4,a0
ffffffffc020ba8e:	4501                	li	a0,0
ffffffffc020ba90:	cb81                	beqz	a5,ffffffffc020baa0 <strlen+0x18>
ffffffffc020ba92:	0505                	addi	a0,a0,1
ffffffffc020ba94:	00a707b3          	add	a5,a4,a0
ffffffffc020ba98:	0007c783          	lbu	a5,0(a5)
ffffffffc020ba9c:	fbfd                	bnez	a5,ffffffffc020ba92 <strlen+0xa>
ffffffffc020ba9e:	8082                	ret
ffffffffc020baa0:	8082                	ret

ffffffffc020baa2 <strnlen>:
ffffffffc020baa2:	4781                	li	a5,0
ffffffffc020baa4:	e589                	bnez	a1,ffffffffc020baae <strnlen+0xc>
ffffffffc020baa6:	a811                	j	ffffffffc020baba <strnlen+0x18>
ffffffffc020baa8:	0785                	addi	a5,a5,1
ffffffffc020baaa:	00f58863          	beq	a1,a5,ffffffffc020baba <strnlen+0x18>
ffffffffc020baae:	00f50733          	add	a4,a0,a5
ffffffffc020bab2:	00074703          	lbu	a4,0(a4)
ffffffffc020bab6:	fb6d                	bnez	a4,ffffffffc020baa8 <strnlen+0x6>
ffffffffc020bab8:	85be                	mv	a1,a5
ffffffffc020baba:	852e                	mv	a0,a1
ffffffffc020babc:	8082                	ret

ffffffffc020babe <strcpy>:
ffffffffc020babe:	87aa                	mv	a5,a0
ffffffffc020bac0:	0005c703          	lbu	a4,0(a1)
ffffffffc020bac4:	0785                	addi	a5,a5,1
ffffffffc020bac6:	0585                	addi	a1,a1,1
ffffffffc020bac8:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020bacc:	fb75                	bnez	a4,ffffffffc020bac0 <strcpy+0x2>
ffffffffc020bace:	8082                	ret

ffffffffc020bad0 <strcmp>:
ffffffffc020bad0:	00054783          	lbu	a5,0(a0)
ffffffffc020bad4:	0005c703          	lbu	a4,0(a1)
ffffffffc020bad8:	cb89                	beqz	a5,ffffffffc020baea <strcmp+0x1a>
ffffffffc020bada:	0505                	addi	a0,a0,1
ffffffffc020badc:	0585                	addi	a1,a1,1
ffffffffc020bade:	fee789e3          	beq	a5,a4,ffffffffc020bad0 <strcmp>
ffffffffc020bae2:	0007851b          	sext.w	a0,a5
ffffffffc020bae6:	9d19                	subw	a0,a0,a4
ffffffffc020bae8:	8082                	ret
ffffffffc020baea:	4501                	li	a0,0
ffffffffc020baec:	bfed                	j	ffffffffc020bae6 <strcmp+0x16>

ffffffffc020baee <strncmp>:
ffffffffc020baee:	c20d                	beqz	a2,ffffffffc020bb10 <strncmp+0x22>
ffffffffc020baf0:	962e                	add	a2,a2,a1
ffffffffc020baf2:	a031                	j	ffffffffc020bafe <strncmp+0x10>
ffffffffc020baf4:	0505                	addi	a0,a0,1
ffffffffc020baf6:	00e79a63          	bne	a5,a4,ffffffffc020bb0a <strncmp+0x1c>
ffffffffc020bafa:	00b60b63          	beq	a2,a1,ffffffffc020bb10 <strncmp+0x22>
ffffffffc020bafe:	00054783          	lbu	a5,0(a0)
ffffffffc020bb02:	0585                	addi	a1,a1,1
ffffffffc020bb04:	fff5c703          	lbu	a4,-1(a1)
ffffffffc020bb08:	f7f5                	bnez	a5,ffffffffc020baf4 <strncmp+0x6>
ffffffffc020bb0a:	40e7853b          	subw	a0,a5,a4
ffffffffc020bb0e:	8082                	ret
ffffffffc020bb10:	4501                	li	a0,0
ffffffffc020bb12:	8082                	ret

ffffffffc020bb14 <strchr>:
ffffffffc020bb14:	00054783          	lbu	a5,0(a0)
ffffffffc020bb18:	c799                	beqz	a5,ffffffffc020bb26 <strchr+0x12>
ffffffffc020bb1a:	00f58763          	beq	a1,a5,ffffffffc020bb28 <strchr+0x14>
ffffffffc020bb1e:	00154783          	lbu	a5,1(a0)
ffffffffc020bb22:	0505                	addi	a0,a0,1
ffffffffc020bb24:	fbfd                	bnez	a5,ffffffffc020bb1a <strchr+0x6>
ffffffffc020bb26:	4501                	li	a0,0
ffffffffc020bb28:	8082                	ret

ffffffffc020bb2a <memset>:
ffffffffc020bb2a:	ca01                	beqz	a2,ffffffffc020bb3a <memset+0x10>
ffffffffc020bb2c:	962a                	add	a2,a2,a0
ffffffffc020bb2e:	87aa                	mv	a5,a0
ffffffffc020bb30:	0785                	addi	a5,a5,1
ffffffffc020bb32:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020bb36:	fec79de3          	bne	a5,a2,ffffffffc020bb30 <memset+0x6>
ffffffffc020bb3a:	8082                	ret

ffffffffc020bb3c <memmove>:
ffffffffc020bb3c:	02a5f263          	bgeu	a1,a0,ffffffffc020bb60 <memmove+0x24>
ffffffffc020bb40:	00c587b3          	add	a5,a1,a2
ffffffffc020bb44:	00f57e63          	bgeu	a0,a5,ffffffffc020bb60 <memmove+0x24>
ffffffffc020bb48:	00c50733          	add	a4,a0,a2
ffffffffc020bb4c:	c615                	beqz	a2,ffffffffc020bb78 <memmove+0x3c>
ffffffffc020bb4e:	fff7c683          	lbu	a3,-1(a5)
ffffffffc020bb52:	17fd                	addi	a5,a5,-1
ffffffffc020bb54:	177d                	addi	a4,a4,-1
ffffffffc020bb56:	00d70023          	sb	a3,0(a4)
ffffffffc020bb5a:	fef59ae3          	bne	a1,a5,ffffffffc020bb4e <memmove+0x12>
ffffffffc020bb5e:	8082                	ret
ffffffffc020bb60:	00c586b3          	add	a3,a1,a2
ffffffffc020bb64:	87aa                	mv	a5,a0
ffffffffc020bb66:	ca11                	beqz	a2,ffffffffc020bb7a <memmove+0x3e>
ffffffffc020bb68:	0005c703          	lbu	a4,0(a1)
ffffffffc020bb6c:	0585                	addi	a1,a1,1
ffffffffc020bb6e:	0785                	addi	a5,a5,1
ffffffffc020bb70:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020bb74:	fed59ae3          	bne	a1,a3,ffffffffc020bb68 <memmove+0x2c>
ffffffffc020bb78:	8082                	ret
ffffffffc020bb7a:	8082                	ret

ffffffffc020bb7c <memcpy>:
ffffffffc020bb7c:	ca19                	beqz	a2,ffffffffc020bb92 <memcpy+0x16>
ffffffffc020bb7e:	962e                	add	a2,a2,a1
ffffffffc020bb80:	87aa                	mv	a5,a0
ffffffffc020bb82:	0005c703          	lbu	a4,0(a1)
ffffffffc020bb86:	0585                	addi	a1,a1,1
ffffffffc020bb88:	0785                	addi	a5,a5,1
ffffffffc020bb8a:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020bb8e:	fec59ae3          	bne	a1,a2,ffffffffc020bb82 <memcpy+0x6>
ffffffffc020bb92:	8082                	ret
