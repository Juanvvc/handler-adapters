// Rounded bases, plain and textured
// (c) 2024, Juan Vera.
// 
// Adapters for https://www.thingiverse.com/thing:3486254

// Note: in this file, the base is the mini base, not the handler base!

// adapter_type 3486254=compatible with thing:3486254.
// adapter_type=0. not compatible but you don't need adapters for 25mm bases
// adapter_type=1 is a variation of 0, better to print without supports
adapter_type=3486254; 

base_w=25; // main diameter of the miniature base
base_w2=0;  // secondary radius for the elliptic miniature base. If 0, it is a circular base
base_h=3.2; // The total height of the miniature base. Make is slightly taller than a real miniature base
tolerance=1.01; // scale the hole by this amount, relative to the size of a base

handler_h=75; // height of the handler
handler_r=15.1; // 15.1 matches thing:3486254

handler_base_r=30; // bottom radius of the handler base
handler_base_h=17.5; // heigth of the handler base
handler_base_detail=8; // Handler base shape. Use 6, 8 or 50 (hexagon, octogon, circular)

// rings and hole
ring_count=6; // use 0 for no rings
ring_h=2.5; // magic number! It is an approximation with the usual parameters
hole_r=3; // radius of the hole for an additional grip. If 0, do not add a hole


// consolidated version of base_plain with no hole in circular_base.scad
// You could just include that module, but I want this file to be independent
module base_plain(base_w) {
    base_upper_r = 11.87;
    base_upper_h = 2;
    scale([base_w/25, base_w/25, 1]) union() {
        difference() {
            scale([1, 1, 0.62]) sphere(r=25 / 2, $fn=50);
            union() {
                translate([0, 0, 5+2.5]) cube([30, 30, 10], center=true);
                translate([0, 0, -5]) cube([30, 30, 10], center=true);
            }
        }
        translate([0, 0, 2.11]) cylinder(h=base_upper_h, r=base_upper_r);
    }
}
module base_plain_extended(base_w) {
    base_upper_r = 11.87;
    base_upper_h = 2;
    scale([base_w/25, base_w/25, 1]) union() {
        difference() {
            scale([1, 1, 0.62]) sphere(r=25 / 2, $fn=50);
            union() {
                translate([0, 0, 5+2.5]) cube([30, 30, 10], center=true);
                translate([0, 0, -5]) cube([30, 30, 10], center=true);
            }
        }
        translate([0, 0, 2.11]) cylinder(h=base_upper_h, r=base_upper_r);
        translate([-25/4, -25, 0]) cube([25/2, 50, base_h+base_upper_h]);
    }
}
module base_horses(base_w, base_w2) {
    base_upper_r = 11.87;
    base_upper_h = 2;
    scale([base_w/25, base_w2/25, 1]) union() {
        difference() {
            scale([1, 1, 0.62]) sphere(r=25 / 2, $fn=50);
            union() {
                translate([0, 0, 5+2.5]) cube([30, 30, 10], center=true);
                translate([0, 0, -5]) cube([30, 30, 10], center=true);
            }
        }
        translate([0, 0, 2.11]) cylinder(h=base_upper_h, r=base_upper_r);
    }
}

//////////////////////// ADAPTER


// a bottom that fits in https://www.thingiverse.com/thing:3486254
// do not change this dimensions!
module adapter_bottom() {
    union(){
        cylinder(h=1.6, r1=12.5, r2=12);
        cylinder(h=3, r=11.3);
        cylinder(h=3.25, r1=10, r2=12);
    }
}

// top part of the adapter
// tolerance: scale the hole by this amount. 1 is too tight, probably
module adapter_top(base_w, base_w2, tolerance=1.02, adapter_type=3486254) {
     // top part of the adapter, whole
     difference() {
        difference() { // main body, curved
            scale([1, 1, 0.5])  sphere(r=base_w/2+3, $fn=50);
            union() { // limits
                translate([0, 0, base_h-0.15]) cylinder(r=base_w*2, h=base_w/2);
                translate([0, 0, -(base_h+base_w/2)]) cylinder(r=base_w*2, h=base_w/2);
            }
        }
        // hole for the mini bases
        if(base_w2 == 0) {
            if(adapter_type==1 || adapter_type==3486254) {
                scale([tolerance, tolerance, 1]) { base_plain_extended(base_w); }
            } else {
                scale([tolerance, tolerance, 1]) { base_plain(base_w); }
            }
        } else {
            scale([tolerance, tolerance, 1]) { base_horses(base_w, base_w2); }
        }
    }
}

