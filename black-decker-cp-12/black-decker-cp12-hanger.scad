$fa=2;
$fs=0.8;

use <../lib/roundedRect.scad>;

height = 33;
topDiameter = 55;
bottomDiameter = 47;
wallThickness = 10;

module mainHolder() {
    difference() {
        cylinder(h = height, d1 = bottomDiameter + wallThickness, d2 = topDiameter + wallThickness, center = true);
        cylinder(h = height + 0.01, d1 = bottomDiameter, d2 = topDiameter, center = true);
    }
}

module decoratedMainHolder() {
    holes = 10;
    difference() {
        mainHolder();
        translate([0,0,6]) holes(holes, 0);
        translate([0,0,-6]) holes(holes, 360/holes/2);
    }
}

module holes(holes, rotation) {
    for (i=[0:holes]){
        rotate([90,0,i * (360/holes) + rotation]) cylinder(h = 70, d = 10, center = true); 
    } 
}

module support() {
    diameter = 5;
    difference() {
        translate([-6.5, -25, 0]) roundedRect2([55, 52, 5.5], 5);
        translate([3, 17.5, -5]) cylinder(15, d = diameter, center = false);
        translate([3, 17.5, 4]) cylinder(15, d = diameter * 2.5, center = false);
        translate([39, 17.5, -5]) cylinder(15, d = diameter, center = false);
        translate([39, 17.5, 4]) cylinder(15, d = diameter * 2.5, center = false);
    }    
    translate([3, -18.5, -3]) cylinder(4, d = 3.5, center = false);
    translate([39, -18.5, -3]) cylinder(4, d = 3.5, center = false);
}

difference() {
    union() {
        decoratedMainHolder();
        rotate([90, 0, 0]) translate([-20, 8.5, -33]) support();
    }
    for(x = [0:4]) {
        translate([13 - x * 6, 34, -20])cylinder(60, d = 3.5, center = false);
    }
}
