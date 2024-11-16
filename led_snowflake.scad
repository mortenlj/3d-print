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


module Leaf(length, width, height, r) {
    cuboid([length-r, width, height], rounding=r, except=[TOP], anchor=LEFT+BOTTOM);
    xmove(-r/2) zrot(leaf_angle) cuboid([length+r/2, width, height], rounding=r, except=[TOP], anchor=LEFT+BOTTOM);
    xmove(-r/2) zrot(-leaf_angle) cuboid([length+r/2, width, height], rounding=r, except=[TOP], anchor=LEFT+BOTTOM);
}

module Stalk(length, width, height, r) {
    cuboid([2*(length+r)/3, width, height], rounding=r, except=[TOP], anchor=LEFT+BOTTOM);
}

module Branch(length, width, height, r) {
    cuboid([length, width, height], rounding=r, except=[TOP, LEFT], anchor=LEFT+BOTTOM);
    stem_length = 2*length/3;
    xmove(2*length/3) Leaf(stem_length/2, width, height, r);
    xmove((length-r)/3) zrot(stem_angle) Stalk(stem_length, width, height, r);
    xmove((length-r)/3) zrot(-stem_angle) Stalk(stem_length, width, height, r);
}

difference() {
    Branch(length+wall, led_width+wall*2, led_height+wall, wall);
    zmove(wall) union() {
        Branch(length, led_width, (led_height+wall)*2, 0);
        xmove(-led_width/2) cuboid([led_width, led_width, (led_height+wall)*2], anchor=LEFT+BOTTOM);
    }
}
