/* Copyright (C) Peter Ivanov <ivanovp@gmail.com>, 2015 */
/* License: Creative Commons - Attribution - Non-commercial (CC BY-NC) /

/* [Global] */
motor_width = 42.2; // 42.4-gyel kicsit latya lett
wall_thickness = 2;
outer_width = motor_width + wall_thickness * 2;
base_height = wall_thickness;
height = base_height + 10; // + 10 pont jo
epsilon = 0.1;
cable_width = 16.5;
cable_length = 22;
r = 5;
protector_width = cable_width + wall_thickness * 2;
protector_length = cable_length + wall_thickness * 2 + r;
drill_diameter = 2.2;

$fn = 60;

difference()
{
    union()
    {
        rounded_cube(outer_width, outer_width, height, r + wall_thickness / 2);
        translate([outer_width / 2 - protector_width / 2, -protector_length + r, 0])
        {
            cube([protector_width, protector_length, height]);
            //rounded_cube(protector_width, protector_length, height, r + wall_thickness / 2);
        }
    }
    translate([wall_thickness, wall_thickness, base_height])
    {
        rounded_cube(motor_width, motor_width, height - base_height + epsilon, r);
    }
    translate([outer_width / 2 - cable_width / 2, -cable_length - wall_thickness, 0])
    {
        cube([cable_width, cable_length + wall_thickness * 2, height + epsilon]);
    }
    hull()
    {
        translate([0, -cable_length / 2 - wall_thickness * 1.5, height / 2]) 
        {
            rotate([0, 90, 0]) cylinder(d=drill_diameter, h=outer_width);
        }
        translate([0, -cable_length / 2 - wall_thickness * 3.5, height / 2]) 
        {
            rotate([0, 90, 0]) cylinder(d=drill_diameter, h=outer_width);
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
