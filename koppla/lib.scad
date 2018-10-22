// Control
preview = true;
testing = false;

$fs = preview ? 1 : 0.05;
$fa = preview ? 1 : 0.2;

wall = 2;
diameter = 24.5;
width = 50.5;

euplug_width = 35.3;
euplug_diameter = 13.7;

h_relay = 50;
h_breadboard = 65;
h_buffer = 0;
h_overlap = euplug_width*0.75;
height = h_buffer+h_relay+h_breadboard+h_overlap+wall*2;

module Block(w, h, d) {
    hull() {
        for(x=[-1,1])
            translate([(w-d)/2*x,0,0])
                cylinder(h=h, r=d/2, center=true);
    }
}
