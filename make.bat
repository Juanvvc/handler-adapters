@echo off

set BUILD_ADAPTERS_3486254=1
set BUILD_ADAPTERS_CUSTOM=1
set BUILD_HANDLER=1
set BUILD_HANDLER_BASE=1

set OPENSCAD="C:\Program Files\OpenSCAD\openscad.exe"
mkdir output

IF %BUILD_ADAPTERS_3486254% == 1 (

%OPENSCAD% -D base_w=25 -D adapter_type=3486254 -o output\adapter_25mm_3486254.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_w=25 -D adapter_type=3486254 -o output\adapter_25mm_3486254.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_w=32 -D adapter_type=3486254 -o output\adapter_32mm_3486254.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_w=32 -D adapter_type=3486254 -o output\adapter_32mm_3486254.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_w=40 -D adapter_type=3486254 -o output\adapter_40mm_3486254.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_w=40 -D adapter_type=3486254 -o output\adapter_40mm_3486254.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_w=50 -D adapter_type=3486254 -o output\adapter_50mm_3486254.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_w=50 -D adapter_type=3486254 -o output\adapter_50mm_3486254.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_w=30 -D base_w2=50 -D adapter_type=3486254 -D tolerance=1.01 -o output\adapter_30x50mm_3486254.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_w=30 -D base_w2=50 -D adapter_type=3486254 -D tolerance=1.01 -o output\adapter_30x50mm_3486254.stl -q --export-format binstl handler_adapter.scad

)

IF %BUILD_ADAPTERS_CUSTOM% == 1 (

%OPENSCAD% -D base_w=25 -D adapter_type=1 -D tolerance=1.01 -o output\adapter_25mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_w=25 -D adapter_type=1 -D tolerance=1.01 -o output\adapter_25mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_w=32 -D adapter_type=1 -D tolerance=1.01 -o output\adapter_32mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_w=32 -D adapter_type=1 -D tolerance=1.01 -o output\adapter_32mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_w=40 -D adapter_type=1 -D tolerance=1.01 -o output\adapter_40mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_w=40 -D adapter_type=1 -D tolerance=1.01 -o output\adapter_40mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_w=50 -D adapter_type=1 -D tolerance=1.01 -o output\adapter_50mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_w=50 -D adapter_type=1 -D tolerance=1.01 -o output\adapter_50mm.stl -q --export-format binstl handler_adapter.scad

%OPENSCAD% -D base_w=30 -D base_w2=50 -D adapter_type=0 -D tolerance=1.01 -o output\adapter_30x50mm.png -q --autocenter handler_adapter.scad
%OPENSCAD% -D base_w=30 -D base_w2=50 -D adapter_type=0 -D tolerance=1.01 -o output\adapter_30x50mm.stl -q --export-format binstl handler_adapter.scad

)

IF %BUILD_HANDLER% == 1 (

%OPENSCAD% -o output\handler.png -D handler_type=1 -q --autocenter handler.scad
%OPENSCAD% -o output\handler.stl -D handler_type=1 -q --export-format binstl handler.scad

)

IF %BUILD_HANDLER_BASE% == 1 (

%OPENSCAD% -D handler_base_r=30 -D handler_base_detail=8 -D tolerance=1.01 -o output\handler_base.png -q --autocenter handler_base.scad
%OPENSCAD% -D handler_base_r=30 -D handler_base_detail=8 -D tolerance=1.01 -o output\handler_base.stl -q --export-format binstl handler_base.scad
%OPENSCAD% -D handler_base_r=25 -D handler_base_detail=50 -D tolerance=1 -o output\handler_base_tight.png -q --autocenter handler_base.scad
%OPENSCAD% -D handler_base_r=25 -D handler_base_detail=50 -D tolerance=1 -o output\handler_base_tight.stl -q --export-format binstl handler_base.scad

)