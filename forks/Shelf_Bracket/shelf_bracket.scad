//****************** Little shelf bracket ***************//
// Little bracket for any rickety wood shelf.            //
// 02/28/2014 - Jean-Marc Berthommé - CC BY-NC-SA        //
// Source: http://la-fabrique-du-quotidien.org/modeles/petite-equerre

//****************** Parameters to tune *****************//

// body: 30 mm x 16 mm x 20 mm
bl = 30;                           // body length - mm
bw = 16;                           // body width - mm
bh = 20;                           // body height - mm
th = 3;                            // body thickness - mm

// screws: 3 mm x 15 mm
sd = 3;                            // screw diameter - mm
sl = 15;                           // screw length - mm

// corner reinforcement
cr = 0.6;                          // corner ratio ~ [0 1]

//******************* Fixed parameters ******************//

// corner reinforcement - fixed parameters
dmin =  th*pow(2, 0.5);            // minimum distance - mm
delta_d = cr*th;                   // delta distance - mm
cw = 2*(dmin + delta_d);           // cube width - mm
echo(str("corner overflow = ", delta_d, " mm."));
// echo(str("cube width = ", cw, " mm."));

//******************** Design Check *********************//

tol = 0.5;                         // tolerance - mm

if (bw-2*th < sd + tol) {
  echo("*** Bad design *** ~> Your screws will not fit!");
  echo("Note that bw = ", bw, " mm and th = ", th, " mm.");
  echo("So bw-2*th = ", bw-2*th, " mm. That's too low!");
}

// ...

// Note that we could write a lot of code here to make safer
// designs. But that's very boring! I prefer let you "think"
// to your own bracket. After all you're a maker now, no
// longer a consumer! Right? ;D!

//********************* Instructions ********************//

translate([0, 0, bh]) rotate([180,0,0]) // best printing position

// whole bracket without the 2 screws
// **********************************

difference(){ // comment to make appear the screws

  // bracket body
  // ************
  translate([0, 0, bh]) rotate([0,90,-90])
  color([0.8, 0.5, 0.2, 0.5])
  union() {
    // main triangle
    difference() {
      linear_extrude(height = bw, center = true)
      polygon(points = [[0,0], [bh,0], [0,bl]], paths = [[0,1,2]]);
      
      translate([th, th, 0])
      linear_extrude(height = bw-2*th, center = true)
      polygon(points = [[0,0], [bh,0], [0,bl]], paths = [[0,1,2]]);
    }

    // corner reinforcement
    intersection(){
      rotate([0, 0, 45]) cube([cw, cw, bw], center = true);
      translate([0, 0, -bw/2]) cube([cw, cw, bw]);
    }
  }
  
  // horizontal screw
  // ****************
  translate([th+2/15*sl, 0, bh/2]) rotate([0,-90,0])
  color([1,1,0,0.5])
  screw(sd, sl);

  // vertical screw
  // **************
  translate([bl/2, 0, bh-(th+2/15*sl)])
  color([1,1,0,0.5])
  screw(sd, sl);
} // comment to make appear the screws

//*********************** Modules ***********************//

// screw module
// ************
// This screw model is based on wood screws of dimension:
// 3 mm x 15 mm. After a 3D printing test it was expanded
// to better handle the holes. Certainly that it is not adapted
// to all the screws. As usual a fine tuning step is required.

// Input variables:
// d: diameter - mm
// l: length - mm

module screw(d, l) {
  r = d/2;  // radius - mm
  $fn = 20; // tune the resolution
  
  union() {
    cylinder(h=2/15*l, r1=r+2.5, r2=r+1);
    translate([0, 0, 2/15*l]) cylinder(h=1/15*l, r1=r+1, r2=r+0.5);
    translate([0, 0, 3/15*l]) cylinder(h=11/15*l, r=r+0.5);
    translate([0, 0, 14/15*l]) cylinder(h=1/15*l, r1=r+0.5, r2=0);
  }
}

//********************* End Of File *********************//
