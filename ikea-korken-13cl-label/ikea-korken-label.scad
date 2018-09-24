text = "PAPER LANTERN";
text2 = "";

font = "Arial Black";
size = 4.6;

x_adjust = -30;
x_adjust2 = -15;
z_adjust = -2.5;


korken13(); // korken13() for 13 cl version 

// Smaller => http://www.ikea.com/us/en/catalog/products/40378571/
module korken13() {
    rotate([90, 0, 0]) difference() {
        import("ikea-korken-13cl-label.stl", convexity=15);
        if(text2 == "") {
           translate([x_adjust, 1, z_adjust]) rotate([90, 0, 0]) linear_extrude(height = 2) {
                text(text = text, font = font, size = size, center=true);
            }
        } else {
             translate([x_adjust, 1, size + z_adjust]) rotate([90, 0, 0]) linear_extrude(height = 2) {
                text(text = text, font = font, size = size, center=true);
            }
            translate([x_adjust2, 1, -size +z_adjust]) rotate([90, 0, 0]) linear_extrude(height = 2) {
                text(text = text2, font = font, size = size, center=true);
            }
        }
    }
}

// Larger => http://www.ikea.com/us/en/catalog/products/90227985/
module korken() {
    scale ([1.45, 1.45, 1.45]) korken13();
}