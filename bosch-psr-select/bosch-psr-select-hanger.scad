// https://github.com/ashpool/3d/tree/master/bosch-psr-select
// https://www.thingiverse.com/thing:2013007
$fa=2;
$fs=0.8;
use <../lib/roundedRect.scad>;

module hanger() {
    difference() {
        union() {
            translate([-30, -77, 0]) roundedRect2([60, 75, 15], 2);
            rotate([90, 0, 0]) translate([-23, 5, 79]) linear_extrude(height = 1) {
                text("Bosch PSR Select", size = 4);
            }
            rotate([90, 0, 0]) translate([24, -5, 2]) support([12, 58, 5], 2);
            rotate([90, 0, 0]) translate([-24, -5, 2]) support([12, 58, 5], 2);
        }
        translate([0, -30, -25]) cylinder(50, r = 19.5, center = false);
        translate([0, -50, -25]) cylinder(50, r = 23, center = false);
    }
}
    
module support(size, radius) {
    difference() {
        translate([-6, -25, 0]) roundedRect2(size, radius);
        translate([0, 28, -5]) cylinder(15, d = 5, center = false);
        translate([0, -20, -5]) cylinder(15, d = 5, center = false);
    }
    
    l = 6;
    w = 30;
    h = 75;
    
    translate([-3, -17, 0]) polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
    
}

rotate([-90, 0, 0]) hanger();
