$fn=200;


module pinHoles() {
    union() {
        for (a=[0:11]) {
            translate([sin((a * 30) - 15) * 48, cos((a * 30) - 15) * 48, 0]) cylinder(h=20, d=1, center=true);
        }
    }
}

module dividers() {   
    translate([0, 0, -0.5])
        union() {
        for (a=[0:11]) {
            translate([sin(5 + (a * 30)) * 3, cos(5 + (a * 30)) * 3, 5])
            linear_extrude(height = 0.5) {
                rotate([0, 0, (a  * -30) - 15])
                square(size = [1, 40], center = false);
            }
        }
    }
}


module numbers() {
    translate([0, 0, 0])
        union() {
        for (a=[0:11]) {
            translate([sin((a * 30) - 5) * 38, cos((a * 30) - 5) * 38, 5])
            linear_extrude(height = 0.5) {
                rotate([0, 0, (a  * -30) ])
                text(text = str(a + 1), font = font, size = 6, valign = a[1]);
            }
        }
    }
}


difference() {
    cylinder(h=10, d=100, center=true);
    pinHoles();
    numbers();
    dividers();
}


translate([0, 0, -50]) cylinder(d=10, h=50);




