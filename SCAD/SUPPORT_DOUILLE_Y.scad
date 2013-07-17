h_douille=11;
r_douille=5;
long=50;
larg=12;
haut=30;
trou_m3=2;
molette=20;
evid=8;
r_evid=2;
h_evid=3;
r_col=1.5;

module support_douille_y(){
	difference(){
		cube([long,larg,haut]);
		
		//creu pour passer douille
		translate([long,larg/2,-5]){cylinder(r=r_douille-0.3, h=haut+10, $fn=50);}
		translate([long,larg/2,(haut-h_douille)/2]){cylinder(r=r_douille+0.1, h=h_douille, $fn=50);}
		translate([long-1,-5,-5]){cube([10,larg+10,haut+10]);}

		//trou pour collier douille
		//translate([long-r_douille-2.5,-5,haut/2]){rotate([-90,0,0])cylinder(r=r_col, h=larg+10, $fn=50);}
		translate([long-r_douille-2.5-r_col,-5,haut/2-r_col]){cube([r_col,larg+10,r_col*2]);}
		translate([long-r_douille-2.5-1,-5,haut/2-r_col]){cube([20,7,r_col*2]);}
		translate([long-r_douille-2.5-1,larg-2,haut/2-r_col]){cube([20,7,r_col*2]);}

		//passage pour molette
		translate([5,larg/2,haut/2]){rotate([0,90,0])cylinder(r=molette/2+1, h=7, $fn=50);}

		//trou pour passage vis plateau
		translate([-5,larg/2,haut/2]){rotate([0,90,0])cylinder(r=trou_m3, h=long-5, $fn=50);}

		//évidement pour gain de matière
		hull(){
			translate([long/2-evid,-5,h_evid+r_evid]){rotate([-90,0,0])cylinder(r=r_evid, h=larg+10, $fn=50);}
			translate([long/2+evid,-5,h_evid+r_evid]){rotate([-90,0,0])cylinder(r=r_evid, h=larg+10, $fn=50);}
			translate([long/2+evid,-5,haut-(h_evid*2+r_evid)]){rotate([-90,0,0])cylinder(r=r_evid, h=larg+10, $fn=50);}
			translate([long/2-evid,-5,haut-(h_evid*2+r_evid)]){rotate([-90,0,0])cylinder(r=r_evid, h=larg+10, $fn=50);}
			translate([long/2,-5,haut-3]){rotate([-90,0,0])cylinder(r=r_evid, h=larg+10, $fn=50);}

		}

	}
}
support_douille_y();