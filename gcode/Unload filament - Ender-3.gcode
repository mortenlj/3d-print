M109 S215.000 ;Heat hotend to 215C for PLA
G28 ; home all axes (X, Y, and Z)
G1 Z100 F200 ; lift nozzle 100mm
G21 ;Let the printer know you are following this point with metric values
G91 ;Let the printer know you are using relative positioning
M300 S880 P300 ; Play tone
M300 S660 P250 ; Play tone
M300 S440 P200 ; Play tone
G92 E0 ;Reset the position of the extruder
G1 E10 F100 ; Extrude a short distance before unloading to avoid blob forming
M400; Wait for command to finish
G92 E0 ;Reset the position of the extruder
G1 E-400 F1000 ;Retract 400 mm of filament at 500--2000 mm/minute speed, change 700 to the lenght of your bowdentube + 100 mm.
G1 E-100 F500 ;Retract 100 mm of filament at 500--2000 mm/minute speed, change 700 to the lenght of your bowdentube + 100 mm.
M400; Wait for command to finish
G92 E0 ;Reset the position of the extruder
G90 ; Set absolute positioning
M400; Wait for command to finish
M117 REMOVE FILAMENT ;Display message on LCD-display to remove the filament
M104 S0; Set Hot-end to 0C (off)
M140 S0; Set bed to 0C (off)
