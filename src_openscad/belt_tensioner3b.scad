include <Chamfers-for-OpenSCAD/Chamfer.scad>;

length = 22;
width = 15;
height = 16;
bearing_height = 10.2;
bearing_space = 15;
bearing_pos = 6;
epsilon = 0.1;
fn = 32;
drill_diameter1 = 4.3; // for M4
drill_diameter2 = 3.6; // for M4
// M3 = 5.5 mm, M4 = 7 mm, M5 = 8 mm, M6 = 10 mm
nut_size = 7; // [5:0.1:20]
// M3 = 3 mm, M6 = 6 mm, and so on...
nut_diameter = 4; // [3:0.1:20]
// M3 = 2.6 mm, M4 = 3.44 mm, M5 = 4.24 mm, M6 = 5.24 mm
nut_height = 3.5; // [2:0.1:15]

difference()
{
//    cube([length, width, height], center = false);
    chamferCube(length, width, height, 0.8);
    translate([-epsilon / 2, -epsilon / 2, height / 2 - bearing_height / 2]) cube([bearing_space, width + epsilon, bearing_height + epsilon], center=false);
//    translate([length - width / 2, width / 2, 0]) cylinder(d=drill_diameter,h=height + epsilon, $fn=fn);
    translate([bearing_pos, width / 2, 0]) cylinder(d=drill_diameter1,h=height / 2, $fn=fn);
    translate([bearing_pos, width / 2, height / 2]) cylinder(d=drill_diameter2,h=height / 2 + epsilon, $fn=fn);
    translate([0, width / 2, height / 2]) rotate([0, 90, 0]) cylinder(d=drill_diameter1,h=length + epsilon, $fn=fn);
    translate([bearing_space + nut_height / 2 - epsilon, width / 2, height / 2]) rotate([0, 90, 0]) hexagon(nut_size, nut_height, 90);
}

module hexagon(width, height, baseAngle) 
{
  bwidth = width / 1.75;
  for (angle = [baseAngle, baseAngle + 60, baseAngle + 120]) 
  {
      rotate([0, 0, angle]) cube([bwidth, width, height], true);
  }
}