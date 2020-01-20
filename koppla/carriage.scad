include <lib.scad>

include_mounts = false;

rotation = include_mounts ? 90 : 0;
carriage_length = case_height - h_overlap - lid_height;
mount_height = 6;
edge_width = 0.4;
edge_height = 1;

module Mount(length) {
    union() {
        cube([wall, length, mount_height]);
        translate([0, 0, mount_height-edge_height])
            cube([wall+edge_width, length, edge_height]);
    }
}

// Testing -->
difference() {
    union() {
// --> Testing

// Carriage
difference() {
    rotate([rotation, 0, 0])
        difference() {
            Block(koppla_width, carriage_length, koppla_diameter);
            intersection() {
                Block(payload_width, case_height, payload_diameter);
                cube([koppla_width-wall*5, koppla_diameter-wall*3, case_height], center=true);
            }
            translate([0, koppla_diameter/2+wall*3, 0])
                cube([koppla_width, koppla_diameter, case_height], center=true);
            for(x=[-1,1]) {
                translate([x*(koppla_width/2-wall*1.25), 0, 0])
                    cylinder(h=case_height, r=1.5, center=true);
            }
        }
}

if (include_mounts) {
    // Mounts
    end_mount_length = 2*wemos_width/3;
    side_mount_length = 2*wemos_length/3;
    board_width = wemos_width + edge_width;

    translate([end_mount_length/2, -carriage_length/2+h_buffer_lid, -payload_diameter/2])
        rotate([0, 0, 90])
            Mount(end_mount_length);
    translate([-board_width/2-wall, -carriage_length/2+h_buffer_lid+side_mount_length/3, -payload_diameter/2])
        Mount(side_mount_length);
    translate([board_width/2+wall, -carriage_length/2+h_buffer_lid+side_mount_length/3+side_mount_length, -payload_diameter/2])
        rotate([0, 0, 180])
            Mount(side_mount_length);
}

// Testing -->
    }
    if (testing) {
        translate([25, 0, 0])
            cube([20, carriage_length+10, koppla_diameter*2], center=true);
        translate([-25, 0, 0])
            cube([20, carriage_length+10, koppla_diameter*2], center=true);
        translate([0, carriage_length/2-3, 0])
            cube([koppla_width*2, 50, koppla_diameter*2], center=true);
        translate([0, -carriage_length*0.7, 0])
            cube([koppla_width*2, 60, koppla_diameter*2], center=true);
    }
}
// --> Testing
