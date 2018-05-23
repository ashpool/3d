$fn=16;

height = 78;
length = 80;
width = 60;
holeDiameter = 3;
thickness = 2;


box();
translate([0, 0, height/2 + thickness]) lid();

/* Example lid
translate([0, 0, height/2 + thickness]) difference() {
    lid();
    translate([-10, 25, 0]) cylinder(d = 8.5, h = thickness, center = true);
    translate([10, 25, 0]) cylinder(d = 8.5, h = thickness, center = true);
    translate([-10, -13.5, 0]) cube(size = [11, 10.5, thickness], center = true);
    translate([-10, -27, 0]) cube(size = [10, 4, thickness], center = true);   
}
*/

module shelf(w, h) {
    side = (width - w)/2 + 2;
    difference() {
        union() {
            translate([(width - side) / 2, 0, 0]) cube(size = [side, 6, height], center = true);
            translate([-(width - side) / 2, 0, 0]) cube(size = [side, 6, height], center = true);
        }
        cube(size = [w, h, height], center = true);
    }
}

module hole(x) {
    x = holeDiameter * 2.5;
    union() {
        difference() {
            cube(size = [x, x, height], center = true);
            cylinder(d = holeDiameter, h = height, center = true);
        }
    }
}


module box() {
    // box
    difference() {
        cube(size = [width, length, height], center = true);
        translate([0, 0, thickness]) cube(size = [width - thickness, length - thickness, height], center = true);
    }
    
    // Shelves
    union() {
        translate([0, 15, 0]) shelf(39, 2);
        translate([0, -20, 0]) shelf(54.5, 2);
        translate([0, -30, 0]) shelf(50.5, 2);
    }

    // Holes
    x = holeDiameter * 2.5;
    translate([(width - x)/2, (length - x)/2, 0]) hole();
    translate([-(width - x)/2, (length - x)/2, 0]) hole();
    translate([(width - x)/2, -(length - x)/2, 0]) hole();
    translate([-(width - x)/2, -(length - x)/2, 0]) hole();
}

module lid() {
    difference() {
    cube(size = [width, length, thickness], center = true);
    x = holeDiameter * 2.5;
    translate([(width - x)/2, (length - x)/2, 0]) cylinder(d = holeDiameter, h = height, center = true);
    translate([-(width - x)/2, (length - x)/2, 0]) cylinder(d = holeDiameter, h = height, center = true);
    translate([(width - x)/2, -(length - x)/2, 0]) cylinder(d = holeDiameter, h = height, center = true);
    translate([-(width - x)/2, -(length - x)/2, 0]) cylinder(d = holeDiameter, h = height, center = true);
    }
}