
module clip(x=0, y=0, z=0, mirror=0, rotate=0) {
    translate([x, z+2, y])
    rotate(a=mirror, v=[0,0,1])
    rotate(a=rotate, v=[1,0,0])
        difference() {
            cube([10, 4, 4], true);
            translate([2, 0, 0])
                cube([10, 6, 2], true);
        }
}
