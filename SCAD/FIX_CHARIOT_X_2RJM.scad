r_ecrou_m3=3.3;
l_gorge_collier=1;
r_douille=8;
r_trou_m3=2;

module base_piece(){
difference(){
	cube([ 70, 18, 9 ]);
	
	//passages pour colliers droites
	translate([3,0,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([18,0,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([48,0,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([63,0,0]){cube([ 4, l_gorge_collier, 9 ]);}
	
	//passages pour colliers gauches
	translate([3,17,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([18,17,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([48,17,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([63,17,0]){cube([ 4, l_gorge_collier, 9 ]);}

	//passages pour colliers dessous
	translate([3,1,0]){cube([ 4, 16, l_gorge_collier*3 ]);}
	translate([18,1,0]){cube([ 4, 16, l_gorge_collier*3 ]);}
	translate([48,1,0]){cube([ 4, 16, l_gorge_collier*3 ]);}
	translate([63,1,0]){cube([ 4, 16, l_gorge_collier*3 ]);}

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
module fix_ventilateur(){
difference(){	
	translate([22,22.5,4.5]){rotate([0,90,0])cylinder(h = 7, r = 4.5, $fn=100);}
	translate([22,22.5,4.5]){rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=100);}
}
difference(){	
	translate([22,18,0]){cube([ 7, 4.5, 9 ]);}
	translate([22,22.5,4.5]){rotate([0,90,0])cylinder(h = 10, r = 2, $fn=100);}
}
}

base_piece();
fix_ventilateur();
translate([19,0,0]){fix_ventilateur();}