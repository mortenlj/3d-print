/**
 An adaptation of the Ender 3 mount for the articulated arm.

 Mount imported from: https://www.printables.com/model/202354-ender-3-raspberry-pi-camera-mount-v2

 When attempting to combine this with anything else, the following error is thrown.
 So to work around that, this module is rendered to a separate STL (in the imports folder) and then imported in mount.scad.

    ERROR: CGAL error in CGALUtils::applyUnion3D: CGAL ERROR: assertion violation!
    Expr: itl != it->second.end()
    File: /usr/include/CGAL/Nef_3/SNC_external_structure.h
    Line: 1078
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

module Base() {
    difference() {
        import("../imports/ender_3_mount.stl");

        translate([20, 0, 20])
            rotate([0, 45, 0])
                cube([45, 45, 45], center=true);
    }
}

Base();
