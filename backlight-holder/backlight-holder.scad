$fn=200;
difference() {
    cylinder(d=29, h=19);
    translate([0, 0, 16]) cylinder(d=11, h=4);
    translate([0, 0, 11.5])  cylinder(d=20, h=6);
    translate([0, 0, 10]) cube([5, 40, 2], center=true);
    translate([-25, 0, -6]) rotate([0, 105, 0]) cylinder(d=39, h=40);   
}