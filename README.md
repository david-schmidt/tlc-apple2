# tlc-apple2

![Image of the TLC](https://github.com/david-schmidt/tlc-apple2/blob/master/doc/images/01TLC.png)

Some bits and bobs regarding the Tiger Learning Computer.
The TLC was a "toy" computer that had an Apple IIe at its core.
There was a UI that would come up by default that was an early,
proprietary windowing system that was little more than a program launcher.

The TLC can be booted and you can get into Applesoft BASIC without any problem.
The problem is that I/O is pretty difficult.  No one with one of these 
machines has come forward with the ability to get anything into or out of the
existing serial port.

The goal: get the ROM data of the TLC out of the machine.  Hard to do without functional I/O.

### Audio to the rescue

One thing the TLC _does_ have is sound.  And a headphone jack.  So we have... output.

#### A long time ago...

In the dark ages, when dinosaurs roamed the Earth, there was cassette tape.
As an analog-digital storage medium.  It was slow, crappy, error-prone, and all
that - but it at least worked.
Early Apple II specimens came with this audio interface built-in - the original Apple ][,
all the way through to the last Apple IIe.
But the audio jacks and attendant ROM code was missing from the IIgs, the IIc, and the IIc+.
And the TLC.

#### Steal all teh cassette ROM

Handily enough, the early ROM code is quite tidy and compact; this is before the days of the crazy
gymnastics of the IIe and beyond that moved Heaven and Earth to keep the entry points constant
(because programmers are bad, and used them literally).  The angle of attack:
 * Copy out just enough Apple II ROM code to do the moral equivalent of the monitor's save memory to tape command (i.e. `*300.400W`)
 * Change cassette output (`$C020`) to speaker output (`$C030`)
 * Assemble and get a raw hex dump of that code
 * Type that code into the TLC's RAM and run it, dumping all non-banked ROM (`$C100-$FFFF`)
 * Capture the audio on a modern computer (Windows hint: run `soundrecorder /file path\to\filename.wav` to get a `.wav`, not a `.wma`)
 * Run that audio through CiderPress, which knows how to take tape audio and reconstruct data from it
 * ???
 * Profit

The source code to do these activities is in the `src` directory, and the resulting ROM from the Tiger Learning computer is in the `rom` directory.  A few pictures of the machine and its on-screen interface are in `doc/images`.

#### ROM contents

Nonbanked ROM dump is available in binary and in monitor ROM disassembly form:

  * [`C100-FFFF.bin`](https://github.com/david-schmidt/tlc-apple2/blob/master/rom/C100-FFFF.bin) - Raw binary
  * [`C100-FFFF.txt`](https://github.com/david-schmidt/tlc-apple2/blob/master/rom/C100-FFFF.txt) - Monitor disassembly

Banked ROM exists in slots 2 and 3.  The contents have been dumped as follows:

  Slot 2:
  * [`S2-C800-CFFF.bin`](https://github.com/david-schmidt/tlc-apple2/blob/master/rom/S2-C800-CFFF.bin) - Raw binary
  * [`S2-C800-CFFF.txt`](https://github.com/david-schmidt/tlc-apple2/blob/master/rom/S2-C800-CFFF.txt) - Monitor disassembly

  Slot 3:
  * [`S3-C800-CFFF.bin`](https://github.com/david-schmidt/tlc-apple2/blob/master/rom/S3-C800-CFFF.bin) - Raw binary
  * [`S3-C800-CFFF.txt`](https://github.com/david-schmidt/tlc-apple2/blob/master/rom/S3-C800-CFFF.txt) - Monitor disassembly
