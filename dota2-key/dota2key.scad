$fn=32;

module key() {
    translate([-12.5, -12.5, 0])  import("Dota2_Keycap_Updated_fixed.STL");
}


module centerPiece() {
    height = 5;
    translate([0, 0, height/2])cylinder(d=10, h=height, center=true);
}


difference() {
    key();
    centerPiece();
    
}