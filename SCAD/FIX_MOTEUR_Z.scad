longueur=84;
largeur=35;
trou_m3=2;
h1=5;
h2=10;
ecart=55;
r_tube=6.25;
pos_tube=15;
l_moteur=26;

module fix_moteur_z(){
	difference(){
		cube([largeur,longueur,h2]);
		translate([-5,longueur/2-largeur/2,h1]){cube([largeur+10,largeur,h2]);}

		//trous pour tubes
		translate([pos_tube,14.5,-5]){cylinder(h=20, r=r_tube, $fn=50);}
		translate([pos_tube,14.5+ecart,-5]){cylinder(h=20, r=r_tube, $fn=50);}

		//trous pour moteur
		translate([largeur/2,longueur/2,-5]){cylinder(h=20, r=l_moteur/2, $fn=50);}
		translate([largeur/2-l_moteur/2,longueur/2-l_moteur/2,-5]){cylinder(h=20, r=trou_m3, $fn=50);}
		translate([largeur/2+l_moteur/2,longueur/2-l_moteur/2,-5]){cylinder(h=20, r=trou_m3, $fn=50);}
		translate([largeur/2-l_moteur/2,longueur/2+l_moteur/2,-5]){cylinder(h=20, r=trou_m3, $fn=50);}
		translate([largeur/2+l_moteur/2,longueur/2+l_moteur/2,-5]){cylinder(h=20, r=trou_m3, $fn=50);}

		//trous pour serrage
		translate([pos_tube-2.5,3,-5]){cube([5,3,20]);}
		translate([pos_tube,-5,h2/2]){rotate([-90,0,0])cylinder(h=15, r=trou_m3, $fn=50);}

		translate([pos_tube-2.5,longueur-6,-5]){cube([5,3,20]);}
		translate([pos_tube,longueur+5,h2/2]){rotate([90,0,0])cylinder(h=15, r=trou_m3, $fn=50);}

		//cassage des coins
		translate([20,0,-5]){rotate([0,0,-35])cube([30,30,20]);}
		translate([20,longueur,-5]){rotate([0,0,-55])cube([30,30,20]);}

		translate([4,0,-5]){rotate([0,0,-225])cube([10,10,20]);}
		translate([4,longueur,-5]){rotate([0,0,-225])cube([10,10,20]);}

		
	}
}

fix_moteur_z();