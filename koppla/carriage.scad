include <lib.scad>

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
