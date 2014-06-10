largeur=30;
longueur=70;
r_m8=4.1;
r_m3=2;
ecrou_m3=3.3;
ep=10;
dec_trou_serrage=4;
r_trou_filament=2;

module arrondi(RAYON,EP){
	difference(){
		cube([RAYON*2,RAYON*2,EP]);

		translate([RAYON,RAYON,-5])cylinder(r=RAYON, h=EP+10, $fn=100);

		translate([RAYON,-5,-5])cube([RAYON*2+10,RAYON*2+10,EP+10]);
		translate([-5,RAYON,-5])cube([RAYON*2+10,RAYON*2+10,EP+10]);

	}
}

module support_608zz(){
	difference(){
		union(){
			//forme générale
			cube([26,largeur,ep]);
			translate([26,0,ep/2]){rotate([-90,0,0])cylinder(r=ep/2, h=largeur, $fn=50);}

			//charnière
			translate([26,8,0]){cube([12,largeur-8*2,ep]);}
			translate([26+12,8,ep/2]){rotate([-90,0,0])cylinder(r=ep/2, h=largeur-8*2, $fn=50);}

			//butée haute
			translate([0,0,ep]){cube([5,largeur,2]);}

			translate([5,dec_trou_serrage,0]){cylinder(r=8, h=ep/2, $fn=50);}
		translate([5,largeur-dec_trou_serrage,0]){cylinder(r=8, h=ep/2, $fn=50);}

		}
		//extrusion pour 608ZZ
		translate([8,11,-5]){cube([24,8,ep+10]);}
		//passage tige M8
		translate([20,-5,ep-2]){rotate([-90,0,0])cylinder(r=r_m8, h=largeur+10, $fn=50);}
		//trou charnière
		translate([26+12,8-5,ep/2]){rotate([-90,0,0])cylinder(r=r_m3, h=largeur+10, $fn=50);}

		//trou pour vis de serrage
		translate([5,dec_trou_serrage,-5]){cylinder(r=r_m3+0.5, h=ep+15, $fn=50);}
		translate([5,largeur-dec_trou_serrage,-5]){cylinder(r=r_m3+0.5, h=ep+15, $fn=50);}
	}
}

module trous_moteur(){
		cylinder(r=r_m3+0.25, h=largeur+10, $fn=50);
		translate([0,0,0]){cylinder(r=3.5, h=8, $fn=50);}

		translate([31,0,0]){cylinder(r=r_m3+0.25, h=largeur+10, $fn=50);}
		translate([31,0,0]){cylinder(r=3.5, h=8, $fn=50);}
}

module flanc_charniere(){
	difference(){
		cube([15,11,7]);
		
		translate([11,6,-5]){cylinder(r=r_m3, h=15, $fn=50);}
		translate([11,6,5]){cylinder(r1=r_m3, r2=r_m3+1, h=2, $fn=50);}

		translate([-2,4,-5]){rotate([0,0,30])cube([19,11,15]);}
	}

}

