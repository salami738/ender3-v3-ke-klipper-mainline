# Mainline Klipper on Creality Ender 3 V3 KE with Nebula Pad

This repository provides information, documentation, and code for running **mainline (upstream) Klipper** on **Creality Ender 3 V3 KE** printers using the **Nebula Pad**.

The goal of this project is to enable a clean, transparent, and maintainable Klipper setup that is not tied to Creality’s modified firmware.

---

## What This Gives You

With the stock Nebula Pad, this repository provides a reasonably current
mainline Klipper setup for the Ender 3 V3 KE that runs reliably and with good
performance on the original hardware.

The Nebula Pad is, however, a very constrained MIPS-based system. It has limited
RAM and storage, and the stock environment does not include a compiler toolchain
such as GCC. Because of that, it is not practical to use Klipper's normal
in-place update workflow directly on the Nebula Pad.

Klipper updates for this setup work differently:

1. Update this repository with the desired upstream Klipper sources.
2. Build the required components locally on an external computer, not on the
   Nebula Pad.
3. Transfer the rebuilt files to the printer / Nebula Pad again.

This keeps the stock Nebula Pad usable while avoiding Creality's modified
Klipper fork, but it is not the same experience as a full Linux host with native
build tools and automatic Klipper updates.

If you want the most streamlined Klipper setup, including regular Klipper update
workflows and fewer platform constraints, consider replacing the Nebula Pad with
a Raspberry Pi or similar host. The printer's main control board with the
stepper motor drivers can remain in place; only the Klipper host changes.

---

## Background

Creality ships the Ender 3 V3 KE with a preinstalled version of Klipper.  
This version is **not mainline Klipper**.

Key issues with the stock firmware:

- The Klipper source code has been **modified by Creality**
- These changes are **not upstreamed** to the official Klipper project
- The modifications are **only distributed in binary form**
- The resulting firmware is effectively a **dirty fork** that cannot be audited, rebuilt, or maintained by the community

This repository exists to document and support a setup based on **official, upstream Klipper**, built from source and fully transparent.

---

## Creality Published Sources

Creality has published a limited set of files related to the Ender 3 V3 KE Klipper setup.

These files can be found here:

https://github.com/CrealityOfficial/Ender-3_V3_KE_Klipper

Important notes regarding these files:

- They do **not** represent a complete Klipper source tree
- Critical changes used in the shipped firmware are **not fully available**
- Parts of the implementation rely on **binary-only components**
- The repository does **not** allow rebuilding the exact firmware shipped on the printer

This project does **not** depend on those files but may reference them for comparison, analysis, or documentation purposes where useful.

---

## Project Goals

- Use **unmodified mainline Klipper**
- Avoid vendor-specific binary blobs where possible
- Document hardware specifics of the Ender 3 V3 KE
- Provide reproducible build and configuration steps
- Enable long-term maintainability and updates
- Improve debuggability and transparency

---

## Current Configuration

The main printer configuration is located at
[`klipper/printer-config-files/printer.cfg`](klipper/printer-config-files/printer.cfg).
It is intended for the stock Ender 3 V3 KE motion system and toolhead connected
to the Nebula Pad.

The configuration currently provides:

- MCU and Klipper host MCU connections
- Cartesian motion, travel limits, and homing
- TMC stepper driver configuration and motor currents
- Extruder and heated-bed temperature control
- BLTouch-compatible probing and safe Z homing
- Bed mesh limits and probing parameters
- Adaptive bed mesh calibration before each print
- Filament runout detection
- Part-cooling and automatic hotend heatsink fan control
- Load cell support and calibration
- Accelerometer-based resonance testing and input shaping
- Mainsail pause/resume helpers and object cancellation support
- Print start/end and filament load/unload macros
- Heater verification, idle timeout, and other safety-related limits

All hardware parameters, limits, calibration results, and pin assignments are
kept in the configuration files and are intentionally not duplicated here.

### Included Configuration Files

`printer.cfg` loads the following configuration fragments:

| File | Purpose |
| --- | --- |
| [`gcode_macro.cfg`](klipper/printer-config-files/gcode_macro.cfg) | Print start/end, G29, and filament load/unload macros |
| [`input_shaper.cfg`](klipper/printer-config-files/input_shaper.cfg) | ADXL345, resonance testing, and input shaper defaults |
| [`load_cell.cfg`](klipper/printer-config-files/load_cell.cfg) | Stock HX711 load cell configuration |
| [`fan.cfg`](klipper/printer-config-files/fan.cfg) | Part-cooling and hotend fan configuration |
| `mainsail.cfg` | Mainsail macros, included from the installation on the printer |

### Print Start Behavior

The supplied `START_PRINT` macro:

1. Aborts before heating if no filament is detected.
2. Homes X and Y, then heats the bed.
3. Homes Z with the bed at printing temperature.
4. Generates an adaptive bed mesh for the defined print objects.
5. Heats the nozzle and prints a purge line.

Example slicer start G-code:

```gcode
PRINT_START BED=[bed_temperature_initial_layer_single] EXTRUDER=[nozzle_temperature_initial_layer]
```

Placeholder names vary between slicers. `BED` must contain the initial-layer
bed temperature, not the maximum bed temperature used during the print.

> [!CAUTION]
> Calibration values and hardware limits in the supplied configuration must be
> verified on the individual printer. The checked-in settings are not universal
> calibration results.

---

## Repository Layout

- [`klipper/`](klipper/) contains the mainline Klipper installation notes,
  printer configuration, host MCU setup, and compiled C helper.
- [`mcu-firmware/`](mcu-firmware/) contains MCU firmware build and installation
  documentation.
- [`printer-filesystem-patches/`](printer-filesystem-patches/) contains service
  scripts and filesystem changes for the Nebula Pad.
- [`pinout/`](pinout/) contains board pinout notes and reference images.
- [`nebula-display/`](nebula-display/) contains notes about the stock display.
- [`prerequisites.md`](prerequisites.md) documents preparation requirements.

See [`klipper/klipper-installation.md`](klipper/klipper-installation.md) for the
current deployment and slicer setup notes.

---

## Scope

This repository may include:

- Hardware notes specific to the Ender 3 V3 KE
- Nebula Pad integration details
- Klipper configuration examples
- Build and flashing instructions
- Known limitations and workarounds
- Reverse-engineered observations where unavoidable

This is **not** intended to replicate or depend on Creality’s modified Klipper implementation.

---

## Non-Goals

- Supporting Creality’s stock Klipper binaries
- Repackaging or redistributing proprietary firmware
- Providing vendor-specific features that rely on closed-source components

---

## Disclaimer

Running mainline Klipper on this hardware may require additional effort compared to the stock firmware.  
You are responsible for verifying configurations and ensuring safe operation of your printer.

This project is community-driven and not affiliated with Creality.

---

## License

Unless stated otherwise, all original content in this repository is provided under an open-source license.  
See the `LICENSE` file for details.

---

## Contributing

Contributions are welcome.

If you discover hardware quirks, configuration improvements, or documentation gaps, please open an issue or submit a pull request.

Clear technical descriptions and reproducible steps are preferred.
