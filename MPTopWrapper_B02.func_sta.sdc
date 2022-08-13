#only for PT sta run, just define clock setting, IO delay, interface exceptions, etc
set arteris_dflt_ARRIVAL_PERCENT           30
set arteris_dflt_REQUIRED_PERCENT          30
set arteris_comb_ARRIVAL_PERCENT           30
set arteris_comb_REQUIRED_PERCENT          40
set arteris_internal_dflt_ARRIVAL_PERCENT  70
set arteris_internal_dflt_REQUIRED_PERCENT 30
set arteris_internal_comb_ARRIVAL_PERCENT  40
set arteris_internal_comb_REQUIRED_PERCENT 60
set arteris_dflt_CLOCK_UNCERTAINTY          0
set T_Flex2library 1
#set clock target for diff OPT_PVT, 1.0GHz on tt_0p65v_85c; 1.4GHz on tt_0p85v_85c, may affect CLK_CORE/CLK_NOC/CLK_SCP_DISP/CLK_CU_CTL
if { [info exists OPT_PVT] && $OPT_PVT == "tt_0p65v_85c" } {
  set {clk_cfg_P} [ expr 5.000 * $T_Flex2library ]
  set {clk_hbm_P} [ expr 1.111 * $T_Flex2library ]
  set {clk_noc_P} [ expr 1.000 * $T_Flex2library ]
} elseif { [info exists OPT_PVT] && $OPT_PVT == "tt_0p85v_85c" } {
  set {clk_cfg_P} [ expr 5.000 * $T_Flex2library ]
  set {clk_hbm_P} [ expr 1.111 * $T_Flex2library ]
  set {clk_noc_P} [ expr 0.714 * $T_Flex2library ]
} elseif { [info exists OPT_PVT] && $OPT_PVT == "ssgnp_0p675v_m40c" } {
  set {clk_cfg_P} [ expr 5.000 * $T_Flex2library ]
  set {clk_hbm_P} [ expr 1.111 * $T_Flex2library ]
  set {clk_noc_P} [ expr 1.000 * $T_Flex2library ]
} else {
  set {clk_cfg_P} [ expr 5.000 * $T_Flex2library ]
  set {clk_hbm_P} [ expr 1.111 * $T_Flex2library ]
  set {clk_noc_P} [ expr 1.000 * $T_Flex2library ]
}
set {MpNocRegime_Cm_root_P} [ expr ${clk_noc_P}*1 ]
set {MpCfgRegime_Cm_root_P} [ expr ${clk_cfg_P}*1 ]
set {MpHbmRegime_Cm_root_P} [ expr ${clk_hbm_P}*1 ]
####################################################################

# Create Clocks

create_clock -name "CLK_CFG" [get_ports "clk_cfg"] -period "${clk_cfg_P}" -waveform "[expr ${clk_cfg_P}*0.00] [expr ${clk_cfg_P}*0.50]"
create_clock -name "CLK_HBM" [get_ports "clk_hbm"] -period "${clk_hbm_P}" -waveform "[expr ${clk_hbm_P}*0.00] [expr ${clk_hbm_P}*0.50]"
create_clock -name "CLK_NOC" [get_ports "clk_noc"] -period "${clk_noc_P}" -waveform "[expr ${clk_noc_P}*0.00] [expr ${clk_noc_P}*0.50]"
#set_clock_uncertainty  ${arteris_dflt_CLOCK_UNCERTAINTY}  [get_clocks CLK_CFG] 
#set_clock_uncertainty  ${arteris_dflt_CLOCK_UNCERTAINTY}  [get_clocks CLK_HBM] 
#set_clock_uncertainty  ${arteris_dflt_CLOCK_UNCERTAINTY}  [get_clocks CLK_NOC]
# Create Virtual Clocks

# Create Generated Virtual Clocks 

# Create Generated Clocks

