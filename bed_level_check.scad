$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

include <BOSL2/std.scad>;

layer_height = 0.2;
nozzle_diameter = 0.4;

// The size of the bed
bed_x = 200;
bed_y = 200;

point_radius = 7.5;

point_min_x = 0 + point_radius;
point_max_x = bed_x - point_radius;
point_min_y = 0 + point_radius;
point_max_y = bed_y - point_radius;

module Line(p1, p2) {
    hull() {
        translate(p1) zcyl(layer_height, nozzle_diameter*2);
        translate(p2) zcyl(layer_height, nozzle_diameter*2);
    }
}


line_copies(n=5, p1=[point_min_x, point_min_y], p2=[point_max_x, point_max_y])
    zcyl(layer_height, point_radius);
line_copies(n=5, p1=[point_max_y, point_min_y], p2=[point_min_x, point_max_y])
    zcyl(layer_height, point_radius);

line_copies(n=3, p1=[(point_min_x + point_max_x)/2, point_min_y], p2=[(point_min_x + point_max_x)/2, point_max_y])
    zcyl(layer_height, point_radius);
line_copies(n=3, p1=[point_min_x, (point_min_y + point_max_y)/2], p2=[point_max_x, (point_min_y + point_max_y)/2])
    zcyl(layer_height, point_radius);

Line([point_min_x, point_min_y], [point_max_x, point_max_y]);
Line([point_max_y, point_min_y], [point_min_x, point_max_y]);
Line([point_min_x, point_min_y], [point_min_x, point_max_y]);
Line([point_max_y, point_min_y], [point_max_y, point_max_y]);
Line([point_min_x, point_min_y], [point_max_x, point_min_y]);
Line([point_min_x, point_max_y], [point_max_x, point_max_y]);

Line([(point_min_x + point_max_x)/2, point_min_y], [(point_min_x + point_max_x)/2, point_max_y]);
Line([point_min_x, (point_min_y + point_max_y)/2], [point_max_x, (point_min_y + point_max_y)/2]);

x_offset = (point_max_x - point_min_x)/4;
y_offset = (point_max_y - point_min_y)/4;


points = [
    [point_min_x + x_offset, point_min_y + y_offset],
    [point_min_x + x_offset, point_max_y - y_offset],
    [point_max_x - x_offset, point_max_y - y_offset],
    [point_max_x - x_offset, point_min_y + y_offset]
];

Line(points[0], points[1]);
Line(points[1], points[2]);
Line(points[2], points[3]);
Line(points[3], points[0]);

