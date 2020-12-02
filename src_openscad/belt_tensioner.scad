include <Chamfer.scad>;

length = 30;
width = 15;
height = 18;
bearing_height = 10.2;
bearing_space = 15;
bearing_pos = 6;
epsilon = 0.1;
fn = 32;
drill_diameter = 4.2;

difference()
{
//    cube([length, width, height], center = false);
    chamferCube(length, width, height, 0.8);
    translate([-epsilon / 2, -epsilon / 2, height / 2 - bearing_height / 2]) cube([bearing_space, width + epsilon, bearing_height + epsilon], center=false);
    translate([length - width / 2, width / 2, 0]) cylinder(d=drill_diameter,h=height + epsilon, $fn=fn);
    translate([bearing_pos, width / 2, 0]) cylinder(d=drill_diameter,h=height + epsilon, $fn=fn);
}