
$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <BOSL2/std.scad>;

scale = 20;
screw_dim = 4;
height = max(scale * 2, screw_dim * 3);
wall = min(scale / 4, 5);
inner_rad = scale;
outer_rad = inner_rad + wall;
attachment_length = max(scale * 1.5, screw_dim * 3);

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
                    cube([wall, attachment_length, height], center=true);
                translate([-wall, inner_rad + attachment_length/2, 0])
                    cube([wall, attachment_length, height], center=true);
            }

            // screw hole
            translate([0, inner_rad + 2/3*attachment_length, 0])
                rotate([0, 90, 0])
                    cylinder(h=wall*4, d=screw_dim, center=true);
        }
}

partition(size=[outer_rad*4+attachment_length*2, outer_rad*4, height*2], spread=scale / 2, cutsize=wall/3, gap=1, cutpath="dovetail", spin=0.5) CylinderAttach();
