$fn=100;
difference() {
    union() {
        cylinder(h = 100, d1 = 200, d2 = 160, center = true);  
        translate([0, 0, -50]) cylinder(h = 10, d = 210, , center = true);
        
        translate([55, 90, -50]) cylinder(h = 10, d = 15, center = true);
        translate([-55, 90, -50]) cylinder(h = 10, d = 15, center = true);
        translate([55, -90, -50]) cylinder(h = 10, d = 15, center = true);
        translate([-55, -90, -50]) cylinder(h = 10, d = 15, center = true); 
    }  
    translate([0, 0, -1]) cylinder(h = 110, d1 = 195, d2 = 155, center = true);
    translate([50, 0, 155]) rotate([0, 25, 0]) cube([300, 300, 300], center = true);
    translate([55, 90, -10]) cylinder(h = 100, d = 5, center = true);
    translate([-55, 90, -10]) cylinder(h = 100, d = 5, center = true);
    translate([55, -90, -10]) cylinder(h = 100, d = 5, center = true);
    translate([-55, -90, -10]) cylinder(h = 100, d = 5, center = true);
}