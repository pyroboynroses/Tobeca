largeur=15;
ep=4;
longueur=25;

module support_endstop_x(){
	difference(){
		cube([longueur,largeur,ep]);
		translate([15,-5,ep/2]){cube([longueur,largeur+10,ep*2]);}
	}
}

support_endstop_x();