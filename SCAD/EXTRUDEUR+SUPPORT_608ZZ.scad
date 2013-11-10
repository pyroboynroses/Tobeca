largeur=30;
longueur=70;
r_m8=4.1;
r_m3=2;
ecrou_m3=3.3;
ep=10;
dec_trou_serrage=2;
r_trou_filament=2.5;

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
			translate([0,0,ep]){cube([5,largeur,4]);}

		}
		//extrusion pour 608ZZ
		translate([8,11,-5]){cube([24,8,ep+10]);}
		//passage tige M8
		translate([20,-5,ep-2]){rotate([-90,0,0])cylinder(r=r_m8, h=largeur+10, $fn=50);}
		//trou charnière
		translate([26+12,8-5,ep/2]){rotate([-90,0,0])cylinder(r=r_m3, h=largeur+10, $fn=50);}

		//trou pour vis de serrage
		translate([5,largeur/2+dec_trou_serrage,-5]){cylinder(r=r_m3, h=ep+15, $fn=50);}
		translate([5,largeur/2+dec_trou_serrage,-5]){rotate([0,0,30])cylinder(r=ecrou_m3, h=5+7, $fn=6);}
	}
}

module trous_moteur(){
		cylinder(r=r_m3, h=largeur+10, $fn=50);
		translate([31,0,0]){cylinder(r=r_m3, h=largeur+10, $fn=50);}
}

module flanc_charniere(){
	difference(){
		cube([19,11,7]);
		
		translate([11,6,-5]){cylinder(r=r_m3, h=15, $fn=50);}
	}

}

module extrudeur(){
	difference(){
		union(){
			//partie à fixer sur plaque
			cube([longueur,10,largeur]);

			//partie générale
			translate([30,10,0]){cube([25,44,largeur]);}
			

			//débord pour fixation moteur
			translate([55,20,0]){cube([8,12.8,largeur]);}
			translate([55+8,20+12.8/2,0]){cylinder(r=12.8/2, h=largeur, $fn=50);}
		}
		//extrusions dans partie à fixer sur plaque
		translate([15,-5,-5]){cube([10,5+3,largeur+10]);}
		translate([45,-5,-5]){cube([10,5+3,largeur+10]);}
		translate([5,-5,largeur/2]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}
		translate([longueur-5,-5,largeur/2]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}
		translate([5,10-2.5,largeur/2]){rotate([-90,0,0])cylinder(r=ecrou_m3, h=10, $fn=6);}
		translate([longueur-5,10-2.5,largeur/2]){rotate([-90,0,0])cylinder(r=ecrou_m3, h=10, $fn=6);}

		//placement de trous pour fixation du moteur
		translate([40.5,48.5,-5]){rotate([0,0,-45])trous_moteur();}

		//trou général pour passage du filament
		translate([longueur/2,-5,largeur/2]){rotate([-90,0,0])cylinder(r=r_trou_filament, h=25, $fn=50);}
		translate([longueur/2,25,largeur/2]){rotate([-90,0,0])cylinder(r=r_trou_filament+0.5, h=100, $fn=50);}

		//trou central
		translate([40,27,-5]){cylinder(r=12, h=largeur+10, $fn=50);}
		translate([20,27-12,-5]){cube([20,12*2,largeur+10]);}

		hull(){
			translate([25,54-9,largeur/2-dec_trou_serrage]){rotate([0,90,0])cylinder(r=r_m3, h=100, $fn=50);}
			translate([25,54-12,largeur/2-dec_trou_serrage]){rotate([0,90,0])cylinder(r=r_m3, h=100, $fn=50);}
		}

		hull(){
			//extrusion pour charnière
			translate([24,10,-5]){cylinder(r=5, h=largeur+10, $fn=50);}
			translate([25,10,-5]){cylinder(r=5, h=largeur+10, $fn=50);}
			translate([21,13,-5]){cylinder(r=5, h=largeur+10, $fn=50);}
		}
	}
	//ajout des flancs pour la charnière
	translate([15,4,0]){flanc_charniere();}
	translate([15,4,largeur-7]){flanc_charniere();}
}

extrudeur();

translate([120,0,0]){rotate([0,0,90])support_608zz();}