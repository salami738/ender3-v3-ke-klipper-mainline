#!/bin/bash

FILE="$1"

if [ ! -f $FILE ]; then
	echo "FILE: $FILE not found, exiting"
	exit 1
fi

file "$FILE"

# 2) Dynamische Abhängigkeiten prüfen (wenn ldd vorhanden ist)
ldd "$FILE" || true

# 3) Wenn ldd nicht brauchbar ist: NEEDED-Einträge anzeigen
readelf -d "$FILE" | grep NEEDED || true

# 4) MIPS-spezifisch: ELF-Attribute (zeigt oft hard/soft-float-ABI)
readelf -A "$FILE" || true
readelf -A "$FILE" || true

readelf -h "$FILE" | egrep 'Machine:|Class:|Data:|Flags:|OS/ABI:|ABI Version'
