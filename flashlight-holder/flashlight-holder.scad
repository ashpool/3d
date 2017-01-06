$fa=2;
$fs=0.8;

spaceConstant = 1.2;

innerDiameter = 27;
outerDiameter = 35;
screwDiameter = 5; 
numberOfHoles = 10;
holeDiameter = innerDiameter/3.14;
length = 5.1 * holeDiameter * spaceConstant;

module tube() {
    difference() {
        cylinder(h = length, d = outerDiameter, center = true);
        hollowTube();
        for(z = [0 : holeDiameter * spaceConstant : length]) {
            n = z / (holeDiameter * spaceConstant);
            translate([0, 0, z - length/2 + holeDiameter/1.5]) holes(numberOfHoles, holeDiameter, n * holeDiameter * 2);
        }
    }
}

module hollowTube() {
    cylinder(h = length  + 0.01, d = innerDiameter, center = true);
}

module holes(holes, diameter, rotation) {
    for (i=[0:holes]){
        rotate([90, 0, i * (360/holes) + rotation]) cylinder(h = outerDiameter, d = diameter, center = true); 
    } 
}

module mount() {
    difference() {
        translate([0, innerDiameter/2, 0]) cube([screwDiameter * 6, outerDiameter - innerDiameter + 2, length], center=true);
        hollowTube();
        rotate([90, 0, 0]) translate([0, 0, -innerDiameter/2]) cylinder(h = outerDiameter - innerDiameter + 10, d = screwDiameter, center = true);
        rotate([90, 0, 0]) translate([-0.5, 0, -innerDiameter/2]) cylinder(h = 4, d = holeDiameter, center = true);
    }
}

tube();
mount();