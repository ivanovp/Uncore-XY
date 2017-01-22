$fn=30;


//front
difference() {
  union() {
linear_extrude(height=1.6) rotate([0,180,0]) import("smart_controller.dxf", layer=1);
translate([0,0,1.6]) linear_extrude(height=11.5) rotate([0,180,0]) import("smart_controller.dxf", layer=2);
translate([0,0,1.6]) linear_extrude(height=6.5) rotate([0,180,0]) import("smart_controller.dxf", layer=3);
translate([0,0,1.6]) linear_extrude(height=1.2) rotate([0,180,0]) import("smart_controller.dxf", layer=4);
  }
  translate([0,0,9.5]) linear_extrude(height=3.7) rotate([0,180,0]) import("smart_controller.dxf", layer=5);
}

//rear
linear_extrude(height=1.6) import("smart_controller.dxf", layer=6);
translate([0,0,1.6]) linear_extrude(height=3.4)import("smart_controller.dxf", layer=3);


//prusai2 support
difference(){
  linear_extrude(height=15) import("smart_controller.dxf", layer=7);
translate([170,0,181.75]) rotate([0,90,0])  linear_extrude(height=15) import("smart_controller.dxf", layer=8);
}