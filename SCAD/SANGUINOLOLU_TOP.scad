longueur=128; //117 pour v1
largeur=95; //86 pour v1
ep=2;
r_pointe=6;
dec=1.5;
height=10;
tol=2;

module goutte(){
	union(){
		cylinder(h = height, r = r_pointe, $fn=100);
		polyhedron(
  points=[[dec,-r_pointe,0],[dec,r_pointe,0],[dec+r_pointe*2,0,0],[dec,-r_pointe,height],[dec,r_pointe,height],[dec+r_pointe*2,0,height]], 
  triangles=[[1,0,2],[3,2,0],[3,5,2],[0,1,3],[3,1,4],[1,5,4],[1,2,5],[4,5,3]]);	
	}
}

module sanguinololu_top(){
	difference(){
		cube([longueur+ep*2, largeur+ep*2, ep+4]);

		translate([ep,ep,ep-1]){cube([longueur+10, largeur, 10]);}

		translate([ep*2+r_pointe+tol,ep*2+r_pointe+tol,-5]){goutte();}
		translate([ep*2+r_pointe+tol,largeur-r_pointe-ep,-5]){goutte();}
		translate([longueur-r_pointe-ep*4,ep*2+r_pointe+tol,-5]){goutte();}
		translate([longueur-r_pointe-ep*4,largeur-r_pointe-ep,-5]){goutte();}
		translate([(longueur+ep*2)/2,(largeur+ep*2)/2,-5]){goutte();}
	}
}
sanguinololu_top();