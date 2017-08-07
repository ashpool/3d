width = 80;
height = 80;
thickness = 2.5;
space = 5;
rows = 12;
columns = 12;
module base() {
    cube([width, height, thickness]);
}

module holes() {
    for (y =[0:6]){
        for (x =[0:rows]){
            translate([x * space, y * 10, -1.5]) cube([4, 6, 5]);
        }  
    }
}

module cover() {
    translate([7, 0, 0]) rotate([45, 0, 0]) cube([68, 10, 2]);
}

module covers() {
    for (i =[0:6]){
        translate([0,  6 + 10 * i, 0]) cover(); 
    }
}

difference() {
    base();
    translate([9, 9, 0]) holes();
}

covers();