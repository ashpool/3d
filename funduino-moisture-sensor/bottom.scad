$fa=2;
$fs=0.8;

use <../lib/roundedRect.scad>;

width = 20;
height = 20;
thickness = 1;
holesDistance = 14;

module hole() {
    translate([holesDistance/2, 2, -1]) cylinder(h = 10, d = 3);
}

module insets() {
    x = 4;
    y = 7;
    z = 2;
    CubePoints = [
  [  0,  0,  0 ],  //0
  [ x,  0,  0 ],  //1
  [ x,  y,  0 ],  //2
  [  0,  y,  0 ],  //3
  [  0,  0,  z ],  //4
  [ x,  0,  z ],  //5
  [ x,  y,  z ],  //6
  [  0,  y,  z ]]; //7
  
    CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
    translate([x*2, (width - y)/2, 2]) polyhedron( CubePoints, CubeFaces );
}

module bottom(w, h, t) {
     union() {
        difference() {
            translate([-w/2, 0, 0]) roundedRect([w, h, t]);
            hole();
            mirror([1, 0, 0]) hole();
        }
        insets();
        mirror([1, 0, 0]) insets();
    }
}
 
bottom(width, height, thickness);
 