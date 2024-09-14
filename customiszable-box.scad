$fn = 100;

Width = 75;
Length = 150;
Depth = 50;
Bevel_Radius = 7;
Wall_Thickness = 2;

//Recommended Lid Tolerance: 0.15mm
Lid_Tolerance = 0.2;

Lid_Thickness = 10;

clearance = Lid_Tolerance;


width = Width-2*(Bevel_Radius);
depth = Depth-(Bevel_Radius);
length = Length - 2*(Bevel_Radius);
radius = Bevel_Radius;
lid_height = Lid_Thickness;
thickness = Wall_Thickness;
inside_radius = radius - thickness;


difference (){
    group(){
        minkowski(){
            cube([width,length,depth], center = true);
            sphere(radius);
            
        }
    }
    
    translate([0,0,thickness + radius/2]){
       
        group(){
            minkowski(){
                cube([Width-(2*thickness)-2*inside_radius,Length-(2*thickness)-2*inside_radius,Depth], center=true); 
                sphere(inside_radius);
            }
            
        }
    }
    translate([0,0,(depth/2)+(radius/2)]){
        cube([width+40, length+40, radius], center = true);
    }

}
translate([Width + 10, 0, -(Depth+radius)/2]){
        group(){
        translate([0,0]){
            linear_extrude(4){
                minkowski(){
                    square([Width-2*radius, Length-2*radius], center=true);
                    circle(radius);
                }
            }
        }
        linear_extrude(lid_height){
            minkowski(){
                    square([Width-(2*thickness)-2*inside_radius - clearance,Length-(2*thickness)-2*inside_radius -clearance], center=true); 
                    circle(inside_radius);
                }
            }
        }
}