// adapter. You probably won't print this, but half adapter
// base_w: the main diameter of the base, in millimeters
// base_w2: the secondary diameter of the base, in millimeters. If 0, use base_w
// adapter_type 1: compatible with https://www.thingiverse.com/thing:3486254
// adapter_type 2: not comtatible, but they don't need adapters for my 25mm bases
module adapter(base_w, base_w2, tolerance=1.02, adapter_type=3486254) {
    if(adapter_type==3486254) {
        adapter_bottom();
    } else {
        // the bottom part is always 25mm
        base_plain(25);
    }
    translate([0, 0, base_h+base_h-0.05]) adapter_top(base_w, base_w2, tolerance=tolerance, adapter_type=adapter_type);
}

// half adapter
// base_w: the main diameter of the base, in millimeters
// base_w2: the secondary diameter of the base, in millimeters. If 0, use base_w
module half_adapter(base_w, base_w2, tolerance=1.02, adapter_type=1) {
    difference() {
        rotate([270, 0, 180]) { adapter(base_w, base_w2, tolerance=tolerance, adapter_type=adapter_type); }
        translate([-base_w*2, -handler_h*1.5, -handler_r*3]) { cube([base_w*4, handler_h*2, handler_r*3]);  }
    }
}

//////////////////////// HANDLER

// handler_h: height of the handler
// handler_r: main radius of the base
// tolerance: scale the hole for the mini base by this amount. 1 is too tight, probably
// additionaty, global handler_base_h is also used to have that part of the handler empty
module handler(handler_h, handler_r, tolerance=1.02, adapter_type=0) {
    // bottom part of the handler, compatible with thing:3486254
    intersection() {
        cylinder(r=handler_r, h=handler_base_h, $fn=50);
        cylinder(r1=10.4, r2=handler_base_h/tan(55)+10.4, h=handler_base_h, $fn=6);
        //cylinder(r1=10.4, r2=20.9, h=15, $fn=6);
    }
    // body. It includes some rings for better grip
    translate([0, 0, handler_base_h]) intersection() {
        union() {
            cylinder(r=handler_r, h=handler_h-handler_base_h, $fn=50);
            if(ring_count>0) {
                for(h=[ring_h:(handler_h-handler_base_h-ring_h)/ring_count:handler_h-handler_base_h-5]){
                    // rings, the -5 in the last line is to avoid the last rung: that is the adapter
                    translate([0, 0, h]) scale([1, 1, 0.5]) sphere(r=handler_r*1.05, $fn=50);
                }
            }
        }
        cylinder(r=handler_r*1.5, h=handler_h-handler_base_h, $fn=50); // limits, to clean outside the limits
    }
    // put an adapter on top
    translate([0, 0, handler_h]) adapter_top(base_w, base_w2, tolerance=tolerance,adapter_type=adapter_type);
}

module half_handler(handler_h, handler_r, tolerance=1.02, adapter_type=0) {
    difference() {
        rotate([90, 0, 0]) { handler(handler_h, handler_r, tolerance=tolerance, adapter_type=adapter_type); }
        union() {
            translate([-handler_r*2, -handler_h*1.5, -handler_r*3]) cube([handler_r*4, handler_h*2, handler_r*3]);
            if(hole_r>0) {
                // in the 5 ring, a hole for an additional grip
                hole_position=handler_base_h+ring_h+4*(handler_h-handler_base_h-ring_h)/6;
                if(ring_count>0) {
                    hole_position=handler_base_h+ring_h+4*(handler_h-handler_base_h-ring_h)/ring_count;
                }
                translate([0, -hole_position, handler_r/2]) cylinder(r=hole_r, h=handler_r, $fn=50);
            }
        }
    }
}

// base of the handler
// handler_h=17.5, base_r=30, tolerance=1.01, detail=6 is similar to https://www.thingiverse.com/thing:3486254
// handler_h=17.5, base_r=25, tolerance=1, detail=50 is a tight base that can be used to lock the handler
module handler_base(handler_base_h, handler_base_r, handler_r, tolerance=1.01, handler_base_detail=8) {
    difference() {
        // main base handler
        intersection() { 
            scale([1, 1, 0.9]) sphere(r=handler_base_r, $fn=handler_base_detail);
            translate([-2*handler_base_r, -2*handler_base_r, 0]) cube([handler_base_r*4, handler_base_r*4, handler_base_h]);
        }
        // hole of the base handler, compatible with thing:3486254
        translate([0, 0, -0.01]) scale([tolerance, tolerance, 1]) union() {
            translate([0, 0, 14.5]) cylinder(r=handler_r, h=handler_h, $fn=50);
            intersection() {
                cylinder(r=handler_r, h=handler_h, $fn=50);
                cylinder(r1=10.4, r2=20.9, h=15, $fn=6);
            }
        }
    }
}