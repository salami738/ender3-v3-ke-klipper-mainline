# Klipper version

* master
* 02.01.2026
* https://github.com/Klipper3d/klipper/commit/e60fe3d99b545d7e42ff2f5278efa5822668a57c

# git checkout

    git switch --detach e60fe3d99b545d7e42ff2f5278efa5822668a57c

# Serial Baud Rate Requirement

During testing it was found that the printer **must use a serial baud rate of 230400**.

Using Klipper’s default baud rate of **250000 does not work at all** on this hardware.  
With the default value, communication fails reliably (timeout) and the printer is not usable.

# Settings             

    Klipper Firmware Configuration
    
    [*] Enable extra low-level configuration options
        Micro-controller Architecture (STMicroelectronics STM32)  --->
        Processor model (STM32F103)  --->
    [ ] Only 10KiB of RAM (for rare stm32f103x6 variant)
    [ ] Disable SWD at startup (for GigaDevice stm32f103 clones)
        Bootloader offset (No bootloader)  --->
        Clock Reference (8 MHz crystal)  --->
        Communication interface (Serial (on USART2 PA3/PA2))  --->
    (230400) Baud rate for serial port
    [*] Optimize stepper code for 'step on both edges'
    ()  GPIO pins to set at micro-controller startup

# Installation on MCU

    KLIPPER_FW_FILE = "klipper.bin"

    openocd \
        -f interface/stlink.cfg \
        -f target/stm32f3x.cfg \
        -c "init; reset halt; flash write_image erase ${KLIPPER_FW_FILE} 0x08002000; verify_image ${KLIPPER_FW_FILE} 0x08002000; reset run; exit"
