external_diam=16;
top_diam=5.2;
bottom_diam=5.2;
holder=9;
height=30;
M3_nut_head=7;
M3_nut_screw=6.6;
distance_btw_holes=15;

/** /
$fa=1;
$fs=.5;
/**/

module angle_cube(size, side=3)
{
	minkowski()
	{
		cube([size[0]-side, size[1]-side, size[2]/2], center=true);
		rotate([0, 0, 0]) cube([side/1.4,side/1.428718,size[2]/2], true);
	}
}

module coupler()
{
	difference()
	{
		union()
		{
			hull()
			{
				cylinder(r=external_diam/2, h=height, center=true);
				translate([external_diam/2, 0, 0]) rotate([90, 0, 0]) angle_cube([holder, height+2.5, 10], 8);
			}
		}
		union()
		{
			translate([external_diam/2, 0, 0]) cube([holder+external_diam/2, 2, height+.1], true);
			translate([0, 0, -height/4]) cylinder(r=bottom_diam/2, h=height/2+.1, $fn=25,center=true);
			translate([0, 0, height/4]) cylinder(r=top_diam/2, h=height/2+.1, $fn=25,center=true);
			for(i=[-1,1])
			{
				translate([external_diam/2+holder/2-M3_nut_head/2-2, 0, i*distance_btw_holes/2]) rotate([90, 0, 0]) rotate([0, 0, 90]) cylinder(r=2, h=10.1, $fn=25,center=true);
				translate([external_diam/2+holder/2-M3_nut_head/2-2, holder/2+4, i*distance_btw_holes/2]) rotate([90, 0, 0]) rotate([0, 0, 90]) cylinder(r=M3_nut_screw/2, h=10, $fn=6, center=true);
				translate([external_diam/2+holder/2-M3_nut_head/2-2, -holder/2-4, i*distance_btw_holes/2]) rotate([90, 0, 0]) rotate([0, 0, 90]) cylinder(r=M3_nut_head/2, h=10, $fn=25,center=true);
			}
		}
	}
}


coupler();

*round_cone();
module round_cone(d1=10, d2=4, h=12)
{
	hull()
	{
		sphere(r=d2/2);
		translate([0, 0, d2/2]) cylinder(r1=d2/2, r2=d1/2, h=h-d2/2);
	}
}
