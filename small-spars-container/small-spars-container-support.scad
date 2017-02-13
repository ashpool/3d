$fa=2;
$fs=0.8;

use <small-spars-container.scad>;
use <../forks/write-cylinder/write-cylinder.scad>;

module support() {
    union() {
        difference() {
            container();
            translate([0, 0, -24])cylinder(30, d = 70);
        }
    }
}

support();

//translate([0, 0, 35]) writecylinder("It is not down in any map;",[0,0,0],25,40,center=true,down=0,rotate=0);
//translate([0, 0, 28]) writecylinder(" true places never are.",[0,0,0],25,40,center=true,down=0,rotate=0);