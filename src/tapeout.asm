; da65 V2.13.9 - (C) Copyright 2000-2009,  Ullrich von Bassewitz
; Created:    2020-06-04 02:08:05

        .setcpu "6502"


.org $0300

        lda     #$00
        ldy     #$03
        sta     $3c
        sty     $3d
        lda     #$00
        ldy     #$04
        sta     $3e
        sty     $3f
        jsr     WRITE
        rts

LFCBA:  lda     $3C
        cmp     $3E
        lda     $3D
        sbc     $3F
        inc     $3C
        bne     LFCC8
        inc     $3D
LFCC8:  rts

LEADER:
LFCC9:  ldy     #$4B
        jsr     LFCDB
        bne     LFCC9
        adc     #$FE
        bcs     LFCC9
        ldy     #$21
LFCD6:  jsr     LFCDB
        iny
        iny
LFCDB:  dey
        bne     LFCDB
        bcc     LFCE5
        ldy     #$32
LFCE2:  dey
        bne     LFCE2
LFCE5:  ldy     $C030
        ldy     #$2C
        dex
        rts

WRITE:
        lda     #$40
        jsr     LFCC9
        ldy     #$27
LFED4:  ldx     #$00
        eor     ($3C,x)
        pha
        lda     ($3C,x)
        jsr     LFEED
        jsr     LFCBA
        ldy     #$1D
        pla
        bcc     LFED4
        ldy     #$22
        jsr     LFEED
        beq     LFF3A
LFEED:  ldx     #$10
LFEEF:  asl     a
        jsr     LFCD6
        bne     LFEEF
        rts

LFF3A:  lda     #$DA
        jmp     $FDED
