$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 1;    // Don't generate larger angles than 1 degrees

module oval() {
    translate([-8,0,0])
        cylinder(h=10, r=4);
    translate([8,0,0])
        cylinder(h=10, r=4);
    translate([0,0,5])
        cube([17, 8, 10], center=true);
}

module main() {
    difference() {
        oval();
        translate([0,0,-1])
            resize([20,5,12]) 
                oval();
        translate([0,3.4,5])
            rotate(-10) 
                cube([16,0.8,12], center=true);
    }
}

module base() {
    difference() {    
        translate([-12, 0, 5])
            cube([4,6,10], center=true);
        translate([-14, 0, 5])
            cube([4, 3, 12], center=true);
    }
}

module clip() {
    union() {
        main();
        base();
    }
}

difference() {
    clip();
    translate([-15, 0, 5])
        rotate([0,90,0])
            cylinder(h=6, r=0.5);

}