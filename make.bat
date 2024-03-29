set OPENSCAD="C:\Program Files\OpenSCAD\openscad.exe"

%OPENSCAD% -D base_r=12.5 -o adapter_25mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=12.5 -o adapter_25mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=16 -o adapter_32mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=16 -o adapter_32mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=25 -o adapter_50mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=25 -o adapter_50mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_r=15 -D base_w=25 -o adapter_30x50mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_r=15 -D base_w=25 -o adapter_30x50mm.stl -q --export-format binstl handler_adapter.scad
