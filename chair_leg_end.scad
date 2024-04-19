$fs = $preview ? 1 : 0.05;
$fa = $preview ? 1 : 0.05;

inner_dim = 12;
outer_dim = 17;
total_dim = 20;
total_height = 15;
foot_thickness = 6;

M = [ [ 1  , 0  , 0  , 0   ],
      [ 0  , 1  , 0.1, 0   ],  // the skew value; pushed along the y axis as z changes.
      [ 0  , 0  , 1  , 0   ],
      [ 0  , 0  , 0  , 1   ] ] ;
multmatrix(M) {
  union() {
    difference() {
        cylinder(r=total_dim/2, h=total_height, center=true);

        translate([0, 0, foot_thickness])
            cylinder(r=outer_dim/2, h=total_height, center=true);
    }

    cylinder(r=inner_dim/2, h=total_height, center=true);
  }
}
