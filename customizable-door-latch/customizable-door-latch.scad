$fn=64;

width=30;
height=15;
length=60;

washerWidth= width*0.7;
screwDiam=4;
screwDiamBottom=screwDiam;
countersink=4;

all();
//mirror([1,0,0]) all(); 

module all() {
    union() {
    latch();
    washer(washerWidth/2);
    stopper();
    }
}

module stopper() {
    difference() {
        translate([0, 0, -height/4]) cylinder(h = height/2, d = width * 2, center = true);
        translate([0, 0, -height/4]) cylinder(h = height, d = width * 1.05, center = true);
        translate([width/2, 0, -height/4]) cube([width* 1.05, width* 1.05, height/2], center = true);
        
        translate([0, -width/2, -height/4]) rotate([0, 0, 90]) cube([width* 1.05, width* 1.05, height/2], center = true);  
        translate([width/2, -width/2, -height/4]) cube([width, width, height/2], center = true); 
        
        // Bottom hole
        translate([0, width*.75, 0]) cylinder(h = height, d = screwDiamBottom, center = true, $fn=16);
        // Countersink 
        translate([0, width*.75, -countersink/2]) cylinder(h = countersink, d = screwDiam * 2, center = true, $fn=16);
    }
    
    translate([-width * 0.4, 0, height * 0.75]) cube([width/3, width/3, height * 0.4], center=true);
    translate([-width * 0.7, 0, height * 0.25]) cube([width/3, width/3, height * 1.4], center=true);
}

module latch() {
    difference() {
        union() {
            cylinder(h = height, d = width, center = true);
            translate([length, 0, -height/4]) cylinder(h = height/2, d = width, center = true);
            translate([length/2, 0, - height/4]) cube([length, width, height/2], center = true);
    
            translate([length + width/2 - height/2, 0, 0 ]) rotate([90, 0, 0]) cylinder(h = height/2, d = height, center = true);
            translate([(length + width - height)/2, 0, height/4]) cube([length - height/ 8, height/2, height/2], center = true);
        }
        baseWasher(washerWidth * 1.08 / 2);
    }
}

module baseWasher(radius) {
    cylinder(h = height, r1 = radius*0.6, r2 = radius, center = true);
}

module washer(radius) {
    difference() {
        union() {
            translate([0, 0, height*0.7]) cylinder(h = height/2, r = radius, center = true);
            cylinder(h = height, r1 = radius*0.6, r2 = radius, center = true);
        }
        // Hole
        cylinder(h = height * 2, d = screwDiam, center = true, $fn=16);
        // Countersink
        translate([0, 0, height]) cylinder(h = countersink * 2, d = screwDiam * 2, center = true, $fn=16);
    }
}