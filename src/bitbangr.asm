;
; Bitbang RS-232 (using a pushbutton input in our case)
;

;
; CPU cycle counting must be done to meet bit-time requirements on the wire.
; Bit time is defined as (1 / baud) seconds, or (1000000 / baud) microseconds.
; So at 9600 baud, we get a bit time 0.000104166 seconds, or 104.166 microseconds.
; With a 6502 CPU running at about 1MHz, each CPU clock cycle is about 1.023
; microseconds long.
;

.org $300 ; For now

; Some system constants
WAIT      = $FCA8
CROUT     = $FD8E
PRBYTE    = $FDDA
PRHEX     = $FDE3
COUT      = $FDED
PRERR     = $FF2D
PB0       = $C061 ; Paddle 0 PushButton: HIGH/ON if > 127, LOW/OFF if < 128.

start:
          lda #$09 ; We'll be watching for 8 bits plus one stop bit
          sta bits
          clc
          jsr pb0_recv ; Pull a byte from PB0
          bcs printit  ; Carry set means we got a '1' stop bit, so we're good
          jsr CROUT
          jsr PRERR    ; Else we got a framing error

printit:
          ora #$80
          jsr COUT ; PRBYTE
          lda $25
          cmp #$17
          bne start
          lda #$00
          sta $25
          beq start
done:     rts

pb0_recv:

; State is unknown

poll_for_1:
; sample state
          lda PB0
          bpl poll_for_1 ; if not negative, branch to wait_for_1

; State is now 1

poll_for_0:
; sample state
          lda PB0
          bmi poll_for_0 ; if negative, branch to wait_for_0

; State just became 0 (start bit)

; Wait 1.5 bit times (104.2 + 52.1 = 156.3us at 9600 baud) to get into the middle of the first bit
; Approximately 152.8 ($99) CPU cycles
; When falling through to here, the above branch was not taken - consuming 2 cycles to get here
          ldx #$14      ; 2  loop count
:         nop           ; 2 \
          dex           ; 2  |-- 7 * loop count
          bne :-        ; 3 /  final exit of the loop adds 2, branch not taken
;                       $90 cycles to get here; need to burn 7 more
          beq :+        ; 3
:         nop           ; 2
          nop           ; 2
;                       $97 cycles to get here; save 2 for upcoming clc
pull_byte:
; We now have one bit time (104.2us at 9600 baud) to process this bit
; Approximately 106.6 ($6B) CPU cycles
          clc           ; 2
          lda PB0       ; 4
          bmi :+        ; 2 if positive, 3 if negative
          jmp push_bit  ; 3
:         sec           ; 2 bit was low/negative
push_bit: ; We now have a bit in the carry
          dec bits      ; 6
          beq byte_complete ; Have we read all 8 bits?  Then this bit is the stop bit; leave with carry set
                        ; 2 (in the case we care about, i.e. more bits to read)
          lda ring      ; 4
          ror           ; 2
          sta ring      ; 4
;                       $1C/$1D cycles to get here (since center of  bit time)
; We are now done with processing that bit; we need to cool our heels for the rest ($6B - $1C = $4F) of the
; bit time in order to get into the middle of the next bit
          ldx #$0A      ; 2  loop count
:         nop           ; 2 \
          dex           ; 2  |-- 7 * loop count
          bne :-        ; 3 /  final exit of the loop adds 2, branch not taken
;                         $48 cycles to get here
          nop           ; 2
          nop           ; 2
          jmp pull_byte ; 3 Loop around for another bit - we burned $4F cycles
;                         $6B
byte_complete:
          ; Carry now holds stop bit (clear/0 indicates framing error, because we end with set/1)
          lda ring      ; Exit with the assembled byte in A
          rts

pb_state: .byte $00
ring:     .byte $55
bits:     .byte $00
