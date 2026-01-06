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
    
# Start klipper manually for debugging

    root@Ender3V3KE-CE0D / [#] /usr/share/klippy-env/bin/python /usr/data/klipper-mainline/klippy/klippy.py /usr/data/printer_data/config-mainline/printer.cfg

# Start klipper

    root@Ender3V3KE-CE0D / [#] ps waux | grep [k]lipper | awk '{print $1}' | xargs kill
    root@Ender3V3KE-CE0D / [#] /etc/init.d/S57klipper_mcu restart
    root@Ender3V3KE-CE0D / [#] /etc/init.d/S55klipper_service restart
