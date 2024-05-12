$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

width = 50;
length = 50;
height = 30;
wall_thickness = 3;
hole_radius = 3;
mounting_hole_radius = 2.5;
stud_radius = 2.5;
stud_distance = 5.6+2*stud_radius;
stud_offset = 0;

include <MCAD/boxes.scad>;

difference() {
    union() {
        roundedBox([width+2*wall_thickness, length+2*wall_thickness, height], wall_thickness, true);
        translate([0,0,wall_thickness])
            roundedBox([width+wall_thickness, length+wall_thickness, height+wall_thickness], wall_thickness/2, true);
    }

    // Carve out interiour
    translate([0, 0, 2*wall_thickness])
        cube([width, length, height+2*wall_thickness], center=true);

    // Holes for wires
    translate([width/3, (length+wall_thickness)/2, 0])
        rotate([90, 0, 0])
            cylinder(r=hole_radius, h=2*wall_thickness, center=true);
    translate([width/3, -(length+wall_thickness)/2, 0])
        rotate([90, 0, 0])
            cylinder(r=hole_radius, h=2*wall_thickness, center=true);
    translate([-(width+wall_thickness)/2, 0, 0])
        rotate([0, 90, 0])
            cylinder(r=hole_radius, h=2*wall_thickness, center=true);

    // Studs to mount the breadboard in
    translate([stud_offset, 0, -height/2+wall_thickness])
        union() {
            translate([stud_distance/2, 0, 0])
                cylinder(r=stud_radius, h=3*wall_thickness, center=true);
            translate([-stud_distance/2, 0, 0])
                cylinder(r=stud_radius, h=3*wall_thickness, center=true);
        }

    // Mounting holes
    translate([0, 0, -height/2+wall_thickness])
        union() {
            translate([width/3, length/3, 0])
                cylinder(r=mounting_hole_radius, h=3*wall_thickness, center=true);
            translate([-width/3, -length/3, 0])
                cylinder(r=mounting_hole_radius, h=3*wall_thickness, center=true);
        }

    // Slice the edges to allow lid to fit
    translate([0, (length/2+wall_thickness), height/2+2*wall_thickness])
        rotate([60, 0, 0])
            cube([width+2*wall_thickness, 2*wall_thickness, 4*wall_thickness], center=true);
    translate([0, -(length/2+wall_thickness), height/2+2*wall_thickness])
        rotate([-60, 0, 0])
            cube([width+2*wall_thickness, 2*wall_thickness, 4*wall_thickness], center=true);
    translate([-(width/2+wall_thickness), 0, height/2+2*wall_thickness])
        rotate([60, 0, 90])
            cube([width+2*wall_thickness, 2*wall_thickness, 4*wall_thickness], center=true);
    translate([(width/2+wall_thickness), 0, height/2+2*wall_thickness])
        rotate([-60, 0, 90])
            cube([width+2*wall_thickness, 2*wall_thickness, 4*wall_thickness], center=true);
}

