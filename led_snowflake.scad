/**
  A snowflake shaped LED light.
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <BOSL2/std.scad>;

led_width = 13;
led_height = 3;
wall = 3;

center = 40;
length = 150;

leaf_angle = 30;
stem_angle = 45;


module Leaf(length, width, height) {
    cube([length, width, height], anchor=LEFT+BOTTOM);
    zrot(leaf_angle) cube([length, width, height], anchor=LEFT+BOTTOM);
    zrot(-leaf_angle) cube([length, width, height], anchor=LEFT+BOTTOM);
}

module Stem(length, width, height) {
    cube([length, width, height], anchor=LEFT+BOTTOM);
    xmove(length/2) Leaf(length/2, width, height);
}

module Stalk(length, width, height) {
    cube([2*length/3, width, height], anchor=LEFT+BOTTOM);
}

module Branch(length, width, height) {
    cube([length, width, height], anchor=LEFT+BOTTOM);
    stem_length = 2*length/3;
    xmove(length/3) Stem(stem_length, width, height);
    xmove(length/3) zrot(stem_angle) Stalk(stem_length, width, height);
    xmove(length/3) zrot(-stem_angle) Stalk(stem_length, width, height);
}

difference() {
    Branch(length+wall, led_width+wall*2, led_height+wall);
    zmove(wall) Branch(length, led_width, (led_height+wall)*2);
}
