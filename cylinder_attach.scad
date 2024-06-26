
$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <BOSL2/std.scad>;
include <MCAD/boxes.scad>;


height = 40;
wall = 5;
screw_dim = 5;
inner_rad = 21;
outer_rad = inner_rad + wall;
attachment_length = 30;

// Copied from https://github.com/rcolyer/smooth-prim
module HollowCylinder(outer_rad, inner_rad, height) {
  $fa = ($fa >= 12) ? 1 : $fa;
  $fs = ($fs >= 2) ? 0.4 : $fs;

  rad_diff = outer_rad-inner_rad;
  rotate_extrude(convexity=10)
    translate([(outer_rad+inner_rad)/2, 0, 0])
    hull() {
      translate([0, rad_diff/2, 0])
        circle(r=rad_diff/2);
      translate([0, height-rad_diff/2, 0])
        circle(r=rad_diff/2);
    }
}

module CylinderAttach() {
    rotate([0, 0, 90])
        difference() {
            union() {
                // tube
                difference() {
                    cylinder(h=height, d=outer_rad*2, center=true);
                    cylinder(h=height+wall, d=inner_rad*2, center=true);
                }

                // attachment point
                translate([wall, inner_rad + attachment_length/2, 0])
                    roundedBox([wall, attachment_length, height], 2, false);
                translate([-wall, inner_rad + attachment_length/2, 0])
                    roundedBox([wall, attachment_length, height], 2, false);
            }

            // screw hole
            translate([0, inner_rad + attachment_length/2, 0])
                rotate([0, 90, 0])
                    cylinder(h=wall*4, d=screw_dim, center=true);
        }
}

partition(size=[outer_rad*4, outer_rad*4, height*2], spread=12, cutsize=wall/3, gap=1, cutpath="dovetail", spin=0.5) CylinderAttach();
