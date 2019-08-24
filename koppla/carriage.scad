include <lib.scad>

relay_screw_distance_x = 20.55;
relay_screw_distance_y = 44.4;
relay_y = h_relay;
relay_x = 26;
screw_hole_diameter = 2;
board_screw_distance_x = 20;
board_screw_distance_y = h_board - 2*2.8;
carriage_length = case_height - h_overlap - lid_height;

// Testing -->
difference() {
    union() {
// --> Testing

// Carriage
difference() {
    rotate([90, 0, 0])
        difference() {
            Block(koppla_width, carriage_length, koppla_diameter);
            intersection() {
                Block(payload_width, case_height, payload_diameter);
                cube([koppla_width-wall*5, koppla_diameter-wall*3, case_height], center=true);
            }
            translate([0, koppla_diameter/2+wall*3, 0])
                cube([koppla_width, koppla_diameter, case_height], center=true);
            for(x=[-1,1]) {
                translate([x*(koppla_width/2-wall*1.25), 0, 0])
                    cylinder(h=case_height, r=1.5, center=true);
            }
        }
}

// Pylons for relay attachment
if (h_relay > 0) {
    pylon_height = koppla_diameter/3;
    for(x=[-1,1], y=[-1,1]) {
        translate([x*relay_screw_distance_x/2, 
                y*relay_screw_distance_y/2+(relay_y-carriage_length)/2+2*wall, 
                -koppla_diameter/2+pylon_height/2+wall*1])
            difference() {
                cylinder(h=pylon_height, r=screw_hole_diameter/2, center=true);
                translate([0, 0, pylon_height/2-wall])
                    rotate([90, 90,0])
                        cylinder(h=screw_hole_diameter, r=0.7, center=true);
            }
    }
}

// Pylons for board attachment
pylon_height = koppla_diameter/3;
for(x=[-1,1], y=[-1,1]) {
    if (len(search((1+x)*10+(1+y), enabled_pylons)) > 0) {
        translate([x*board_screw_distance_x/2, 
                y*board_screw_distance_y/2+(carriage_length/2-board_screw_distance_y/2-h_buffer_bottom-wall), 
                -koppla_diameter/2+pylon_height/2+wall*1])
            difference() {
                cylinder(h=pylon_height, r=screw_hole_diameter/2, center=true);
                translate([0, 0, pylon_height/2-wall])
                    rotate([90, 90,0])
                        cylinder(h=screw_hole_diameter, r=0.7, center=true);
            }
    }
}

// Testing -->
    }
    if (testing) {
        translate([0, 0, 15])
            cube([koppla_width*2, carriage_length+10, koppla_diameter], center=true);
        translate([25, 0, 0])
            cube([20, carriage_length+10, koppla_diameter*2], center=true);
        translate([-25, 0, 0])
            cube([20, carriage_length+10, koppla_diameter*2], center=true);
        translate([0, carriage_length/2-3, 0])
            cube([koppla_width*2, 20, koppla_diameter*2], center=true);
        translate([0, -carriage_length/2, 0])
            cube([koppla_width*2, 60, koppla_diameter*2], center=true);
    }
}
// --> Testing
