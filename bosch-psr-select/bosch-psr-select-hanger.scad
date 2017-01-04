// https://github.com/ashpool/3d/tree/master/bosch-psr-select
// https://www.thingiverse.com/thing:2013007

module hanger() {
    union() {
        difference() {
            translate([-28, -77, 0]) roundedRect([55, 75, 10], 10, $fn=200);
            translate([0, -30, -5]) cylinder(20, r = 20, center = false);
            translate([0, -50, -5]) cylinder(20, r = 22, center = false);
        }

        rotate([90, 0, 0]) translate([-23, 3, 79]) linear_extrude(height = 1) {
            text("Bosch PSR Select", size = 4);
        }
        rotate([90, 0, 0]) translate([25, -5, 0]) support([9, 55, 4], 5, $fn=200);
        rotate([90, 0, 0]) translate([-25.5, -5, 0]) support([9, 55, 4], 5, $fn=200);
    }
}
    
module support(size, radius) {
    difference() {
        translate([-4.5, -25, 0]) roundedRect(size, radius);
        translate([0, 25, -5]) cylinder(15, r = 2, center = false);
        translate([0, -20, -5]) cylinder(15, r = 2, center = false);
    }
    
    l = 6;
    w = 20;
    h = 20;
    
    translate([-3, -15, 0]) polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
    
}
module roundedRect(size, radius) {
    minkowski() {
        cube(size);
        cylinder(r=2,h=1);
    }
}

rotate([-90, 0, 0]) hanger();