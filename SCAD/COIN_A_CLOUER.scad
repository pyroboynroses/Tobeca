d_trou=25;
ep=4;
r_trou=1.2;
cube_int=35;
ep_bois=9;
r_goutte=6;
r_pointe=5.5;
height=10;
dec=2.5;
l_cassure=5;

module goutte(){
	union(){
		cylinder(h = height, r = r_goutte, $fn=100);
		polyhedron(
  points=[[dec,-r_pointe,0],[dec,r_pointe,0],[dec+r_pointe*2,0,0],[dec,-r_pointe,height],[dec,r_pointe,height],[dec+r_pointe*2,0,height]], 
  triangles=[[1,0,2],[3,2,0],[3,5,2],[0,1,3],[3,1,4],[1,5,4],[1,2,5],[4,5,3]]);	
	}
}

module coin(){
	difference(){
		union(){
		intersection(){
			cube([cube_int+ep,cube_int+ep,cube_int+ep]);
			rotate([0,90,0])cylinder(h = ep, r = cube_int+ep, $fn=200);
		}
		intersection(){
			cube([cube_int+ep,cube_int+ep,cube_int+ep]);
			cylinder(h = ep, r = cube_int+ep, $fn=200);
		}
		intersection(){
			cube([cube_int+ep,cube_int+ep,cube_int+ep]);
			translate([0,ep,0]){rotate([90,0,0])cylinder(h = ep, r = cube_int+ep, $fn=200);}
		}
		}

		translate([ep,ep,ep]){cube([cube_int+10,cube_int+10,cube_int+10]);}

		//trous du bas
		translate([d_trou+ep,ep+ep_bois/2,-5]){cylinder(h = ep*3, r = r_trou, $fn=50);}
		

		translate([ep+ep_bois/2,d_trou+ep,-5]){cylinder(h = ep*3, r = r_trou, $fn=50);}
		

		//trous du haut
		translate([-5,ep+ep_bois/2,d_trou+ep]){rotate([0,90,0])cylinder(h = ep*3, r = r_trou, $fn=50);}
		


		translate([ep+ep_bois/2,-5,d_trou+ep]){rotate([0,90,90])cylinder(h = ep*3, r = r_trou, $fn=50);}
		

		//gouttes
		translate([(cube_int+ep)/2,(cube_int+ep)/2,-5]){rotate([0,0,225])goutte();}
		translate([-5,(cube_int+ep)/2,(cube_int+ep)/2]){rotate([90,135,90])goutte();}
		translate([(cube_int+ep)/2,-5,(cube_int+ep)/2]){rotate([270,135,0])goutte();}

		//cassure du coin
		polyhedron(
  points=[[0,0,0],[l_cassure,0,0],[0,l_cassure,0],[0,0,l_cassure]], 
  triangles=[[2,0,1],[0,3,1],[0,2,3],[1,3,2]]);
		
	}
}

coin();