$fn=128;
width=16;

difference() {
    union() {
        difference() {
            cylinder(h=width, d=29, center=true);
            translate([0, 10, 0])  rotate(45, 0, 0) cube([20, 20, width], center=true);
       }
        translate([-8, -14, 0]) cube([6, 17, width], center=true);
        difference() {
            translate([5.5, -21, 0]) cube([27, 3, width], center=true);
            translate([0, -19, 0]) cube([5, 2, width], center=true); 
         }
    }
    translate([0, 0, -width/4]) hole();
    translate([0, 0, width/4]) hole();
    cylinder(h=width, d=22, center=true);
}

module hole() {
    difference() {
        cylinder(h=4.5, d=30, center=true);
        translate([0, 0, 2]) cylinder(h=2, d1=25.5, d2=31, center=true);
        translate([0, 0, 0]) cylinder(h=4, d=26, center=true);
        translate([0, 0, -2]) cylinder(h=2, d1=31, d2=25.5, center=true);
    }
}