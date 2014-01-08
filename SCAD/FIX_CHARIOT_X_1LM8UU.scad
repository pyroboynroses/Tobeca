r_ecrou_m3=3.3;
l_gorge_collier=1;
r_douille=8;
r_trou_m3=2;

module base_piece(){
difference(){
	cube([ 70, 18, 9 ]);
	
	//passages pour colliers droites
	translate([25.5,0,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([40.5,0,0]){cube([ 4, l_gorge_collier, 9 ]);}
	
	//passages pour colliers gauches
	translate([25.5,17,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([40.5,17,0]){cube([ 4, l_gorge_collier, 9 ]);}

	//passages pour colliers dessous
	translate([25.5,1,0]){cube([ 4, 16, l_gorge_collier*3 ]);}
	translate([40.5,1,0]){cube([ 4, 16, l_gorge_collier*3 ]);}

	//cylindre pour passage douilles
	translate([-1,9,14]){
		rotate([0,90,0])cylinder(h = 80, r = r_douille+0.3, $fn=100);
	}

	//cylindres pour trous vis
	translate([10,9,0]){cylinder(h = 7, r = r_trou_m3, $fn=100);}
	translate([60,9,0]){cylinder(h = 7, r = r_trou_m3, $fn=100);}
	//hexagones pour écrous
	translate([10,9,1.7]){cylinder(h = 7, r = r_ecrou_m3, $fn=6);}
	translate([60,9,1.7]){cylinder(h = 7, r = r_ecrou_m3, $fn=6);}
}
}


base_piece();
