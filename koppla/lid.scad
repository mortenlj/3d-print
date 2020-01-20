include <lib.scad>

include_dht_pins = false;
include_cc_hole = true;

cc2530_side = 26.7;
cc2530_antenna = 6.5;

module DHT22PinHoles(interior_y) {
    for(x=[-1.5,-0.5,0.5,1.5])
        translate([x*dupont, interior_y/2, 0])
            cube([1, wall*2, 1], center=true);
}

union() {
    difference() {
        translate([0, 0, -(lid_height-wall)/2])
            Block(case_width-1, wall, case_diameter);
        if (include_dht_pins) {
            translate([0, wall, -(lid_height-wall)])
                rotate([90,0,0])
                    DHT22PinHoles(lid_height-wall);
        }
        if (include_cc_hole) {
            translate([0, 3*cc2530_antenna/4, -(lid_height-wall-cc2530_antenna/2)])
                cube([cc2530_antenna+0.1, cc2530_antenna+0.1, cc2530_antenna+0.1], center=true);
        }
    }
    difference() {
        Block(koppla_width-0.5, lid_height, koppla_diameter);
        Block(payload_width-0.5, lid_height+wall, payload_diameter);
        translate([0, 0, (lid_height/2)])
            rotate([45, 0, 0])
                cube([koppla_width, lid_height, lid_height], center=true);
    }
}
