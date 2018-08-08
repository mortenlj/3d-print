
$fs = 1;
$fa = 1;

wall = 4;
dupont = 2.54;

case_x = 60;
case_y = 80;
case_z = 20;


module Case(interior_x, interior_y, interior_height) {
    difference() {
        hull() {
            for(x=[-1,1], y=[-1,1])
                translate([interior_x/2*x, interior_y/2*y, 0]) 
                    cylinder(h=interior_height+wall, r=wall, center=true);
        }
        translate([0,0,wall])
            cube([interior_x, interior_y, interior_height+wall], center=true);
    }
}

module Lid(interior_x, interior_y) {
    cube([interior_x+wall, interior_y+wall, wall], center=true);
}

module HuzzahMounts() {
    long_side = 38.1;
    short_side = 25.4;
    for(x=[-1,1], y=[-1,1])
        translate([long_side*x/2-dupont*x, short_side*y/2-dupont*y, 0]) 
            cylinder(h=dupont, r=2, center=true);
}

module DHT22PinHoles(interior_y) {
    for(x=[-1.5,-0.5,0.5,1.5])
        translate([x*dupont, interior_y/2, 0])
            cube([1, wall*2, 1], center=true);
}

// The box
difference() {
    Case(case_x, case_y, case_z);
    DHT22PinHoles(case_y);
    translate([0, wall/2, case_z/2-wall/2])
        Lid(case_x, case_y);
    translate([0, wall, case_z/2])
        cube([case_x, case_y, wall*2], center=true);
}

translate([case_x+wall*2, wall/2, case_z/2-wall/2])
    Lid(case_x, case_y);


// The mounts
translate([0,case_y/4,-case_z/2+wall]) 
    HuzzahMounts();
