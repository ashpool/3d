$fa=2;
$fs=0.8;

use <../lib/roundedRect.scad>;
use <../forks/write-cylinder/write-cylinder.scad>;

module container() {
    union() {
        difference() {
            union() {
                translate([-5, 25, 0]) rotate([90, 0, 0]) roundedRect2([10, 50, 3], 2);
                difference() {
                    cylinder(h = 40, d = 50);
                    translate([0, 0, 5]) cylinder(h = 40, d = 45);
                }
            }
            translate([0, 35, 45]) rotate([90, 0, 0]) cylinder(h = 70, d = 3);
            translate([0, 35, 20]) rotate([90, 0, 0]) cylinder(h = 70, d = 3);
            translate([0, 0, 20]) rotate([90, 0, 0]) cylinder(h = 30, d = 10);
        }
    }
}

container();

translate([0, 0, 35]) writecylinder("...for there is no folly",[0,0,0],25,40,center=true,down=0,rotate=0);
translate([0, 0, 28]) writecylinder("of the beast of the earth",[0,0,0],25,40,center=true,down=0,rotate=0);
translate([0, 0, 12]) writecylinder("which is not infinitely",[0,0,0],25,40,center=true,down=0,rotate=0);
translate([0, 0, 5]) writecylinder("outdone by the madness of men",[0,0,0],25,40,center=true,down=0,rotate=0);
