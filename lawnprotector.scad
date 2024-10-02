/**
 A pad to put down in/on the grass to protect it from the landroid.

 The landroid will occasionally get stuck, and spin and dig up the grass.
 This pad is designed to be placed in the path of the landroid to protect the grass.
*/

$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

use <libraries/hex-grid.scad>;
include <BOSL2/std.scad>;

// The size of the pad
pad_x = 200;
pad_y = 120;
pad_z = 5;
wall = 2;
mesh_size = (pad_x / 10);

// The size of the spikes
spike_t = wall;
spike_w = 12;
spike_cross_z = 45;
spike_wedge_z = 15;
spike_foot = (spike_w/2)*sqrt(2);

create_grid([pad_x, pad_y, pad_z], mesh_size, wall);

// Create the spikes
dx=mesh_size*sqrt(3)-wall*sqrt(3);
dy=mesh_size-wall;

grid_copies(size=[pad_x-dx/2, pad_y-dy/2], n=2)
    union() {
        cube([spike_t,spike_w,spike_cross_z], anchor=BOTTOM+CENTER) {
            attach(TOP, FRONT) back(spike_w/4) wedge([spike_t,spike_wedge_z,spike_w/2]);
            attach(TOP, FRONT) fwd(spike_w/4) wedge([spike_t,spike_wedge_z,spike_w/2], spin=[0,180,0]);
        }
        cube([spike_w,spike_t,spike_cross_z-2*spike_t], anchor=BOTTOM+CENTER) {
            attach(TOP, FRONT) left(spike_w/4) wedge([spike_t,spike_wedge_z,spike_w/2], spin=[0,-90,0]);
            attach(TOP, FRONT) right(spike_w/4) wedge([spike_t,spike_wedge_z,spike_w/2], spin=[0,90,0]);
        }
        up(pad_z/2) wedge([spike_w, spike_foot, spike_foot], anchor=CENTER, spin=[-135, 0, 0]);
        up(pad_z/2) wedge([spike_w, spike_foot, spike_foot], anchor=CENTER, spin=[-135, 0, 90]);
        cyl(d=mesh_size+2*wall,h=pad_z,$fn=6,circum=true);
    }
