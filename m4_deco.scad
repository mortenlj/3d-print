
$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

module DecoM4() {
    linear_extrude(height = 187, center = true)
        import(file = "imports/m4_surface_traced.svg", center = true);
}

difference() {
    resize([100,100,7])
        DecoM4();
    translate([0,0,-92])
        DecoM4();
}
