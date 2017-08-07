$fn=100;

original_diameter = 65;
wheel_diameter = 60;
axel_diameter = 4;

hub(wheel_diameter, axel_diameter);
//tyre(wheel_diameter, axel_diameter);

module hub(wheel_diameter, axel_diameter) {
    s = wheel_diameter/original_diameter;
    scale(s, s, s) hubWithHole(wheel_diameter, axel_diameter);
}


module hubWithHole(wheel_diameter, axel_diameter) {
  
        //translate([0, 0, -20])  cylinder(40, d = axel_diameter);
        baseHub(wheel_diameter);
    
}

module baseHub(diameter) {
    translate([0, 4.5, 12.5]) rotate([180, 0, 0]) import("Wheel_Hub_65mm.stl");
    translate([0, -4.5, -12.5]) import("Wheel_Hub_65mm.stl");
}

module tyre(diameter) {
    s = diameter/original_diameter;
    scale(s, s, s) baseTyre();
}

module baseTyre(diameter) {
    import("Wheel_Tyre_65mm.stl");
    translate([0, 9, 74]) rotate([180, 0, 0]) import("Wheel_Tyre_65mm.stl");
}

