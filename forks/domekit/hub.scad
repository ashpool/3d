// DOMEKIT hub v2.0
// http://domekit.cc
//
// based on William Adams' excellent ball-and-socket code

disc_radius = 32;			// radius of the disc
ball_radius = 10;			// joint hole radius
expansion_factor = 1.11;		// wiggle room, adjust if you dare!
goldenratio = 1.61803399;

// uncomment either of these to create a 5 or 6-way hub
build_half_hexagon();
//build_hexagon();
//build_pentagon();


module build_half_hexagon() {
    difference() {
        build_hexagon();
        translate([-30, 13, -10]) cube([60, 30, 20], false);
    }
}


module build_hexagon() {
	intersection() {
		difference() {
			ball_joint(6, ball_radius);
			translate([0,0,ball_radius/1.5])
			hexagon(disc_radius*0.6, ball_radius*2);
		}
		edge_work();	
	}
}

module build_pentagon() {
	scaling_factor = disc_radius*0.3;
	intersection() {
		difference() {
			ball_joint(5, ball_radius);
			translate([0,0,-ball_radius/2.5])
		    scale([scaling_factor,scaling_factor,1])
			cylinder(h=20, r=1);
		}
		edge_work();
	}
}

module edge_work() {
	scale([1,1,0.6])
		sphere(r=disc_radius-disc_radius*0.13, $fn=128);
}

module ball_joint(holes, hole_radius)
{
	thickness = (hole_radius*2)/goldenratio;
	degrees_per_hole = 360 / holes;
	hole_diameter = hole_radius*2;
	hole_offset = disc_radius - hole_radius;
	threshold_radius = disc_radius - hole_diameter+hole_radius*goldenratio;

	difference() {
			union() {
				difference() {
					cylinder(r=disc_radius, h=thickness, center=true);
					for(i=[1:holes]) {
						rotate([0,0,i*degrees_per_hole])
						translate([hole_offset, 0, 0])
						cylinder(r=hole_radius*expansion_factor*0.98, h = thickness+0.5, center=true);
					}
				}
				for(i=[1:holes]) {
					rotate([0,0,i*degrees_per_hole])
					translate([hole_offset, 0, 0])
					spherecirclejoint(hole_radius, thickness);
				}
			}
		sleeve(threshold_radius, disc_radius*2, thickness+0.5);
		cylinder(r=1.5, h=20, $fn=128, center=true); // this is the center hole in the hub
	}
}

module sleeve(inner_radius, outer_radius, thickness)
{
	difference()
	{
		cylinder(r=outer_radius, h=thickness, center=true);
		cylinder(r=inner_radius, h=thickness+0.5, center=true);
	}
}

module spherecirclejoint(radius, thickness)
{
	jointexpansionlfactor = 1.11;
	outer_radius = radius * jointexpansionlfactor;
	
	difference()
	{
		cylinder(r= outer_radius, h = thickness, $fn=128, center=true);
		sphere(r=radius, $fn=64);
	}
}

module hexagon(height, depth) {
	boxWidth=height/1.75;
	union(){
		box(boxWidth, height, depth);
		rotate([0,0,60]) box(boxWidth, height, depth);
		rotate([0,0,-60]) box(boxWidth, height, depth);
	}
}

module box(w,h,d) {
	scale ([w,h,d]) cube(1, true);
}