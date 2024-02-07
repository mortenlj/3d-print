// Front plate that fits my camera, to work with camera mount:
// https://www.printables.com/model/202354-ender-3-raspberry-pi-camera-mount-v2

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

y_offset=9.45;

x_spacing=10.5;
y_spacing=6.6;

difference() {
    import("imports/front_camera_cover.stl");

    translate([0, 8, 2.5])
        cube([25, 20, 5], center=true);

    translate([0, y_offset, 0])
        cylinder(r=8.5, h=20, center=true);

    for(x=[-1, 1])
        translate([x*8, y_offset, 0])
            cylinder(r=3.5, h=8, center=true);
}

translate([0, y_offset, 0])
    for(x=[-1, 1], y=[-1, 1])
        translate([x*x_spacing, y*y_spacing, 0])
            cylinder(r=1, h=6, center=true);

translate([0, y_offset, 0])
    for(x=[-1, 1], y=[-1, 1])
        translate([x*x_spacing, y*y_spacing, 0])
            cylinder(r=2, h=2, center=true);
