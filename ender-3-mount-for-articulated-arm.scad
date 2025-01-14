/**
 An adaptation of the Ender 3 mount for the articulated arm.

 Mount imported from: https://www.printables.com/model/202354-ender-3-raspberry-pi-camera-mount-v2
 Articulated arm joint imported from: https://www.printables.com/model/801345-articulated-arm
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

difference() {
    import("imports/ender_3_mount.stl");

    translate([20, 0, 20])
        rotate([0, 45, 0])
            cube([45, 45, 45], center=true);
}


translate([4, 0, 4])
    rotate([0, -45, 0])
        difference() {
            import("imports/gopro_like_joint_straight_short.stl");

            translate([-24, 0, 0]) cube([45, 45, 45], center=true);
        }
