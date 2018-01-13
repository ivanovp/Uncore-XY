// Power supply's feet
// Tapegyseg laba
$fn = 30;
height = 12;
sink = 7;

difference()
{
    cylinder(h = height, r1 = 10, r2 = 7, center = false);
    cylinder(h = height, r = 2, center = false);
    translate([0, 0, height - sink])
    {
        cylinder(h = sink, r = 4, center = false);
    }
}
