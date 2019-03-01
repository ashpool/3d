difference() {
    union() {
        translate([0, 0, 15]) rotate([90, 0, 0])  cylinder(d=20, h=12, center=true);
        leg();
        translate([15, 0, 15]) rotate([180, 90, 0]) leg();
    }
    cylinder(d=16, h=12, center=true);
}

module leg() {
    difference() { 
        cube([12, 12, 18], center=true);
        translate([0, 0, -2]) cube([8.5, 8.5, 16], center=true);
    }
}
