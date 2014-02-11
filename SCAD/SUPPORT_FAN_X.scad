r_m3=2;
l_char=10;
h_char=9;
ecart_char=8;
ep_plaque=2;
r_trou_moteur=16;
r_entonnoir=21;

module charniere(){
	difference(){
		union(){
			cube([6,l_char,h_char]);
			hull(){
			translate([0,0,h_char/2]){rotate([-90,0,0])cylinder(r=h_char/2, h=l_char, $fn=50);}
			}

		}
		//pente dans la pièce
		translate([10.5,-5,ep_plaque]){rotate([0,-50,0])cube([10,l_char+10,20]);}
		//trou de charnière
		translate([0,-5,h_char/2]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}

	}

}

module entonnoir(){
	difference(){
		rotate([0,22,0])cylinder(r1=r_entonnoir+1, r2=5, h=40, $fn=100);

		rotate([0,22,0])cylinder(r1=r_entonnoir, r2=3, h=40.5, $fn=100);
		translate([-58,-50,-10]){rotate([0,36,0])cube([30,100,100]);}

		translate([-5,-50,-50]){cube([100,100,52]);}

		translate([20,-10,27]){rotate([0,-28,0])cube([10,100,40]);}
	}

	/*intersection(){ //fermeture plate de l'entonnoir
		translate([-23,-50,-11]){rotate([0,36,0])cube([2,100,100]);}

		rotate([0,22,0])cylinder(r1=r_entonnoir+1, r2=5, h=40, $fn=100);

	}*/
}

module plaque_led(){
	difference(){
	union(){
		cube([36,14,2]);

		translate([17,0,2]){cube([19,14,8]);}
	}
		translate([20,3.5,-5]){rotate([-15,22,0])cylinder(r=4, h=50, $fn=100);}

		translate([0,-3,-5]){cylinder(r=17, h=10, $fn=100);}
	}
}

module plaque(){
	cube([6.5,2*ecart_char+3*l_char,2]);
difference(){
	union(){
		cube([36,2*ecart_char+3*l_char,ep_plaque]);

	}

		translate([10,-10,10.5]){rotate([0,90,90])cylinder(r=5, h=100, $fn=100);}


		translate([-5,-5,-50]){cube([100,100,50]);}

		//trous pour préserver charnière
		translate([-5,10,2]){cube([12,ecart_char,50]);}
		translate([-5,10+ecart_char+l_char,2]){cube([12,ecart_char,50]);}
		
		//trous pour fixation ventilateur
		translate([32,7,-5]){cylinder(r=r_m3, h=10, $fn=50);}
		translate([32,7+32,-5]){cylinder(r=r_m3, h=10, $fn=50);}

		//trou central ventilateur
		translate([r_trou_moteur,7+16,-5]){cylinder(r=r_trou_moteur+3, h=7, $fn=100);}

		//trou de fixation LED
		translate([10+32+11,7+16,-5]){cylinder(r=4, h=10, $fn=100);}

		
	}

}
charniere();
//translate([0,ecart_char+l_char,0]){charniere();}
translate([0,2*ecart_char+2*l_char,0]){charniere();}


difference(){
	union(){
	translate([r_trou_moteur,(2*ecart_char+3*l_char)/2,-2]){entonnoir();}
	translate([0,0,0]){plaque();}
	}

	//places pour charnière du chariot x
	translate([-5,l_char,-2]){cube([12,ecart_char+11,10]);}
	translate([-5,l_char*2+ecart_char,-2]){cube([12,ecart_char,10]);}

	//extrusion pour épouser forme des roulements
	translate([33.5,-50,33.5]){rotate([-90,0,45])cylinder(r=35, h=100, $fn=300);}

	translate([5,-5,18]){rotate([270,0,0])cylinder(r=13, h=100, $fn=300);}


}
translate([0,-14,0]){plaque_led();}