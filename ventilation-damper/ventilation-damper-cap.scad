w = 300;
h = 40;
d = 80;
t = 2;
rim = 16;
x = 24;
tol=0.3;

//outer();
inner();

module outer() {
    union() {
        difference() {
            union() {
                cube([w, h, d], center=true); 
                translate([0, 0, -d/2 + t/2])cube([w + rim, h + rim, t], center=true); 
            }
            cube([w - t*2, h - t*2 , d], center=true); 
            for(v = [-w/2 + 1.5*x: 1.5 * x : w/2 - 1.5*x]) {
                translate([v, h/2, - d/2  + x] ) cube([x, t, x], center=true); 
            }
        }
    }
}


module inner() {
    difference() {
        union() {
            translate([0, 4, -10/2 -1.5]) rotate([20, 0, 0]) cube([w - 2*tol, t, d - 10], center=true); 
            translate([0, 0, d/2 - t/2]) cube([w - t*2, h - t*2-tol, t], center=true); 
            translate([w/2 - t/2 -tol, 0, 0]) cube([t, h -t*2, d], center=true); 
            translate([-w/2 + t/2 + tol, 0, 0]) cube([t, h -t*2, d], center=true); 
        }
    }
}