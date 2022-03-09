vivado -nolog -nojournal -mode batch -source make_project.tcl
vivado -nolog -nojournal -mode batch -source impl.tcl
xsct make_sw.tcl
