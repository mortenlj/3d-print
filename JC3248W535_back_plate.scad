/**
  Backplate for a JC3248W535 display module, to allow hanging on the wall, and protecting the powercable.
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <BOSL2/std.scad>
include <BOSL2/walls.scad>

// distances between mounting holes
pad_x = 52.3;
pad_y = 84.3;
slop = 0.1;

leg_extend = 3;
thickness = 3;
mount_radius = 3;
screw_head_radius = 5;
screw_radius = 2;

charge_point_pos_y = pad_y - 10;
charge_point_x = 20;
charge_point_y = 5;

difference() {
    union() {
        cuboid([pad_x+2, pad_y+2, thickness], anchor=CENTER);
        ycopies(pad_y)
            xcopies(pad_x)
                cylinder(h=thickness, r=mount_radius, anchor=CENTER) {
                    position(TOP) cylinder(h=leg_extend, r=mount_radius, anchor=BOTTOM);
                }
    }
    ycopies(pad_y)
        xcopies(pad_x)
            cylinder(h=thickness*20, r=mount_radius/2, anchor=CENTER);
    ycopies(pad_y)
        xcopies(pad_x)
            cylinder(h=thickness*20, r=mount_radius+slop, anchor=TOP);

    ymove(pad_y/4) cylinder(h=thickness*2, r=screw_head_radius, anchor=CENTER) {
        position(BACK) cuboid([screw_radius*2, screw_radius*4, thickness*2], rounding=screw_radius, except=[TOP,BOTTOM], anchor=CENTER);
    }

    ymove(-charge_point_pos_y/2) cuboid([charge_point_x, charge_point_y, thickness*2], anchor=CENTER);

}
