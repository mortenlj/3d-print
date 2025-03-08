/**
 An adaptation of the feet for Makita charger wall mount.

 Mounts imported from: https://www.printables.com/model/1136952-makita-charger-wall-mount-easy-removable

 The original mount is designed for the DC18RC charger, which seems to have slightly different feet from my DC18SD charger.
 This module is an adaptation of the feet to fit the DC18SD charger.

*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

union() {
    rotate([-90, 0, 0])
        import("imports/makita-mount-on-charger.stl");

    translate([0, 0, -2.5])
        cylinder(r=4.2, h=10, center=true);
}
