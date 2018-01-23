// Make very aerated orchid pots
// Dan Newman, dan newman @ mtbaldy us
// 14 June 2012

// ALL UNITS ARE millimeters

// Highly aerated orchid pot: is_orchid = 1
// Vanilla flower pot: is_orchid = 0
is_orchid = 1;

// Height of the flower pot
height = 130;

// Thickness of the flower pot's side
thickness = 2;

// Pot's top diameter
top_diameter = 125;

// Pot's base diameter
base_diameter = 95;

// Number of columns of holes/slots around the side of the pot
slot_columns = 8;

// Number of rows of holes/slots around the side of the pot
slot_rows = 3;

// The slots can be made slightly taller by changing slot_height_adjust from 2 to 1
slot_height_adjust = 2;

// The slots can be made wider by decreasing the integer "slot_width_adjust"
slot_width_adjust = 12;

// -- derived values henceforth

// Fraction of the pot's height to make the top rim
//frac = 1/6;

// Slot/hole dimensions
//slot_height = (1 - frac) * height / (slot_rows + slot_height_adjust);
slot_height = 1 * height / (slot_rows + slot_height_adjust);
slot_width = 3.1416 * base_diameter / (slot_columns + slot_width_adjust);

// Higher values make for more rounded cylinders and arcs
$fn = 100;

// rounded_bar()
//
// Make a bar with rounded edges running it's length (double bull nose)
// radius will be the thickness of the bar.  If height <= thickness,
// a cylinder is produced.

module rounded_bar(length, height, thickness)
{
     h = height - thickness;

     if (h > 0)
     {
          union()
          {
              translate([0, 0, h]) rotate([0, 90, 0]) cylinder(h = length, r = thickness / 2, center=true);
              translate([0, 0, h/2]) cube([length, thickness, h], center=true);
              rotate([0, 90, 0]) cylinder(h = length, r = thickness / 2, center=true);
          }
     }
     else
     {
              rotate([0, 90, 0]) cylinder(h = length, r = thickness / 2, center=true);
     }
}

module pot(orchid=1)
{
	// angle = atan2(top_diameter - base_diameter, 2 * height);
    // trim_r = base_diameter/2 + tan(angle) * ((1 - frac) * height);
    // trim_r = base_diameter/2 + (1 - frac) * height * (top_diameter - base_diameter) / (2 * height);
    //trim_r = base_diameter / 2 + (1 - frac) * (top_diameter - base_diameter) / 2;
    trim_r = base_diameter / 2 + (top_diameter - base_diameter) / 2;

	hole_r = base_diameter / 12;

	difference()
	{
        union()
        {
             // Basic pot shape
		    cylinder(h = height, r1=base_diameter/2, r2=top_diameter/2, center=false);

            // Thick rim at the top of the pot
            /*
            translate([0, 0, (1 - frac) * height]) intersection()
            {
                 cylinder(h = frac * height, r1 = trim_r + thickness, r2 = thickness + top_diameter/2, center=false);
                 // Bevel the bottom edge to remove the sharp, unprintable overhang
                 cylinder(h = trim_r + thickness, r1 = trim_r, r2 = frac * height + trim_r + thickness, center=false);
            }
            */
         }

         // Carve out the inside of the pot
		translate([0, 0, thickness]) cylinder(h = height, r1=base_diameter/2 - thickness, r2=top_diameter/2 - thickness, center=false);


        // Bottom drainage holes
		for (i = [0 : 4])
        {
            rotate([0, 0, i * (360 / 5)])
                translate([base_diameter/4, 0, 0])
                    cylinder(h = 3 * thickness, r = hole_r, center=true);
        }

        if (orchid != 0)
        {
            for (i = [ 0 : slot_rows - 1 ])
            {
                for (j = [ 0 : slot_columns - 1 ])
                {
                     rotate([0, 0, i * 180 / slot_columns + j * 360 / slot_columns])
                        //translate([top_diameter / 2 - thickness * 2, 0, slot_height/2 + i * (1 - frac) * height / slot_rows] )
                         translate([top_diameter / 2 - thickness * 2, 0, slot_height/2 + i * height / slot_rows] )
                             rounded_bar(top_diameter / 2, slot_height, slot_width);
                }
            }
        }
    }
}

pot(is_orchid);
