$fn=100;

module base() {
    union() {
        sphere(d = 40);
        translate([0, 0, -10]) cylinder(h=30, d=27, center=true);
    }
}

module knob() {
    difference() {
        sphere(d = 50);
        translate([0, 0, -26]) cylinder(20, d=50, center=true);
        scale([1.05, 1.05, 1.05]) base();
    }
}

knob();
base();