# TCL File Generated by Component Editor 13.1
# Sat May 17 17:29:02 EEST 2014
# DO NOT MODIFY


# 
# i2c_opencores "I2C Master (opencores.org)" v13.0
#  2014.05.17.17:29:02
# I2C Master Peripheral from opencores.org
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module i2c_opencores
# 
set_module_property DESCRIPTION "I2C Master Peripheral from opencores.org, plus SPI master (CPOL=1, CPHA=1) functionality using the same bus."
set_module_property NAME i2c_opencores
set_module_property VERSION 17.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Interface Protocols/Serial"
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME "I2C Master (opencores.org)"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL i2c_opencores
set_fileset_property quartus_synth ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file i2c_opencores.v VERILOG PATH i2c_opencores.v
add_fileset_file i2c_master_top.v VERILOG PATH i2c_master_top.v
add_fileset_file i2c_master_defines.v VERILOG PATH i2c_master_defines.v
add_fileset_file i2c_master_byte_ctrl.v VERILOG PATH i2c_master_byte_ctrl.v
add_fileset_file i2c_master_bit_ctrl.v VERILOG PATH i2c_master_bit_ctrl.v

add_fileset sim_verilog SIM_VERILOG "" "Verilog Simulation"
set_fileset_property sim_verilog TOP_LEVEL i2c_opencores
set_fileset_property sim_verilog ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file i2c_opencores.v VERILOG PATH i2c_opencores.v
add_fileset_file i2c_master_top.v VERILOG PATH i2c_master_top.v
add_fileset_file i2c_master_defines.v VERILOG PATH i2c_master_defines.v
add_fileset_file i2c_master_byte_ctrl.v VERILOG PATH i2c_master_byte_ctrl.v
add_fileset_file i2c_master_bit_ctrl.v VERILOG PATH i2c_master_bit_ctrl.v
add_fileset_file timescale.v VERILOG PATH timescale.v


# 
# parameters
# 
add_parameter dedicated_spi INTEGER 1
set_parameter_property dedicated_spi DEFAULT_VALUE 0
set_parameter_property dedicated_spi DISPLAY_NAME "Dedicated SPI mode"
set_parameter_property dedicated_spi DISPLAY_HINT boolean
set_parameter_property dedicated_spi TYPE INTEGER
set_parameter_property dedicated_spi UNITS None
set_parameter_property dedicated_spi HDL_PARAMETER true
set_parameter_property dedicated_spi DESCRIPTION "Enables higher speed by always driving clock&data lines (no tristate) and by outputting data on falling clk edge without delay."

# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock wb_clk_i clk Input 1


# 
# connection point clock_reset
# 
add_interface clock_reset reset end
set_interface_property clock_reset associatedClock clock
set_interface_property clock_reset synchronousEdges DEASSERT
set_interface_property clock_reset ENABLED true
set_interface_property clock_reset EXPORT_OF ""
set_interface_property clock_reset PORT_NAME_MAP ""
set_interface_property clock_reset CMSIS_SVD_VARIABLES ""
set_interface_property clock_reset SVD_ADDRESS_GROUP ""

add_interface_port clock_reset wb_rst_i reset Input 1


# 
# connection point export
# 
add_interface export conduit end
set_interface_property export associatedClock ""
set_interface_property export associatedReset ""
set_interface_property export ENABLED true
set_interface_property export EXPORT_OF ""
set_interface_property export PORT_NAME_MAP ""
set_interface_property export CMSIS_SVD_VARIABLES ""
set_interface_property export SVD_ADDRESS_GROUP ""

add_interface_port export scl_pad_io export Bidir 1
add_interface_port export sda_pad_io export Bidir 1
add_interface_port export spi_miso_pad_i export Input 1


# 
# connection point avalon_slave_0
# 
add_interface avalon_slave_0 avalon end
set_interface_property avalon_slave_0 addressAlignment NATIVE
set_interface_property avalon_slave_0 addressUnits WORDS
set_interface_property avalon_slave_0 associatedClock clock
set_interface_property avalon_slave_0 associatedReset clock_reset
set_interface_property avalon_slave_0 bitsPerSymbol 8
set_interface_property avalon_slave_0 burstOnBurstBoundariesOnly false
set_interface_property avalon_slave_0 burstcountUnits WORDS
set_interface_property avalon_slave_0 explicitAddressSpan 0
set_interface_property avalon_slave_0 holdTime 0
set_interface_property avalon_slave_0 linewrapBursts false
set_interface_property avalon_slave_0 maximumPendingReadTransactions 0
set_interface_property avalon_slave_0 readLatency 0
set_interface_property avalon_slave_0 readWaitTime 1
set_interface_property avalon_slave_0 setupTime 0
set_interface_property avalon_slave_0 timingUnits Cycles
set_interface_property avalon_slave_0 writeWaitTime 0
set_interface_property avalon_slave_0 ENABLED true
set_interface_property avalon_slave_0 EXPORT_OF ""
set_interface_property avalon_slave_0 PORT_NAME_MAP ""
set_interface_property avalon_slave_0 CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave_0 SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave_0 wb_adr_i address Input 3
add_interface_port avalon_slave_0 wb_dat_i writedata Input 8
add_interface_port avalon_slave_0 wb_dat_o readdata Output 8
add_interface_port avalon_slave_0 wb_we_i write Input 1
add_interface_port avalon_slave_0 wb_stb_i chipselect Input 1
add_interface_port avalon_slave_0 wb_ack_o waitrequest_n Output 1
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point interrupt_sender
# 
add_interface interrupt_sender interrupt end
set_interface_property interrupt_sender associatedAddressablePoint avalon_slave_0
set_interface_property interrupt_sender associatedClock clock
set_interface_property interrupt_sender associatedReset clock_reset
set_interface_property interrupt_sender ENABLED true
set_interface_property interrupt_sender EXPORT_OF ""
set_interface_property interrupt_sender PORT_NAME_MAP ""
set_interface_property interrupt_sender CMSIS_SVD_VARIABLES ""
set_interface_property interrupt_sender SVD_ADDRESS_GROUP ""

add_interface_port interrupt_sender wb_inta_o irq Output 1

