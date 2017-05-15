// DOMEKIT strutcap v1.3
// http://domekit.cc
//
// based on William Adams' excellent ball-and-socket code

ball_radius = 10;
offset = 0;						// wiggle room, tinker if necessary
height = ball_radius*2;			// from center of ball downward

inner_radius = 5.5;
wall_thickness = 2;
shaft_radius = inner_radius + wall_thickness;

nut_diameter = 7.1;
nut_height = 2.8;
nut_depth = 2;
screw_diameter = 3;

collar_height = nut_diameter  * 1.5;
collar_radius = ball_radius/2;

pad = 0.1;

module strut_cap() {
	mirror([0,0,1]) // heh, made the whole thing upside down, so we gotta flip it
	difference() {
		union() {
			sphere(r=ball_radius-offset, $fn=64);
			cylinder(r=shaft_radius, h=height, $fn=64);
			
			difference() {
				translate([0,-shaft_radius,height-collar_height])
					cube([shaft_radius+nut_height, shaft_radius*2, collar_height]);
				difference() {
					translate([shaft_radius+nut_height-collar_radius/2,-shaft_radius+collar_radius/2,height-collar_height/2])
						cube([collar_radius+pad,collar_radius+pad,collar_height+pad], center=true);
					translate([shaft_radius+nut_height-collar_radius, -shaft_radius+collar_radius, height-collar_height-pad])
						cylinder(h=40, r=collar_radius, $fn=360);
				}
				difference() {
					translate([shaft_radius+nut_height-collar_radius/2,shaft_radius-collar_radius/2,height-collar_height/2])
						cube([collar_radius+pad,collar_radius+pad,collar_height+pad], center=true);
					translate([shaft_radius+nut_height-collar_radius, shaft_radius-collar_radius, height-collar_height-pad])
						cylinder(h=40, r=collar_radius, $fn=360);
				}
			}

		}
		cylinder(r=inner_radius, h=height+0.5, $fn=64);
		
		captive_nut();
	}
}


// thanks to that prusa z-coupler code for an elegant approach to a captive nut
module captive_nut() {
	translate([shaft_radius - nut_height/3, 0, height-(nut_diameter/2)-nut_depth]) {
		rotate ([0, 90, 0]) {
			cylinder (h=nut_height, r = nut_diameter/2, $fn = 6);
			cylinder (h=shaft_radius*2, r=screw_diameter/2, center=true);
		}
		translate ([0, -(sin(60) * nut_diameter)/2, 0])
			cube ([nut_height, sin(60) * nut_diameter, height]);
	}
}


// make it!
d = 20.5;
for (x = [0:3   ]) {
    for (y = [0:1]) {
        translate([x * d, y * d, 0]) strut_cap();
    }
}