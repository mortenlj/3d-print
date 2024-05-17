/**
 A taller leg to fit the spoiler for Husqvarna Robomower.
 The taller leg is needed to fit the spoiler on a Landroid, because the Landroid have higher wheel arches.

 The spoiler is available at Printables.com:
    https://www.printables.com/model/184136-spoiler-suitable-for-husqvarna-automower
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <MCAD/boxes.scad>;

module plotList(p,c) {
    for (j = p) {
        color(c) translate(j) sphere(r=1.2,$fn=30);
    }
}

// Leg
// bottom
bottom_x_offset = 3;
bottom_y_offset = 15;
bottom = [for (
    x_offset = [-1*bottom_x_offset:2*bottom_x_offset:1*bottom_x_offset],
    y_offset = [-1*bottom_y_offset:2*bottom_y_offset:1*bottom_y_offset]
    ) [x_offset, y_offset, 0]];

// top
top_x_offset = 2.1;

top_y_front_offset = 5;
top_y_back_offset = 25;

top_z_front_offset = 70;
top_z_back_offset = 75;

function z_offset(y) = top_z_front_offset + (top_z_back_offset - top_z_front_offset) * (y - top_y_front_offset) / (top_y_back_offset - top_y_front_offset);

x_step = 2*top_x_offset;
y_step = top_y_back_offset - top_y_front_offset;
top = [for (
    x_offset = [-1*top_x_offset:x_step:1*top_x_offset],
    y_offset = [top_y_front_offset:y_step:top_y_back_offset]
    ) [x_offset, y_offset, z_offset(y_offset)]];

// Combine
points = concat(bottom, top);
leg_faces=[
    [2,3,1,0],
    [0,1,5,4],
    [4,5,7,6],
    [1,3,7,5],
    [6,7,3,2],
    [4,6,2,0]
];

union() {
    translate([0, -10, 0])
        cylinder(h=2, r=10, center=true);
    translate([0, 4, 0])
        roundedBox([20, 32, 2], 2, true);

    polyhedron(points, leg_faces, convexity=2);
}
