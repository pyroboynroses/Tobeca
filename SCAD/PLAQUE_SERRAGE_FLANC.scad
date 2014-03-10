r_m3=2;
r_tete=3.5;
r_trou=1.5;
ep=4;
r_ext=5;
ecart=55;
esp_fix=8;
r_rondelle=4;

module plaque_flanc(){
	difference(){
		hull(){
		//base de la pièce
		cylinder(h=ep, r=r_ext, $fn=50);
		translate([ecart,0,0]){cylinder(h=ep, r=r_ext, $fn=50);}
		}

		//trous pour passer les molettes
		translate([0,0,-5]){cylinder(h=20, r=r_m3, $fn=50);}
		translate([ecart,0,-5]){cylinder(h=20, r=r_m3, $fn=50);}

		//encastrement rondelles d'usure
		translate([0,0,ep-0.75]){cylinder(h=5, r=r_rondelle, $fn=50);}
		translate([ecart,0,ep-0.75]){cylinder(h=5, r=r_rondelle, $fn=50);}

		//trous de vissage
		translate([esp_fix,0,-5]){cylinder(h = 20, r = r_trou, $fn=50);}
		translate([esp_fix,0,ep-2]){cylinder(h = 2, r1 = r_trou, r2=r_tete, $fn=50);}

		translate([ecart-esp_fix,0,-5]){cylinder(h = 20, r = r_trou, $fn=50);}
		translate([ecart-esp_fix,0,ep-2]){cylinder(h = 2, r1 = r_trou, r2=r_tete, $fn=50);}
		
	}

}

plaque_flanc();