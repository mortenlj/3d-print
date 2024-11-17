/**
  A snowflake shaped LED light.
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <BOSL2/std.scad>;
slop=0.1;
led_width = 13;
led_height = 2;
wall = 3;

center = 60;
length = 150;
screw = 4/2+0.2;

leaf_angle = 30;
stem_angle = 45;


module Stem(length, width, height, w) {
    cuboid([length, width, height], anchor=LEFT+BOTTOM);
    xmove(length-slop/10) wedge([height, width/sqrt(2), width/sqrt(2)], anchor=LEFT+CENTER, orient=LEFT, spin=[45,0,0]);
}

module Hook(width, height, diff) {
    add = diff ? slop : 0;
    union() {
        cuboid([width, wall/2+add, height+slop*2], anchor=LEFT+BOTTOM);
        move([0, -wall/4+slop, height-wall/4+slop*2]) wedge([width, wall/2, wall/2], anchor=LEFT+BOTTOM, spin=[90,0,0]);
        move([0, -wall/4+slop, wall/6]) wedge([width, wall/3, wall/6], anchor=LEFT+BOTTOM, spin=[90,0,0]);
    }
}


module Leaf(length, width, height, w) {
    difference() {
        union() {
            Stem(5*length/4+w/4, width, height, w);
            xmove(-w/2) zrot(leaf_angle) Stem(length+w/2, width, height, w);
            xmove(-w/2) zrot(-leaf_angle) Stem(length+w/2, width, height, w);
            if (w>0) {
                move([length, width/2-wall/4, height-slop]) Hook(wall*2, wall+led_height, false);
            }
        }
        if (w>0) {
            move([length, -width/2+wall/4, height+slop]) xrot(180) Hook(wall*2+slop, wall+led_height, true);
        }
    }
}

module Branch(length, width, height, w) {
    cuboid([3*length/4, width, height], anchor=LEFT+BOTTOM);
    xmove(2*length/3) Leaf(length/3-w/2, width, height, w);
    xmove((length-w)/3) zrot(stem_angle) Stem(4*length/9, width, height, w);
    xmove((length-w)/3) zrot(-stem_angle) Stem(4*length/9, width, height, w);
}

module Arm() {
    move([center/2, 0, led_height+wall]) difference() {
        union() {
            Branch(length+wall, led_width+wall*2, led_height+wall, wall);
            xmove(-center/2) pie_slice(r=wall+center/2, h=led_height+wall, ang=60, anchor=BOTTOM, spin=[0,0,-30]);
        }
        zmove(wall) union() {
            Branch(length, led_width, (led_height+wall)*2, 0);
            xmove(-led_width/2) cuboid([led_width, led_width, (led_height+wall)*2], anchor=LEFT+BOTTOM);
        }
        xmove(-center/2-wall) pie_slice(r=wall+center/2, h=10*led_height, ang=60, anchor=CENTER, spin=[0,0,-30]);
    }
}


// Star arms
//%for (angle=[0:60:300]) {
//    zrot(angle)
        Arm();
//}

// Base
//%difference() {
//    union() {
//        tube(ir=wall+center/2, or=2*wall+center/2, h=2*(2*led_height+2*wall), anchor=BOTTOM);
//        zcyl(r=2*wall+center/2, h=wall, anchor=BOTTOM);
//    }
//    for (angle=[0:60:300]) {
//        zrot(angle) move([center/2-wall,0,led_height+wall]) cuboid([led_width, led_width+wall*2+slop, (led_height+wall)*4], anchor=LEFT+BOTTOM);
//    }
//    zcyl(r=screw, h=10*wall, anchor=CENTER);
//    zrot(30) xmove(center/3) zcyl(r=3, h=10*wall, anchor=CENTER);
//}
//
//// Lid
//%ymove(length*2) difference() {
//    union() {
//        tube(or=3*wall+center/2, ir=2*wall+center/2+slop, h=2*(2*led_height+2*wall), anchor=BOTTOM);
//        zcyl(r=3*wall+center/2, h=wall, anchor=BOTTOM);
//    }
//    zcyl(r=screw, h=10*wall, anchor=CENTER);
//}
