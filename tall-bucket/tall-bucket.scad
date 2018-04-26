$fn = 400;

diameter = 190;
thickness = 1.6; // 4 layers
height = 190 / 2;

module base() {
    difference() {
        cylinder(d = diameter, h = 40, center=true);
        translate([0, 0, thickness]) cylinder(d = diameter - (2 * thickness), h = 40, center=true);
    }
}

module segment() {
    difference() {
        cylinder(d = diameter, h = height, center=true);
        translate([0, 0, -2]) cylinder(d = diameter - (2 * thickness), h = height * 1.2, center=true);
    }
}

//base();
segment();