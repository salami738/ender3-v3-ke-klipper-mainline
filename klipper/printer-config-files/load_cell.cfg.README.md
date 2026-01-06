# Configuration

Klipper console in mainsail

    LOAD_CELL_DIAGNOSTIC
    # Get current value
    LOAD_CELL_READ
    LOAD_CELL_CALIBRATE
    # Remove all weight (build plate only)
    TARE
    # Use known weight
    CALIBRATE GRAMS=1800
    # 504g

## Result

Load cell calibration settings:
counts_per_gram: 107.356667
reference_tare_counts: 1111093
