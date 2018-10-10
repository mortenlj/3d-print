$fs = 0.05;
$fa = 0.2;
// $fs = 1;
// $fa = 1;

wall = 2;
diameter = 24.5;
width = 50.5;

h_relay = 50;
h_breadboard = 50;
h_overlap = 20;
height = h_relay+h_breadboard+h_overlap+wall*2;

module Block(w, h, d) {
    hull() {
        for(x=[-1,1])
            translate([(w-d)/2*x,0,0])
                cylinder(h=h, r=d/2, center=true);
    }
}
