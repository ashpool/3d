
rotate([-90, 90, 0]) {
    difference() {
        translate([0, -95, 0]) import("Mini_Tape_Gun_2.0_-_plastic_cutter.STL");
        translate([5, 0, 4]) cube([3, 1, 19.5]);
        translate([-4, -4, 2]) cube([10, 10, 24]);
    }
}