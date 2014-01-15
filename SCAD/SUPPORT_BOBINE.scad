r_moyeu1=26;
r_moyeu2=28;
r_moyeu3=19;
r_608=11.25;
r_couronne=32;
r_large=13;
r_ret=9.5;
ep_couronne=2;
ep_608=7;
ep_ret=2;
ep_large=25;
r_vide=4;

module support_bobine(RLARGE,EPLARGE){
	difference(){
		union(){
			cylinder(r=r_couronne, h=ep_couronne, $fn=100);
			translate([0,0,ep_couronne]){cylinder(r=r_moyeu2, h=3, $fn=100);}
			translate([0,0,ep_couronne+3]){cylinder(r=r_moyeu1, h=ep_608+ep_ret-3, $fn=100);}
			translate([0,0,ep_couronne+6]){cylinder(r=r_moyeu3, h=ep_608+ep_ret-3, $fn=100);}
			translate([0,0,ep_couronne+ep_608+ep_ret]){cylinder(r=RLARGE+2, h=EPLARGE, $fn=100);}
		}
	translate([0,0,-5]){cylinder(r=RLARGE, h=5+EPLARGE, $fn=100);}
	translate([0,0,-5]){cylinder(r=r_608, h=5+EPLARGE+ep_608, $fn=100);}
	translate([0,0,-5]){cylinder(r=r_ret, h=100, $fn=100);}
	translate([0,0,ep_608+EPLARGE]){cylinder(r1=r_608, r2=r_ret, h=ep_ret, $fn=100);}
	translate([0,0,EPLARGE]){cylinder(r1=RLARGE, r2=r_608, h=ep_ret, $fn=100);}

/*for (y = [0,45,90,135,180,225,270,315]){
	for (z = [0:17]){
			
				rotate([0,0,z+y])translate([r_moyeu1-3.5,0,-5]){cylinder(r=r_vide-1.5, h=30, $fn=100);}
	}
}*/


	}
}

//translate([100,0,0]){support_bobine(r_608,0);}

//support_bobine(r_608,0);

support_bobine(r_large,ep_large);