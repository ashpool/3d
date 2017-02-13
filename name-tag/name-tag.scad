use <../lib/roundedRect.scad>;
$fa=2;
$fs=0.8;

txt = "Åsa ";

union() {
    difference() {
        roundedRect2([101, 17, 3], 2);
        translate([3, 3, -1]) roundedRect2([6, 11, 10], 2);
    }
    translate([15, 4, 3]){
        linear_extrude(height = 1) {
            text(txt, size = 10, font = "Arial");
        }
    }
 }
