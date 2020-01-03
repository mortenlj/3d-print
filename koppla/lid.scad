include <lib.scad>


module DHT22PinHoles(interior_y) {
    for(x=[-1.5,-0.5,0.5,1.5])
        translate([x*dupont, interior_y/2, 0])
            cube([1, wall*2, 1], center=true);
}

union() {
    difference() {
        translate([0, 0, -(lid_height-wall)/2])
            Block(case_width-1, wall, case_diameter);
        translate([0, wall, -(lid_height-wall)])
            rotate([90,0,0])
                DHT22PinHoles(lid_height-wall);
    }
    difference() {
        Block(koppla_width-1, lid_height, koppla_diameter);
        Block(payload_width-1, lid_height+wall, payload_diameter);
        translate([0, 0, (lid_height/2)])
            rotate([45, 0, 0])
                cube([koppla_width, lid_height, lid_height], center=true);
    }
}
