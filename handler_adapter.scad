// Rounded bases, plain and textured
// (c) 2024, Juan Vera.
// 
// Adapters for https://www.thingiverse.com/thing:3486254

// Note: in this file, the base is the mini base, not the handler base!

base_w=25; // main radius of the base
base_w2=0;  // secondary radius of the elliptic base. If 0, it is a circular base
base_h=3.1; // The total height of the base. Make is slightly smaller than a real base
offset=1.05; // scale the hole by this amount, relative to the size of a base

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

module adapter_top(base_w, base_w2, offset=1.05) {
    // top part of the adapter, whole
     difference() {
        difference() { // main body, curved
            scale([1, 1, 0.5]) sphere(r=base_w/2+2.5, $fn=50);
            union() {
                translate([0, 0, base_h]) cylinder(r=base_w/2+2, h=base_w/2);
                translate([0, 0, -(base_h+base_w/2)]) cylinder(r=base_w/2+2, h=base_w/2);
            }
        }
        // hole for the new bases
        scale([offset, offset, 1]) { base_plain(base_w, base_w2); }
    }
}

// half adapter
// base_w: the main diameter of the base, in millimeters
// base_w2: the secondary diameter of the base, in millimeters. If 0, use base_w
module half_adapter(base_w, base_w2, offset=1.05) {
    if(base_w2 == 0) { base_w2 = base_w;}
    difference() {
        union() {
            adapter_bottom();
            translate([0, 0, base_h+3]) adapter_top(base_w, base_w2);
        }
        translate([-base_w, 0, -0.5]) cube([base_w*2, base_w, base_h*4]);
    }
}

// rotation to rest it on its side, to be printed without supports
rotate([270, 0, 180]) half_adapter(base_w, base_w, offset=offset);