call c:\Xilinx\Vivado\2022.1\settings64.bat
call vivado -nolog -nojournal -mode=batch -source=make_project.tcl
call vivado -nolog -nojournal -mode=batch -source=impl.tcl
call xsct make_sw.tcl
