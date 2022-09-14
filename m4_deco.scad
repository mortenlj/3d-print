
$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

m4_height = 187;
width_approx = 93;
height = 35;
margin = 4;
carve_r = 35;
carve_raise = carve_r/2+4*margin;

module DecoM4() {
    linear_extrude(height = m4_height, center = true)
        import(file = "imports/m4_surface_traced.svg", center = true);
}

module Screw() {
    rotate([0,90,0])
        union() {
            translate([0,0,-8])
                cylinder(5, 7, 2.5, center=true);
            cylinder(16, 2.5, 2.5, center=true);
        }
}

difference() {
    resize([width_approx+margin,width_approx+margin,height])
        DecoM4();
    translate([0,0,m4_height/2-height/2+margin])
        DecoM4();
    resize([width_approx-2*margin, width_approx-2*margin, m4_height])
        DecoM4();
    translate([0,0,carve_raise])
        rotate([90,90,0])
            cylinder(r=carve_r,h=width_approx*2, center=true);
    translate([0,0,carve_raise])
        rotate([0,90,0])
            cylinder(r=carve_r,h=width_approx*2, center=true);
}

translate([width_approx/2+margin/2,0,height/2])
    difference() {
        cube([margin, height, 2*height], center=true);
        translate([6,0,-margin])
            Screw();
        translate([6,0,height-3*margin])
            Screw();
    }
