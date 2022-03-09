 
set project_name "timing_demo"
create_project ${project_name} ./vivado -part xc7z020clg400-1 -force

set proj_dir [get_property directory [current_project]]
set obj [current_project]
 
add_files -fileset constrs_1 -norecurse ./src/toplevel.xdc
add_files -fileset sources_1 -norecurse ./src/toplevel.vhd

# setup IP repository path and a couple other project options 
set_property target_language VHDL [current_project]
#set_property  ip_repo_paths  ./ip_repo [current_project]
#update_ip_catalog
 
# make block design

source ./design_1.tcl 

# source ./make_ip.tcl



update_compile_order -fileset sources_1
 
close_project

 
