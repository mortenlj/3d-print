base = 0;
top = base+50;
inner = 70;
outer = inner+85;
run_up = 10;

connector_path = "imports/connector.stl";

points = [
    [inner, base], 
    [inner+35, 10], 
    [outer-10, 35], 
    [outer-5, top], 
    [outer, top], 
    [outer, base], 
    [outer-5, base], 
    [outer-5, 30], 
    [inner+30, base], 
    [inner, base]
];

// right run-up
rotate([0, -90, 0])
    rotate([0, 90, -90])
        linear_extrude(height=run_up)
            polygon(points);
// left run-up
rotate([0, -90, 0])
    rotate([0, 180, -90])
        translate([0, 0, -run_up])
            linear_extrude(height=run_up)
                polygon(points);
// curve
intersection() {
    rotate_extrude($fa=0.5, $fs=0.5)
        polygon(points);
    cube([outer, outer, outer]);
}

angle_offset = 32;
con_height = 20;
con_out = 127;
// right connector
translate([con_out, -run_up, con_height])
    rotate([0, 180-angle_offset, 0])
        rotate([0, 0, 90])
            import(connector_path);
// left connector
translate([-run_up, con_out, con_height])
    rotate([180+angle_offset, 0, 0])
        import(connector_path);
