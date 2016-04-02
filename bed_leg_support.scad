$fs = 0.5;
$fa = 0.5;

leg_r = 10;
side_width = 3;
width = leg_r*2 + side_width*2;
hole_r = 4;
center_distance = 38;
height = 60;
base_height = 5;
base_length = 70;

// === Shapes
// Base
difference() {
    resize([0, 0, 2*height/3])
        rotate([90, -90, 0])
            translate([base_length/4, 0, width/2-width])
                cylinder(width, base_length/2, base_length/2, $fn=3);
    translate([0, 0, base_length/2+base_height])
        cube([base_length, width-side_width*2, base_length], center=true);
    // Holes
    translate([center_distance/2, 0, -1])
        cylinder(base_height+2, hole_r, hole_r);
    translate([-center_distance/2, 0, -1])
        cylinder(base_height+2, hole_r, hole_r);
}

// Tower
difference() {
    cylinder(height, width/2, width/2);
    translate([0, 0, base_height])
        cylinder(height, leg_r, leg_r);
    translate([-width/2-1, 0, height/2])
        rotate([0, 90, 0])
            cylinder(width+2, hole_r, hole_r);
}
