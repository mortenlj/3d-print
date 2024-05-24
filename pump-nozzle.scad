/**
 A nozzle for a Biltema pump (37-3622) that has a tapered end to fit our pools better.
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <MCAD/boxes.scad>;

wall_thickness = 2;
factory_nozzle_inner = 24.5/2;
factory_tip_outer = 8.7/2;

nozzle_base_outer = 5;
nozzle_end_outer = 3;

length = 75;
base_length = 15;
transition_length = 15;
nozzle_length = length - base_length - transition_length;

cube_side = length;

difference() {
    union() {
        // outer shell
        cylinder(r=factory_nozzle_inner+wall_thickness, h=base_length, center=true);
        translate([0,0,base_length/2+transition_length/2])
            cylinder(r1=factory_nozzle_inner+wall_thickness, r2=nozzle_base_outer, h=transition_length, center=true);
        translate([0,0,base_length/2+transition_length+nozzle_length/2])
            cylinder(r1=nozzle_base_outer, r2=nozzle_end_outer, h=nozzle_length, center=true);

        // handle
        rotate([0,90,0])
            roundedBox([base_length, 3.5*factory_nozzle_inner, wall_thickness], 2*wall_thickness, true);
    }

    // inner carveout
    translate([0, 0, -1]) union() {
        cylinder(r=factory_nozzle_inner, h=base_length, center=true);
        translate([0,0,base_length/2+transition_length/2])
            cylinder(r1=factory_nozzle_inner, r2=nozzle_base_outer-wall_thickness, h=transition_length, center=true);
        translate([0,0,base_length/2+transition_length+nozzle_length/2])
            cylinder(r1=nozzle_base_outer-wall_thickness, r2=nozzle_end_outer-wall_thickness, h=nozzle_length, center=true);
    }

    // sloped entry
    translate([0, 0, -1*base_length/2])
        cylinder(r1=factory_nozzle_inner+wall_thickness/2, r2=factory_nozzle_inner, h=wall_thickness, center=true);

    // angled end
    translate([-nozzle_end_outer-wall_thickness, -cube_side/2, length-base_length/2])
        rotate([0,60,0])
            cube([cube_side, cube_side, 10]);
}
