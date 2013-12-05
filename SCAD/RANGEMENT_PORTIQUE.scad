r_tube=6.5;
longueur=40;
l1=8.5;
hauteur=18;
trou_m3=2;
ecrou_m3=3.3;
r_cer=11;

module rangement_portique(){
	difference(){
		union(){ //formes de base
			cube([l1,longueur,hauteur]);
			translate([l1,longueur/2-5,0]){cube([17.5,9,hauteur]);}
			translate([15,29,0]){cylinder(h=hauteur, r=r_cer, $fn=50);}
			translate([l1,longueur-5,0]){cube([7,5,hauteur]);}
			translate([21,21,0]){cube([5,8,hauteur]);}
		}
		// passage pour placer le tube
		translate([15,29,-5]){cylinder(h=hauteur+10, r=r_tube, $fn=50);}
		translate([l1,0,-5]){cube([r_tube*2,29,hauteur+10]);}
			
		//trous de fixation à la mallette
		translate([-5,15,hauteur/2-5]){rotate([0,90,0])cylinder(h=l1+10, r=trou_m3, $fn=50);}
		translate([l1-3,15,hauteur/2-5]){rotate([0,90,0])cylinder(h=5, r=ecrou_m3, $fn=6);}
			
		translate([-5,15,hauteur/2+5]){rotate([0,90,0])cylinder(h=l1+10, r=trou_m3, $fn=50);}
		translate([l1-3,15,hauteur/2+5]){rotate([0,90,0])cylinder(h=5, r=ecrou_m3, $fn=6);}
			
		//trou pour blocage portique avec molette
		translate([-5,21,hauteur/2]){rotate([0,90,0])cylinder(h=50, r=trou_m3, $fn=50);}
		translate([l1+1,21,hauteur/2]){rotate([0,90,0])cylinder(h=50, r=ecrou_m3, $fn=50);}
		translate([-5,21,hauteur/2]){rotate([0,90,0])cylinder(h=5+2.5, r=ecrou_m3-0.1, $fn=6);}

	//cassage coin supérieur (pour rangement dans mallette)
	translate([3,0,-5]){rotate([0,0,-250])cube([10,10,hauteur+10]);}
	}
}
rangement_portique();