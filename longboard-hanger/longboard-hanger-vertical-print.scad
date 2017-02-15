$fa=2;
$fs=0.8;
use <../lib/roundedRect.scad>;

module base(height, length, diameter) {
  linear_extrude(height = height, center = true, convexity = 10,   twist = 0, slices = 20, scale = 1.0) {
    hull() {
      circle(d=diameter);
      translate([length,0,0]) circle(d=diameter);
    }
  }
}

module horn() {
  difference() {
    base(80, 27, 15);
    rotate([90, 90, 0]) translate([5, -5, 0]) base(30, 20, 15);
  }
}

module mount() {
  difference() {
    translate([-7, -35.5, -4]) roundedRect2([42, 71, 11], 7.5);
    translate([4, -15, -10]) roundedRect2([20, 30, 20], 7.5);
    for(x=[0:6]) {
      rotate([0, 90, 0]) translate([-7, 7 * x -21, -20]) cylinder(h = 65, d = 4, center = false);
    }
  }
}

module holes() {
  translate([1, 0, 5]) cylinder(h = 50, d = 5, center = false);
  translate([1, 0, 37]) cylinder(h = 10, d = 10.5, center = false);
  translate([10, 0, -50]) cylinder(h = 100, d = 5, center = false);
  translate([10, 0, -50]) cylinder(h = 65, d = 10.5, center = false);
  translate([19, 0, -35]) cylinder(h = 90, d = 5, center = false);
  translate([19, 0, 37]) cylinder(h = 10, d = 10.5, center = false);
}

rotate([180, 0, 90])
  difference() {
    union() {
      horn();
      translate([0, -56, 0]) horn();
      translate([-0.5, -28, 33])  mount();
    }
    holes();
    translate([0, -56, 0]) holes();
  }
