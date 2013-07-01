r_tube=6.5;
r_tige_fi=5;
height=30;
l_supbob=100;
height_supbob=10;
r_trou_m3=2;
r_vide=5;

include <TOP_Z.scad>;
module support_bobine(){
difference(){
	translate([25,40,height_supbob]){rotate([0,90,0])cylinder(h = l_supbob, r = 14, $fn=100);}
	translate([25,0,20]){cube([110,80,15]);}
	translate([25,0,-15]){cube([110,80,15]);}
	translate([30,40,-1]){cylinder(h = height, r = r_trou_m3, $fn=100);}
	translate([90,40,-1]){cylinder(h = height, r = r_trou_m3, $fn=100);}
	translate([120,40,-1]){cylinder(h = height, r = r_trou_m3, $fn=100);}
	//vide1
	translate([40,40,-1]){cylinder(h = height, r = r_vide, $fn=100);}
	translate([80,40,-1]){cylinder(h = height, r = r_vide, $fn=100);}
	translate([40,35,-1]){cube([40,10,height]);}
	//vide2
	translate([100,40,-1]){cylinder(h = height, r = r_vide, $fn=100);}
	translate([110,40,-1]){cylinder(h = height, r = r_vide, $fn=100);}
	translate([100,35,-1]){cube([10,10,height]);}
}
}
base_piece(); //module déclaré dans TOP_Z.scad
support_bobine();