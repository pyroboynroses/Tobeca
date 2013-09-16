longueur=30;
hauteur=15;
ep=3;
r_m3=2;
r_gaine=4;

module clip_plateau(){
	difference(){
		union(){
			cube([ep,longueur,hauteur]);
			translate([ep/2,longueur/2,0]){cylinder(h = hauteur, r = r_gaine+ep, $fn=50);}
		}
		translate([ep/2,longueur/2,-5]){cylinder(h = hauteur+10, r = r_gaine, $fn=50);}
		translate([ep,-5,-5]){cube([10,longueur+10,hauteur+10]);}
		translate([ep-2,longueur/2-r_gaine,-5]){cube([10,5,hauteur+10]);}
		translate([ep-2,longueur/2+r_gaine-5,-5]){cube([10,5,hauteur+10]);}

		//trous M3
		translate([-5,5,hauteur/2]){rotate([0,90,0])cylinder(h = 10, r = r_m3, $fn=50);}
		translate([-5,longueur-5,hauteur/2]){rotate([0,90,0])cylinder(h = 10, r = r_m3, $fn=50);}

	}
}
clip_plateau();