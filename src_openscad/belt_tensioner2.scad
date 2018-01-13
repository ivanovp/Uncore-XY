include <Chamfers-for-OpenSCAD/Chamfer.scad>;

length = 22;
width = 15;
height = 22;
cutoff_height = 16;
cutoff_space = 16;
cutoff_pos = 5;
cutoff_pos2 = 11;
epsilon = 0.1;
fn = 32;
drill_diameter = 4.2;
delta = 3;

difference()
{
//    cube([length, width, height], center = false);
    chamferCube(length, width, height, 0.8);
    translate([-epsilon / 2, -epsilon / 2, 0]) cube([cutoff_space, width + epsilon, cutoff_height + epsilon], center = false);
    
    translate([-epsilon / 2, width / 2 - delta, cutoff_pos]) rotate([0, 90, 0]) cylinder(d=drill_diameter,h=length + epsilon, $fn=fn);
    translate([-epsilon / 2, width / 2 - drill_diameter / 2 - delta, cutoff_pos2]) rotate([0, 90, 0]) cube([cutoff_pos2 - cutoff_pos + epsilon, drill_diameter, height + epsilon], center = false);
    translate([-epsilon / 2, width / 2- delta, cutoff_pos2]) rotate([0, 90, 0]) cylinder(d=drill_diameter,h=length + epsilon, $fn=fn);
    
    translate([cutoff_pos, width / 2 + delta, 0]) cylinder(d=drill_diameter,h=height + epsilon, $fn=fn);
    translate([cutoff_pos, width / 2 - drill_diameter / 2 + delta, 0]) cube([cutoff_pos2 - cutoff_pos + epsilon, drill_diameter, height + epsilon], center = false);
    translate([cutoff_pos2, width / 2 + delta, 0]) cylinder(d=drill_diameter,h=height + epsilon, $fn=fn);
}