$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

width = 50;
length = 50;
height = 6;
wall_thickness = 3;

include <MCAD/boxes.scad>;

difference() {
    union() {
        roundedBox([width+2*wall_thickness, length+2*wall_thickness, height], wall_thickness, true);
    }

    translate([0,0,wall_thickness])
        roundedBox([width+wall_thickness, length+wall_thickness, height+wall_thickness], wall_thickness/2, true);
}
