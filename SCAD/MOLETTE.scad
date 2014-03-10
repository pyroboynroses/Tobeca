r_molette=12; //10 pour les petites et 12 pour les grandes
r_trou=1.5;
trou_m3=2;
ecrou_m3=3.2;
ep=5;
nb_trou=12;

module trou(){
	translate([r_molette,0,-5]){cylinder(h=ep+10, r=r_trou, $fn=50);}

}

module molette(){
	difference(){
		cylinder(h=ep, r=r_molette, $fn=100);

		translate([0,0,-5]){cylinder(h=ep+10, r=trou_m3, $fn=50);}
		translate([0,0,ep/2]){cylinder(h=ep, r=ecrou_m3, $fn=6);}

		for(i=[0:1:nb_trou]){
		rotate([0,0,i*(360/nb_trou)])trou();
		}

	}

}

molette();