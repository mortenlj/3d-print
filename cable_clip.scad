$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

cable_dim = 6;
gap = 2;
cables = 6;

length = gap+(gap+cable_dim)*cables;
width = cable_dim + gap;

// base
difference() {
    cube([length, width, width], center=true);
    union() {
        for (dx=[gap+cable_dim/2:gap+cable_dim:length-gap])
            translate([dx - length/2, gap/3, 0])
                cylinder(r=cable_dim/2, h=2*width, center=true);
        for (dx=[gap+cable_dim/2:gap+cable_dim:length-gap])
            translate([dx - length/2, width/2, 0])
                cube([cable_dim-1, width, 2*width], center=true);
    }
}