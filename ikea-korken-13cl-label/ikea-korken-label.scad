text = "Magic Sauce";
size = 6.6;
z_adjust = -2.5;
font = "Arial Black";

korken(); // korken13() for 13 cl version 

// Smaller => http://www.ikea.com/us/en/catalog/products/40378571/
module korken13() {
    rotate([90, 0, 0]) difference() {
        import("ikea-korken-13cl-label.stl", convexity=15);
        translate([-31.5, 1, z_adjust]) rotate([90, 0, 0]) linear_extrude(height = 2) {
        text(text = text, font = font, size = size);
        }
    }
}

// Larger => http://www.ikea.com/us/en/catalog/products/90227985/
module korken() {
    scale ([1.45, 1.45, 1.45]) korken13();
}