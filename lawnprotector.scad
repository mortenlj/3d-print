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
pad_size = 210;
pad_z = 5;
mesh_size = 20;
wall = 3;

// The size of the spikes
spike_t = 3;
spike_w = 12;
spike_cross_z = 35;
spike_wedge_z = 15;

create_grid([pad_size, pad_size, pad_z], mesh_size, wall);

// Create the spikes
grid_copies(size=pad_size-spike_w, n=2)
    union() {
        cube([spike_t,spike_w,spike_cross_z], anchor=BOTTOM+CENTER) {
            attach(TOP, FRONT) back(spike_w/4) wedge([spike_t,spike_wedge_z,spike_w/2]);
            attach(TOP, FRONT) fwd(spike_w/4) wedge([spike_t,spike_wedge_z,spike_w/2], spin=[0,180,0]);
        }
        cube([spike_w,spike_t,spike_cross_z-2*spike_t], anchor=BOTTOM+CENTER) {
            attach(TOP, FRONT) left(spike_w/4) wedge([spike_t,spike_wedge_z,spike_w/2], spin=[0,-90,0]);
            attach(TOP, FRONT) right(spike_w/4) wedge([spike_t,spike_wedge_z,spike_w/2], spin=[0,90,0]);
        }
        down(pad_z/2) cube([spike_w, spike_w, pad_z], anchor=BOTTOM+CENTER);
    }
