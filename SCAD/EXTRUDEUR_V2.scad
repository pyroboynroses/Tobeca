r_trou_m3=2;
r_ecrou_m3=3.3;
height_plaque_moteur=5;
cote_moteur=42;
r_pignon=4;
ep_fixation=10;
r_trou_filament=2.5;
height_passage_filament=10;
r_filament=1.5;
larg_fixation=70;


module plaque_moteur(){
	
	difference(){
	cube([cote_moteur,cote_moteur,height_plaque_moteur]);

	translate([5.5,5.5,-5]){cylinder(h = height_plaque_moteur+10, r = r_trou_m3, $fn=50);}
	translate([cote_moteur-5.5,5.5,-5]){cylinder(h = height_plaque_moteur+10, r = r_trou_m3, $fn=50);}
	translate([5.5,cote_moteur-5.5,-5]){cylinder(h = height_plaque_moteur+10, r = r_trou_m3, $fn=50);}
	translate([cote_moteur-5.5,cote_moteur-5.5,-5]){cylinder(h = height_plaque_moteur+10, r = r_trou_m3, $fn=50);}
	}
}

module passage_filament(){
	cube([cote_moteur,10,height_passage_filament]);
}

module fixation(){
	difference(){
	cube([ep_fixation,larg_fixation,height_plaque_moteur*2+height_passage_filament]);
	
	translate([-ep_fixation-15,5,(height_plaque_moteur*2+height_passage_filament)/2]){rotate([0,90,0])cylinder(h = 50, r = r_trou_m3, $fn=50);}
	translate([ep_fixation-3,5,(height_plaque_moteur*2+height_passage_filament)/2]){rotate([0,90,0])cylinder(h = 50, r = r_ecrou_m3, $fn=6);}
	translate([ep_fixation-15,larg_fixation-5,(height_plaque_moteur*2+height_passage_filament)/2]){rotate([0,90,0])cylinder(h = 50, r = r_trou_m3, $fn=50);}
	translate([ep_fixation-3,larg_fixation-5,(height_plaque_moteur*2+height_passage_filament)/2]){rotate([0,90,0])cylinder(h = 50, r = r_ecrou_m3, $fn=6);}
	}
}

module ensemble(){
	plaque_moteur();	
	translate([-ep_fixation,-19.5,0]){fixation();}
	translate([0,10.5,5]){passage_filament();}
difference(){
	plaque_moteur();
	
	}
}

difference(){
	ensemble();
	translate([cote_moteur/2,cote_moteur/2,-5]){cylinder(h = 50, r = 12, $fn=50);}
	translate([-ep_fixation-10,15.5,(height_plaque_moteur*2+height_passage_filament)/2]){rotate([0,90,0])cylinder(h = 100, r = r_trou_filament, $fn=50);}
	}