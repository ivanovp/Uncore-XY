/* Copyright (C) Peter Ivanov <ivanovp@gmail.com>, 2020 */
/* License: Creative Commons - Attribution - Non-commercial (CC BY-NC) /

/* [Global] */
width = 14; 
length = 40;
height = 14;
epsilon = 0.1;
r = 2;
drill_diameter = 4.5;
drill_distance = 26;
cutout_height = 11;
cutout_length = 27.5;

$fn = 60;

difference()
{
    rounded_cube(width, length, height, r);
    hull()
    {
        translate([width / 2, length / 2 - drill_distance / 2, -epsilon / 2])  cylinder(d=drill_diameter, h=height + epsilon);
        translate([width / 2, length / 2 - drill_distance / 2 + drill_diameter, -epsilon / 2]) cylinder(d=drill_diameter, h=height + epsilon);
    }
    translate([width / 2, length / 2 + drill_distance / 2, -epsilon / 2])
    {
        cylinder(d=drill_diameter, h=height + epsilon);
    }
    translate([-epsilon / 2, 0, height - cutout_height]) cube([width + epsilon, cutout_length, cutout_height + epsilon]);
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
