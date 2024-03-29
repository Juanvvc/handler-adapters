// Rounded bases, plain and textured
// (c) 2024, Juan Vera.
// 
// Adapters for https://www.thingiverse.com/thing:3486254

// Note: in this file, the base is the mini base, not the handler base!

adapter_type=3486254; // type 3486254=compatible with thing:3486254. type=1. not compatible but you don't need adapters for 25mm bases

base_w=25; // main radius of the base
base_w2=0;  // secondary radius of the elliptic base. If 0, it is a circular base
base_h=3.1; // The total height of the base. Make is slightly smaller than a real base
offset=1.05; // scale the hole by this amount, relative to the size of a base

handler_h=70; // height of the handler. It is not exact: add the adapter and and base
handler_r=15.5; // 15.5 matches thing:3486254
handler_detail=6; // Handler base shape. Use 6, 8 or 50 (hexagon, octogon, circular)

// consolidated version of base_plain with no hole in circular_base.scad
// You could just include that module, but I want this file to be independent
module base_plain(base_w, base_w2) {
    base_upper_r = 11.87;
    base_upper_h = 1;
    union() {
        scale([base_w/25, base_w2/25, 1]) difference() {
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
// this bottom part also matches the top part for
// base_h=3, base_w=12.5, base_w2=12.5,
module adapter_bottom() {
    union(){
        cylinder(h=1.6, r1=12.5, r2=12);
        cylinder(h=3, r=11.3);
        cylinder(h=3.1, r1=10, r2=12);
    }
}

// top part of the adapter
// offset: scale the hole by this amount. 1 is too tight, probably
module adapter_top(base_w, base_w2, offset=1.05) {
    // top part of the adapter, whole
     difference() {
        difference() { // main body, curved
            scale([1, 1, 0.5]) sphere(r=handler_r*1.05, $fn=50);
            union() {
                translate([0, 0, base_h]) cylinder(r=handler_r*2, h=base_w/2);
                translate([0, 0, -(base_h+base_w/2)]) cylinder(r=handler_r*2, h=base_w/2);
            }
        }
        // hole for the new bases
        scale([offset, offset, 1]) { base_plain(base_w, base_w2); }
    }
}

// adapter. You probably won't print this, but half adapter
// base_w: the main diameter of the base, in millimeters
// base_w2: the secondary diameter of the base, in millimeters. If 0, use base_w
// type 1: compatible with https://www.thingiverse.com/thing:3486254
// type 2: not comtatible, but they don't need adapters for my 25mm bases
module adapter(base_w, base_w2, offset=1.05, type=3486254) {
    if(base_w2 == 0) { base_w2 = base_w;}
    union() {
        if(type==3486254) {
            adapter_bottom();
        } else {
            // just use my base as the bottom part
            base_plain(base_w, base_w2);
        }
        translate([0, 0, base_h+3]) adapter_top(base_w, base_w2, offset=offset);
    }
}

// half adapter
// base_w: the main diameter of the base, in millimeters
// base_w2: the secondary diameter of the base, in millimeters. If 0, use base_w
module half_adapter(base_w, base_w2, offset=1.05, type=1) {
    if(base_w2 == 0) { base_w2 = base_w;}
    difference() {
        rotate([270, 0, 180]) { adapter(base_w, base_w2, offset=offset, type=type); }
        translate([-handler_r*2, -handler_h*1.5, -handler_r*3]) { cube([handler_r*4, handler_h*2, handler_r*3]);  }
    }
}

//////////////////////// HANDLER

module handler(handler_h, handler_r, offset=1.05, type=3486254) {
    // bottom part of the handler, compatible with thing:3486254
    intersection() {
        cylinder(r=handler_r, h=handler_h, $fn=50);
        cylinder(r1=10.4, r2=20.9, h=15, $fn=6);
    }
    // body. It includes some speheres to enhance handling
    translate([0, 0, 15]) intersection() {
        union() {
            cylinder(r=handler_r, h=handler_h-15, $fn=50);
            for(h=[5:10:handler_h-20]){
                translate([0, 0, h]) {
                    scale([1, 1, 0.5]) {
                        sphere(r=handler_r*1.05, $fn=50);
                    }
                }
            };
        }
        cylinder(r=handler_r*1.5, h=handler_h-15, $fn=50); // limits, to clean outside the limits
    }
    // put an adapter on top
    translate([0, 0, handler_h]) adapter_top(base_w, base_w, offset=offset, type=type);
}

module half_handler(handler_h, handler_r, offset=1.05) {
    difference() {
        rotate([90, 0, 0]) { handler(handler_h, handler_r, offset=offset); }
        translate([-handler_r*2, -handler_h*1.5, -handler_r*3]) cube([handler_r*4, handler_h*2, handler_r*3]);
    }
}

// base of the handler
// handler_h=15, offset=1.05, detail=6 is similar to https://www.thingiverse.com/thing:3486254
// handler_h=18, offset=1, detail=50 is a tight base that can be used to lock the handler
module handler_base(handler_h, handler_r, offset=1.05, detail=6) {
    difference() {
        intersection() {
            scale([1, 1, 0.66]) sphere(r=handler_r*2, $fn=detail);
            translate([-2*handler_r, -2*handler_r, 0]) cube([handler_r*4, handler_r*4, handler_h]);
        }
        translate([0, 0, 0.5]) scale([offset, offset, 1]) union() {
            translate([0, 0, 14.5]) cylinder(r=handler_r, h=handler_h, $fn=50);
            intersection() {
                cylinder(r=handler_r, h=handler_h, $fn=50);
                cylinder(r1=10.4, r2=20.9, h=15, $fn=6);
            }
        }
    }
}