$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;


depth=45;
width=45;
thickness=5;

small_hole_r=1.7;
large_hole_r=3;


difference() {
    union() {   
        translate([0, depth/2-(thickness/2), 0])
            cube([depth, width, thickness], center = true);
        translate([0, 0, depth/2-(thickness/2)])
            cube([depth, thickness, width], center = true);
        translate([width/2-(thickness/2), depth/2-(thickness/2), depth/2-(thickness/2)])
            cube([thickness, depth, depth], center = true);
        translate([-(width/2-(thickness/2)), depth/2-(thickness/2), depth/2-(thickness/2)])
            cube([thickness, depth, depth], center = true);
    }

    union() {
        translate([10, 0, 15])
            rotate([90, 0, 0])
                cylinder(h = thickness*2, r = small_hole_r, center = true);
        translate([-10, 0, 15])
            rotate([90, 0, 0])
                cylinder(h = thickness*2, r = small_hole_r, center = true);
        translate([10, 0, 35])
            rotate([90, 0, 0])
                cylinder(h = thickness*2, r = small_hole_r, center = true);
        translate([-10, 0, 35])
            rotate([90, 0, 0])
                cylinder(h = thickness*2, r = small_hole_r, center = true);
    }
    
    translate([0, depth/2, 0])
        union() {
            translate([0, 0, thickness/2])
                cylinder(h = thickness, r1 = large_hole_r, r2 = large_hole_r * 2, center = true);
            cylinder(h = thickness*2, r = large_hole_r, center = true);
        }
    
    translate([0, 54.5, 54.5])
        rotate([45, 0, 0])
            cube([90, 90, 90], center = true);
}