module extrudeur(){
	difference(){
		union(){
			//partie à fixer sur plaque
			cube([longueur,10,largeur]);

			//partie générale
			translate([30,10,0]){cube([25,44,largeur]);}
			translate([27,10,0]){cube([25,20,largeur]);}
			

			//débord pour fixation moteur
			translate([55,20,0]){cube([8,12.8,largeur]);}
			translate([55+8,20+12.8/2,0]){cylinder(r=12.8/2, h=largeur, $fn=50);}
			
			//arrondis sur la pièce	
			translate([55,10,0]){arrondi(3,largeur);}
			translate([55,20,0]){rotate([0,0,270])arrondi(6,largeur);}
			translate([55,32.8,0]){arrondi(8,largeur);}
		}
		//arrondi en haut de la pièce
		translate([55.5,54.5,-5]){rotate([0,0,180])arrondi(9,largeur+10);}

		//extrusions dans partie à fixer sur plaque
		translate([15,-5,-5]){cube([10,5+3,largeur+10]);}
		translate([22,-5,-5]){cube([10,5+3,15]);}
		translate([45,-5,-5]){cube([10,5+3,largeur+10]);}
		translate([5,-5,largeur/2]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}
		translate([longueur-5,-5,largeur/2]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}
		translate([5,10-2.5,largeur/2]){rotate([-90,0,0])cylinder(r=ecrou_m3, h=10, $fn=6);}
		translate([longueur-5,10-2.5,largeur/2]){rotate([-90,0,0])cylinder(r=ecrou_m3, h=10, $fn=6);}

		//placement de trous pour fixation du moteur
		translate([39.5,48.5,-5]){rotate([0,0,-45])trous_moteur();}

		//trou général pour passage du filament
		
		translate([longueur/2,4,largeur/2]){rotate([-90,0,0])cylinder(r1=r_trou_filament,r2=r_trou_filament+1, h=22, $fn=50);}
		translate([longueur/2,25,largeur/2]){rotate([-90,0,0])cylinder(r=r_trou_filament, h=100, $fn=50);}
		

		//trou central
		translate([40,27,largeur-3]){cylinder(r=12, h=5, $fn=100);}
		translate([40,27,largeur-6]){cylinder(r1=10,r2=12, h=3, $fn=100);}
		translate([40,27,largeur-13]){cylinder(r1=6,r2=10, h=7, $fn=100);}

	hull(){
		translate([40,27,-5]){cylinder(r=6, h=largeur+10, $fn=100);}
		translate([35,27,-5]){cylinder(r=6, h=largeur+10, $fn=100);}
		}


		//translate([20,27-12,-5]){cube([20,12*2,largeur+10]);}
		translate([20,22,-5]){cube([20,10,largeur+10]);}
		translate([40-11-3,27,-5]){cylinder(r=12, h=largeur+10, $fn=200);}

		//trou passage serrage vis
		hull(){
		translate([25,54-10,dec_trou_serrage]){rotate([0,90,0])cylinder(r=r_m3, h=100, $fn=50);}	
		translate([25,54-11,dec_trou_serrage]){rotate([0,90,0])cylinder(r=r_m3, h=100, $fn=50);}
		}
		translate([50,54-10.5,dec_trou_serrage]){rotate([0,90,0])cylinder(r=ecrou_m3, h=20, $fn=6);}

		hull(){
		translate([25,54-10,largeur-dec_trou_serrage]){rotate([0,90,0])cylinder(r=r_m3, h=100, $fn=50);}
		translate([25,54-11,largeur-dec_trou_serrage]){rotate([0,90,0])cylinder(r=r_m3, h=100, $fn=50);}
		}
		translate([50,54-10.5,largeur-dec_trou_serrage]){rotate([0,90,0])cylinder(r=ecrou_m3, h=20, $fn=6);}
		

		hull(){
			//extrusion pour charnière
			translate([21,10,-5]){cylinder(r=5, h=largeur+10, $fn=50);}
			translate([22,10,-5]){cylinder(r=5, h=largeur+10, $fn=50);}
			translate([18,13,-5]){cylinder(r=5, h=largeur+10, $fn=50);}
		}

		//extrusion pour ventilation proche trou d'entrée
		translate([longueur/2+3,-5,0]){rotate([-90,0,0])cylinder(r=largeur/2-r_trou_filament-1, h=9, $fn=200);}
		translate([longueur/2,-5,largeur/2]){rotate([-90,0,0])cylinder(r=5, h=12, $fn=100);}
		translate([longueur/2,-5,largeur/2]){rotate([-90,0,0])cylinder(r=9, h=9, $fn=100);}
		
	}
	//ajout des flancs pour la charnière
	translate([12,4,0]){flanc_charniere();}
	translate([12,4,largeur-7]){flanc_charniere();}
}

extrudeur();
//translate([-20,0,largeur]){rotate([0,180,0])extrudeur();}

//translate([80,0,0]){support_608zz();}
//support_608zz();