largeur=75;
longueur=28;
r_tube=6;
r_ext=10;
r_tube_l=7;
contact_tube=3;
r_m3=2;
r_ecrou_m3=3.3;
r_arbre=4;
prof_arbre=25;
r_ecrou_m8=7.7;
r_m8=4.5;
h_ecrou_m8=8;
height1=35;
height2=19;
ep_trou_m8=2;
entraxe_tubes=55;
l_pass_tige_filetee=35;
l_lameflex=1;

module passage_tube(){
	difference(){
		union(){
			cylinder(r=r_ext, h=height1, $fn=50);
			translate([0,-r_ext,0]){cube([r_ext,2*r_ext,height1]);}
		}
		translate([0,0,-5]){cylinder(r=r_tube, h=height1+10, $fn=50);}
		translate([0,0,contact_tube]){cylinder(r1=r_tube, r2=r_tube_l, h=contact_tube, $fn=50);}
		translate([0,0,contact_tube*2]){cylinder(r=r_tube_l, h=height1-contact_tube*4, $fn=50);}
		translate([0,0,height1-contact_tube*2]){cylinder(r1=r_tube_l, r2=r_tube, h=contact_tube, $fn=50);}

	}
}

module passage_tige_filetee(){
	difference(){
		union(){
			translate([0,l_pass_tige_filetee/2,0]){cylinder(r=r_ext, h=height1, $fn=50);}
			cube([7.5,l_pass_tige_filetee,height1]);
		}
		translate([7.5,0,-5]){cube([10,l_pass_tige_filetee,height1+10]);}

		//passage pour écrou M8
		translate([0,l_pass_tige_filetee/2,-5]){cylinder(r=r_ecrou_m8, h=h_ecrou_m8+5, $fn=6);}
		translate([0,l_pass_tige_filetee/2,-5]){cylinder(r=r_m8, h=50, $fn=50);}
		translate([0,l_pass_tige_filetee/2,h_ecrou_m8+ep_trou_m8]){cylinder(r=r_ecrou_m8+0.3, h=50, $fn=6);}

		//trous pour vissage et blocage écrou M8
		translate([2.5,l_pass_tige_filetee/2-9,-5]){cylinder(r=1.5, h=height1, $fn=50);}
		translate([2.5,l_pass_tige_filetee/2+9,-5]){cylinder(r=1.5, h=height1, $fn=50);}
		
	}
}

module lameflex(){
	translate([0,0,height2/2-l_lameflex/2]){cube([l_lameflex,largeur,l_lameflex]);}
}

module fixation_x(){
	difference(){
		cube([longueur,largeur,height2]);

		//trou moteur
		translate([21,largeur/2,-5]){cylinder(r=16, h=height1+10, $fn=50);}
		translate([21,largeur/2-16,-5]){cube([largeur,32,height2+20]);}

		//trous de fixation du moteur
		translate([5.5,largeur/2-15.5,-5]){cylinder(r=r_m3, h=height2+20, $fn=50);}
		translate([5.5,largeur/2+15.5,-5]){cylinder(r=r_m3, h=height2+20, $fn=50);}

		//trou pour vis réglage Z
		translate([5.5,4,-5]){cylinder(r=r_m3, h=height2+20, $fn=50);}
		translate([5.5,4,height2-5]){cylinder(r=r_ecrou_m3, h=height2, $fn=6);}

		//trous arbres
		translate([longueur-prof_arbre,12,11]){rotate([0,90,0])cylinder(r=r_arbre, h=prof_arbre+20, $fn=50);}
		translate([longueur-prof_arbre,largeur-12,11]){rotate([0,90,0])cylinder(r=r_arbre, h=prof_arbre+20, $fn=50);}
		translate([longueur-prof_arbre,11.5,-5]){cube([prof_arbre+20,1,15]);}
		translate([longueur-prof_arbre,largeur-12.5,-5]){cube([prof_arbre+20,1,15]);}

		//trous de serrage des arbres
		translate([longueur-5,-5,4]){rotate([270,0,0])cylinder(r=r_m3, h=200, $fn=50);}
		translate([longueur-5,largeur/2-20,4]){rotate([270,0,0])cylinder(r=r_ecrou_m3, h=40, $fn=6);}

		//creu pour fixation SUPPORT_ENDSTOP_X
		translate([longueur-10,largeur-5,-5]){cube([20,10,height2+20]);}

		//creu pour fixation gaine et fils
		translate([3,largeur-5,4]){cube([10,15,height2]);}
		translate([10,largeur-3,height2-5]){rotate([0,90,0])cylinder(r=r_m3, h=10, $fn=50);}

		//épurations diverses
		translate([10,0,10]){rotate([45,0,0])cube([50,15,20]);}
	}
		
}

passage_tube();
translate([0,entraxe_tubes,0]){passage_tube();}
translate([2.5,r_ext,0]){passage_tige_filetee();}
translate([r_ext,-r_ext,0]){lameflex();}
translate([r_ext+l_lameflex,-r_ext,0]){fixation_x();}