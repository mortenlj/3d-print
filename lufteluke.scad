$fn=50;
module clip(x=0, y=0, z=0, mirror=0, rotate=0) {
    translate([x, z+2, y])
    rotate(a=mirror, v=[0,0,1])
    rotate(a=rotate, v=[1,0,0])
        difference() {
            cube([10, 4, 4], true);
            translate([2, 0, 0])
                cube([10, 6, 2], true);
        }
}

rotate(a=90, v=[1, 0, 0])
    difference() {
        minkowski() {
            cube([168, 2, 168], true);
            sphere(5, true);
        };
        translate([0,-5,0])
            cube([500, 10, 500], true);
        translate([0, 5, 0])
            cube([171, 6, 171], true);
        translate([40, 0, 40])
            cube([75, 10, 75], true);
        translate([-40, 0, 40])
            cube([75, 10, 75], true);
        translate([40, 0, -40])
            cube([75, 10, 75], true);
        translate([-40, 0, -40])
            cube([75, 10, 75], true);
        translate([80, -1, 80])
            rotate(a=-90, v=[1,0,0])
                cylinder(10, 1, 3);
        translate([-80, -1, 80])
            rotate(a=-90, v=[1,0,0])
                cylinder(10, 1, 3);
        translate([80, -1, -80])
            rotate(a=-90, v=[1,0,0])
                cylinder(10, 1, 3);
        translate([-80, -1, -80])
            rotate(a=-90, v=[1,0,0])
                cylinder(10, 1, 3);
        clip(-84, 70, 1.1, rotate=90);
        clip(-84, -70, 1.1, rotate=90);
        clip(84, 70, 1.1, rotate=90, mirror=180);
        clip(84, -70, 1.1, rotate=90, mirror=180);
    }
