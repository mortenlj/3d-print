
$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.2;

vertical_mount_path = "imports/tp-link_deco_m4_wallmount.stl";

difference() {
    union() {
        translate([-25,-24,0])
            import(vertical_mount_path);

        for(offset=[-30:30:90])
            translate([0,0,offset])
                difference() {
                    translate([-25,-24,0])
                        import(vertical_mount_path);
                    cube([120,120,70], center=true);
                }
    }

    translate([-60,20,95])
        rotate(75)
            cube([150,100,200], center=true);

    translate([0, -56, 40])
        rotate(90, [1,0,0])
            union() {    
                translate([0,0,-8])
                    cylinder(5, 7, 2.5, center=true);
                cylinder(15, 2.5, 2.5, center=true);
            }
}
