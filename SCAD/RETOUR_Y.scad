$fn=100;

M3_trou = 4;
M3_Ecrou_Diam = 6.6;
M3_Ecrou_Epaisseur = 3;
module LIB_M3(Longueur) 
{
  translate([0,0,-0.01]) cylinder(h=Longueur + 0.02, r=M3_trou/2, $fn=20);
  translate([0,0,-0.01]) cylinder(h=M3_Ecrou_Epaisseur+0.01, r=M3_Ecrou_Diam/2, $fn=6);
}

//Vis à Bois
B3_Trou_Vis = 2.5;
B3_Trou_Passage = 4;
B3_Chanfrein = 2; 
module LIB_B3_TETE(Longueur) 
{
  //Trou de passage
  translate([0,0,-0.01]) cylinder(h=Longueur + 0.02, r=B3_Trou_Passage/2, $fn=20);
  //Tête chanfreinée
  translate([0,0,-0.01]) cylinder(h=B3_Chanfrein + 0.01, r1=B3_Trou_Passage/2+B3_Chanfrein, r2=B3_Trou_Passage/2, $fn=30);
}

module LIB_Renfort(Longueur, Hauteur, Epaisseur)
{
  polyhedron
    (points    = [ [0, 0, 0], [0, 0, Hauteur], [0, Epaisseur, Hauteur], [0, Epaisseur, 0], [Longueur, Epaisseur, 0], [Longueur, 0, 0]  ], 
     triangles = [ [0,2,1],  [0,3,2],  [0,1,5],  [0,5,4], [1,2,5], [0,4,3], [2,3,4], [2,4,5] ]
     );
}

module TOBECA_RETOUR_Y_BASE()
{
  //Partie Fixation bois
  difference() 
  {
    cube([8,55,19]);
    translate([8,10,8]) rotate([0,-90,0]) LIB_M3(8);
    translate([8,45,8]) rotate([0,-90,0]) LIB_M3(8);

    translate([-0.01,16.5,15]) cube([8.02,22,4.01]);
    translate([4,27.5,2]) cylinder(h=20, r=1.5, $fn=30);
  }

  //Renforts
  translate([8,0,4]) LIB_Renfort(15,15,4);
  translate([8,51,4]) LIB_Renfort(15,15,4);

  //Base
  cube([23,55,4]);
  translate([26,27.5]) cylinder(h=6.5, r=6);
  translate([26,27.5]) cylinder(h=4, r=16);
  difference()
  {
    translate([26,27.5,0]) cylinder(h=15.5, r=3.9, $fn=30);
    translate([26,27.5,6.5]) cylinder(h=12, r=1.5, $fn=30);
  }
  translate([26,27.5,4]) cylinder(h=2, r1=16, r2=11);
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
       translate([26,16]) cylinder(h=2.01, r=16);
       translate([26,16,2]) cylinder(h=2.01, r1=16, r2=11);
       translate([26,16,4]) cylinder(h=0.5, r=6);
       translate([0,6,0]) cube([20,20,2]);
       translate([0,6,2]) cube([10,20,2]);
    translate([10,6,2]) polyhedron
      (points    = [ [0, 0, 0], [0, 0, 2], [4, 0, 0], [0, 20, 0], [0, 20, 2], [4, 20, 0], ], 
       triangles = [ [0,1,2],  [0,3,1],  [3,4,1], [1,4,5], [1,5,2], [0,2,3], [3,2,5], [3,5,4]
 ]
       );
     }
   translate([26,16,0]) LIB_B3_TETE(6.5);
 
   translate([4,16,0]) LIB_B3_TETE(6.5);
 
   translate([26,16,4]) cylinder(h=0.501, r=4.3, $fn=30);
 }
}

color("green")
//TOBECA_RETOUR_Y_BASE();

//color("red") translate([0,57,0]) //rotate([180,0,0])
TOBECA_RETOUR_Y_TOP();