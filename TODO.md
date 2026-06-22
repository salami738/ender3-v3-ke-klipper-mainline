# State of development and current TODOs

## Tasks

* (/) Flash MCU with katapult bootloader
* (/) Flash MCU with klipper
* (/) Update klipper software on printer
* (/) Make SSH on printer safe
* (x) Fix creality startup scripts (init.d)
* (/) Remove creality MCU update code (init.d)
* (/) Create klipper printer.cfg files
* (/) Test klipper
* (/) Enable adaptive mesh bed levelling
* (x) Configure PR touch (Z-offset measurement via load cell)
* (/) Document Creality mcu board layout and connector pinouts
* (x) Create automatic update script for stock Ender 3v3 KE's

## Documentation

### High priority

* (x) Create a complete quickstart guide from a stock printer to the first test
  print
* (x) Document supported printer, mainboard, MCU, and Nebula Pad revisions
* (x) Document the required hardware and software prerequisites
* (x) Document how to back up the stock configuration and firmware
* (x) Document recovery and the return to the stock Creality firmware
* (x) Add an illustrated SWD/ST-Link flashing guide, including connector
  orientation, wiring, power, and safety warnings
* (x) Clearly distinguish commands run on the workstation from commands run on
  the printer
* (x) Document the required checkout layout for the Klipper and Katapult source
  directories
* (x) Document expected results and verification commands for the main MCU,
  host MCU, Klipper, Moonraker, and Mainsail
* (x) Add a safe first-start checklist before enabling heaters or motion
* (x) Document the required calibration order for PID, probe/Z offset,
  extruder, load cell, bed mesh, and input shaper

### Usage and maintenance

* (x) Add a troubleshooting guide for MCU timeouts, serial baud rate problems,
  missing host MCU, Moonraker/Mainsail connection problems, incorrect homing
  direction, and heater verification errors
* (x) Document the update procedure for Klipper, MCU firmware, host MCU, and
  printer configuration, including backups and rollback
* (x) Add slicer setup examples for commonly used slicers, including start and
  end G-code
* (x) Document SSH hardening, authentication, passwords, and network exposure
* (x) Expand the printer filesystem patch documentation with installation,
  verification, and rollback steps
* (x) Review all documentation for assumed or missing preparation steps
* (x) Fix incorrect or ambiguous paths and commands in the existing
  documentation

## Optional

* (x) Update stock printer via creality uart bootloader (currently: ST-Link needed)
* (x) Make Nebula PAD usable and without errors on printer startup
* (x) Test MCU firmware update via Katapult UART
* (x) Add gcc compiler on printer
