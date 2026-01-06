# Creality board infos

![Board photo](img/creality-mainboard-ender-3-v3-ke.png)

## Main MCU

According to the mainboard photos it is a GD32F303RET6 (GigaDevice ARM).
Should be compatible with: STM32F103 (klipper).
STM32F303 is the analogue MCU on STs side of things.

**Attention**: GD32F303RET6 is ARM Cortex-M4 architecture. STM32F103 is ARM Cortex-M3.

https://www.gigadevice.com/product/mcu/mcus-product-selector/gd32f303ret6

| Parameter       | Wert       |
|-----------------|------------|
| Core            | Cortex®-M4 |
| Series          | GD32F303   |
| Package         | LQFP64     |
| Max Speed (MHz) | 120        |
| Flash (Bytes)   | 512K       |
| SRAM (Bytes)    | 64K        |

![MCU pinout](img-from-st/stm32f303retX_lqfp64_pinout_rotated.png)

## Serial connection to Nebula PAD

    PA3 -> 33 Ohm -> Nebula PAD     USART2_RX
    PA2 -> 33 Ohm -> Nebula PAD     USART2_TX

# Board pin out

![Creality documentation](../img-from-creality/Motherboard-pinout-rotated.png)

## LCD connector

Nebula PAD 10 poliger Pfostenstecker (Wannenstecker / Box header) Pinbelegung MCU board Seite.

Connector picture:

             _____
             |   |
    ┌────────────────────┐
    │  1   2   3   4   5 │
    │  6   7   8   9  10 │
    └────────────────────┘

| MCU pin | box header pin | function                 |
|---------|----------------|--------------------------|
| VSS     | 1              | GND                      |
| PA12?   | 2              | MCU -> 33 Ohm            |
| PB1?    | 3              |                          |
| PA2     | 4              | MCU -> 33 Ohm -> UART TX |
| GND     | 5              | GND                      |
| +5V     | 6              | +5V                      |
| PA11?   | 7              |                          |
| NC      | 8              |                          |
| PA3     | 9              | MCU -> 33 Ohm -> UART RX |
| NC      | 10             |                          |

**NC** = not connected

![See also](img/box_connector_pinout_from_reddit.png)

## Levelling board pinout (PR-touch)

Load cell + HX711 chip. Creality name: **PR-touch**.

| Wire color   | function                            |
|--------------|-------------------------------------|
| white        | GND                                 |
| yellow/green | MCU (PA4) -> 33 Ohm -> yellow/green |
| black        | +3V3                                |
| red          | MCU (PC6) -> 33 Ohm -> red          |

## SWD pinout

| SWD pin | MCU pin |
|---------|---------|
| MRST    | NRST    |
| VCC     | +3V3    |
| DIO     | PA13    |
| CLK     | PA14    |
| GND     | GND     |

# MCU pinout

## PINs from Creality klipper config

| MCU pin                                               | function                                             |
|-------------------------------------------------------|------------------------------------------------------|
| PC2                                                   | stepper  x - step                                    |
| !PB9                                                  | stepper  x - dir                                     |
| !PC3                                                  | stepper  x - enable                                  |
| !PA5                                                  | stepper  x - endstop                                 |
| PB12                                                  | stepper  x - UART                                    |
| PB8                                                   | stepper  y - step                                    |
| PB7                                                   | stepper  y - dir                                     |
| !PC3                                                  | stepper  y - enable                                  |
| !PA6                                                  | stepper  y - endstop                                 |
| PB13                                                  | stepper  y - UART                                    |
| PB6                                                   | stepper  z - step                                    |
| !PB5                                                  | stepper  z - dir                                     |
| !PC3                                                  | stepper  z - enable                                  |
| probe:z_virtual_endstop#PA15 #probe:z_virtual_endstop | stepper  z - endstop                                 |
| PB14                                                  | stepper  z - UART                                    |
| PC14                                                  | BlTouch (CR touch) sensor                            |
| PC13                                                  | BlTouch (CR touch) control                           |
| !PC15                                                 | filament sensor switch                               |
| PB4                                                   | stepper  extruder - step                             |
| PB3                                                   | stepper  extruder - dir                              |
| !PC3                                                  | stepper  extruder - enable                           |
| PA1                                                   | Extruder heater                                      |
| PC5                                                   | Extruder temperature sensor (EPCOS 100K B57560G104F) |
| PB2                                                   | Bed heater                                           |
| PC4                                                   | Bed temperature sensor (EPCOS 100K B57560G104F)      |
| PA0                                                   | Part cooling fan                                     |
| PC1                                                   | Nozzle (hotend heatsink fan) cooling fan             |

## Documented PINs (GigaDevices manual)

| MCU pin | function                                                |
|---------|---------------------------------------------------------|
| PA13    | SWDIO (flash)                                           |
| PA14    | SWCLK (flash)                                           |
| PC14    | Resonator (per documentation / to verify on this board) |
| PC15    | Resonator (per documentation / to verify on this board) |
| PB2     | BOOT1 (per documentation / to verify on this board)     |

## Unknown / untested PINs

| MCU pin | function |
|---------|----------|
| PC0     |          |
| PA2     |          |
| PA3     |          |
| PA4     |          |
| PA7     |          |
| PA8     |          |
| PA9     |          |
| PA10    |          |
| PA11    |          |
| PA12    |          |
| PB0     |          |
| PB1     |          |
| PB10    |          |
| PB11    |          |
| PB15    |          |
| PC6     |          |
| PC7     |          |
| PC8     |          |
| PC9     |          |
| PC10    |          |
| PC11    |          |
| PC12    |          |
| PD2     |          |

## Important infos

Mainboard fan is not switchable. It is connected to GND and +24V directly.
