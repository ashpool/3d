$fn=8;
thickness = 1.2;
length = 100;
ribs = 10; // 8; // 10;
width = 120; // 80; // 120;
height = 70;
holeDiam = 6;
holeDistance = holeDiam * 1.2;
wallOffset = (3 * holeDistance) + (thickness / 2);
holes = false;


// Base
difference() {
    cube([length, width, thickness]);
    if(holes) {
        for(w = [0 : width / ribs : width]) {
            for(l = [holeDiam : holeDistance : length - holeDiam]) {
                translate([l, w + width / ribs / 2, 0]) cylinder(thickness, d = holeDiam);
            }
        }
    }
}
 
difference() {
    for(variable = [0 : width / ribs : width]) {
        translate([0, variable, thickness / 2]) rotate([0, 90, 0]) cylinder(length, r = thickness);
    }
    translate([0, -thickness, -thickness]) cube([length, width + 2 * thickness, thickness]);
}

    
// Wall
difference() {
    translate([wallOffset, 0, 0]) cube([thickness, width, height]);
    if(holes) {
        for(w = [0 : width / ribs : width]) {
            for(h = [holeDiam : holeDistance : height - holeDiam]) {
                translate([wallOffset, w + width / ribs / 2, h]) rotate([0, 90, 0]) cylinder(thickness, d = holeDiam);
            }
        }
    }
}

for(variable = [0 : width / ribs : width]) {
    translate([wallOffset + thickness / 2, variable, 0]) cylinder(height, r = thickness);
}
