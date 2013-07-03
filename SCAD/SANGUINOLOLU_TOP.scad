longueur=125.9;
largeur=86;
ep=2;
r_goutte=4;
angle=61;

module goutte(){
	difference(){
		union(){
			cylinder(h = 10, r = r_goutte, $fn=24);
			translate([0,-r_goutte+1,0]){cube([r_goutte*2,r_goutte*2-2,10]);}
		}

		translate([r_goutte*2,0,-5]){rotate([0,0,angle])cube([10, 10, 20]);}
		translate([r_goutte*2,0,-5]){rotate([0,0,-angle-90])cube([10, 10, 20]);}
	}
}

module sanguinololu_top(){
	difference(){
		cube([longueur+4, largeur+4, ep+4]);

		translate([2,2,2]){cube([longueur+10, largeur, 10]);}

		translate([-10,-10,0]){rotate([0,7,0])cube([10, largeur+20, 10]);}

		/*//trous en forme de gouttes
		for (y = [6, 18, 30, 42, 54])
		{
    		for (x = [6, 26, 46,66,86,106,126])
			{
    			translate([x, y, -5])
    			goutte();
			}
		}*/
	}
}
sanguinololu_top();
//translate([-10,0,0]){goutte();}