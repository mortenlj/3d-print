/**
  A snowflake shaped LED light.
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <BOSL2/std.scad>;

led_width = 13;
led_height = 2;
wall = 3;

center = 60;
length = 150;

leaf_angle = 30;
stem_angle = 45;


module Stem(length, width, height, w) {
    cuboid([length, width, height], except=[TOP], anchor=LEFT+BOTTOM);
    xmove(length-0.01) wedge([height, width/sqrt(2), width/sqrt(2)], anchor=LEFT+CENTER, orient=LEFT, spin=[45,0,0]);
}

module Leaf(length, width, height, w) {
    Stem(5*length/4+w/4, width, height, w);
    xmove(-w/2) zrot(leaf_angle) Stem(length+w/2, width, height, w);
    xmove(-w/2) zrot(-leaf_angle) Stem(length+w/2, width, height, w);
}

module Branch(length, width, height, w) {
    cuboid([3*length/4, width, height], except=[TOP, LEFT], anchor=LEFT+BOTTOM);
    xmove(2*length/3) Leaf(length/3-w/2, width, height, w);
    xmove((length-w)/3) zrot(stem_angle) Stem(4*length/9, width, height, w);
    xmove((length-w)/3) zrot(-stem_angle) Stem(4*length/9, width, height, w);
}

module Arm() {
    difference() {
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


// Assemble star
Arm();


//zrot(60) Arm();
//zrot(120) Arm();
//zrot(180) Arm();
//zrot(240) Arm();
//zrot(300) Arm();
