// Control
preview = true;
testing = false;

$fs = preview ? 1 : 0.05;
$fa = preview ? 1 : 0.2;

wall = 2;
dupont = 2.54;

koppla_width = 50.5;
koppla_diameter = 24.5;
case_width = koppla_width + wall*2;
case_diameter = koppla_diameter + wall*2;
payload_width = koppla_width - wall*2; 
payload_diameter = koppla_diameter - wall*2;

euplug_width = 35.3;
euplug_diameter = 13.7;

lid_height = 10;

h_board = 34;
h_buffer_top = 25;
h_buffer_bottom = 15;
h_buffer = h_buffer_top + h_buffer_bottom;
h_overlap = euplug_width*0.75;

enabled_pylons = [2, 20];

case_height = lid_height+h_buffer+h_board+h_overlap+wall*2;

module Block(w, h, d) {
    hull() {
        for(x=[-1,1])
            translate([(w-d)/2*x,0,0])
                cylinder(h=h, r=d/2, center=true);
    }
}
