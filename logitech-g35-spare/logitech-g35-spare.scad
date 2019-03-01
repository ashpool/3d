$fn=32;
difference() {
    cube([20, 25, 2.5], center=true);
    translate([5, 5, 0]) cylinder(d=2, h=5, center=true);
    translate([-5, 5, 0]) cylinder(d=2, h=5, center=true);
    translate([-5, -5, 0]) cylinder(d=2, h=5, center=true);
    translate([17, -17, 0]) rotate([0, 0, 45]) cube([40, 40, 2.5], center=true);
    translate([0, 8.5, 0]) cube([6, 4, 2.5], center=true);
}

difference() {
    translate([0, 25/2 - 2/2, 5 - 2.5/2])  cube([12, 2, 6], center=true);
    translate([0, 10, 4.5]) rotate([90, 0, 0]) cylinder(d=6, h=6, center=true);
    translate([0, 10, 7]) cube([6, 6, 6], center=true);
}

