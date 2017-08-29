$fa=2;
$fs=0.8;
use <../lib/roundedRect.scad>;

module stand() {
    union() {
        difference(){
            // Main stand
            translate([30, 0, 350]) rotate([0, 90, 0]) roundedRect2([350, 100, 20], 4);
            translate([29, 32.5, 355]) rotate([0, 90, 0]) roundedRect2([50, 35, 40], 4);
            translate([29, 32.5, 250]) rotate([0, 90, 0]) roundedRect2([200, 35, 40], 4);
            // M6 reenforcements
            translate([40, 25, -30]) cylinder(h = 400, d = 6, center = false);
            translate([40, 75, -30]) cylinder(h = 400, d = 6, center = false);
            
            
        }
        union() {
            // Bottom plate
            
            difference() {
                union() {
                    roundedRect2([200, 100, 20], 4);
                    translate([100, 100, -60]) rotate([90, 0, 0]) cylinder(h = 100, d = 200, center = false);
                }
                translate([100, 110, 55]) rotate([90, 0, 0]) cylinder(h = 120, d = 80, center = false);
                translate([-20, -20, -200]) cube([400, 400, 200], center = false);
            }
        }
        // Back support
        difference() {
            translate([0, 45, 0]) roundedRect2([50, 10, 305], 4);
            translate([20, 50, -30]) cylinder(h = 400, d = 6, center = false);
        }
    }
}


difference() {
    stand();
    //translate([-10, -10, 180]) cube([400, 400, 400]); // z [bottom = 180 : top = -220] 
}
