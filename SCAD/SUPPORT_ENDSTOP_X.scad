height=17;
long=14;
larg=21.5;
r_arbre=4;
r_m3=2;
r_ecrou_m3=3.3;

module endstop_x(){
	difference(){	
		union(){
			cube([long,larg,height]);

			//cônes pour endstop
			translate([long-8,larg-1,height]){cylinder(h = 1, r1 = 1, r2 = 0.6, $fn=50);}
			translate([long-8,larg-11,height]){cylinder(h = 1, r1 = 1, r2 = 0.6, $fn=50);}
			
		}
		
		//trou pour passage arbre
		translate([-5,larg-10,11]){rotate([0,90,0])cylinder(r=r_arbre, h=30, $fn=50);}
		translate([-5,larg-10-0.5,-5]){cube([30,1,16]);}

		//trou pour serrage arbre avec vis
		translate([long/2,-5,4]){rotate([-90,0,0])cylinder(r=r_m3, h=30, $fn=50);}
		translate([long/2,-5,4]){rotate([-90,0,0])cylinder(r=r_ecrou_m3, h=9, $fn=6);}

		
	}
}
endstop_x();