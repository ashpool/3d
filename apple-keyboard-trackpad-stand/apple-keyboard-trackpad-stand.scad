$fn=64;
difference() {
    union() {
        cylinder(d=25, h=30, center=true);
        translate([5, 6, 0]) cube([15, 12, 30], center=true);
        translate([0, 0, -13.5]) cylinder(d=45, h=3, center=true);
    }
    cylinder(d=18.5, h=30, center=true);
    translate([5, 15, 0]) cube([8, 30, 30], center=true);
}
