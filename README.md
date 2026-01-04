# Mainline Klipper on Creality Ender 3 V3 KE with Nebula Pad

This repository provides information, documentation, and code for running **mainline (upstream) Klipper** on **Creality Ender 3 V3 KE** printers using the **Nebula Pad**.

The goal of this project is to enable a clean, transparent, and maintainable Klipper setup that is not tied to Creality’s modified firmware.

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

Unless stated otherwise, all original co
