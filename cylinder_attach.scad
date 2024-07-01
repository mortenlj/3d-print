
$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <BOSL2/std.scad>;

inner_radius = 20;
gap = 0;
scale = inner_radius;
screw_diameter = 6;
height = max(scale * 2, screw_diameter * 3);
wall = 5;
outer_radius = inner_radius + wall;
attachment_length = max(scale * 1.5, screw_diameter * 3);
attachment_separation = min(wall*2, outer_radius/2);

// Copied from https://github.com/rcolyer/smooth-prim
module HollowCylinder(outer_radius, inner_radius, height) {
  $fa = ($fa >= 12) ? 1 : $fa;
  $fs = ($fs >= 2) ? 0.4 : $fs;

  rad_diff = outer_radius-inner_radius;
  rotate_extrude(convexity=10)
    translate([(outer_radius+inner_radius)/2, 0, 0])
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
                    cylinder(h=height, d=outer_radius*2, center=true);
                    cylinder(h=height+wall, d=inner_radius*2, center=true);
                }

                // attachment point
                translate([attachment_separation, inner_radius + attachment_length/2, 0])
                    cube([wall, attachment_length, height], center=true);
                translate([-attachment_separation, inner_radius + attachment_length/2, 0])
                    cube([wall, attachment_length, height], center=true);
            }

            // screw hole
            translate([0, inner_radius + 2/3*attachment_length, 0])
                rotate([0, 90, 0])
                    cylinder(h=wall*10, d=screw_diameter, center=true);
        }
}

partition(size=[outer_radius*4+attachment_length*2, outer_radius*4, height*2], spread=min(scale / 2, wall * 2), cutsize=wall/2, gap=gap, cutpath="dovetail", spin=0.5, $slop=0.15) CylinderAttach();
