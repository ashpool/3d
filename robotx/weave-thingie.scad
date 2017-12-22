$fn=36;

diam = 180;

module pin() {
    cylinder(h=30, d=4, center=true);
    translate([0, 0, 30]) sphere(d=5, center=true);
}

module pinHoles() {
    union() {
        for (a=[0:36]) {
            translate([sin((a * 10) - 15) * ((diam/2) - 1.5), cos((a * 10) - 15) * ((diam/2) - 2.5), 10]) pin();
        }
    }
}

difference() {
    cylinder(h=10, d=diam, center=true);
    cylinder(h=10, d=diam - 10, center=true);
}
pinHoles();