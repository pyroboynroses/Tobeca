hauteur=20;
entraxe=55;
r_tube=6.25;
r_m3=2;
ecrou_m3=3.3;
r_m8=4;
ep=4;
ep2=3;
ep_milieu=5;
l_separation=25;
dec_tige=2.5;


module top_z(){
	difference(){
		union(){
			cylinder(h = hauteur, r = r_tube+ep/2, $fn=100);
			translate([0,entraxe,0]){cylinder(h = hauteur, r = r_tube+ep/2, $fn=100);}
			translate([-ep_milieu,0,0]){cube([ep_milieu,50,hauteur]);}
			translate([1,r_tube,0]){cube([ep2,10,hauteur]);}
			translate([1,entraxe-r_tube-10,0]){cube([ep2,10,hauteur]);}
			translate([0,r_tube+13,0]){cube([8,16.5,hauteur]);}

		}
		//trou pour tubes
		translate([0,0,-5]){cylinder(h = hauteur+10, r = r_tube, $fn=100);}
		translate([0,entraxe,-5]){cylinder(h = hauteur+10, r = r_tube, $fn=100);}

		//fentes pour serrage
		translate([0,0,-5]){cube([1,10,hauteur+10]);}
		translate([0,entraxe-r_tube-5,-5]){cube([1,10,hauteur+10]);}

		//trous pour serrage avec vis M3
		translate([-10,r_tube+ep/2+2,hauteur/2]){rotate([0,90,0])cylinder(h = 30, r = r_m3, $fn=100);}
		translate([-10,r_tube+ep/2+2,hauteur/2]){rotate([0,90,0])cylinder(h = 7.5, r = ecrou_m3, $fn=6);}
		translate([-10,entraxe-r_tube-ep/2-2,hauteur/2]){rotate([0,90,0])cylinder(h = 30, r = r_m3, $fn=100);}
		translate([-10,entraxe-r_tube-ep/2-2,hauteur/2]){rotate([0,90,0])cylinder(h = 7.5, r = ecrou_m3, $fn=6);}

		//trou pour M8 central
		translate([-10,entraxe/2,hauteur-6]){rotate([0,90,0])cylinder(h = 30, r = r_m8, $fn=100);}
		//trou pour tige filetée Z
		translate([dec_tige,entraxe/2,-10]){cylinder(h = 10+9, r = r_m8+0.25, $fn=100);}
		


	}
}

module surplus_epaisseur(){
	difference(){
		translate([0,entraxe/2-l_separation/2+1,0]){cube([ep,l_separation-2,hauteur]);}	
		translate([-10,entraxe/2,hauteur/2]){rotate([0,90,0])cylinder(h = 30, r = r_m8, $fn=100);}
	}
}

top_z();
//surplus_epaisseur();