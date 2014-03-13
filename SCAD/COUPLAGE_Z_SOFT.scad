external_diam=16;
top_diam=4.8;
height=30;

module couplage(){
	difference(){
		cylinder(r=external_diam/2, h=height, $fn=100);
		
		//trou central général
		translate([0, 0,-5]){cylinder(r=top_diam/2, h=height+10, $fn=50);}

		//biseaux haut et bas pour simplifier montage
		translate([0, 0,height-2]){cylinder(r1=top_diam/2, r2=top_diam/2+1, h=2, $fn=50);}
		cylinder(r1=top_diam/2+1, r2=top_diam/2, h=2, $fn=50);
		
	}
	//séparation au milieu (pas besoin de régler, on enfonce tout à fond jusqu'à la butée)
	translate([0, 0,height/2-1]){cylinder(r=external_diam/2-1, h=2, $fn=50);}

}

couplage();
