# Katapult version

* master
* 15.11.2025
* https://github.com/Arksine/katapult/commit/b0bf421069e2aab810db43d6e15f38817d981451

# git checkout

    git switch --detach b0bf421069e2aab810db43d6e15f38817d981451

# Serial Baud Rate Requirement

During testing it was found that the printer **must use a serial baud rate of 230400**.

Using Klipper’s default baud rate of **250000 does not work at all** on this hardware.  
With the default value, communication fails reliably (timeout) and the printer is not usable.

# Settings

    Katapult Configuration v0.0.1-110-gb0bf421

        Micro-controller Architecture (STMicroelectronics STM32)  --->
        Processor model (STM32F103)  --->
    [ ] Only 10KiB of RAM (for rare stm32f103x6 variant)
    [ ] Disable SWD at startup (for GigaDevice stm32f103 clones)
        Build Katapult deployment application (Do not build)  --->
        Clock Reference (8 MHz crystal)  --->
        Communication interface (Serial (on USART2 PA3/PA2))  --->
        Application start offset (8KiB offset)  --->
    (230400) Baud rate for serial port
    ()  GPIO pins to set on bootloader entry
    [*] Support bootloader entry on rapid double click of reset button
    [ ] Enable bootloader entry on button (or gpio) state
    [ ] Enable Status LED
