;
; Tiger Learning Computer Joystick serial bitbanger (using a pushbutton input in our case)
;
; Custom serial-to-joystick cable is required.  RS-232 settings are 9600 bps,
; no parity, 8 data bits, 1 stop bit; 1ms pacing seems to be required.

;
; CPU cycle counting must be done to meet bit-time requirements on the wire.
; Bit time is defined as (1 / baud) seconds, or (1000000 / baud) microseconds.
; So at 9600 baud, we get a bit time 0.000104166 seconds, or 104.166 microseconds.
; With a 6502 CPU running at about 1MHz, each CPU clock cycle is about 1.023
; microseconds long.
;

.org $300

; Some system constants
WAIT      = $FCA8
CROUT     = $FD8E
PRBYTE    = $FDDA
PRHEX     = $FDE3
COUT      = $FDED
PRERR     = $FF2D
PB0       = $C061 ; Paddle 0 PushButton: HIGH/ON if > 127, LOW/OFF if < 128.

start:
          jsr pb0_recv ; Pull a byte from PB0
          bcs printit  ; Carry set means we got a '1' stop bit, so we're good
          jsr CROUT
          jsr PRERR    ; Else we got a framing error
          jsr CROUT
          jmp start

printit:
          ora #$80
          jsr COUT
          lda $25
          cmp #$17
          bne start
          lda #$00
          sta $25
          beq start
done:     rts

pb0_recv:
; State is currently unknown
          lda #$09      ; We'll be watching for 8 bits plus one stop bit
          sta bits
          clc

poll_for_1:
; Sample PB0's state
          lda PB0
          bpl poll_for_1 ; if not negative, branch to poll_for_1

; State is now 1

poll_for_0:
; Sample PB0's state
          lda PB0
          bmi poll_for_0 ; if negative, branch to poll_for_0

; State just became 0 (start bit) sometime in the last 4 or so clock cycles

; Wait 1.5 bit times (104.2 + 52.1 = 156.3us at 9600 bps) to get into the middle of the first bit
; Approximately 152.8 ($99) CPU cycles
; When falling through to here, the above branch was not taken - consuming 2 cycles to get here
          ldx #$1D      ; 2  loop count
:         dex           ; 2 \  = 5 * loop count - 1
          bne :-        ; 3 /  final exit of the loop only adds 2, branch not taken
;                       $94 cycles to get here
          bit $00       ; 3 don't care about results
;                       $97 cycles to get here; final 2 will be consumed by clc below 
pull_byte:
; We now have one bit time (104.2us at 9600 bps) to process this bit
; Approximately 101.8 ($66) CPU cycles
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
;                       $1D cycles to get here (since center of bit time)
; We are now done with processing that bit; we need to cool our heels for the rest ($66 - $1D = $49) of the
; bit time in order to get into the middle of the next bit
          ldx #$0E      ; 2  loop count
:         dex           ; 2 \  = 5 * loop count - 1
          bne :-        ; 3 /  final exit of the loop only adds 2, branch not taken
;                       $47 cycles to get here
          jmp pull_byte ; 3 Loop around for another bit - we actually burn $4A cycles
;                       $67
byte_complete:
          ; Carry now holds stop bit (clear/0 indicates framing error, because we end with set/1)
          lda ring      ; Exit with the assembled byte in A
          rts

ring:     .byte $55
bits:     .byte $00
