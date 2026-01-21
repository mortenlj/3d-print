/**
  Backplate for a JC3248W535EN display module, to allow hanging on the wall, and protecting the powercable.
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <BOSL2/std.scad>
include <BOSL2/walls.scad>

// distances between mounting holes
pad_x = 52.3;
pad_y = 84.3;
thickness = 1;
mount_radius = 3;
screw_head_radius = 5;
screw_radius = 2;

difference() {
    union() {
        sparse_cuboid([pad_x+2, pad_y+2, thickness], dir="Z", strut=2, anchor=CENTER);
        ycopies(pad_y)
            xcopies(pad_x)
                cylinder(h=thickness, r=mount_radius, anchor=CENTER);
    }
    ycopies(pad_y)
        xcopies(pad_x)
            cylinder(h=thickness*2, r=mount_radius/2, anchor=CENTER);

    ymove(pad_y/4) cylinder(h=thickness*2, r=screw_head_radius, anchor=CENTER) {
        position(BACK) cuboid([screw_radius*2, screw_radius*4, thickness*2], rounding=screw_radius, except=[TOP,BOTTOM], anchor=CENTER);
    }
}
