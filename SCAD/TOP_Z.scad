hauteur=20;
entraxe=55;
r_tube=6.25;
r_m3=2;
ecrou_m3=3.3;
r_m8=4;
r_m5=2.75;
ep=4;
ep2=3;
ep_milieu=5;
l_separation=25;
dec_tige=2.5;
ep_entretoise=4;


module top_z(){
	difference(){
		union(){
			
			cylinder(h = hauteur-2, r = r_tube+ep/2, $fn=100);
			translate([0,0,hauteur-2]){cylinder(h = 2, r1=r_tube+ep/2 ,r2 = r_tube+ep/2-2, $fn=100);}

			translate([0,entraxe,0]){cylinder(h = hauteur-2, r = r_tube+ep/2, $fn=100);}
			translate([0,entraxe,hauteur-2]){cylinder(h = 2, r1 = r_tube+ep/2,r2 = r_tube+ep/2-2, $fn=100);}

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
		translate([dec_tige,entraxe/2,-10]){cylinder(h = 10+9, r = r_m5, $fn=100);}
		


	}
}

module surplus_epaisseur(){
	difference(){
		translate([0,entraxe/2-l_separation/2+1,0]){cube([ep,l_separation-2,hauteur]);}	
		translate([-10,entraxe/2,hauteur/2]){rotate([0,90,0])cylinder(h = 30, r = r_m8, $fn=100);}
	}
}

module cache_tube(){
	cylinder(h = 1, r = r_tube+0.0005, $fn=50);	
	translate([0,0,-3]){cylinder(h = 3, r = 4, $fn=50);}
}

module entretoise_m8(){
	difference(){
		union(){
			cylinder(h = ep_entretoise, r = r_m8+2, $fn=50);
			translate([0,-r_m8-2,0]){cube([6,(r_m8+2)*2,ep_entretoise]);}
		}
	translate([0,0,-5]){cylinder(h = 10, r = r_m8, $fn=50);}
	}
}

module ensemble(){

//
top_z();
translate([0,0,hauteur-1]){cache_tube();}	
translate([0,entraxe,hauteur-1]){cache_tube();}	

translate([-5,entraxe/2,hauteur-6]){rotate([0,-90,0])entretoise_m8();}	
}
rotate([0,180,0])ensemble();