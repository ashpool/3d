$fn = 64;

module thing() {
    height = 3;
    BottomRadius = 39/2;
    TopRadius = BottomRadius;
    center = true;
    wallThickness = 2.5;
    union() {
        difference() {
            cylinder(h = height, r1 = BottomRadius, r2 = TopRadius , center = true);
            translate([0,0,-0.01]) cylinder(h = height + 2, r1 = 19/2, r2 = 19/2, center = true);
        }
    
        translate([0,0,2.999]) {
            difference() {
                cylinder(h = height, r1 = BottomRadius, r2 = TopRadius , center = true);
                cylinder(h = height + 0.001, r1 = BottomRadius - wallThickness, r2 = TopRadius- wallThickness, center = true);
                translate([0,0,-0.01]) cylinder(h = height + 2, r1 = 19/2, r2 = 19/2, center = true);
            }
        }
    }
}

x = 38.5;
union() {
    thing();
    translate([x,0,0]) thing();
    translate([x * 2,0,0]) thing();

    translate([x/2,x - 6,0]) thing();
    translate([2*x - x/2 ,x - 6,0]) thing();

    translate([0,2*x - x/2  + 6,0]) thing();
    translate([x,2*x - x/2  + 6,0]) thing();
    translate([x * 2,2*x - x/2  + 6,0]) thing();
}