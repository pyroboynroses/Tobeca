$fn=100;

M3_trou = 2;
M3_Ecrou_Diam = 3.3;
M3_Ecrou_Epaisseur = 3;

module LIB_Renfort(Longueur, Hauteur, Epaisseur)
{
  polyhedron
    (points    = [ [0, 0, 0], [0, 0, Hauteur], [0, Epaisseur, Hauteur], [0, Epaisseur, 0], [Longueur, Epaisseur, 0], [Longueur, 0, 0]  ], 
     triangles = [ [0,2,1],  [0,3,2],  [0,1,5],  [0,5,4], [1,2,5], [0,4,3], [2,3,4], [2,4,5] ]
     );}

module TOBECA_RETOUR_Y_BASE()
{
  //Partie Fixation bois
  difference() 
  {
    cube([8,55,16]);
    translate([-0.01,10,10]) rotate([0,90,0]) cylinder(h=8.02, r=M3_trou, $fn=20);
    translate([5,10,10]) rotate([0,90,0]) cylinder(h=M3_Ecrou_Epaisseur+0.02, r=M3_Ecrou_Diam, $fn=6);

    translate([-0.01,45,10]) rotate([0,90,0]) cylinder(h=8.02, r=M3_trou, $fn=20);
    translate([5,45,10]) rotate([0,90,0]) cylinder(h=M3_Ecrou_Epaisseur+0.02, r=M3_Ecrou_Diam, $fn=6);
    translate([-0.01,16.5,12]) cube([8.02,22,4.01]);
    translate([4,27.5,2]) cylinder(h=20, r=1, $fn=30);
  }

  //Renforts
  translate([8,0,4]) LIB_Renfort(15,12,4);
  translate([8,51,4]) LIB_Renfort(15,12,4);

  //Base
  cube([23,55,4]);
  translate([26,27.5]) cylinder(h=6.5, r=6);
  translate([26,27.5]) cylinder(h=4, r=16);
  difference()
  {
    translate([26,27.5,0]) cylinder(h=12, r=3.9, $fn=30);
    translate([26,27.5,6.5]) cylinder(h=12, r=1, $fn=30);
  }
  translate([26,27.5,4]) cylinder(h=2, r1=16, r2=6);
  translate([23,0,0]) polyhedron
    (points    = [ [0, 0, 0], [0, 0, 4], [0, 17, 4], [0, 17, 0], [15, 17, 0], [15, 17, 4] ], 
     triangles = [ [0,2,1],  [0,3,2],  [0,1,5],  [0,5,4], [1,2,5], [0,4,3], [2,3,4], [2,4,5] ]
     );
  translate([23,55,0]) polyhedron
    (points    = [ [0, 0, 0], [0, 0, 4], [0, -17, 4], [0, -17, 0], [15, -17, 0], [15, -17, 4] ], 
     triangles = [ [0,2,1],  [0,3,2],  [0,1,5],  [0,5,4], [1,2,5], [0,4,3], [2,3,4], [2,4,5] ]
     );
};

module TOBECA_RETOUR_Y_TOP() 
{
	
	//Chapeau
	
	difference()
	{
	  union()
	    {
	      translate([26,80]) cylinder(h=2.01, r=16);
	      translate([26,80,2]) cylinder(h=2.01, r1=16, r2=6);
	      translate([26,80,4]) cylinder(h=0.5, r=6);
	      translate([0,70,0]) cube([20,20,2]);
	      translate([0,70,2]) cube([20,20,2]);
	    }
	  translate([26,80,-0.01]) cylinder(h=6.502, r=1, $fn=30);
	  translate([26,80,-0.01]) cylinder(h=2.01, r1=3, r2=1, $fn=30);
	
	  translate([4,80,-0.01]) cylinder(h=6.502, r=1, $fn=30);
	  translate([4,80,-0.01]) cylinder(h=2.01, r1=3, r2=1, $fn=30);
	
	  translate([26,80,4]) cylinder(h=0.501, r=4.1, $fn=30);
	}
}


TOBECA_RETOUR_Y_BASE();
TOBECA_RETOUR_Y_TOP();