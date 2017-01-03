$fn = 200;

module thing() {
    height = 3;
    BottomRadius = 39/2;
    TopRadius = BottomRadius;
    center = true;
    wallThickness = 2.5;
    //cylinder(h = height, r1 = BottomRadius, r2 = TopRadius, center = true/false);
    difference() {
        cylinder(h = height, r1 = BottomRadius, r2 = TopRadius , center = true/false, $fs = 0.01);
        translate([0,0,-0.01]) cylinder(h = height + 2, r1 = 19/2, r2 = 19/2, center = true/false, $fs = 0.01);
    }
    
    translate([0,0,2.999]) {
        difference() {
        cylinder(h = height, r1 = BottomRadius, r2 = TopRadius , center = true/false, $fs = 0.01);
        cylinder(h = height + 0.001, r1 = BottomRadius - wallThickness, r2 = TopRadius- wallThickness, center = true/false, $fs = 0.01);
        translate([0,0,-0.01]) cylinder(h = height + 2, r1 = 19/2, r2 = 19/2, center = true/false, $fs = 0.01);
        }
    }
}

thing();
translate([39,0,0]) thing();
translate([39 * 2,0,0]) thing();

translate([39/2,39 - 6,0]) thing();
translate([2*39 - 39/2 ,39 - 6,0]) thing();

translate([0,2*39 - 39/2  + 6,0]) thing();
translate([39,2*39 - 39/2  + 6,0]) thing();
translate([39 * 2,2*39 - 39/2  + 6,0]) thing();