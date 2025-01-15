/**
 An adaptation of the Ender 3 mount for the articulated arm.

 Mount imported from: https://www.printables.com/model/202354-ender-3-raspberry-pi-camera-mount-v2
 Articulated arm joint imported from: https://www.printables.com/model/801345-articulated-arm
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

module Base() {
    import("../imports/ender-3-mount-for-articulated-arm-base.stl");
}

module AttachBar() {
    translate([-1, 0, -1])
        rotate([-45, 0, 90])
            import("../imports/ender-3-mount-for-articulated-arm-attach-bar.stl");
}

union() {
    Base();
    AttachBar();
}
