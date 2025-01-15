/**
 An adaptation of the Ender 3 mount for the articulated arm.

 Articulated arm joint imported from: https://www.printables.com/model/801345-articulated-arm

 When attempting to combine this with anything else, the following error is thrown.
 So to work around that, this module is rendered to a separate STL (in the imports folder) and then imported in mount.scad.

    ERROR: CGAL error in CGALUtils::applyUnion3D: CGAL ERROR: assertion violation!
    Expr: itl != it->second.end()
    File: /usr/include/CGAL/Nef_3/SNC_external_structure.h
    Line: 1078
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

difference() {
    import("../imports/gopro_like_joint_twist_90_2_part.stl");

    translate([0, 3, 0]) cube([20, 20, 20], center=true);
}
