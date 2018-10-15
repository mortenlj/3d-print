include <lib.scad>

relay_screw_distance_x = 20.55;
relay_screw_distance_y = 44.4;
relay_y = h_relay;
relay_x = 26;
screw_hole_diameter = 2.5;
carriage_length = height - h_overlap;

// Testing -->
// difference() {
//     union() {
// --> Testing

// Carriage
difference() {
    rotate([90, 0, 0])
        difference() {
            Block(width, carriage_length, diameter);
            Block(width-wall*2, height, diameter-wall*2);
            translate([0, diameter/2+wall*3, 0])
                cube([width, diameter, height], center=true);
        }
}

// Pylons for relay attachment
pylon_height = diameter/3;
for(x=[-1,1], y=[-1,1]) {
    translate([x*relay_screw_distance_x/2, 
               y*relay_screw_distance_y/2+(relay_y-carriage_length)/2+2*wall, 
               -diameter/2+pylon_height/2+wall*1])
        difference() {
            cylinder(h=pylon_height, r=screw_hole_diameter/2, center=true);
            translate([0, 0, pylon_height/2-wall])
                rotate([90, 90,0])
                    cylinder(h=screw_hole_diameter, r=0.7, center=true);
        }
}

// Extend bottom
translate([0, 0, -diameter/2+wall])
    cube([35.3, carriage_length, wall], center=true);

// Testing -->
//     }
//     translate([0, 10, 0])
//         cube([width*2, carriage_length, diameter*2], center=true);
// }
// --> Testing
