r_tube=6.5;
r_tige_fi=5;
height=30;
ecart_tube=55;
dec_tige=2.5;
dist_bord=12.5;
height_trou=5;

module base_piece(){
difference(){
	cube([25,80,height]);
	translate([dist_bord,dist_bord,height_trou]){cylinder(h = height, r = r_tube, $fn=50);}
	translate([dist_bord,dist_bord+ecart_tube,height_trou]){cylinder(h = height, r = r_tube, $fn=50);}
	translate([dist_bord-dec_tige,dist_bord+ecart_tube/2,height_trou]){cylinder(h = height, r = r_tige_fi, $fn=50);}
	translate([14.5,0,0]){rotate([0,0,-45])cube([15,15,height]);}
	translate([14.5,80,0]){rotate([0,0,-45])cube([15,15,height]);}
}
}
base_piece();