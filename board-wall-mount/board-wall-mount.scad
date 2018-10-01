// https://www.thingiverse.com/thing:3117311
// https://github.com/ashpool/3d/tree/master/board-wall-mount
$fn=64;

// Parameters
height=150;
boardThickness=56;
cornerRadius=20;
holeDiameter=3;
wallThickness=5;
holeType="chamfer"; // "countersink" || "chamfer"

// Constants
chamfer=4;
gr=1.618;

// Generate a pair of wall mounts
mount();
translate([0, 1.5 * (2 * wallThickness + boardThickness),0]) mirror([1, 0, 0]) mount();

// Code
module template1() {
    hull() {
        circle(r= cornerRadius);
        translate([0,height,0]) circle(r=cornerRadius);
        translate([height/gr,0,0]) circle(r=cornerRadius);
    }
}

module template2() {
    hull() {
        translate([2.5 * cornerRadius,2.5 * cornerRadius,0]) circle(r=cornerRadius);
        translate([1.4 * cornerRadius,height * 2,0]) circle(r=cornerRadius);
        translate([(height/gr) * 2, 1.4*cornerRadius,0]) circle(r=cornerRadius);
    }
}

module hole() {
    if(holeType=="countersink") {
        translate([0, 0, wallThickness*0.25]) cylinder(d=holeDiameter*chamfer, h=wallThickness*0.75, center=true);
        cylinder(d=holeDiameter, h=wallThickness, center=true);
    } else {
        cylinder(d1=holeDiameter, d2=holeDiameter*chamfer, h=wallThickness, center=true);
    }
}

module mount() {
    rotate([90, 0, 0]) union() {
        
        difference () {
            linear_extrude(height = boardThickness + 2 * wallThickness, center = true) template1();
            translate([height - 2 * wallThickness, height - 2 * wallThickness, 0]) cube([2 * height, 2 * height, boardThickness], center=true);
            translate([0, 0, wallThickness]) linear_extrude(height = boardThickness + 2 * wallThickness, center = true) template2();
    
            // Mount holes
            translate([(height/gr)/2.4, (height/gr)/2.4, -(boardThickness + wallThickness)/2]) rotate([0, 0, 90]) hole();
            translate([(height/gr)/2.4, height/gr, -(boardThickness + wallThickness)/2]) rotate([0, 0, 90]) hole();
        }
    }
}
