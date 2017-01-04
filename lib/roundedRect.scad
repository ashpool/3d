module roundedRect(size, radius) {
    minkowski() {
        cube(size);
        cylinder(r=2,h=1);
    }
}