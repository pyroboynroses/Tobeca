ep=2;
r_douille=9.7; //8.3 pour LM8UU et 9.7 pour LM10UU
largeur=22; //18 pour LM8UU et 22 pour LM10UU
h1=15;
h2=19;
l_fixe=29; //25 pour LM8UU et 29 pour LM10UU
trou_m3=2;
ecrou_m3=3.3;
pass_collier=4;
ep_collier=1;
entraxe=145;

module support_douille_fixe(){
	difference(){
		cube([l_fixe,largeur,h1]);

		//trou pour douille
		translate([-5,largeur/2,h2]){rotate([0,90,0])cylinder(h=l_fixe+10, r=r_douille, $fn=100);}

		//trous pour écrou de fixation
		translate([l_fixe/2,largeur/2,-5]){cylinder(h=h2+10, r=trou_m3, $fn=50);}
		translate([l_fixe/2,largeur/2,4]){cylinder(h=h2+10, r=ecrou_m3, $fn=6);}

		//creux pour passage collier
		translate([3,-2,-5]){cube([pass_collier,ep_collier+2,h2+10]);}
		translate([l_fixe-3-pass_collier,-2,-5]){cube([pass_collier,ep_collier+2,h2+10]);}
		translate([3,largeur-ep_collier,-5]){cube([pass_collier,ep_collier+2,h2+10]);}
		translate([l_fixe-3-pass_collier,largeur-ep_collier,-5]){cube([pass_collier,ep_collier+2,h2+10]);}
		translate([3,-5,-2]){cube([pass_collier,largeur+10,pass_collier+2]);}
		translate([l_fixe-3-pass_collier,-5,-2]){cube([pass_collier,largeur+10,pass_collier+2]);}
		
	}
}

module lamelle_assemblage(){
	difference(){
		cube([entraxe-l_fixe/2-l_fixe/2,largeur,ep]);
		hull(){
			translate([10,largeur/2,-5]){cylinder(h=h2, r=4, $fn=50);}
			translate([(entraxe-l_fixe/2-l_fixe/2)-10,largeur/2,-5]){cylinder(h=h2, r=4, $fn=50);}
		}
	}
}

support_douille_fixe();
//translate([l_fixe,0,0]){lamelle_assemblage();}
//translate([l_fixe/2+entraxe-l_fixe/2,0,0]){support_douille_fixe();;}