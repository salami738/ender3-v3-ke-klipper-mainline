# Copy config to printer

    $ cd klipper
    $ rsync -vr --times printer-config-files/*.cfg creality-ender-3v3-ke:/usr/data/printer_data/config

# Copy klipper to printer

    $ cd klipper
    # Use excludes to keep klipper installation small
    # Better: use git gc --aggressive --prune=now in klipper checkout directory
    $ rsync -vr --times --exclude='.idea' --exclude='*.iml' --exclude='out/' ../../klipper/ creality-ender-3v3-ke:/usr/data/klipper-mainline/
    # The old dropbear SSH on the printer can't connect to github via SSH. So we use https. SIGH.
    $ ssh creality-ender-3v3-ke -- "cd /usr/data/klipper-mainline && git remote set-url origin https://github.com/Klipper3d/klipper.git"

    $ scp c_helper/c_helper.so creality-ender-3v3-ke:/usr/data/klipper-mainline/klippy/chelper/
    $ scp klipper_host_mcu/klipper_mcu.elf creality-ender-3v3-ke:/usr/data/klipper-mainline/
    $ cd ..
    $ rsync -vr --times printer-filesystem-patches/etc/init.d/ creality-ender-3v3-ke:/etc/init.d/

# Install mainsail config

    root@Ender3V3KE-CE0D /usr/data [#] git clone https://github.com/mainsail-crew/mainsail-config.git

# Slicer start G-code

Call the Klipper start macro with the first-layer bed temperature. Do not pass
the maximum bed temperature used later in the print as `BED_TEMP`, otherwise the
printer will heat to that higher value before waiting for the first-layer value.

    PRINT_START BED=[bed_temperature_initial_layer_single] EXTRUDER=[nozzle_temperature_initial_layer]

Adjust the placeholder names if needed. The important part is that `BED`
receives the initial layer bed temperature.

# Start klipper manually for debugging

    root@Ender3V3KE-CE0D / [#] /usr/share/klippy-env/bin/python /usr/data/klipper-mainline/klippy/klippy.py /usr/data/printer_data/config-mainline/printer.cfg

# Start klipper

    root@Ender3V3KE-CE0D / [#] ps waux | grep [k]lipper | awk '{print $1}' | xargs kill
    root@Ender3V3KE-CE0D / [#] /etc/init.d/S57klipper_mcu restart
    root@Ender3V3KE-CE0D / [#] /etc/init.d/S55klipper_service restart
