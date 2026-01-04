# Klipper version

* master
* 02.01.2026
* https://github.com/Klipper3d/klipper/commit/e60fe3d99b545d7e42ff2f5278efa5822668a57c

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
