set OPENSCAD="C:\Program Files\OpenSCAD\openscad.exe"
mkdir output

%OPENSCAD% -D base_r=12.5 -o output\adapter_25mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=12.5 -o output\adapter_25mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=16 -o output\adapter_32mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=16 -o output\adapter_32mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=25 -o output\adapter_50mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=25 -o output\adapter_50mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=15 -D base_w=25 -o output\adapter_30x50mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=15 -D base_w=25 -o output\adapter_30x50mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -o output\handler.png -q --autocenter handler.scad
%OPENSCAD% -o output\handler.stl -q --export-format binstl handler.scad


%OPENSCAD% -o output\handler_base.png -q --autocenter handler_base.scad
%OPENSCAD% -o output\handler_base.stl -q --export-format binstl handler_base.scad