trou_m3=2;
h1=2;
h2=5;
ecart=55;
r_tube=6.25;
pos_tube=15;

module base_z(){
	difference(){
		cube([pos_tube+r_tube+5,ecart+r_tube*2+10,h2]);
		translate([-5,5+r_tube*2+3,h1]){cube([pos_tube+r_tube+5+10,ecart-r_tube*2-6,h2]);}
		translate([-5,5+r_tube*2+3,-5]){cube([20,ecart-r_tube*2-6,20]);}

		//trous pour tubes
		translate([pos_tube,5+r_tube,-5]){cylinder(h=20, r=r_tube, $fn=50);}
		translate([pos_tube,5+r_tube+ecart,-5]){cylinder(h=20, r=r_tube, $fn=50);}

		//trous pour vissage
		translate([pos_tube-10,5+r_tube,-5]){cylinder(h=20, r=trou_m3, $fn=50);}
		translate([pos_tube-10,5+r_tube+ecart,-5]){cylinder(h=20, r=trou_m3, $fn=50);}
		translate([pos_tube+5,(ecart+r_tube*2+10)/2,-5]){cylinder(h=20, r=trou_m3, $fn=50);}
	}
}

base_z();