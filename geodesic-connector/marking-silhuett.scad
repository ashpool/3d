difference() {
    linear_extrude(height = 1.5)
        square(size = [50, 80], center = true);
    translate([-14, -10, 0]) linear_extrude(height = 1.5)
        text(text = str("G"), font = "Liberation Sans", size = 30, valign = "center");
}
translate([0, -10, 0])  linear_extrude(height = 1.5) square(size = [40, 2], center = true);
//translate([0, 0, 0])  linear_extrude(height = 1.5) square(size = [2, 80], center = true);