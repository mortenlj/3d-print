$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

width=50;
depth=32;
leg_depth=depth-14;
height=3;
full_height=60;
hole_r=2.5;

difference() {
    cube([depth, width, height], center=true);
    translate([depth/2-7-1.5, width/2-8-1.5, 0])
        cylinder(r=hole_r, h=height+2, center=true);
    translate([depth/2-7-1.5, -width/2+8+1.5, 0])
        cylinder(r=hole_r, h=height+2, center=true);
}

leg_points=[
    [leg_depth/2, width/2, 0],
    [-leg_depth/2, width/2, 0],
    [-leg_depth/2, -width/2, 3],
    [leg_depth/2, -width/2, 3],

    [leg_depth/2, width*2, full_height],
    [-leg_depth/2, width*2, full_height],
    [-leg_depth/2, width, full_height],
    [leg_depth/2, width, full_height],
];

leg_faces=[
    [0,1,2,3],
    [4,5,1,0],
    [7,6,5,4],
    [5,6,2,1],
    [6,7,3,2],
    [7,4,0,3]
];

translate([-7, 0, 0])
    polyhedron(leg_points, leg_faces, convexity=2);

translate([-7, 0, 0])
    mirror([0,1,0])
        polyhedron(leg_points, leg_faces, convexity=2);
