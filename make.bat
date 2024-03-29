set OPENSCAD="C:\Program Files\OpenSCAD\openscad.exe"
mkdir output

%OPENSCAD% -D base_r=12.5 -o output\adapter_25mm_3486254.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=12.5 -o output\adapter_25mm_3486254.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=16 -o output\adapter_32mm_3486254.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=16 -o output\adapter_32mm_3486254.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=20 -o output\adapter_40mm_3486254.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=20 -o output\adapter_40mm_3486254.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=25 -o output\adapter_50mm_3486254.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=25 -o output\adapter_50mm_3486254.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=15 -D base_w=25 -o output\adapter_30x50mm_3486254.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=15 -D base_w=25 -o output\adapter_30x50mm_3486254.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=12.5 -D adapter_type=2 -o output\adapter_25mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=12.5 -D adapter_type=2 -o output\adapter_25mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=16 -D adapter_type=2 -o output\adapter_32mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=16 -D adapter_type=2 -o output\adapter_32mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=20 -D adapter_type=2 -o output\adapter_40mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=20 -D adapter_type=2 -o output\adapter_40mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=25 -D adapter_type=2 -o output\adapter_50mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=25 -D adapter_type=2 -o output\adapter_50mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=15 -D base_w=25 -D adapter_type=2 -o output\adapter_30x50mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=15 -D type=2 -D base_w=25 -D adapter_type=2 -o output\adapter_30x50mm.stl -q --export-format binstl handler_adapter.scad


%OPENSCAD% -o output\handler.png -q --autocenter handler.scad
%OPENSCAD% -o output\handler.stl -q --export-format binstl handler.scad

%OPENSCAD% -D handler_h=15 -D handler_detail=8 -D offset=1.02 -o output\handler_base.png -q --autocenter handler_base.scad
%OPENSCAD% -D handler_h=15 -D handler_detail=8 -D offset=1.02 -o output\handler_base.stl -q --export-format binstl handler_base.scad
%OPENSCAD% -D handler_h=18 -D handler_detail=50 -D offset=1 -o output\handler_base_tight.png -q --autocenter handler_base.scad
%OPENSCAD% -D handler_h=18 -D handler_detail=50 -D offset=1 -o output\handler_base_tight.stl -q --export-format binstl handler_base.scad