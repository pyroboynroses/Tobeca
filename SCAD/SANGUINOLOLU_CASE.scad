longueur=125; //115 pour v1
largeur=95; //86 pour v1
hauteur=45;
epaisseur_mur=2;
epaisseur_fond=2;
ep_fan=11;
ecart_x_trou=94;
ecart_y_trou=43;
r_trou_m3=2;
r_ecrou_m3=3.3;
ep_ecrou_m3=1;
dim_fan=40;
entraxe_fan=32;
r_trou_fan=19;
r_tete=3;


module sanguinololu(){
	difference(){
		cube([longueur,largeur,hauteur]);

		translate([epaisseur_mur,epaisseur_mur,epaisseur_fond]){cube([longueur-epaisseur_mur*2,largeur-epaisseur_mur*2,hauteur*2]);}

		//trous de vissage
		translate([(longueur-ecart_x_trou)/2,(largeur-ecart_y_trou)/2,-5]){cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([(longueur-ecart_x_trou)/2,(largeur-ecart_y_trou)/2+ecart_y_trou,-5]){cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([(longueur-ecart_x_trou)/2+ecart_x_trou,(largeur-ecart_y_trou)/2,-5]){cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([(longueur-ecart_x_trou)/2+ecart_x_trou,(largeur-ecart_y_trou)/2+ecart_y_trou,-5]){cylinder(h = 10, r = r_trou_m3, $fn=50);}
		
		//empreintes pour écrous de vissage
		translate([(longueur-ecart_x_trou)/2,(largeur-ecart_y_trou)/2,epaisseur_fond-ep_ecrou_m3]){cylinder(h = 10, r = r_ecrou_m3, $fn=6);}
		translate([(longueur-ecart_x_trou)/2,(largeur-ecart_y_trou)/2+ecart_y_trou,epaisseur_fond-ep_ecrou_m3]){cylinder(h = 10, r = r_ecrou_m3, $fn=6);}
		translate([(longueur-ecart_x_trou)/2+ecart_x_trou,(largeur-ecart_y_trou)/2,epaisseur_fond-ep_ecrou_m3]){cylinder(h = 10, r = r_ecrou_m3, $fn=6);}
		translate([(longueur-ecart_x_trou)/2+ecart_x_trou,(largeur-ecart_y_trou)/2+ecart_y_trou,epaisseur_fond-ep_ecrou_m3]){cylinder(h = 10, r = r_ecrou_m3, $fn=6);}

		//trous pour ventilateur
		translate([-5,largeur/2-entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2]){rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([epaisseur_mur/2,largeur/2-entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2]){rotate([0,90,0])cylinder(h = epaisseur_mur/2, r1 = r_trou_m3, r2=r_tete, $fn=50);}

		translate([-5,largeur/2+entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2]){rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([epaisseur_mur/2,largeur/2+entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2]){rotate([0,90,0])cylinder(h = epaisseur_mur/2, r1 = r_trou_m3, r2=r_tete, $fn=50);}

		translate([-5,largeur/2-entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2+entraxe_fan]){rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([epaisseur_mur/2,largeur/2-entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2+entraxe_fan]){rotate([0,90,0])cylinder(h = epaisseur_mur/2, r1 = r_trou_m3, r2=r_tete, $fn=50);}
		

		translate([-5,largeur/2+entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2+entraxe_fan]){rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([epaisseur_mur/2,largeur/2+entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2+entraxe_fan]){rotate([0,90,0])cylinder(h = epaisseur_mur/2, r1 = r_trou_m3, r2=r_tete, $fn=50);}
		
		translate([-5,largeur/2,epaisseur_fond+dim_fan/2]){rotate([0,90,0])cylinder(h = 10, r = r_trou_fan, $fn=50);}

		//extrusion pour passage câble écran LCD (option)
		translate([10,largeur-10,hauteur-11]){cube([35,20,20]);}

		//trou pour prise USB
		translate([(longueur-ecart_x_trou)/2+ecart_x_trou+5-27,largeur-10,epaisseur_fond]){cube([20,30,17]);}

		//pente pour boitier
		translate([-10,-10,hauteur]){rotate([0,7,0])cube([longueur+20,largeur+20,hauteur]);}

		//trous pour évacuation air
		for (z = [5, 10, 15, 20, 25])
		{
    		for (y = [6, 11, 16,21,26,31,36,41,46,51,56,61,66,71,76,81,86])
			{
    			translate([longueur-5, y+2, z])
    			rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);
			}
		}

		/*for (y = [6, 11, 16,21,26,31,36,41,46,51,56,61,66,71,76,81,86])
			{
    			hull(){
				translate([longueur-5, y+2, 5])
    			rotate([0,90,0])cylinder(h = 10, r = 1.5, $fn=50);

				translate([longueur-5, y+2, 25])
    			rotate([0,90,0])cylinder(h = 10, r = 1.5, $fn=50);
				}
			}*/

		//trou pour passage câbles gauche
		translate([40,largeur-5,epaisseur_fond]){cube([12,20,hauteur]);}

		//trou pour passage câbles droite
		translate([40,-5,epaisseur_fond]){cube([5,20,hauteur]);}

		//vide fond du boitier
		translate([(longueur-ecart_x_trou)/2+5,(largeur-ecart_y_trou)/2-17.5,-5]){cube([ecart_x_trou-10,ecart_y_trou+35,10]);}
		translate([5,largeur/2-15,-5]){cube([ecart_x_trou+22,30,10]);}


	}
}
sanguinololu();