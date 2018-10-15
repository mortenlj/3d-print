include <lib.scad>

module Plug(width, diameter) {
    s = sqrt(diameter*diameter/2);
    hull() {
        for(x=[-1,1])
            translate([(width-diameter)/2*x,0,0])
                rotate(45)
                    cube([s, s, 30], center=true);
    }
}

// Case
difference() {
    Block(width+wall*2, height, diameter+wall*2);
    translate([0, 0, wall*2])
        Block(width, height+wall*2, diameter);
    translate([width/2, 0, (height+euplug_width)/2-h_overlap])
        rotate([0, 90, 0])
            Plug(euplug_width, euplug_diameter);
    for(x=[-1,0,1])
        translate([width/4*x, 0, -height/4])
            rotate([90, 90, 0])
                Plug(height/3, wall);
    for(x=[-1,1])
        translate([width/2*x, 0, -height/4])
            rotate([0, 90, 0])
                Plug(height/3, wall);
    translate([0, diameter/2, height/6])
        rotate([90, 90, 0])
            Plug(10, 5);
    // Testing
    // translate([0, 0, -20])
    //     cube([height, height, height], center=true);
    // translate([0, 0, height-10])
    //     cube([height, height, height], center=true);
}
