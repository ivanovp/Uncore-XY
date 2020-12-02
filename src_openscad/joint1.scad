/* Copyright (C) Peter Ivanov <ivanovp@gmail.com>, 2015 */
/* License: Creative Commons - Attribution - Non-commercial (CC BY-NC) /

// 16005 bearing, h = 8 mm, d = 25 mm, D = 47 mm
// 16003 bearing, h = 8 mm, d = 17 mm, D = 35 mm
/* [Global] */
inner_diameter = 17.5;
inner_diameter2 = 16.5;
wall_thickness = 2;
outer_diameter = inner_diameter + wall_thickness * 2;
base_width = outer_diameter + 5;
height = 30;
drill_diameter = 3.2;
epsilon = 0.1;

$fn = 60;

intersection()
{
    difference()
    {
        translate([0, 0, inner_diameter - height]) cylinder(d=outer_diameter, h=height);
        cylinder(d=inner_diameter, h=height);
        translate([0, 0, -height + epsilon / 2]) cylinder(d=inner_diameter2, h=height);
        translate([0, 0, inner_diameter - drill_diameter / 2 - wall_thickness]) rotate([0, 90, 0]) cylinder(d=drill_diameter, h=outer_diameter + epsilon, center=true);
        //rotate([0, 0, 90]) translate([0, 0, height]) rotate([90, 0, 0]) cylinder(d=inner_diameter * 0.75, h=inner_diameter, center=true);
    }
    translate([0, 0, -outer_diameter / 2]) rotate([45, 0, 0]) translate([0, -outer_diameter, outer_diameter]) rotate([0, 90, 0]) rounded_cube(outer_diameter * 2, outer_diameter * 2, outer_diameter, drill_diameter * 2);
}

module rounded_cube(w, l, h, r)
{
    hull()
    {
     translate([0 + r, 0 + r, 0]) cylinder(r=r, h=h, center=true);
     translate([w - r, 0 + r, 0]) cylinder(r=r, h=h, center=true);
     translate([w - r, l - r, 0]) cylinder(r=r, h=h, center=true);
     translate([0 + r, l - r, 0]) cylinder(r=r, h=h, center=true);
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
