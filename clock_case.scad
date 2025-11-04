/** A case for a 8x8 LED matrix clock driven by a wemos d-1 mini
*/

include <BOSL2/std.scad>;

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

slop = 0.02;

cable_thickness = 5;
wall = 4;

rail = 2;
rail_depression = 12;

anchor = 10;
anchor_screw = 3;
anchor_depth = 15;

inner_x = 33;
inner_y = 32;
inner_z = 150;

outer_x = inner_x + 2 * wall;
outer_y = inner_y + wall;
outer_z = inner_z + wall;

difference() {
    union() {
        difference() {
            // Main outer body
            cube([outer_x, outer_y, outer_z]);

            // Carve out main interior space
            translate([wall, wall, wall])
                cube([inner_x+slop, inner_y+slop, inner_z+slop]);

            // Carve out opening for power cable
            translate([outer_x/2, wall*1.5, outer_z-cable_thickness/2])
                rotate([90,0,0])
                    cylinder(h = 2 * wall, d = cable_thickness);
            translate([outer_x/2-cable_thickness/2, -wall/2, outer_z-cable_thickness/2])
                cube([cable_thickness, 2*wall, cable_thickness]);
        }

        // Rails to keep matrix board in place
        //   Right side
        translate([outer_x-wall-rail+slop*2, outer_y-rail_depression-rail, slop])
            cube([rail, rail, outer_z-slop*2]);
        translate([outer_x-wall-rail+slop*2, outer_y-rail_depression-rail*3, slop])
            cube([rail, rail, outer_z-slop*2]);
        //   Left side
        translate([wall-slop*2, outer_y-rail_depression-rail, slop])
            cube([rail, rail, outer_z-slop*2]);
        translate([wall-slop*2, outer_y-rail_depression-rail*3, slop])
            cube([rail, rail, outer_z-slop*2]);

        // Nut anchors
        translate([wall-slop, wall-slop, outer_z-anchor_depth])
            pie_slice(h = anchor_depth, d = anchor, ang=90);
        translate([wall-slop, wall-slop, outer_z-anchor_depth-anchor/2])
            pie_slice(h = anchor/2, r1 = slop, r2 = anchor/2, ang=90);

        translate([wall+inner_x+2*slop, wall-slop, outer_z-anchor_depth])
            pie_slice(h = anchor_depth, d = anchor, ang=90, spin=90);
        translate([wall+inner_x+2*slop, wall-slop, outer_z-anchor_depth-anchor/2])
            pie_slice(h = anchor/2, r1 = slop, r2 = anchor/2, ang=90, spin=90);
    }

    // Screw holes
    translate([wall, wall, outer_z-anchor_depth])
        cylinder(h=anchor_depth+slop*2, d = anchor_screw);
    translate([wall+inner_x+slop, wall, outer_z-anchor_depth])
        cylinder(h=anchor_depth+slop*2, d = anchor_screw);
}
