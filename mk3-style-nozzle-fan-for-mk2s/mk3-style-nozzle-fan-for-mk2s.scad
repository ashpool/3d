use <nozzle-fan-mk2s.scad>;
use <nozzle-fan-mk3.scad>;


//translate([100, 0, 0])

difference(){
    union() {
        translate([14, -54, -35]) rotate([180, 0, 180]) fan_n();
        fan_nozzle();
    }
    translate([-18, -53, -35]) cube([38.5, 8, 10]);
}
