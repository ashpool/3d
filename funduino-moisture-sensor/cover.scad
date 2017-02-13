$fa=2;
$fs=0.8;

use <../lib/roundedRect.scad>;
use <bottom.scad>;

width = 20;
length = 20;
height = 6;
thickness = 3;
holesDistance = 14;

module negativeBottom(){
    scale([1.05, 1.05, 1]) {
        bottom(width, length, 2);
        translate([-width/2, 0, -10]) roundedRect([width, length, 10]);
    }
}

module legHole() {
    translate([3, length, -5]) cube([8, 5, 8]);
}

module connectorHole() {
    translate([-0.0001, -4, 0]) cube([4.5, 6, 6]);
}

module middleHole() {
    translate([-0.0001, 5, 0]) cube([6, 12, 4]);
}

module cover() {
    union() {
        difference() {
            translate([-(width + thickness)/2, -1, -2]) roundedRect([width + thickness, length  + thickness, height]);
            negativeBottom();
            hole(); mirror([1, 0, 0]) hole();
            legHole(); mirror([1, 0, 0]) legHole();
            connectorHole(); mirror([1, 0, 0]) connectorHole();
            middleHole(); mirror([1, 0, 0]) middleHole();   
        }
    }
}
 
rotate([180, 0, 0]) cover();