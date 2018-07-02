$fn = 32;
width = 180;
depth = 80;
height = 120;
thickness = 2;
tolerance = 1.005;
holeSpacingX = 127; // 153
holeSpacingY = 69; // 60

fanDiameter = 38;
fanHoleSpacing = 32;
pinHeight = 20;

xOffset = fanHoleSpacing / 2;
yOffset = fanHoleSpacing / 2;
zOffset = (depth - thickness) * 0.5 ;

box();
//translate([0, 30, 0]) lid();

module mountHole(mountHeight, outerDiam, innerDiam) {
    union() {
        difference() {
            rotate([90, 0, 0]) cylinder(h = mountHeight, d = outerDiam, center = true);
            rotate([90, 0, 0]) cylinder(h = mountHeight * 1.5, d = innerDiam, center = true);
        }
        for(angle = [0 : 360/4 : 359]) {
            rotate([angle, 0, 90]) translate([-mountHeight/2, outerDiam/2, 0])  linear_extrude(height = thickness, center = true)
                polygon([[0, 0],[0, mountHeight/2],[mountHeight/2, 0]]);
        }
    }
}

module lid() {
    difference() {
        cube([(width + (2 * thickness)) * tolerance, 30, height + ((2 * thickness)) * tolerance], center = true);
        translate([0, -thickness, 0]) cube([width * tolerance, 30, height * tolerance], center = true);
    }
}

module box() {
    union() {
        difference() {
            // box
            cube(size = [width,depth,height], center = true);
            translate([0, thickness, 0]) cube(size = [width - (2 *thickness), depth, height - (2 * thickness)], center = true);
            rotate([90, 0, 0]) union() {
                cylinder(d = fanDiameter, h = 100, center = true);
                translate([xOffset, yOffset, zOffset]) cylinder(h = thickness * 2, d = 5, center = true);
                translate([-xOffset, yOffset, zOffset]) cylinder(h = thickness * 2, d = 5, center = true);
                translate([xOffset, -yOffset, zOffset]) cylinder(h = thickness * 2, d = 5, center = true);
                translate([-xOffset, -yOffset, zOffset]) cylinder(h = thickness * 2, d = 5, center = true); 
            }
    
            translate([0, thickness * 2,  -height * 0.5])  cube(size = [width * 0.66, depth, thickness * 2], center = true);
    
            // Punch holes for mount holes
            translate([50, -(depth - 15) * 0.5, 45]) rotate([90, 0, 0]) cylinder(h = 30, d = 4, center = true);
            translate([-50, -(depth - 15) * 0.5, 45]) rotate([90, 0, 0]) cylinder(h = 30, d = 4, center = true);  
        }
    
        // Box mount holes
        mountHeight = 10;
        zOf = (depth - mountHeight) / 2;
        translate([-50, -zOf, 45]) mountHole(10, 10, 4);
        translate([50, -zOf, 45]) mountHole(10, 10, 4);
    
        // Unit mounts holes
        xOff = holeSpacingX / 2;
        yOff = holeSpacingY / 2;
        zOff = (depth - pinHeight) / 2;
        
        translate([xOff, -zOff, yOff]) mountHole(pinHeight, 10, 4);
        translate([-xOff, -zOff, yOff]) mountHole(pinHeight, 10, 4);
        translate([xOff, -zOff, -yOff]) mountHole(pinHeight, 10, 4);
        translate([-xOff, -zOff, -yOff]) mountHole(pinHeight, 10, 4); 
             
        // Drip protection lid
        translate([0, (depth - thickness)/2 + 1, ((height - thickness) / 2) - 1]) rotate([90, 90, -90]) linear_extrude(height = width, center = true) polygon([[0, 0],[0, 5],[5, 0]]);
    }
}