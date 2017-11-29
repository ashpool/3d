text = "FG AJI FANTASY";
size = 5;
font = "Arial Black";

difference() {
    import("ikea-korken-13cl-label.stl", convexity=15);
    translate([-31.5, 1, -2.5]) rotate([90, 0, 0]) linear_extrude(height = 2) {
       text(text = text, font = font, size = size);
    }
}