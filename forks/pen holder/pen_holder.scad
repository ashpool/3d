// Pen holder, Rite In The Rain
$fn     = 100;
pd      = 10.1;    // pen diameter
height  = 22;       // height of holder
mat_t   = 1.5;        // materiale thickness
mat_tp  = 1;      // materiale thickness of cylinder
paper_thinckness = 0.7;

difference() {
    union() {
        translate([0, pd/2+mat_tp, 0])cylinder(d=pd+mat_tp*2, h=height, center=false);
        cube(size=[28, mat_t, height], center=false);
        translate([pd/2-mat_t, paper_thinckness+mat_t, 0])cube(size=[28, mat_t, height], center=false);
        //translate([pd/2-3.1, mat_t/2, 0])cube(size=[mat_t*2+0.2, mat_t*3, height], center=false);
    }

    translate([0, pd/2+mat_tp, -1])cylinder(d=pd, h=height+2, center=false);
    translate([28, pd*0.5, pd*0.5])cube(size=[10, pd*2, height*2], center=true);
}
translate([23, mat_t/2, 0])cylinder(d=mat_t, h=height, center=false);
translate([23, paper_thinckness+mat_t*1.5, 0]) cylinder(d=mat_t, h=height, center=false);
//translate([10, 2, 10]) cube([3.5, 3.5, 3.5]);