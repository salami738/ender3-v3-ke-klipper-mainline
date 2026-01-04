# After installation of bootloader and klipper firmware

    $ ssh creality-ender-3v3-ke
    $ ps waux | grep [k]lipper | awk '{print $1}' | xargs kill

    $ root@Ender3V3KE-CE0D /root [#] /usr/share/klippy-env/bin/python /usr/data/klipper-mainline/klippy/console.py -b 230400 /dev/ttyS1
