trou_m3=2;
dim1=10;
dim2=15;
ep=3;

module support_fan_x2(){
	union(){
	difference(){
		cube([dim2,ep,dim1]);
		translate([dim2/2-3,-5,dim1/2]){rotate([-90,0,0])cylinder(h=20, r=trou_m3, $fn=50);}
		translate([dim2+trou_m3-2,4,dim1/2]){cylinder(h=dim1/2+0.25, r=trou_m3+2+0.25, $fn=50);}
	}
	difference(){
		translate([dim2+trou_m3-2,5,0]){cylinder(h=dim1/2, r=trou_m3+3, $fn=50);}
		translate([dim2+trou_m3-2,5,-2]){cylinder(h=dim1, r=trou_m3, $fn=50);}
		
	}
	}

}
support_fan_x2();