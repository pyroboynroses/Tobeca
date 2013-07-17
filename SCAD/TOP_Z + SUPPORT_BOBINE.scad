r_tube=6.5;
r_tige_fi=5;
height=20;
ecart_tube=55;
dec_tige=2.5;
dist_bord=12.5;
height_trou=2;
l_supbob=100;
height_supbob=10;
r_trou_m3=2;
r_vide=5;

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

module support_bobine(){
difference(){
	translate([25,40,height_supbob]){rotate([0,90,0])cylinder(h = l_supbob, r = 14, $fn=100);}
	translate([25,0,20]){cube([110,80,15]);}
	translate([25,0,-15]){cube([110,80,15]);}
	translate([30,40,-1]){cylinder(h = height*2, r = r_trou_m3, $fn=100);}
	translate([90,40,-1]){cylinder(h = height*2, r = r_trou_m3, $fn=100);}
	translate([120,40,-1]){cylinder(h = height*2, r = r_trou_m3, $fn=100);}
	//vide1
	translate([40,40,-1]){cylinder(h = height*2, r = r_vide, $fn=100);}
	translate([80,40,-1]){cylinder(h = height*2, r = r_vide, $fn=100);}
	translate([40,35,-1]){cube([40,10,height*2]);}
	//vide2
	translate([100,40,-1]){cylinder(h = height*2, r = r_vide, $fn=100);}
	translate([110,40,-1]){cylinder(h = height*2, r = r_vide, $fn=100);}
	translate([100,35,-1]){cube([10,10,height*2]);}
}
}
base_piece();
//support_bobine(); //à activer en fonction du besoin de la pièce