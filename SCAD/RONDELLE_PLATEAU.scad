r_int=4;
r_ext=6;
r_m3=2;
hauteur=4; 

module rondelle_plateau(){
	difference(){
		union(){
			cylinder(h=hauteur, r=r_ext, $fn=100);
			translate([0,0,hauteur]){cylinder(h=hauteur, r=r_int, $fn=100);}
		}
		translate([0,0,-5]){cylinder(h=hauteur*2+10, r=r_m3, $fn=100);}
	}

}
rondelle_plateau();