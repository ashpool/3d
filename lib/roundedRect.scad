module roundedRect2(size, radius) {
    translate([radius, radius, 0]) minkowski() {
        cube([size[0] - 2 * radius , size[1] - 2 * radius, size[2] -1]);
        cylinder(r=radius, h=1);
    }
}

module roundedRect(size, radius) {
    minkowski() {
        cube(size);
        cylinder(r=2,h=1);
    }
}