
dupont = 2.54;
wall = 2.5;
long_side = 38.1;
short_side = 25.4;
height = 20.0;

difference() {
    cube([50+(2*wall), 36+short_side+(2*wall), height+(1*wall)], true);
    translate([0,36/2,wall]) cube([long_side, short_side, height+(1*wall)], true);
    translate([0,-short_side/2,wall]) cube([50, 36, height+(1*wall)], true);
}

translate([0,36/2,wall]) for(x=[-1,1], y=[-1,1])
    translate([long_side*x/2-dupont*x, short_side*y/2-dupont*y, -height/2+wall]) cylinder(h=2, r=2, center=true);
