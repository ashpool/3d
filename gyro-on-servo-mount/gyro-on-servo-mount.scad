union() {
    difference() {
        translate([0, -8, 9]) cube([29.5, 29.5, 10], center=true);
        translate([0, -8, 10]) cube([27.5, 27.5, 10], center=true);
        translate([0, -8, 10]) cube([7.5, 50, 10], center=true);
    }

    difference() {
        cube([22, 43, 10], center=true);
        translate([0, 0, -1.1]) cube([20, 41, 10], center=true);
        translate([0, 30, -2.5]) cube([7.5, 40, 12], center=true);
    }
}