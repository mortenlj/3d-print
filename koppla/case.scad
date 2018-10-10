include <lib.scad>

module EUPlug() {
    w = 35.3;
    d = 13.7;
    s = sqrt(d*d/2);
    hull() {
        for(x=[-1,1])
            translate([(w-d)/2*x,0,0])
                rotate(45)
                    cube([s, s, 30], center=true);
    }
}

// Case
difference() {
    Block(width+wall*2, height, diameter+wall*2);
    translate([0,0,wall*2])
        Block(width, height+wall*2, diameter);
    translate([width/2, 0, height/2])
        rotate([0,90,0])
            EUPlug();
    for(x=[-1,0,1])
        translate([width/4*x, 0, -height/4])
            cube([wall, diameter+wall*3, height/3], center=true);
    translate([0, 0, -height/4])
        cube([width+wall*3, wall, height/3], center=true);
    // Testing
    translate([0, 0, -20])
        cube([height, height, height], center=true);
    translate([0, 0, height-10])
        cube([height, height, height], center=true);
}
