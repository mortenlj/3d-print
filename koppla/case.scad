include <lib.scad>

module Plug(width, diameter, height=30) {
    s = sqrt(diameter*diameter/2);
    hull() {
        for(x=[-1,1])
            translate([(width-diameter)/2*x,0,0])
                rotate(45)
                    cube([s, s, height], center=true);
    }
}

// Case
difference() {
    Block(case_width, case_height, case_diameter);
    Block(koppla_width, case_height+wall*2, koppla_diameter);
    
    // Cutout for the plug
    translate([koppla_width/2, 0, (case_height+euplug_width)/2-h_overlap])
        rotate([0, 90, 0])
            Plug(euplug_width, euplug_diameter);
    
    // Air strips wide side
    for(x=[-1,0,1])
        translate([koppla_width/4*x, 0, -case_height/4])
            rotate([90, 90, 0])
                Plug(case_height/3, wall, case_diameter+wall*2);
    // Air strips slim side
    translate([0, 0, -case_height/4])
        rotate([0, 90, 0])
            Plug(case_height/3, wall, case_width+wall*2);
    // Testing
    // translate([0, 0, -20])
    //     cube([height, height, height], center=true);
    // translate([0, 0, height-10])
    //     cube([height, height, height], center=true);
}
