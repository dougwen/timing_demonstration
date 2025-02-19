# 2024-06-09T00:27:10.461722800
import vitis
client = vitis.create_client()
client.set_workspace(path="./vitis")
platform = client.create_platform_component(name = "platform",hw_design = "./vivado/design_1_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0")
comp = client.create_app_component(name="my_app",platform = "./vitis/platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")
comp = client.get_component(name="my_app")
status = comp.import_files(from_loc="./proc_sw/", files=["main.c"], dest_dir_in_cmp = "src")
platform = client.get_component(name="platform")
status = platform.build()
comp = client.get_component(name="my_app")
comp.build()
vitis.dispose()


