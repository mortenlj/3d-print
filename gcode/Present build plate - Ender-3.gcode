G1 Z14.04 F600 ; Move print head up
G1 X5 Y182.4 F9000 ; present print
G1 Z82.04 F600 ; Move print head further up
G1 Z150 F600 ; Move print head further up
M140 S0 ; turn off heatbed
M104 S0 ; turn off temperature
M107 ; turn off fan
M84 X Y E ; disable motors
