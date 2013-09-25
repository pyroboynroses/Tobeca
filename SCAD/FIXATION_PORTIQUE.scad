longueur=29;
largeur=35;
trou_m3=2;
ecrou_m3=3.3;
h=10;
ecart=55;
r_tube=6.25;
pos_tube=15;
l_moteur=26;


module fixation_portique(){
	difference(){
		cube([pos_tube+r_tube+5,longueur,h]);

		translate([pos_tube,longueur/2,-5]){cylinder(h=20, r=r_tube, $fn=50);}

		//trou pour serrage sur tube
		translate([pos_tube-2.5,3,-5]){cube([5,3,20]);}
		translate([pos_tube,-5,h/2]){rotate([-90,0,0])cylinder(h=15, r=trou_m3, $fn=50);}

		//trou pour serrage dans boite
		//translate([-5,longueur/2,h/2]){rotate([0,90,0])cylinder(h=15, r=trou_m3, $fn=50);}
		//translate([pos_tube,longueur/2,h/2]){rotate([0,-90,0])cylinder(h=12, r=ecrou_m3, $fn=6);}
		translate([3,longueur/2-2.5,-5]){cube([3,5,20]);}
		translate([-5,longueur/2,h/2]){rotate([0,90,0])cylinder(h=15, r=trou_m3, $fn=50);}

		//cassage des coins
		//translate([20,0,-5]){rotate([0,0,-35])cube([30,30,20]);}
		translate([20,longueur,-5]){rotate([0,0,-55])cube([30,30,20]);}
		translate([4,0,-5]){rotate([0,0,-225])cube([10,10,20]);}
		translate([4,longueur,-5]){rotate([0,0,-225])cube([10,10,20]);}


	}

}
module support_endstop(){
	difference(){
		cube([28.5,longueur,h]);
		
		translate([1.5,4.5,-5]){cube([30,6.5,20]);}
		translate([0,18.5,-5]){cube([35,20,20]);}

		//trou pour serrage contact de fin de course
		translate([23.5,-5,h/2]){rotate([-90,0,0])cylinder(h=30, r=trou_m3, $fn=50);}
		translate([23.5,15,h/2]){rotate([-90,0,0])cylinder(h=30, r=ecrou_m3, $fn=6);}
	}

}

fixation_portique();
translate([pos_tube+r_tube+5,0,0]){support_endstop();}