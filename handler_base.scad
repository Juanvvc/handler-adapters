include <handler_models.scad>

// similar to https://www.thingiverse.com/thing:3486254
handler_detail=8; handler_h=15; offset=1.02;

// tight base
//handler_detail=50; handler_h=18; offset=1;

handler_base(handler_h, handler_r, offset=offset, detail=handler_detail);

