; Target assembler: cc65 v2.18.0 [--target none -C KERLT101.bin_cc65.cfg]
; 6502bench SourceGen v1.8.4
         .setcpu "65C02"
P8_READ_BLOCK =  $80        ;(3:Unit/1,Buff,BlkNum)
P8_CREATE =      $c0        ;(7:pn,acc/1,type/1,aux,stt/1,cD,cT)
P8_DESTROY =     $c1        ;(1:pn)
P8_SET_FILE_INFO = $c3      ;(7:pn,a/1,t/1,aux,nul/3,mD,mT)
P8_GET_FILE_INFO = $c4      ;(10:pn,a/1,t/1,x,s/1,b,mDTcDT)
P8_ONLINE =      $c5        ;(2:UnitNum/1,Buff)
P8_OPEN  =       $c8        ;(3:pn,ioBuff,Ref/1)
P8_READ  =       $ca        ;(4:Ref/1,Where,reqCount,xfrCount)
P8_WRITE =       $cb        ;(4:Ref/1,Where,reqCount,xfrCount)
P8_CLOSE =       $cc        ;(1:Ref/1)
P8_SET_MARK =    $ce        ;(2:Ref/1,Position/3)
P8_SET_EOF =     $d0        ;(2:Ref/1,Position/3)
P8_GET_EOF =     $d1        ;(2:Ref/1,Position/3)

MON_A3L  =       $40        ;general purpose
MON_A3H  =       $41        ;general purpose
MON_A4L  =       $42        ;general purpose
MON_A5L  =       $44        ;general purpose
MON_A5H  =       $45        ;general purpose
MON_RNDL =       $4e        ;low byte of KEYIN "random" value
MON_BRKV =       $03f0      ;address of BRK handler
MON_SOFTEVEC =   $03f2      ;address of RESET handler
MON_PWREDUP =    $03f4      ;power-up RESET checksum
MON_IRQADDR =    $03fe      ;address of IRQ handler
ACTV_PERIP_SLOT = $07f8     ;slot num ($Cn) of active peripheral card
P8_MLI   =       $bf00      ;ProDOS MLI call entry point
CLR80COL =       $c000      ;W use $C002-C005 for aux mem (80STOREOFF)
KBD      =       $c000      ;R last key pressed + 128
SET80COL =       $c001      ;W use PAGE2 for aux mem (80STOREON)
WRMAINRAM =      $c004      ;W if 80STORE off: write main mem $0200-BFFF
WRCARDRAM =      $c005      ;W if 80STORE off: write aux mem $0200-BFFF
SETSTDZP =       $c008      ;W use main stack and zero page
SETALTZP =       $c009      ;W use aux stack and zero page
KBDSTRB  =       $c010      ;RW keyboard strobe
RD80COL  =       $c018      ;R bit 7: 80STORE is on?
SETAN0   =       $c058      ;RW annunciator 0 off
SETAN1   =       $c05a      ;RW annunciator 1 off
PADDL3   =       $c067      ;R analog input 3
IWM_DRIVE_1 =    $c08a      ;IWM select drive 1
IWM_DRIVE_2 =    $c08b      ;IWM select drive 2
CLRROM   =       $cfff      ;disable slot C8 ROM
MON_INIT =       $fb2f      ;screen initialization
MON_APPLEII =    $fb60      ;clear screen and put "Apple II" into first line
MON_WAIT =       $fca8      ;delay for (26 + 27*Acc + 5*(Acc*Acc))/2 cycles
MON_SETNORM =    $fe84      ;set video mode to normal
MON_SETKBD =     $fe89      ;reset char input handler to ROM
MON_SETVID =     $fe93      ;reset char output handler to ROM
MON_BELL =       $ff3a      ;sound bell
MON_6502_IRQ =   $fffe      ;6502 IRQ vector

         .org    $1400
Entry:   jmp     Start

Storage1403:
         .byte   $1e
         .byte   $50
         .byte   $9a
         .byte   $0e
         .byte   $0f
         .byte   $52
         .byte   $0a
         .byte   $83
         .byte   $c4
L140C:   .byte   $04
L140D:   .byte   $89
L140E:   .byte   $46
L140F:   .byte   $f8
L1410:   .byte   $89
L1411:   .byte   $56
L1412:   .byte   $fa
L1413:   .byte   $0b
         .byte   $d0
         .byte   $74
         .byte   $7d
         .byte   $2b
         .byte   $f6
         .byte   $8b
         .byte   $7e
         .byte   $fe
         .byte   $eb
         .byte   $16
         .byte   $90
         .byte   $90
         .byte   $8b
         .byte   $c6
L1422:   .byte   $03
L1423:   .byte   $46
L1424:   .byte   $f8
L1425:   .byte   $8b
L1426:   .byte   $56
L1427:   .byte   $fa
L1428:   .byte   $52
L1429:   .byte   $50
L142A:   .byte   $9a
         .byte   $c0
         .byte   $03
         .byte   $a3
         .byte   $09
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $03
         .byte   $f0
         .byte   $c4
         .byte   $5e
         .byte   $f8
         .byte   $26
L1438:   .byte   $80
         .byte   $38
         .byte   $00
L143B:   .byte   $74
L143C:   .byte   $51
         .byte   $0b
         .byte   $ff
         .byte   $75
         .byte   $4d
         .byte   $8b
         .byte   $c6
         .byte   $03
         .byte   $c3
         .byte   $8c
         .byte   $c2
         .byte   $52
         .byte   $50
         .byte   $9a
         .byte   $fe
         .byte   $03
         .byte   $a3
         .byte   $09
         .byte   $83
L144F:   .byte   $c4
L1450:   .byte   $04
L1451:   .byte   $03
L1452:   .byte   $f0
L1453:   .byte   $8b
L1454:   .byte   $c6
         .byte   $03
         .byte   $46
L1457:   .byte   $f8
L1458:   .byte   $8b
L1459:   .byte   $56
         .byte   $fa
         .byte   $52
         .byte   $50
         .byte   $9a
         .byte   $c0
         .byte   $03
         .byte   $a3
         .byte   $09
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $40
         .byte   $50
         .byte   $8b
         .byte   $c6
L1469:   .byte   $03
         .byte   $46
         .byte   $f8
         .byte   $8b
         .byte   $56
         .byte   $fa
         .byte   $52
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $bf
         .byte   $ba
         .byte   $83
         .byte   $c4
         .byte   $06
         .byte   $89
         .byte   $46
         .byte   $f4
         .byte   $89
         .byte   $56
         .byte   $f6
         .byte   $52
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $f0
         .byte   $fb
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $0b
         .byte   $c0
         .byte   $75
         .byte   $95
         .byte   $bf
         .byte   $01
         .byte   $00
         .byte   $89
         .byte   $7e
         .byte   $fe
         .byte   $89
         .byte   $76
         .byte   $fc
         .byte   $a1
         .byte   $74
         .byte   $02
         .byte   $89
         .byte   $46
         .byte   $f2
         .byte   $83
         .byte   $7e
         .byte   $fe
         .byte   $00
         .byte   $75
         .byte   $56
         .byte   $c7
         .byte   $46
         .byte   $fc
         .byte   $01
         .byte   $00
         .byte   $83
         .byte   $7e
         .byte   $06
         .byte   $01
         .byte   $76
         .byte   $4b
         .byte   $8b
         .byte   $46
         .byte   $08
         .byte   $8b
         .byte   $56
         .byte   $0a
         .byte   $05
         .byte   $04
         .byte   $00
         .byte   $89
         .byte   $46
         .byte   $ee
         .byte   $89
         .byte   $56
         .byte   $f0
         .byte   $8b
         .byte   $7e
         .byte   $fe
         .byte   $8b
         .byte   $76
         .byte   $fc
         .byte   $0b
         .byte   $ff
         .byte   $75
         .byte   $2c
         .byte   $c4
         .byte   $5e
         .byte   $ee
         .byte   $26
         .byte   $8b
         .byte   $07
         .byte   $26
         .byte   $8b
         .byte   $57
         .byte   $02
         .byte   $89
         .byte   $46
         .byte   $f4
         .byte   $89
         .byte   $56
         .byte   $f6
         .byte   $52
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $9a
         .byte   $fb
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $3d
         .byte   $01
         .byte   $00
         .byte   $1b
         .byte   $c9
         .byte   $f7
         .byte   $d9
         .byte   $8b
         .byte   $f9
         .byte   $83
         .byte   $46
         .byte   $ee
         .byte   $04
         .byte   $46
         .byte   $39
         .byte   $76
         .byte   $06
         .byte   $77
         .byte   $d0
         .byte   $89
         .byte   $7e
         .byte   $fe
         .byte   $89
         .byte   $76
         .byte   $fc
         .byte   $a1
         .byte   $74
         .byte   $02
         .byte   $2b
         .byte   $46
         .byte   $f2
         .byte   $89
         .byte   $46
         .byte   $f2
         .byte   $83
         .byte   $7e
         .byte   $fe
         .byte   $00
         .byte   $75
         .byte   $08
         .byte   $3d
         .byte   $01
         .byte   $00
         .byte   $72
         .byte   $03
         .byte   $e9
         .byte   $cc
         .byte   $00
         .byte   $b8
         .byte   $a8
         .byte   $05
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $7a
         .byte   $b9
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $b8
         .byte   $db
         .byte   $05
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $6e
         .byte   $b9
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $b8
         .byte   $dd
         .byte   $05
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $62
         .byte   $b9
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $b8
         .byte   $df
         .byte   $05
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $56
         .byte   $b9
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $b8
         .byte   $28
         .byte   $06
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $4a
         .byte   $b9
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $b8
         .byte   $2a
         .byte   $06
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $3e
         .byte   $b9
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $b8
         .byte   $68
         .byte   $06
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $32
         .byte   $b9
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $b8
         .byte   $6a
         .byte   $06
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $26
L1569:   .byte   $b9
L156A:   .byte   $83
L156B:   .byte   $c4
L156C:   .byte   $04
L156D:   .byte   $b8
         .byte   $b7
         .byte   $06
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $1a
         .byte   $b9
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $b8
         .byte   $b9
         .byte   $06
         .byte   $1e
         .byte   $50
L157E:   .byte   $0e
L157F:   .byte   $e8
L1580:   .byte   $0e
L1581:   .byte   $b9
L1582:   .byte   $83
L1583:   .byte   $c4
L1584:   .byte   $04
L1585:   .byte   $b8
         .byte   $f3
         .byte   $06
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $02
         .byte   $b9
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $b8
         .byte   $f5
         .byte   $06
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $f6
         .byte   $b8
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $b8
         .byte   $34
         .byte   $07
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $ea
         .byte   $b8
         .byte   $83
         .byte   $c4
         .byte   $04
L15A9:   .byte   $83
         .byte   $7e
         .byte   $fe
         .byte   $00
         .byte   $74
         .byte   $1e
         .byte   $b8
         .byte   $36
         .byte   $07
         .byte   $1e
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $d8
         .byte   $b8
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $ff
         .byte   $76
         .byte   $f6
         .byte   $ff
         .byte   $76
         .byte   $f4
         .byte   $b8
         .byte   $bb
         .byte   $0b
         .byte   $50
         .byte   $9a
         .byte   $c8
         .byte   $04
         .byte   $45
         .byte   $09
         .byte   $83
L15CB:   .byte   $c4
         .byte   $06
         .byte   $b8
         .byte   $01
         .byte   $00
         .byte   $50
         .byte   $9a
         .byte   $ac
         .byte   $01
         .byte   $52
         .byte   $0a
         .byte   $83
         .byte   $c4
         .byte   $02
         .byte   $c7
         .byte   $46
         .byte   $fc
         .byte   $00
         .byte   $00
         .byte   $83
         .byte   $3e
         .byte   $74
         .byte   $02
         .byte   $00
         .byte   $74
         .byte   $3c
         .byte   $bf
         .byte   $64
         .byte   $02
         .byte   $8b
         .byte   $35
         .byte   $8b
         .byte   $de
         .byte   $b1
         .byte   $08
         .byte   $d3
         .byte   $eb
         .byte   $8b
         .byte   $c3
         .byte   $d1
         .byte   $e3
         .byte   $03
         .byte   $d8
         .byte   $d1
         .byte   $e3
         .byte   $8b
         .byte   $87
         .byte   $42
         .byte   $00
         .byte   $8b
         .byte   $97
         .byte   $44
         .byte   $00
         .byte   $8b
         .byte   $ce
         .byte   $2a
.macro   HiAscii Arg
         .repeat .strlen(Arg), I
         .byte   .strat(Arg, I) | $80
         .endrep
.endmacro
         HiAscii "mQaQa"
         .byte   $03
         .byte   $c1
         .byte   $52
         .byte   $50
         .byte   $0e
         .byte   $e8
         .byte   $3a
         .byte   $ec
         .byte   $83
         .byte   $c4
         .byte   $04
         .byte   $83
         .byte   $c7
         .byte   $02
         .byte   $ff
         .byte   $46
         .byte   $fc
         .byte   $a1
         .byte   $74
         .byte   $02
         .byte   $39
         .byte   $46
         .byte   $fc
         .byte   $72
         .byte   $c7
         .byte   $be
         .byte   $01
         .byte   $00
         .byte   $eb
L1625:   .byte   $09
L1626:   .byte   $56
L1627:   .byte   $0e
L1628:   .byte   $e8
L1629:   .byte   $3f
         .byte   $f8
         .byte   $83
         .byte   $c4
         .byte   $02
         .byte   "F;6L"
         .byte   $02
         .byte   $72
         .byte   $f1
         .byte   $89
         .byte   $76
         .byte   $fc
         .byte   $2b
         .byte   $c0
         .byte   $50
         .byte   $9a
         .byte   $ac
         .byte   $01
         .byte   $52
         .byte   $0a
         .byte   $83
         .byte   $c4
         .byte   $02
         .byte   $5e
         .byte   $5f
         .byte   $8b
         .byte   $e5
         .byte   $5d
         .byte   $cb
         .byte   $90
         .byte   $55
         .byte   $8b
         .byte   $ec
         .byte   $83
         .byte   $ec
         .byte   $1e
         .byte   $8d
         .byte   $46
         .byte   $e2
         .byte   $16
         .byte   $50
         .byte   $ff
         .byte   $76
         .byte   $08
         .byte   $ff
         .byte   $76
         .byte   $06
         .byte   $9a
         .byte   $86
         .byte   $20
         .byte   $52
         .byte   $0a
         .byte   $83
         .byte   $c4
         .byte   $08
         .byte   $40
         .byte   $75
         .byte   $08
         .byte   $2b
         .byte   $c0
         .byte   $89
         .byte   $46
         .byte   $fa
         .byte   $89
         .byte   $46
         .byte   $f8
         .byte   $8b
         .byte   $46
         .byte   $f8
         .byte   $8b
         .byte   $56
         .byte   $fa
         .byte   $8b
         .byte   $e5
         .byte   $5d
         .byte   $cb
         .byte   $55
         .byte   $8b
         .byte   $ec
         .byte   $83
         .byte   $ec
         .byte   $08
         .byte   $57
         .byte   $56
         .byte   $8d
         .byte   $46
L1682:   .byte   $fc
L1683:   .byte   $16
L1684:   .byte   $50
         .byte   $8d
         .byte   $46
         .byte   $fe
         .byte   $16
         .byte   $50
         .byte   $ff
         .byte   $76
         .byte   $08
         .byte   $ff
         .byte   $76
         .byte   $06
         .byte   $9a
         .byte   $68
         .byte   $07
         .byte   $a3
         .byte   $09
         .byte   $83
         .byte   $c4
         .byte   $0c
         .byte   $0b
         .byte   $c0
         .byte   $74
         .byte   $64
         .byte   $c7
         .byte   $46
         .byte   $fa
         .byte   $00
         .byte   $00
         .byte   $8b
         .byte   $46
         .byte   $fc
         .byte   $40
         .byte   $2d
         .byte   $04
         .byte   $00
         .byte   $1b
         .byte   $c9
         .byte   $f7
         .byte   $d1
         .byte   $23
         .byte   $c1
         .byte   $05
         .byte   $04
         .byte   $00
         .byte   $3d
         .byte   $01
         .byte   $00
         .byte   $76
         .byte   $36
         .byte   $8b
         .byte   $46
         .byte   $fc
         .byte   $40
         .byte   $2d
         .byte   $04
         .byte   $00
         .byte   $1b
         .byte   $d2
         .byte   $f7
         .byte   $d2
         .byte   $23
         .byte   $c2
         .byte   $05
         .byte   $04
         .byte   $00
         .byte   $8b
         .byte   $c8
         .byte   $49
         .byte   $8b
         .byte   $7e
         .byte   $fe
         .byte   $8b
         .byte   $76
         .byte   $fa
         .byte   $8b
         .byte   $df
         .byte   $03
         .byte   $de
         .byte   $03
         .byte   $5e
         .byte   $06
         .byte   $8e
         .byte   $46
         .byte   $08
         .byte   $26
         .byte   $8a
         .byte   $07
         .byte   $88
L16DD:   .byte   $84
L16DE:   .byte   $68
L16DF:   .byte   $0e
L16E0:   .byte   $0a
L16E1:   .byte   $c0
L16E2:   .byte   $74
L16E3:   .byte   $05
L16E4:   .byte   $46
L16E5:   .byte   $3b
L16E6:   .byte   $f1
L16E7:   .byte   $72
L16E8:   .byte   $e6
L16E9:   .byte   $89
L16EA:   .byte   $76
L16EB:   .byte   $fa
L16EC:   .byte   $8b
L16ED:   .byte   $5e
L16EE:   .byte   $fa
L16EF:   .byte   $c6
L16F0:   .byte   $87
         .byte   $68
         .byte   $0e
L16F3:   .byte   $00
L16F4:   .byte   $b8
L16F5:   .byte   $ad
         .byte   $8b
         .byte   $c0
         .byte   $8d
         .byte   $03
         .byte   $c0
         .byte   $a2
         .byte   $00
         .byte   $bd
         .byte   $00
         .byte   $02
         .byte   $9d
         .byte   $00
         HiAscii "PhPw="
         .byte   $00
         .byte   $03
         .byte   $9d
         .byte   $00
         .byte   $d1,$e8,$d0,$f7,$8d
         .byte   $02
         .byte   $c0,$ad,$8a,$c0
         .byte   $60

L1716:   lda     #$ff
         jsr     MON_WAIT
         dex
         bne     L1716
         rts

Start:   sta     $c0e6
         tsx
         stx     @L4391+1
         lda     RD80COL
         sta     $fa
         sta     CLR80COL
         ldx     #$00
         stx     $c0e3
         sta     SETALTZP
         ldy     #$20
@L1738:  lda     L16F5,y
         sta     $0100,y
         dey
         bpl     @L1738
         jsr     $0100
         sta     SETSTDZP
         ldx     #$75
         stx     Storage1403
         stx     @L1D6C+1
         ldy     #$ff
         sty     Storage1403+1
         ldy     #$c0
         sty     Storage1403+2
         lda     #$02
         sta     @L1D6C+2
         ldx     #$00
         jsr     @L2010
         jsr     @L1CA3
         ldx     Storage1403
         stx     $c7f0
         sta     $c09f
         nop
         nop
         ldx     #$46
         jsr     @L2010
         jsr     @L1D05
         ldx     #$28
         jsr     L1716
         ldx     #$00
         stx     Storage1403
         stx     @L1D6C+1
         ldy     #$76
         sty     Storage1403+1
         ldy     #$c0
         sty     Storage1403+2
         lda     #$02
         sta     @L1D6C+2
         ldx     #$01
         jsr     @L2010
         jsr     @L1CA3
         ldx     Storage1403
         stx     $c7f0
         ldx     #$76
         stx     Storage1403
         stx     @L1D6C+1
         ldy     #$8a
         sty     Storage1403+1
         ldy     #$c0
         sty     Storage1403+2
         lda     #$02
         sta     @L1D6C+2
         ldx     #$49
         jsr     @L2010
         jsr     @L1CA3
         lda     #$00
         sta     L140C
         sta     $c7f8
         sta     $c7fa
         sec
         jsr     @L1C75
         ldx     #$47
         jsr     @L2010
         jsr     @L1D05
         lda     #$04
         sta     L16DF
         lda     #$00
         sta     L16E1
         sta     L16E2
         sta     L1584
         lda     #$01
         sta     L16E0
         lda     #$40
         sta     L16EB
         sta     L16EC
@L17F6:  ldx     #$13
         ldy     #$1f
         lda     @L1F12
         jsr     @L4044
@L1800:  jsr     @L3FDB
         bcs     @L1831
         lda     KBD
         bpl     @L1800
         ldy     KBDSTRB
         and     #$5f
         ldy     #$07
@L1811:  dey
         bmi     @L1800
         cmp     @L1856,y
         bne     @L1811
         tya
         asl     A
         tay
         lda     @L185D,y
         sta     @L182B+1
         lda     @L185E,y
         sta     @L182B+2
         jsr     @L3FC0
@L182B:  jmp     MON_6502_IRQ+1

@L182E:  jmp     @L17F6

@L1831:  bvs     @L1800
         lsr     A
         lsr     A
         cmp     #$06
         bne     @L1840
         cmp     L140C
         bne     @L1800
         beq     @L1847

@L1840:  ldx     #$06
         cpx     L140C
         beq     @L1800
@L1847:  pha
         clc
         jsr     @L1C75
         pla
         sta     L140C
         jsr     @L3FC0
         jmp     @L18BE

@L1856:  .byte   $0b
         .byte   $0a
         .byte   $08
         .byte   $15
         .byte   $0d
         .byte   $6f
         .byte   $4f
@L185D:  .byte   $d8
@L185E:  .byte   $18
         .byte   $f9
         .byte   $18
         .byte   $12
         .byte   $19
         .byte   $2b
         .byte   $19
         .byte   $be
         .byte   $18
         .byte   $b4
         .byte   $18
         .byte   $b4
         .byte   $18
@L186B:  .byte   $65
@L186C:  .byte   $20
         .byte   $79
         .byte   $18
         .byte   $44
         .byte   $19
         .byte   $5f
         .byte   $20
         .byte   $3f
         .byte   $1b
         .byte   $56
         .byte   $1c
         .byte   $63

         trb     $e8ad
         cpy     #$8d
         stz     $eac0,x
         nop
         sta     SET80COL
         lda     $fa
         bmi     @L188B
         sta     CLR80COL
@L188B:  sta     SETALTZP
         lda     IWM_DRIVE_2
         ldx     #$00
         sta     WRCARDRAM
@L1896:  lda     $d000,x
         sta     $0200,x
         inx
         bne     @L1896
@L189F:  lda     $d100,x
         sta     $0300,x
         inx
         bne     @L189F
         sta     WRMAINRAM
         lda     IWM_DRIVE_1
         sta     SETSTDZP
         stx     $19
         rts

         lda     L140C
         cmp     #$06
         beq     @L18C7
         jmp     @L182E

@L18BE:  lda     L140C
         cmp     #$16
         bne     @L18C7
         lda     #$06
@L18C7:  asl     A
         tax
         lda     @L186B,x
         sta     @L18D5+1
         lda     @L186C,x
         sta     @L18D5+2
@L18D5:  jmp     MON_6502_IRQ+1

         lda     L140C
         cmp     #$06
         bcs     @L18F6
         tax
         cmp     @L1EFA,x
         beq     @L18F6
         clc
         jsr     @L1C75
         ldx     L140C
         lda     @L1EFA,x
@L18EF:  sta     L140C
         sec
@L18F3:  jsr     @L1C75
@L18F6:  jmp     @L182E

         lda     L140C
         cmp     #$06
         bcs     @L18F6
         tax
         cmp     @L1F00,x
         beq     @L18F6
         clc
         jsr     @L1C75
         ldx     L140C
         lda     @L1F00,x
         bpl     @L18EF
         lda     L140C
         cmp     #$06
         bcs     @L18F6
         tax
         cmp     @L1F06,x
         beq     @L18F6
         clc
         jsr     @L1C75
         ldx     L140C
         lda     @L1F06,x
         bpl     @L18EF
         lda     L140C
         cmp     #$06
         bcs     @L18F6
         tax
         cmp     @L1F0C,x
         beq     @L18F6
         clc
         jsr     @L1C75
         ldx     L140C
         lda     @L1F0C,x
         bpl     @L18EF
         jmp     @L382E

@L1947:  .byte   $1b
         .byte   $1b
         .byte   $09
         .byte   "Tiger Learning"
         .byte   $ff
         .byte   "Computer Help"
         .byte   $ff
         .byte   "contains a"
         .byte   $ff
         .byte   "description of each"
         .byte   $ff
         .byte   "item found on the"
         .byte   $ff
         .byte   "Tiger Desktop."
         .byte   $ff
         .byte   $ff
         .byte   $1b
         .byte   $00
         .byte   "DISK"
         .byte   $ff
         .byte   $1b
         .byte   $09
         .byte   "Use the disk menu to"
         .byte   $ff
         .byte   "select the disk you"
         .byte   $ff
         .byte   "want to use. Click"
         .byte   $ff
         .byte   "on the disk name to"
         .byte   $ff
         .byte   "to select and then"
         .byte   $ff
         .byte   "click OK."
         .byte   $ff
         .byte   $ff
         .byte   $1b
         .byte   $00
         .byte   "BASIC"
         .byte   $ff
         .byte   $1b
         .byte   $09
         .byte   "Use the BASIC"
         .byte   $ff
         .byte   "command to write"
         .byte   $ff
         .byte   "AppleSoft Basic"
         .byte   $ff
         .byte   "programs and run"
         .byte   $ff
         .byte   "them."
         .byte   $ff
         .byte   $ff
         .byte   $1b
         .byte   $00
         .byte   "COM"
         .byte   $ff
         .byte   $1b
         .byte   $09
         .byte   "Use the"
         .byte   $ff
         .byte   "communication menu"
         .byte   $ff
         .byte   "to specify the"
         .byte   $ff
         .byte   "character format"
         .byte   $ff
         .byte   "(also called data"
         .byte   $ff
         .byte   "format) and the"
         .byte   $ff
         .byte   "transmission speed"
         .byte   $ff
         .byte   "(also called baud"
         .byte   $ff
         .byte   "rate)."
         .byte   $ff
         .byte   $ff
         .byte   $1b
         .byte   $00
         .byte   "PRINTER"
         .byte   $ff
         .byte   $1b
         .byte   $09
         .byte   "Use the printer menu"
         .byte   $ff
         .byte   "to print BAS or TXT"
         .byte   $ff
         .byte   "files."
         .byte   $ff

         inc     A
         clc
         jsr     @L1C75
         lda     #$16
         sta     L140C
         clc
         jsr     @L1C75
         lda     #$40
         sta     L157F
         lda     #$24
         sta     L157E
         lda     #$14
         sta     L1583
         lda     #$0a
         sta     L1582
         lda     #$00
         sta     @L1C01+1
         jsr     @L1BEE
@L1B68:  ldx     #$f7
         ldy     #$1f
         lda     @L1FF6
         jsr     @L4044
@L1B72:  jsr     @L3FDB
         bcs     @L1BA1
         lda     KBD
         bpl     @L1B72
         ldy     KBDSTRB
         ldy     #$05
@L1B81:  dey
         bmi     @L1B72
         cmp     @L1BDF,y
         bne     @L1B81
         tya
         asl     A
         tay
         lda     @L1BE4,y
         sta     @L1B9B+1
         lda     @L1BE5,y
         sta     @L1B9B+2
         jsr     @L3FC0
@L1B9B:  jsr     MON_6502_IRQ+1
         jmp     @L1B68

@L1BA1:  bvs     @L1B72
         pha
         jsr     @L3FC0
         pla
         cmp     #$00
         bne     @L1BB6
         jmp     @L18BE

         tsx
         inx
         inx
         txs
         jmp     @L18BE

@L1BB6:  cmp     #$01
         beq     @L1BCD
         jsr     @L1BC0
         jmp     @L1B68

@L1BC0:  lda     @L1C01+1
         cmp     @L1947
         beq     @L1BDE
         inc     @L1C01+1
         bne     @L1BDB
@L1BCD:  jsr     @L1BD3
         jmp     @L1B68

@L1BD3:  lda     @L1C01+1
         beq     @L1BDE
         dec     @L1C01+1
@L1BDB:  jsr     @L1BEE
@L1BDE:  rts

@L1BDF:  .byte   $8b
         .byte   $8a
         .byte   $8d
         .byte   $ef
         .byte   $cf
@L1BE4:  .byte   $d3
@L1BE5:  .byte   $1b
         .byte   $c0
         .byte   $1b
         .byte   $af
         .byte   $1b
         .byte   $af
         .byte   $1b
         .byte   $af
         .byte   $1b

@L1BEE:  lda     #$48
         sta     @L1C4A+1
         lda     #$19
         sta     @L1C4A+2
         ldx     #$0a
         ldy     #$09
         jsr     @L323C
         ldx     #$00
@L1C01:  cpx     #$ff
         beq     @L1C0F
@L1C05:  jsr     @L1C4A
         cmp     #$ff
         bne     @L1C05
         inx
         bne     @L1C01
@L1C0F:  ldy     #$ff
@L1C11:  iny
         cpy     #$0a
         beq     @L1C49
         ldx     #$00
@L1C18:  jsr     @L1C4A
         cmp     #$1a
         beq     @L1C49
         cmp     #$1b
         beq     @L1C39
         cmp     #$ff
         beq     @L1C2D
         jsr     @L32AE
         inx
         bne     @L1C18
@L1C2D:  lda     #$20
@L1C2F:  cpx     #$14
         beq     @L1C11
         jsr     @L32AE
         inx
         bne     @L1C2F
@L1C39:  phx
         phy
         jsr     @L1C4A
         tay
         ldx     #$0a
         jsr     @L323C
         ply
         plx
         jmp     @L1C18

@L1C49:  rts

@L1C4A:  lda     MON_6502_IRQ+1
         inc     @L1C4A+1
         bne     @L1C55
         inc     @L1C4A+2
@L1C55:  rts

         clc
         jsr     @L1C75
         lda     #$06
         sta     L140C
         clc
         jmp     @L18F3

         sec
         jsr     @L1C75
         lda     #$05
         ldx     L140C
         cpx     #$16
         bne     @L1C72
         lda     #$04
@L1C72:  jmp     @L18EF

@L1C75:  lda     L140C
         adc     L140C
         adc     #$02
         tax
         jsr     @L2010
         ldx     L140C
         lda     @L1E72,x
         sta     @L1D6C+1
         sta     Storage1403
         lda     @L1E94,x
         sta     @L1D6C+2
         lda     @L1EB6,x
         sta     Storage1403+1
         lda     @L1ED8,x
         sta     Storage1403+2
         jsr     @L1CA3
         rts

@L1CA3:  lda     $c0e9
         lda     $c0ee
         sta     $c0e5
         lda     $c0ea
         jmp     @L1CB5

@L1CB2:  jsr     @L1D54
@L1CB5:  lda     $c0ec
         cmp     #$c0
         bcc     @L1CF8
         beq     @L1CCD
         and     #$3f
         tax
         jsr     @L1D54
         ldy     $c0ec
         lda     #$00
         sta     $1f
         beq     @L1CEA

@L1CCD:  jsr     @L1D54
         ldx     $c0ec
         jsr     @L1D54
         lda     $c0ec
         sta     $1f
         jsr     @L1D54
         ldy     $c0ec
         txa
         bne     @L1CEA
         jsr     @L1D69
         dex
         bmi     @L1CF2
@L1CEA:  jsr     @L1D69
         bcs     @L1CFE
         dex
         bne     @L1CEA
@L1CF2:  dec     $1f
         bpl     @L1CEA
         bmi     @L1CB2

@L1CF8:  tay
         jsr     @L1D69
         bcc     @L1CB2
@L1CFE:  sta     $c0e4
         lda     $c0e8
         rts

@L1D05:  lda     $c0e9
         lda     $c0ee
         sta     $c0e5
         lda     $c0ea
         lda     #$30
         sta     $c098
         ldx     #$00
@L1D18:  stx     $c09c
         inx
         cpx     #$81
         bne     @L1D18
         lda     $1d
         sta     $c099
         lda     $1c
         sta     $c09a
         lda     $1b
         sta     $c09b
         lda     #$70
         sta     $c098
@L1D34:  lda     $c098
         and     #$40
         bne     @L1D34
         lda     #$30
         sta     $c098
         ldx     #$80
@L1D42:  stx     $c09c
         dex
         bpl     @L1D42
         lda     #$00
         sta     $c098
         sta     $c0e4
         lda     $c0e8
         rts

@L1D54:  inc     $1d
         bne     @L1D68
         inc     $1c
         bne     @L1D63
         inc     $1b
         lda     $1b
         sta     $c0e2
@L1D63:  lda     $1c
         sta     $c0e1
@L1D68:  rts

@L1D69:  sta     WRCARDRAM
@L1D6C:  sty     $0200
         sta     WRMAINRAM
         inc     @L1D6C+1
         beq     @L1D7F
         lda     @L1D6C+1
         cmp     Storage1403+1
         bne     @L1D92
@L1D7F:  lda     Storage1403
         sta     @L1D6C+1
         inc     @L1D6C+2
         lda     @L1D6C+2
         cmp     Storage1403+2
         bne     @L1D92
         sec
         rts

@L1D92:  clc
         rts

@L1D94:  .res    19,$01
         .byte   $02
         .byte   $02
         .byte   $02
         .byte   $02
         .byte   $01
         .byte   $02
         .byte   $01
         .byte   $02
         .byte   $02
         .byte   $02
         .byte   $01
         .res    13,$02
         .byte   $01
         .byte   $02
         .byte   $01
         .byte   $02
         .byte   $01
         .res    22,$02
         .byte   $01
         .byte   $01
         .byte   $00
         .byte   $01
@L1DDE:  .byte   $9b
         HiAscii "[rrsstttuvvvww}}}~"
         .byte   $00
         .byte   $02
         .byte   $04
         .byte   $06
         .byte   $fd
         .byte   $0a
         .byte   $fd
         .byte   $0c
         .byte   $0c
         .byte   $0c
         .byte   $fd
         .byte   $15
         .byte   $16
         .byte   $17
         .byte   $18
         .byte   $19
         .byte   $19
         .byte   $1a
         .byte   $1a
         .byte   $1b
         .byte   $1b
         .byte   $1b
         .byte   $1c
         .byte   $1c
         .byte   $fd
         .byte   $1d
         .byte   $fd
         .byte   $20
         .byte   $fd
         .byte   "#$&&'(()))**+,,,,-.../"
         .byte   $00
         .byte   $5c
         .byte   $00
         .byte   $ec
@L1E28:  .byte   $07
         .byte   $9f
         .byte   $42
         .byte   $93
         .byte   $14
         .byte   $79
         .byte   $11
         .byte   $51
         .byte   $b3
         .byte   $4a
         .byte   $2a
         .byte   $7e
         .byte   $f6
         .byte   $5c
         .byte   $fa
         .byte   $53
         .byte   $57
         .byte   $53
         .byte   $9f
         .byte   $95
         .byte   $ac
         .byte   $aa
         .byte   $c9
         .byte   "S@SCCGSE"
         .byte   $c3
         .byte   $fe
         .byte   $bb
         .byte   $58
         .byte   $e7
         .byte   $6b
         .byte   $b9
         .byte   $04
         .byte   $51
         .byte   $ac
         .byte   $3d
         .byte   $dd
         .byte   $53
         .byte   $f1
         .byte   $53
         .byte   $c4
         .byte   $53
         .byte   $d6
         .byte   $98
         .byte   $7d
         .byte   $df
         .byte   $7a
         .byte   $10
         .byte   $91
         .byte   $03
         .byte   $61
         .byte   $ed
         .byte   $5f
         .byte   $fe
         .byte   $81
         .byte   $01
         .byte   $6c
         .byte   $b5
         .byte   $f1
         .byte   $87
         .byte   $08
         .byte   $88
         .byte   $ff
         .byte   $95
         .byte   $00
         .byte   $76
         .byte   $00
         .byte   $53
@L1E72:  .byte   $0a,$0a,$0d,"krq#*D,",$22,"'(",$22,")),?.F*",$22,$22,"8:J$1BT5A"
         .byte   "/H"
@L1E94:  .byte   $3e
         .byte   $6e
         .byte   $b6
         .byte   $3d
         .byte   $7d
         .byte   $b6
         .byte   "O4::="
         .byte   $82
         .byte   $9a
         .byte   "=bxkk"
         .byte   $ab
         .byte   $ab
         .byte   "4==_"
         .byte   $a2
         .byte   $6b
         HiAscii "...."
         .byte   $6b
         .byte   $6b
         .byte   $9c
         .byte   $9c
@L1EB6:  .byte   $17
         .byte   $1a
         .byte   $17
         .byte   $81
         .byte   $7f
         .byte   $81
         .byte   "d]ZBfd`f_F=HBZ]ffPO[0ASd<R=Y"
@L1ED8:  .byte   $46
         .byte   $76
         .byte   $be
         .byte   $45
         .byte   $85
         .byte   $be
         .byte   $86
         .byte   $79
         .byte   $59
         .byte   $59
         HiAscii "=,*<"
         .byte   $6a
         .byte   $80
         .byte   $73
         .byte   $73
         .byte   $b3
         .byte   $b3
         .byte   $79
         .byte   $aa
         .byte   $a5
         .byte   $90
         .byte   $bb
         .byte   $73
         HiAscii "6666"
         .byte   $73
         .byte   $73
         .byte   $a4
         .byte   $a4
@L1EFA:  .byte   $00
         .byte   $00
         .byte   $01
         .byte   $03
         .byte   $03
         .byte   $04
@L1F00:  .byte   $01
         .byte   $02
         .byte   $02
         .byte   $04
         .byte   $05
         .byte   $05
@L1F06:  .byte   $00
         .byte   $01
         .byte   $02
         .byte   $00
         .byte   $01
         .byte   $02
@L1F0C:  .byte   $03
         .byte   $04
         .byte   $05
         .byte   $03
         .byte   $04
         .byte   $05
@L1F12:  .byte   $64
         .byte   $0a
         .byte   $3c
         .byte   $17
         .byte   $44
         .byte   $06
         .byte   $1a
         .byte   $1b
         .byte   $39
         .byte   $07
         .byte   $04
         .byte   $14
         .byte   $0c
         .byte   $07
         .byte   $04
         .byte   $14
         .byte   $0c
         .byte   $0a
         .byte   $6c
         .byte   $1a
         .byte   $74
         .byte   $05
         .byte   $4b
         .byte   $1d
         .byte   $6b
         .byte   $1a
         .byte   $04
         .byte   $2a
         .byte   $0c
         .byte   $1a
         .byte   $04
         .byte   $2a
         .byte   $0c
         .byte   $0d
         .byte   $b4
         .byte   $17
         .byte   $bc
         .byte   $05
         .byte   $82
         .byte   $1a
         .byte   $b4
         .byte   $30
         .byte   $04
         .byte   $3b
         .byte   $0c
         .byte   $30
         .byte   $04
         .byte   $3b
         .byte   $0c
         .byte   $6b
         .byte   $3b
         .byte   $81
         .byte   $43
         .byte   $67
         .byte   $1b
         .byte   $85
         .byte   $38
         .byte   $40
         .byte   $04
         .byte   $56
         .byte   $0c
         .byte   $40
         .byte   $04
         .byte   $56
         .byte   $0c
         .byte   $72
         .byte   $7b
         .byte   $7f
         .byte   $83
         .byte   $70
         .byte   $49
         .byte   $80
         .byte   $77
         .byte   $5c
         .byte   $04
         .byte   $6a
         .byte   $0c
         .byte   $5c
         .byte   $04
         .byte   $6a
         .byte   $0c
         .byte   $71
         .byte   $b4
         .byte   $81
         .byte   $bc
         .byte   $68
         .byte   $87
         .byte   $86
         .byte   $b1
         .byte   $70
         .byte   $04
         .byte   $80
         .byte   $0c
         .byte   $70
         .byte   $04
         .byte   $80
         .byte   $0c
         .byte   $39
         .byte   $75
         .byte   $4d
         .byte   $7f
@L1F77:  .byte   $24
         .byte   $2e
         .byte   $5a
@L1F7A:  .byte   ".b,8BWFZ"
@L1F82:  .byte   "FbD8ZW,h=r,h=r?hHr?hHrJh[r"
@L1F9C:  .byte   $34
         .byte   $2e
         .byte   $5a
@L1F9F:  .byte   ".b,8BWFZ"
@L1FA7:  .byte   "FbD8ZW"
         .byte   $fe
         .byte   $fe
         .byte   $ff
         .byte   $ff
         .byte   $fe
         .byte   $fe
         .byte   $ff
         .byte   $ff
         .byte   $fe
         .byte   $fe
         .byte   $ff
         .byte   $ff
         .byte   $fe
         .byte   $fe
         .byte   $ff
         .byte   $ff
         .byte   $fe
         .byte   $fe
         .byte   $ff
         .byte   $ff
         .byte   $fe
         .byte   $fe
         .byte   $ff
         .byte   $ff
         .byte   "5h<r5h<rAhRr"
@L1FD1:  .byte   $24
         .byte   $24
         .byte   $ab
         .byte   $30
         .byte   $b5
         .byte   $31
         .byte   $ab
         .byte   $42
         .byte   $b5
         .byte   $42
         .byte   $ab
         .byte   $53
         .byte   $b5
         .byte   "aHePa"
         .byte   $81
         .byte   $65
         .byte   $89
         .byte   $23
         .byte   $48
         .byte   $61
         .byte   $88
         .byte   $54
         .byte   $ab
         .byte   $64
         .byte   $b5
         .byte   $2f
         .byte   $99
         .byte   $40
         .byte   $a3
         .byte   $48
         .byte   $99
         .byte   $59
         .byte   $a3
@L1FF6:  .byte   $0c
         .byte   $3f
         .byte   $93
         .byte   $47

         sta     @L3D60+1,x
         adc     MON_A5H
         .byte   $61
@L2000:  .byte   $86
         .byte   $65
         .byte   $8e
@L2003:  .byte   $0c,$28
         .byte   $8d
         ror     $97
         plp
         tya
         ror     $a0
         plp
         ldy     #$66
         tay
@L2010:  lda     @L1D94,x
         sta     $c0e2
         sta     $1b
         lda     @L1DDE,x
         sta     $c0e1
         sta     $1c
         lda     @L1E28,x
         sta     $c0e0
         sta     $1d
         rts

@L2029:  .byte   $07
         .byte   $10
         .byte   $11
         .byte   $19
@L202D:  .byte   $0a
         .byte   $1a
         .byte   $1b
         .byte   $1c
         .byte   $1d
@L2032:  .byte   $14
         .byte   $1e
         .byte   $1f
@L2035:  .byte   $15
         .byte   $20
         .byte   $21

@L2038:  lda     @L2029,x
         sta     L140C
         clc
         phx
         jsr     @L1C75
         plx
         inx
@L2045:  cpx     #$ff
         bne     @L2038
         rts

@L204A:  .byte   "NO_VOL"
         .byte   $00
@L2051:  .byte   "NONAME"
         .byte   $00
         .byte   "DOS3.3"
         .byte   $00

         lda     #$14
         ldy     #$ea
         bne     @L2069

         lda     #$07
         ldy     #$b8
@L2069:  sta     L140D
         lda     L140C
         sta     L140E
         sty     @L23EC
         clc
         jsr     @L1C75
@L2079:  lda     #$00
         sta     L1422
         sta     L16E7
         lda     L140D
         sta     L140C
         cmp     #$07
         bne     @L2098
         ldx     #$04
         stx     @L2045+1
         ldx     #$00
         jsr     @L2038
         jmp     @L20A2

@L2098:  ldx     #$0c
         stx     @L2045+1
         ldx     #$09
         jsr     @L2038
@L20A2:  lda     L140D
         sta     L140C
         jsr     @L21E1
         txa
         sta     @L1F82
         asl     A
         adc     @L1F82
         adc     #$46
         sta     @L1F82
         sta     @L1FA7
         jsr     @L2232
         txa
         sta     @L1F7A
         asl     A
         adc     @L1F7A
         adc     #$2e
         sta     @L1F7A
         sta     @L1F9F
         lda     #$5c
         sta     L157F
         lda     #$2e
         sta     L157E
         lda     #$14
         sta     L1583
         lda     #$01
         sta     L1582
         lda     L140D
         sta     L140C
         jsr     @L23C6
@L20EB:  jsr     @L23E9
         bvs     @L20F9
         ldx     #$78
         ldy     #$1f
         lda     @L1F77
         bvc     @L2100

@L20F9:  ldx     #$9d
         ldy     #$1f
         lda     @L1F9C
@L2100:  jsr     @L4044
@L2103:  jsr     @L3FDB
         bcs     @L213B
@L2108:  lda     KBD
         bpl     @L2103
         ldy     KBDSTRB
         and     #$7f
         ldy     #$0d
         jsr     @L23E9
         bvc     @L211B
         ldy     #$09
@L211B:  dey
         bmi     @L2103
         cmp     @L2172,y
         bne     @L211B
@L2123:  tya
         asl     A
         tay
         lda     @L217F,y
         sta     @L2135+1
         lda     @L2180,y
@L212F:  sta     @L2135+2
         jsr     @L3FC0
@L2135:  jsr     MON_6502_IRQ+1
         jmp     @L20EB

@L213B:  bvc     @L2142
         ldy     #$03
         jmp     @L2123

@L2142:  jsr     @L23E9
         bvc     @L2151
         cmp     #$04
         bcc     @L2155
         cmp     #$0a
         bcs     @L2155
         bcc     @L2108

@L2151:  cmp     #$0a
         bcs     @L2108
@L2155:  and     #$fe
         tay
         lda     @L2164,y
         sta     @L2135+1
         lda     @L2165,y
         jmp     @L212F

@L2164:  .byte   $ac
@L2165:  .byte   $21
         .byte   $99
         .byte   $21
         .byte   $be
         .byte   $21
         .byte   $c1
         .byte   $21
         .byte   $5e
         .byte   $24
         .byte   $a9
         .byte   $21
         .byte   $5e
         .byte   $24
@L2172:  .byte   $08
         .byte   $15
         .byte   $0d
         .byte   $1b
         .byte   $09
         .byte   "CcoOFfRr"
@L217F:  .byte   $9c
@L2180:  .byte   $23
         .byte   $c6
         .byte   "#`(^$"
         .byte   $f6
         .byte   "#^$^$"
         .byte   $a3
         .byte   $21
         .byte   $a3
         .byte   $21
         .byte   $9c
         .byte   $24
         .byte   $9c
         .byte   $24
         .byte   $07
         .byte   $23
         .byte   $07
         .byte   $23

         lda     L1422
         and     #$01
         beq     @L21A9
         jmp     @L23C6

         jsr     @L23E9
         bvs     @L21A9
         rts

@L21A9:  jmp     @L2880

         lda     L1422
         and     #$04
         bne     @L21B4
         rts

@L21B4:  lda     L1422
         and     #$01
         bne     @L21A9
         jmp     @L239C

         .byte   $4c
         .byte   $9c
         .byte   $24
         .byte   $4c
         .byte   $07
         .byte   $23

@L21C4:  pha
         ldx     #$01
         ldy     #$0f
         jsr     @L323C
@L21CC:  pla
         tax
         ldy     #$00
         lda     #$1e
         jsr     @L32CB
         rts

@L21D6:  pha
         ldx     #$02
         ldy     #$0f
         jsr     @L323C
         jmp     @L21CC

@L21E1:  lda     #$08
         sta     L140C
         lda     #$14
         sta     @L2303+1
         lda     #$14
         sta     @L2303+2
         ldx     #$02
         lda     #$42
         sta     @L42A0+1
         lda     $c0ea
@L21FA:  txa
         ora     L1422
         sta     L1422
         lda     #$18
         sta     @L2275
         ldy     #$00
         jsr     @L2288
         bne     @L2218
         lda     #$07
         sta     @L22D5+1
         jsr     @L22B6
         clc
         bcc     @L2276

@L2218:  ldy     #$01
         jsr     @L2288
         bne     @L2225
         ldy     #$58
         lda     #$20
         bne     @L2264

@L2225:  ldy     #$02
         jsr     @L2288
         beq     @L227C
         jsr     @L22F4
         jmp     @L2275

@L2232:  lda     #$09
         sta     L140C
         lda     #$1b
         sta     @L2303+1
         lda     #$14
         sta     @L2303+2
         ldx     #$04
         lda     #$2a
         sta     @L42A0+1
         lda     $c0eb
         lda     $c0ee
         and     #$20
         bne     @L21FA
         txa
         eor     #$ff
         and     L1422
         sta     L1422
         lda     #$38
         sta     @L2275
         ldy     #$4a
         lda     #$20
@L2264:  sty     @L226D+1
         sta     @L226D+2
         ldx     #$ff
@L226C:  inx
@L226D:  lda     @L204A,x
         jsr     @L2303
         bne     @L226C
@L2275:  sec
@L2276:  phx
         jsr     @L1C75
         plx
         rts

@L227C:  jsr     @L4286
         lda     #$07
         sta     @L22D5+1
         jsr     @L42E1
         rts

@L2288:  lda     $c0e9
         lda     $c0ee
         lda     #$00
         sta     $c0e3
         sta     $c0e2
         sta     $c0e1
         sta     $c0e0
         lda     $c0ec
         cmp     @L22B0,y
         bne     @L22AA
         lda     $c0ec
         cmp     @L22B3,y
@L22AA:  php
         lda     $c0e8
         plp
         rts

@L22B0:  .byte   $01
         .byte   $01
         .byte   $aa
@L22B3:  .byte   $38
         .byte   $a5
         .byte   $55

@L22B6:  lda     $c0e9
         lda     $c0ee
         lda     #$00
         sta     $c0e3
         sta     $c0e2
         lda     #$08
         sta     $c0e1
         lda     #$04
@L22CB:  sta     $c0e0
         lda     $c0ec
         and     #$0f
         beq     @L22F4
@L22D5:  cmp     #$07
         bcc     @L22DB
         lda     #$06
@L22DB:  sta     @L22E7+1
         ldx     #$00
@L22E0:  lda     $c0ec
         jsr     @L2303
         inx
@L22E7:  cpx     #$00
         bne     @L22E0
         lda     #$00
         jsr     @L2303
         lda     $c0e8
         rts

@L22F4:  lda     $c0e8
         ldx     #$ff
@L22F9:  inx
         lda     @L2051,x
         jsr     @L2303
         bne     @L22F9
         rts

@L2303:  sta     MON_6502_IRQ+1,x
         rts

         jsr     @L42F8
         ldx     #$e6
         lda     L1422
         and     #$01
         beq     @L2315
         ldx     #$e7
@L2315:  stx     @L231B+1
         stx     @L2396+1
@L231B:  sta     $c0ff
         sta     $c09e
         nop
         nop
         lda     MON_SOFTEVEC
         sta     @L2387+1
         lda     MON_SOFTEVEC+1
         sta     @L238C+1
         lda     MON_PWREDUP
         sta     @L2391+1
         lda     #$87
         sta     MON_SOFTEVEC
         lda     #$23
         sta     MON_SOFTEVEC+1
         eor     #$a5
         sta     MON_PWREDUP
         lda     #$00
         sta     $c098
         lda     #$01
         sta     $c0ae
         cld
         jsr     MON_SETNORM
         jsr     MON_INIT
         jsr     MON_SETVID
         jsr     MON_SETKBD
         lda     SETAN0
         lda     SETAN1
         ldy     #$09
         jsr     $fbb4
         nop
         lda     CLRROM
         bit     KBDSTRB
         cld
         jsr     MON_BELL
         jsr     MON_APPLEII
         ldx     #$05
@L2376:  lda     $fafc,x
         sta     MON_BRKV-1,x
         dex
         bne     @L2376
         lda     #$c6
         sta     ACTV_PERIP_SLOT
         jmp     $c600

@L2387:  lda     #$ff
         sta     MON_SOFTEVEC
@L238C:  lda     #$ff
         sta     MON_SOFTEVEC+1
@L2391:  lda     #$ff
         sta     MON_PWREDUP
@L2396:  sta     $c0ff
         jmp     $c600

@L239C:  lda     L1422
         and     #$04
         beq     @L23C6
         lda     #$1b
         sta     $1e
         lda     #$14
         sta     $1f
         lda     #$00
         jsr     @L21C4
         lda     #$14
         sta     $1e
         lda     #$14
         sta     $1f
         lda     #$08
         jsr     @L21D6
         lda     #$01
         ora     L1422
         sta     L1422
         rts

@L23C6:  lda     #$1b
         sta     $1e
         lda     #$14
         sta     $1f
         lda     #$00
         jsr     @L21D6
         lda     #$14
         sta     $1e
         lda     #$14
         sta     $1f
         lda     #$08
         jsr     @L21C4
         lda     #$fe
         and     L1422
         sta     L1422
         rts

@L23E9:  bit     @L23ED
@L23EC:  nop
@L23ED:  rts

         ldx     #$00
         ldy     #$00
         lda     #$04
         bne     @L23FC

         ldx     #$06
         ldy     #$06
         lda     #$03
@L23FC:  sta     @L2410+1
         stx     @L2434+1
         sty     @L2444+1
         jsr     @L23E9
         lda     #$18
         sta     @L2452
         jsr     @L2429
@L2410:  ldy     #$ff
         bvc     @L2416
         ldy     #$02
@L2416:  ldx     #$00
         cpy     L16E7
         beq     @L2421
         ldx     L16E7
         inx
@L2421:  stx     L16E7
         lda     #$38
         sta     @L2452
@L2429:  ldx     L16E7
         beq     @L245D
         lda     @L2029,x
         ldy     @L2029
@L2434:  bne     @L243C
         lda     @L202D,x
         ldy     @L202D
@L243C:  bvc     @L244C
         lda     @L2032,x
         ldy     @L2032
@L2444:  bne     @L244C
         lda     @L2035,x
         ldy     @L2035
@L244C:  sta     L140C
         sty     @L2458+1
@L2452:  clc
         php
         jsr     @L1C75
         plp
@L2458:  lda     #$ff
         sta     L140C
@L245D:  rts

@L245E:  tsx
         inx
         inx
         txs
         sec
         jsr     @L1C75
         lda     L140D
         cmp     L140C
         beq     @L2474
         sta     L140C
         jmp     @L2079

@L2474:  sec
         jsr     @L1C75
         lda     L140E
         jmp     @L18EF

@L247E:  .byte   $04
         .byte   "ProDOS FORMAT"
         .byte   $00
@L248D:  .byte   " DOS3.3 FORMAT"
         .byte   $00

         lda     #$0b
         sta     L140C
         clc
         jsr     @L1C75
         lda     #$04
         sta     @L247E
         lda     #$20
         sta     @L248D
         lda     #$00
         sta     L156A
         ldx     #$0f
         stx     L156B
@L24B9:  sta     L156C,x
         dex
         bpl     @L24B9
         lda     #$00
         sta     L156D
         lda     #$7f
         sta     L156C
         lda     #$6c
         sta     @L3360+1
         lda     #$15
         sta     @L3360+2
         lda     #$14
         sta     L1583
         lda     #$02
         sta     L1582
@L24DD:  lda     #$0c
         sta     L140C
         clc
         jsr     @L1C75
         lda     #$0b
         sta     L140C
         ldx     #$00
         ldy     #$09
         jsr     @L323C
         jsr     @L27FA
         jsr     @L280C
         jsr     @L281E
         ldx     #$00
@L24FD:  phx
         ldx     #$04
         ldy     #$20
         lda     @L2003
         jsr     @L4044
         plx
@L2509:  phx
         jsr     @L3FDB
         plx
         bcs     @L2548
         lda     KBD
         bpl     @L2509
         ldy     KBDSTRB
         cmp     #$9b
         beq     @L2542
         and     #$7f
         ldy     #$04
@L2520:  dey
         bmi     @L2581
         cmp     @L276B,y
         bne     @L2520
         tya
         asl     A
         tay
         lda     @L276F,y
         sta     @L253C+1
         lda     @L2770,y
         sta     @L253C+2
         phx
         jsr     @L3FC0
         plx
@L253C:  jsr     MON_6502_IRQ+1
         jmp     @L24FD

@L2542:  jsr     @L3FC0
         jmp     @L245E

@L2548:  bvc     @L254D
         jmp     @L2542

@L254D:  pha
         phx
         jsr     @L3FC0
         plx
         pla
         beq     @L257D
         cmp     #$02
         txa
         bne     @L256F
         lda     L1422
         bcc     @L2564
         ora     #$20
         bne     @L2566

@L2564:  and     #$df
@L2566:  sta     L1422
@L2569:  jsr     @L2777
         jmp     @L24FD

@L256F:  bcc     @L2577
         jsr     @L27D4
         jmp     @L24FD

@L2577:  jsr     @L27A8
         jmp     @L24FD

@L257D:  ldx     #$01
         bne     @L2569

@L2581:  phx
         jsr     @L3FC0
         plx
         txa
         bne     @L25BD
         lda     KBD
         and     #$7f
         ldy     L156A
         beq     @L25AB
         cmp     #$08
         bne     @L259B
         lda     #$7f
         bne     @L25B8

@L259B:  cmp     #$7f
         beq     @L25B5
         cmp     #$2e
         beq     @L25B5
         cmp     #$30
         bcc     @L25BD
         cmp     #$3a
         bcc     @L25B5
@L25AB:  and     #$5f
         cmp     #$41
         bcc     @L25BD
         cmp     #$5b
         bcs     @L25BD
@L25B5:  lda     KBD
@L25B8:  jsr     @L3305
         bcs     @L25C8
@L25BD:  jmp     @L24FD

         txa
         tsx
         inx
         inx
         txs
         tax
         beq     @L25B5
@L25C8:  lda     #$0c
         sta     L140C
         clc
         jsr     @L1C75
         lda     #$9a
         sta     L157F
         lda     #$29
         sta     L157E
         ldx     #$00
         ldy     #$09
         jsr     @L323C
         ldx     #$de
         lda     #$26
         jsr     @L2808
         ldx     #$b1
         ldy     #$4c
         lda     L1422
         and     #$20
         bne     @L25F8
         ldx     #$d1
         ldy     #$47
@L25F8:  stx     @L275F+1
         sty     @L275F+2
         lda     $c0eb
         lda     L1422
         and     #$01
         bne     @L260B
         lda     $c0ea
@L260B:  jsr     @L2D9C
         beq     @L262E
         ldx     #$28
         lda     #$2c
         ldy     #$01
         jsr     @L2812
         ldx     #$0c
         jsr     L1716
         ldx     L156A
         lda     #$7f
         sta     L156C,x
         lda     #$20
         sta     L156D,x
         jmp     @L24DD

@L262E:  lda     $c0e9
         lda     $c0ef
         ldx     #$48
         jsr     @L2010
         jsr     @L2720
         lda     $c0ef
         ldx     L156A
         lda     L1422
         and     #$20
         bne     @L267E
         lda     #$00
         sta     $c0e3
         sta     $c0e2
         lda     #$08
         sta     $c0e1
         lda     #$04
         sta     $c0e0
         txa
         ora     #$f0
         sta     $c0ed
         ldy     #$00
@L2663:  lda     L156C,y
         sta     $c0ed
         iny
         dex
         bne     @L2663
         beq     @L26A8

@L266F:  ldy     #$00
@L2671:  lda     L156C,y
         ora     #$80
         sta     $c0ed
         iny
         dex
         bne     @L2671
         rts

@L267E:  lda     #$00
         sta     $c0e3
         sta     $c0e2
         lda     #$1c
         sta     $c0e1
         lda     #$75
         sta     $c0e0
         jsr     @L266F
         lda     #$01
         sta     $c0e2
         lda     #$1f
         sta     $c0e1
         lda     #$0e
         sta     $c0e0
         ldx     L156A
         jsr     @L266F
@L26A8:  lda     L1422
         and     #$df
         sta     L1422
         lda     $c0e8
         lda     $c0ea
         lda     $c0ee
         ldx     #$ec
         lda     #$26
         jsr     @L2808
@L26C0:  lda     KBD
         bpl     @L26C0
         lda     KBDSTRB
         tsx
         inx
         inx
         txs
         lda     #$0b
         sta     L140C
         sec
         jsr     @L1C75
         lda     L140D
         sta     L140C
         jmp     @L2079

         .byte   "FORMATTING..."
         .byte   $00
         .byte   "COMPLETE!    ",$0a,"PRESS A KEY TO QUIT"
         .byte   $00

@L270E:  sty     $c0ed
         jsr     @L1D54
         lda     $1b
         cmp     #$02
         rts

@L2719:  tay
         jsr     @L270E
         bcc     @L2720
@L271F:  rts

@L2720:  jsr     @L275F
         cmp     #$c0
         bcc     @L2719
         beq     @L2736
         and     #$3f
         tax
         jsr     @L275F
         tay
         lda     #$00
         sta     $1f
         beq     @L274D

@L2736:  jsr     @L275F
         tax
         jsr     @L275F
         sta     $1f
         jsr     @L275F
         tay
         txa
         bne     @L274D
         tay
         jsr     @L270E
         dex
         bmi     @L2755
@L274D:  jsr     @L270E
         bcs     @L271F
         dex
         bne     @L274D
@L2755:  dec     $1f
         lda     $1f
         cmp     #$ff
         bne     @L274D
         beq     @L2720

@L275F:  lda     MON_6502_IRQ+1
         inc     @L275F+1
         bne     @L276A
         inc     @L275F+2
@L276A:  rts

@L276B:  .byte   $09
         .byte   $0b
         .byte   $0a
         .byte   $0d
@L276F:  .byte   $77
@L2770:  .byte   $27
         .byte   $a8
         .byte   $27
         .byte   $d4
         .byte   $27
         .byte   $c0
         .byte   $25

@L2777:  txa
         bne     @L2795
         lda     #$20
         ldx     L156A
         ldy     #$00
         jsr     @L32AE
         ldx     #$01
         lda     L1422
         and     #$20
         bne     @L2791
         jsr     @L27A8
         rts

@L2791:  jsr     @L27D4
         rts

@L2795:  ldx     #$00
         ldy     #$09
         jsr     @L323C
         jsr     @L27FA
         jsr     @L280C
         jsr     @L281E
         ldx     #$00
         rts

@L27A8:  txa
         beq     @L27D3
         lda     L1422
         and     #$df
         sta     L1422
         ldx     #$04
         stx     @L247E
         ldy     #$20
         sty     @L248D
         ldx     #$01
         ldy     #$0f
         jsr     @L323C
         jsr     @L27FA
         ldx     #$00
         ldy     #$09
@L27CB:  jsr     @L323C
         jsr     @L280C
         ldx     #$01
@L27D3:  rts

@L27D4:  txa
         beq     @L27D3
         lda     L1422
         ora     #$20
         sta     L1422
         ldx     #$20
         stx     @L247E
         ldy     #$04
         sty     @L248D
         ldx     #$00
         ldy     #$09
         jsr     @L323C
         jsr     @L27FA
         ldx     #$01
         ldy     #$0f
         jmp     @L27CB

@L27FA:  lda     #$9a
         sta     L157F
         lda     #$29
         sta     L157E
         ldx     #$7e
         lda     #$24
@L2808:  ldy     #$00
         beq     @L2812

@L280C:  ldy     #$01
         ldx     #$8d
         lda     #$24
@L2812:  stx     $1e
         sta     $1f
         lda     #$1e
         ldx     #$00
         jsr     @L32CB
         rts

@L281E:  lda     #$90
         sta     L157F
         lda     #$29
         sta     L157E
         ldx     #$0a
         ldy     #$09
         jsr     @L323C
         jsr     @L334B
         rts

         .byte   " TOTAL BLOCKS"
         .byte   $00
         .byte   " FREE BLOCK(S)  "
         .byte   $00
@L2852:  .byte   $80
@L2853:  .byte   $28
         .byte   $9c
         .byte   $24
         .byte   $07
         .byte   $23
         .byte   $5e
         .byte   $24
@L285A:  .byte   $80
@L285B:  .byte   $28
         .byte   $a9
         .byte   $21
         .byte   $5e
         .byte   $24
         .byte   $ad
         .byte   $e7
         .byte   $16
         .byte   $0a

         tax
         lda     @L2852,x
         ldy     @L2853,x
         jsr     @L23E9
         bvc     @L2876
         lda     @L285A,x
         ldy     @L285B,x
@L2876:  sta     @L287C+1
         sty     @L287C+2
@L287C:  jmp     MON_6502_IRQ+1

@L287F:  rts

@L2880:  jsr     @L42F8
         lda     #$00
         sta     L1450
         sta     L1451
         sta     L1424
         sta     L1423
         sta     L1427
         sta     L16E7
         lda     #$02
         sta     L1426
         jsr     @L29AF
         ldx     #$60
         lda     $c0ea
         lda     L1422
         and     #$01
         beq     @L28B0
         ldx     #$e0
         lda     $c0eb
@L28B0:  stx     @L2A5B
         stx     @L3065
         jsr     P8_MLI
         .byte   P8_ONLINE
         .word   @L2A5A
         bne     @L287F
         lda     @L2A5F
         and     #$0f
         tax
         lda     #$00
         sta     @L2A60,x
         inx
         stx     @L2A5E
         ldy     #$09
         ldx     #$04
         lda     #$0a
         jsr     @L23E9
         bvc     @L28DE
         ldy     #$0f
         ldx     #$0c
         lda     #$15
@L28DE:  sty     @L2045+1
         pha
         jsr     @L2038
         pla
         sta     L140C
         lda     #$40
         sta     L157F
         lda     #$24
         sta     L157E
         lda     #$60
         sta     $1e
         lda     #$2a
         sta     $1f
         ldx     #$0e
         ldy     #$09
         jsr     @L323C
         ldx     #$00
         ldy     #$00
         lda     #$1e
         jsr     @L32CB
@L290B:  jsr     @L23E9
         bvs     @L296A
         lda     #$5e
         sta     @L37A6
         lda     #$2a
         sta     @L37A6+1
         lda     #$2f
         sta     @L2A5F
         jsr     P8_MLI
         .byte   P8_GET_FILE_INFO
         .word   @L37A5
         lda     #$97
         sta     L157F
         lda     #$24
         sta     L157E
         ldx     #$01
         ldy     #$09
         jsr     @L323C
         lda     @L37AA
         sta     L1412
         lda     @L37AA+1
         sta     L1413
         jsr     @L3364
         ldx     #$33
         lda     #$28
         jsr     @L2F80
         lda     @L37AA
         sec
         sbc     @L37AD
         sta     L1412
         lda     @L37AA+1
         sbc     @L37AD+1
         sta     L1413
         jsr     @L3364
         iny
         ldx     #$41
         lda     #$28
         jsr     @L2F82
@L296A:  jsr     @L2EE1
         ldx     #$d2
         ldy     #$1f
         lda     @L1FD1
         jsr     @L4044
@L2977:  jsr     @L3FDB
         bcs     @L29B9
         lda     KBD
         bpl     @L2977
         ldy     KBDSTRB
         and     #$7f
         ldy     #$0d
         jsr     @L23E9
         bvc     @L298F
         ldy     #$09
@L298F:  dey
         bmi     @L2977
         cmp     @L29E0,y
         bne     @L298F
@L2997:  tya
         asl     A
         tay
         lda     @L29ED,y
         sta     @L29A9+1
         lda     @L29EE,y
@L29A3:  sta     @L29A9+2
         jsr     @L3FC0
@L29A9:  jsr     MON_6502_IRQ+1
         jmp     @L290B

@L29AF:  lda     #$00
         tax
@L29B2:  sta     L1469,x
         inx
         bne     @L29B2
         rts

@L29B9:  bvc     @L29C0
         ldy     #$03
         jmp     @L2997

@L29C0:  asl     A
         tay
         lda     @L29CE,y
         sta     @L29A9+1
         lda     @L29CF,y
         jmp     @L29A3

@L29CE:  .byte   $07
@L29CF:  .byte   "*",$0a,"*",$0d,"*"
         .byte   $15
         .byte   $2a
         .byte   $18
         .byte   $2a
         .byte   $33
         .byte   $2a
         .byte   $1b
         .byte   "*#*+*"
@L29E0:  .byte   $0b
         .byte   $0a
         .byte   $0d
         .byte   $1b
         .byte   $09
         .byte   "PpCcSsDd"
@L29ED:  .byte   $70
@L29EE:  .byte   $2a

         sty     $2a
         lda     ($2a),y
         lda     ($2b,x)
         inc     $9f23
         bit     @L2C9F
         lda     ($2b,x)
         lda     ($2b,x)
         lda     $2b,x
         lda     $2b,x
         ora     $2e,x
         ora     $2e,x
         jmp     @L2C9F

         jmp     @L2E15

         jsr     @L23E9
         bvs     @L2A59
         jmp     @L2BB5

         jmp     @L2A70

         jmp     @L2A84

         jsr     @L23E9
         bvs     @L2A59
         jmp     @L2BA1

         jsr     @L23E9
         bvc     @L2A59
         jmp     @L2C9F

         jsr     @L23E9
         bvc     @L2A59
         jmp     @L2BA1

         lda     L16EC
         sec
         sbc     #$48
         lsr     A
         lsr     A
         lsr     A
         cmp     L1423
         bne     @L2A4C
         jsr     @L23E9
         bvs     @L2A49
         jmp     @L2BAD

@L2A49:  jmp     @L2C9F

@L2A4C:  tax
         clc
         adc     L1424
         cmp     L1454
         bcs     @L2A59
         stx     L1423
@L2A59:  rts

@L2A5A:  .byte   2
@L2A5B:  .byte   $60
         .word   @L2A5F
@L2A5E:  .byte   $00
@L2A5F:  .byte   $00
@L2A60:  .res    16,$00

@L2A70:  lda     L1423
         bne     @L2A80
         lda     L1424
         beq     @L2A83
         dec     L1424
         jmp     @L2A83

@L2A80:  dec     L1423
@L2A83:  rts

@L2A84:  lda     L1423
         sec
         adc     L1424
         cmp     L1454
         bcs     @L2AA0
         lda     L1423
         cmp     #$07
         bne     @L2A9D
         inc     L1424
         jmp     @L2AA0

@L2A9D:  inc     L1423
@L2AA0:  rts

@L2AA1:  .byte   $d0
@L2AA2:  .byte   $2a
         .byte   $9f
         .byte   $2c
         .byte   $15
         .byte   $2e
         .byte   $b5
         .byte   $2b
         .byte   $a1
         .byte   $2b
@L2AAB:  .byte   $d0
@L2AAC:  .byte   $2a
         .byte   $9f
         .byte   $2c
         .byte   $a1
         .byte   $2b

         lda     L16E7
         asl     A
         tax
         lda     @L2AA1,x
         ldy     @L2AA2,x
         jsr     @L23E9
         bvc     @L2AC7
         lda     @L2AAB,x
         ldy     @L2AAC,x
@L2AC7:  sta     @L2ACD+1
         sty     @L2ACD+2
@L2ACD:  jmp     MON_6502_IRQ+1

@L2AD0:  lda     L1424
         bne     @L2B04
         ldx     L144F
         dex
         bne     @L2B04
         lda     L1428
         and     #$0f
         sec
         sbc     L1584
         eor     #$ff
         sta     L1584
         ldx     #$23
         lda     L1428,x
         tay
         lda     L1429,x
         tax
         bne     @L2B4A
         cpy     #$06
         bcs     @L2B4A
         lda     L1422
         and     #$f7
         sta     L1422
         jmp     @L2B4A

@L2B04:  ldx     #$10
         lda     L1428,x
         cmp     #$0f
         bne     @L2B46
         lda     L1429,x
         sta     L1426
         lda     L142A,x
         sta     L1427
         ldx     L1584
         lda     L1428
         and     #$0f
         sta     @L2B2E+1
         ldy     #$00
@L2B26:  lda     L1429,y
         sta     L1585,x
         inx
         iny
@L2B2E:  cpy     #$ff
         bne     @L2B26
         lda     #$2f
         sta     L1585,x
         inx
         stx     L1584
         lda     L1422
         ora     #$08
         sta     L1422
         jmp     @L2B66

@L2B46:  rts

@L2B47:  ldx     $0c01
@L2B4A:  sty     @L3068
         sty     L1426
         stx     @L3068+1
         stx     L1427
         jsr     P8_MLI
         .byte   P8_READ_BLOCK
         .word   @L3064
         ldy     $0c00
         bne     @L2B47
         ldx     $0c01
         bne     @L2B47
@L2B66:  lda     #$4a
         sta     L157F
         ldx     #$00
         stx     L1450
         stx     L1451
         stx     L1424
         stx     L1423
         jsr     @L29AF
         ldy     #$00
         lda     #$20
@L2B80:  jsr     @L32AE
         inx
         cpx     #$14
         bne     @L2B80
         ldx     #$00
         iny
         cpy     #$08
         bne     @L2B80
         lda     #$8d
         sta     L157F
         ldy     #$00
         lda     #$20
@L2B98:  jsr     @L32AE
         inx
         cpx     #$15
         bne     @L2B98
         rts

@L2BA1:  tsx
         inx
         inx
         txs
         lda     #$00
         sta     L1584
         jmp     @L245E

@L2BAD:  jsr     @L2BBB
         bcc     @L2BFE
         jmp     @L2AD0

@L2BB5:  jsr     @L2BBB
         jmp     @L2A84

@L2BBB:  lda     L1454
         beq     @L2BFD
         jsr     @L2BFF
         bcs     @L2BFE
         lda     L1424
         clc
         adc     L1423
         tax
         lda     #$01
         eor     L1469,x
         sta     L1469,x
         beq     @L2BEA
         lda     L1450
         clc
         adc     L143B
         sta     L1450
         lda     L1451
         adc     L143C
         jmp     @L2BFA

@L2BEA:  lda     L1450
         sec
         sbc     L143B
         sta     L1450
         lda     L1451
         sbc     L143C
@L2BFA:  sta     L1451
@L2BFD:  clc
@L2BFE:  rts

@L2BFF:  lda     L1424
         bne     @L2C10
         lda     L1423
         bne     @L2C10
         lda     L1422
         and     #$08
         bne     @L2C1B
@L2C10:  ldx     #$10
         lda     L1428,x
         cmp     #$0f
         beq     @L2C1B
         clc
         rts

@L2C1B:  sec
         rts

         .byte   "COPYING..."
         .byte   $00
         .byte   "DESTINATION ERROR!"
         .byte   $00
         .byte   "WRITE PROTECT ERROR!"
         .byte   $00
         .byte   "DESTINATION LOCKED!"
         .byte   $00
         .byte   "FILE CANNOT PRINT!"
         .byte   $00
         .byte   "PRINTER NOT FOUND!"
         .byte   $00
         .byte   "PRESS ESC TO QUIT!"
         .byte   $00
@L2C9D:  .byte   $fc
         .byte   $04

@L2C9F:  jsr     @L23E9
         bvc     @L2D07
         lda     L1454
         beq     @L2CF8
         jsr     @L2BFF
         bcc     @L2CB1
         jmp     @L2AD0

@L2CB1:  lda     $c098
         pha
         lda     #$02
         sta     $c098
         lda     $c094
         asl     A
         pla
         sta     $c098
         bcc     @L2D00
         ldy     #$02
@L2CC6:  dey
         bmi     @L2CF9
         lda     @L2C9D,y
         cmp     L1438
         bne     @L2CC6
         lda     #$00
         sta     L1682
         lda     L1428
         and     #$0f
         tax
         lda     #$00
         sta     L15CB,x
         beq     @L2CE9

@L2CE3:  lda     L1429,x
         sta     L15CB,x
@L2CE9:  dex
         bpl     @L2CE3
         phy
         ldx     #$8a
         ldy     #$2c
         jsr     @L2D41
         ply
         jsr     @L3DA1
@L2CF8:  rts

@L2CF9:  ldx     #$64
         ldy     #$2c
         jmp     @L2D41

@L2D00:  ldx     #$77
         ldy     #$2c
         jmp     @L2D41

@L2D07:  lda     L1450
         bne     @L2D11
         lda     L1451
         beq     @L2CF8
@L2D11:  lda     $c0eb
         lda     L1422
         and     #$01
         beq     @L2D1E
         lda     $c0ea
@L2D1E:  ldy     #$00
         jsr     @L2288
         bne     @L2D3D
         jsr     @L2D96
         bne     @L2D36
         jsr     @L2D9C
         beq     @L2D4C
@L2D2F:  ldx     #$3b
         ldy     #$2c
         jmp     @L2D41

@L2D36:  ldx     #$50
         ldy     #$2c
         jmp     @L2D41

@L2D3D:  ldx     #$28
         ldy     #$2c
@L2D41:  jsr     @L2F50
         ldx     #$0c
         jsr     L1716
         jmp     @L2D92

@L2D4C:  lda     L1426
         sta     @L3068
         lda     L1427
         sta     @L3068+1
         jsr     P8_MLI
         .byte   P8_READ_BLOCK
         .word   @L3064
         bne     @L2D92
         ldx     #$0a
         ldy     #$09
         jsr     @L323C
         ldx     #$1d
         ldy     #$2c
         jsr     @L2F50
         lda     #$d2
         sta     @L301A+1
         lda     #$2d
         sta     @L301A+2
         lda     #$00
         sta     L1569
         jsr     @L2FCD
         lda     #$6a
         sta     @L301A+1
         lda     #$30
         sta     @L301A+2
         lda     #$00
         sta     L1450
         sta     L1451
@L2D92:  lda     $c0e8
         rts

@L2D96:  lda     $c0ee
         and     #$80
         rts

@L2D9C:  lda     $c0e9
         lda     #$00
         sta     $c0e0
         sta     $c0e1
         sta     $c0e2
         sta     $c0e3
         ldy     $c0ef
         ldy     #$aa
         sty     $c0ed
         ldy     $c0ee
         sta     $c0e0
         ldy     $c0ec
         sta     $c0e0
         lda     $c0ef
         lda     #$01
         sta     $c0ed
         lda     $c0ee
         lda     $c0e8
         cpy     #$aa
         rts

         ldx     L1569
         lda     L1469,x
         beq     @L2E05
         lda     #$00
         tay
         sta     L1469,x
         tax
         lda     @L3015+1
         sta     $19
         lda     @L3015+2
         sta     $1a
         lda     ($19),y
         and     #$0f
         sta     @L2DF9+1
@L2DF2:  iny
         lda     ($19),y
         sta     L15CB,x
         inx
@L2DF9:  cpy     #$ff
         bne     @L2DF2
         lda     #$00
         sta     L15CB,x
         jsr     @L33CA
@L2E05:  inc     L1569
         rts

         .byte   "DELETING..."
         .byte   $00

@L2E15:  lda     L1450
         bne     @L2E1F
         lda     L1451
         beq     @L2E7D
@L2E1F:  lda     $c0eb
         lda     L1422
         and     #$01
         bne     @L2E2C
         lda     $c0ea
@L2E2C:  jsr     @L2D96
         beq     @L2E34
         jmp     @L2D36

@L2E34:  jsr     @L2D9C
         beq     @L2E3C
         jmp     @L2D2F

@L2E3C:  lda     L1426
         sta     @L3068
         lda     L1427
         sta     @L3068+1
         jsr     P8_MLI
         .byte   P8_READ_BLOCK
         .word   @L3064
         bne     @L2E7D
         ldx     #$0a
         ldy     #$09
         jsr     @L323C
         ldx     #$09
         ldy     #$2e
         jsr     @L2F50
         lda     #$7e
         sta     @L301A+1
         lda     #$2e
         sta     @L301A+2
         lda     #$00
         sta     L1569
         jsr     @L2FCD
         lda     #$6a
         sta     @L301A+1
         lda     #$30
         sta     @L301A+2
         jsr     @L2B66
@L2E7D:  rts

         ldx     L1569
         lda     L1469,x
         beq     @L2EB1
         lda     #$00
         tay
         sta     L1469,x
         tax
         lda     @L3015+1
         sta     $19
         lda     @L3015+2
         sta     $1a
         lda     ($19),y
         and     #$0f
         sta     @L2EA5+1
@L2E9E:  iny
         lda     ($19),y
         sta     L15CB,x
         inx
@L2EA5:  cpy     #$ff
         bne     @L2E9E
         lda     #$00
         sta     L15CB,x
         jsr     @L371C
@L2EB1:  inc     L1569
         rts

         .byte   " BLOCK(S) USED"
         .byte   $00
         .byte   " BLOCK(S) SELECTED"
         .byte   $00
         .byte   "DIRECTORY"
         .byte   $00

@L2EE1:  lda     #$4a
         sta     L157F
         lda     #$24
         sta     L157E
         lda     #$15
         sta     L1583
         lda     #$08
         sta     L1582
         lda     L1426
         sta     @L3068
         lda     L1427
         sta     @L3068+1
         jsr     P8_MLI
         .byte   P8_READ_BLOCK
         .word   @L3064
         bne     @L2F40
         ldx     #$0a
         ldy     #$09
         jsr     @L323C
         lda     #$00
         sta     L1425
         jsr     @L2FCD
         lda     L1458
         beq     @L2F40
         lda     #$8d
         sta     L157F
         lda     #$24
         sta     L157E
         lda     L1450
         bne     @L2F31
         lda     L1450
         beq     @L2F41
@L2F31:  bit     @L2F40
         lda     L1450
         sta     L1412
         lda     L1451
         jmp     @L2F6E

@L2F40:  rts

@L2F41:  lda     L1424
         bne     @L2F64
         ldx     L144F
         dex
         bne     @L2F64
         ldx     #$d7
         ldy     #$2e
@L2F50:  stx     $1e
         sty     $1f
         lda     #$8d
         sta     L157F
         lda     #$24
         sta     L157E
         ldx     #$00
         ldy     #$00
         beq     @L2F9D

@L2F64:  clv
         lda     L143B
         sta     L1412
         lda     L143C
@L2F6E:  sta     L1413
         php
         jsr     @L3364
         plp
         ldx     #$b5
         lda     #$2e
         bvc     @L2F80
         ldx     #$c4
         lda     #$2e
@L2F80:  ldy     #$00
@L2F82:  stx     $1e
         sta     $1f
         ldx     #$00
         lda     L1411
         bit     @L2FCC
         jsr     @L2FB3
         lda     L1410
         jsr     @L2FB3
         lda     L140F
         jsr     @L2FB3
@L2F9D:  lda     #$1e
         jsr     @L32CB
         lda     #$20
         ldx     L1580
         beq     @L2F40
@L2FA9:  cpx     #$15
         bcs     @L2F40
         jsr     @L32AE
         inx
         bne     @L2FA9
@L2FB3:  pha
         lsr     A
         lsr     A
         lsr     A
         lsr     A
         beq     @L2FBB
         clv
@L2FBB:  jsr     @L2FC4
         pla
         and     #$0f
         beq     @L2FC4
         clv
@L2FC4:  bvs     @L2FCC
         ora     #$30
         jsr     @L32AE
         inx
@L2FCC:  rts

@L2FCD:  lda     #$00
         sta     L1458
         lda     $0c24
         sta     L1453
         lda     $0c25
         ldy     $0c26
         bne     @L2FE4
         cmp     #$ff
         bcc     @L2FE6
@L2FE4:  lda     #$fe
@L2FE6:  sta     L1454
         ldy     $0c23
         sty     L1452
         ldx     #$02
         lda     L1422
         and     #$08
         beq     @L2FFE
         inc     L1454
         dex
         ldy     #$00
@L2FFE:  stx     L1457
         tya
         clc
         adc     #$04
@L3005:  sta     @L3015+1
         lda     #$0c
         sta     @L3015+2
@L300D:  lda     L1458
         cmp     L1454
         bcs     @L3063
@L3015:  lda     MON_6502_IRQ+1
         beq     @L3022
@L301A:  jsr     @L306A
         bcs     @L3063
         inc     L1458
@L3022:  lda     L1458
         cmp     L1454
         bcs     @L3063
         lda     L1457
         cmp     L1453
         beq     @L3046
         inc     L1457
         lda     L1452
         clc
         adc     @L3015+1
         sta     @L3015+1
         bcc     @L300D
         inc     @L3015+2
         bcs     @L300D

@L3046:  lda     $0c02
         sta     @L3068
         lda     $0c03
         sta     @L3068+1
         jsr     P8_MLI
         .byte   P8_READ_BLOCK
         .word   @L3064
         bne     @L3063
         lda     #$01
         sta     L1457
         lda     #$04
         bne     @L3005

@L3063:  rts

@L3064:  .byte   3
@L3065:  .byte   $60
         .word   $0c00
@L3068:  .word   $0002
@L306A:  lda     L1458
         cmp     L1424
         bcc     @L3063
         lda     @L3015+1
         sta     @L3113+1
         sta     @L3186+1
         sta     @L30AB+1
         lda     @L3015+2
         sta     @L3113+2
         sta     @L3186+2
         sta     @L30AB+2
         jsr     @L3113
         and     #$0f
         sta     @L3112
         ldy     L1425
         cpy     L1423
         bne     @L30BD
         ldx     #$01
         ldy     #$0f
         jsr     @L323C
         lda     #$10
         ora     L1422
         sta     L1422
         ldy     #$26
@L30AB:  lda     MON_6502_IRQ+1,y
         sta     L1428,y
         dey
         bpl     @L30AB
         lda     L1457
         sta     L144F
         ldy     L1425
@L30BD:  lda     L1424
         clc
         adc     L1425
         tax
         lda     L1469,x
         beq     @L30CC
         lda     #$04
@L30CC:  ldx     #$00
         jsr     @L32AE
         jsr     @L3117
         ldx     #$04
@L30D6:  inc     @L3113+1
         jsr     @L3113
         inx
         jsr     @L32AE
         dec     @L3112
         bne     @L30D6
         lda     #$20
@L30E7:  inx
         cpx     #$14
         beq     @L30F2
         jsr     @L32AE
         jmp     @L30E7

@L30F2:  iny
         cpy     L1582
         bcs     @L30FB
         sty     L1425
@L30FB:  lda     L1422
         and     #$10
         beq     @L3111
         php
         eor     L1422
         sta     L1422
         ldx     #$0a
         ldy     #$09
         jsr     @L323C
         plp
@L3111:  rts

@L3112:  .byte   $00

@L3113:  lda     MON_6502_IRQ+1
@L3116:  rts

@L3117:  lda     L1422
         and     #$08
         beq     @L3184
         lda     L1424
         bne     @L3184
         cpy     #$00
         bne     @L3184
         lda     $0c27
         ldx     $0c28
         jmp     @L3133

@L3130:  ldx     $0c01
@L3133:  sta     @L3068
         stx     @L3068+1
         jsr     P8_MLI
         .byte   P8_READ_BLOCK
         .word   @L3064
         bne     @L3116
         lda     $0c00
         bne     @L3130
         ldx     $0c01
         bne     @L3130
         ldx     #$0f
@L314D:  lda     $0c04,x
         sta     L1459,x
         dex
         bpl     @L314D
         lda     L1459
         and     #$0f
         sta     @L3112
         lda     #$59
         sta     @L3113+1
         lda     #$14
         sta     @L3113+2
         lda     L1426
         sta     @L3068
         lda     L1427
         sta     @L3068+1
         jsr     P8_MLI
         .byte   P8_READ_BLOCK
         .word   @L3064
         bne     @L3116
         lda     #$dc
         sta     $1e
         lda     #$31
         bne     @L319E

@L3184:  ldx     #$10
@L3186:  lda     MON_6502_IRQ+1,x
         ldx     #$06
@L318B:  dex
         bmi     @L31AF
         cmp     @L31BA,x
         bne     @L318B
         txa
         asl     A
         asl     A
         adc     #$c0
         sta     $1e
         lda     #$00
         adc     #$31
@L319E:  sta     $1f
         lda     #$1e
         ldx     #$01
         jsr     @L32CB
         lda     #$20
         ldx     #$04
         jsr     @L32AE
         rts

@L31AF:  jsr     @L31E0
         lda     #$d8
         sta     $1e
         lda     #$31
         bne     @L319E

@L31BA:  .byte   $06
         .byte   $04
         .byte   $0f
         .byte   $fa
         .byte   $fc
         .byte   $ff
         .byte   $42
         .byte   $49
         .byte   $4e
         .byte   $00
         .byte   $54
         .byte   $58
         .byte   $54
         .byte   $00
         .byte   $44
         .byte   $49
         .byte   $52
         .byte   $00
         .byte   $49
         .byte   $4e
         .byte   $54
         .byte   $00
         .byte   $42
         .byte   $41
         .byte   $53
         .byte   $00
         .byte   $53
         .byte   $59
         .byte   $53
         .byte   $00
         .byte   $24
@L31D9:  .byte   $20
         .byte   $20
         .byte   $00
         .byte   $2e
         .byte   $2e
         .byte   $20
         .byte   $00

@L31E0:  ldx     #$00
         pha
         lsr     A
         lsr     A
         lsr     A
         lsr     A
         jsr     @L31EE
         inx
         pla
         and     #$0f
@L31EE:  ora     #$30
         cmp     #$3a
         bcc     @L31F6
         adc     #$06
@L31F6:  sta     @L31D9,x
         rts

@L31FA:  pha
         txa
         sta     $1c
         asl     A
         adc     $1c
         adc     L157E
         sta     $1c
         tya
         asl     A
         asl     A
         asl     A
         adc     L157F
         sta     $1d
         pla
         rts

         .byte   $48
         .byte   $4c
         .byte   $19
         .byte   $32

@L3215:  pha
         inc     L1580
         lda     L1583
         cmp     L1580
         beq     @L3224
         bcs     @L3239
@L3223:  pha
@L3224:  lda     #$00
         sta     L1580
         inc     L1581
         lda     L1582
         cmp     L1581
         beq     @L3236
         bcs     @L3239
@L3236:  sec
         pla
         rts

@L3239:  clc
         pla
         rts

@L323C:  pha
         stx     $19
         sty     $1a
         txa
         asl     A
         asl     A
         asl     A
         asl     A
         pha
         ora     $19
         sta     @L3265
         pla
         ora     $1a
         sta     @L3266
         tya
         asl     A
         asl     A
         asl     A
         asl     A
         pha
         ora     $19
         sta     @L3267
         pla
         ora     $1a
         sta     @L3268
         pla
         rts

@L3265:  .byte   $00
@L3266:  .byte   $0f
@L3267:  .byte   $f0
@L3268:  .byte   $ff

@L3269:  pha
         txa
         pha
         tya
         pha
         ldx     #$08
@L3270:  lda     MON_6502_IRQ+1
         ldy     #$00
         sty     $1a
@L3277:  ldy     #$00
         sty     $19
         asl     A
         rol     $19
         asl     A
         rol     $19
         ldy     $19
         pha
         lda     @L3265,y
         ldy     $1a
         sta     WRCARDRAM
         sta     ($1c),y
         sta     WRMAINRAM
         pla
         ldy     $1a
         inc     $1a
         cpy     #$02
         bne     @L3277
         inc     $1d
         inc     @L3270+1
         bne     @L32A4
         inc     @L3270+2
@L32A4:  dex
         bne     @L3270
         pla
         tay
         pla
         tax
         pla
         rts

@L32AD:  .byte   $00

@L32AE:  pha
         stx     @L32AD
         jsr     @L31FA
         asl     A
         tax
         lda     @L4399,x
         sta     @L3270+1
         lda     @L439A,x
         sta     @L3270+2
         jsr     @L3269
         ldx     @L32AD
         pla
         rts

@L32CB:  sta     $1b
         tya
         pha
         txa
         pha
         sty     L1581
         sta     L1580
@L32D7:  ldx     $1b
         lda     ($00,x)
         inc     $00,x
         bne     @L32E1
         inc     $01,x
@L32E1:  clc
         tax
         beq     @L32FE
         cmp     #$0a
         bne     @L32F0
         jsr     @L3223
         bcc     @L32D7
         bcs     @L32FE

@L32F0:  ldx     L1580
         ldy     L1581
         jsr     @L32AE
         jsr     @L3215
         bcc     @L32D7
@L32FE:  pla
         tax
         pla
         tay
         lda     $1b
         rts

@L3305:  cmp     #$0d
         beq     @L333B
         cmp     #$7f
         beq     @L3325
         cmp     #$61
         bcc     @L3317
         cmp     #$7b
         bcs     @L3317
         and     #$df
@L3317:  ldy     L156A
         cpy     L156B
         bcs     @L3337
         jsr     @L3360
         iny
         bne     @L332B
@L3325:  ldy     L156A
         beq     @L3337
         dey
@L332B:  sty     L156A
         lda     #$7f
         jsr     @L3360
         iny
         jsr     @L3340
@L3337:  clc
         ldx     #$00
         rts

@L333B:  ldy     L156A
         beq     @L3337
@L3340:  lda     #$20
         jsr     @L3360
         iny
         lda     #$00
         jsr     @L3360
@L334B:  ldx     #$00
         ldy     #$00
         lda     @L3360+1
         sta     $1e
         lda     @L3360+2
         sta     $1f
         lda     #$1e
         jsr     @L32CB
         sec
         rts

@L3360:  sta     MON_6502_IRQ+1,y
         rts

@L3364:  sed
         ldx     #$00
         stx     L140F
         stx     L1410
         stx     L1411
         ldx     #$0f
@L3372:  asl     L1412
         rol     L1413
         bcc     @L3395
         lda     @L339A,x
         adc     L140F
         sta     L140F
         lda     @L33AA,x
         adc     L1410
         sta     L1410
         lda     @L33BA,x
         adc     L1411
         sta     L1411
@L3395:  dex
         bpl     @L3372
         cld
         rts

@L339A:  .byte   $00
         .byte   $01
         .byte   $03
         .byte   $07
         .byte   $15
         .byte   "1c'U"
         .byte   $11
         .byte   $23
         .byte   $47
         .byte   $95
         .byte   $91
         .byte   $83
         .byte   $67
@L33AA:  .res    7,$00
         .byte   $01
         .byte   $02
         .byte   $05
         .byte   $10
         .byte   $20
         .byte   $40
         .byte   $81
         .byte   $63
         .byte   $27
@L33BA:  .res    14,$00
         .byte   $01
         .byte   $03

@L33CA:  lda     #$00
         sta     L16DD
         sta     L16DE
         sta     @L37C4
         sta     @L37C4+1
         sta     @L37C4+2
         lda     #$00
         sta     @L37CB
         sta     @L37E6
         lda     #$10
         sta     @L37CB+1
         sta     @L37E6+1
         ldx     #$60
         ldy     #$e0
         lda     L1422
         and     #$01
         beq     @L33FA
         ldx     #$e0
         ldy     #$60
@L33FA:  stx     L1625
         sty     L1626
         sty     @L379C
         jsr     P8_MLI
         .byte   P8_READ_BLOCK
         .word   @L379B
         beq     @L340D
@L340B:  sec
         rts

@L340D:  lda     $1000
         bne     @L340B
         lda     $1001
         bne     @L340B
         lda     $1004
         and     #$f0
         cmp     #$f0
         bne     @L340B
         lda     #$00
         sta     @L37D0
         jsr     P8_MLI
         .byte   P8_CLOSE
         .word   @L37CF
@L342B:  lda     L1625
         sta     @L37A2
         lda     L16DD
         bne     @L3443
         lda     #$28
         sta     @L37A3
         lda     #$16
         sta     @L37A3+1
         jmp     @L344D

@L3443:  lda     #$8a
         sta     @L37A3
         lda     #$37
         sta     @L37A3+1
@L344D:  jsr     P8_MLI
         .byte   P8_ONLINE
         .word   @L37A1
         beq     @L3457
         sec
         rts

@L3457:  lda     L16DD
         bne     @L3493
         jsr     @L37FB
         lda     #$27
         sta     @L37A6
         lda     #$16
         sta     @L37A6+1
         jsr     P8_MLI
         .byte   P8_GET_FILE_INFO
         .word   @L37A5
         beq     @L3473
         sec
         rts

@L3473:  ldx     #$0e
@L3475:  lda     @L37A8,x
         sta     @L3779,x
         dex
         bpl     @L3475
         ldx     @L377E
         stx     @L3788
         lda     @L377F
         sta     @L3789
         bne     @L3493
         cpx     #$01
         beq     @L3493
         dec     @L3788
@L3493:  lda     #$27
         sta     @L37B8
         lda     #$16
         sta     @L37B8+1
         jsr     P8_MLI
         .byte   P8_OPEN
         .word   @L37B7
         beq     @L34A7
         sec
         rts

@L34A7:  lda     L16DD
         beq     @L34AF
         jmp     @L34BF

@L34AF:  lda     @L37BC
         sta     @L37BE
         jsr     P8_MLI
         .byte   P8_GET_EOF
         .word   @L37BD
         beq     @L34BF
         sec
         rts

@L34BF:  lda     @L37BC
         sta     @L37C3
         jsr     P8_MLI
         .byte   P8_SET_MARK
         .word   @L37C2
         beq     @L34CF
         sec
         rts

@L34CF:  lda     @L3788
         sec
         sbc     #$08
         tax
         beq     @L34EC
         bcs     @L34F6
         dec     @L3789
         bpl     @L34F6
         lda     @L3788
         asl     A
         sta     @L37CB+1
         sta     @L37E6+1
         jmp     @L34F1

@L34EC:  lda     @L3789
         bne     @L34F6
@L34F1:  lda     #$01
         sta     L16DE
@L34F6:  stx     @L3788
         lda     @L37BC
         sta     @L37C8
         jsr     P8_MLI
         .byte   P8_READ
         .word   @L37C7
         beq     @L3509
         sec
         rts

@L3509:  lda     @L37BC
         sta     @L37D0
         jsr     P8_MLI
         .byte   P8_CLOSE
         .word   @L37CF
         beq     @L3519
         sec
         rts

@L3519:  lda     L1626
         sta     @L37A2
         lda     L16DD
         bne     @L3531
         lda     #$83
         sta     @L37A3
         lda     #$16
         sta     @L37A3+1
         jmp     @L353B

@L3531:  lda     #$8a
         sta     @L37A3
         lda     #$37
         sta     @L37A3+1
@L353B:  jsr     P8_MLI
         .byte   P8_ONLINE
         .word   @L37A1
         beq     @L3545
         sec
         rts

@L3545:  lda     L16DD
         beq     @L354D
         jmp     @L3628

@L354D:  ldx     #$0f
@L354F:  lda     L1683,x
         sta     @L378B,x
         dex
         bpl     @L354F
         lda     L1683
         and     #$0f
         tax
         lda     #$2f
         sta     L1683
         sta     L1684,x
         ldy     #$ff
@L3568:  inx
         iny
         lda     L15CB,y
         sta     L1684,x
         bne     @L3568
         inx
         stx     L1682
         lda     #$82
         sta     @L37A6
         sta     @L37F9
         lda     #$16
         sta     @L37A6+1
         sta     @L37F9+1
         jsr     P8_MLI
         .byte   P8_GET_FILE_INFO
         .word   @L37A5
         bne     @L3593
         lda     #$00
         sta     @L35F9+1
@L3593:  lda     @L378B
         and     #$0f
         sta     @L378A
         inc     @L378A
         lda     #$2f
         sta     @L378B
         lda     #$8a
         sta     @L37A6
         lda     #$37
         sta     @L37A6+1
         jsr     P8_MLI
         .byte   P8_GET_FILE_INFO
         .word   @L37A5
         beq     @L35B7
         sec
         rts

@L35B7:  lda     @L37AA
         sec
         sbc     @L37AD
         tax
         lda     @L37AA+1
         sbc     @L37AD+1
         tay
         txa
         sec
         sbc     @L377E
         tya
         sbc     @L377F
         bcs     @L35F9
         ldx     #$e7
         ldy     #$35
         jsr     @L2F50
         ldx     #$0c
@L35DA:  lda     #$ff
         jsr     MON_WAIT
         dex
         bne     @L35DA
         jsr     @L29AF
         sec
         rts

         .byte   "DESTINATION FULL!"
         .byte   $00

@L35F9:  lda     #$ff
         bne     @L3608

         lda     #$ff
         sta     @L35F9+1
         jsr     P8_MLI
         .byte   P8_DESTROY
         .word   @L37F8
@L3608:  ldx     #$04
@L360A:  lda     @L3779,x
         sta     @L37D4,x
         dex
         bpl     @L360A
         ldx     #$03
@L3615:  lda     @L3784,x
         sta     @L37D9,x
         dex
         bpl     @L3615
         jsr     P8_MLI
         .byte   P8_CREATE
         .word   @L37D1
         beq     @L3628
         sec
         rts

@L3628:  lda     #$82
         sta     @L37B8
         lda     #$16
         sta     @L37B8+1
         jsr     P8_MLI
         .byte   P8_OPEN
         .word   @L37B7
         beq     @L363C
         sec
         rts

@L363C:  lda     L16DD
         bne     @L3663
         lda     @L37BF
         sta     @L37DF
         lda     @L37BF+1
         sta     @L37DF+1
         lda     @L37BF+2
         sta     @L37DF+2
         lda     @L37BC
         sta     @L37DE
         jsr     P8_MLI
         .byte   P8_SET_EOF
         .word   @L37DD
         beq     @L3663
         sec
         rts

@L3663:  lda     @L37BC
         sta     @L37C3
         jsr     P8_MLI
         .byte   P8_SET_MARK
         .word   @L37C2
         beq     @L3673
         sec
         rts

@L3673:  lda     @L37BC
         sta     @L37E3
         jsr     P8_MLI
         .byte   P8_WRITE
         .word   @L37E2
         beq     @L3683
         sec
         rts

@L3683:  lda     @L37BC
         sta     @L37D0
         jsr     P8_MLI
         .byte   P8_CLOSE
         .word   @L37CF
         beq     @L3693
         sec
         rts

@L3693:  lda     L16DE
         bne     @L36B4
         lda     L16DD
         ora     #$01
         sta     L16DD
         lda     #$10
         clc
         adc     @L37C4+1
         sta     @L37C4+1
         lda     #$00
         adc     @L37C4+2
         sta     @L37C4+2
         jmp     @L342B

@L36B4:  lda     #$82
         sta     @L37B8
         lda     #$16
         sta     @L37B8+1
         jsr     P8_MLI
         .byte   P8_OPEN
         .word   @L37B7
         beq     @L36C8
         sec
         rts

@L36C8:  lda     @L37BC
         sta     @L37DE
         jsr     P8_MLI
         .byte   P8_SET_EOF
         .word   @L37DD
         beq     @L36D8
         sec
         rts

@L36D8:  lda     @L37BC
         sta     @L37D0
         jsr     P8_MLI
         .byte   P8_CLOSE
         .word   @L37CF
         beq     @L36E8
         sec
         rts

@L36E8:  lda     #$82
         sta     @L37A6
         lda     #$16
         sta     @L37A6+1
         jsr     P8_MLI
         .byte   P8_GET_FILE_INFO
         .word   @L37A5
         beq     @L36FC
         sec
         rts

@L36FC:  ldx     #$05
@L36FE:  lda     @L37A6,x
         sta     @L37EB,x
         dex
         bpl     @L36FE
         ldx     #$03
@L3709:  lda     @L3780,x
         sta     @L37F4,x
         dex
         bpl     @L3709
         jsr     P8_MLI
         .byte   P8_SET_FILE_INFO
         .word   @L37EA
         beq     @L371B
         sec
@L371B:  rts

@L371C:  ldx     #$60
         lda     L1422
         and     #$01
         beq     @L3727
         ldx     #$e0
@L3727:  stx     @L37A2
         lda     #$28
         sta     @L37A3
         lda     #$16
         sta     @L37A3+1
         jsr     P8_MLI
         .byte   P8_ONLINE
         .word   @L37A1
         beq     @L373E
         sec
         rts

@L373E:  jsr     @L37FB
         lda     #$27
         sta     @L37F9
         sta     @L37A6
         lda     #$16
         sta     @L37F9+1
         sta     @L37A6+1
         jsr     P8_MLI
         .byte   P8_GET_FILE_INFO
         .word   @L37A5
         lda     @L37A8
         ora     #$e0
         sta     @L37A8
         lda     #$07
         sta     @L37A5
         jsr     P8_MLI
         .byte   P8_SET_FILE_INFO
         .word   @L37A5
         lda     #$0a
         sta     @L37A5
         jsr     P8_MLI
         .byte   P8_DESTROY
         .word   @L37F8
         beq     @L3778
         sec
@L3778:  rts

@L3779:  .res    5,$00
@L377E:  .byte   $00
@L377F:  .byte   $00
@L3780:  .byte   $00
         .byte   $00
         .byte   $00
         .byte   $00
@L3784:  .byte   $00
         .byte   $00
         .byte   $00
         .byte   $00
@L3788:  .byte   $00
@L3789:  .byte   $00
@L378A:  .byte   $00
@L378B:  .res    16,$00
@L379B:  .byte   3
@L379C:  .byte   $00
         .word   $1000
         .word   $0002
@L37A1:  .byte   2
@L37A2:  .byte   $00
@L37A3:  .word   MON_6502_IRQ+1
@L37A5:  .byte   10
@L37A6:  .word   MON_6502_IRQ+1
@L37A8:  .byte   $00
         .byte   $00
@L37AA:  .word   $0000
         .byte   $00
@L37AD:  .word   $0000
         .word   $0000
         .word   $0000
         .word   $0000
         .word   $0000
@L37B7:  .byte   3
@L37B8:  .word   MON_6502_IRQ+1
         .word   $1000
@L37BC:  .byte   0
@L37BD:  .byte   2
@L37BE:  .byte   0
@L37BF:  .faraddr $000000
@L37C2:  .byte   2
@L37C3:  .byte   0
@L37C4:  .faraddr $000000
@L37C7:  .byte   4
@L37C8:  .byte   0
         .word   @L74BB
@L37CB:  .word   $1000
         .word   $0000
@L37CF:  .byte   1
@L37D0:  .byte   0
@L37D1:  .byte   7
         .word   L1682
@L37D4:  .byte   $00
         .byte   $00
         .word   $0000
         .byte   $00
@L37D9:  .word   $0000
         .word   $0000
@L37DD:  .byte   2
@L37DE:  .byte   0
@L37DF:  .faraddr $000000
@L37E2:  .byte   4
@L37E3:  .byte   0
         .word   @L74BB
@L37E6:  .word   $1000
         .word   $0000
@L37EA:  .byte   7
@L37EB:  .word   MON_6502_IRQ+1
         .byte   $00
         .byte   $00
         .word   $0000
         .faraddr $000000
@L37F4:  .word   $0000
         .word   $0000
@L37F8:  .byte   1
@L37F9:  .word   MON_6502_IRQ+1
@L37FB:  lda     L1628
         and     #$0f
         tax
         lda     #$2f
         sta     L1628
         sta     L1629,x
         ldy     #$00
         lda     L1584
         beq     @L381D
@L3810:  inx
         lda     L1585,y
         sta     L1629,x
         iny
         cpy     L1584
         bne     @L3810
@L381D:  ldy     #$ff
@L381F:  inx
         iny
         lda     L15CB,y
         sta     L1629,x
         bne     @L381F
         inx
         stx     L1627
         rts

@L382E:  clc
         jsr     @L1C75
         lda     #$0d
         sta     L140C
         clc
         jsr     @L1C75
         lda     #$06
         sta     L1583
         lda     #$06
         sta     L1582
         lda     #$00
         sta     L16E7
         lda     L16DF
         sta     L16E3
         lda     L16E1
         sta     L16E5
         lda     L16E2
         sta     L16E6
         lda     L16E0
         sta     L16E4
         jsr     @L3C1B
         jsr     @L3C37
         jsr     @L3AEE
         jsr     @L3BA2
         jsr     @L3A86
         jsr     @L3B29
@L3874:  lda     L140C
         cmp     #$17
         bne     @L3881
         ldx     #$7e
         ldy     #$3a
         bne     @L3889

@L3881:  cmp     #$18
         bne     @L388D
         ldx     #$82
         ldy     #$3a
@L3889:  lda     #$04
         bne     @L3894

@L388D:  ldx     #$5e
         ldy     #$3a
         lda     @L3A5D
@L3894:  jsr     @L4044
@L3897:  jsr     @L3FDB
         bcs     @L38C8
         lda     KBD
         bpl     @L3897
         ldy     KBDSTRB
         and     #$7f
         ldy     #$0b
@L38A8:  dey
         bmi     @L3897
         cmp     @L38FF,y
         bne     @L38A8
@L38B0:  tya
         asl     A
         tay
         lda     @L390A,y
         sta     @L38C2+1
         lda     @L390B,y
@L38BC:  sta     @L38C2+2
         jsr     @L3FC0
@L38C2:  jsr     MON_6502_IRQ+1
         jmp     @L3874

@L38C8:  bvc     @L38CF
         ldy     #$06
         jmp     @L38B0

@L38CF:  sta     @L3984+1
         asl     A
         tay
         lda     L140C
         cmp     #$17
         beq     @L3920
         cmp     #$18
         beq     @L3924
@L38DF:  lda     @L38EB,y
         sta     @L38C2+1
         lda     @L38EC,y
         jmp     @L38BC

@L38EB:  .byte   $93
@L38EC:  .byte   $39
         .byte   $31
         .byte   $39
         .byte   $42
         .byte   $39
         .byte   $4a
         .byte   $39
         .byte   $27
         .byte   $3d
         .byte   $6a
         .byte   $3d
         .byte   $28
         .byte   $39
         .byte   $39
         .byte   $39
         .byte   $09
         .byte   $3a
         .byte   $36
         .byte   $3a
@L38FF:  .byte   $09
         .byte   $08
         .byte   $15
         .byte   $0b
         .byte   $0a
         .byte   $0d
         .byte   $1b
         .byte   "OoCc"
@L390A:  .byte   $71
@L390B:  .byte   $3c
         .byte   $90
         .byte   $3c
         .byte   $b0
         .byte   $3c
         .byte   $c4
         .byte   $3c
         .byte   $dd
         .byte   $3c
         .byte   $19
         .byte   $3d
         .byte   $6a
         .byte   $3d
         .byte   $27
         .byte   $3d
         .byte   $27
         .byte   $3d
         .byte   $6a
         .byte   $3d
         .byte   $6a
         .byte   $3d

@L3920:  ldy     #$10
         bne     @L38DF

@L3924:  ldy     #$12
         bne     @L38DF

         lda     #$01
         sta     @L3984+1
         lda     #$01
         bne     @L3933

         lda     #$00
@L3933:  sta     L16E0
         jmp     @L3981

         lda     #$02
         sta     @L3984+1
         lda     #$01
         bne     @L3944

         lda     #$00
@L3944:  sta     L16E2
         jmp     @L3981

         lda     L16E7
         cmp     #$03
         bne     @L3981
@L3951:  lda     #$18
         sta     L140C
         clc
         jsr     @L1C75
         lda     #$00
         sta     L16E8
@L395F:  lda     #$a2
         sta     L157F
         lda     #$3c
         sta     L157E
         lda     #$b8
         sta     @L39E9+1
         lda     #$3a
         sta     @L39E9+2
         lda     #$03
         sta     @L39D4+1
         lda     #$06
         sta     @L39F8+1
         jsr     @L39C8
         rts

@L3981:  ldy     L16E7
@L3984:  lda     #$ff
         sta     L16E7
         jsr     @L3C5F
         ldy     L16E7
         jsr     @L3C5F
         rts

         lda     L16E7
         cmp     #$00
         bne     @L3981
@L399A:  lda     #$17
         sta     L140C
         clc
         jsr     @L1C75
         lda     #$00
         sta     L16E8
@L39A8:  lda     #$5f
         sta     L157F
         lda     #$3a
         sta     L157E
         lda     #$ca
         sta     @L39E9+1
         lda     #$3a
         sta     @L39E9+2
         lda     #$06
         sta     @L39D4+1
         sta     @L39F8+1
         jsr     @L39C8
@L39C7:  rts

@L39C8:  ldy     #$ff
@L39CA:  phy
         ldx     #$0a
         ldy     #$09
         jsr     @L323C
         ply
@L39D3:  iny
@L39D4:  cpy     #$ff
         beq     @L39C7
         cpy     L16E8
         bne     @L39E7
         ldx     #$01
         ldy     #$0f
         jsr     @L323C
         ldy     L16E8
@L39E7:  ldx     #$00
@L39E9:  lda     MON_6502_IRQ+1,x
         beq     @L39F4
         jsr     @L32AE
         inx
         bne     @L39E9
@L39F4:  lda     @L39E9+1
         clc
@L39F8:  adc     #$ff
         sta     @L39E9+1
         bne     @L3A02
         inc     @L39E9+2
@L3A02:  cpy     L16E8
         bne     @L39D3
         beq     @L39CA

         lda     L16EC
         sec
         sbc     #$5d
         lsr     A
         lsr     A
         lsr     A
         cmp     L16E8
         bne     @L3A30
@L3A17:  lda     L16E8
         sta     L16DF
         sec
         jsr     @L1C75
         jsr     @L3AEE
         jsr     @L3B29
         jsr     @L3BA2
         lda     #$0d
         sta     L140C
         rts

@L3A30:  sta     L16E8
         jmp     @L39A8

         lda     L16EC
         sec
         sbc     #$a0
         lsr     A
         lsr     A
         lsr     A
         cmp     L16E8
         bne     @L3A57
@L3A44:  lda     L16E8
         sta     L16E1
         sec
         jsr     @L1C75
         jsr     @L3A86
         lda     #$0d
         sta     L140C
         rts

@L3A57:  sta     L16E8
         jmp     @L395F

@L3A5D:  jsr     @L5338
         bvc     @L3ABF
         and     ($6a)
         .byte   $47
         .byte   $73
         .byte   $32
         .byte   $80
         .byte   $41
         .byte   $89
         .byte   $3a
         .byte   $96
         .byte   $4f
         .byte   $a0
         .byte   $2e
         .byte   $a8
         .byte   $42
         .byte   $b2
         .byte   $46
         .byte   $a8
         .byte   $5a
         .byte   $b2
         .byte   "Jj_sJ"
         .byte   $80
         .byte   $59
         .byte   $89
         .byte   $38
         .byte   $5d
         .byte   $50
         .byte   $8d
         .byte   $3a
         .byte   $a0
         .byte   $4f
         .byte   $b8

@L3A86:  ldx     #$0f
         ldy     #$09
         jsr     @L323C
         lda     #$99
         sta     L157F
         lda     #$3c
         sta     L157E
         lda     L16E7
         eor     #$03
         bne     @L3AA5
         ldx     #$0b
         ldy     #$0f
         jsr     @L323C
@L3AA5:  lda     L16E1
         asl     A
         adc     L16E1
         asl     A
         adc     #$b8
         tax
         lda     #$00
         adc     #$3a
         tay
         jmp     @L3B1B

         .byte   "None"
         .byte   $00
         .byte   $00
         .byte   $45

@L3ABF:  ror     $65,x
         ror     a:$0000
         .byte   "Odd "
         .byte   $00
         .byte   $00
         .byte   "300  "
         .byte   $00
         .byte   "1200 "
         .byte   $00
         .byte   "2400 "
         .byte   $00
         .byte   "4800 "
         .byte   $00
         .byte   "9600 "
         .byte   $00
         .byte   "19200"
         .byte   $00

@L3AEE:  ldx     #$0f
         ldy     #$09
         jsr     @L323C
         lda     #$56
         sta     L157F
         lda     #$3a
         sta     L157E
         lda     L16E7
         bne     @L3B0B
         ldx     #$0b
         ldy     #$0f
         jsr     @L323C
@L3B0B:  lda     L16DF
         asl     A
         adc     L16DF
         asl     A
         adc     #$ca
         tax
         lda     #$00
         adc     #$3a
         tay
@L3B1B:  stx     $1e
         sty     $1f
         lda     #$1e
         ldx     #$00
         ldy     #$00
         jsr     @L32CB
         rts

@L3B29:  lda     #$62
         sta     L157F
         lda     #$29
         sta     L157E
         lda     #$0f
         sta     L140C
         sec
         lda     L16E7
         eor     #$02
         bne     @L3B41
         clc
@L3B41:  jsr     @L1C75
         sta     WRCARDRAM
         ldx     #$f9
         ldy     #$ff
         lda     L16E2
         bne     @L3B78
         stx     $8533
         stx     $8633
         stx     $8733
         ldx     #$99
         stx     $8534
         stx     $8634
         stx     $8734
         sty     $854b
         sty     $864b
         sty     $874b
         sty     $854c
         sty     $864c
         sty     $874c
         bne     @L3B9E

@L3B78:  stx     $854b
         stx     $864b
         stx     $874b
         ldx     #$99
         stx     $854c
         stx     $864c
         stx     $874c
         sty     $8533
         sty     $8633
         sty     $8733
         sty     $8534
         sty     $8634
         sty     $8734
@L3B9E:  sta     WRMAINRAM
         rts

@L3BA2:  lda     #$78
         sta     L157F
         lda     #$29
         sta     L157E
         lda     #$0e
         sta     L140C
         sec
         lda     L16E7
         eor     #$01
         bne     @L3BBA
         clc
@L3BBA:  jsr     @L1C75
         sta     WRCARDRAM
         ldx     #$f9
         ldy     #$ff
         lda     L16E0
         bne     @L3BF1
         stx     @L6F33
         stx     @L7033
         stx     @L7133
         ldx     #$99
         stx     @L6F34
         stx     @L7034
         stx     @L7134
         sty     @L6F4B
         sty     @L704B
         sty     @L714B
         sty     @L6F4C
         sty     @L704C
         sty     @L714B+1
         bne     @L3C17

@L3BF1:  stx     @L6F4B
         stx     @L704B
         stx     @L714B
         ldx     #$99
         stx     @L6F4C
         stx     @L704C
         stx     @L714B+1
         sty     @L6F33
         sty     @L7033
         sty     @L7133
         sty     @L6F34
         sty     @L7034
         sty     @L7134
@L3C17:  sta     WRMAINRAM
         rts

@L3C1B:  lda     #$ab
         sta     L157F
         lda     #$2e
         sta     L157E
         lda     #$12
         sta     L140C
         sec
         lda     L16E7
         eor     #$04
         bne     @L3C33
         clc
@L3C33:  jsr     @L1C75
         rts

@L3C37:  lda     #$ab
         sta     L157F
         lda     #$46
         sta     L157E
         lda     #$13
         sta     L140C
         sec
         lda     L16E7
         eor     #$05
         bne     @L3C4F
         clc
@L3C4F:  jsr     @L1C75
         rts

@L3C53:  .byte   $ee
@L3C54:  .byte   $3a
         .byte   $a2
         .byte   $3b
         .byte   $29
         .byte   $3b
         .byte   $86
         .byte   $3a
         .byte   $1b
         .byte   $3c
         .byte   $37
         .byte   $3c

@L3C5F:  tya
         asl     A
         tay
         lda     @L3C53,y
         sta     @L3C6E+1
         lda     @L3C54,y
         sta     @L3C6E+2
@L3C6E:  jmp     MON_6502_IRQ+1

         lda     L140C
         cmp     #$17
         bcs     @L3C8F
         lda     L16E7
         tay
         tax
         eor     #$05
         beq     @L3C83
         inx
         txa
@L3C83:  sta     L16E7
         jsr     @L3C5F
         ldy     L16E7
         jsr     @L3C5F
@L3C8F:  rts

         lda     L16E7
         cmp     #$01
         beq     @L3C9C
         cmp     #$02
         beq     @L3CA8
         rts

@L3C9C:  lda     #$00
@L3C9E:  sta     L16E0
@L3CA1:  ldy     L16E7
         jsr     @L3C5F
         rts

@L3CA8:  lda     #$00
@L3CAA:  sta     L16E2
         jmp     @L3CA1

         lda     L16E7
         cmp     #$01
         beq     @L3CBC
         cmp     #$02
         beq     @L3CC0
@L3CBB:  rts

@L3CBC:  lda     #$01
         bne     @L3C9E

@L3CC0:  lda     #$01
         bne     @L3CAA

         ldy     L140C
         cpy     #$17
         bcc     @L3CBB
         lda     L16E8
         beq     @L3CBB
         dec     L16E8
         cpy     #$17
         bne     @L3CDA
         jmp     @L39A8

@L3CDA:  jmp     @L395F

         ldy     L140C
         cpy     #$17
         bcc     @L3CFA
         ldx     L16E8
         inx
         cpx     @L39D4+1
         beq     @L3CBB
         stx     L16E8
         cpy     #$17
         bne     @L3CF7
         jmp     @L39A8

@L3CF7:  jmp     @L395F

@L3CFA:  lda     L16E7
         cmp     #$00
         beq     @L3D06
         cmp     #$03
         beq     @L3D09
         rts

@L3D06:  jmp     @L399A

@L3D09:  jmp     @L3951

@L3D0C:  asl     $08
         asl     A
         tsb     $0f0e
@L3D12:  jsr     $0000
         bra     @L3D17

@L3D17:  rts

@L3D18:  .byte   $20
         .byte   $ad
         .byte   $e7
         .byte   $16
         .byte   $ae
         .byte   $0c
         .byte   $14
         .byte   $e0
         .byte   $17

         bcs     @L3D5C
         cmp     #$04
         bne     @L3D66
         clc
         ldx     L16DF
         lda     @L3D0C,x
         ldx     L16E0
         adc     @L3D12,x
         ldx     L16E2
         adc     @L3D12+2,x
         sta     $c0ab
         sta     $fc
         ldx     L16E1
         lda     @L3D18-2,x
         sta     $c0aa
         sta     $fb
@L3D4A:  lda     #$0d
         sta     L140C
         sec
         jsr     @L1C75
         tsx
         inx
         inx
         txs
         lda     #$02
         jmp     @L18EF

@L3D5C:  cmp     #$00
         bne     @L3D63
@L3D60:  jmp     @L3A17

@L3D63:  jmp     @L3A44

@L3D66:  cmp     #$05
         bne     @L3D8C
         lda     L140C
         cmp     #$17
         bcs     @L3D8D
         lda     L16E3
         sta     L16DF
         lda     L16E4
         sta     L16E0
         lda     L16E5
         sta     L16E1
         lda     L16E6
         sta     L16E2
         jmp     @L3D4A

@L3D8C:  rts

@L3D8D:  sec
         jsr     @L1C75
         lda     #$0d
         sta     L140C
         jsr     @L3BA2
         jsr     @L3B29
         rts

@L3D9D:  .byte   $f4
@L3D9E:  .byte   $3d
         .byte   $fe
         .byte   $3e

@L3DA1:  tya
         asl     A
         tay
         lda     @L3D9D,y
         sta     @L3DF1+1
         lda     @L3D9E,y
         sta     @L3DF1+2
         ldx     #$60
         lda     L1422
         and     #$01
         beq     @L3DBB
         ldx     #$e0
@L3DBB:  stx     @L3F6E
         jsr     P8_MLI
         .byte   P8_ONLINE
         .word   @L3F6D
         beq     @L3DC8
         sec
         rts

@L3DC8:  lda     #$00
         sta     @L3F80
         jsr     P8_MLI
         .byte   P8_CLOSE
         .word   @L3F7F
         jsr     @L37FB
         jsr     P8_MLI
         .byte   P8_OPEN
         .word   @L3F71
         beq     @L3DE0
         sec
         rts

@L3DE0:  jsr     @L3F60
         beq     @L3DE7
         sec
@L3DE6:  rts

@L3DE7:  lda     #$bb
         sta     @L3EBA+1
         lda     #$74
         sta     @L3EBA+2
@L3DF1:  jmp     MON_6502_IRQ+1

@L3DF4:  lda     KBD
         bpl     @L3E00
         ldy     KBDSTRB
         cmp     #$9b
         beq     @L3E16
@L3E00:  jsr     @L3EBA
         sta     L1683
         jsr     @L3EBA
         sta     L1684
         bne     @L3E19
         lda     L1683
         bne     @L3E19
         jmp     @L3F20

@L3E16:  jmp     @L3F25

@L3E19:  jsr     @L3EBA
         sta     L1412
         jsr     @L3EBA
         sta     L1413
         jsr     @L3364
         bit     @L3DE6
         ldx     #$02
@L3E2D:  lda     L140F,x
         lsr     A
         lsr     A
         lsr     A
         lsr     A
         beq     @L3E37
         clv
@L3E37:  jsr     @L3F32
         lda     L140F,x
         and     #$0f
         beq     @L3E42
         clv
@L3E42:  jsr     @L3F32
         dex
         bpl     @L3E2D
         lda     #$20
         jsr     @L3F36
@L3E4D:  jsr     @L3EBA
         beq     @L3E8A
         bmi     @L3E5A
         jsr     @L3F36
         jmp     @L3E4D

@L3E5A:  pha
         lda     #$20
         jsr     @L3F36
         pla
         and     #$7f
         tay
         lda     #$d0
         sta     @L3EAC+1
         sta     @L3EAC+2
         bne     @L3E73

@L3E6E:  jsr     @L3EAC
         bpl     @L3E6E
@L3E73:  dey
         bpl     @L3E6E
@L3E76:  jsr     @L3EAC
         php
         and     #$7f
         jsr     @L3F36
         plp
         bpl     @L3E76
         lda     #$20
         jsr     @L3F36
         jmp     @L3E4D

@L3E8A:  lda     #$0d
         jsr     @L3F36
         lda     #$0a
         jsr     @L3F36
         lda     #$ba
         clc
         adc     L1683
         sta     @L3EBA+1
         lda     #$6c
         adc     L1684
         sec
         sbc     L1682
         sta     @L3EBA+2
         jmp     @L3DF4

@L3EAC:  lda     MON_6502_IRQ+1
         php
         inc     @L3EAC+1
         bne     @L3EB8
         inc     @L3EAC+2
@L3EB8:  plp
         rts

@L3EBA:  lda     MON_6502_IRQ+1
         pha
         php
         ldx     @L3EBA+1
         ldy     @L3EBA+2
         inx
         bne     @L3EC9
         iny
@L3EC9:  cpy     #$76
         bne     @L3EE4
         cpx     #$bb
         bne     @L3EE4
         jsr     @L3F60
         inc     @L3F7D
         ldx     #$bb
         ldy     #$74
         lda     L1682
         clc
         adc     #$02
         sta     L1682
@L3EE4:  stx     @L3EBA+1
         sty     @L3EBA+2
         plp
         pla
         rts

@L3EED:  lda     KBD
         bpl     @L3EF9
         ldy     KBDSTRB
         cmp     #$9b
         beq     @L3F25
@L3EF9:  lda     @L3F7D+1
         beq     @L3F20
@L3EFE:  jsr     @L3EBA
         cmp     #$0d
         bne     @L3F0A
         jsr     @L3F36
         lda     #$0a
@L3F0A:  jsr     @L3F36
         lda     @L3F7D
         sec
         sbc     #$01
         sta     @L3F7D
         beq     @L3EED
         bcs     @L3EFE
         dec     @L3F7D+1
         bpl     @L3EFE
         rts

@L3F20:  lda     #$0c
         jsr     @L3F36
@L3F25:  lda     @L3F76
         sta     @L3F80
         jsr     P8_MLI
         .byte   P8_CLOSE
         .word   @L3F7F
         rts

@L3F32:  bvs     @L3F5F
         ora     #$30
@L3F36:  pha
         lda     $c098
         sta     @L3F5A+1
         ora     #$02
         sta     $c098
         pla
         tay
@L3F44:  lda     KBD
         bpl     @L3F50
         cmp     #$9b
         beq     @L3F5A
         lda     KBDSTRB
@L3F50:  lda     $c094
         and     #$20
         bne     @L3F44
         sty     $c090
@L3F5A:  lda     #$ff
         sta     $c098
@L3F5F:  rts

@L3F60:  lda     @L3F76
         sta     @L3F78
         jsr     P8_MLI
         .byte   P8_READ
         .word   @L3F77
         rts

@L3F6D:  .byte   2
@L3F6E:  .byte   $00
         .word   L1628
@L3F71:  .byte   3
         .word   L1627
         .word   $1000
@L3F76:  .byte   0
@L3F77:  .byte   4
@L3F78:  .byte   0
         .word   @L74BB
         .word   $0200
@L3F7D:  .word   $0000
@L3F7F:  .byte   1
@L3F80:  .byte   0
@L3F81:  ldy     #$09
@L3F83:  lda     @L4161,y
         sta     $0100,y
         dey
         bpl     @L3F83
         lda     #$20
         ldy     PADDL3
         bmi     @L3F95
         lda     #$00
@L3F95:  sta     L16F4
         lda     #$80
         sta     L16F3
         lda     MON_IRQADDR
         sta     L16E9
         lda     MON_IRQADDR+1
         sta     L16EA
         lda     #$be
         sta     MON_IRQADDR
         lda     #$41
         sta     MON_IRQADDR+1
         lda     #$02
         sta     $c0ae
         jsr     @L412D
         jsr     @L4174
         cli
         rts

@L3FC0:  sei
         nop
         nop
         lda     #$00
         sta     $c0ae
         sei
         nop
         nop
         jsr     @L416B
         lda     L16E9
         sta     MON_IRQADDR
         lda     L16EA
         sta     MON_IRQADDR+1
         rts

@L3FDB:  lda     L16F3
         bmi     @L400B
         cmp     #$03
         bcc     @L400B
         jsr     @L40B4
         lda     #$20
         bit     L16ED
         bne     @L400D
@L3FEE:  lda     #$10
         bit     L16ED
         beq     @L4005
         bit     L16F4
         bne     @L400B
         lda     L16ED
         sta     L16F4
         bit     @L400C
         sec
         rts

@L4005:  lda     L16ED
         sta     L16F4
@L400B:  clc
@L400C:  rts

@L400D:  bit     L16F4
         bne     @L3FEE
         lda     L16ED
         sta     L16F4
         ldy     #$00
@L401A:  lda     L16EB
@L401D:  cmp     $fff0,y
         bcc     @L403A
@L4022:  cmp     $fff1,y
         bcs     @L403A
         lda     L16EC
@L402A:  cmp     $fff2,y
         bcc     @L403A
@L402F:  cmp     $fff3,y
         bcs     @L403A
         tya
         lsr     A
         lsr     A
         sec
         clv
         rts

@L403A:  iny
         iny
         iny
         iny
@L403E:  cpy     #$ff
         bcc     @L401A
         bcs     @L400B

@L4044:  stx     @L401D+1
         sty     @L401D+2
         inx
         stx     @L402A+1
         bne     @L4051
         iny
@L4051:  sty     @L402A+2
         inx
         stx     @L4022+1
         bne     @L405B
         iny
@L405B:  sty     @L4022+2
         inx
         stx     @L402F+1
         bne     @L4065
         iny
@L4065:  sty     @L402F+2
         sta     @L403E+1
         jsr     @L3F81
         rts

         sta     $c09f
         nop
         nop
@L4074:  lda     #$ff
         sta     WRCARDRAM
@L4079:  sta     $0200
         sta     WRMAINRAM
         inc     @L4079+1
         bne     @L4074
         inc     @L4079+2
         lda     @L4079+2
         cmp     #$c0
         bne     @L4074
         lda     #$00
@L4090:  sta     $c7f0
         jsr     @L3F81
         sei
@L4097:  lda     KBD
         bmi     @L40AB
         lda     L16F3
         bmi     @L4097
         cmp     #$03
         bcc     @L4097
         jsr     @L40B4
         jmp     @L4097

@L40AB:  lda     KBDSTRB
         sta     $c09e
         nop
         nop
         rts

@L40B4:  lda     #$00
         sta     L16F3
         ldx     #$02
@L40BB:  lda     L16F0,x
         sta     L16ED,x
         dex
         bpl     @L40BB
         lda     L16ED
         asl     A
         asl     A
         asl     A
         asl     A
         tay
         and     #$c0
         ora     L16EF
         sta     L16EF
         tax
         tya
         asl     A
         asl     A
         ora     L16EE
         sta     L16EE
         bne     @L40E3
         txa
         beq     @L412C
@L40E3:  jsr     @L416B
         clc
         lda     L16EE
         bmi     @L40FB
         ldx     #$87
         adc     L16EB
         bcs     @L4103
         cmp     #$87
         bcs     @L4103
         tax
         jmp     @L4103

@L40FB:  adc     L16EB
         tax
         bcs     @L4103
         ldx     #$00
@L4103:  clc
         lda     L16EF
         bmi     @L4118
         ldy     #$bd
         adc     L16EC
         bcs     @L4120
         cmp     #$bd
         bcs     @L4120
         tay
         jmp     @L4120

@L4118:  adc     L16EC
         tay
         bcs     @L4120
         ldy     #$00
@L4120:  stx     L16EB
         sty     L16EC
         jsr     @L412D
         jsr     @L4174
@L412C:  rts

@L412D:  lda     L16EB
         sta     $0104
         ldx     L16EC
         inx
         inx
         stx     $0105
         ldy     #$10
         sty     @L4160
         ldy     #$00
@L4142:  ldx     #$00
@L4144:  jsr     $0100
         sta     @L4236,y
         iny
         inx
         cpx     #$05
         bne     @L4144
         inc     $0105
         ldx     $0105
         cpx     #$c0
         beq     @L415F
         dec     @L4160
         bne     @L4142
@L415F:  rts

@L4160:  .byte   $00
@L4161:  .byte   $8d
         .byte   $03
         .byte   $c0
         .byte   $bd
         .byte   $ff
         .byte   $ff
         .byte   $8d
         .byte   $02
         .byte   $c0
         .byte   $60

@L416B:  bit     @L415F
         ldx     #$36
         ldy     #$42
         bne     @L4179

@L4174:  clv
         ldx     #$e6
         ldy     #$41
@L4179:  stx     @L4196+1
         sty     @L4196+2
         lda     L16EB
         sta     @L41A2+1
         ldx     L16EC
         inx
         inx
         stx     @L41A2+2
         ldy     #$10
         sty     @L4160
         ldy     #$00
@L4194:  ldx     #$00
@L4196:  lda     MON_6502_IRQ+1,y
         bvs     @L419F
         cmp     #$55
         beq     @L41A8
@L419F:  sta     WRCARDRAM
@L41A2:  sta     MON_6502_IRQ+1,x
         sta     WRMAINRAM
@L41A8:  iny
         inx
         cpx     #$05
         bne     @L4196
         inc     @L41A2+2
         ldx     @L41A2+2
         cpx     #$c0
         beq     @L41BD
         dec     @L4160
         bne     @L4194
@L41BD:  rts

         pha
         lda     $c0af
         and     #$40
         bne     @L41CD
         lda     L16F3
         bpl     @L41CF
         pla
         rti

@L41CD:  lda     #$00
@L41CF:  phx
         tax
         cpx     #$03
         bne     @L41D7
         ldx     #$00
@L41D7:  lda     $c0af
         and     #$7f
         sta     L16F0,x
         inx
         stx     L16F3
         plx
         pla
         rti

         .byte   $22
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $2f
         .byte   $22
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $2f
         .byte   $f2
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $2f
         .byte   $ff
         .byte   $22
         .byte   $55
         .byte   $55
         .byte   $2f
         .byte   $ff
         .byte   $f2
         .byte   $55
         .byte   $55
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $22
         .byte   $55
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $f2
         .byte   $55
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $ff
         .byte   $22
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $ff
         .byte   $f2
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $ff
         .byte   $22
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $22
         .byte   $55
         .byte   $2f
         .byte   $22
         .byte   $2f
         .byte   $f2
         .byte   $55
         .byte   $22
         .byte   $55
         .byte   $2f
         .byte   $f2
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $22
         .byte   $ff
         .byte   $22
         .byte   $55
         .byte   $55
         .byte   $22
         .byte   $ff
         .byte   $22
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $22
         .byte   $55
@L4236:  .byte   $22
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $2f
         .byte   $25
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $2f
         .byte   $f2
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $2f
         .byte   $ff
         .byte   $25
         .byte   $55
         .byte   $55
         .byte   $2f
         .byte   $ff
         .byte   $f2
         .byte   $55
         .byte   $55
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $25
         .byte   $55
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $f2
         .byte   $55
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $ff
         .byte   $25
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $ff
         .byte   $f2
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $ff
         .byte   $22
         .byte   $2f
         .byte   $ff
         .byte   $ff
         .byte   $22
         .byte   $25
         .byte   $2f
         .byte   $22
         .byte   $2f
         .byte   $f2
         .byte   $55
         .byte   $22
         .byte   $55
         .byte   $2f
         .byte   $f2
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $52
         .byte   $ff
         .byte   $25
         .byte   $55
         .byte   $55
         .byte   $52
         .byte   $ff
         .byte   $25
         .byte   $55
         .byte   $55
         .byte   $55
         .byte   $22
         .byte   $55

@L4286:  lda     $c0e9
         lda     $c0ee
         lda     #$00
         sta     $c0e3
         sta     $c0e2
         sta     $c0e1
         lda     #$20
         sta     $c0e0
         lda     $c0ec
         clc
@L42A0:  adc     #$2a
         sta     @L42C9+1
         lda     $c0ec
         adc     #$34
         sta     @L42C9+2
         lda     $c0ec
         sta     @L42D0+1
         lda     $c0ec
         sta     @L42E0
         ldy     #$24
@L42BB:  ldx     #$00
@L42BD:  lda     $c0ec
         iny
         bne     @L42C6
         inc     $c0e1
@L42C6:  sta     WRCARDRAM
@L42C9:  sta     $0200,x
         sta     WRMAINRAM
         inx
@L42D0:  cpx     #$ff
         bne     @L42BD
         inc     @L42C9+2
         dec     @L42E0
         bne     @L42BB
         lda     $c0e8
         rts

@L42E0:  .byte   $00

@L42E1:  lda     $c0e9
         lda     $c0ee
         lda     #$00
         sta     $c0e3
         sta     $c0e2
         sta     $c0e1
         lda     #$02
         jsr     @L22CB
         rts

@L42F8:  lda     $c0ea
         lda     L1422
         and     #$01
         beq     @L4305
         lda     $c0eb
@L4305:  ldy     #$02
         jsr     @L2288
         bne     @L435C
         ldx     #$38
@L430E:  lda     @L4360,x
         sta     $0c00,x
         dex
         bpl     @L430E
         lda     $c0e9
         lda     $c0ee
         lda     #$00
         sta     $c0e3
         sta     $c0e2
         sta     $c0e1
         sta     $1b
         lda     #$12
         sta     $c0e0
         ldx     $c0ec
         ldy     $c0ec
         lda     $c0ec
         sta     $0c04
         sta     $0c2c
         lda     $c0ec
         sta     $0c05
         sta     $0c2d
         lda     $c0ec
         sta     $1d
         lda     $c0ec
         sta     $c0e1
         sta     $1c
         lda     $1d
         sta     $c0e0
         jmp     $0c00

@L435C:  lda     $c0e8
         rts

@L4360:  lda     $c0ec
         sta     MON_6502_IRQ+1
         inc     $1d
         bne     @L437A
         inc     $1c
         bne     @L4375
         inc     $1b
         lda     $1b
         sta     $c0e2
@L4375:  lda     $1c
         sta     $c0e1
@L437A:  inc     $0c04
         bne     @L4382
         inc     $0c05
@L4382:  dex
         bne     @L4360
         dey
         bpl     @L4360
         lda     $c0e8
         jsr     MON_6502_IRQ+1
         lda     $c0e8
@L4391:  ldx     #$ff
         txs
         ldx     #$01
         stx     $19
         rts

@L4399:  .byte   $29
@L439A:  .byte   "E)E)E)E"
         .byte   $99
         .byte   "D)E)E)E"
         .byte   $a1
         .byte   $44
         .byte   $29
         .byte   $45
         .byte   $a9
         .byte   $44
         .byte   $b1
         .byte   "D)E)E)E)E)E)E)E)E)E"
         .byte   $b9
         .byte   "D)E)E)E)E)E)E)E)E"
         .byte   $c9
         .byte   $44
         .byte   $d1
         .byte   $44
         .byte   $29
         .byte   $45
         .byte   $11
         .byte   $47
         .byte   $91
         .byte   "G!G)G1GAG"
         .byte   $99
         .byte   "GQGYGIGyG"
         .byte   $a9
         .byte   $47
         .byte   $39
         .byte   $47
         .byte   $b9
         .byte   $47
         .byte   $c9
         .byte   $47
         .byte   $d9
         .byte   $44
         .byte   $e1
         .byte   $44
         .byte   $e9
         .byte   $44
         .byte   $f1
         .byte   $44
         .byte   $f9
         .byte   $44
         .byte   $01
         .byte   $45
         .byte   $09
         .byte   $45
         .byte   $11
         .byte   $45
         .byte   $19
         .byte   $45
         .byte   $21
         .byte   $45
         .byte   $81
         .byte   $47
         .byte   $89
         .byte   $47
         .byte   $a1
         .byte   $47
         .byte   $71
         .byte   $47
         .byte   $b1
         .byte   $47
         .byte   $c1
         .byte   $47
         .byte   $19
         .byte   "G1E9EAEIEQEYEaEiEqEyE"
         .byte   $81
         .byte   $45
         .byte   $89
         .byte   $45
         .byte   $91
         .byte   $45
         .byte   $99
         .byte   $45
         .byte   $a1
         .byte   $45
         .byte   $a9
         .byte   $45
         .byte   $b1
         .byte   $45
         .byte   $b9
         .byte   $45
         .byte   $c1
         .byte   $45
         .byte   $c9
         .byte   $45
         .byte   $d1
         .byte   $45
         .byte   $d9
         .byte   $45
         .byte   $e1
         .byte   $45
         .byte   $e9
         .byte   $45
         .byte   $f1
         .byte   $45
         .byte   $f9
         .byte   $45
         .byte   $19
         .byte   "F!F)F1F"
         .byte   $c1
         .byte   "DaGAFIFQFYFaFiFqFyF"
         .byte   $81
         .byte   $46
         .byte   $89
         .byte   $46
         .byte   $91
         .byte   $46
         .byte   $99
         .byte   $46
         .byte   $a1
         .byte   $46
         .byte   $a9
         .byte   $46
         .byte   $b1
         .byte   $46
         .byte   $b9
         .byte   $46
         .byte   $c1
         .byte   $46
         .byte   $c9
         .byte   $46
         .byte   $d1
         .byte   $46
         .byte   $d9
         .byte   $46
         .byte   $e1
         .byte   $46
         .byte   $e9
         .byte   $46
         .byte   $f1
         .byte   $46
         .byte   $f9
         .byte   $46
         .byte   $01
         .byte   $47
         .byte   $09
         .byte   $47
         .byte   $01
         .byte   $46
         .byte   $09
         .byte   $46
         .byte   $11
         .byte   "FiG9F"
         .byte   $00
         .byte   $00
         .byte   $08
         .byte   $10
         .byte   $a0
         .byte   $40
         .byte   $40
         .byte   $00
         .byte   $00
         .byte   $20
         .byte   $10
         .byte   $f8
         .byte   $10
         .byte   $20
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $20
         .byte   $20
         .byte   $20
         .byte   $a8
         .byte   $70
         .byte   $20
         .byte   $00
         .byte   $00
         .byte   $20
         .byte   $70
         .byte   $a8
         .byte   $20
         .byte   $20
         .byte   $20
         .byte   $00
         .byte   $00
         .byte   $20
         .byte   $40
         .byte   $f8
         .byte   $40
         .byte   $20
         .res    9,$00
         .byte   $f8
         .byte   $00
         .byte   $20
         .byte   $70
         .byte   $f8
         .byte   $70
         .byte   $70
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $70
         .byte   $70
         .byte   $f8
         .byte   $70
         .byte   $20
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $a8
         .byte   $a8
         .byte   $88
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $60
         .byte   $a0
         .byte   $20
         .byte   $20
         .byte   $20
         .byte   $f8
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $30
         .byte   $40
         .byte   $80
         .byte   $f8
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $30
         .byte   $08
         .byte   $88
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $30
         .byte   $50
         .byte   $90
         .byte   $f8
         .byte   $10
         .byte   $10
         .byte   $00
         .byte   $00
         .byte   $f8
         .byte   $80
         .byte   $f0
         .byte   $08
         .byte   $08
         .byte   $f0
         .byte   $00
         .byte   $00
         .byte   $30
         .byte   $40
         .byte   $f0
         .byte   $88
         .byte   $88
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $f8
         .byte   $08
         .byte   $10
         .byte   $20
         .byte   $20
         .byte   $20
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $70
         .byte   $88
         .byte   $88
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $78
         .byte   $08
         .byte   $88
         .byte   $70
         .res    10,$00
         .byte   $70
         .byte   $88
         .byte   $88
         .byte   $f8
         .byte   $88
         .byte   $88
         .byte   $00
         .byte   $00
         .byte   $f0
         .byte   $88
         .byte   $f0
         .byte   $88
         .byte   $88
         .byte   $f0
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $80
         .byte   $80
         .byte   $88
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $f0
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $f0
         .byte   $00
         .byte   $00
         .byte   $f8
         .byte   $80
         .byte   $f8
         .byte   $80
         .byte   $80
         .byte   $f8
         .byte   $00
         .byte   $00
         .byte   $f8
         .byte   $80
         .byte   $f8
         .byte   $80
         .byte   $80
         .byte   $80
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $80
         .byte   $98
         .byte   $88
         .byte   $78
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $88
         .byte   $f8
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $00
         .byte   $00
         .byte   $f8
         .byte   "    "
         .byte   $f8
         .byte   $00
         .byte   $00
         .byte   $f8
         .byte   $10
         .byte   $10
         .byte   $10
         .byte   $10
         .byte   $e0
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $90
         .byte   $e0
         .byte   $b0
         .byte   $90
         .byte   $98
         .byte   $00
         .byte   $00
         .res    5,$80
         .byte   $f8
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $d8
         .byte   $a8
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $c8
         .byte   $a8
         .byte   $98
         .byte   $88
         .byte   $88
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $f0
         .byte   $88
         .byte   $88
         .byte   $f0
         .byte   $80
         .byte   $80
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $88
         .byte   $a8
         .byte   $90
         .byte   $68
         .byte   $00
         .byte   $00
         .byte   $f0
         .byte   $88
         .byte   $88
         .byte   $f0
         .byte   $88
         .byte   $88
         .byte   $00
         .byte   $00
         .byte   $78
         .byte   $80
         .byte   $70
         .byte   $08
         .byte   $08
         .byte   $f0
         .byte   $00
         .byte   $00
         .byte   $f8
         .byte   "     "
         .byte   $00
         .byte   $00
         .res    5,$88
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $50
         .byte   $20
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $a8
         .byte   $a8
         .byte   $50
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   "P  P"
         .byte   $88
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $88
         .byte   "P   "
         .byte   $00
         .byte   $00
         .byte   $f8
         .byte   $08
         .byte   $30
         .byte   $40
         .byte   $80
         .byte   $f8
         .byte   $00
         .byte   $00
         .byte   $38
         .byte   $60
         .byte   $c0
         .byte   $60
         .byte   $38
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   "      "
         .byte   $00
         .byte   $00
         .byte   $e0
         .byte   $30
         .byte   $18
         .byte   $30
         .byte   $e0
         .byte   $00
         .byte   $00
         .byte   $00
         HiAscii "x@@@@x"
         .byte   $00
         .byte   $00
         .byte   $80
         .byte   $40
         .byte   $20
         .byte   $10
         .byte   $08
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $f8
         .byte   $18
         .byte   $18
         .byte   $18
         .byte   $18
         .byte   $f8
         .byte   $00
         .byte   $00
         .byte   $20
         .byte   $50
         .byte   $88
         .res    5,$00
         HiAscii "||||||"
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $08
         .byte   $78
         .byte   $88
         .byte   $78
         .byte   $00
         .byte   $00
         .byte   $80
         .byte   $80
         .byte   $f0
         .byte   $88
         .byte   $88
         .byte   $f0
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $80
         .byte   $88
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $08
         .byte   $08
         .byte   $78
         .byte   $88
         .byte   $88
         .byte   $78
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $f8
         .byte   $80
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $18
         .byte   $20
         .byte   $f8
         .byte   $20
         .byte   $20
         .byte   $20
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $78
         .byte   $08
         .byte   $f0
         .byte   $00
         .byte   $00
         .byte   $80
         .byte   $80
         .byte   $b0
         .byte   $c8
         .byte   $88
         .byte   $88
         .byte   $00
         .byte   $00
         .byte   $20
         .byte   $00
         .byte   "`  p"
         .byte   $00
         .byte   $00
         .byte   $10
         .byte   $00
         .byte   $30
         .byte   $10
         .byte   $90
         .byte   $60
         .byte   $00
         .byte   $00
         .byte   $80
         .byte   $90
         .byte   $a0
         .byte   $c0
         .byte   $a0
         .byte   $90
         .byte   $00
         .byte   $00
         .byte   "`    p"
         .byte   $00
         .byte   $00
         .byte   $00
         HiAscii "P(((("
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $b0
         .byte   $c8
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $f0
         .byte   $88
         .byte   $f0
         .byte   $80
         .byte   $80
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $78
         .byte   $88
         .byte   $78
         .byte   $08
         .byte   $08
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $b0
         .byte   $c0
         .byte   $80
         .byte   $80
         .byte   $80
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $78
         .byte   $80
         .byte   $78
         .byte   $08
         .byte   $f0
         .byte   $00
         .byte   $00
         .byte   $20
         .byte   $20
         .byte   $f8
         .byte   $20
         .byte   $20
         .byte   $38
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $70
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $88
         .byte   $88
         .byte   $50
         .byte   $20
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $88
         .byte   $a8
         .byte   $a8
         .byte   $50
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $50
         .byte   $20
         .byte   $50
         .byte   $88
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $88
         .byte   $88
         .byte   $78
         .byte   $08
         .byte   $f0
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $f8
         .byte   $08
         .byte   $70
         .byte   $80
         .byte   $f8
         .byte   $00
         .byte   $00
         .byte   "    "
         .byte   $00
         .byte   $20
         .byte   $00
         .byte   $00
         .byte   $70
         .byte   $a8
         .byte   $a8
         .byte   $b8
         .byte   $80
         .byte   $78
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $50
         .byte   $f8
         .byte   $50
         .byte   $f8
         .byte   $50
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $78
         .byte   $a0
         .byte   $70
         .byte   $28
         .byte   $f0
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $c8
         .byte   $10
         .byte   $20
         .byte   $40
         .byte   $98
         .res    5,$00
         .byte   $f8
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $40
         .byte   $a0
         .byte   $48
         .byte   $a8
         .byte   $90
         .byte   $68
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $a8

@L474C:  bvs     @L476E

         .byte   $70
         .byte   $a8
         .byte   $00
         .byte   $00
         .byte   $10
         .byte   " @@ "
         .byte   $10
         .byte   $00
         .byte   $00
         .byte   $40
         .byte   $20
         .byte   $10
         .byte   $10
         .byte   $20
         .byte   $40
         .byte   $00
         .byte   $00
         .byte   $60
         .byte   $40
         .byte   $20
         .res    7,$00
         .byte   $40
         .byte   $a8

@L476E:  bpl     @L4770
@L4770:  brk

         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $f8
         .byte   $00
         .byte   $f8
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $20
         .byte   $20
         .byte   $f8
         .byte   $20
         .byte   $20
         .byte   $00
         .byte   $00
         .byte   $60
         .byte   $60
         .byte   $00
         .byte   $60
         .byte   $60
         .byte   $00
         .byte   $00
         .byte   $00
         .byte   $60
         .byte   $60
         .byte   $00
         .byte   $60
         .byte   $20
         .byte   $40
         .byte   $00
         .byte   $00
         .byte   $50
         .byte   $50
         .byte   $50
         .res    5,$00
         .byte   $60
         .byte   $20
         .byte   $40
         .res    5,$00
         .byte   $10
         .byte   $20
         .byte   $c0
         .byte   $20
         .byte   $10
         .res    6,$00
         .byte   $60
         .byte   $20
         .byte   $40
         .byte   $00
         .byte   $00
         .byte   $40
         .byte   $20
         .byte   $18
         .byte   $20
         .byte   $40
         .res    7,$00
         .byte   $60
         .byte   $60
         .byte   $00
         .byte   $00

         bvs     @L474C
         bpl     @L47E6
         brk

         jsr     $0000
         php
         bpl     @L47ED
         rti

         .byte   $80
         .byte   $00
         .byte   $00
         .byte   $01
         .byte   $38
         .byte   $b0
         .byte   $03
         .byte   $4c
         .byte   $32
         .byte   $a1
         .byte   $86
         .byte   $43
         .byte   $c1
         .byte   $c9
         .byte   $03
         .byte   $08
         .byte   $8a
         .byte   $29
         .byte   $70
         .byte   $c4
         .byte   $4a
         .byte   $09
         .byte   $c1
         .byte   $c0

@L47E6:  sta     $49
         ldy     #$c1
         .byte   $ff
         .byte   $84
         .byte   $48

@L47ED:  plp
         cmp     ($c8,x)
         lda     ($48),y
         cmp     ($d0,x)
         dec     A
         bcs     @L4805
         lda     #$03
         sta     $0800
         cmp     ($e6,x)
         and     @L49A5,x
         pha
         lda     #$5b
         pha
@L4805:  rts

         sta     MON_A3L
         sta     $48
         ldy     #$63
         lda     ($48),y
         sta     $0994,y
         cmp     ($c8,x)
         cmp     ($c0,x)
         cmp     ($eb,x)
         cmp     ($d0,x)
         cmp     ($f6,x)
         ldx     #$06
         ldy     $091d,x
         lda     $0924,x
         sta     $f2c1,y
         ora     #$bd
         .byte   $2b
         .byte   $09
         .byte   $9d
         .byte   $7f
         .byte   $0a
         .byte   $c1
         .byte   $ca
         .byte   $10

@L4830:  cmp     ($ee,x)
         lda     #$09
         sta     $49
         lda     #$86
         ldy     #$00
         cmp     ($c9,x)
         cmp     ($f9,x)
         bcs     @L486F
         sta     $48
         sty     $60
         sty     $4a
         sty     $4c
         sty     MON_RNDL
         sty     $47
         cmp     ($c8,x)
         sty     MON_A4L
         cmp     ($c8,x)
         sty     $46
         lda     #$0c
         sta     $61
         sta     $4b
         jsr     $0912
         bcs     @L48C7
         cmp     ($e6,x)
         adc     ($c1,x)
         inc     $61
         cmp     ($e6,x)
         lsr     $a5
         lsr     $c1
         cmp     #$06
         bcc     @L4830
@L486F:  .byte   $ef
         .byte   $ad
         .byte   $00
         .byte   $0c
         .byte   $0d
         .byte   $01
         .byte   $0c
         .byte   $c1
         .byte   $d0
         .byte   $6d
         .byte   $a9
         .byte   $04
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $a5
         .byte   $4a
         .byte   $18
         .byte   $6d
         .byte   $23
         .byte   $0c
         .byte   $a8
         .byte   $90
         .byte   $0d
         .byte   $c1
         .byte   $e6
         .byte   $4b
         .byte   $a5
         .byte   $4b
         .byte   $4a
         .byte   $b0
         .byte   $06
         .byte   $c1
         .byte   $c9
         .byte   $0a
         .byte   $c1
         .byte   $f0
         .byte   $55
         .byte   $a0
         .byte   $04
         .byte   $84
         .byte   $4a
         .byte   $ad
         .byte   $02
         .byte   $09
         .byte   $29
         .byte   $0f
         .byte   $a8
         .byte   $b1
         .byte   $4a
         .byte   $c1
         .byte   $d9
         .byte   $02
         .byte   $09
         HiAscii "APA["
         .byte   $88
         .byte   $10
         .byte   $c1
         .byte   $f6
         .byte   $29
         HiAscii "ApAI"
         .byte   $20
         .byte   $c1
         .byte   $d0
         .byte   $3b
         .byte   $a0
         .byte   $10
         .byte   $b1
         .byte   $4a
         .byte   $c1
         .byte   $c9
         .byte   $c1
         .byte   $ff
         .byte   $c1
         .byte   $d0
         .byte   $33
         .byte   $c1
         .byte   $c8
         .byte   $b1
         .byte   $4a
         .byte   $85
         .byte   $46

@L48C7:  cmp     ($c8,x)
         lda     ($4a),y
         sta     $47
         lda     #$00
         sta     $4a
         ldy     #$1e
         sty     $4b
         sty     $61
         cmp     ($c8,x)
         sty     $4d
         jsr     $0912
         bcs     @L48F7
         cmp     ($e6,x)
         adc     ($c1,x)
         inc     $61
         ldy     MON_RNDL
         cmp     ($e6,x)
         lsr     @L4AB1
         sta     $46
         lda     ($4c),y
         sta     $47
         ora     ($4a),y
         cmp     ($d0,x)
@L48F7:  cmp     ($e7,x)
         jmp     @L2000

         .byte   $4c
         .byte   $03
         .byte   $00
         .byte   $05
         .byte   $c0
         .byte   $fd
         .byte   $00
         .byte   $00
         .byte   $3f
         .byte   $09
         .byte   "&PRODOS"
         .byte   $c9
         .byte   $20
         .byte   $a5
         .byte   $60
         .byte   $85
         .byte   $44
         .byte   $a5
         .byte   $61
         .byte   $85
         .byte   $45
         .byte   $6c
         .byte   $48
         .byte   $00
         .byte   $08
         .byte   $1e
         .byte   "$?EGv"
         HiAscii "AtAWAQ6"
         .byte   $4b
         .byte   $b4
         .byte   $ac
         .byte   $a6
         .byte   $2b
         .byte   $18
         .byte   $60
         .byte   $4c
         .byte   $bc
         .byte   $09
         .byte   $a9
         .byte   $9f
         .byte   $48
         .byte   $a9
         .byte   $c1
         .byte   $ff
         .byte   $48
         .byte   $a9
         .byte   $01
         .byte   $a2
         .byte   $00
         .byte   $4c
         .byte   $79
         .byte   $c1
         .byte   $f4
         .byte   $20
         .byte   $58
         .byte   $c1
         .byte   $fc
         .byte   $a0
         .byte   $1c
         .byte   $b9
         .byte   $50
         .byte   $09
         .byte   $99
         .byte   $ae
         .byte   $05
         .byte   $88
         .byte   $10
         .byte   $c1
         .byte   $f7
         .byte   $4c
         .byte   $4d
         .byte   $09
         .byte   $c3
         .byte   $aa
         .byte   $a0
         .byte   $c1
         .byte   $d5
         .byte   $c1
         .byte   $ce
         .byte   $c1
         .byte   $c1
         .byte   $c1
         .byte   $c2
         .byte   $c1
         .byte   $cc
         .byte   $c1
         .byte   $c5
         .byte   $a0
         .byte   $c1
         .byte   $d4
         .byte   $c1
         .byte   $cf
         .byte   $a0
         .byte   $c1
         .byte   $cc
         .byte   $c1
         .byte   $cf
         .byte   $c1
         .byte   $c1
         .byte   $c1
         .byte   $c4
         .byte   $a0
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $d2
         .byte   $c1
         .byte   $cf
         .byte   $c1
         .byte   $c4
         .byte   $c1
         .byte   $cf
         .byte   $c1
         .byte   $d3
         .byte   $a0
         .byte   $c3
         .byte   $aa
         .byte   $a5
         .byte   $53
         .byte   $29
         .byte   $03
         .byte   $2a
         .byte   $05
         .byte   $2b
         .byte   $aa
         .byte   $bd
         .byte   $80
         .byte   $c1
         .byte   $c0
         .byte   $a9
         .byte   $2c
         .byte   $a2
         .byte   $11
         .byte   $c1
         .byte   $ca
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fd
         .byte   $c1
         .byte   $e9
         .byte   $01
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f7
         .byte   $a6
         .byte   $2b
         .byte   $60
         .byte   $a5
         .byte   $46
         .byte   $29
         .byte   $07
@L49A5:  .byte   $c1
         .byte   $c9
         .byte   $04
         .byte   $29
         .byte   $03
         .byte   $08
         .byte   $0a
         .byte   $28
         .byte   $2a
         .byte   $85
         .byte   $3d
         .byte   $a5
         .byte   $47
         .byte   $4a
         .byte   $a5
         .byte   $46
         .byte   $6a
         .byte   $c2
         .byte   $4a
         .byte   $85
         .byte   $41
         .byte   $0a
         .byte   $85
         .byte   $51
         .byte   $a5
         .byte   $45
         .byte   $85
         .byte   $27
         .byte   $a6
         .byte   $2b
         .byte   $bd
         .byte   $89
         .byte   $c1
         .byte   $c0
         .byte   $20
         .byte   $bc
         .byte   $09
         .byte   $c1
         .byte   $e6
         .byte   $27
         .byte   $c1
         .byte   $e6
         .byte   $3d
         .byte   $c1
         .byte   $e6
         .byte   $3d
         .byte   $b0
         .byte   $03
         .byte   $20
         .byte   $bc
         .byte   $09
         .byte   $bc
         .byte   $88
         .byte   $c1
         .byte   $c0
         .byte   $60
         .byte   $a5
         .byte   $41
         .byte   $c4
         .byte   $4a
         .byte   $9d
         .byte   $82
         .byte   $c1
         .byte   $c0
         .byte   $a5
         .byte   $3d
         .byte   $85
         .byte   $53
         .byte   $29
         .byte   $0f
         .byte   $85
         .byte   $53
         .byte   $a5
         .byte   $41
         .byte   $c4
         .byte   $0a
         .byte   $05
         .byte   $53
         .byte   $9d
         .byte   $81
         .byte   $c1
         .byte   $c0
         .byte   $a9
         .byte   $00
         .byte   $9d
         .byte   $80
         .byte   $c1
         .byte   $c0
         .byte   $9d
         .byte   $83
         HiAscii "A@Ap"
         .byte   $00
         .byte   $a0
         .byte   $00
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $91
         .byte   $26
         HiAscii "AHAPAx"
         .byte   $18
         .byte   $60
         .byte   $08
         .byte   $28
         .byte   $38
         .byte   $18
         .byte   $08
         .byte   $88
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $c0
         .byte   $09
         .byte   $01
         .byte   $00
         .byte   $4c
         .byte   $6e
         .byte   $a0
         .byte   "SOS B"
         .byte   $c2
         .byte   $4f
         .byte   $54
         .byte   $c2
         .byte   " 1.1 ",$0a,"SOS.KERNEL"
         .byte   $c5
         .byte   " SOS KRNLI/O E"
         .byte   'B' | $80
         .byte   "ROR"
         .byte   $08
         .byte   $00
         .byte   "FILE 'SOS.KERNEL' NOT FOUND%"
         .byte   $00
         .byte   "INVALID KERNEL FILE:"
         .byte   $c2
         .byte   $00
         .byte   $0c
         .byte   $00
         .byte   $1e
         .byte   $0e
         .byte   $1e
         .byte   $04
         .byte   $a4
         .byte   $78
         .byte   $c1
         .byte   $d8
         .byte   $a9
         .byte   $77
         .byte   $8d,$c1,$df,$c1
         .byte   $ff
         .byte   $a2
         .byte   $c1
         .byte   $fb
         .byte   $9a
         .byte   $2c
         .byte   $10
         .byte   $c1
         .byte   $c0
         .byte   $a9
         .byte   $40
         .byte   $8d,$c1,$ca,$c1
         .byte   $ff
         .byte   $a9
         .byte   $07
         .byte   $8d,$c1,$ef,$c1
         .byte   $ff
         .byte   $a2
         .byte   $00
         .byte   $c1
         .byte   $ce
@L4AB1:  .byte   $c1
         .byte   $ef
         .byte   $c1
         .byte   $ff
         .byte   $8e
         .byte   $00

         jsr     $00ad
         jsr     $d0c1
         cmp     ($f5,x)
         lda     #$01
         sta     $c1
         cpx     #$a9
         brk

         sta     $c1
         sbc     ($a9,x)
         brk

         .byte   $c2
         .byte   $85
         .byte   $a9
         .byte   $a2
         .byte   $85
         .byte   $86
         .byte   $20
         HiAscii ">!AfA`)"
         .byte   $00
         .byte   $85
         .byte   $c2
         .byte   $e6
         .byte   $86
         .byte   $c1
         .byte   $e6
         .byte   $86
         .byte   $c2
         .byte   $e6
         .byte   $20
         .byte   $be
         .byte   $a1
         .byte   $a0
         .byte   $02
         .byte   $b1
         .byte   $c2
         .byte   $85
         HiAscii "A`AH1B"
         .byte   $85
         HiAscii "AaAPAj%A`APAf-"
         .byte   $6c
         .byte   $a0
         .byte   $85
         .byte   $c1
         .byte   $e2
         .byte   $ad
         .byte   $6d
         .byte   $a0
         .byte   $85
         .byte   $c1
         .byte   $e3
         .byte   $18
         .byte   $a5
         .byte   $c1
         .byte   $e3
         .byte   $69
         .byte   $02
         .byte   $85
         .byte   $c1
         .byte   $e5
         .byte   $38
         HiAscii "%AbAm"
         .byte   $23
         .byte   $a4
         .byte   $85
         HiAscii "Ad%AeAi"
         .byte   $00
         .byte   $85
         .byte   $c1
         .byte   $e5
         .byte   $a0
         .byte   $00
         .byte   $b1
         .byte   $c1
         .byte   $e2
         .byte   $29
         .byte   $0f
         .byte   $c1
         .byte   $cd
         .byte   $11
         .byte   $a0
         .byte   $c1
         .byte   $d0
         .byte   $21
         HiAscii "(1AbAY"
         .byte   $11
         .byte   $a0
         .byte   $c1
         .byte   $d0
         .byte   $19
         .byte   $88
         HiAscii "APAv "
         .byte   $00
         .byte   $b1
         .byte   $c1
         .byte   $e2
         .byte   $29
         .byte   $c1
         .byte   $f0
         .byte   $04
         .byte   $c0
         .byte   $ff
         .byte   $00
         .byte   $00
         .byte   $c1
         .byte   $c9
         .byte   $20
         .byte   $c1
         .byte   $f0
         .byte   $3e
         HiAscii "AIBp"
         .byte   $08
         .byte   $ae
         .byte   $64
         .byte   $c2
         .byte   $a0
         .byte   $13
         .byte   $4c
         .byte   $c1
         .byte   $d4
         .byte   $a1
         .byte   $18
         .byte   $a5
         .byte   $c1
         .byte   $e2
         .byte   $6d
         .byte   $23
         .byte   $a4
         .byte   $85
         HiAscii "Ab%Ac"
         .byte   $69
         .byte   $00
         .byte   $85
         HiAscii "Ac%AdAEAb%BeAc0<"
         .byte   $18
         .byte   $a5
         .byte   $c1
         .byte   $e4
         .byte   $6d
         .byte   $23
         .byte   $a4
         .byte   $85
         HiAscii "Ab%Ae"
         .byte   $69
         .byte   $00
         .byte   $85
         HiAscii "AcAFAfAP"
         .byte   $95
         .byte   $ae
         .byte   $4f
         .byte   $c2
         .byte   $a0
         .byte   $1b
         .byte   $4c
         HiAscii "AT! "
         .byte   $11
         .byte   $b1
         .byte   $c1
         .byte   $e2
         .byte   $85
         HiAscii "A`AH1Ab"
         .byte   $85
         .byte   $c1
         .byte   $e1
         .byte   $ad
         .byte   $66
         .byte   $a0
         .byte   $c2
         .byte   $85
         .byte   $ad
         .byte   $67
         .byte   $a0
         .byte   $85
         .byte   $86
         .byte   $20
         .byte   $be
         .byte   $a1
         .byte   $ad
         .byte   $68
         .byte   $a0
         .byte   $c2
         .byte   $85
         .byte   $ad
         .byte   $69
         .byte   $a0
         .byte   $85
         .byte   $86
         .byte   $ad
         .byte   $00
         .byte   $0c
         .byte   $85
         .byte   $c1
         .byte   $e0
         .byte   $ad
         .byte   $00
         .byte   $0d
         .byte   $85
         .byte   $c1
         .byte   $e1
         .byte   $20
         .byte   $be
         .byte   $a1
         .byte   $a2
         .byte   $07
         .byte   $bd
         .byte   $00
         .byte   $1e
         .byte   $c1
         .byte   $dd
         .byte   $21
         .byte   $a0
         .byte   $c1
         .byte   $f0
         .byte   $08
         .byte   $ae
         .byte   $64
         .byte   $c2
         .byte   $a0
         .byte   $13
         .byte   $4c
         HiAscii "AT!AJ"
         .byte   $10
         .byte   $c1
         .byte   $ed
         .byte   $a9
         .byte   $00
         .byte   $85
         HiAscii "AgAfAgAf"
         .byte   $86
         .byte   $c1
         .byte   $e6
         .byte   $86
         HiAscii "&Ag="
         .byte   $00
         .byte   $0c
         .byte   $85
         .byte   $c1
         .byte   $e0
         .byte   $bd
         .byte   $00
         .byte   $0d
         .byte   $85
         HiAscii "Aa%A`AP"
         .byte   $04
         HiAscii "%AaAp"
         .byte   $06
         .byte   $20
         .byte   $be
         .byte   $a1
         .byte   $4c
         .byte   $8a
         .byte   $a1
         .byte   $18
         .byte   $ad
         .byte   $6a
         .byte   $a0
         .byte   $6d
         .byte   $08
         .byte   $1e
         .byte   $85
         .byte   $c1
         .byte   $e8
         .byte   $ad
         .byte   $6b
         .byte   $a0
         .byte   $6d
         .byte   $09
         .byte   $1e
         .byte   $85
         .byte   $c1
         .byte   $e9
         .byte   $6c
         .byte   $c1
         .byte   $e8
         .byte   $00
         .byte   $a9
         .byte   $01
         .byte   $85
         .byte   $87,$a5,$c1,$e0,$a6,$c1,$e1
         .byte   $20
         .byte   $79
         .byte   $c1
         .byte   $f4
         .byte   $b0
         .byte   $01
         .byte   $60
         .byte   $ae
         .byte   $32
         .byte   $c2
         .byte   $a0
         .byte   $09
         .byte   $4c
         .byte   $c1
         .byte   $d4
         .byte   $a1
         .byte   $84
         .byte   $c1
         .byte   $e7
         .byte   $38
         .byte   $a9
         .byte   $28
         HiAscii "AeAg"
         .byte   $4a
         .byte   $18
         .byte   $65
         HiAscii "Ag(="
         .byte   $29
         .byte   $a0
         .byte   $99
         .byte   $a7
         .byte   $05
         .byte   $c1
         .byte   $ca
         .byte   $88
         HiAscii "AFAgAPAt-"
         .byte   $40
         .byte   $c1
         .byte   $c0
         .byte   $4c
         HiAscii "Ao!@"
         .byte   $10
         .byte   $01
         .byte   $00
         .byte   $03
         .byte   $00
         .byte   $c1
         .byte   $f1
         .byte   $41
         .byte   $da
         .byte   $00
         .byte   $23
         .byte   $00
         .byte   $c1
         .byte   $c3
         .byte   $27
         .byte   $0d
         .byte   $c2
         .byte   $00
         .byte   $06
         .byte   $c2
         .byte   $00
         .byte   $01
         .byte   $c0
         .byte   $d5
         .byte   $00
         .byte   $00
         .byte   $01
         .byte   $df
         .byte   $ff
         .byte   $c0
         .byte   $e0
         .byte   $02
         .byte   $00
         .byte   $02
         .byte   $00
         .byte   $04
         .byte   $c0
         .byte   $fd
         .byte   $f3
         .byte   $00
         .byte   $c0
         .byte   $ff
         .byte   $ff
         .byte   $00
         .byte   $00
         .byte   $01
         .byte   $a5
         .byte   $27
         .byte   $c1
         .byte   $c9
         .byte   $09
         .byte   $c1
         .byte   $d0
         .byte   $18
         .byte   $a5
         .byte   $2b
         .byte   $c4
         .byte   $4a
         .byte   $09
         .byte   $c1
         .byte   $c0
         .byte   $85
         .byte   $3f
         .byte   $a9
         .byte   $5c
         .byte   $85
         .byte   $3e
         .byte   $18
         .byte   $ad
         .byte   $c1
         .byte   $fe
         .byte   $08
         .byte   $6d
         .byte   $c1
         .byte   $ff
         .byte   $08
         .byte   $8d
         .byte   $c1
         .byte   $fe
         .byte   $08
         .byte   $ae
         .byte   $c1
         .byte   $ff
         .byte   $08
         .byte   $30
         .byte   $15
         .byte   $bd
         .byte   $4d
         .byte   $08
         .byte   $85
         .byte   $3d
         .byte   $c1
         .byte   $ce
         .byte   $c1
         .byte   $ff
         .byte   $08
         .byte   $ad
         .byte   $c1
         .byte   $fe
         .byte   $08
         .byte   $85
         .byte   $27
         HiAscii "ANA~"
         .byte   $08
         .byte   $a6
         .byte   $2b
         .byte   $6c
         .byte   $3e
         .byte   $00
         HiAscii "AnA~"
         .byte   $08
         HiAscii "AnA~"
         .byte   $08
         .byte   $20
         .byte   $89
         .byte   $c1
         .byte   $fe
         .byte   $20
         .byte   $93
         .byte   $c1
         .byte   $fe
         .byte   $20
         .byte   $2f
         .byte   $c1
         .byte   $fb
         .byte   $a6
         .byte   $2b
         .byte   $6c
         .byte   $c1
         .byte   $fd
         .byte   $08
         .byte   $00
         .byte   $0d
         .byte   $0b
         .byte   $09
         .byte   $07
         .byte   $05
         .byte   $03
         .byte   $01
         .byte   $0e
         .byte   $0c
         .byte   $0a
         .byte   $08
         .byte   $06
         .byte   $04
         .byte   $02
         .byte   $0f
         .byte   $00
         .byte   $20
         .byte   $64
         .byte   $a7
         .byte   $b0
         .byte   $08
         .byte   $a9
         .byte   $00
         .byte   $a8
         .byte   $8d
         .byte   $5d
         .byte   $b6
         .byte   $91
         .byte   $40
         HiAscii "-AE5"
         .byte   $4c
         HiAscii "AR&-"
         .byte   $5d
         .byte   $b6
         .byte   $c1
         .byte   $f0
         .byte   $08
         HiAscii "An=5AP"
         .byte   $03
         HiAscii "An>5)"
         .byte   $00
         .byte   $8d
         .byte   $5d
         .byte   $b6
         .byte   $4c
         .byte   $46
         .byte   $a5,$8d,$bc,$b5
         .byte   $20
         .byte   $a8
         .byte   $a6
         .byte   $20
         .byte   $c1
         .byte   $ea
         .byte   $a2
         .byte   $4c
         .byte   $7d
         .byte   $a2
         .byte   $a0
         .byte   $13
         .byte   $b1
         .byte   $42
         .byte   $c1
         .byte   $d0
         .byte   $14
         HiAscii "AHA@"
         .byte   $17
         HiAscii "APAw "
         .byte   $19
         .byte   $b1
         .byte   $42
         .byte   $99
         HiAscii "$5AHA@"
         .byte   $1d
         HiAscii "APAv"
         .byte   $4c
         .byte   $bc,$a6,$a2,$c1
         .byte   $ff
         .byte   $8e
         .byte   $5d
         HiAscii "6APAv]"
         .byte   $00
         .byte   $20
         .byte   $58
         HiAscii "A|)AB"
         .byte   $20
         HiAscii "AmA})"
         .byte   $01
         .byte   $20
         HiAscii "AZA})-"
         .byte   $20
         HiAscii "AmA})"
         .byte   $00
         .byte   $20
         HiAscii "AZA}"
         .byte   $60
         .byte   $d6
         .byte   $00
         .byte   $b6
         .byte   $09
         .byte   $84
         .byte   $48
         .byte   $85
         .byte   $49
         .byte   $a0
         .byte   $02
         .byte   $8c
         .byte   $c1
         .byte   $f8
         .byte   $06
         .byte   $a0
         .byte   $04
         .byte   $8c
         .byte   $c1
         .byte   $f8
         .byte   $04
         .byte   $a0
         .byte   $01
         .byte   $b1
         .byte   $48
         .byte   $aa
         .byte   $c1
         .byte   $d0
         .byte   $1f
         .byte   $c1
         .byte   $d1
         .byte   $48
         .byte   $c1
         .byte   $f0
         .byte   $1b
         .byte   $8a
         .byte   $48
         .byte   $b1
         .byte   $48
         .byte   $aa
         .byte   $68
         .byte   $48
         .byte   $91
         .byte   $48
         .byte   $bd
         .byte   $8e
         .byte   $c1
         .byte   $c0
         .byte   $a0
         .byte   $08
         .byte   $bd
         .byte   $8c
         HiAscii "A@A]"
         .byte   $8c
         HiAscii "A@APAv"
         .byte   $88
         HiAscii "APAx"
         .byte   $68
         .byte   $aa
         .byte   $bd
         .byte   $8e
         .byte   $c1,$c0,$8a,$c1,$d0
         .byte   $0c
         .byte   $a0
         .byte   $08
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   "HhHh"
         .byte   $c1
         .byte   $dd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $8e
         .byte   $c1
         .byte   $f8
         .byte   $05
         .byte   $c1
         .byte   $d0
         .byte   $03
         .byte   $88
         .byte   $c2
         .byte   $ea
         .byte   $08
         .byte   $bd
         .byte   $89
         .byte   $c1
         .byte   $c0
         .byte   $a0
         .byte   $06
         .byte   $b1
         .byte   $48
         .byte   $99
         .byte   $36
         .byte   $00
         HiAscii "AHA@"
         .byte   $0a
         HiAscii "APAv "
         .byte   $03
         .byte   $b1
         .byte   $3c
         .byte   $85
         .byte   $47
         .byte   $a0
         .byte   $02
         .byte   $b1
         .byte   $48
         .byte   $a0
         .byte   $10
         .byte   $c1
         .byte   $d1
         .byte   $48
         .byte   $c1
         .byte   $f0
         .byte   $06
         .byte   $91
         .byte   $48
         .byte   $28
         .byte   $a0
         .byte   $00
         .byte   $08
         .byte   $6a
         .byte   $90
         .byte   $05
         .byte   $bd,$8a,$c1,$c0,$b0
         .byte   $03
         .byte   $bd
         .byte   $8b
         .byte   $c1
         .byte   $c0
         .byte   $66
         .byte   $35
         .byte   $28
         .byte   $08
         .byte   $c1
         .byte   $d0
         .byte   $0b
         .byte   $a0
         .byte   $07
         .byte   $20
         .byte   $00
         .byte   $ba
         .byte   $88
         HiAscii "APAz.Ax"
         .byte   $05
         .byte   $a0
         .byte   $04
         .byte   $b1
         .byte   $48
         .byte   $20
         .byte   $5a
         .byte   $be
         .byte   $28
         .byte   $c1
         .byte   $d0
         .byte   $11
         .byte   $a4
         .byte   $47
         .byte   $10
         .byte   $0d
         HiAscii "EjAf"
         .byte   $46
         HiAscii "APAwAf"
         .byte   $47
         HiAscii "APAs "
         .byte   $0c
         .byte   $b1
         .byte   $48
         .byte   $c1
         .byte   $f0
         .byte   $5a
         .byte   $c1
         .byte   $c9
         .byte   $04
         .byte   $c1
         .byte   $f0
         .byte   $58
         .byte   $6a
         .byte   $08
         .byte   $b0
         .byte   $03
         .byte   $20
         .byte   $00
         .byte   $b8
         .byte   $a0
         .byte   $30
         .byte   $8c
         .byte   $78
         .byte   $05
         .byte   $ae
         .byte   $c1
         .byte   $f8
         .byte   $05
         .byte   $20
         .byte   $44
         .byte   $b9
         .byte   $90
         .byte   $24
         .byte   $c1
         .byte   $ce
         .byte   $78
         .byte   $05
         .byte   $10
         .byte   $c1
         .byte   $f3
         .byte   $ad
         .byte   $78
         .byte   $04
         .byte   $48
         .byte   $a9
         .byte   $60
         .byte   $20
         .byte   $95
         HiAscii ">ANAx"
         .byte   $06
         .byte   $c1
         .byte   $f0
         .byte   $28
         .byte   $a9
         .byte   $04
         .byte   $8d
         .byte   $c1
         .byte   $f8
         .byte   $04
         .byte   $a9
         .byte   $00
         .byte   $20
         .byte   $5a
         .byte   $be
         .byte   $68
         .byte   $20
         .byte   $5a
         .byte   $be
         .byte   $4c
         .byte   $bc
         .byte   $bd
         .byte   $a4
         .byte   $2e
         .byte   $c1
         .byte   $cc
         .byte   $78
         .byte   $04
         .byte   $c1
         .byte   $f0
         .byte   $1c
         .byte   $20
         .byte   $b2
         .byte   $b9
         .byte   $4c
         .byte   $10
         .byte   $be
         .byte   $48
         .byte   $98
         .byte   $68
         HiAscii "ANAx"
         .byte   $04
         .byte   $a2
         .byte   $02
         .byte   $8e
         .byte   $52
         HiAscii "*AM2*AP"
         .byte   $19
         .byte   $c1
         .byte   $ca
         .byte   $8e
         .byte   $52
         .byte   $aa
         .byte   $c1
         .byte   $ca
         .byte   $8e
         .byte   $5d
         .byte   $aa
         .byte   $ae
         .byte   $5d
         .byte   $aa
         .byte   $9d
         .byte   $00
         .byte   $02
         .byte   $c1
         .byte   $e8
         .byte   $8e
         .byte   $5d
         .byte   $aa,$c1,$c9,$8d,$c1,$d0
         .byte   $75
         .byte   $4c
         .byte   $c1
         .byte   $cd
         .byte   $9f
         .byte   $c1,$c9,$8d,$c1,$d0
         .byte   $7d
         .byte   $a2
         .byte   $00
         .byte   $8e
         .byte   $52
         .byte   $aa
         .byte   $4c
         .byte   $a4
         .byte   $9f
         .byte   $a2
         .byte   $00
         .byte   $8e
         .byte   $52
         .byte   $aa,$c1,$c9,$8d,$c1,$f0
         .byte   $07
         HiAscii "-3*Ap"
         .byte   $67
         .byte   $c1
         .byte   $d0
         .byte   $5e
         .byte   $48
         .byte   $38
         HiAscii "-3*AP"
         .byte   $03
         .byte   $20
         .byte   $5e
         .byte   $a6
         .byte   $68
         .byte   $90
         .byte   $c1
         .byte   $ec
         .byte   $ae
         .byte   $5a
         .byte   $aa
         .byte   $4c
         .byte   $15
         .byte   $9f
         .byte   $c1,$c9,$8d,$c1,$d0
         .byte   $05
         .byte   $a9
         .byte   $05
         .byte   $8d
         .byte   $52
         .byte   $aa
         .byte   $20
         .byte   $0e
         .byte   $a6
         .byte   $4c
         .byte   $99
         .byte   $9f
         HiAscii "AM2*Ap"
         .byte   $85
         .byte   $c1,$c9,$8a,$c1,$f0,$c1,$f1,$a2
         .byte   $04
         .byte   $8e
         .byte   $52
         HiAscii "*APAa)"
         .byte   $00
         .byte   $8d
         .byte   $52
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $25
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $b7
         .byte   $aa
         .byte   $20
         .byte   $51
         .byte   $a8
         .byte   $4c
         HiAscii "A\$-"
         .byte   $00
         .byte   $02
         HiAscii "AM2*Ap"
         .byte   $0a
         .byte   $a9
         .byte   $c2
         .byte   $8d
         .byte   $00
         .byte   $02
         .byte   $a2
         .byte   $00
         .byte   $8e
         .byte   $5a
         .byte   $aa
         .byte   $a9
         .byte   $40
         .byte   $c1
         .byte   $d0
         .byte   $06
         .byte   $a9
         .byte   $10
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $a9
         .byte   $20
         .byte   $2d
         .byte   $5e
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $0f
         .byte   $20
         .byte   $ba
         .byte   $9f
         .byte   $20
         .byte   $c1
         .byte   $c5
         .byte   $9f
         .byte   $8d
         .byte   $5c
         .byte   $aa
         .byte   $8c
         .byte   $5b
         .byte   $aa
         .byte   $8e
         .byte   $5a
         .byte   $aa
         .byte   $20
         .byte   $51
         .byte   $a8
         .byte   $ae
         .byte   $59
         .byte   $aa
         .byte   $9a
         .byte   $ad
         .byte   $5c
         .byte   $aa
         .byte   $ac
         .byte   $5b
         .byte   $aa
         .byte   $ae
         .byte   $5a
         .byte   $aa
         .byte   "8`l6"
         .byte   $00
         .byte   $a9
         .byte   $8d
         .byte   $4c
         .byte   $c1
         .byte   $c5
         .byte   $9f
         .byte   $a0
         .byte   $c1
         .byte   $ff
         .byte   $8c
         .byte   $5f
         .byte   $aa
         .byte   $c1
         .byte   $c8
         .byte   $8c
         .byte   $62
         .byte   $aa
         .byte   $c1
         .byte   $ee
         .byte   $5f
         .byte   $aa
         .byte   $a2
         .byte   $00
         .byte   $08
         .byte   $bd
         .byte   $00
         .byte   $02
         HiAscii "AM2*AP"
         .byte   $01
         .byte   $c1
         .byte   $e8
         .byte   $8e
         .byte   $5d
         .byte   $aa
         .byte   $20
         .byte   $a4
         .byte   $a1
         .byte   $29
         .byte   $7f
         .byte   $59
         .byte   $84
         .byte   $a8
         .byte   $c1
         .byte   $c8
         .byte   $0a
         .byte   $c1
         .byte   $f0
         .byte   $02
         .byte   $68
         .byte   $08
         .byte   $90
         .byte   $c1
         .byte   $f0
         .byte   $28
         .byte   $c1
         .byte   $f0
         .byte   $20
         .byte   $b9
         .byte   $84
         HiAscii "(APAV"
         .byte   $10
         .byte   $a1
         .byte   $45
         .byte   $28
         .byte   $21
         .byte   $82
         .byte   $80
         .byte   $38
         .byte   $62
         .byte   $59
         .byte   $0b
         .byte   $c1
         .byte   $c5
         .byte   $0b
         .byte   $24
         .byte   $21
         .byte   $9c
         .byte   $88
         .byte   $00
         .byte   $48
         .byte   $28
         .byte   $2b
         .byte   $10
         .byte   $00
         .byte   $03
         .byte   $0c
         .byte   $a9
         .byte   $01
         .byte   $10
         .byte   $01
         .byte   $00
         .byte   $88
         .byte   $22
         .byte   $40
         .byte   $a0
         .byte   $48
         .byte   $09
         .byte   $01
         .byte   $08
         .byte   "!D)",$22
         .byte   $08
         .byte   $a0
         .byte   $45
         .byte   $06
         .byte   $c1,$e4,$8a,$c1,$c4
         .byte   $06
         .byte   $16
         .byte   $60
         .byte   $80
         .byte   $a0
         .byte   $09
         .byte   $40
         .byte   $18
         .byte   $0a
         .byte   $24
         .byte   $0a
         .byte   $16
         .byte   $b0
         .byte   $43
         .byte   $00
         .byte   $20
         .byte   $bb
         .byte   $00
         .byte   $14
         .byte   $08
         .byte   $a0
         .byte   $60
         .byte   $0a
         .byte   $c1
         .byte   $c0
         .byte   $8f
         .byte   $0a
         .byte   $83
         .byte   $c1
         .byte   $ca
         .byte   $11
         .byte   $44
         .byte   $08
         .byte   "Q",$0a," &J"
         .byte   $80
         .byte   $38
         .byte   $bd,$8d,$c1,$c0,$bd
         .byte   $8e
         .byte   $c1
         .byte   $c0
         .byte   $30
         .byte   $5e
         .byte   $a9
         .byte   $c1
         .byte   $ff
         .byte   $9d
         .byte   $8f
         HiAscii "A@A]"
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $48
         .byte   $68
         .byte   $20
         .byte   $c1
         .byte   $c3
         .byte   $bc
         .byte   $20
         .byte   $c1
         .byte   $c3
         .byte   $bc
         .byte   $9d
         .byte   $8d,$c1,$c0,$c1,$dd
         .byte   $8c
         HiAscii "A@Aj"
         .byte   $88
         HiAscii "APAp)AU"
         .byte   $20
         HiAscii "AU<)*"
         .byte   $20
         HiAscii "AU<)"
         .byte   $96
         .byte   $20
         HiAscii "AU<%"
         .byte   $41
         .byte   $20
         HiAscii "AD<%"
         .byte   $44
         .byte   $20
         HiAscii "AD<%"
         .byte   $3f
         .byte   $20
         HiAscii "AD<%"
         .byte   "AEDE?HJ"
         .byte   $05
         .byte   $3e
         .byte   $9d
         .byte   $8d,$c1,$c0,$bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $68
         .byte   $09
         .byte   $aa
         .byte   $20
         HiAscii "AT<)A^"
         .byte   $20
         HiAscii "AU<)*"
         .byte   $20
         HiAscii "AU<)Ak"
         .byte   $20
         .byte   $c1
         .byte   $d5
         .byte   $bc
         .byte   $18
         .byte   $bd
         .byte   $8e
         .byte   $c1
         .byte   $c0
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $60
         .byte   $48
         .byte   $4a
         .byte   $05
         .byte   $3e
         .byte   $9d
         .byte   $8d,$c1,$c0,$c1,$dd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $68
         .byte   $c3
         .byte   $ea
         .byte   $09
         .byte   $aa
         .byte   $c2
         .byte   $ea
         .byte   $48
         .byte   $68
         .byte   $9d
         .byte   $8d,$c1,$c0,$c1,$dd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $60
         .byte   $88
         .byte   $a5
         .byte   $c1
         .byte   $e8
         .byte   $91
         .byte   $a0
         .byte   $94
         .byte   $88
         .byte   $96
         .byte   $c1
         .byte   $e8
         .byte   $91
         .byte   $a0
         .byte   $94
         .byte   $88
         .byte   $96
         .byte   $c2
         .byte   $91
         .byte   $c1
         .byte   $c8
         .byte   $94
         .byte   $c1
         .byte   $d0
         .byte   $96
         .byte   $c2
         .byte   $91
         .byte   $c1
         .byte   $c8
         .byte   $94
         .byte   $c1
         .byte   $d0
         .byte   $96
         .byte   $91
         HiAscii "#AH %"
         .byte   $85
         .byte   $a4
         .byte   $9d
         .byte   $75
         .byte   $aa
         .byte   $c1
         .byte   $ca
         .byte   $10
         .byte   $c1,$f7,$ad,$b1,$aa,$8d
         .byte   $57
         .byte   $aa
         .byte   $20
         HiAscii "AT'-3*Ap"
         .byte   $09
         .byte   $48
         .byte   $20
         .byte   $9d
         .byte   $a6
         .byte   $68
         .byte   $a0
         .byte   $00
         .byte   $91
         .byte   $40
         .byte   $20
         .byte   $5b
         .byte   $a7
         .byte   $ad
         .byte   $5f
         .byte   $aa
         .byte   $c1
         .byte   $d0
         .byte   $20
         .byte   $a2
         .byte   $2f
         .byte   $bd
         .byte   $51
         .byte   $9e
         .byte   $9d
         .byte   $c1
         .byte   $d0
         .byte   $03
         .byte   $c1
         .byte   $ca
         .byte   $10
         .byte   $c1
         .byte   $f7
         .byte   $ad
         .byte   $53
         .byte   $9e
         .byte   $8d
         .byte   $c1
         .byte   $f3
         .byte   $03
         .byte   $49
         .byte   $a5,$8d,$c1,$f4
         .byte   $03
         .byte   $ad
         .byte   $52
         .byte   $9e
         .byte   $8d
         .byte   $c1
         .byte   $f2
         .byte   $03
         .byte   $a9
         .byte   $06
         .byte   $c1
         .byte   $d0
         .byte   $05
         .byte   $ad
         .byte   $62
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $06
         .byte   $8d
         .byte   $5f
         .byte   $aa
         .byte   $4c
         .byte   $80
         .byte   $a1
         .byte   $60
         .byte   $4c
         .byte   $bf
         .byte   $9d
         .byte   $4c
         .byte   $84
         .byte   $9d
         .byte   $4c
         .byte   $c1
         .byte   $fd
         .byte   $aa
         .byte   $4c
         .byte   $b5
         .byte   $b7
         .byte   $ad
         .byte   $0f
         .byte   $9d
         .byte   $ac
         .byte   $0e
         .byte   $9d
         .byte   $60
         HiAscii "-AB*,AA*"
         .byte   $60
         .byte   $4c
         .byte   $51
         .byte   $a8
         .byte   $c2
         .byte   $ea
         .byte   $4c
         .byte   $59
         .byte   $c1
         .byte   $fa
         .byte   $4c
         .byte   $65
         .byte   $c1
         .byte   $ff
         .byte   $4c
         .byte   $58
         .byte   $c1
         .byte   $ff
         .byte   $4c
         .byte   $65
         .byte   $c1
         .byte   $ff
         .byte   $4c
         .byte   $65
         .byte   $c1
         .byte   $ff
         .byte   $65
         .byte   $c1
         .byte   $ff
         .byte   $20
         .byte   $c1
         .byte   $d1
         .byte   $9e
         .byte   $ad
         .byte   $51
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $15
         .byte   $48
         .byte   $ad
         .byte   $5c
         .byte   $aa
         .byte   $91
         .byte   $28
         .byte   $68
         .byte   $30
         .byte   $03
         .byte   $4c
         .byte   $26
         .byte   $a6
         .byte   $20
         .byte   $c1
         .byte   $ea
         .byte   $9d
         .byte   $a4
         .byte   $24
         .byte   $a9
         .byte   $60
         .byte   $91
         .byte   $28
         HiAscii "-3*Ap"
         .byte   $03
         .byte   $20
         .byte   $82
         .byte   $a6
         .byte   $a9
         .byte   $03
         .byte   $8d
         .byte   $52
         .byte   $aa
         .byte   $20
         .byte   $ba
         .byte   $9f
         .byte   $20
         .byte   $ba
         .byte   $9e
         .byte   $8d
         .byte   $5c
         .byte   $aa
         .byte   $8e
         .byte   $5a
         .byte   $aa
         .byte   $4c
         .byte   $b3
         .byte   $9f
         .byte   $6c
         .byte   $38
         .byte   $00
         .byte   $20
         .byte   $c1
         .byte   $d1
         .byte   $9e
         .byte   $ad
         .byte   $52
         .byte   $aa
         .byte   $0a
         .byte   $aa
         .byte   $bd
         .byte   $11
         .byte   $9d
         .byte   $48
         .byte   $bd
         .byte   $10
         .byte   $9d
         .byte   $48
         .byte   $ad
         .byte   $5c
         .byte   $aa
         .byte   $60
         .byte   $8d
         .byte   $5c
         .byte   $aa
         .byte   $8e
         .byte   $5a
         .byte   $aa
         .byte   $8c
         .byte   $5b
         HiAscii "*:Bh"
         .byte   $8e
         .byte   $59
         .byte   $aa
         .byte   $a2
         .byte   $03
         .byte   $bd
         .byte   $53
         .byte   $aa
         .byte   $95
         .byte   $36
         .byte   $c1
         .byte   $ca
         .byte   $10
         .byte   $c1
         .byte   $f8
         .byte   $60
         HiAscii ".7*Ap"
         .byte   $03
         .byte   $4c
         .byte   $78
         .byte   $9f
         .byte   $ae
         .byte   $51
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $08
         HiAscii "AI?Ap"
         .byte   $75
         .byte   $c1
         .byte   $c5
         .byte   $33
         .byte   $c1
         .byte   $f0
         .byte   $27
         .byte   $01
         .byte   $0a
         .byte   $11
         .byte   $0a
         .byte   $08
         .byte   $c2
         .byte   $20
         .byte   $0e
         .byte   $18
         .byte   $16
         .byte   $02
         .byte   $31
         .byte   $02
         .byte   $09
         .byte   $08
         .byte   $27
         .byte   $22
         .byte   $00
         .byte   $12
         .byte   $c2
         .byte   $0a
         .byte   $04
         .byte   $c2
         .byte   $00
         .byte   $03
         .byte   $2a
         .byte   $00
         .byte   $04
         .byte   $c2
         .byte   $00
         .byte   $22
         .byte   $08
         .byte   $10
         .byte   $28
         .byte   $12
         .byte   $02
         .byte   $00
         .byte   $02
         .byte   $08
         .byte   $11
         .byte   $0a
         .byte   $08
         .byte   $02
         .byte   $28
         .byte   $11
         .byte   $01
         .byte   $39
         .byte   $22
         .byte   $31
         .byte   $01
         .byte   $05
         .byte   $18
         .byte   $20
         .byte   $28
         .byte   $02
         .byte   $10
         .byte   $06
         .byte   $02
         .byte   $09
         .byte   $02
         .byte   $05
         .byte   $2c
         .byte   $10
         .byte   $00
         .byte   $08
         .byte   $2e
         .byte   $00
         .byte   $05
         .byte   $02
         .byte   $28
         .byte   $18
         .byte   $02
         .byte   $30
         .byte   $23
         .byte   $02
         .byte   $20
         .byte   $32
         .byte   $04
         .byte   $11
         .byte   $02
         .byte   $14
         .byte   $02
         .byte   $08
         .byte   $09
         .byte   $12
         .byte   $20
         .byte   $0e
         .byte   "/#0/#0"
         .byte   $0c
         .byte   $17
         .byte   "*?'#07#0"
         .byte   $12
         .byte   $1a
         .byte   $08
         .byte   $30
         .byte   $2f
         .byte   $08
         .byte   "0/'#07#0:",$22,"4<*5"
         .byte   $08
         .byte   $35
         .byte   $2f
         .byte   $c2
         .byte   $2a
         .byte   $08
         .byte   "5/*%"
         .byte   $08
         .byte   $35
         .byte   $2f
         .byte   $29
         .byte   $10
         .byte   $08
         .byte   $31
         .byte   $2f
         .byte   $29
         .byte   $11
         .byte   $08
         .byte   $31
         .byte   $2f
         .byte   $29
         .byte   $0f
         .byte   $08
         .byte   $31
         .byte   $2f
         .byte   $29
         .byte   $10
         .byte   $c3
         .byte   $11
         .byte   $0f
         .byte   $c2
         .byte   $12
         .byte   $01
         .byte   $0f
         .byte   "'#0/#0"
         .byte   $1a
         .byte   $02
         .byte   $2a
         .byte   $08
         .byte   "5/*7"
         .byte   $08
         .byte   $35
         .byte   $2f
         .byte   $c2
         .byte   $2a
         .byte   $08
         .byte   "5/*:"
         .byte   $08
         .byte   $35
         .byte   $2f
         .byte   $06
         .byte   "/#0/#0"
         .byte   $18
         .byte   $c2
         .byte   $12
         .byte   $01
         .byte   $0f
         .byte   "'#07#0"
         .byte   $1a
         .byte   $c3
         .byte   $3a
         .byte   $02
         .byte   $2a
         .byte   $c2

@L5338:  dec     A
         ora     ($1a)
         .byte   "'#07#0"
         .byte   $18
         .byte   $22,"):$(%",$22,"%:$(%",$22,"%"
         .byte   $c2
         .byte   "$2%4%"
         .byte   $c2
         .byte   "$2%4%$(2()!)"
         .byte   $c1
         .byte   $d3
         .byte   $9c
         .byte   $81
         .byte   $9e
         .byte   $bd
         .byte   $9e
         .byte   $75
         .byte   $aa
         .byte   $93
         .byte   $aa
         .byte   $60
         .byte   $aa
         .byte   $00
         .byte   $9d
         HiAscii ";5Aj"
         .byte   $9e
         .byte   $11
         .byte   $9f
         .byte   $22
         .byte   $9f
         .byte   $2e
         .byte   $9f
         .byte   $51
         .byte   $9f
         .byte   $60
         .byte   $9f
         .byte   $70
         .byte   $9f
         .byte   $4e
         .byte   $a5
         .byte   $12
         .byte   $a4
         .byte   $96
         HiAscii "#AP$Ao$"
         .byte   $62
         .byte   $a2
         .byte   $70
         .byte   $a2
         .byte   $74
         .byte   $a2,$c1,$e9,$a2
         .byte   $1a
         HiAscii "%AE%"
         .byte   $0f
         .byte   $a5,$c1,$dc,$a5,$c2,$a2
         .byte   $97
         .byte   $a2
         .byte   $80
         .byte   $a2
         .byte   $6d
         .byte   $a5
         .byte   $32
         .byte   $a2
         .byte   $3c
         .byte   $a2
         .byte   $28
         .byte   $a2
         .byte   $2d
         .byte   $a2
         .byte   $50
         .byte   $a2
         .byte   $79
         .byte   $a5
         .byte   $9d
         .byte   $a5
         .byte   $30
         .byte   $a3
         .byte   $5c
         .byte   $a3
         .byte   $8d
         .byte   $a3
         .byte   $7c
         .byte   $a2,$c1,$fc,$a4,$c1,$fc,$a4
         .byte   $65
         .byte   $c1
         .byte   $d8
         .byte   $00
         .byte   $c1
         .byte   $e0
         .byte   $3c
         HiAscii "ATArAT"
         .byte   $36
         HiAscii "AhAe$Bc"
         .byte   $00
         .byte   $c1
         .byte   $e0
         .byte   $03
         HiAscii "A`A|$A|$"
         .byte   $65
         .byte   $c1
         .byte   $d8
         .byte   $00
         .byte   $c1
         .byte   $e0
         .byte   $3c
         HiAscii "ATArAT"
         .byte   $06
         .byte   $a5
         .byte   $06
         .byte   $a5
         .byte   $67
         .byte   $10
         .byte   $84
         .byte   $9d
         .byte   $3c
         .byte   $0c
         .byte   $c1
         .byte   $f2
         .byte   $0c
         HiAscii "-Ai7D"
         .byte   $4a
         .byte   $8d
         .byte   $6a
         .byte   $aa,$ad,$c1,$ea,$b7,$8d
         .byte   $68
         .byte   $aa
         .byte   $ad
         .byte   $00
         .byte   $c1
         .byte   $e0
         .byte   $49
         .byte   $20
         .byte   $c1
         .byte   $d0
         .byte   $11
         .byte   $8d,$b6,$aa,$a2
         .byte   $0a
         .byte   $bd
         .byte   $61
         .byte   $c2
         .byte   $9d
         .byte   $55
         .byte   $9d
         HiAscii "AJAPAw"
         .byte   $4c
         .byte   $bc
         .byte   $9d
         .byte   $a9
         .byte   $40
         .byte   $8d,$b6,$aa,$a2
         .byte   $0c
         .byte   $bd
         .byte   $6b
         .byte   $c2
         .byte   $9d
         .byte   $55
         .byte   $9d
         HiAscii "AJAPAw"
         .byte   $38
         .byte   $b0
         .byte   $12
         HiAscii "-6*AP"
         .byte   $04
         .byte   $a9
         .byte   $20
         .byte   $c1
         .byte   $d0
         .byte   $05
         .byte   $0a
         .byte   $10
         .byte   $05
         .byte   $a9
         .byte   $4c
         .byte   $20
         .byte   $b2
         .byte   $a5
         .byte   $18
         .byte   $08
         .byte   $20
         .byte   $51
         .byte   $a8
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $5e
         .byte   $aa
         .byte   $8d
         .byte   $52
         .byte   $aa
         .byte   $28
         .byte   $6a
         .byte   $8d
         .byte   $51
         .byte   $aa
         .byte   $30
         .byte   $03
         .byte   $6c
         .byte   $5e
         .byte   $9d
         .byte   $6c
         .byte   $5c
         .byte   $9d
         .byte   $0a
         .byte   $10
         .byte   $19
         .byte   $8d,$b6,$aa,$a2
         .byte   $0c
         .byte   $bd
         .byte   $77
         .byte   $c2
         .byte   $9d
         .byte   $55
         .byte   $9d
         .byte   $c1,$ca,$c1,$d0,$c1,$f7,$a2
         .byte   $1d
         .byte   $bd
         .byte   $93
         .byte   $aa
         .byte   $60
         .byte   $11
         HiAscii "AJAPA}Af"
         .byte   $46
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $c1
         .byte   $e6
         .byte   $47
         .byte   $38
         .byte   $c1
         .byte   $e9
         .byte   $01
         HiAscii "APAp"
         .byte   $60
         .byte   $01
         .byte   "0($ "
         .byte   $1e
         .byte   $1d
         .byte   $c5
         .byte   $1c
         .byte   "p,&",$22
         .byte   $1f
         .byte   $1e
         .byte   $1d
         .byte   $c5
         .byte   $1c
         .byte   $96
         .byte   $97
         .byte   $9a
         .byte   $9b
         .byte   $9d
         .byte   $9e
         .byte   $9f
         .byte   $a6,$a7,$ab,$ac,$ad,$ae,$af,$b2,$b3,$b4,$b5,$b6,$b7,$b9,$ba,$bb
         .byte   $bc,$bd,$be,$bf,$c1,$cb,$c1,$cd,$c1,$ce,$c1,$cf,$c1,$d3,$c1,$d6
         .byte   $c1,$d7,$c1,$d9,$c1,$da,$c1,$db,$c1,$dc,$c1,$dd,$c1,$de,$c1,$df
         .byte   $c1,$e5,$c1,$e6,$c1,$e7,$c1,$e9,$c1,$ea,$c1,$eb,$c1,$ec,$c1,$ed
         .byte   $c1,$ee,$c1,$ef,$c1,$f2,$c1,$f3,$c1,$f4,$c1,$f5,$c1,$f6,$c1,$f7
         .byte   $c1,$f9,$c1,$fa,$c1,$fb,$c1,$fc,$c1,$fd,$c1,$fe,$c1
         .byte   $ff
         .byte   $a0
         .byte   $8c
         .byte   $18
         HiAscii "9Ar3Ap"
         .byte   $0e
         .byte   $0a
         .byte   $90
         .byte   $c1
         .byte   $fb
         .byte   $48
         .byte   $c1
         .byte   $e6
         .byte   $40
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $c1
         .byte   $e6
         .byte   $41
         .byte   $68
         .byte   $18
         .byte   $90
         .byte   $c1
         .byte   $f0
         .byte   $88
         HiAscii "APAi&"
         .byte   $40
         .byte   $a5
         .byte   $41
         .byte   $4c
         .byte   $24
         HiAscii "AmGjAeAEAD30"
         .byte   $88
         .byte   $00
         .byte   $01
         .byte   $98
         .byte   $99
         .byte   $02
         .byte   $03
         .byte   $9c
         .byte   $04
         .byte   $05
         .byte   $06
         .byte   $a0,$a1,$a2,$a3,$a4,$a5
         .byte   $07
         .byte   $08
         .byte   $a8
         .byte   $a9
         .byte   $aa
         .byte   $09
         .byte   $0a
         .byte   $0b
         .byte   $0c
         .byte   $0d
         .byte   $b0
         .byte   $b1
         .byte   $0e
         .byte   $0f
         .byte   $10
         .byte   $11
         .byte   $12
         .byte   $13
         .byte   $b8
         .byte   $14
         .byte   $15
         .byte   $16
         .byte   $17
         .byte   $18
         .byte   $19
         .byte   $1a
         HiAscii "A@AAABACADAEAFAGAHAIAJ"
         .byte   $1b
         .byte   $c1
         .byte   $cc
         .byte   $1c
         .byte   $1d
         .byte   $1e
         HiAscii "APAQAR"
         .byte   $1f
         HiAscii "ATAU"
         .byte   $20
         .byte   $21
         .byte   $c1
         .byte   $d8
         .byte   $22,"#$%&'("
         HiAscii "A`AaAbAcAd"
         .byte   $29
         .byte   $2a
         .byte   $2b
         .byte   $c1
         .byte   $e8
         .byte   ",-./012"
         HiAscii "ApAq"
         .byte   "345678"
         .byte   $c1
         .byte   $f8
         .byte   "9:;<=>?"
         .byte   $c0
         .byte   $01
         .byte   $01
         .byte   $00
         .byte   $88
         .byte   $84
         .byte   $26
         .byte   $bc
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         .byte   $c1
         .byte   $fb
         .byte   $59
         .byte   $00
         .byte   $ba
         .byte   $a4
         .byte   $26
         .byte   $99
         .byte   $00
         HiAscii "<APAn"
         .byte   $84
         .byte   $26
         .byte   $bc
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         .byte   $c1
         .byte   $fb
         .byte   $59
         .byte   $00
         .byte   $ba
         .byte   $a4
         .byte   $26
         .byte   $99
         .byte   $00
         HiAscii ";AHAPAn<"
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         HiAscii "A{AY"
         .byte   $00
         .byte   $ba
         .byte   $c1
         .byte   $d0
         .byte   $13
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         HiAscii "A{AIA^AP"
         .byte   $0a
         .byte   $c1
         .byte   $ea
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         HiAscii "A{AI*Ap"
         .byte   $5c
         .byte   $38
         .byte   $60
         .byte   $18
         .byte   $60
         .byte   $84
         .byte   $26
         HiAscii "AHAP"
         .byte   $04
         .byte   $c1
         .byte   $e6
         .byte   $26
         HiAscii "ApAs="
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         HiAscii "A{AIAUAPApAj="
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         HiAscii "A{AI*APAr "
         .byte   $03
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         HiAscii "A{AI"
         .byte   $96
         HiAscii "APAg)"
         .byte   $00
         .byte   $85
         .byte   $27
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         .byte   $c1
         .byte   $fb
         .byte   $2a
         .byte   $85
         .byte   $26
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         .byte   $c1
         .byte   $fb
         .byte   $25
         .byte   $26
         .byte   $99
         .byte   $2c
         .byte   $00
         .byte   $45
         .byte   $27
         .byte   $88
         .byte   $10
         HiAscii "Ag(AP7="
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         HiAscii "A{AIA^AP.Aj="
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         HiAscii "A{AI*AP$"
         .byte   $18
         .byte   $60
         .byte   $86
         .byte   $2b
         .byte   $85
         .byte   $2a
         .byte   $8d
         .byte   $78
         .byte   $04
         .byte   $4a
         .byte   $85
         .byte   $2e
         .byte   $a2
         .byte   $00
         .byte   $86
         .byte   $2d
         .byte   $a6
         .byte   $2b
         .byte   $c1
         .byte   $d0
         .byte   $05
         .byte   $ad
         .byte   $78
         .byte   $04
         .byte   $85
         .byte   $2e
         .byte   $c4
         .byte   $4a
         .byte   $9d
         .byte   $82
         .byte   $c1
         .byte   $c0
         .byte   $a5
         .byte   $2d
         .byte   $29
         .byte   $0f
         .byte   $85
         .byte   $2d
         .byte   $a5
         .byte   $2e
         .byte   $c4
         .byte   $0a
         .byte   $05
         .byte   $2d
         .byte   $9d
         .byte   $81
         .byte   $c1
         .byte   $c0
         .byte   $a9
         .byte   $00
         .byte   $9d
         .byte   $80
         .byte   $c1
         .byte   $c0
         .byte   $9d
         .byte   $83
         .byte   $c1
         .byte   $c0
         .byte   $60
         .byte   $ad
         .byte   $78
         .byte   $04
         .byte   $69
         HiAscii "A~AE"
         .byte   $26
         .byte   $c1
         .byte   $c9
         .byte   $0c
         .byte   $38
         .byte   $b9
         .byte   $11
         .byte   $ba
         .byte   $a5
         .byte   $27
         .byte   $b9
         .byte   $1d
         .byte   $ba
         .byte   $20
         .byte   $00
         .byte   $ba
         .byte   $18
         .byte   $ad
         .byte   $78
         .byte   $04
         .byte   $29
         .byte   $03
         .byte   $2a
         .byte   $05
         .byte   $2b
         .byte   $aa
         .byte   $bd
         .byte   $80
         .byte   $c1
         .byte   $c0
         .byte   $a6
         .byte   $2b
         .byte   $60
         HiAscii "*B @"
         .byte   $00
         .byte   $01
         .byte   $00
         .byte   $a0
         .byte   $00
         .byte   $b1
         .byte   $3e
         .byte   $99
         .byte   $00
         HiAscii ";AHAPAx"
         .byte   $60
         .byte   $88
         .byte   $3e
         .byte   $00
         .byte   $bc
         .byte   $99
         .byte   $00
         HiAscii ";AhA`"
         .byte   $56
         .byte   $90
         .byte   $c1
         .byte   $f4
         .byte   $a2
         .byte   $00
         .byte   $98
         .byte   $c1,$d0,$c1,$ef,$a2
         .byte   $55
         .byte   $bd
         .byte   $00
         .byte   $bc
         .byte   $29
         .byte   $3f
         .byte   $9d
         .byte   $00
         .byte   $bc
         .byte   $c1
         .byte   $ca
         .byte   $10
         .byte   $c1
         .byte   $f5
         .byte   $60
         .byte   $38
         .byte   $86
         .byte   $27
         .byte   $8e
         .byte   $78
         .byte   $06
         .byte   $c3
         .byte   $ea
         .byte   $bd
         .byte   $8e
         .byte   $c1
         .byte   $c0
         .byte   $30
         .byte   $7c
         .byte   $bd
         .byte   $8f
         .byte   $c1
         .byte   $c0
         .byte   $a0
         .byte   $00
         .byte   $b9
         .byte   $00
         .byte   $bb
         .byte   $9d
         .byte   $8d,$c1,$c0,$bd
         .byte   $8c
         HiAscii "A@AHAPAt="
         .byte   $8e
         .byte   $c1
         .byte   $c0
         .byte   $18
         .byte   $60
         .byte   $48
         .byte   $88
         HiAscii "APA|)AU"
         .byte   $20
         HiAscii "B8)*"
         .byte   $20
         HiAscii "B8)-"
         .byte   $20
         .byte   $c2
         .byte   $b8
         .byte   $98
         .byte   $a0
         .byte   $56
         .byte   $c1
         .byte   $d0
         .byte   $03
         .byte   $b9
         .byte   $00
         .byte   $bc
         .byte   $59
         .byte   $c1
         .byte   $ff
         .byte   $bb
         .byte   $aa
         .byte   $bd
         .byte   $29
         .byte   $ba
         .byte   $a6
         .byte   $27
         .byte   $9d
         .byte   $8d,$c1,$c0,$bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $88
         HiAscii "APAk%"
         .byte   $26
         .byte   $c1
         .byte   $ea
         .byte   $59
         .byte   $00
         .byte   $bb
         .byte   $aa
         .byte   $bd
         .byte   $29
         .byte   $ba
         .byte   $ae
         .byte   $78
         .byte   $06
         .byte   $9d
         .byte   $8d,$c1,$c0,$bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $b9
         .byte   $00
         HiAscii ";AHAPAj*="
         .byte   $29
         .byte   $ba
         .byte   $a6
         .byte   $27
         .byte   $20
         HiAscii ";8)A^"
         .byte   $20
         HiAscii "B8)*"
         .byte   $20
         HiAscii "B8)Ak"
         .byte   $20
         HiAscii "B8)A"
         .byte   $ff
         .byte   $20
         .byte   $c2
         .byte   $b8
         .byte   $bd
         .byte   $8e
         HiAscii "A@Cj"
         .byte   $60
         .byte   $18
         .byte   $48
         .byte   $68
         .byte   $9d
         .byte   $8d
         .byte   $c1
         .byte   $c0
         .byte   $1d
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $60
         .byte   $a0
         .byte   $00
         .byte   $b9
         .byte   $00
         .byte   $bb
         .byte   $91
         .byte   $3e
         HiAscii "AHAPAx"
         .byte   $60
         .byte   $a2
         .byte   $56
         .byte   $c1
         .byte   $ca
         .byte   $5e
         .byte   $00
         .byte   $bc
         .byte   $2a
         .byte   $91
         .byte   $3e
         HiAscii "AHAD"
         .byte   $26
         HiAscii "APAt"
         .byte   $60
         .byte   $a0
         .byte   $00
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $99
         .byte   $00
         HiAscii ";AHAPAw"
         .byte   $18
         .byte   $60
         .byte   $88
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $49
         .byte   $c1
         .byte   $d5
         .byte   $bd
         .byte   $8c
         HiAscii "A@APAy "
         .byte   $56
         .byte   $bd
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $10
         HiAscii "A{AI-APAn)AS"
         .byte   $18
         .byte   $90
         .byte   $05
         .byte   $a0
         .byte   $0d
         .byte   $91
         .byte   $48
         .byte   $38
         .byte   $bd
         .byte   $88
         .byte   $c1
         .byte   $c0
         .byte   $60
         .byte   $a9
         .byte   $00
         .byte   $85
         .byte   $3f
         .byte   $a0
         .byte   $80
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $a4
         .byte   $45
         .byte   $20
         .byte   $56
         .byte   $bc
         .byte   $b0
         .byte   $6b
         .byte   $20
         .byte   $2a
         .byte   $b8
         .byte   $b0
         .byte   $66
         .byte   $c1
         .byte   $e6
         .byte   $3f
         .byte   $a5
         .byte   $3f
         .byte   $c1
         .byte   $c9
         .byte   $10
         .byte   $90
         .byte   $c1
         .byte   $ec
         .byte   $a0
         .byte   $0f
         .byte   $84
         .byte   $3f
         .byte   $a9
         .byte   $30
         .byte   $8d
         .byte   $78
         .byte   $05
         .byte   $99
         .byte   $a8
         .byte   $bf
         .byte   $88
         .byte   $10
         .byte   $c1
         .byte   $fa
         .byte   $a4
         .byte   $45
         .byte   $20
         .byte   $87
         .byte   $bf
         .byte   $20
         .byte   $87
         .byte   $bf
         .byte   $20
         .byte   $87
         .byte   $bf
         .byte   $48
         .byte   $68
         .byte   $c1
         .byte   $ea
         .byte   $88
         HiAscii "APAq"
         .byte   $20
         .byte   $44
         .byte   $b9
         .byte   $b0
         .byte   $23
         .byte   $a5
         .byte   $2d
         .byte   $c1
         .byte   $f0
         .byte   $15
         .byte   $a9
         .byte   $10
         .byte   $c1
         .byte   $c5
         .byte   $45
         .byte   $a5
         .byte   $45
         .byte   $c1
         .byte   $e9
         .byte   $01
         .byte   $85
         .byte   $45
         .byte   $c1
         .byte   $c9
         .byte   $05
         .byte   $b0
         .byte   $11
         .byte   "8` D"
         .byte   $b9
         .byte   $b0
         .byte   $05
         .byte   $20
         .byte   $c1
         .byte   $dc
         .byte   $b8
         .byte   $90
         .byte   $1c
         .byte   $c1
         .byte   $ce
         .byte   $78
         .byte   $05
         HiAscii "APAq"
         .byte   $20
         .byte   $44
         .byte   $b9
         .byte   $b0
         .byte   $0b
         .byte   $a5
         .byte   $2d
         .byte   $c1
         .byte   $c9
         .byte   $0f
         .byte   $c1
         .byte   $d0
         .byte   $05
         .byte   $20
         .byte   $c1
         .byte   $dc
         .byte   $b8
         .byte   $90
         .byte   $8c
         .byte   $c1
         .byte   $ce
         .byte   $78
         .byte   $05
         HiAscii "APAk"
         .byte   $38
         .byte   $60
         .byte   $a4
         .byte   $2d
         .byte   $b9
         .byte   $a8
         .byte   $bf
         .byte   $30
         HiAscii "A])A"
         .byte   $ff
         .byte   $99
         HiAscii "(?AF"
         .byte   $3f
         .byte   $10
         .byte   $c1
         .byte   $ca
         .byte   $a5
         .byte   $44
         .byte   $c1
         .byte   $d0
         .byte   $0a
         .byte   $a5
         .byte   $45
         .byte   $c1
         .byte   $c9
         .byte   $10
         .byte   $90
         HiAscii "AeAF"
         .byte   $45
         .byte   $c1
         .byte   $c6
         .byte   $45
         .byte   $18
         .byte   $60
         .byte   $d0
         .byte   $ff
         .byte   $00
         .byte   $0d
         .byte   $0b
         .byte   $09
         .byte   $07
         .byte   $05
         .byte   $03
         .byte   $01
         .byte   $0e
         .byte   $0c
         .byte   $0a
         .byte   $08
         .byte   $06
         .byte   $04
         .byte   $02
         .byte   $0f
         .byte   $20
         .byte   $93
         .byte   $c1
         .byte   $fe
         .byte   $ad
         .byte   $81
         .byte   $c1
         .byte   $c0
         .byte   $ad
         .byte   $81
         .byte   $c1
         .byte   $c0
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $00
         .byte   $c1
         .byte   $e0
         .byte   $4c
         .byte   $44
         .byte   $b7
         .byte   $c3
         .byte   $00
         .byte   $8d
         .byte   $63
         .byte   $aa
         .byte   $8d
         .byte   $70
         .byte   $aa
         .byte   $8d
         .byte   $71
         .byte   $aa
         .byte   $60
         .byte   $20
         .byte   $5b
         .byte   $a7
         .byte   $8c
         .byte   $b7
         .byte   $aa
         .byte   $60
         .byte   $20
         .byte   $7e
         .byte   $c2
         .byte   $ae
         .byte   $9b
         .byte   $b3
         .byte   $9a
         .byte   $20
         .byte   $16
         .byte   $a3
         .byte   $ba
         .byte   $8e
         .byte   $9b
         .byte   $b3
         .byte   $a9
         .byte   $09
         .byte   $4c
         .byte   $85
         .byte   $b3
         .byte   $8e
         .byte   $c1
         .byte   $e9
         .byte   $b7
         .byte   $8e
         HiAscii "Aw7)"
         .byte   $01
         .byte   $8d,$c1,$f8,$b7,$8d,$c1,$ea,$b7,$ad,$c1,$e0,$b7,$8d,$c1,$e1,$b7
         .byte   $a9
         .byte   $02
         .byte   $8d,$c1,$ec,$b7,$a9
         .byte   $04
         .byte   $8d,$c1,$ed,$b7,$ac,$c1,$e7,$b7
         .byte   $88
         .byte   $8c
         HiAscii "Aq7)"
         .byte   $01
         .byte   $8d,$c1,$f4,$b7,$8a,$c4
         .byte   $4a
         .byte   $aa
         .byte   $a9
         .byte   $00
         .byte   $9d
         .byte   $c1
         .byte   $f8
         .byte   $04
         .byte   $9d
         .byte   $78
         .byte   $04
         .byte   $20
         .byte   $93
         .byte   $b7
         .byte   $a2
         .byte   $c1
         .byte   $ff
         .byte   $9a
         .byte   $8e
         .byte   $c1
         .byte   $eb
         .byte   $b7
         .byte   $4c
         .byte   $c1
         .byte   $c8
         .byte   $bf
         .byte   $20
         .byte   $89
         .byte   $c1
         .byte   $fe
         .byte   $4c
         .byte   $84
         .byte   $9d
         HiAscii "-Ag7"
         .byte   $38
         .byte   $c1,$ed,$c1,$f1,$b7,$8d,$c1,$e1,$b7,$ad,$c1,$e7,$b7,$8d,$c1,$f1
         .byte   $b7,$c1,$ce,$c1,$f1,$b7,$a9
         .byte   $02
         .byte   $8d,$c1,$ec,$b7,$a9
         .byte   $04
         .byte   $8d,$c1,$ed,$b7,$a9
         .byte   $02
         .byte   $8d,$c1,$f4,$b7
         .byte   $20
         .byte   $93
         .byte   $b7,$ad,$c1,$e7,$b7,$8d,$c1,$fe,$b6
         .byte   $18
         .byte   $69
         .byte   $09
         .byte   $8d
         .byte   $c1
         .byte   $f1
         .byte   $b7
         .byte   $a9
         .byte   $0a
         .byte   $8d
         .byte   $c1
         .byte   $e1
         .byte   $b7
         .byte   $38
         .byte   $c1
         .byte   $e9
         .byte   $01
         .byte   $8d
         .byte   $c1
         .byte   $ff
         .byte   $b6
         .byte   $8d
         .byte   $c1
         .byte   $ed
         .byte   $b7
         .byte   $20
         .byte   $93
         .byte   $b7
         .byte   $60
         .byte   $c6
         .byte   $00
         .byte   $ad
         .byte   $c1
         .byte   $e5
         .byte   $b7
         .byte   $ac
         .byte   $c1
         .byte   $e4
         .byte   $b7
         .byte   $20
         .byte   $b5
         .byte   $b7
         .byte   $ac
         .byte   $c1
         .byte   $ed
         .byte   $b7
         .byte   $88
         .byte   $10
         .byte   $07
         .byte   $a0
         .byte   $0f
         .byte   $c2
         .byte   $ea
         .byte   $c1
         .byte   $ce
         .byte   $c1
         .byte   $ec
         .byte   $b7
         .byte   $8c
         .byte   $c1
         .byte   $ed
         .byte   $b7
         .byte   $c1
         .byte   $ce
         .byte   $c1
         .byte   $f1
         .byte   $b7
         .byte   $c1
         .byte   $ce
         .byte   $c1
         .byte   $e1
         .byte   $b7
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $df
         .byte   $60
         .byte   $08
         .byte   $78
         .byte   $20
         .byte   $00
         .byte   $bd
         .byte   $b0
         .byte   $03
         .byte   $28
         .byte   $18
         .byte   $60
         .byte   $28
         .byte   $38
         .byte   $60
         .byte   $ad
         .byte   $bc
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $f1
         .byte   $b7
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $c1
         .byte   $f0
         .byte   $b7
         .byte   $ad
         .byte   $c1
         .byte   $f9
         .byte   $b5
         .byte   $49
         .byte   $c1
         .byte   $ff
         .byte   $8d
         .byte   $c1
         .byte   $eb
         .byte   $b7
         .byte   $60
         .byte   $a9
         .byte   $00
         .byte   $a8
         .byte   $91
         .byte   $42
         .byte   $c1
         .byte   $c8
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fb
         .byte   $60
         .byte   $00
         .byte   $1b
         .byte   $02
         .byte   $0a
         .byte   $1b
         .byte   $c1
         .byte   $e8
         .byte   $b7
         .byte   $00
         .byte   $b6
         .byte   $01
         .byte   $60
         .byte   $02
         .byte   $c1
         .byte   $fe
         .byte   $00
         .byte   $01
         .byte   $c1
         .byte   $fb
         .byte   $b7
         .byte   $00
         .byte   $b7
         .byte   $c2
         .byte   $00
         .byte   $02
         .byte   $c1
         .byte   $eb
         .byte   $c1
         .byte   $fe
         .byte   $60
         .byte   $02
         .byte   $c3
         .byte   $00
         .byte   $01
         .byte   $c1
         .byte   $ef
         .byte   $c1
         .byte   $d8
         .byte   $00
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $e5
         .byte   $c1
         .byte   $f0
         .byte   $c1
         .byte   $ca
         .byte   $68
         .byte   $a9
         .byte   $40
         .byte   $28
         .byte   $4c
         .byte   $48
         .byte   $be
         .byte   $c1
         .byte   $f0
         .byte   $39
         .byte   $4c
         .byte   $af
         .byte   $be
         .byte   $a9
         .byte   $c1
         .byte   $ff
         .byte   $a0
         .byte   $0e
         .byte   $91
         .byte   $48
         .byte   $c1
         .byte   $d0
         .byte   $0e
         .byte   $a0
         .byte   $03
         .byte   $b1
         .byte   $c2
         .byte   $48
         .byte   $68
         .byte   $85
         .byte   $2d
         .byte   $20
         .byte   $b2
         .byte   $b9
         .byte   $4c
         .byte   $32
         .byte   $be
         .byte   $a0
         .byte   $05
         .byte   $b1
         .byte   $48
         .byte   $a8
         .byte   $b9
         .byte   $b8
         .byte   $bf
         .byte   $4c
         .byte   $1e
         .byte   $be
         .byte   $c1
         .byte   $ea
         .byte   $28
         .byte   $90
         .byte   $1c
         .byte   $20
         .byte   $c1
         .byte   $dc
         .byte   $b8
         .byte   $08
         .byte   $b0
         .byte   $8e
         .byte   $28
         .byte   $a2
         .byte   $00
         .byte   $86
         .byte   $26
         .byte   $20
         .byte   $c1
         .byte   $c2
         .byte   $b8
         .byte   $ae
         .byte   $c1
         .byte   $f8
         .byte   $05
         .byte   $18
         .byte   $24
         .byte   $38
         .byte   $a0
         .byte   $0d
         .byte   $91
         .byte   $48
         .byte   $bd
         .byte   $88
         .byte   $c1
         .byte   $c0
         .byte   $60
         .byte   $20
         .byte   $2a
         .byte   $b8
         .byte   $90
         .byte   $c1
         .byte   $f0
         .byte   $a9
         .byte   $10
         .byte   $b0
         .byte   $c1
         .byte   $ee
         .byte   $48
         .byte   $a0
         .byte   $01
         .byte   $b1
         .byte   $3c
         .byte   $6a
         .byte   $68
         .byte   $90
         .byte   $08
         .byte   $0a
         .byte   $20
         .byte   $6b
         .byte   $be
         .byte   $4e
         .byte   $78
         .byte   $04
         .byte   $60
         .byte   $85
         .byte   $2a
         .byte   $20
         .byte   $8e
         .byte   $be
         .byte   $b9
         .byte   $78
         .byte   $04
         .byte   $24
         .byte   $35
         .byte   $30
         .byte   $03
         .byte   $b9
         .byte   $c1
         .byte   $f8
         .byte   $04
         .byte   $8d
         .byte   $78
         .byte   $04
         .byte   $a5
         .byte   $2a
         .byte   $24
         .byte   $35
         .byte   $30
         .byte   $05
         .byte   $99
         .byte   $c1
         .byte   $f8
         .byte   $04
         .byte   $10
         .byte   $03
         .byte   $99
         .byte   $78
         .byte   $04
         .byte   $4c
         .byte   $a0
         .byte   $b9
         .byte   $8a
         .byte   $c4
         .byte   $4a
         .byte   $a8
         .byte   $60
         .byte   $48
         .byte   $a0
         .byte   $02
         .byte   $b1
         .byte   $48
         .byte   $6a
         .byte   $66
         .byte   $35
         .byte   $20
         .byte   $8e
         .byte   $be
         .byte   $68
         .byte   $0a
         .byte   $24
         .byte   $35
         .byte   $30
         .byte   $05
         .byte   $99
         .byte   $c1
         .byte   $f8
         .byte   $04
         .byte   $10
         .byte   $03
         .byte   $99
         .byte   $78
         .byte   $04
         .byte   $60
         .byte   $18
         .byte   $bd
         .byte   $88
         .byte   $c1
         .byte   $c0
         .byte   $60
         .byte   $c1
         .byte   $ea
         .byte   $a9
         .byte   $aa
         .byte   $85
         .byte   $3e
         .byte   $a0
         .byte   $56
         .byte   $a9
         .byte   $00
         .byte   $85
         .byte   $44
         .byte   $99
         .byte   $c1
         .byte   $ff
         .byte   $bb
         .byte   $88
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fa
         .byte   $99
         .byte   $00
         .byte   $bb
         .byte   $88
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fa
         .byte   $a9
         .byte   $50
         .byte   $20
         .byte   $95
         .byte   $be
         .byte   $a9
         .byte   $28
         .byte   $85
         .byte   $45
         .byte   $a5
         .byte   $44
         .byte   $20
         .byte   $5a
         .byte   $be
         .byte   $20
         .byte   $0d
         .byte   $bf
         .byte   $a9
         .byte   $08
         .byte   $b0
         .byte   $24
         .byte   $a9
         .byte   $30
         .byte   $8d
         .byte   $78
         .byte   $05
         .byte   $38
         .byte   $c1
         .byte   $ce
         .byte   $78
         .byte   $05
         .byte   $c1
         .byte   $f0
         .byte   $19
         .byte   $20
         .byte   $44
         .byte   $b9
         .byte   $b0
         .byte   $c1
         .byte   $f5
         .byte   $a5
         .byte   $2d
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f1
         .byte   $20
         .byte   $c1
         .byte   $dc
         .byte   $b8
         .byte   $b0
         .byte   $c1
         .byte   $ec
         .byte   $c1
         .byte   $e6
         .byte   $44
         .byte   $a5
         .byte   $44
         .byte   $c1
         .byte   $c9
         .byte   $23
         .byte   $90
         .byte   $ad
         .byte   $00
         .byte   $02
         .byte   $c1
         .byte   $cd
         .byte   $b2
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $03
         .byte   $4c
         .byte   $a4
         .byte   $9f
         .byte   $ad
         .byte   $01
         .byte   $02
         .byte   $c1
         .byte   $c9
         .byte   $8d
         .byte   $c1
         .byte   $d0
         .byte   $06
         .byte   $20
         .byte   $5b
         .byte   $a7
         .byte   $4c
         .byte   $95
         .byte   $9f
         .byte   $4c
         .byte   $c1
         .byte   $c4
         .byte   $a6
         .byte   $0e
         .byte   $5f
         .byte   $aa
         .byte   $ac
         .byte   $5f
         .byte   $aa
         .byte   $20
         .byte   $5e
         .byte   $a6
         .byte   $90
         .byte   $0c
         .byte   $a9
         .byte   $02
         .byte   $39
         .byte   $09
         .byte   $a9
         .byte   $c1
         .byte   $f0
         .byte   $05
         .byte   $a9
         .byte   $0f
         .byte   $4c
         .byte   $c1
         .byte   $d2
         .byte   $a6
         .byte   $c1
         .byte   $c0
         .byte   $06
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $84
         .byte   $33
         .byte   $a9
         .byte   $20
         .byte   $39
         .byte   $09
         .byte   $a9
         .byte   $c1
         .byte   $f0
         .byte   $61
         .byte   $20
         .byte   $95
         .byte   $a0
         .byte   $08
         .byte   $20
         .byte   $a4
         .byte   $a1
         .byte   $c1
         .byte   $f0
         .byte   $1e
         .byte   $0a
         .byte   $90
         .byte   $05
         .byte   $30
         .byte   $03
         .byte   $4c
         .byte   $00
         .byte   $a0
         .byte   $6a
         .byte   $4c
         .byte   $59
         .byte   $a0
         .byte   $20
         .byte   $93
         .byte   $a1
         .byte   $c1
         .byte   $f0
         .byte   $0d
         .byte   $99
         .byte   $75
         .byte   $aa
         .byte   $c1
         .byte   $c8
         .byte   $c1
         .byte   $c0
         .byte   $3c
         .byte   $90
         .byte   $c1
         .byte   $f3
         .byte   $20
         .byte   $93
         .byte   $a1
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fb
         .byte   $28
         .byte   $c1
         .byte   $d0
         .byte   $0f
         .byte   $ac
         .byte   $5f
         .byte   $aa
         .byte   $a9
         .byte   $10
         .byte   $39
         .byte   $09
         .byte   $a9
         .byte   $c1
         .byte   $f0
         .byte   $0c
         .byte   $a0
         .byte   $1e
         .byte   $08
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $cb
         .byte   $ad
         .byte   $93
         .byte   $aa
         .byte   $c1
         .byte   $c9
         .byte   $a0
         .byte   $c1
         .byte   $f0
         .byte   $13
         .byte   $ad
         .byte   $75
         .byte   $aa
         .byte   $c1
         .byte   $c9
         .byte   $a0
         .byte   $c1
         .byte   $d0
         .byte   $4b
         .byte   $ac
         .byte   $5f
         .byte   $aa
         .byte   $a9
         .byte   $c1
         .byte   $c0
         .byte   $39
         .byte   $09
         .byte   $a9
         .byte   $c1
         .byte   $f0
         .byte   $02
         .byte   $10
         .byte   $3f
         .byte   $4c
         .byte   $00
         .byte   $c2
         .byte   $a0
         .byte   $3c
         .byte   $a9
         .byte   $a0
         .byte   $99
         .byte   $74
         .byte   $aa
         .byte   $88
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fa
         .byte   $60
         .byte   $8d
         .byte   $75
         .byte   $aa
         .byte   $a9
         .byte   $0c
         .byte   $39
         .byte   $09
         .byte   $a9
         .byte   $c1
         .byte   $f0
         .byte   $27
         .byte   $20
         .byte   $b9
         .byte   $a1
         .byte   $b0
         .byte   $1f
         .byte   $a8
         .byte   $c1
         .byte   $d0
         .byte   $17
         .byte   $c1
         .byte   $e0
         .byte   $11
         .byte   $b0
         .byte   $13
         .byte   $ac
         .byte   $5f
         .byte   $aa
         .byte   $a9
         .byte   $08
         .byte   $39
         .byte   $09
         .byte   $a9
         .byte   $c1
         .byte   $f0
         .byte   $06
         .byte   $c1
         .byte   $e0
         .byte   $08
         .byte   $b0
         .byte   $c1
         .byte   $ce
         .byte   $90
         .byte   $0b
         .byte   $8a
         .byte   $c1
         .byte   $d0
         .byte   $08
         .byte   $a9
         .byte   $02
         .byte   $4c
         .byte   $c1
         .byte   $d2
         .byte   $a6
         .byte   $4c
         .byte   $c1
         .byte   $c4
         .byte   $a6
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $65
         .byte   $aa
         .byte   $8d
         .byte   $74
         .byte   $aa
         .byte   $8d
         .byte   $66
         .byte   $aa
         .byte   $8d
         .byte   $6c
         .byte   $aa
         .byte   $8d
         .byte   $6d
         .byte   $aa
         .byte   $20
         .byte   $c1
         .byte   $dc
         .byte   $bf
         .byte   $ad
         .byte   $5d
         .byte   $aa
         .byte   $20
         .byte   $a4
         .byte   $a1
         .byte   $c1
         .byte   $d0
         .byte   $1f
         .byte   $c1
         .byte   $c9
         .byte   $8d
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f7
         .byte   $ae
         .byte   $5f
         .byte   $aa
         .byte   $ad
         .byte   $65
         .byte   $aa
         .byte   $1d
         .byte   $0a
         .byte   $a9
         .byte   $5d
         .byte   $0a
         .byte   $a9
         .byte   $c1
         .byte   $d0
         .byte   $93
         .byte   $ae
         .byte   $63
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $76
         .byte   $8d
         .byte   $63
         .byte   $aa
         .byte   $8e
         .byte   $5d
         .byte   $aa
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $dc
         .byte   $a2
         .byte   $0a
         .byte   $c1
         .byte   $dd
         .byte   $40
         .byte   $a9
         .byte   $c1
         .byte   $f0
         .byte   $05
         .byte   $c1
         .byte   $ca
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f8
         .byte   $c1
         .byte   $f0
         .byte   $b6
         .byte   $bd
         .byte   $4a
         .byte   $a9
         .byte   $30
         .byte   $47
         .byte   $0d
         .byte   $65
         .byte   $aa
         .byte   $8d
         .byte   $65
         .byte   $aa
         .byte   $c1
         .byte   $ca
         .byte   $8e
         .byte   $64
         .byte   $aa
         .byte   $20
         .byte   $b9
         .byte   $a1
         .byte   $b0
         .byte   $a2
         .byte   $ad
         .byte   $64
         .byte   $aa
         .byte   $c2
         .byte   $0a
         .byte   $a8
         .byte   $a5
         .byte   $45
         .byte   $c1
         .byte   $d0
         .byte   $09
         .byte   $a5
         .byte   $44
         .byte   $c1
         .byte   $d9
         .byte   $55
         .byte   $a9
         .byte   $90
         .byte   $8c
         .byte   $a5
         .byte   $45
         .byte   $c1
         .byte   $d9
         .byte   $58
         .byte   $a9
         .byte   $90
         .byte   $0b
         .byte   $c1
         .byte   $d0
         .byte   $83
         .byte   $a5
         .byte   $44
         .byte   $c1
         .byte   $d9
         .byte   $57
         .byte   $a9
         .byte   $90
         .byte   $02
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f5
         .byte   $ad
         .byte   $63
         .byte   $aa
         .byte   $c1
         .byte   $d0
         .byte   $94
         .byte   $98
         .byte   $4a
         .byte   $a8
         .byte   $a5
         .byte   $45
         .byte   $99
         .byte   $67
         .byte   $aa
         .byte   $a5
         .byte   $44
         .byte   $99
         .byte   $66
         .byte   $aa
         .byte   $4c
         .byte   $c1
         .byte   $e8
         .byte   $a0
         .byte   $48
         .byte   $a9
         .byte   $80
         .byte   $0d
         .byte   $65
         .byte   $aa
         .byte   $8d
         .byte   $65
         .byte   $aa
         .byte   $68
         .byte   $29
         .byte   $7f
         .byte   $0d
         .byte   $74
         .byte   $aa
         .byte   $8d
         .byte   $74
         .byte   $aa
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $e9
         .byte   $c1
         .byte   $f0
         .byte   $9c
         .byte   $20
         .byte   $80
         .byte   $a1
         .byte   $4c
         .byte   $83
         .byte   $9f
         .byte   $20
         .byte   $5b
         .byte   $a7
         .byte   $20
         .byte   $ae
         .byte   $a1
         .byte   $ad
         .byte   $5f
         .byte   $c2
         .byte   $aa
         .byte   $bd
         .byte   $1f
         .byte   $9d
         .byte   $48
         .byte   $bd
         .byte   $1e
         .byte   $9d
         .byte   $48
         .byte   $60
         .byte   $ae
         .byte   $5d
         .byte   $aa
         .byte   $bd
         .byte   $00
         .byte   $02
         .byte   $c1
         .byte   $c9
         .byte   $8d
         .byte   $c1
         .byte   $f0
         .byte   $06
         .byte   $c1
         .byte   $e8
         .byte   $8e
         .byte   $5d
         .byte   $aa
         .byte   $c1
         .byte   $c9
         .byte   $ac
         .byte   $60
         .byte   $20
         .byte   $93
         .byte   $a1
         .byte   $c1
         .byte   $f0
         .byte   $c1
         .byte   $fa
         .byte   $c1
         .byte   $c9
         .byte   $a0
         .byte   $c1
         .byte   $f0
         .byte   $c1
         .byte   $f7
         .byte   $60
         .byte   $a9
         .byte   $00
         .byte   $a0
         .byte   $16
         .byte   $99
         .byte   $ba
         .byte   $b5
         .byte   $88
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fa
         .byte   $60
         .byte   $a9
         .byte   $00
         .byte   $85
         .byte   $44
         .byte   $85
         .byte   $45
         .byte   $20
         .byte   $a4
         .byte   $a1
         .byte   $08
         .byte   $c1
         .byte   $c9
         .byte   $a4
         .byte   $c1
         .byte   $f0
         .byte   $3c
         .byte   $28
         .byte   $4c
         .byte   $c1
         .byte   $ce
         .byte   $a1
         .byte   $20
         .byte   $a4
         .byte   $a1
         .byte   $c1
         .byte   $d0
         .byte   $06
         .byte   $a6
         .byte   $44
         .byte   $a5
         .byte   $45
         .byte   $18
         .byte   $60
         .byte   $38
         .byte   $c1
         .byte   $e9
         .byte   $b0
         .byte   $30
         .byte   $21
         .byte   $c1
         .byte   $c9
         .byte   $0a
         .byte   $b0
         .byte   $1d
         .byte   $20
         .byte   $c1
         .byte   $fe
         .byte   $a1
         .byte   $65
         .byte   $44
         .byte   $aa
         .byte   $a9
         .byte   $00
         .byte   $65
         .byte   $45
         .byte   $a8
         .byte   $20
         .byte   $c1
         .byte   $fe
         .byte   $a1
         .byte   $20
         .byte   $c1
         .byte   $fe
         .byte   $a1
         .byte   $8a
         .byte   $65
         .byte   $44
         .byte   $85
         .byte   $44
         .byte   $98
         .byte   $65
         .byte   $45
         .byte   $85
         .byte   $45
         .byte   $90
         .byte   $c1
         .byte   $cf
         .byte   $38
         .byte   $60
         .byte   $06
         .byte   $44
         .byte   $91
         .byte   $40
         .byte   $8a
         .byte   $c1
         .byte   $c8
         .byte   $91
         .byte   $40
         .byte   $aa
         .byte   $c1
         .byte   $ca
         .byte   $68
         .byte   $48
         .byte   $c1
         .byte   $c8
         .byte   $91
         .byte   $40
         .byte   $c1
         .byte   $c8
         .byte   $8a
         .byte   $91
         .byte   $40
         .byte   $c1
         .byte   $ce
         .byte   $63
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $17
         .byte   $aa
         .byte   $68
         .byte   $38
         .byte   $c1
         .byte   $e9
         .byte   $26
         .byte   $c1
         .byte   $c8
         .byte   $91
         .byte   $40
         .byte   $48
         .byte   $8a
         .byte   $c1
         .byte   $e9
         .byte   $00
         .byte   $c1
         .byte   $c8
         .byte   $91
         .byte   $40
         .byte   $85
         .byte   $41
         .byte   $68
         .byte   $85
         .byte   $40
         .byte   $4c
         .byte   $c1
         .byte   $e5
         .byte   $a7
         .byte   $48
         .byte   $a9
         .byte   $00
         .byte   $c1
         .byte   $c8
         .byte   $91
         .byte   $40
         .byte   $c1
         .byte   $c8
         .byte   $91
         .byte   $40
         .byte   $ad
         .byte   $b6
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $0b
         .byte   $68
         .byte   $85
         .byte   $74
         .byte   $85
         .byte   $70
         .byte   $68
         .byte   $85
         .byte   $73
         .byte   $85
         .byte   $6f
         .byte   $60
         .byte   $68
         .byte   $85
         .byte   $4d
         .byte   $85
         .byte   $c1
         .byte   $cb
         .byte   $68
         .byte   $85
         .byte   $4c
         .byte   $85
         .byte   $c1
         .byte   $ca
         .byte   $60
         .byte   $a5
         .byte   $39
         .byte   $c1
         .byte   $cd
         .byte   $03
         .byte   $9d
         .byte   $c1
         .byte   $f0
         .byte   $12
         .byte   $8d
         .byte   $56
         .byte   $aa
         .byte   $a5
         .byte   $38
         .byte   $8d
         .byte   $55
         .byte   $aa
         .byte   $ad
         .byte   $02
         .byte   $9d
         .byte   $85
         .byte   $38
         .byte   $ad
         .byte   $03
         .byte   $9d
         .byte   $85
         .byte   $39
         .byte   $a5
         .byte   $37
         .byte   $c1
         .byte   $cd
         .byte   $05
         .byte   $9d
         .byte   $c1
         .byte   $f0
         .byte   $12
         .byte   $8d
         .byte   $54
         .byte   $aa
         .byte   $a5
         .byte   $36
         .byte   $8d
         .byte   $53
         .byte   $aa
         .byte   $ad
         .byte   $04
         .byte   $9d
         .byte   $85
         .byte   $36
         .byte   $ad
         .byte   $05
         .byte   $9d
         .byte   $85
         .byte   "7`INI"
         .byte   $c1
         .byte   $d4
         .byte   $4c
         .byte   $4f
         .byte   $41
         .byte   $c1
         .byte   $c4
         .byte   $53
         .byte   $41
         .byte   $56
         .byte   $c1
         .byte   $c5
         .byte   $52
         .byte   $55
         .byte   $c1
         .byte   $ce
         .byte   "CHAI"
         .byte   $c1
         .byte   $ce
         .byte   "DELET"
         .byte   $c1
         .byte   $c5
         .byte   $4c
         .byte   $4f
         .byte   $43
         .byte   $c1
         .byte   $cb
         .byte   "UNLOC"
         .byte   $c1
         .byte   $cb
         .byte   "CLOS"
         .byte   $c1
         .byte   $c5
         .byte   $52
         .byte   $45
         .byte   $41
         .byte   $c1
         .byte   $c4
         .byte   $45
         .byte   $58
         .byte   $45
         .byte   $c1
         .byte   $c3
         .byte   "WRIT"
         .byte   $c1
         .byte   $c5
         .byte   "POSITIO"
         .byte   $c1
         .byte   $ce
         .byte   $4f
         .byte   $50
         .byte   $45
         .byte   $c1
         .byte   $ce
         .byte   $41
         .byte   $c2
         .byte   $50
         .byte   $45
         .byte   $4e
         .byte   $c1
         .byte   $c4
         .byte   "RENAM"
         .byte   $c1
         .byte   $c5
         .byte   "CATALO"
         .byte   $c1
         .byte   $c7
         .byte   $4d
         .byte   $4f
         .byte   $c1
         .byte   $ce
         .byte   "NOMO"
         .byte   $c1
         .byte   $ce
         .byte   $50
         .byte   $52
         .byte   $a3
         .byte   $49
         .byte   $4e
         .byte   $a3
         .byte   "MAXFILE"
         .byte   $c1
         .byte   $d3
         .byte   $46
         .byte   $c1
         .byte   $d0
         .byte   $49
         .byte   $4e
         .byte   $c1
         .byte   $d4
         .byte   "BSAV"
         .byte   $c1
         .byte   $c5
         .byte   "BLOA"
         .byte   $c1
         .byte   $c4
         .byte   $42
         .byte   $52
         .byte   $c1
         .byte   $c2
         .byte   $b7
         .byte   $20
         .byte   $4a
         .byte   $b7
         .byte   $4c
         .byte   $7f
         .byte   $b3
         .byte   $a2
         .byte   $00
         .byte   $c1
         .byte   $f0
         .byte   $06
         .byte   $a2
         .byte   $02
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $a2
         .byte   $04
         .byte   $bd
         .byte   $c1
         .byte   $c7
         .byte   $b5
         .byte   $85
         .byte   $42
         .byte   $bd
         .byte   $c1
         .byte   $c8
         .byte   $b5
         .byte   $85
         .byte   $43
         .byte   $60
         .byte   $2c
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $70
         .byte   $01
         .byte   $60
         .byte   $20
         .byte   $c1
         .byte   $e4
         .byte   $af
         .byte   $a9
         .byte   $02
         .byte   $20
         .byte   $52
         .byte   $b0
         .byte   $a9
         .byte   $bf
         .byte   $2d
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $60
         .byte   $ad
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $30
         .byte   $01
         .byte   $60
         .byte   $20
         .byte   $4b
         .byte   $af
         .byte   $a9
         .byte   $02
         .byte   $20
         .byte   $52
         .byte   $b0
         .byte   $a9
         .byte   $7f
         .byte   $2d
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $60
         .byte   $ad
         .byte   $c1
         .byte   $c9
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $f0
         .byte   $b7
         .byte   $ad
         .byte   $c1
         .byte   $ca
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $f1
         .byte   $b7
         .byte   $ae
         .byte   $c1
         .byte   $d3
         .byte   $b5
         .byte   $ac
         .byte   $c1
         .byte   $d4
         .byte   $b5
         .byte   $60
         .byte   $08
         .byte   $20
         .byte   $34
         .byte   $af
         .byte   $20
         .byte   $4b
         .byte   $af
         .byte   $20
         .byte   $0c
         .byte   $af
         .byte   $28
         .byte   $b0
         .byte   $09
         .byte   $ae
         .byte   $c1
         .byte   $d1
         .byte   $b5
         .byte   $ac
         .byte   $c1
         .byte   $d2
         .byte   $b5
         .byte   $4c
         .byte   $b5
         .byte   $af
         .byte   $a0
         .byte   $01
         .byte   $b1
         .byte   $42
         .byte   $c1
         .byte   $f0
         .byte   $08
         .byte   $aa
         .byte   $c1
         .byte   $c8
         .byte   $b1
         .byte   $42
         .byte   $a8
         .byte   $4c
         .byte   $b5
         .byte   $af
         .byte   $ad
         .byte   $bb
         .byte   $b5
         .byte   $c1
         .byte   $c9
         .byte   $04
         .byte   $c1
         .byte   $f0
         .byte   $02
         .byte   $38
         .byte   $60
         .byte   $20
         .byte   $44
         .byte   $b2
         .byte   $a0
         .byte   $02
         .byte   $91
         .byte   $42
         .byte   $48
         .byte   $88
         .byte   $ad
         .byte   $c1
         .byte   $f1
         .byte   $b5
         .byte   $91
         .byte   $42
         .byte   $48
         .byte   $20
         .byte   $3a
         .byte   $af
         .byte   $20
         .byte   $c1
         .byte   $d6
         .byte   $b7
         .byte   $a0
         .byte   $05
         .byte   $ad
         .byte   $c1
         .byte   $de
         .byte   $b5
         .byte   $91
         .byte   $42
         .byte   $c1
         .byte   $c8
         .byte   $ad
         .byte   $c1
         .byte   $df
         .byte   $b5
         .byte   $91
         .byte   $42
         .byte   $68
         .byte   $aa
         .byte   $68
         .byte   $a8
         .byte   $a9
         .byte   $02
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $a9
         .byte   $01
         .byte   $8e
         .byte   $c1
         .byte   $d3
         .byte   $b5
         .byte   $8c
         .byte   $c1
         .byte   $d4
         .byte   $b5
         .byte   $20
         .byte   $52
         .byte   $b0
         .byte   $a0
         .byte   $05
         .byte   $b1
         .byte   $42
         .byte   $8d
         .byte   $c1
         .byte   $dc
         .byte   $b5
         .byte   $18
         .byte   $6d
         .byte   $c1
         .byte   $da
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $de
         .byte   $b5
         .byte   $c1
         .byte   $c8
         .byte   $b1
         .byte   $42
         .byte   $8d
         .byte   $c1
         .byte   $dd
         .byte   $b5
         .byte   $6d
         .byte   $c1
         .byte   $db
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $df
         .byte   $b5
         .byte   $18
         .byte   $60
         .byte   $20
         .byte   $c1
         .byte   $e4
         .byte   $af
         .byte   $a9
         .byte   $01
         .byte   $4c
         .byte   $52
         .byte   $b0
         .byte   $ac
         .byte   $c1
         .byte   $cb
         .byte   $b5
         .byte   $ad
         .byte   $c1
         .byte   $cc
         .byte   $b5
         .byte   $8c
         .byte   $c1
         .byte   $f0
         .byte   $b7
         .byte   $8d
         .byte   $c1
         .byte   $f1
         .byte   $b7
         .byte   $ae
         .byte   $c1
         .byte   $d6
         .byte   $b5
         .byte   $ac
         .byte   $c1
         .byte   $d7
         .byte   $b5
         .byte   $60
         .byte   $a9
         .byte   $01
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $a9
         .byte   $02
         .byte   $ac
         .byte   $c1
         .byte   $c3
         .byte   $aa
         .byte   $5e
         .byte   $9d
         .byte   $bd
         .byte   $3f
         .byte   $c2
         .byte   $aa
         .byte   $8e
         .byte   $63
         .byte   $aa
         .byte   $bd
         .byte   $71
         .byte   $a9
         .byte   $48
         .byte   $09
         .byte   $80
         .byte   $20
         .byte   $c1
         .byte   $c5
         .byte   $9f
         .byte   $ae
         .byte   $63
         .byte   $aa
         .byte   $c1
         .byte   $e8
         .byte   $68
         .byte   $10
         .byte   $c1
         .byte   $ed
         .byte   $60
         .byte   $ad
         .byte   $66
         .byte   $aa
         .byte   $8d
         .byte   $bf
         .byte   $b5
         .byte   $ad
         .byte   $68
         .byte   $aa
         .byte   $8d
         .byte   $c1
         .byte   $c0
         .byte   $b5
         .byte   $ad
         .byte   $6a
         .byte   $aa
         .byte   $8d
         .byte   $c1
         .byte   $c1
         .byte   $b5
         .byte   $ad
         .byte   $06
         .byte   $9d
         .byte   $8d
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $ad
         .byte   $07
         .byte   $9d
         .byte   $8d
         .byte   $c1
         .byte   $c4
         .byte   $b5
         .byte   $a5
         .byte   $40
         .byte   $8d
         .byte   $4f
         .byte   $aa
         .byte   $a5
         .byte   $41
         .byte   $8d
         .byte   $50
         .byte   $aa
         .byte   $60
         .byte   $a0
         .byte   $1d
         .byte   $b9
         .byte   $75
         .byte   $aa
         .byte   $91
         .byte   $40
         .byte   $88
         .byte   $10
         .byte   $c1
         .byte   $f8
         .byte   $60
         .byte   $a0
         .byte   $1e
         .byte   $b1
         .byte   $40
         .byte   $99
         .byte   $a9
         .byte   $b5
         .byte   $c1
         .byte   $c8
         .byte   $c1
         .byte   $c0
         .byte   $26

@L60D9:  cmp     ($d0,x)
         cmp     ($f6,x)
         rts

         .byte   $a0
         .byte   $00
         .byte   $8c
         .byte   $51
         .byte   $aa
         .byte   $8c
         .byte   $52
         .byte   $aa
         .byte   $60
         .byte   $a9
         .byte   $00
         .byte   $85
         .byte   $45
         .byte   $20
         .byte   $92
         .byte   $a7
         .byte   $4c
         .byte   $73
         .byte   $a7
         .byte   $20
         .byte   $9a
         .byte   $a7
         .byte   $c1
         .byte   $f0
         .byte   $1d
         .byte   $20
         .byte   $aa
         .byte   $a7
         .byte   $c1
         .byte   $d0

         asl     A
         lda     MON_A3L
         sta     MON_A5L
         lda     MON_A3H
         sta     MON_A5H
         cmp     ($d0,x)
         cmp     ($ec,x)
         ldy     #$1d
         lda     (MON_A3L),y
         cmp     ($d9,x)
         adc     $aa,x
         cmp     ($d0,x)
         cmp     ($e3,x)
         dey
         bpl     @L60D9
         inc     $18,x
         rts

         sec
         rts

         lda     $9d00
         ldx     $9d01
         cmp     ($d0,x)
         asl     A
         ldy     #$25
         lda     (MON_A3L),y
         cmp     ($f0,x)
         ora     #$aa
         dey
         lda     (MON_A3L),y
         stx     MON_A3H
         sta     MON_A3L
         txa
         rts

         ldy     #$00
         lda     (MON_A3L),y
         rts

         lda     $aab3
         cmp     ($f0,x)
         asl     $b4ad
         tax
         cmp     ($c5,x)
         rti

         cmp     ($d0,x)
         php
         lda     $aab5
         cmp     ($c5,x)
         eor     ($c1,x)
         beq     @L6155
         .byte   $c1
@L6155:  dex
         rts

         .byte   $4d
         HiAscii "AB5Ap"
         .byte   $0a
         .byte   $29
         .byte   $7f
         .byte   $c1
         .byte   $f0
         .byte   $06
         .byte   $20
         .byte   $c1
         .byte   $ea
         .byte   $a2
         .byte   $4c
         .byte   $c1
         .byte   $d0
         .byte   $a6
         .byte   $60
         .byte   $38
         .byte   $ad
         .byte   $00
         .byte   $9d

@L6170:  sta     MON_A3L
         lda     $9d01
         sta     MON_A3H
         lda     $aa57
         sta     $aa63
         ldy     #$00
         tya
         sta     (MON_A3L),y
         ldy     #$1e
         sec
         lda     MON_A3L
         cmp     ($e9,x)
         and     @L4090+1
         pha
         lda     MON_A3H
         cmp     ($e9,x)
         brk

         .byte   $c1
         .byte   $c8
         .byte   $91
         .byte   $40
         .byte   $aa
         .byte   $c1
         .byte   $ca
         .byte   $68
         .byte   $48
         HiAscii "AHA}=Ag4"
         .byte   $85
         .byte   $44
         HiAscii "=Ah4"
         .byte   $85
         .byte   $45
         .byte   $20
         .byte   $42
         .byte   $ae
         .byte   $a9
         .byte   $a0
         .byte   $20
         HiAscii "AmA}Ch "
         .byte   $1d
         HiAscii "=AF4"
         .byte   $20
         HiAscii "AmA}Ah"
         .byte   $88
         .byte   $10
         .byte   $c1
         .byte   $f6
         .byte   $20
         .byte   $2f
         .byte   $ae
         .byte   $20
         .byte   $30
         .byte   $b2
         .byte   $90
         .byte   $a7

         bcs     @L6170
         jmp     $b37f

         lda     #$8d
         jsr     $edc1
@L61DA:  cmp     ($fd,x)
         cmp     ($ce,x)
         sta     $c1b3,x
         bne     @L61E9+2
         jsr     $c10c
         sbc     L15A9,x
@L61E9:  sta     $b39d
         rts

         ldy     #$02
         lda     #$00
         pha
         lda     MON_A5L
         cmp     ($d9,x)
         ldy     $b3
         bcc     @L620B+1
         cmp     ($f9,x)
         ldy     $b3
         sta     MON_A5L
         lda     MON_A5H
         cmp     ($e9,x)
         brk

         sta     MON_A5H
         pla
         adc     #$00
         pha
@L620B:  jmp     $ae47

         pla
         ora     #$b0
         jsr     $edc1
         cmp     ($fd,x)
         dey
         bpl     @L61DA
         .byte   $db
         .byte   $60
         .byte   $20
         .byte   $08
         .byte   $af
         .byte   $a0
         .byte   $00
         .byte   $8c
         .byte   $c1
         .byte   $c5
         .byte   $b5
         .byte   $b1
         .byte   $42
         .byte   $99
         .byte   $c1
         .byte   $d1
         .byte   $b5
         .byte   $c1
         .byte   $c8
         .byte   $c1
         .byte   $c0
         .byte   $2d
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f6
         .byte   $18
         .byte   $60
         .byte   $20
         .byte   $08
         .byte   $af
         .byte   $a0
         .byte   $00
         .byte   $b9
         .byte   $c1
         .byte   $d1
         .byte   $b5
         .byte   $91
         .byte   $42
         .byte   $c1
         .byte   $c8
         .byte   $c1
         .byte   $c0
         .byte   $2d
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f6
         .byte   $60
         .byte   $20
         .byte   $c1
         .byte   $dc
         .byte   $ab
         .byte   $a9
         .byte   $04
         .byte   $20
         .byte   $58
         .byte   $b0
         .byte   $ad
         .byte   $c1
         .byte   $f9
         .byte   $b5
         .byte   $49
         .byte   $c1
         .byte   $ff
         .byte   $8d
         .byte   $c1
         .byte   $c1
         .byte   $b3
         .byte   $a9
         .byte   $11
         .byte   $8d
         .byte   $c1
         .byte   $eb
         .byte   $b3
         .byte   $a9
         .byte   $01
         .byte   $8d
         .byte   $c1
         .byte   $ec
         .byte   $b3
         .byte   $a2
         .byte   $38
         .byte   $a9
         .byte   $00
         .byte   $9d
         .byte   $bb
         .byte   $b3
         .byte   $c1
         .byte   $e8
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fa
         .byte   $a2
         .byte   $0c
         .byte   $c1
         .byte   $e0
         .byte   $8c
         .byte   $c1
         .byte   $f0
         .byte   $14
         .byte   $a0
         .byte   $03
         .byte   $b9
         .byte   $a0
         .byte   $b3
         .byte   $9d
         .byte   $c1
         .byte   $f3
         .byte   $b3
         .byte   $c1
         .byte   $e8
         .byte   $88
         .byte   $10
         .byte   $c1
         .byte   $f6
         .byte   $c1
         .byte   $e0
         .byte   $44
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $ec
         .byte   $a2
         .byte   $48
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $e8
         .byte   $20
         .byte   $c1
         .byte   $fb
         .byte   $af
         .byte   $a2
         .byte   $00
         .byte   $8a
         .byte   $9d
         .byte   $bb
         .byte   $b4
         .byte   $c1
         .byte   $e8
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fa
         .byte   $20
         .byte   $45
         .byte   $b0
         .byte   $a9
         .byte   $11
         .byte   $ac
         .byte   $c1
         .byte   $f0
         .byte   $b3
         .byte   $c2
         .byte   $88
         .byte   $8d
         .byte   $c1
         .byte   $ec
         .byte   $b7
         .byte   $8d
         .byte   $bc
         .byte   $b4
         .byte   $8c
         .byte   $bd
         .byte   $b4
         .byte   $c1
         .byte   $c8
         .byte   $8c
         .byte   $c1
         .byte   $ed
         .byte   $b7
         .byte   $a9
         .byte   $02
         .byte   $20
         .byte   $58
         .byte   $b0
         .byte   $ac
         .byte   $bd
         .byte   $b4
         .byte   $88
         .byte   $30
         .byte   $05
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $ec
         .byte   $98
         .byte   $c1
         .byte   $f0
         .byte   $c1
         .byte   $e6
         .byte   $20
         .byte   $6e
         .byte   $aa
         .byte   $20
         .byte   $8c
         .byte   $a6
         .byte   $c1
         .byte   $f0
         .byte   $38
         .byte   $c1
         .byte   $c9
         .byte   $8d
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f7
         .byte   $c1
         .byte   $f0
         .byte   $c1
         .byte   $e5
         .byte   $60
         .byte   $20
         .byte   $5e
         .byte   $a6
         .byte   $b0
         .byte   $66
         .byte   $ad
         .byte   $5c
         .byte   $aa
         .byte   $8d
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $a9
         .byte   $04
         .byte   $8d
         .byte   $bb
         .byte   $b5
         .byte   $a9
         .byte   $01
         .byte   $8d
         .byte   $bc
         .byte   $b5
         .byte   $4c
         .byte   $a8
         .byte   $a6
         .byte   $20
         .byte   $5e
         .byte   $a6
         .byte   $b0
         .byte   $4e
         .byte   $a9
         .byte   $06
         .byte   $8d
         .byte   $52
         .byte   $aa
         .byte   $20
         .byte   $8c
         .byte   $a6
         .byte   $c1
         .byte   $d0
         .byte   $0f
         .byte   $20
         .byte   $c1
         .byte   $fc
         .byte   $a2
         .byte   $a9
         .byte   $03
         .byte   $c1
         .byte   $cd
         .byte   $52
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $c1
         .byte   $ce
         .byte   $a9
         .byte   $05
         .byte   $4c
         .byte   $c1
         .byte   $d2
         .byte   $a6
         .byte   $c1
         .byte   $c9
         .byte   $c1
         .byte   $e0
         .byte   $90
         .byte   $02
         .byte   $29
         .byte   $7f
         .byte   $8d
         .byte   $5c
         .byte   $aa
         .byte   $ae
         .byte   $5a
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $09
         .byte   $c1
         .byte   $ca
         .byte   $bd
         .byte   $00
         .byte   $02
         .byte   $09
         .byte   $80
         .byte   $9d
         .byte   $00
         .byte   $02
         .byte   $4c
         .byte   $b3
         .byte   $9f
         .byte   $48
         .byte   $ad
         .byte   $b6
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $0e
         .byte   $a6
         .byte   $76
         .byte   $c1
         .byte   $e8
         .byte   $c1
         .byte   $f0
         .byte   $0d
         .byte   $a6
         .byte   $33
         .byte   $c1
         .byte   $e0
         .byte   $c1
         .byte   $dd
         .byte   $c1
         .byte   $f0
         .byte   $07
         .byte   $68
         .byte   $18
         .byte   $60
         .byte   $a5
         .byte   $c1
         .byte   $d9
         .byte   $30
         .byte   $c1
         .byte   $f9
         .byte   $68
         .byte   $38
         .byte   $60
         .byte   $20
         .byte   $c1
         .byte   $fc
         .byte   $a2
         .byte   $20
         .byte   $5b
         .byte   $a7
         .byte   $4c
         .byte   $b3
         .byte   $9f
         .byte   $20
         .byte   $9d
         .byte   $a6
         .byte   $20
         .byte   $4e
         .byte   $a7
         .byte   $a9
         .byte   $03
         .byte   $c1
         .byte   $d0
         .byte   $a1
         .byte   $a9
         .byte   $03
         .byte   $8d
         .byte   $bb
         .byte   $b5
         .byte   $a9
         .byte   $01
         .byte   $8d
         .byte   $bc
         .byte   $b5
         .byte   $20
         .byte   $a8
         .byte   $a6
         .byte   $ad
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $60
         .byte   $ad
         .byte   $b5
         .byte   $aa
         .byte   $85
         .byte   $41
         .byte   $ad
         .byte   $b4
         .byte   $aa
         .byte   $85
         .byte   $40
         .byte   $60
         .byte   $20
         .byte   $06
         .byte   $ab
         .byte   $90
         .byte   $16
         .byte   $ad
         .byte   $c1
         .byte   $c5
         .byte   $b5
         .byte   $c1
         .byte   $c9
         .byte   $05
         .byte   $c1
         .byte   $f0
         .byte   $03
         .byte   $4c
         .byte   $5e
         .byte   $b6
         .byte   $4c
         .byte   $92
         .byte   $b6
         .byte   $c4
         .byte   $ea
         .byte   $a2
         .byte   $00
         .byte   $8e
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $60
         .byte   $a9
         .byte   $0b
         .byte   $c1
         .byte   $d0
         .byte   $0a
         .byte   $a9
         .byte   $0c
         .byte   $c1
         .byte   $d0
         .byte   $06
         .byte   $a9
         .byte   $0e
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $a9
         .byte   $0d
         .byte   $8d
         .byte   $5c
         .byte   $aa
         .byte   $20
         .byte   $c1
         .byte   $e6
         .byte   $bf
         .byte   $ad
         .byte   $b6
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $04
         .byte   $a5
         .byte   $c1
         .byte   $d8
         .byte   $30
         .byte   $0e
         .byte   $a2
         .byte   $00
         .byte   $20
         .byte   $02
         .byte   $a7
         .byte   $ae
         .byte   $5c
         .byte   $aa
         .byte   $20
         .byte   $02
         .byte   $a7
         .byte   $20
         .byte   $c1
         .byte   $c8
         .byte   $9f
         .byte   $20
         .byte   $51
         .byte   $a8
         .byte   $20
         .byte   $5e
         .byte   $a6
         .byte   $ae
         .byte   $5c
         .byte   $aa
         .byte   $a9
         .byte   $03
         .byte   $b0
         .byte   $03
         .byte   $6c
         .byte   $5a
         .byte   $9d
         .byte   $6c
         HiAscii "3=AH4"
         .byte   $29
         .byte   $7f
         .byte   $0d
         .byte   $9e
         .byte   $b3
         .byte   $9d
         .byte   $c1
         .byte   $c8
         .byte   $b4
         .byte   $20
         .byte   $37
         .byte   $b0
         .byte   $4c
         .byte   $7f
         .byte   $b3
         .byte   $20
         .byte   $00
         .byte   $b3
         .byte   $4c
         .byte   $7f
         .byte   $b3
         .byte   $20
         .byte   $28
         .byte   $ab
         .byte   $20
         .byte   $b6
         .byte   $c2
         .byte   $b0
         .byte   $c1
         .byte   $ef
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $e4
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f6
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $e5
         .byte   $b5
         .byte   $4c
         .byte   $1b
         .byte   $ad
         .byte   $20
         .byte   $28
         .byte   $ab
         .byte   $ae
         .byte   $9c
         .byte   $b3
         .byte   $bd
         .byte   $c1
         .byte   $c8
         .byte   $b4
         .byte   $10
         .byte   $03
         .byte   $4c
         .byte   $7b
         .byte   $b3
         .byte   $ae
         .byte   $9c
         .byte   $b3
         .byte   $bd
         .byte   $c1
         .byte   $c6
         .byte   $b4
         .byte   $8d
         .byte   $c1
         .byte   $d1
         .byte   $b5
         .byte   $9d
         .byte   $c1
         .byte   $e6
         .byte   $b4
         .byte   $a9
         .byte   $c1
         .byte   $ff
         .byte   $9d
         .byte   $c1
         .byte   $c6
         .byte   $b4
         .byte   $bc
         .byte   $c1
         .byte   $c7
         .byte   $b4
         .byte   $8c
         .byte   $c1
         .byte   $d2
         .byte   $b5
         .byte   $20
         .byte   $37
         .byte   $b0
         .byte   $18
         .byte   $20
         .byte   $5e
         .byte   $af
         .byte   $b0
         .byte   $2a
         .byte   $20
         .byte   $0c
         .byte   $af
         .byte   $a0
         .byte   $0c
         .byte   $8c
         .byte   $9c
         .byte   $b3
         .byte   $b1
         .byte   $42
         .byte   $30
         .byte   $0b
         .byte   $c1
         .byte   $f0
         .byte   $09
         .byte   $48
         .byte   $c1
         .byte   $c8
         .byte   $b1
         .byte   $42
         .byte   $a8
         .byte   $68
         .byte   $20
         .byte   $89
         .byte   $ad
         .byte   $ac
         .byte   $9c
         .byte   $b3
         .byte   $c2
         .byte   $c8
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $e7
         .byte   $ad
         .byte   $c1
         .byte   $d3
         .byte   $b5
         .byte   $ac
         .byte   $c1
         .byte   $d4
         .byte   $b5
         .byte   $20
         .byte   $89
         .byte   $ad
         .byte   $38
         .byte   $b0
         .byte   $c1
         .byte   $d1
         .byte   $20
         .byte   $c1
         .byte   $fb
         .byte   $af
         .byte   $4c
         .byte   $7f
         .byte   $b3
         .byte   $38
         .byte   $20
         .byte   $c1
         .byte   $dd
         .byte   $b2
         .byte   $a9
         .byte   $00
         .byte   $a2
         .byte   $05
         .byte   $9d
         .byte   $c1
         .byte   $f0
         .byte   $b5
         .byte   $c1
         .byte   $ca
         .byte   $10
         .byte   $c1
         .byte   $fa
         .byte   $60
         .byte   $20
         .byte   $c1
         .byte   $dc
         .byte   $ab
         .byte   $a9
         .byte   $c1
         .byte   $ff
         .byte   $8d
         .byte   $c1
         .byte   $f9
         .byte   $b5
         .byte   $20
         .byte   $c1
         .byte   $f7
         .byte   $af
         .byte   $a9
         .byte   $16
         .byte   $8d
         .byte   $9d
         .byte   $b3
         .byte   $20
         .byte   $2f
         .byte   $ae
         .byte   $20
         .byte   $2f
         .byte   $ae
         .byte   $a2
         .byte   $0b
         .byte   $bd
         .byte   $af
         .byte   $b3
         .byte   $20
         .byte   $c1
         .byte   $ed
         .byte   $c1
         .byte   $fd
         .byte   $c1
         .byte   $ca
         .byte   $10
         .byte   $c1
         .byte   $f7
         .byte   $c1
         .byte   $ea
         .byte   $a9
         .byte   $00
         .byte   $85
         .byte   $40
         .byte   $85
         .byte   $41
         .byte   $20
         .byte   $69
         .byte   $ba
         .byte   $20
         .byte   $2f
         .byte   $ae
         .byte   $20
         .byte   $2f
         .byte   $ae
         .byte   $18
         .byte   $20
         .byte   $11
         .byte   $c2
         .byte   $b0
         .byte   $5d
         .byte   $a2
         .byte   $00
         .byte   $8e
         .byte   $9c
         .byte   $b3
         .byte   $bd
         .byte   $c1
         .byte   $c6
         .byte   $b4
         .byte   $c1
         .byte   $f0
         .byte   $53
         .byte   $30
         .byte   $4a
         .byte   $c2
         .byte   $a0
         .byte   $bd
         .byte   $c1
         .byte   $c8
         .byte   $b4
         .byte   $10
         .byte   $02
         .byte   $a0
         .byte   $aa
         .byte   $98
         .byte   $20
         .byte   $c1
         .byte   $ed
         .byte   $c1
         .byte   $fd
         .byte   $bd
         .byte   $c1
         .byte   $c8
         .byte   $b4
         .byte   $29
         .byte   $7f
         .byte   $a0
         .byte   $07
         .byte   $c2
         .byte   $0a
         .byte   $b0
         .byte   $03
         .byte   $88
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fa
         .byte   $b9
         .byte   $a7
         .byte   $b3
         .byte   $20
         .byte   $c1
         .byte   $ed
         .byte   $c1
         .byte   $fd
         .byte   $a9
         .byte   $a0
         .byte   $20
         .byte   $c1
         .byte   $ed
         .byte   $33
         .byte   $85
         .byte   $c1
         .byte   $d8
         .byte   $4c
         .byte   $c1
         .byte   $d2
         .byte   $c1
         .byte   $d7
         .byte   $20
         .byte   $65
         .byte   $0e
         .byte   $85
         .byte   $33
         .byte   $85
         .byte   $c1
         .byte   $d8
         .byte   $4c
         .byte   $c1
         .byte   $d4
         .byte   $0f
         .byte   $20
         .byte   $26
         .byte   $a5
         .byte   $a9
         .byte   $05
         .byte   $8d
         .byte   $52
         .byte   $aa
         .byte   $4c
         .byte   $83
         .byte   $9f
         .byte   $20
         .byte   $26
         .byte   $a5
         .byte   $a9
         .byte   $01
         .byte   $8d
         .byte   $51
         .byte   $aa
         .byte   $4c
         .byte   $83
         .byte   $9f
         .byte   $20
         .byte   $64
         .byte   $a7
         .byte   $90
         .byte   $06
         .byte   $20
         .byte   $a3
         .byte   $a2
         .byte   $4c
         .byte   $34
         .byte   $a5
         .byte   $20
         .byte   $4e
         .byte   $a7
         .byte   $ad
         .byte   $65
         .byte   $aa
         .byte   $29
         .byte   $06
         .byte   $c1
         .byte   $f0
         .byte   $13
         .byte   $a2
         .byte   $03
         .byte   $bd
         .byte   $6e
         .byte   $aa
         .byte   $9d
         .byte   $bd
         .byte   $b5
         .byte   $c1
         .byte   $ca
         .byte   $10
         .byte   $c1
         .byte   $f7
         .byte   $a9
         .byte   $0a
         .byte   $8d
         .byte   $bb
         .byte   $b5
         .byte   $20
         .byte   $a8
         .byte   $a6
         .byte   $60
         .byte   $a9
         .byte   $40
         .byte   $2d
         .byte   $65
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $05
         .byte   $ad
         .byte   $66
         .byte   $aa
         .byte   $c1
         .byte   $d0
         .byte   $05
         .byte   $a9
         .byte   $c1
         .byte   $fe
         .byte   $8d
         .byte   $66
         .byte   $aa
         .byte   $ad
         .byte   $0d
         .byte   $9d
         .byte   $8d
         .byte   $bc
         .byte   $b5
         .byte   $a9
         .byte   $0b
         .byte   $20
         .byte   $aa
         .byte   $a2
         .byte   $4c
         .byte   $97
         .byte   $a3
         .byte   $a9
         .byte   $06
         .byte   $20
         .byte   $aa
         .byte   $a2
         .byte   $ad
         .byte   $bf
         .byte   $b5
         .byte   $8d
         .byte   $66
         .byte   $aa
         .byte   $60
         .byte   $a9
         .byte   $4c
         .byte   $20
         .byte   $b2
         .byte   $a5
         .byte   $c1
         .byte   $f0
         .byte   $2e
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $b6
         .byte   $aa
         .byte   $a0
         .byte   $1e
         .byte   $20
         .byte   $97
         .byte   $a0
         .byte   $a2
         .byte   $09
         .byte   $bd
         .byte   $b7
         .byte   $aa
         .byte   $9d
         .byte   $74
         .byte   $aa
         .byte   $c1
         .byte   $ca
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f7
         .byte   $a9
         .byte   $c1
         .byte   $c0
         .byte   $8d
         .byte   $51
         .byte   $aa
         .byte   $4c
         .byte   $c1
         .byte   $d1
         .byte   $a4
         .byte   $a9
         .byte   $c2
         .byte   $20
         .byte   $b2
         .byte   $a5
         .byte   $c1
         .byte   $f0
         .byte   $05
         .byte   $a9
         .byte   $01
         .byte   $4c
         .byte   $c1
         .byte   $d2
         .byte   $a6
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $b7
         .byte   $aa
         .byte   $4c
         .byte   $84
         .byte   $9d
         .byte   $c1
         .byte   $cd
         .byte   $00
         .byte   $c1
         .byte   $e0
         .byte   $c1
         .byte   $f0
         .byte   $0e
         .byte   $8d
         .byte   $80
         .byte   $c1
         .byte   $c0
         .byte   $c1
         .byte   $cd
         .byte   $00
         .byte   $c1
         .byte   $e0
         .byte   $c1
         .byte   $f0
         .byte   $06
         .byte   $8d
         .byte   $81
         .byte   $c1
         .byte   $c0
         .byte   $c1
         .byte   $cd
         .byte   $00
         .byte   $c1
         .byte   $e0
         .byte   $60
         .byte   $20
         .byte   $a3
         .byte   $a2
         .byte   $ad
         .byte   $4f
         .byte   $aa
         .byte   $8d
         .byte   $b4
         .byte   $aa
         .byte   $ad
         .byte   $50
         .byte   $aa
         .byte   $8d
         .byte   $b5
         .byte   $aa
         .byte   $ad
         .byte   $75
         .byte   $aa
         .byte   $8d
         .byte   $b3
         .byte   $aa
         .byte   $c1
         .byte   $d0
         .byte   $0e
         .byte   $20
         .byte   $64
         .byte   $a7
         .byte   $90
         .byte   $06
         .byte   $20
         .byte   $a3
         .byte   $a2
         .byte   $4c
         .byte   $c1
         .byte   $eb
         .byte   $a5
         .byte   $20
         .byte   $4e
         .byte   $a7
         .byte   $ad
         .byte   $65
         .byte   $aa
         .byte   $29
         .byte   $04
         .byte   $c1
         .byte   $f0
         .byte   $1b
         .byte   $ad
         .byte   $6e
         .byte   $aa
         .byte   $c1
         .byte   $d0
         .byte   $08
         .byte   $ae
         .byte   $6f
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $11
         .byte   $c1
         .byte   $ce
         .byte   $6f
         .byte   $aa
         .byte   $c1
         .byte   $ce
         .byte   $a9
         .byte   $11
         .byte   $8d
         .byte   $c1
         .byte   $fa
         .byte   $b5
         .byte   $60
         .byte   $20
         .byte   $1d
         .byte   $af
         .byte   $20
         .byte   $34
         .byte   $af
         .byte   $20
         .byte   $c1
         .byte   $c3
         .byte   $b2
         .byte   $a9
         .byte   $02
         .byte   $2d
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $c1
         .byte   $f0
         .byte   $21
         .byte   $20
         .byte   $c1
         .byte   $f7
         .byte   $af
         .byte   $a9
         .byte   $00
         .byte   $18
         .byte   $20
         .byte   $11
         .byte   $b0
         .byte   $38
         .byte   $c1
         .byte   $ce
         .byte   $c1
         .byte   $d8
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f7
         .byte   $ae
         .byte   $c1
         .byte   $d9
         .byte   $b5
         .byte   $ad
         .byte   $c1
         .byte   $ee
         .byte   $b5
         .byte   $9d
         .byte   $c1
         .byte   $e7
         .byte   $b4
         .byte   $ad
         .byte   $c1
         .byte   $ef
         .byte   $b5
         .byte   $9d
         .byte   $c1
         .byte   $e8
         .byte   $b4
         .byte   $20
         .byte   $37
         .byte   $b0
         .byte   $4c
         .byte   $7f
         .byte   $b3
         .byte   $20
         .byte   $28
         .byte   $ab
         .byte   $ad
         .byte   $c1
         .byte   $f6
         .byte   $b5
         .byte   $30
         .byte   $2b
         .byte   $ad
         .byte   $bd
         .byte   $b5
         .byte   $85
         .byte   $42
         .byte   $ad
         .byte   $be
         .byte   $b5
         .byte   $85
         .byte   $43
         .byte   $ae
         .byte   $9c
         .byte   $b3
         .byte   $20
         .byte   $1c
         .byte   $b2
         .byte   $20
         .byte   $37
         .byte   $b0
         .byte   $4c
         .byte   $7f
         .byte   $b3
         .byte   $ad
         .byte   $bc
         .byte   $b5
         .byte   $c1
         .byte   $c9
         .byte   $05
         .byte   $b0
         .byte   $0b
         .byte   $0a
         .byte   $aa
         .byte   $bd
         .byte   $c1
         .byte   $e6
         .byte   $aa
         .byte   $48
         .byte   $bd
         .byte   $c1
         .byte   $e5
         .byte   $aa
         .byte   $48
         .byte   $60
         .byte   $4c
         .byte   $67
         .byte   $b3
         .byte   $4c
         .byte   $7b
         .byte   $b3
         .byte   $ad
         .byte   $c1
         .byte   $f6
         .byte   $b5
         .byte   $30
         .byte   $c1
         .byte   $f8
         .byte   $ad
         .byte   $bc
         .byte   $b5
         .byte   $c1
         .byte   $c9
         .byte   $05
         .byte   $b0
         .byte   $c1
         .byte   $ee
         .byte   $0a
         .byte   $aa
         .byte   $bd
         .byte   $c1
         .byte   $f2
         .byte   $aa
         .byte   $48
         .byte   $bd
         .byte   $c1
         .byte   $f1
         .byte   $aa
         .byte   $48
         .byte   $60
         .byte   $20
         .byte   $00
         .byte   $b3
         .byte   $20
         .byte   $a8
         .byte   $ac
         .byte   $8d
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $4c
         .byte   $7f
         .byte   $b3
         .byte   $20
         .byte   $00
         .byte   $b3
         .byte   $20
         .byte   $b5
         .byte   $b1
         .byte   $20
         .byte   $a8
         .byte   $ac
         .byte   $48
         .byte   $20
         .byte   $a2
         .byte   $b1
         .byte   $a0
         .byte   $00
         .byte   $68
         .byte   $91
         .byte   $42
         .byte   $4c
         .byte   $96
         .byte   $ac
         .byte   $20
         .byte   $b6
         .byte   $c2
         .byte   $b0
         .byte   $0b
         .byte   $b1
         .byte   $42
         .byte   $48
         .byte   $20
         .byte   $5b
         .byte   $b1
         .byte   $20
         .byte   $94
         .byte   $b1
         .byte   $68
         .byte   $60
         .byte   $4c
         .byte   $6f
         .byte   $b3
         .byte   $20
         .byte   $00
         .byte   $b3
         .byte   $ad
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $20
         .byte   $c1
         .byte   $da
         .byte   $ac
         .byte   $4c
         .byte   $7f
         .byte   $b3
         .byte   $20
         .byte   $00
         .byte   $b3
         .byte   $20
         .byte   $a2
         .byte   $b1
         .byte   $a0
         .byte   $00
         .byte   $b1
         .byte   $42
         .byte   $20
         .byte   $c1
         .byte   $da
         .byte   $ac
         .byte   $20
         .byte   $b5
         .byte   $b1
         .byte   $4c
         .byte   $c1
         .byte   $ca
         .byte   $ac
         .byte   $48
         .byte   $20
         .byte   $b6
         .byte   $b0
         .byte   $68
         .byte   $91
         .byte   $42
         .byte   $a9
         .byte   $40
         .byte   $0d
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $20
         .byte   $5b
         .byte   $b1
         .byte   $4c
         .byte   $94
         .byte   $b1
         .byte   $a9
         .byte   $80
         .byte   $8d
         .byte   $9e
         .byte   $b3
         .byte   $c1
         .byte   $d0
         .byte   $05
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $9e
         .byte   $b3
         .byte   $20
         .byte   $28
         .byte   $ab
         .byte   $ae
         .byte   $9c
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $c4
         .byte   $b5
         .byte   $a9
         .byte   $02
         .byte   $4c
         .byte   $86
         .byte   $b6
         .byte   $20
         .byte   $a8
         .byte   $a6
         .byte   $4c
         .byte   $c1
         .byte   $ea
         .byte   $a2
         .byte   $4c
         .byte   $c1
         .byte   $d0
         .byte   $a6
         .byte   $20
         .byte   $16
         .byte   $a3
         .byte   $20
         .byte   $a8
         .byte   $a2
         .byte   $a9
         .byte   $23
         .byte   $2d
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $c2
         .byte   $f0
         .byte   $8d
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $ad
         .byte   $b6
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $28
         .byte   $a9
         .byte   $02
         .byte   $20
         .byte   $b1
         .byte   $a4
         .byte   $20
         .byte   $7a
         .byte   $a4
         .byte   $18
         .byte   $65
         .byte   $67
         .byte   $aa
         .byte   $98
         .byte   $65
         .byte   $68
         .byte   $c1
         .byte   $c5
         .byte   $74
         .byte   $b0
         .byte   $70
         .byte   $85
         .byte   $b0
         .byte   $85
         .byte   $6a
         .byte   $86
         .byte   $af
         .byte   $86
         .byte   $69
         .byte   $a6
         .byte   $67
         .byte   $a4
         .byte   $68
         .byte   $20
         .byte   $71
         .byte   $a4
         .byte   $20
         .byte   $51
         .byte   $a8
         .byte   $6c
         .byte   $60
         .byte   $9d
         .byte   $a9
         .byte   $01
         .byte   $20
         .byte   $b1
         .byte   $a4
         .byte   $20
         .byte   $7a
         .byte   $a4
         .byte   $38
         .byte   $a5
         .byte   $4c
         .byte   $c1
         .byte   $ed
         .byte   $60
         .byte   $c2
         .byte   $aa
         .byte   $a5
         .byte   $4d
         .byte   $c1
         .byte   $ed
         .byte   $61
         .byte   $aa
         .byte   $90
         .byte   $45
         .byte   $a8
         .byte   $c1
         .byte   $c4
         .byte   $4b
         .byte   $90
         .byte   $40
         .byte   $c1
         .byte   $f0
         .byte   $3e
         .byte   $84
         .byte   $c1
         .byte   $cb
         .byte   $86
         .byte   $c1
         .byte   $ca
         .byte   $8e
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $8c
         .byte   $c1
         .byte   $c4
         .byte   $b5
         .byte   $4c
         .byte   $0a
         .byte   $a4
         .byte   $ad
         .byte   $0a
         .byte   $9d
         .byte   $8d
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $ad
         .byte   $0b
         .byte   $9d
         .byte   $8d
         .byte   $c1
         .byte   $c4
         .byte   $b5
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $a9
         .byte   $02
         .byte   $8d
         .byte   $c1
         .byte   $c1
         .byte   $b5
         .byte   $a9
         .byte   $03
         .byte   $8d
         .byte   $bb
         .byte   $b5
         .byte   $a9
         .byte   $02
         .byte   $8d
         .byte   $bc
         .byte   $b5
         .byte   $20
         .byte   $a8
         .byte   $a6
         .byte   $ad
         .byte   $61
         .byte   $aa
         .byte   $8d
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $a8
         .byte   $ad
         .byte   $60
         .byte   $aa
         .byte   $8d
         .byte   $c1
         .byte   $c1
         .byte   $b5
         .byte   $60
         .byte   $20
         .byte   $c1
         .byte   $ea
         .byte   $a2
         .byte   $4c
         .byte   $c1
         .byte   $cc
         .byte   $a6
         .byte   $c1
         .byte   $cd
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $c1
         .byte   $f0
         .byte   $1a
         .byte   $ae
         .byte   $5f
         .byte   $aa
         .byte   $8e
         .byte   $62
         .byte   $aa
         .byte   $4a
         .byte   $c1
         .byte   $f0
         .byte   $03
         .byte   $4c
         .byte   $9e
         .byte   $a5
         .byte   $a2
         .byte   $1d
         .byte   $bd
         .byte   $75
         .byte   $aa
         .byte   $9d
         .byte   $93
         .byte   $aa
         .byte   $c1
         .byte   $ca
         .byte   $10
         .byte   $c1
         .byte   $f7
         .byte   $4c
         .byte   $7a
         .byte   $a5
         .byte   $60
         .byte   $ad
         .byte   $b6
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $03
         .byte   $8d
         .byte   $b7
         .byte   $aa
         .byte   $20
         .byte   $13
         .byte   $a4
         .byte   $20
         .byte   $c1
         .byte   $c8
         .byte   $9f
         .byte   $20
         .byte   $51
         .byte   $a8
         .byte   $6c
         .byte   $58
         .byte   $9d
         .byte   $a5
         .byte   $4a
         .byte   $85
         .byte   $c1
         .byte   $cc
         .byte   $a5
         .byte   $4b
         .byte   $85
         .byte   $c1
         .byte   $cd
         .byte   $6c
         .byte   $56
         .byte   $9d
         .byte   $20
         .byte   $16
         .byte   $a4
         .byte   $20
         .byte   $c1
         .byte   $c8
         .byte   $9f
         .byte   $20
         .byte   $51
         .byte   $a8
         .byte   $6c
         .byte   $56
         .byte   $9d
         .byte   $20
         .byte   $65
         .byte   $c1
         .byte   $d6
         .byte   $85
         .byte   $02
         .byte   $a2
         .byte   $02
         .byte   $8e
         .byte   $5f
         .byte   $aa
         .byte   $ba
         .byte   $8e
         .byte   $9b
         .byte   $b3
         .byte   $20
         .byte   $6a
         .byte   $ae
         .byte   $ad
         .byte   $bb
         .byte   $b5
         .byte   $c1
         .byte   $c9
         .byte   $0d
         .byte   $b0
         .byte   $0b
         .byte   $0a
         .byte   $aa
         .byte   $bd
         .byte   $c1
         .byte   $ca
         .byte   $aa
         .byte   $48
         .byte   $bd
         .byte   $c1
         .byte   $c9
         .byte   $aa
         .byte   $48
         .byte   $60
         .byte   $4c
         .byte   $63
         .byte   $b3
         .byte   $20
         .byte   $28
         .byte   $ab
         .byte   $4c
         .byte   $7f
         .byte   $b3
         .byte   $20
         .byte   $c1
         .byte   $dc
         .byte   $ab
         .byte   $a9
         .byte   $01
         .byte   $8d
         .byte   $c1
         .byte   $e3
         .byte   $b5
         .byte   $ae
         .byte   $be
         .byte   $b5
         .byte   $ad
         .byte   $bd
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $05
         .byte   $c1
         .byte   $e0
         .byte   $00
         .byte   $c1
         .byte   $d0
         .byte   $01
         .byte   $c1
         .byte   $e8
         .byte   $8d
         .byte   $c1
         .byte   $e8
         .byte   $b5
         .byte   $8e
         .byte   $c1
         .byte   $e9
         .byte   $b5
         .byte   $20
         .byte   $c1
         .byte   $c9
         .byte   $b1
         .byte   $90
         .byte   $5e
         .byte   $8e
         .byte   $9c
         .byte   $b3
         .byte   $ae
         .byte   $5f
         .byte   $aa
         .byte   $bd
         .byte   $09
         .byte   $a9
         .byte   $ae
         .byte   $9c
         .byte   $b3
         .byte   $4a
         .byte   $b0
         .byte   $0d
         .byte   $ad
         .byte   $51
         .byte   $aa
         .byte   $c1
         .byte   $c9
         .byte   $c1
         .byte   $c0
         .byte   $c1
         .byte   $d0
         .byte   $03
         .byte   $4c
         .byte   $5f
         .byte   $b3
         .byte   $4c
         .byte   $73
         .byte   $b3
         .byte   $a9
         .byte   $00
         .byte   $9d
         .byte   $c1
         .byte   $e8
         .byte   $b4
         .byte   $a9
         .byte   $01
         .byte   $9d
         .byte   $c1
         .byte   $e7
         .byte   $b4
         .byte   $8e
         .byte   $9c
         .byte   $b3
         .byte   $20
         .byte   $44
         .byte   $b2
         .byte   $ae
         .byte   $9c
         .byte   $b3
         .byte   $9d
         .byte   $c1
         .byte   $c7
         .byte   $b4
         .byte   $8d
         .byte   $c1
         .byte   $d2
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $d4
         .byte   $b5
         .byte   $ad
         .byte   $c1
         .byte   $f1
         .byte   $b5
         .byte   $9d
         .byte   $c1
         .byte   $c6
         .byte   $b4
         .byte   $8d
         .byte   $c1
         .byte   $d1
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $d3
         .byte   $b5
         .byte   $ad
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $9d
         .byte   $c1
         .byte   $c8
         .byte   $b4
         .byte   $20
         .byte   $37
         .byte   $b0
         .byte   $20
         .byte   $0c
         .byte   $af
         .byte   $20
         .byte   $c1
         .byte   $d6
         .byte   $b7
         .byte   $20
         .byte   $3a
         .byte   $af
         .byte   $ae
         .byte   $9c
         .byte   $b3
         .byte   $a9
         .byte   $06
         .byte   $8d
         .byte   $c1
         .byte   $c5
         .byte   $b5
         .byte   $bd
         .byte   $c1
         .byte   $c6
         .byte   $b4
         .byte   $8d
         .byte   $c1
         .byte   $d1
         .byte   $b5
         .byte   $bd
         .byte   $c1
         .byte   $c7
         .byte   $b4
         .byte   $8d
         .byte   $c1
         .byte   $d2
         .byte   $b5
         .byte   $bd
         .byte   $c1
         .byte   $c8
         .byte   $b4
         .byte   $8d
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $f6
         .byte   $b5
         .byte   $bd
         .byte   $c1
         .byte   $e7
         .byte   $b4
         .byte   $8d
         .byte   $c1
         .byte   $ee
         .byte   $b5
         .byte   $bd
         .byte   $c1
         .byte   $e8
         .byte   $b4
         .byte   $8d
         .byte   $c1
         .byte   $ef
         .byte   $b5
         .byte   $8e
         .byte   $c1
         .byte   $d9
         .byte   $b5
         .byte   $a9
         .byte   $c1
         .byte   $ff
         .byte   $8d
         .byte   $c1
         .byte   $e0
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $e1
         .byte   $b5
         .byte   $ad
         .byte   $c1
         .byte   $e2
         .byte   $b3
         .byte   $8d
         .byte   $c1
         .byte   $da
         .byte   $b5
         .byte   $18
         .byte   $4c
         .byte   $5e
         .byte   $af
         .byte   $a9
         .byte   $00
         .byte   $aa
         .byte   $9d
         .byte   $c1
         .byte   $d1
         .byte   $b5
         .byte   $c1
         .byte   $e8
         .byte   $c1
         .byte   $e0
         .byte   $2d
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f8
         .byte   $ad
         .byte   $bf
         .byte   $b5
         .byte   $49
         .byte   $c1
         .byte   $ff
         .byte   $8d
         .byte   $c1
         .byte   $f9
         .byte   $b5
         .byte   $ad
         .byte   $c1
         .byte   $c0
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $f8
         .byte   $b5
         .byte   $ad
         .byte   $c1
         .byte   $c1
         .byte   $b5
         .byte   $c4
         .byte   $0a
         .byte   $aa
         .byte   $8e
         .byte   $c1
         .byte   $f7
         .byte   $b5
         .byte   $05
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $b3
         .byte   $aa
         .byte   $a0
         .byte   $00
         .byte   $98
         .byte   $91
         .byte   $40
         .byte   $20
         .byte   $4e
         .byte   $a7
         .byte   $a9
         .byte   $02
         .byte   $8d
         .byte   $bb
         .byte   $b5
         .byte   $4c
         .byte   $a8
         .byte   $a6
         .byte   $20
         .byte   $92
         .byte   $a7
         .byte   $c1
         .byte   $d0
         .byte   $05
         .byte   $20
         .byte   $9a
         .byte   $a7
         .byte   $c1
         .byte   $f0
         .byte   $10
         .byte   $20
         .byte   $af
         .byte   $a7
         .byte   $c1
         .byte   $f0
         .byte   $c1
         .byte   $f6
         .byte   $20
         .byte   $aa
         .byte   $a7
         .byte   $c1
         .byte   $f0
         .byte   $c1
         .byte   $f1
         .byte   $20
         .byte   $c1
         .byte   $fc
         .byte   $a2
         .byte   $4c
         .byte   $16
         .byte   $a3
         .byte   $60
         .byte   $a9
         .byte   $09
         .byte   $2d
         .byte   $65
         .byte   $aa
         .byte   $c1
         .byte   $c9
         .byte   $09
         .byte   $c1
         .byte   $f0
         .byte   $03
         .byte   $4c
         .byte   $00
         .byte   $a0
         .byte   $a9
         .byte   $04
         .byte   $20
         .byte   $c1
         .byte   $d5
         .byte   $a3
         .byte   $ad
         .byte   $73
         .byte   $aa
         .byte   $ac
         .byte   $72
         .byte   $aa
         .byte   $20
         .byte   $c1
         .byte   $e0
         .byte   $a3
         .byte   $ad
         .byte   $6d
         .byte   $aa
         .byte   $ac
         .byte   $6c
         .byte   $aa
         .byte   $20
         .byte   $c1
         .byte   $e0
         .byte   $a3
         .byte   $ad
         .byte   $73
         .byte   $aa
         .byte   $ac
         .byte   $72
         .byte   $aa
         .byte   $4c
         .byte   $c1
         .byte   $ff
         .byte   $a3
         .byte   $20
         .byte   $a8
         .byte   $a2
         .byte   $a9
         .byte   $7f
         .byte   $2d
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $c1
         .byte   $c9
         .byte   $04
         .byte   $c1
         .byte   $f0
         .byte   $03
         .byte   $4c
         .byte   $c1
         .byte   $d0
         .byte   $a6
         .byte   $a9
         .byte   $04
         .byte   $20
         .byte   $c1
         .byte   $d5
         .byte   $a3
         .byte   $20
         .byte   $7a
         .byte   $a4
         .byte   $aa
         .byte   $ad
         .byte   $65
         .byte   $aa
         .byte   $29
         .byte   $01
         .byte   $c1
         .byte   $d0
         .byte   $06
         .byte   $8e
         .byte   $72
         .byte   $aa
         .byte   $8c
         .byte   $73
         .byte   $aa
         .byte   $20
         .byte   $7a
         .byte   $a4
         .byte   $ae
         .byte   $72
         .byte   $aa
         .byte   $ac
         .byte   $73
         .byte   $aa
         .byte   $4c
         .byte   $71
         .byte   $a4
         .byte   $20
         .byte   $5d
         .byte   $a3
         .byte   $20
         .byte   $51
         .byte   $a8
         .byte   $6c
         .byte   $72
         .byte   $aa
         .byte   $ad
         .byte   $b6
         .byte   $aa
         .byte   $c1
         .byte   $f0
         .byte   $20
         .byte   $a5
         .byte   $c1
         .byte   $d6
         .byte   $10
         .byte   $03
         .byte   $4c
         .byte   $c1
         .byte   $cc
         .byte   $a6
         .byte   $a9
         .byte   $02
         .byte   $20
         .byte   $c1
         .byte   $d5
         .byte   $a3
         .byte   $38
         .byte   $a5
         .byte   $af
         .byte   $c1
         .byte   $e5
         .byte   $67
         .byte   $a8
         .byte   $a5
         .byte   $b0
         .byte   $c1
         .byte   $e5
         .byte   $68
         .byte   $20
         .byte   $c1
         .byte   $e0
         .byte   $a3
         .byte   $a5
         .byte   $68
         .byte   $a4
         .byte   $67
         .byte   $4c
         .byte   $c1
         .byte   $ff
         .byte   $a3
         .byte   $a9
         .byte   $01
         .byte   $20
         .byte   $c1
         .byte   $d5
         .byte   $a3
         .byte   $38
         .byte   $a5
         .byte   $4c
         .byte   $c1
         .byte   $e5
         .byte   $c1
         .byte   $ca
         .byte   $a8
         .byte   $a5
         .byte   $4d
         .byte   $c1
         .byte   $e5
         .byte   $c1
         .byte   $cb
         .byte   $20
         .byte   $c1
         .byte   $e0
         .byte   $a3
         .byte   $a5
         .byte   $c1
         .byte   $cb
         .byte   $a4
         .byte   $c1
         .byte   $ca
         .byte   $4c
         .byte   $c1
         .byte   $ff
         .byte   $a3
         .byte   $8d
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $48
         .byte   $20
         .byte   $a8
         .byte   $a2
         .byte   $68
         .byte   $4c
         .byte   $c1
         .byte   $c4
         .byte   $a7
         .byte   $8c
         .byte   $c1
         .byte   $c1
         .byte   $b5
         .byte   $8c
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $a9
         .byte   $04
         .byte   $8d
         .byte   $bb
         .byte   $b5
         .byte   $a9
         .byte   $01
         .byte   $8d
         .byte   $bc
         .byte   $b5
         .byte   $20
         .byte   $a8
         .byte   $a6
         .byte   $ad
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $4c
         .byte   $a8
         .byte   $a6
         .byte   $8c
         .byte   $41
         .byte   $56
         .byte   $41
         .byte   $49
         .byte   $4c
         .byte   $41
         .byte   $42
         .byte   $4c
         .byte   $c1
         .byte   $c5
         .byte   $46
         .byte   $49
         .byte   $4c
         .byte   $45
         .byte   $20
         .byte   $54
         .byte   $59
         .byte   $50
         .byte   $45
         .byte   $20
         .byte   $4d
         .byte   $49
         .byte   $53
         .byte   $4d
         .byte   $41
         .byte   $54
         .byte   $43
         .byte   $c1
         .byte   $c8
         .byte   $50
         .byte   $52
         .byte   $4f
         .byte   $47
         .byte   $52
         .byte   $41
         .byte   $4d
         .byte   $20
         .byte   $54
         .byte   $c2
         .byte   $4f
         .byte   $20
         .byte   $4c
         .byte   $41
         .byte   $52
         .byte   $47
         .byte   $c1
         .byte   $c5
         .byte   $4e
         .byte   $4f
         .byte   $54
         .byte   $20
         .byte   $44
         .byte   $49
         .byte   $52
         .byte   $45
         .byte   $43
         .byte   $54
         .byte   $20
         .byte   $43
         .byte   $4f
         .byte   $c2
         .byte   $4d
         .byte   $41
         .byte   $4e
         .byte   $c1
         .byte   $c4
         .byte   $8d
         .byte   $00
         .byte   $03
         .byte   $c2
         .byte   $19
         .byte   $24
         .byte   $33
         .byte   $3e
         .byte   $4c
         .byte   $5b
         .byte   $64
         .byte   $6d
         .byte   $78
         .byte   $84
         .byte   $98
         .byte   $aa
         .byte   $bb
         .byte   $2d
         .byte   $98
         .byte   $c2
         .byte   $00
         .byte   $c1
         .byte   $f0
         .byte   $c1
         .byte   $fd
         .byte   $1b
         .byte   $c1
         .byte   $fd
         .byte   $c2
         .byte   $03
         .byte   $c1
         .byte   $f4
         .byte   $0c
         .byte   $28
         .byte   $8d
         .byte   $0c
         .byte   $c2
         .byte   $00
         .byte   $02
         .byte   $c2
         .byte   $00
         .byte   $0b
         .byte   $01
         .byte   $30
         .byte   $c1
         .byte   $fe
         .byte   $00
         .byte   $02
         .byte   $00
         .byte   $06
         .byte   $00
         .byte   $01
         .byte   $c6
         .byte   $00
         .byte   $c1
         .byte   $d0
         .byte   $00
         .byte   $c1
         .byte   $c1
         .byte   $fb
         .byte   $a0
         .byte   $03
         .byte   $84
         .byte   $c3
         .byte   $00
         .byte   $40
         .byte   $00
         .byte   $c1
         .byte   $c1
         .byte   $c2
         .byte   $d0
         .byte   $c1
         .byte   $cc
         .byte   $c1
         .byte   $c5
         .byte   $c1
         .byte   $d3
         .byte   $c1
         .byte   $cf
         .byte   $c1
         .byte   $c6
         .byte   $c1
         .byte   $d4
         .byte   $c1
         .byte   $e8
         .byte   $b7
         .byte   $bb
         .byte   $b3
         .byte   $bb
         .byte   $b4
         .byte   $00
         .byte   $c1
         .byte   $c0
         .byte   $7e
         .byte   $b3
         .byte   $21
         .byte   $ab
         .byte   $05
         .byte   $ac
         .byte   $57
         .byte   $ac
         .byte   $6f
         .byte   $ac
         .byte   $2a
         .byte   $ad
         .byte   $97
         .byte   $ad
         .byte   $c1
         .byte   $ee
         .byte   $ac
         .byte   $c1
         .byte   $f5
         .byte   $ac
         .byte   $39
         .byte   $ac
         .byte   $11
         .byte   $ad
         .byte   $8d
         .byte   $ae
         .byte   $17
         .byte   $ad
         .byte   $7e
         .byte   $b3
         .byte   $7e
         .byte   $b3
         .byte   $89
         .byte   $ac
         .byte   $95
         .byte   $ac
         .byte   $86
         .byte   $ac
         .byte   $92
         .byte   $ac
         .byte   $7e
         .byte   $b3
         .byte   $7e
         .byte   $b3
         .byte   $bd
         .byte   $ac
         .byte   $c1
         .byte   $c9
         .byte   $ac
         .byte   $ba
         .byte   $ac
         .byte   $c1
         .byte   $c6
         .byte   $ac
         .byte   $7e
         .byte   $b3
         .byte   $c1
         .byte   $e0
         .byte   $00
         .byte   $c1
         .byte   $f0
         .byte   $26
         .byte   $45
         .byte   $60
         .byte   $28
         .byte   $20
         .byte   $a4
         .byte   $a1
         .byte   $c1
         .byte   $f0
         .byte   $c1
         .byte   $c5
         .byte   $38
         .byte   $c1
         .byte   $e9
         .byte   $b0
         .byte   $30
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $c9
         .byte   $0a
         .byte   $90
         .byte   $08
         .byte   $c1
         .byte   $e9
         .byte   $07
         .byte   $30
         .byte   $c1
         .byte   $e6
         .byte   $c1
         .byte   $c9
         .byte   $10
         .byte   $b0
         .byte   $c1
         .byte   $e2
         .byte   $a2
         .byte   $04
         .byte   $20
         .byte   $c1
         .byte   $fe
         .byte   $a1
         .byte   $c1
         .byte   $ca
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fa
         .byte   $05
         .byte   $44
         .byte   $85
         .byte   $44
         .byte   $4c
         .byte   $04
         .byte   $a2
         .byte   $a5
         .byte   $44
         .byte   $4c
         .byte   $95
         .byte   $c1
         .byte   $fe
         .byte   $a5
         .byte   $44
         .byte   $4c
         .byte   $8b
         .byte   $c1
         .byte   $fe
         .byte   $ad
         .byte   $5e
         .byte   $aa
         .byte   $0d
         .byte   $74
         .byte   $aa
         .byte   $8d
         .byte   $5e
         .byte   $aa
         .byte   $60
         .byte   $2c
         .byte   $74
         .byte   $aa
         .byte   $50
         .byte   $03
         .byte   $20
         .byte   $c1
         .byte   $c8
         .byte   $9f
         .byte   $a9
         .byte   $70
         .byte   $4d
         .byte   $74
         .byte   $aa
         .byte   $2d
         .byte   $5e
         .byte   $aa
         .byte   $8d
         .byte   $5e
         .byte   $aa
         .byte   $60
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $b3
         .byte   $aa
         .byte   $a5
         .byte   $44
         .byte   $48
         .byte   $20
         .byte   $16
         .byte   $a3
         .byte   $68
         .byte   $8d
         .byte   $57
         .byte   $aa
         .byte   $4c
         .byte   $c1
         .byte   $d4
         .byte   $a7
         .byte   $a9
         .byte   $05
         .byte   $20
         .byte   $aa
         .byte   $a2
         .byte   $20
         .byte   $64
         .byte   $a7
         .byte   $a0
         .byte   $00
         .byte   $98
         .byte   $91
         .byte   $40
         .byte   $60
         .byte   $a9
         .byte   $07
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $a9
         .byte   $08
         .byte   $20
         .byte   $aa
         .byte   $a2
         .byte   $4c
         .byte   $c1
         .byte   $ea
         .byte   $a2
         .byte   $a9
         .byte   $0c
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f6
         .byte   $ad
         .byte   $08
         .byte   $9d
         .byte   $8d
         .byte   $bd
         .byte   $b5
         .byte   $ad
         .byte   $09
         .byte   $9d
         .byte   $8d
         .byte   $be
         .byte   $b5
         .byte   $a9
         .byte   $09
         .byte   $8d
         .byte   $63
         .byte   $aa
         .byte   $20
         .byte   $c1
         .byte   $c8
         .byte   $a2
         .byte   $4c
         .byte   $c1
         .byte   $ea
         .byte   $a2
         .byte   $20
         .byte   $a3
         .byte   $a2
         .byte   $20
         .byte   $8c
         .byte   $a6
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fb
         .byte   $4c
         .byte   $71
         .byte   $b6
         .byte   $a9
         .byte   $00
         .byte   $4c
         .byte   $c1
         .byte   $d5
         .byte   $a3
         .byte   $a9
         .byte   $01
         .byte   $8d
         .byte   $63
         .byte   $aa
         .byte   $ad
         .byte   $6c
         .byte   $aa
         .byte   $c1
         .byte   $d0
         .byte   $0a
         .byte   $ad
         .byte   $6d
         .byte   $aa
         .byte   $c1
         .byte   $d0
         .byte   $05
         .byte   $a9
         .byte   $01
         .byte   $8d
         .byte   $6c
         .byte   $aa
         .byte   $ad
         .byte   $6c
         .byte   $aa
         .byte   $8d
         .byte   $bd
         .byte   $b5
         .byte   $ad
         .byte   $6d
         .byte   $aa
         .byte   $8d
         .byte   $be
         .byte   $b5
         .byte   $20
         .byte   $c1
         .byte   $ea
         .byte   $a2
         .byte   $a5
         .byte   $45
         .byte   $c1
         .byte   $d0
         .byte   $03
         .byte   $4c
         .byte   $c1
         .byte   $c8
         .byte   $a6
         .byte   $85
         .byte   $41
         .byte   $a5
         .byte   $44
         .byte   $85
         .byte   $40
         .byte   $20
         .byte   $43
         .byte   $a7
         .byte   $20
         .byte   $4e
         .byte   $a7
         .byte   $20
         .byte   $1a
         .byte   $a7
         .byte   $ad
         .byte   $63
         .byte   $aa
         .byte   $8d
         .byte   $bb
         .byte   $b5
         .byte   $4c
         .byte   $a8
         .byte   $a6
         .byte   $ad
         .byte   $75
         .byte   $aa
         .byte   $c1
         .byte   $c9
         .byte   $a0
         .byte   $c1
         .byte   $f0
         .byte   $25
         .byte   $20
         .byte   $64
         .byte   $a7
         .byte   $b0
         .byte   $3a
         .byte   $20
         .byte   $c1
         .byte   $fc
         .byte   $a2
         .byte   $4c
         .byte   $c1
         .byte   $ea
         .byte   $a2
         .byte   $20
         .byte   $af
         .byte   $a7
         .byte   $c1
         .byte   $d0
         .byte   $55
         .byte   $c1
         .byte   $ce
         .byte   $56
         .byte   $45
         .byte   $52
         .byte   $49
         .byte   $46
         .byte   $c1
         .byte   $d9
         .byte   $00
         .byte   $21
         .byte   $70
         .byte   $a0
         .byte   $70
         .byte   $a1
         .byte   $70
         .byte   $a0
         .byte   $70
         .byte   $20
         .byte   $70
         .byte   $20
         .byte   $70
         .byte   $20
         .byte   $70
         .byte   $20
         .byte   $70
         .byte   $60
         .byte   $00
         .byte   $22
         .byte   $06
         .byte   $20
         .byte   $74
         .byte   $22
         .byte   $06
         .byte   $22
         .byte   $04
         .byte   $23
         .byte   $78
         .byte   $22
         .byte   $70
         .byte   $30
         .byte   $70
         .byte   $40
         .byte   $70
         .byte   $40
         .byte   $80
         .byte   $40
         .byte   $80
         .byte   $08
         .byte   $00
         .byte   $08
         .byte   $00
         .byte   $04
         .byte   $00
         .byte   $40
         .byte   $70
         .byte   $40
         .byte   $00
         .byte   $21
         .byte   $79
         .byte   $20
         .byte   $71
         .byte   $20
         .byte   $71
         .byte   $20
         .byte   $70
         .byte   $c1
         .byte   $d6
         .byte   $c1
         .byte   $c4
         .byte   $c1
         .byte   $d3
         .byte   $c1
         .byte   $cc
         .byte   $c1
         .byte   $d2
         .byte   $c1
         .byte   $c2
         .byte   $c1
         .byte   $c1
         .byte   $c1
         .byte   $c3
         .byte   $c1
         .byte   $c9
         .byte   $c1
         .byte   $cf
         .byte   $40
         .byte   $20
         .byte   $10
         .byte   $08
         .byte   $04
         .byte   $02
         .byte   $01
         .byte   $c1
         .byte   $c0
         .byte   $a0
         .byte   $90
         .byte   $c2
         .byte   $00
         .byte   $c1
         .byte   $fe
         .byte   $00
         .byte   $01
         .byte   $00
         .byte   $02
         .byte   $00
         .byte   $01
         .byte   $00
         .byte   $07
         .byte   $00
         .byte   $01
         .byte   $00
         .byte   $c1
         .byte   $ff
         .byte   $7f
         .byte   $c2
         .byte   $00
         .byte   $c1
         .byte   $ff
         .byte   $7f
         .byte   $c2
         .byte   $00
         .byte   $c1
         .byte   $ff
         .byte   $7f
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $0d
         .byte   $07
         .byte   $8d
         .byte   "LANGUAGE NOT AVAILABL"
         .byte   $c1
         .byte   $c5
         .byte   "RANGE E"
         .byte   $c2
         .byte   $52
         .byte   $4f
         .byte   $c1
         .byte   $d2
         .byte   "WRITE PROTECTE"
         .byte   $c1
         .byte   $c4
         .byte   "END OF DAT"
         .byte   $c1
         .byte   $c1
         .byte   "FILE NOT FOUN"
         .byte   $c1
         .byte   $c4
         .byte   "VOLUME MISMATC"
         .byte   $c1
         .byte   $c8
         .byte   "I/O E"
         .byte   $c2
         .byte   $52
         .byte   $4f
         .byte   $c1
         .byte   $d2
         .byte   "DISK FUL"
         .byte   $c1
         .byte   $cc
         .byte   "FILE LOCKE"
         .byte   $c1
         .byte   $c4
         .byte   "SYNTAX E"
         .byte   $c2
         .byte   $52
         .byte   $4f
         .byte   $c1
         .byte   $d2
         .byte   "NO BU"
         .byte   $c2
         .byte   "FERS "
         .byte   $8c
         .byte   $c1
         .byte   $f0
         .byte   $b7
         .byte   $ac
         .byte   $c1
         .byte   $c4
         .byte   $aa
         .byte   $8c
         .byte   $c1
         .byte   $f1
         .byte   $b7
         .byte   $ae
         .byte   $c1
         .byte   $fa
         .byte   $b5
         .byte   $a0
         .byte   $00
         .byte   $4c
         .byte   $52
         .byte   $b0
         .byte   $08
         .byte   $20
         .byte   $45
         .byte   $b0
         .byte   $28
         .byte   $b0
         .byte   $08
         .byte   $ac
         .byte   $bd
         .byte   $b3
         .byte   $ae
         .byte   $bc
         .byte   $b3
         .byte   $c1
         .byte   $d0
         .byte   $0a
         .byte   $ae
         .byte   $bc
         .byte   $b4
         .byte   $c1
         .byte   $d0
         .byte   $02
         .byte   $38
         .byte   $60
         .byte   $ac
         .byte   $bd
         .byte   $b4
         .byte   $8e
         .byte   $97
         .byte   $b3
         .byte   $8c
         .byte   $98
         .byte   $b3
         .byte   $a9
         .byte   $01
         .byte   $20
         .byte   $52
         .byte   $b0
         .byte   $18
         .byte   $60
         .byte   $20
         .byte   $45
         .byte   $b0
         .byte   $ae
         .byte   $97
         .byte   $b3
         .byte   $ac
         .byte   $98
         .byte   $b3
         .byte   $a9
         .byte   $02
         .byte   $4c
         .byte   $52
         .byte   $b0
         .byte   $ad
         .byte   $c1
         .byte   $c5
         .byte   $aa
         .byte   $8d
         .byte   $c1
         .byte   $f0
         .byte   $b7
         .byte   $ad
         .byte   $c1
         .byte   $c6
         .byte   $aa
         .byte   $8d
         .byte   $c1
         .byte   $f1
         .byte   $b7
         .byte   $60
         .byte   $8e
         .byte   $c1
         .byte   $ec
         .byte   $b7
         .byte   $8c
         .byte   $c1
         .byte   $ed
         .byte   $b7
         .byte   $8d
         .byte   $c1
         .byte   $f4
         .byte   $b7
         .byte   $c1
         .byte   $c9
         .byte   $02
         .byte   $c1
         .byte   $d0
         .byte   $06
         .byte   $0d
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $ad
         .byte   $c1
         .byte   $f9
         .byte   $b5
         .byte   $49
         .byte   $c1
         .byte   $ff
         .byte   $8d
         .byte   $c1
         .byte   $eb
         .byte   $b7
         .byte   $ad
         .byte   $c1
         .byte   $f7
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $e9
         .byte   $b7
         .byte   $ad
         .byte   $c1
         .byte   $f8
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $ea
         .byte   $b7
         .byte   $ad
         .byte   $c1
         .byte   $e2
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $f2
         .byte   $b7
         .byte   $ad
         .byte   $c1
         .byte   $e3
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $f3
         .byte   $b7
         .byte   $a9
         .byte   $01
         .byte   $8d
         .byte   $c1
         .byte   $e8
         .byte   $b7
         .byte   $ac
         .byte   $c1
         .byte   $c1
         .byte   $aa
         .byte   $ad
         .byte   $c1
         .byte   $c2
         .byte   $aa
         .byte   $20
         .byte   $b5
         .byte   $b7
         .byte   $ad
         .byte   $c1
         .byte   $f6
         .byte   $b7
         .byte   $8d
         .byte   $bf
         .byte   $b5
         .byte   $a9
         .byte   $c1
         .byte   $ff
         .byte   $8d
         .byte   $c1
         .byte   $eb
         .byte   $b7
         .byte   $b0
         .byte   $01
         .byte   $60
         .byte   $ad
         .byte   $c1
         .byte   $f5
         .byte   $b7
         .byte   $a0
         .byte   $07
         .byte   $c1
         .byte   $c9
         .byte   $20
         .byte   $c1
         .byte   $f0
         .byte   $08
         .byte   $a0
         .byte   $04
         .byte   $c1
         .byte   $c9
         .byte   $10
         .byte   $c1
         .byte   $f0
         .byte   $02
         .byte   $a0
         .byte   $08
         .byte   $98
         .byte   $4c
         .byte   $85
         .byte   $b3
         .byte   $ad
         .byte   $c1
         .byte   $e4
         .byte   $b5
         .byte   $c1
         .byte   $cd
         .byte   $c1
         .byte   $e0
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $08
         .byte   $ad
         .byte   $c1
         .byte   $e5
         .byte   $b5
         .byte   $c1
         .byte   $cd
         .byte   $c1
         .byte   $e1
         .byte   $b5
         .byte   $c1
         .byte   $f0
         .byte   $66
         .byte   $20
         .byte   $1d
         .byte   $af
         .byte   $ad
         .byte   $c1
         .byte   $e5
         .byte   $b5
         .byte   $c1
         .byte   $cd
         .byte   $c1
         .byte   $dd
         .byte   $b5
         .byte   $90
         .byte   $1c
         .byte   $c1
         .byte   $d0
         .byte   $08
         .byte   $ad
         .byte   $c1
         .byte   $e4
         .byte   $b5
         .byte   $c1
         .byte   $cd
         .byte   $c1
         .byte   $dc
         .byte   $b5
         .byte   $90
         .byte   $12
         .byte   $ad
         .byte   $c1
         .byte   $e5
         .byte   $b5
         .byte   $c1
         .byte   $cd
         .byte   $c1
         .byte   $df
         .byte   $b5
         .byte   $90
         .byte   $10
         .byte   $c1
         .byte   $d0
@L6F33:  .byte   $08
@L6F34:  .byte   $ad
         .byte   $c1
         .byte   $e4
         .byte   $b5
         .byte   $c1
         .byte   $cd
         .byte   $c1
         .byte   $de
         .byte   $b5
         .byte   $90
         .byte   $06
         .byte   $20
         .byte   $5e
         .byte   $af
         .byte   $90
         .byte   $c1
         .byte   $d7
         .byte   $60
         .byte   $38
         .byte   $ad
         .byte   $c1
         .byte   $e4
         .byte   $b5
@L6F4B:  .byte   $c1
@L6F4C:  .byte   $ed
         .byte   $c1
         .byte   $dc
         .byte   $b5
         .byte   $0a
         .byte   $69
         .byte   $0c
         .byte   $a8
         .byte   $20
         .byte   $0c
         .byte   $af
         .byte   $b1
         .byte   $42
         .byte   $c1
         .byte   $d0
         .byte   $0f
         .byte   $ad
         .byte   $bb
         .byte   $b5
         .byte   $c1
         .byte   $c9
         .byte   $04
         .byte   $c1
         .byte   $f0
         .byte   $02
         .byte   $38
         .byte   $60
         .byte   $20
         .byte   $34
         .byte   $b1
         .byte   $4c
         .byte   $20
         .byte   $b1
         .byte   $8d
         .byte   $c1
         .byte   $d6
         .byte   $b5
         .byte   $c1
         .byte   $c8
         .byte   $b1
         .byte   $42
         .byte   $8d
         .byte   $c1
         .byte   $d7
         .byte   $b5
         .byte   $20
         .byte   $c1
         .byte   $dc
         .byte   $af
         .byte   $ad
         .byte   $c1
         .byte   $e4
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $e0
         .byte   $b5
         .byte   $ad
         .byte   $c1
         .byte   $e5
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $e1
         .byte   $b5
         .byte   $20
         .byte   $10
         .byte   $af
         .byte   $ac
         .byte   $c1
         .byte   $e6
         .byte   $b5
         .byte   $18
         .byte   $60
         .byte   $8c
         .byte   $9d
         .byte   $b3
         .byte   $20
         .byte   $44
         .byte   $b2
         .byte   $ac
         .byte   $9d
         .byte   $b3
         .byte   $c1
         .byte   $c8
         .byte   $91
         .byte   $42
         .byte   $8d
         .byte   $c1
         .byte   $d7
         .byte   $b5
         .byte   $88
         .byte   $ad
         .byte   $c1
         .byte   $f1
         .byte   $b5
         .byte   $91
         .byte   $42
         .byte   $8d
         .byte   $c1
         .byte   $d6
         .byte   $b5
         .byte   $20
         .byte   $10
         .byte   $af
         .byte   $20
         .byte   $c1
         .byte   $d6
         .byte   $b7
         .byte   $a9
         .byte   $c1
         .byte   $c0
         .byte   $0d
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $d5
         .byte   $b5
         .byte   $60
         .byte   $ae
         .byte   $c1
         .byte   $ea
         .byte   $b5
         .byte   $8e
         .byte   $bd
         .byte   $b5
         .byte   $ae
         .byte   $c1
         .byte   $eb
         .byte   $b5
         .byte   $8e
         .byte   $be
         .byte   $b5
         .byte   $ae
         .byte   $c1
         .byte   $ec
         .byte   $b5
         .byte   $ac
         .byte   $c1
         .byte   $ed
         .byte   $b5
         .byte   $8e
         .byte   $bf
         .byte   $b5
         .byte   $8c
         .byte   $c1
         .byte   $c0
         .byte   $b5
         .byte   $c1
         .byte   $e8
         .byte   $c1
         .byte   $d0
         .byte   $01
         .byte   $c1
         .byte   $c8
         .byte   $c1
         .byte   $cc
         .byte   $c1
         .byte   $e9
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $11
         .byte   $c1
         .byte   $ec
         .byte   $c1
         .byte   $e8
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $0c
         .byte   $a2
         .byte   $00
         .byte   $a0
         .byte   $00
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $ea
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $03
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $eb
         .byte   $b5
         .byte   $8e
         .byte   $c1
         .byte   $ec
         .byte   $b5
         .byte   $8c
         .byte   $c1
         .byte   $ed
         .byte   $b5
         .byte   $60
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $e6
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $08
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $e4
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $03
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $e5
         .byte   $b5
         .byte   $60
         .byte   $ac
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $ae
         .byte   $c1
         .byte   $c4
         .byte   $b5
         .byte   $84
         .byte   $42
@L7033:  .byte   $86
@L7034:  .byte   $43
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $03
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $c4
         .byte   $b5
         .byte   $60
         .byte   $ac
         .byte   $c1
         .byte   $c1
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $08
         .byte   $ae
@L704B:  .byte   $c1
@L704C:  .byte   $c2
         .byte   $b5
         .byte   $c1
         .byte   $f0
         .byte   $07
         .byte   $c1
         .byte   $ce
         .byte   $c1
         .byte   $c2
         .byte   $b5
         .byte   $c1
         .byte   $ce
         .byte   $c1
         .byte   $c1
         .byte   $b5
         .byte   $60
         .byte   $4c
         .byte   $7f
         .byte   $b3
         .byte   $20
         .byte   $c1
         .byte   $f7
         .byte   $af
         .byte   $ad
         .byte   $c1
         .byte   $c3
         .byte   $b5
         .byte   $85
         .byte   $42
         .byte   $ad
         .byte   $c1
         .byte   $c4
         .byte   $b5
         .byte   $85
         .byte   $43
         .byte   $a9
         .byte   $01
         .byte   $8d
         .byte   $9d
         .byte   $b3
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $c1
         .byte   $d8
         .byte   $b5
         .byte   $18
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $d8
         .byte   $b5
         .byte   $20
         .byte   $11
         .byte   $c2
         .byte   $b0
         .byte   $51
         .byte   $a2
         .byte   $00
         .byte   $8e
         .byte   $9c
         .byte   $b3
         .byte   $bd
         .byte   $c1
         .byte   $c6
         .byte   $b4
         .byte   $c1
         .byte   $f0
         .byte   $1f
         .byte   $30
         .byte   $22
         .byte   $a0
         .byte   $00
         .byte   $c3
         .byte   $e8
         .byte   $b1
         .byte   $42
         .byte   $c1
         .byte   $dd
         .byte   $c1
         .byte   $c6
         .byte   $b4
         .byte   $c1
         .byte   $d0
         .byte   $c0
         .byte   $bb
         .byte   $06
         .byte   $00
         .byte   $0b
         .byte   $9d
         .byte   $01
         .byte   $00
         .byte   $c1
         .byte   $fe
         .byte   $02
         .byte   $06
         .byte   $00
         .byte   $75
         .byte   $aa
         .byte   $c3
         .byte   $00
         .byte   $98
         .byte   $00
         .byte   $97
         .byte   $00
         .byte   $96
         .byte   $c8
         .byte   $00
         .byte   $02
         .byte   $e1
         .byte   $00
         .byte   $60
         .byte   $02
         .byte   $01
         .byte   $11
         .byte   $c0
         .byte   $05
         .byte   $01
         .byte   $00
         .byte   $c1
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c6
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2

@L70FE:  brk

         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c0
         .byte   $8f
@L7133:  .byte   $01
@L7134:  .byte   $00
         .byte   $ad
         .byte   $bd
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $e6
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $ea
         .byte   $b5
         .byte   $ad
         .byte   $be
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $e4
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $eb
         .byte   $b5

@L714B:  lda     #$00
         sta     $e5c1
         lda     $a0,x
         bpl     @L70FE
         lda     $e6c1
         lda     $4a,x
         bcs     @L715E
         txa
         bcc     @L716C

@L715E:  clc
         lda     $e5c1
         lda     $6d,x
         cmp     ($e8,x)
         lda     $8d,x
         cmp     ($e5,x)
         lda     $8a,x
@L716C:  adc     $e9c1
         lda     $6a,x
         ror     $e5c1
         lda     $6e,x
         cmp     ($e4,x)
         lda     $6e,x
         cmp     ($e6,x)
         lda     $88,x
         cmp     ($d0,x)
         cmp     ($db,x)
         lda     $b5bf
         sta     $ecc1
         lda     $6d,x
         cmp     ($e6,x)
         lda     $8d,x
         cmp     ($e6,x)
         lda     $ad,x
         cmp     ($c0,x)
         lda     $8d,x
         cmp     ($ed,x)
         lda     $6d,x
         cmp     ($e4,x)
         lda     $8d,x
         cmp     ($e4,x)
         lda     $a9,x
         brk

         .byte   $6d
         .byte   $c1
         .byte   $e5
         .byte   $b5
         .byte   $8d
         .byte   $c1
         .byte   $e5
         .byte   $b5
         .byte   $60
         .byte   $a9
         .byte   $01
         .byte   $c1
         .byte   $d0
         .byte   $22
         .byte   $a9
         .byte   $02
         .byte   $c1
         .byte   $d0
         .byte   $1e
         .byte   $a9
         .byte   $03
         .byte   $c1
         .byte   $d0
         .byte   $1a
         .byte   $a9
         .byte   $04
         .byte   $c1
         .byte   $d0
         .byte   $16
         .byte   $a9
         .byte   $05
         .byte   $c1
         .byte   $d0
         .byte   $12
         .byte   $a9
         .byte   $06
         .byte   $c1
         .byte   $d0
         .byte   $0e
         .byte   $4c
         .byte   $c1
         .byte   $ed
         .byte   $bf
         .byte   $c1
         .byte   $ea
         .byte   $a9
         .byte   $0a
         .byte   $c1
         .byte   $d0
         .byte   $06
         .byte   $ad
         .byte   $c1
         .byte   $c5
         .byte   $b5
         .byte   $18
         .byte   $90
         .byte   $01
         .byte   $38
         .byte   $08
         .byte   $8d
         .byte   $c1
         .byte   $c5
         .byte   $b5
         .byte   $a9
         .byte   $00
         .byte   $85
         .byte   $48
         .byte   $20
         .byte   $7e
         .byte   $ae
         .byte   $28
         .byte   $ae
         .byte   $9b
         .byte   $b3
         .byte   $9a
         .byte   $60
         .byte   $11
         .byte   $0f
         .byte   $c2
         .byte   $00
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $d2
         .byte   $0c
         .byte   $c4
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $01
         .byte   $0a
         .byte   $64
         .byte   $c1
         .byte   $d4
         .byte   $c1
         .byte   $c9
         .byte   $c1
         .byte   $c1
         .byte   $c1
         .byte   $c2
         .byte   $c1
         .byte   $d3
         .byte   $c1
         .byte   $d2
         .byte   $c1
         .byte   $c1
         .byte   $c1
         .byte   $c2
         .byte   $a0
         .byte   $c1
         .byte   $cb
         .byte   $c1
         .byte   $d3
         .byte   $c1
         .byte   $c9
         .byte   $c1
         .byte   $c4
         .byte   $a0
         .byte   $c1
         .byte   $cd
         .byte   $c1
         .byte   $c5
         .byte   $c1
         .byte   $d4
         .byte   $c1
         .byte   $d3
         .byte   $c1
         .byte   $d9
         .byte   $c1
         .byte   $d3
         .byte   $00
         .byte   $11
         .byte   $0f
         .byte   $03
         .byte   $c2
         .byte   $00
         .byte   $c1
         .byte   $fe
         .byte   $e0
         .byte   $00
         .byte   $7a
         .byte   $c8
         .byte   $00
         .byte   $11
         .byte   $01
         .byte   $c2
         .byte   $00
         .byte   $23
         .byte   $10
         .byte   $00
         .byte   $01
         .byte   $cc
         .byte   $00
         .byte   $c1
         .byte   $ff
         .byte   $c0
         .byte   $00
         .byte   $01
         .byte   $00
         .byte   $0a
         .byte   $c1
         .byte   $c8
         .byte   $c1
         .byte   $c0
         .byte   $1e
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f3
         .byte   $ae
         .byte   $9c
         .byte   $b3
         .byte   $18
         .byte   $60
         .byte   $20
         .byte   $30
         .byte   $b2
         .byte   $90
         .byte   $c1
         .byte   $db
         .byte   $b0
         .byte   $c1
         .byte   $cf
         .byte   $ac
         .byte   $9d
         .byte   $b3
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $c1
         .byte   $ac
         .byte   $9d
         .byte   $b3
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $ef
         .byte   $a0
         .byte   $00
         .byte   $c3
         .byte   $e8
         .byte   $b1
         .byte   $42
         .byte   $9d
         .byte   $c1
         .byte   $c6
         .byte   $b4
         .byte   $c1
         .byte   $c8
         .byte   $c1
         .byte   $c0
         .byte   $1e
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f5
         .byte   $ae
         .byte   $9c
         .byte   $b3
         .byte   $38
         .byte   $60
         .byte   $18
         .byte   $ad
         .byte   $9c
         .byte   $b3
         .byte   $69
         .byte   $23
         .byte   $aa
         .byte   $c1
         .byte   $e0
         .byte   $c1
         .byte   $f5
         .byte   $60
         .byte   $a9
         .byte   $00
         .byte   $ac
         .byte   $9d
         .byte   $b3
         .byte   $c1
         .byte   $d0
         .byte   $97
         .byte   $4c
         .byte   $77
         .byte   $b3
         .byte   $ad
         .byte   $c1
         .byte   $f1
         .byte   $b5
         .byte   $c1
         .byte   $f0
         .byte   $21
         .byte   $c1
         .byte   $ce
         .byte   $c1
         .byte   $f0
         .byte   $b5
         .byte   $30
         .byte   $17
         .byte   $18
         .byte   $a2
         .byte   $04
         .byte   $3e
         .byte   $c1
         .byte   $f1
         .byte   $b5
         .byte   $c1
         .byte   $ca
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fa
         .byte   $90
         .byte   $c1
         .byte   $f0
         .byte   $c2
         .byte   $ee
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $03
         .byte   $c1
         .byte   $ee
         .byte   $c1
         .byte   $ef
         .byte   $b5
         .byte   $ad
         .byte   $c1
         .byte   $f0
         .byte   $b5
         .byte   $60
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $c1
         .byte   $f1
         .byte   $b5
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $9e
         .byte   $b3
         .byte   $20
         .byte   $c1
         .byte   $f7
         .byte   $af
         .byte   $18
         .byte   $ad
         .byte   $c1
         .byte   $eb
         .byte   $b3
         .byte   $6d
         .byte   $c1
         .byte   $ec
         .byte   $b3
         .byte   $c1
         .byte   $f0
         .byte   $09
         .byte   $c1
         .byte   $cd
         .byte   $c1
         .byte   $ef
         .byte   $b3
         .byte   $90
         .byte   $14
         .byte   $a9
         .byte   $c1
         .byte   $ff
         .byte   $c1
         .byte   $d0
         .byte   $0a
         .byte   $ad
         .byte   $9e
         .byte   $b3
         .byte   $c1
         .byte   $d0
         .byte   $37
         .byte   $a9
         .byte   $01
         .byte   $8d
         .byte   $9e
         .byte   $b3
         .byte   $8d
         .byte   $c1
         .byte   $ec
         .byte   $b3
         .byte   $18
         .byte   $69
         .byte   $11
         .byte   $8d
         .byte   $c1
         .byte   $eb
         .byte   $b3
         .byte   $8d
         .byte   $c1
         .byte   $f1
         .byte   $b5
         .byte   $a8
         .byte   $c2
         .byte   $0a
         .byte   $a8
         .byte   $a2
         .byte   $04
         .byte   $18
         .byte   $b9
         .byte   $c1
         .byte   $f6
         .byte   $b3
         .byte   $9d
         .byte   $c1
         .byte   $f1
         .byte   $b5
         .byte   $c1
         .byte   $f0
         .byte   $06
         .byte   $38
         .byte   $a9
         .byte   $00
         .byte   $99
         .byte   $c1
         .byte   $f6
         .byte   $b3
         .byte   $88
         .byte   $c1
         .byte   $ca
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $ee
         .byte   $90
         .byte   $bd
         .byte   $20
         .byte   $c1
         .byte   $fb
         .byte   $af
         .byte   $ad
         .byte   $c1
         .byte   $f0
         .byte   $b3
         .byte   $8d
         .byte   $c1
         .byte   $f0
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $89
         .byte   $4c
         .byte   $77
         .byte   $b3
         .byte   $ad
         .byte   $c1
         .byte   $f1
         .byte   $b5
         .byte   $c1
         .byte   $d0
         .byte   $01
         .byte   $60
         .byte   $48
         .byte   $20
         .byte   $c1
         .byte   $f7
         .byte   $af
         .byte   $ac
         .byte   $c1
         .byte   $f0
         .byte   $b5
         .byte   $68
         .byte   $18
         .byte   $20
         .byte   $c1
         .byte   $dd
         .byte   $b2
         .byte   $a9
         .byte   $00
         .byte   $8d
         .byte   $c1
         .byte   $f1
         .byte   $b5
         .byte   $4c
         .byte   $c1
         .byte   $fb
         .byte   $af
         .byte   $a2
         .byte   $c1
         .byte   $fc
         .byte   $7e
         .byte   $c1
         .byte   $f6
         .byte   $b4
         .byte   $c1
         .byte   $e8
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $fa
         .byte   $c1
         .byte   $c8
         .byte   $c1
         .byte   $cc
         .byte   $c1
         .byte   $f0
         .byte   $b3
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f2
         .byte   $c2
         .byte   $0a
         .byte   $a8
         .byte   $c1
         .byte   $f0
         .byte   $0f
         .byte   $a2
         .byte   $04
         .byte   $bd
         .byte   $c1
         .byte   $f1
         .byte   $b5
         .byte   $19
         .byte   $c1
         .byte   $f6
         .byte   $b3
         .byte   $99
         .byte   $c1
         .byte   $f6
         .byte   $b3
         .byte   $88
         .byte   $c1
         .byte   $ca
         .byte   $c1
         .byte   $d0
         .byte   $c1
         .byte   $f3
         .byte   $60
         .byte   $c0
         .byte   $01
         .byte   $e2
         .byte   $00
         .byte   $11
         .byte   $0f
         .byte   $03
         .byte   $c2
         .byte   $00
         .byte   $c1
         .byte   $fe
         .byte   $e0
         .byte   $00
         .byte   $7a
         .byte   $c8
         .byte   $00
         .byte   $12
         .byte   $01
         .byte   $c2
         .byte   $00
         .byte   $23
         .byte   $10
         .byte   $00
         .byte   $01
         .byte   $cc
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c6
         .byte   $00
         .byte   $3f
         .byte   $c1
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c2
         .byte   $00
         .byte   $c2
         .byte   $ff
         .byte   $c0
         .byte   $4b
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $06
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $0d
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $05
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $0c
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $04
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $0b
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $03
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $0a
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $02
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $09
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $01
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $08
         .byte   $c0
         .byte   $fe
         .byte   $01
         .byte   $00
         .byte   $11
         .byte   $07
         .byte   $c0
         .byte   $fe
         .byte   $00
         .byte   $00
         .byte   $11
         .byte   $0e
         .byte   $c8
         .byte   $00
         .byte   $12
         .byte   $0f
         .byte   $02
         .byte   $c1
         .byte   $c1
         .byte   $dd
         .byte   $a0
         .byte   $02
         .byte   $c0
         .byte   $d3
         .byte   $02
         .byte   $00
         .byte   $34
         .byte   $00
         .byte   $27
         .byte   $08
         .byte   $0a
         .byte   $00
         .byte   $ba
         .byte   $22,"WELCOME TO TIGER A"
         .byte   'B' | $80
         .byte   "PLE JUNIOR!",$22
         .byte   $00
         .byte   $2d
         .byte   $08
         .byte   $14
         .byte   $00
         .byte   $bf
         .byte   $00
         .byte   $33
         .byte   $08
         .byte   $1e
         .byte   $00
         .byte   $80
         .byte   $c3
         .byte   $00
         .byte   $2b
         .byte   $c0
         .byte   $d5
         .byte   $0c
         .byte   $00
         .byte   $12
         .byte   $0e
         .byte   $c0
         .byte   $f2
         .byte   $d0
         .byte   $00
@L74BB:  .byte   $00
         .byte   $f0
