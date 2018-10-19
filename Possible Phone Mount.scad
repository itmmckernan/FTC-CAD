// Moto G4 Play Car Mount
// Licence: CC BY-SA 3.0, http://creativecommons.org/licenses/by-sa/3.0/
// Author: Martin J. Prochnow <email@martin-prochnow.de>

module profile() {
    translate([-1.5, 9.2])
    difference() {
        circle(d=3, $fn=128);
        
        translate([-2.5, -2.5])
            square([5, 2.5]);
    }

    translate([-2.5, -2.5])
    difference() {
        circle(d=5, $fn=32);
        
        translate([-2.5, 0])
            square([5, 2.5]);
        
        translate([-2.5, -2.5])
            square([2.5, 2.5]);
    }

    polygon(points=[[0, -2.5], [0, 9.2], [-3, 9.2], [-2, 8.2], [-2, 0], [-12.5, 0], [-12.5, -5], [-2.5, -5]]);
}

module half() {
    difference() {
        union() {
            translate([0, 50+10+2.5])
            rotate([90, 0, 0])
            linear_extrude(height=50, convexity=10)
            translate([2, 0])
                profile();

            translate([-10, 2])
            rotate([90, 0, -90+2.8])
            linear_extrude(height=10, convexity=10)
            translate([2, 0])
                profile();

            translate([-10-0.5, 10+2.5])
            rotate_extrude(angle=-90, convexity=2, $fn=128)
            translate([10+2.5, 0])
                profile();

            translate([-36.1, 10, -5])
                cube([36.1, 52.5, 5]);
            
            translate([-36.1, 2, -5])
                cube([16.1, 15, 5]);
            
            translate([-36.2, 2.02, -2.5])
            rotate([0, 90, 0])
                cylinder(d=5, h=16.4, $fn=32);
        }
        
        translate([-36.1, -12.2, -5.1])
            cylinder(d=40, h=5.2, $fn=128);
        
        translate([-36.1, 110.4, -5.1])
            cylinder(d=120, h=5.2, $fn=192);
        
        translate([-36.1, 30, -5]) {
            translate([0, 0, -0.1])
                cylinder(d=6.9, h=5.2, $fn=16);

            translate([37.5/2, 0, 0])
            for (i=[-1, 1]) {
                translate([0, i*15, -0.1])
                    cylinder(d=3.9, h=5.2, $fn=16);
                
                translate([0, i*15, 2.9])
                    cylinder(d=6.9, h=3, $fn=16);
            }
        }
    }
}

union() {
    translate([36.1, 0, 0])
    half();
    
    translate([-36.1, 0, 0])
    mirror([1, 0, 0])
        half();
}

*profile();
