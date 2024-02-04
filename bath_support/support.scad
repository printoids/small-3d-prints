module wall() {
    translate([-2.5, 0, -50])
        cube([5, 100, 200], true);
    
    translate([5, 0, -88.5])
        cube([10, 100, 123], true);
}

module rack() {
    rotate([0, 90, 0])
        cylinder(100 ,10, 10);
    
    rotate([0, 90, 0])
        cylinder(8 ,15, 15);
    
    translate([-5, 0, 0])
        rotate([0, 90, 0])
        cylinder(20 ,2.5, 2.5);
}

module support() {
    // frame
    translate([12, 2, -12])
        rotate([-90, 0, 0])
        linear_extrude(8) 
        polygon(points=[
            [0, 0], [0, 100], [100, 0], 
            [5, 8], [5, 90], [46, 49],
            [8, 5], [90, 5], [49, 46]],
            paths=[[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    );

    // tube holder
    translate([90, -10, -18])
        difference() {
            cube([10, 20, 14]);

            translate([-1, 10, 18])
                rotate([0, 90, 0])
                cylinder(20, 10, 10);
        }
    
    // wall plate
    difference() {        
        intersection() {
            hull() {
                rotate([0, 90, 0])
                    cylinder(3, 15, 15);
                
                translate([0, -10, -24])
                    cube([3, 20, 8]);
            }
            
            translate([0, -90, -50])
                cube([10, 100, 100]);
        }
        
        translate([-1, -17, -3])
        cube([10, 20, 6]);

    }

    // plate connector
    translate([0, -10, -24])
        cube([18, 20, 8]);
    
}

% wall();
% translate([3, 0, 0]) rack();
support();