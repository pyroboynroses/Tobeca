longueur=84;
largeur=35;
trou_m3=2;
h1=1.5;
h2=4;
ecart=55;
r_tube=6.25;
pos_tube=15;
r_ecrou_m3=3.4;

module base_z(){
	difference(){
		cube([largeur,longueur,h2]);
		translate([-5,longueur/2-largeur/2,h1]){cube([largeur+10,largeur,h2]);}
		translate([-5,longueur/2-largeur/2,-5]){cube([20,largeur,20]);}

		//trous pour tubes
		translate([pos_tube,14.5,-5]){cylinder(h=20, r=r_tube, $fn=50);}
		translate([pos_tube,14.5+ecart,-5]){cylinder(h=20, r=r_tube, $fn=50);}

		//trous pour vissage
		hull(){
		translate([pos_tube-10,14.5-2,-5]){cylinder(h=20, r=trou_m3, $fn=50);}
		translate([pos_tube-10,14.5+2,-5]){cylinder(h=20, r=trou_m3, $fn=50);}
		}

		//empreinte écrous de serrage
		hull(){
		translate([pos_tube-10,14.5-2,h1]){rotate([0,0,30])cylinder(h=20, r=r_ecrou_m3, $fn=6);}
		translate([pos_tube-10,14.5+2,h1]){rotate([0,0,30])cylinder(h=20, r=r_ecrou_m3, $fn=6);}
		}

		hull(){
		translate([pos_tube-10,14.5+ecart-2,-5]){cylinder(h=20, r=trou_m3, $fn=50);}
		translate([pos_tube-10,14.5+ecart+2,-5]){cylinder(h=20, r=trou_m3, $fn=50);}
		}

		//empreinte écrous de serrage
		hull(){
		translate([pos_tube-10,14.5+ecart-2,h1]){rotate([0,0,30])cylinder(h=20, r=r_ecrou_m3, $fn=6);}
		translate([pos_tube-10,14.5+ecart+2,h1]){rotate([0,0,30])cylinder(h=20, r=r_ecrou_m3, $fn=6);}
		}

		//cassage des coins
		translate([20,0,-5]){rotate([0,0,-35])cube([30,30,20]);}
		translate([20,longueur,-5]){rotate([0,0,-55])cube([30,30,20]);}
	}
}

base_z();