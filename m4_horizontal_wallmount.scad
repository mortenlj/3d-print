$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

m4_height = 187;
width_approx = 93;
height = 35;
margin = 4;
carve_r = 25;
carve_raise = 2 * carve_r + 2 * margin;

module DecoM4() {
    linear_extrude(height = m4_height, center = true)
        import(file = "imports/m4_surface_traced.svg", center = true);
}

module Screw() {
    rotate([90, 0, 0])
        union() {
            translate([0, 0, - 8])
                cylinder(5, 7, 2.5, center = true);
            cylinder(16, 2.5, 2.5, center = true);
        }
}

difference() {
    // Outer shell
    resize([width_approx + margin, width_approx + margin, m4_height + 2 * margin])
        DecoM4();
    // Carve out actual M4
    DecoM4();
    // Remove side
    rotate([0, 0, 70])
        translate([0, width_approx / 2 - 4 * margin, 0])
            cube([2 * width_approx, width_approx, m4_height + 4 * margin], center = true);
    // Add air
    translate([carve_raise, 0, 0])
        rotate([90, 0, -20])
            cylinder(r = carve_r, h = width_approx * 2, center = true);
    translate([carve_raise, 0, - carve_raise])
        rotate([90, 0, -20])
            cylinder(r = carve_r, h = width_approx * 2, center = true);
    translate([carve_raise, 0, carve_raise])
        rotate([90, 0, -20])
            cylinder(r = carve_r, h = width_approx * 2, center = true);
}

translate([- margin, - width_approx / 2 - margin / 2 + 0.5, 0])
    difference() {
        // Backplate
        cube([width_approx / 2, margin, m4_height + 2 * margin], center = true);
        // Holes for screws
        translate([-width_approx / 8, -6, 0])
            Screw();
        translate([-width_approx / 8, -6, m4_height/3])
            Screw();
        translate([-width_approx / 8, -6, -m4_height/3])
            Screw();
    }
