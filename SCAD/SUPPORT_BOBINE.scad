r_moyeu=26;
r_608=11.25;
r_couronne=29;
r_large=13;
r_ret=9.5;
ep_couronne=2;
ep_608=7;
ep_ret=2;
ep_large=25;

module support_bobine(RLARGE,EPLARGE){
	difference(){
		union(){
			cylinder(r=r_couronne, h=ep_couronne, $fn=100);
			translate([0,0,ep_couronne]){cylinder(r=r_moyeu, h=ep_608+ep_ret, $fn=100);}
			translate([0,0,ep_couronne+ep_608+ep_ret]){cylinder(r=RLARGE+2, h=EPLARGE, $fn=100);}
		}
	translate([0,0,-5]){cylinder(r=RLARGE, h=5+EPLARGE, $fn=100);}
	translate([0,0,-5]){cylinder(r=r_608, h=5+EPLARGE+ep_608, $fn=100);}
	translate([0,0,-5]){cylinder(r=r_ret, h=100, $fn=100);}
	translate([0,0,ep_608+EPLARGE]){cylinder(r1=r_608, r2=r_ret, h=ep_ret, $fn=100);}
	translate([0,0,EPLARGE]){cylinder(r1=RLARGE, r2=r_608, h=ep_ret, $fn=100);}

	}
}

module support_large(){

}

//support_bobine(r_608,0);

support_bobine(r_large,ep_large);