#create_generated_clock -name "MpCfgRegime_Cm_root" [get_pins "${CUSTOMER_HIERARCHY}u_noc_mp_ss_mp_noc_sub1/MpCfgRegime_Cm_main/root_Clk ${CUSTOMER_HIERARCHY}u_noc_mp_ss_mp_noc_sub1/MpCfgRegime_Cm_main/root_Clk_ClkS "] -source "clk_cfg" -divide_by "1"
#create_generated_clock -name "MpHbmRegime_Cm_root" [get_pins "${CUSTOMER_HIERARCHY}u_noc_mp_ss_mp_noc_sub1/MpHbmRegime_Cm_main/root_Clk ${CUSTOMER_HIERARCHY}u_noc_mp_ss_mp_noc_sub1/MpHbmRegime_Cm_main/root_Clk_ClkS "] -source "clk_hbm" -divide_by "1"
#create_generated_clock -name "MpNocRegime_Cm_root" [get_pins "u_MPTop/u_MPInst0/u_noc_mp_ss_mp_noc_sub0/MpNocRegime_Cm_main/root_Clk ${CUSTOMER_HIERARCHY}u_noc_mp_ss_mp_noc_sub0/MpNocRegime_Cm_main/root_Clk_ClkS "] -source "clk_noc" -divide_by "1"
#set_clock_uncertainty  ${arteris_dflt_CLOCK_UNCERTAINTY}  [get_clocks MpCfgRegime_Cm_root] 
#set_clock_uncertainty  ${arteris_dflt_CLOCK_UNCERTAINTY}  [get_clocks MpHbmRegime_Cm_root] 
#set_clock_uncertainty  ${arteris_dflt_CLOCK_UNCERTAINTY}  [get_clocks MpNocRegime_Cm_root] 

#warning:  uncomment below line will disabled inter-clock constraint(s) by considering them as false path(s)
set_clock_groups -asynchronous  -group { CLK_CFG  }  -group { CLK_HBM  }  -group { CLK_NOC  } 
# Create Resets 

#set_ideal_network -no_propagate [get_ports "rst_n_cfg"]
#set_ideal_network -no_propagate [get_ports "rst_n_hbm"]
#set_ideal_network -no_propagate [get_ports "rst_n_noc"]
# Clock Gating Checks

# Create Resets 

#set_ideal_network -no_propagate [get_ports "rst_n_cfg"]
#set_ideal_network -no_propagate [get_ports "rst_n_hbm"]
#set_ideal_network -no_propagate [get_ports "rst_n_noc"]

# Create Test Mode 

#set_ideal_network -no_propagate [get_ports "tm"]

#cfg clk
set_input_delay -clock  CLK_CFG [expr ${MpCfgRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports rst_n_cfg -filter "direction == in"]
set_input_delay -clock  CLK_CFG [expr ${MpCfgRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports *cfg_if_* -filter "direction == in"]
set_output_delay -clock CLK_CFG [expr ${MpCfgRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports *cfg_if_* -filter "direction == out"]
#noc clk
set_input_delay -clock  CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports rst_n_noc -filter "direction == in"]
#set_input_delay -clock  CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports e_hbmsize* -filter "direction == in"]
set_input_delay -clock  CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports iaxi_if* -filter "direction == in"]
set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports iaxi_if* -filter "direction == out"]
set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports "dma_ack"]
set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports int_* -filter "direction == out"]
#hbm clk
set_input_delay -clock  CLK_HBM [expr ${MpHbmRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports rst_n_hbm -filter "direction == in"]
set_input_delay -clock  CLK_HBM [expr ${MpHbmRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports oaxi_if* -filter "direction == in"]
set_output_delay -clock CLK_HBM [expr ${MpHbmRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports oaxi_if*  -filter "direction == out"]

#mcp for reset
set_multicycle_path -from [get_ports rst_n_*]  -setup  2
set_multicycle_path -from [get_ports rst_n_*]  -hold   1

