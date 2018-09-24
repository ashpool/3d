thickness=25;
height=120;
width=120;
trim=10;
holeDiam=5;

difference() {
    hook();
    hole();
}

module hook() {
linear_extrude(height = 2 * thickness, center = true, slices = 20, scale = 1.0)
polygon([
    [0 ,trim],
    [trim, 0],
    [width, 0],
    [width + trim, trim],
    [width + thickness -trim, 2 * thickness],
    [width -trim, 2 * thickness],
    [width - 2 * trim, thickness],
    [width - thickness, thickness],
    [thickness + trim,thickness],
    [thickness, thickness + trim],
    [thickness, height - trim],
    [thickness + trim, height],
    [thickness +  width / 2, height],
    [thickness +  width / 2, height + thickness],
    [0, height + thickness],
    ]);
}

module hole() {
    translate([width/2, height, 0]) rotate([90, 0, 0]) cylinder(h = height * 2, d = holeDiam, center = true);
    translate([width/2, height + holeDiam / 2, 0]) rotate([90, 0, 0]) cylinder(h = holeDiam, d = 3 * holeDiam, center = true);
    translate([width/2, thickness/2, 0]) rotate([90, 0, 0]) cylinder(h = thickness, d = thickness, center = true);
}