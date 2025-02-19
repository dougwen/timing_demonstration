call c:\Xilinx\Vitis\2024.2\settings64.bat
call vivado -nolog -nojournal -mode=batch -source=./tcl/make_project.tcl
call vivado -nolog -nojournal -mode=batch -source=./tcl/impl.tcl
call vitis -s builder.py
call bootgen -image .\proc_sw\my_app.bif -arch zynq -o .\BOOT.bin -w on
