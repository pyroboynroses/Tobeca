r_m3=2;
l_char=10;
h_char=9;
ecart_char=8;
ep_plaque=2;

module charniere(){
	difference(){
		union(){
			cube([10.5,l_char,h_char]);

			translate([0,0,h_char/2]){rotate([-90,0,0])cylinder(r=h_char/2, h=l_char, $fn=50);}

		}
		//pente dans la pièce
		translate([10.5,-5,ep_plaque]){rotate([0,-50,0])cube([10,l_char+10,20]);}
		//trou de charnière
		translate([0,-5,h_char/2]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}

	}

}

module plaque(){
	difference(){
		cube([60,2*ecart_char+3*l_char,ep_plaque]);

		//trous pour fixation ventilateur
		translate([10,7,-5]){cylinder(r=r_m3, h=10, $fn=50);}
		translate([10+32,7,-5]){cylinder(r=r_m3, h=10, $fn=50);}
		translate([10,7+32,-5]){cylinder(r=r_m3, h=10, $fn=50);}
		translate([10+32,7+32,-5]){cylinder(r=r_m3, h=10, $fn=50);}

		//trou central ventilateur
		translate([10+16,7+16,-5]){cylinder(r=18, h=10, $fn=100);}

		//trou de fixation LED
		translate([10+32+11,7+16,-5]){cylinder(r=4, h=10, $fn=100);}

		//allègement de la pièce
		translate([62,0,-5]){cylinder(r=16, h=10, $fn=100);}
		translate([62,46,-5]){cylinder(r=16, h=10, $fn=100);}

	}

}

charniere();
translate([0,ecart_char+l_char,0]){charniere();}
translate([0,2*ecart_char+2*l_char,0]){charniere();}
translate([6,0,0]){plaque();}