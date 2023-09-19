; da65 V2.13.9 - (C) Copyright 2000-2009,  Ullrich von Bassewitz
; Created:    2020-06-04 02:08:05

        .setcpu "6502"


.org $0300

; Set up starting address ($C800)
        lda     #$00
        ldy     #$c8
        sta     $3c
        sty     $3d
; Set up ending addresses ($CFFF)
        lda     #$ff
        ldy     #$cf
        sta     $3e
        sty     $3f
; Swap in slot 2
        lda     $cfff
        lda     $c200
; Dump it to speaker
        jsr     WRITE
        rts

NXTA1:  lda     $3C
        cmp     $3E
        lda     $3D
        sbc     $3F
        inc     $3C
        bne     MON_RTS4B
        inc     $3D
MON_RTS4B:
        rts

LEADER:
HEADR:  ldy     #$4B
        jsr     ZERODLY
        bne     HEADR
        adc     #$FE
        bcs     HEADR
        ldy     #$21
WRBIT:  jsr     ZERODLY
        iny
        iny
ZERODLY:
        dey
        bne     ZERODLY
        bcc     WRTAPE
        ldy     #$32
ONEDLY: dey
        bne     ONEDLY
WRTAPE: ldy     $C030
        ldy     #$2C
        dex
        rts

WRITE:
        lda     #$40
        jsr     HEADR
        ldy     #$27
WR1:    ldx     #$00
        eor     ($3C,x)
        pha
        lda     ($3C,x)
        jsr     WRBYTE
        jsr     NXTA1
        ldy     #$1D
        pla
        bcc     WR1
        ldy     #$22
        jsr     WRBYTE
        beq     FAKE_BELL
WRBYTE: ldx     #$10
WRBYT2: asl     a
        jsr     WRBIT
        bne     WRBYT2
        rts

FAKE_BELL:
        lda     #$DA
        jmp     $FDED
