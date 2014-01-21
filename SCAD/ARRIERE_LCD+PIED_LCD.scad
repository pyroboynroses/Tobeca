r_m3=2;

module charniere(){
	difference(){	
		union(){
		rotate([0,90,0])cylinder(h = 10, r = 6, $fn=100);
		translate([0,-6,-6]){cube([ 10, 6, 12 ]);}
		}
	translate([-5,0,0]){rotate([0,90,0])cylinder(h = 20, r = r_m3, $fn=100);}
	}

}

module encastrement(LONGUEUR){
	cube([3, LONGUEUR, 10.5]);

	translate([1.5,0,10.5]){rotate([-90,0,0])cylinder(h = LONGUEUR, r = 1.5, $fn=100);}

	translate([1.5,0,10.5]){cube([1.5, LONGUEUR, 1.5]);}
}

module encastrement2(LONGUEUR){
	difference(){
		cube([3, LONGUEUR, 12]);
	
		//translate([-3,-5,12]){rotate([0,45,0])cube([3, LONGUEUR+10, 10]);}
	}
}

module arriere_lcd(){
	difference(){
		cube([114, 86, 12]);
		
		//première extrusion générale
		translate([3,3,2]){cube([108, 80, 12]);}

		//passage carte SD
		translate([110,3,2]){cube([30, 23, 12]);}

		//trous de fixation
		translate([10.5,80.5,-5]){cylinder(h = 10, r = 1.5, $fn=100);}
		translate([103.5,80.5,-5]){cylinder(h = 10, r = 1.5, $fn=100);}
		//translate([18,5.5,-5]){cylinder(h = 10, r = 1.5, $fn=100);}
		translate([74,5.5,-5]){cylinder(h = 10, r = 1.5, $fn=100);}

		//passage câble plat
		translate([8,3,-5]){cube([10, 25, 12]);}

		//petits renfoncements pour charnière la charnière
		translate([42,85,-5]){cube([10, 15, 25]);}
		translate([62,85,-5]){cube([10, 15, 25]);}

	}

	//ajout des encastrements
	translate([3,4,2]){encastrement(78);}
	translate([111,26+56+1,2]){rotate([0,0,180])encastrement(55);}

	//translate([3,4,2]){encastrement2(78);}
	//translate([111,26+56+1,2]){rotate([0,0,180])encastrement2(55);}

	//ajout des charnières
	translate([32,92,6]){charniere();}
	translate([52,92,6]){charniere();}
	translate([72,92,6]){charniere();}

}

module pied(){
	difference(){
		union(){
		cube([30, 86+12-15, 4]);
		translate([15,0,0]){cylinder(h = 4, r = 15, $fn=100);}
		}

		//petit renfoncement sous la charnière
		translate([10,69,3]){cube([10, 15, 12]);}

		//trou oblong intérieur
		hull(){
			translate([15,60,-5]){cylinder(h = 15, r = 7, $fn=100);}

			translate([15,0,-5]){cylinder(h = 15, r = 7, $fn=100);}

		}

	}

	//ajout des charnières
	translate([0,86+6-15,10]){rotate([90,0,0])charniere();}
	translate([20,86+6-15,10]){rotate([90,0,0])charniere();}

}

arriere_lcd();

//translate([142,15,-4]){pied();}
//pied();
