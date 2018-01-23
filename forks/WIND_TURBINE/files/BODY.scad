//newBody();
//mirror() newBody();

module newBody() {
    difference() {
        body();
        // rear bearing with clearance for nuts
        translate([0, -26, 0]) xSpacer();
        translate([0, -12, 0]) xSpacer();
    
        // front bearing
        translate([0, 28.5, 0]) xSpacer();
        
        // top bearing
        translate([-15.5, 0, 0]) ySpacer();
    
        // bottom bearing with clearance for stop nut
        translate([-56.5, 0, 0]) ySpacer();
        translate([-66.5, 0, 0]) ySpacer();
    }
}

difference() {
    body();
    cube([50, 50, 50]);
    //translate([0, -26, 0]) xSpacer();
    /*translate([0, 28.5, 0]) xSpacer();
    translate([-15.5, 0, 0]) ySpacer();
    translate([-56.5, 0, 0]) ySpacer();
    translate([-66.5, 0, 0]) ySpacer();*/
}

module body() {
    translate([-157, -179, 0]) import("BODY_repaired.3mf", convexity=20);
}

module xSpacer() {
    rotate([90, 0, 0]) spacer();
}

module ySpacer() {
    rotate([0, 90, 0]) spacer();
}

module spacer() {
    cylinder(h=12,d=14,center=true);
}