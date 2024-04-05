use <handler_models.scad>

// adapter_type 3486254=compatible with thing:3486254.
// adapter_type=0. not compatible but you don't need adapters for 25mm bases
// adapter_type=1 is a variation of 0, better to print without supports
adapter_type=3486254;
adapter_margin=3; // margin of the adapter around the hole for the mini base

base_w=20; // main diameter of the miniature base
base_w2=0;  // secondary radius for the elliptic miniature base. If 0, it is a circular base
base_h=3.2; // The total height of the miniature base. Make is slightly taller than a real miniature base
tolerance=1.01; // scale the hole by this amount, relative to the size of a base

handler_h=75; // height of the handler
handler_r=15.1; // 15.1 matches thing:3486254

module adapter_double(base_w, base_w2, tolerance=1.02, adapter_type=3486254, adapter_margin=3) {
    if(adapter_type==3486254) {
        adapter_bottom();
    } else {
        // the bottom part is always 25mm
        base_plain(25);
    }
    translate([0, 0, base_h+base_h-0.05]) {
        translate([base_w/2+adapter_margin/2, 0, 0]) adapter_top(base_w, base_w2, tolerance=tolerance, adapter_type=adapter_type, adapter_margin=adapter_margin);
        translate([-base_w/2-adapter_margin/2, 0, 0]) adapter_top(base_w, base_w2, tolerance=tolerance, adapter_type=adapter_type, adapter_margin=adapter_margin);
    }
}
module half_adapter_double(base_w, base_w2, tolerance=1.02, adapter_type=1, adapter_margin=3) {
    difference() {
        rotate([270, 0, 180]) { adapter_double(base_w, base_w2, tolerance=tolerance, adapter_type=adapter_type, adapter_margin=adapter_margin); }
        translate([-base_w*2, -handler_h*1.5, -handler_r*3]) { cube([base_w*4, handler_h*2, handler_r*3]);  }
    }
}

half_adapter_double(base_w, base_w2, tolerance=tolerance, adapter_type=adapter_type);
