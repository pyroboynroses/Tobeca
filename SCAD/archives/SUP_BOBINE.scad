r_m8=4;
larg=15;
hauteur=10;
longueur=50;
ep=4;

module sup_bobine(){
	difference(){
		union(){
			cube([larg,larg,hauteur]);
			translate([larg,larg/2-ep/2,0]){cube([longueur-larg,ep,hauteur]);}
			translate([longueur,larg/2-ep/2,hauteur/2]){rotate([-90,0,0])cylinder(h = ep, r = hauteur/2, $fn=100);}
		}
		
		//trou M8
		translate([larg/2,larg/2,-5]){cylinder(h = hauteur+10, r = r_m8, $fn=100);}
	}
}

sup_bobine();