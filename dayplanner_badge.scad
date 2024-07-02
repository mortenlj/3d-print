
$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <MCAD/boxes.scad>;

length = 80;
width = 70;
height = 3;
border = 4;
tab = 10;

difference() {
    union() {
        roundedBox([width+2*border, length+2*border, height], 2, true);
        translate([0, length/2+tab/2, 0])
            roundedBox([tab, tab, height], 2, true);
    }

    translate([0, 0, height-1])
        roundedBox([width, length, height], 2, true);
    translate([0, length/2+tab/2, 0])
        cylinder(h=height*2, d=border, center=true);
}
