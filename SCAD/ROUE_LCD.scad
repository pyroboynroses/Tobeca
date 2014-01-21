r_roue=12.5;
r_trou=3;
ep=10;
nb_trou=30;

module trou(){
	translate([r_roue,0,-5]){cylinder(h=ep+10, r=0.5, $fn=50);}

}

module roue(){
	difference(){
		cylinder(h=ep, r=r_roue, $fn=200);

		//trou central
		translate([0,0,2]){cylinder(h=ep, r=r_trou, $fn=100);}

		//grip sur le rayon extérieur
		for(i=[0:1:nb_trou]){
		rotate([0,0,i*(360/nb_trou)])trou();
		}

	}
	//ajout du méplat dans le trou central
	translate([1.5,-5,0]){cube([3,10,ep]);}

}

roue();