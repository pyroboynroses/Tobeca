r_roue=12.5;
r_trou=3.25;
ep=10;
nb_trou=30;

module trou(){
	translate([r_roue,0,-5]){cylinder(h=ep+10, r=0.5, $fn=50);}

}

module roue(){
	difference(){
		union(){
		cylinder(h=4, r1=r_roue-3, r2=r_roue, $fn=200);
		
		translate([0,0,4]){cylinder(h=ep-4, r=r_roue, $fn=200);}

		}

		//trou central
		translate([0,0,1]){cylinder(h=ep, r=r_trou, $fn=100);}

		//grip sur le rayon extérieur
		for(i=[0:1:nb_trou]){
		rotate([0,0,i*(360/nb_trou)])trou();
		}

	}
	//ajout du méplat dans le trou central
	translate([1.7,-5,0]){cube([3,10,ep]);}

}

//roue();

translate([0,0,ep]){rotate([180,0,0])roue();}