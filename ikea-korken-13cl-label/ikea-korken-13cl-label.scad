text = "Magic Sauce";
size = 6.5;
font = "Arial Black";

korken13(); // korken() for larger jars 

// Smaller => http://www.ikea.com/us/en/catalog/products/40378571/
module korken13() {
    difference() {
        import("ikea-korken-13cl-label.stl", convexity=15);
        translate([-31.5, 1, -2.5]) rotate([90, 0, 0]) linear_extrude(height = 2) {
        text(text = text, font = font, size = size);
        }
    }
}

// Larger => http://www.ikea.com/us/en/catalog/products/90227985/
module korken() {
    scale ([1.47, 1.47, 1.60]) korken13();
}