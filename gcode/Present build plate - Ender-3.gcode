M104 S0; Set Hot-end to 0C (off)
M140 S0; Set bed to 0C (off)
M107 ; turn off fan
G90 ; absolute positioning
G0 Z180 F1000 ; Move print head out of the way
G0 X5 Y180 F5000 ; present print
M84 X Y E ; disable motors
