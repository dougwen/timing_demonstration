call vivado -nolog -nojournal -mode=batch -source=make_project.tcl
call vivado -nolog -nojournal -mode=batch -source=impl.tcl
call xsct make_sw.tcl
