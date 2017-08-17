$fa=2;
$fs=0.8;
use <../lib/roundedRect.scad>;

module hole() {
    cylinder(h = 120, d=6.1);
}

module box() {
    union() {
        difference() {
            roundedRect2([190, 160, 100], 7.5);
            translate([15, 15, -10]) roundedRect2([160, 130, 120], 7.5);
        }
    }
}

module holes() {
    translate([10, 10, -10]) hole();
    translate([180, 10, -10]) hole();
    translate([180, 150, -10]) hole();
    translate([10, 150, -10]) hole();
}

difference() {
    box();
    holes();
}

