$fa=2;
$fs=0.8;
use <../lib/roundedRect.scad>;

module base(height, length, diameter) {
    linear_extrude(height = height, center = true, convexity = 10,   twist = 0, slices = 20, scale = 1.0) {
        hull() {
            circle(d=diameter);
            translate([length,0,0]) circle(d=diameter);
        }
    }
}

module horn() {
    difference() {
        base(80, 16, 15);
        rotate([90, 90, 0]) translate([5, -5, 0]) base(30, 20, 15);
        translate([10, 0, 0]) cylinder(h = 100, d = 5, center = true);
        translate([10, 0, -10]) cylinder(h = 65, d = 10, center = true);
    }
}

module mount() {
    difference() {
    union() {
        translate([-7.5, -29, -4]) cube([10, 58, 11]); 
        translate([0, -23, -4]) cube([20, 48, 11]); 
        translate([15, -35.5, -4]) roundedRect2([20, 71, 11], 7.5);
        translate([15, -35.5, -4]) cube([10, 71, 11], 7.5);
    }
    translate([4, -15, -10]) roundedRect2([20, 30, 20], 7.5);
    }
}

rotate([180, 0, 0]) union() {
    horn();
    translate([0, -56, 0]) horn();
    translate([0, -28, 33])  mount();
}
