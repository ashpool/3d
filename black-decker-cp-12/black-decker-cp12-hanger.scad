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

module support(size, radius) {
    difference() {
        translate([-4.5, -25, 0]) roundedRect(size, radius);
        translate([0, 15, -5]) cylinder(15, r = 2, center = false);
    }    
}

union() {
    decoratedMainHolder();
    rotate([90, 0, 0]) translate([18, 10.5, -32.5]) support([9, 45, 5.5], 5);
    rotate([90, 0, 0]) translate([-18, 10.5, -32.5]) support([9, 45, 5.5], 5);
}