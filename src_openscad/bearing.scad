/* Copyright (C) Peter Ivanov <ivanovp@gmail.com>, 2015 */
/* License: Creative Commons - Attribution - Non-commercial (CC BY-NC) /

// 16005 bearing, h = 8 mm, d = 25 mm, D = 47 mm
// 16003 bearing, h = 8 mm, d = 17 mm, D = 35 mm
/* [Global] */
inner_diameter = 35.1;
inner_diameter2 = 32;
wall_thickness = 4;
outer_diameter = inner_diameter + wall_thickness * 2;
base_width = outer_diameter + 5;
base_height = wall_thickness;
height = base_height + 8;
drill_diameter = 4;
drill_distance = inner_diameter;

$fn = 60;

union()
{
    difference()
    {
        union()
        {
            difference()
            {
                cylinder(d=outer_diameter, h=height);
                cylinder(d=inner_diameter, h=height);
            }
            translate([-base_width / 2, -base_width / 2, 0])
            {
                rounded_cube(base_width, base_width, base_height, 5);
            }
        }
        cylinder(d=inner_diameter2, h=height);
        translate([-drill_distance / 2, drill_distance / 2, 0]) 
        {
            cylinder(d=drill_diameter, h=base_height);
        }
        translate([-drill_distance / 2, -drill_distance / 2, 0]) 
        {
            cylinder(d=drill_diameter, h=base_height);
        }
        translate([drill_distance / 2, -drill_distance / 2, 0]) 
        {
            cylinder(d=drill_diameter, h=base_height);
        }
        translate([drill_distance / 2, drill_distance / 2, 0]) 
        {
            cylinder(d=drill_diameter, h=base_height);
        }
    }
}

module rounded_cube(w, l, h, r)
{
    hull()
    {
     translate([0 + r, 0 + r, 0]) cylinder(r=r, h=h);
     translate([w - r, 0 + r, 0]) cylinder(r=r, h=h);
     translate([w - r, l - r, 0]) cylinder(r=r, h=h);
     translate([0 + r, l - r, 0]) cylinder(r=r, h=h);
    }
}

module hexagon(width, height, baseAngle) 
{
  bwidth = width / 1.75;
  for (angle = [baseAngle, baseAngle + 60, baseAngle + 120]) 
  {
      rotate([0, 0, angle]) cube([bwidth, width, height], true);
  }
}
