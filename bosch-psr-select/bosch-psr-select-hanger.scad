difference() {
    translate([0, -42.5, 0])roundedRect([60, 75, 10], 10, $fn=200);
    translate([0, -30, -5]) cylinder(20, r = 20, center = false);
    translate([0, -50, -5]) cylinder(20, r = 25, center = false);
}

rotate([90, 0, 0]) translate([30, 0, 0]) support([10, 50, 5], 5, $fn=200);
rotate([90, 0, 0]) translate([-30, 0, 0]) support([10, 50, 5], 5, $fn=200);

rotate([90, 0, 0]) translate([-22, 3, 90]) text("Bosch PSR Select", size = 4);

module support(size, radius) {
    difference() {
        roundedRect(size, radius);
        translate([0, 20, -5]) cylinder(15, r = 2, center = false);
        translate([0, -20, -5]) cylinder(15, r = 2, center = false);
    }
    
    l = 6;
    w = 20;
    h = 20;
    
    translate([-3, -20, 0]) polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
    
}

module roundedRect(size, radius) {
	x = size[0];
	y = size[1];
	z = size[2];

	linear_extrude(height=z)
	hull() {
		translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
	
		translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
	
		translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
	
		translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
	}
}