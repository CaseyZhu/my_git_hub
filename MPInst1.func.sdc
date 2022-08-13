# Design variables used later in constraints
set CUSTOMER_HIERARCHY "u_noc_mp_ss_mp_noc_sub1_top/u_noc_mp_ss_mp_noc_sub1/"
set arteris_dflt_ARRIVAL_PERCENT           70
set arteris_dflt_REQUIRED_PERCENT          30
set arteris_internal_comb_ARRIVAL_PERCENT  70
set arteris_internal_comb_REQUIRED_PERCENT 30
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

#source "constraints/internalConstraints.sdc"
#source "constraints/externalConstraints.sdc"


####################################################################

## Created by FlexNoC(4.5.2) script export on 2021-07-10 03:30:49

####################################################################

# Create Clocks
create_clock -name "CLK_NOC" [get_ports "clk_noc i_MpNocRegime_Cm_root_Clk i_MpNocRegime_Cm_root_Clk_ClkS"] -period "${clk_noc_P}" -waveform "[expr ${clk_noc_P}*0.00] [expr ${clk_noc_P}*0.50]"
create_clock -name "CLK_CFG" [get_ports "i_MpCfgRegime_Cm_root_Clk i_MpCfgRegime_Cm_root_Clk_ClkS"] -period "${clk_cfg_P}" -waveform "[expr ${clk_cfg_P}*0.00] [expr ${clk_cfg_P}*0.50]"
create_clock -name "CLK_HBM" [get_ports "clk_hbm"] -period "${clk_hbm_P}" -waveform "[expr ${clk_hbm_P}*0.00] [expr ${clk_hbm_P}*0.50]"
set_ideal_network [get_ports "clk_noc i_MpNocRegime_Cm_root_Clk i_MpNocRegime_Cm_root_Clk_ClkS i_MpCfgRegime_Cm_root_Clk i_MpCfgRegime_Cm_root_Clk_ClkS clk_hbm"]
#Create Virtual Clocks
 
#warning:  uncomment below line will disabled inter-clock constraint(s) by considering them as false path(s)
set_clock_groups -asynchronous  -group { CLK_CFG  }  -group { CLK_HBM  }  -group { CLK_NOC} 
# Create Resets 
set_ideal_network [get_ports "i_MpCfgRegime_Cm_root_Clk_RetRstN"]
set_ideal_network [get_ports "i_MpCfgRegime_Cm_root_Clk_RstN"]
set_ideal_network [get_ports "i_MpNocRegime_Cm_root_Clk_RetRstN"]
set_ideal_network [get_ports "i_MpNocRegime_Cm_root_Clk_RstN"]
# Create Test Mode 
#set_ideal_network [get_ports "i_MpCfgRegime_Cm_root_Clk_Tm"]
#set_ideal_network [get_ports "i_MpNocRegime_Cm_root_Clk_Tm"]
#set_ideal_network [get_ports "tm"]
set_ideal_network [get_ports "rst_n_hbm"]
set_ideal_network [get_ports "rst_n_noc"]

#max delay sub1
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162Resp_main/DtpRxClkAdapt_ate_cfg1_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpRxClkAdapt_Link154_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159Resp_main/DtpRxClkAdapt_dma_cfg_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142Resp_main/DtpRxClkAdapt_llc_cfg2_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152Resp_main/DtpRxClkAdapt_llc_cfg8_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpRxClkAdapt_Link159_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpRxClkAdapt_Link153_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149Resp_main/DtpRxClkAdapt_ate_cfg5_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29Resp001_main/DtpRxClkAdapt_umm_cfg_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144Resp_main/DtpRxClkAdapt_llc_cfg0_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpRxClkAdapt_Link145_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpRxClkAdapt_Link25_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55Resp_main/DtpRxClkAdapt_ate_cfg2_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpRxClkAdapt_Link144_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpRxClkAdapt_Link160_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpRxClkAdapt_Link151_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143Resp_main/DtpRxClkAdapt_llc_cfg3_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154Resp_main/DtpRxClkAdapt_llc_cfg9_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpRxClkAdapt_Link141_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpRxClkAdapt_Link148_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24Resp_main/DtpRxClkAdapt_llc_cfg7_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpRxClkAdapt_Link156_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151Resp_main/DtpRxClkAdapt_llc_cfg10_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147Resp_main/DtpRxClkAdapt_llc_cfg5_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141Resp_main/DtpRxClkAdapt_llc_cfg1_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148Resp_main/DtpRxClkAdapt_ate_cfg6_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpRxClkAdapt_Link58_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpRxClkAdapt_Link146_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpRxClkAdapt_Link142_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpRxClkAdapt_Link55_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpRxClkAdapt_Link162_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpRxClkAdapt_Link149_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpRxClkAdapt_Link152_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156Resp_main/DtpRxClkAdapt_llc_cfg14_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpRxClkAdapt_Link147_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpRxClkAdapt_Link157_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpRxClkAdapt_Link24_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160Resp_main/DtpRxClkAdapt_ctrl_cfg_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153Resp_main/DtpRxClkAdapt_llc_cfg11_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpRxClkAdapt_Link150_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpRxClkAdapt_Link92_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpRxClkAdapt_Link29_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92Resp_main/DtpRxClkAdapt_ate_cfg3_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145Resp_main/DtpRxClkAdapt_llc_cfg6_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150Resp_main/DtpRxClkAdapt_ate_cfg7_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158Resp_main/DtpRxClkAdapt_llc_cfg15_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58Resp_main/DtpRxClkAdapt_ate_cfg0_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpRxClkAdapt_Link158_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146Resp_main/DtpRxClkAdapt_ate_cfg4_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155Resp_main/DtpRxClkAdapt_llc_cfg12_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157Resp_main/DtpRxClkAdapt_llc_cfg13_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpRxClkAdapt_Link155_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25Resp_main/DtpRxClkAdapt_llc_cfg4_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpRxClkAdapt_Link143_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162Resp_main/DtpRxClkAdapt_ate_cfg1_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpRxClkAdapt_Link154_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159Resp_main/DtpRxClkAdapt_dma_cfg_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142Resp_main/DtpRxClkAdapt_llc_cfg2_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152Resp_main/DtpRxClkAdapt_llc_cfg8_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpRxClkAdapt_Link159_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpRxClkAdapt_Link153_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149Resp_main/DtpRxClkAdapt_ate_cfg5_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29Resp001_main/DtpRxClkAdapt_umm_cfg_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144Resp_main/DtpRxClkAdapt_llc_cfg0_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpRxClkAdapt_Link145_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpRxClkAdapt_Link25_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55Resp_main/DtpRxClkAdapt_ate_cfg2_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpRxClkAdapt_Link144_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpRxClkAdapt_Link160_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpRxClkAdapt_Link151_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143Resp_main/DtpRxClkAdapt_llc_cfg3_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154Resp_main/DtpRxClkAdapt_llc_cfg9_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpRxClkAdapt_Link141_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpRxClkAdapt_Link148_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24Resp_main/DtpRxClkAdapt_llc_cfg7_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpRxClkAdapt_Link156_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151Resp_main/DtpRxClkAdapt_llc_cfg10_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147Resp_main/DtpRxClkAdapt_llc_cfg5_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141Resp_main/DtpRxClkAdapt_llc_cfg1_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148Resp_main/DtpRxClkAdapt_ate_cfg6_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpRxClkAdapt_Link58_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpRxClkAdapt_Link146_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpRxClkAdapt_Link142_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpRxClkAdapt_Link55_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpRxClkAdapt_Link162_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpRxClkAdapt_Link149_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpRxClkAdapt_Link152_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156Resp_main/DtpRxClkAdapt_llc_cfg14_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpRxClkAdapt_Link147_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpRxClkAdapt_Link157_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpRxClkAdapt_Link24_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160Resp_main/DtpRxClkAdapt_ctrl_cfg_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153Resp_main/DtpRxClkAdapt_llc_cfg11_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpRxClkAdapt_Link150_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpRxClkAdapt_Link92_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpRxClkAdapt_Link29_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92Resp_main/DtpRxClkAdapt_ate_cfg3_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145Resp_main/DtpRxClkAdapt_llc_cfg6_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150Resp_main/DtpRxClkAdapt_ate_cfg7_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158Resp_main/DtpRxClkAdapt_llc_cfg15_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58Resp_main/DtpRxClkAdapt_ate_cfg0_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpRxClkAdapt_Link158_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146Resp_main/DtpRxClkAdapt_ate_cfg4_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155Resp_main/DtpRxClkAdapt_llc_cfg12_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157Resp_main/DtpRxClkAdapt_llc_cfg13_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpRxClkAdapt_Link155_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25Resp_main/DtpRxClkAdapt_llc_cfg4_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpRxClkAdapt_Link143_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162Resp_main/DtpRxClkAdapt_ate_cfg1_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpRxClkAdapt_Link154_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159Resp_main/DtpRxClkAdapt_dma_cfg_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142Resp_main/DtpRxClkAdapt_llc_cfg2_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152Resp_main/DtpRxClkAdapt_llc_cfg8_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpRxClkAdapt_Link159_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpRxClkAdapt_Link153_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149Resp_main/DtpRxClkAdapt_ate_cfg5_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29Resp001_main/DtpRxClkAdapt_umm_cfg_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144Resp_main/DtpRxClkAdapt_llc_cfg0_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpRxClkAdapt_Link145_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpRxClkAdapt_Link25_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55Resp_main/DtpRxClkAdapt_ate_cfg2_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpRxClkAdapt_Link144_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpRxClkAdapt_Link160_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpRxClkAdapt_Link151_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143Resp_main/DtpRxClkAdapt_llc_cfg3_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154Resp_main/DtpRxClkAdapt_llc_cfg9_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpRxClkAdapt_Link141_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpRxClkAdapt_Link148_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24Resp_main/DtpRxClkAdapt_llc_cfg7_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpRxClkAdapt_Link156_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151Resp_main/DtpRxClkAdapt_llc_cfg10_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147Resp_main/DtpRxClkAdapt_llc_cfg5_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141Resp_main/DtpRxClkAdapt_llc_cfg1_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148Resp_main/DtpRxClkAdapt_ate_cfg6_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpRxClkAdapt_Link58_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpRxClkAdapt_Link146_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpRxClkAdapt_Link142_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpRxClkAdapt_Link55_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpRxClkAdapt_Link162_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpRxClkAdapt_Link149_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpRxClkAdapt_Link152_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156Resp_main/DtpRxClkAdapt_llc_cfg14_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpRxClkAdapt_Link147_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpRxClkAdapt_Link157_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpRxClkAdapt_Link24_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160Resp_main/DtpRxClkAdapt_ctrl_cfg_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153Resp_main/DtpRxClkAdapt_llc_cfg11_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpRxClkAdapt_Link150_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpRxClkAdapt_Link92_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpRxClkAdapt_Link29_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92Resp_main/DtpRxClkAdapt_ate_cfg3_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145Resp_main/DtpRxClkAdapt_llc_cfg6_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150Resp_main/DtpRxClkAdapt_ate_cfg7_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158Resp_main/DtpRxClkAdapt_llc_cfg15_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58Resp_main/DtpRxClkAdapt_ate_cfg0_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpRxClkAdapt_Link158_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146Resp_main/DtpRxClkAdapt_ate_cfg4_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155Resp_main/DtpRxClkAdapt_llc_cfg12_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157Resp_main/DtpRxClkAdapt_llc_cfg13_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpRxClkAdapt_Link155_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25Resp_main/DtpRxClkAdapt_llc_cfg4_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpRxClkAdapt_Link143_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153_main/DtpTxClkAdapt_llc_cfg11_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpTxClkAdapt_Link155Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpTxClkAdapt_Link152Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160_main/DtpTxClkAdapt_ctrl_cfg_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpTxClkAdapt_Link146Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92_main/DtpTxClkAdapt_ate_cfg3_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150_main/DtpTxClkAdapt_ate_cfg7_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpTxClkAdapt_Link58Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158_main/DtpTxClkAdapt_llc_cfg15_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145_main/DtpTxClkAdapt_llc_cfg6_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpTxClkAdapt_Link160Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58_main/DtpTxClkAdapt_ate_cfg0_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpTxClkAdapt_Link159Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpTxClkAdapt_Link157Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146_main/DtpTxClkAdapt_ate_cfg4_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpTxClkAdapt_Link145Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25_main/DtpTxClkAdapt_llc_cfg4_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148_main/DtpTxClkAdapt_ate_cfg6_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155_main/DtpTxClkAdapt_llc_cfg12_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpTxClkAdapt_Link55Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152_main/DtpTxClkAdapt_llc_cfg8_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159_main/DtpTxClkAdapt_dma_cfg_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpTxClkAdapt_Link29Resp001_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29_main/DtpTxClkAdapt_umm_cfg_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpTxClkAdapt_Link148Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpTxClkAdapt_Link142Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpTxClkAdapt_Link144Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144_main/DtpTxClkAdapt_llc_cfg0_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149_main/DtpTxClkAdapt_ate_cfg5_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157_main/DtpTxClkAdapt_llc_cfg13_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpTxClkAdapt_Link25Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55_main/DtpTxClkAdapt_ate_cfg2_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143_main/DtpTxClkAdapt_llc_cfg3_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpTxClkAdapt_Link151Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154_main/DtpTxClkAdapt_llc_cfg9_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpTxClkAdapt_Link143Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24_main/DtpTxClkAdapt_llc_cfg7_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpTxClkAdapt_Link162Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpTxClkAdapt_Link149Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpTxClkAdapt_Link24Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpTxClkAdapt_Link147Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpTxClkAdapt_Link153Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147_main/DtpTxClkAdapt_llc_cfg5_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpTxClkAdapt_Link154Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpTxClkAdapt_Link92Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpTxClkAdapt_Link141Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142_main/DtpTxClkAdapt_llc_cfg2_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162_main/DtpTxClkAdapt_ate_cfg1_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141_main/DtpTxClkAdapt_llc_cfg1_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151_main/DtpTxClkAdapt_llc_cfg10_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156_main/DtpTxClkAdapt_llc_cfg14_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpTxClkAdapt_Link158Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpTxClkAdapt_Link150Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpTxClkAdapt_Link156Resp_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153_main/DtpTxClkAdapt_llc_cfg11_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpTxClkAdapt_Link155Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpTxClkAdapt_Link152Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160_main/DtpTxClkAdapt_ctrl_cfg_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpTxClkAdapt_Link146Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92_main/DtpTxClkAdapt_ate_cfg3_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150_main/DtpTxClkAdapt_ate_cfg7_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpTxClkAdapt_Link58Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158_main/DtpTxClkAdapt_llc_cfg15_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145_main/DtpTxClkAdapt_llc_cfg6_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpTxClkAdapt_Link160Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58_main/DtpTxClkAdapt_ate_cfg0_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpTxClkAdapt_Link159Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpTxClkAdapt_Link157Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146_main/DtpTxClkAdapt_ate_cfg4_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpTxClkAdapt_Link145Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25_main/DtpTxClkAdapt_llc_cfg4_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148_main/DtpTxClkAdapt_ate_cfg6_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155_main/DtpTxClkAdapt_llc_cfg12_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpTxClkAdapt_Link55Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152_main/DtpTxClkAdapt_llc_cfg8_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159_main/DtpTxClkAdapt_dma_cfg_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpTxClkAdapt_Link29Resp001_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29_main/DtpTxClkAdapt_umm_cfg_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpTxClkAdapt_Link148Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpTxClkAdapt_Link142Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpTxClkAdapt_Link144Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144_main/DtpTxClkAdapt_llc_cfg0_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149_main/DtpTxClkAdapt_ate_cfg5_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157_main/DtpTxClkAdapt_llc_cfg13_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpTxClkAdapt_Link25Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55_main/DtpTxClkAdapt_ate_cfg2_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143_main/DtpTxClkAdapt_llc_cfg3_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpTxClkAdapt_Link151Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154_main/DtpTxClkAdapt_llc_cfg9_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpTxClkAdapt_Link143Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24_main/DtpTxClkAdapt_llc_cfg7_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpTxClkAdapt_Link162Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpTxClkAdapt_Link149Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpTxClkAdapt_Link24Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpTxClkAdapt_Link147Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpTxClkAdapt_Link153Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147_main/DtpTxClkAdapt_llc_cfg5_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpTxClkAdapt_Link154Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpTxClkAdapt_Link92Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpTxClkAdapt_Link141Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142_main/DtpTxClkAdapt_llc_cfg2_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162_main/DtpTxClkAdapt_ate_cfg1_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141_main/DtpTxClkAdapt_llc_cfg1_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151_main/DtpTxClkAdapt_llc_cfg10_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156_main/DtpTxClkAdapt_llc_cfg14_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpTxClkAdapt_Link158Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpTxClkAdapt_Link150Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpTxClkAdapt_Link156Resp_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162Resp_main/DtpRxClkAdapt_ate_cfg1_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpRxClkAdapt_Link154_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159Resp_main/DtpRxClkAdapt_dma_cfg_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142Resp_main/DtpRxClkAdapt_llc_cfg2_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152Resp_main/DtpRxClkAdapt_llc_cfg8_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpRxClkAdapt_Link159_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpRxClkAdapt_Link153_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149Resp_main/DtpRxClkAdapt_ate_cfg5_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29Resp001_main/DtpRxClkAdapt_umm_cfg_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144Resp_main/DtpRxClkAdapt_llc_cfg0_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpRxClkAdapt_Link145_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpRxClkAdapt_Link25_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55Resp_main/DtpRxClkAdapt_ate_cfg2_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpRxClkAdapt_Link144_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpRxClkAdapt_Link160_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpRxClkAdapt_Link151_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143Resp_main/DtpRxClkAdapt_llc_cfg3_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154Resp_main/DtpRxClkAdapt_llc_cfg9_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpRxClkAdapt_Link141_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpRxClkAdapt_Link148_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24Resp_main/DtpRxClkAdapt_llc_cfg7_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpRxClkAdapt_Link156_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151Resp_main/DtpRxClkAdapt_llc_cfg10_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147Resp_main/DtpRxClkAdapt_llc_cfg5_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141Resp_main/DtpRxClkAdapt_llc_cfg1_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148Resp_main/DtpRxClkAdapt_ate_cfg6_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpRxClkAdapt_Link58_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpRxClkAdapt_Link146_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpRxClkAdapt_Link142_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpRxClkAdapt_Link55_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpRxClkAdapt_Link162_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpRxClkAdapt_Link149_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpRxClkAdapt_Link152_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156Resp_main/DtpRxClkAdapt_llc_cfg14_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpRxClkAdapt_Link147_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpRxClkAdapt_Link157_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpRxClkAdapt_Link24_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160Resp_main/DtpRxClkAdapt_ctrl_cfg_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153Resp_main/DtpRxClkAdapt_llc_cfg11_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpRxClkAdapt_Link150_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpRxClkAdapt_Link92_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpRxClkAdapt_Link29_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92Resp_main/DtpRxClkAdapt_ate_cfg3_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145Resp_main/DtpRxClkAdapt_llc_cfg6_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150Resp_main/DtpRxClkAdapt_ate_cfg7_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158Resp_main/DtpRxClkAdapt_llc_cfg15_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58Resp_main/DtpRxClkAdapt_ate_cfg0_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpRxClkAdapt_Link158_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146Resp_main/DtpRxClkAdapt_ate_cfg4_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155Resp_main/DtpRxClkAdapt_llc_cfg12_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157Resp_main/DtpRxClkAdapt_llc_cfg13_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpRxClkAdapt_Link155_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25Resp_main/DtpRxClkAdapt_llc_cfg4_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpRxClkAdapt_Link143_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153_main/DtpTxClkAdapt_llc_cfg11_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpTxClkAdapt_Link155Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpTxClkAdapt_Link152Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160_main/DtpTxClkAdapt_ctrl_cfg_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpTxClkAdapt_Link146Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92_main/DtpTxClkAdapt_ate_cfg3_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150_main/DtpTxClkAdapt_ate_cfg7_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpTxClkAdapt_Link58Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158_main/DtpTxClkAdapt_llc_cfg15_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145_main/DtpTxClkAdapt_llc_cfg6_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpTxClkAdapt_Link160Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58_main/DtpTxClkAdapt_ate_cfg0_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpTxClkAdapt_Link159Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpTxClkAdapt_Link157Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146_main/DtpTxClkAdapt_ate_cfg4_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpTxClkAdapt_Link145Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25_main/DtpTxClkAdapt_llc_cfg4_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148_main/DtpTxClkAdapt_ate_cfg6_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155_main/DtpTxClkAdapt_llc_cfg12_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpTxClkAdapt_Link55Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152_main/DtpTxClkAdapt_llc_cfg8_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159_main/DtpTxClkAdapt_dma_cfg_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpTxClkAdapt_Link29Resp001_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29_main/DtpTxClkAdapt_umm_cfg_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpTxClkAdapt_Link148Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpTxClkAdapt_Link142Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpTxClkAdapt_Link144Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144_main/DtpTxClkAdapt_llc_cfg0_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149_main/DtpTxClkAdapt_ate_cfg5_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157_main/DtpTxClkAdapt_llc_cfg13_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpTxClkAdapt_Link25Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55_main/DtpTxClkAdapt_ate_cfg2_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143_main/DtpTxClkAdapt_llc_cfg3_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpTxClkAdapt_Link151Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154_main/DtpTxClkAdapt_llc_cfg9_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpTxClkAdapt_Link143Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24_main/DtpTxClkAdapt_llc_cfg7_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpTxClkAdapt_Link162Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpTxClkAdapt_Link149Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpTxClkAdapt_Link24Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpTxClkAdapt_Link147Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpTxClkAdapt_Link153Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147_main/DtpTxClkAdapt_llc_cfg5_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpTxClkAdapt_Link154Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpTxClkAdapt_Link92Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpTxClkAdapt_Link141Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142_main/DtpTxClkAdapt_llc_cfg2_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162_main/DtpTxClkAdapt_ate_cfg1_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141_main/DtpTxClkAdapt_llc_cfg1_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151_main/DtpTxClkAdapt_llc_cfg10_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156_main/DtpTxClkAdapt_llc_cfg14_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpTxClkAdapt_Link158Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpTxClkAdapt_Link150Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpTxClkAdapt_Link156Resp_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162Resp_main/DtpRxClkAdapt_ate_cfg1_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpRxClkAdapt_Link154_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159Resp_main/DtpRxClkAdapt_dma_cfg_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142Resp_main/DtpRxClkAdapt_llc_cfg2_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152Resp_main/DtpRxClkAdapt_llc_cfg8_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpRxClkAdapt_Link159_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpRxClkAdapt_Link153_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149Resp_main/DtpRxClkAdapt_ate_cfg5_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29Resp001_main/DtpRxClkAdapt_umm_cfg_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144Resp_main/DtpRxClkAdapt_llc_cfg0_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpRxClkAdapt_Link145_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpRxClkAdapt_Link25_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55Resp_main/DtpRxClkAdapt_ate_cfg2_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpRxClkAdapt_Link144_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpRxClkAdapt_Link160_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpRxClkAdapt_Link151_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143Resp_main/DtpRxClkAdapt_llc_cfg3_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154Resp_main/DtpRxClkAdapt_llc_cfg9_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpRxClkAdapt_Link141_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpRxClkAdapt_Link148_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24Resp_main/DtpRxClkAdapt_llc_cfg7_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpRxClkAdapt_Link156_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151Resp_main/DtpRxClkAdapt_llc_cfg10_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147Resp_main/DtpRxClkAdapt_llc_cfg5_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141Resp_main/DtpRxClkAdapt_llc_cfg1_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148Resp_main/DtpRxClkAdapt_ate_cfg6_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpRxClkAdapt_Link58_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpRxClkAdapt_Link146_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpRxClkAdapt_Link142_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpRxClkAdapt_Link55_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpRxClkAdapt_Link162_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpRxClkAdapt_Link149_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpRxClkAdapt_Link152_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156Resp_main/DtpRxClkAdapt_llc_cfg14_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpRxClkAdapt_Link147_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpRxClkAdapt_Link157_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpRxClkAdapt_Link24_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160Resp_main/DtpRxClkAdapt_ctrl_cfg_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153Resp_main/DtpRxClkAdapt_llc_cfg11_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpRxClkAdapt_Link150_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpRxClkAdapt_Link92_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpRxClkAdapt_Link29_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92Resp_main/DtpRxClkAdapt_ate_cfg3_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145Resp_main/DtpRxClkAdapt_llc_cfg6_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150Resp_main/DtpRxClkAdapt_ate_cfg7_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158Resp_main/DtpRxClkAdapt_llc_cfg15_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58Resp_main/DtpRxClkAdapt_ate_cfg0_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpRxClkAdapt_Link158_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146Resp_main/DtpRxClkAdapt_ate_cfg4_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155Resp_main/DtpRxClkAdapt_llc_cfg12_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157Resp_main/DtpRxClkAdapt_llc_cfg13_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpRxClkAdapt_Link155_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25Resp_main/DtpRxClkAdapt_llc_cfg4_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpRxClkAdapt_Link143_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162Resp_main/DtpRxClkAdapt_ate_cfg1_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpRxClkAdapt_Link154_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159Resp_main/DtpRxClkAdapt_dma_cfg_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142Resp_main/DtpRxClkAdapt_llc_cfg2_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152Resp_main/DtpRxClkAdapt_llc_cfg8_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpRxClkAdapt_Link159_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpRxClkAdapt_Link153_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149Resp_main/DtpRxClkAdapt_ate_cfg5_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29Resp001_main/DtpRxClkAdapt_umm_cfg_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144Resp_main/DtpRxClkAdapt_llc_cfg0_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpRxClkAdapt_Link145_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpRxClkAdapt_Link25_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55Resp_main/DtpRxClkAdapt_ate_cfg2_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpRxClkAdapt_Link144_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpRxClkAdapt_Link160_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpRxClkAdapt_Link151_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143Resp_main/DtpRxClkAdapt_llc_cfg3_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154Resp_main/DtpRxClkAdapt_llc_cfg9_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpRxClkAdapt_Link141_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpRxClkAdapt_Link148_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24Resp_main/DtpRxClkAdapt_llc_cfg7_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpRxClkAdapt_Link156_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151Resp_main/DtpRxClkAdapt_llc_cfg10_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147Resp_main/DtpRxClkAdapt_llc_cfg5_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141Resp_main/DtpRxClkAdapt_llc_cfg1_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148Resp_main/DtpRxClkAdapt_ate_cfg6_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpRxClkAdapt_Link58_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpRxClkAdapt_Link146_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpRxClkAdapt_Link142_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpRxClkAdapt_Link55_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpRxClkAdapt_Link162_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpRxClkAdapt_Link149_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpRxClkAdapt_Link152_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156Resp_main/DtpRxClkAdapt_llc_cfg14_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpRxClkAdapt_Link147_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpRxClkAdapt_Link157_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpRxClkAdapt_Link24_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160Resp_main/DtpRxClkAdapt_ctrl_cfg_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153Resp_main/DtpRxClkAdapt_llc_cfg11_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpRxClkAdapt_Link150_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpRxClkAdapt_Link92_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpRxClkAdapt_Link29_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92Resp_main/DtpRxClkAdapt_ate_cfg3_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145Resp_main/DtpRxClkAdapt_llc_cfg6_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150Resp_main/DtpRxClkAdapt_ate_cfg7_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158Resp_main/DtpRxClkAdapt_llc_cfg15_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58Resp_main/DtpRxClkAdapt_ate_cfg0_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpRxClkAdapt_Link158_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146Resp_main/DtpRxClkAdapt_ate_cfg4_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155Resp_main/DtpRxClkAdapt_llc_cfg12_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157Resp_main/DtpRxClkAdapt_llc_cfg13_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpRxClkAdapt_Link155_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25Resp_main/DtpRxClkAdapt_llc_cfg4_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpRxClkAdapt_Link143_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153_main/DtpTxClkAdapt_llc_cfg11_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpTxClkAdapt_Link155Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpTxClkAdapt_Link152Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160_main/DtpTxClkAdapt_ctrl_cfg_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpTxClkAdapt_Link146Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92_main/DtpTxClkAdapt_ate_cfg3_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150_main/DtpTxClkAdapt_ate_cfg7_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpTxClkAdapt_Link58Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158_main/DtpTxClkAdapt_llc_cfg15_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145_main/DtpTxClkAdapt_llc_cfg6_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpTxClkAdapt_Link160Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58_main/DtpTxClkAdapt_ate_cfg0_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpTxClkAdapt_Link159Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpTxClkAdapt_Link157Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146_main/DtpTxClkAdapt_ate_cfg4_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpTxClkAdapt_Link145Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25_main/DtpTxClkAdapt_llc_cfg4_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148_main/DtpTxClkAdapt_ate_cfg6_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155_main/DtpTxClkAdapt_llc_cfg12_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpTxClkAdapt_Link55Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152_main/DtpTxClkAdapt_llc_cfg8_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159_main/DtpTxClkAdapt_dma_cfg_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpTxClkAdapt_Link29Resp001_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29_main/DtpTxClkAdapt_umm_cfg_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpTxClkAdapt_Link148Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpTxClkAdapt_Link142Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpTxClkAdapt_Link144Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144_main/DtpTxClkAdapt_llc_cfg0_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149_main/DtpTxClkAdapt_ate_cfg5_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157_main/DtpTxClkAdapt_llc_cfg13_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpTxClkAdapt_Link25Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55_main/DtpTxClkAdapt_ate_cfg2_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143_main/DtpTxClkAdapt_llc_cfg3_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpTxClkAdapt_Link151Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154_main/DtpTxClkAdapt_llc_cfg9_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpTxClkAdapt_Link143Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24_main/DtpTxClkAdapt_llc_cfg7_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpTxClkAdapt_Link162Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpTxClkAdapt_Link149Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpTxClkAdapt_Link24Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpTxClkAdapt_Link147Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpTxClkAdapt_Link153Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147_main/DtpTxClkAdapt_llc_cfg5_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpTxClkAdapt_Link154Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpTxClkAdapt_Link92Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpTxClkAdapt_Link141Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142_main/DtpTxClkAdapt_llc_cfg2_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162_main/DtpTxClkAdapt_ate_cfg1_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141_main/DtpTxClkAdapt_llc_cfg1_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151_main/DtpTxClkAdapt_llc_cfg10_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156_main/DtpTxClkAdapt_llc_cfg14_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpTxClkAdapt_Link158Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpTxClkAdapt_Link150Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpTxClkAdapt_Link156Resp_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153_main/DtpTxClkAdapt_llc_cfg11_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpTxClkAdapt_Link155Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpTxClkAdapt_Link152Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160_main/DtpTxClkAdapt_ctrl_cfg_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpTxClkAdapt_Link146Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92_main/DtpTxClkAdapt_ate_cfg3_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150_main/DtpTxClkAdapt_ate_cfg7_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpTxClkAdapt_Link58Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158_main/DtpTxClkAdapt_llc_cfg15_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145_main/DtpTxClkAdapt_llc_cfg6_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpTxClkAdapt_Link160Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58_main/DtpTxClkAdapt_ate_cfg0_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpTxClkAdapt_Link159Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpTxClkAdapt_Link157Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146_main/DtpTxClkAdapt_ate_cfg4_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpTxClkAdapt_Link145Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25_main/DtpTxClkAdapt_llc_cfg4_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148_main/DtpTxClkAdapt_ate_cfg6_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155_main/DtpTxClkAdapt_llc_cfg12_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpTxClkAdapt_Link55Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152_main/DtpTxClkAdapt_llc_cfg8_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159_main/DtpTxClkAdapt_dma_cfg_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpTxClkAdapt_Link29Resp001_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29_main/DtpTxClkAdapt_umm_cfg_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpTxClkAdapt_Link148Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpTxClkAdapt_Link142Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpTxClkAdapt_Link144Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144_main/DtpTxClkAdapt_llc_cfg0_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149_main/DtpTxClkAdapt_ate_cfg5_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157_main/DtpTxClkAdapt_llc_cfg13_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpTxClkAdapt_Link25Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55_main/DtpTxClkAdapt_ate_cfg2_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143_main/DtpTxClkAdapt_llc_cfg3_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpTxClkAdapt_Link151Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154_main/DtpTxClkAdapt_llc_cfg9_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpTxClkAdapt_Link143Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24_main/DtpTxClkAdapt_llc_cfg7_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpTxClkAdapt_Link162Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpTxClkAdapt_Link149Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpTxClkAdapt_Link24Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpTxClkAdapt_Link147Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpTxClkAdapt_Link153Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147_main/DtpTxClkAdapt_llc_cfg5_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpTxClkAdapt_Link154Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpTxClkAdapt_Link92Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpTxClkAdapt_Link141Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142_main/DtpTxClkAdapt_llc_cfg2_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162_main/DtpTxClkAdapt_ate_cfg1_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141_main/DtpTxClkAdapt_llc_cfg1_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151_main/DtpTxClkAdapt_llc_cfg10_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156_main/DtpTxClkAdapt_llc_cfg14_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpTxClkAdapt_Link158Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpTxClkAdapt_Link150Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpTxClkAdapt_Link156Resp_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162Resp_main/DtpRxClkAdapt_ate_cfg1_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpRxClkAdapt_Link154_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159Resp_main/DtpRxClkAdapt_dma_cfg_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142Resp_main/DtpRxClkAdapt_llc_cfg2_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152Resp_main/DtpRxClkAdapt_llc_cfg8_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpRxClkAdapt_Link159_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpRxClkAdapt_Link153_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149Resp_main/DtpRxClkAdapt_ate_cfg5_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29Resp001_main/DtpRxClkAdapt_umm_cfg_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144Resp_main/DtpRxClkAdapt_llc_cfg0_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpRxClkAdapt_Link145_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpRxClkAdapt_Link25_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55Resp_main/DtpRxClkAdapt_ate_cfg2_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpRxClkAdapt_Link144_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpRxClkAdapt_Link160_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpRxClkAdapt_Link151_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143Resp_main/DtpRxClkAdapt_llc_cfg3_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154Resp_main/DtpRxClkAdapt_llc_cfg9_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpRxClkAdapt_Link141_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpRxClkAdapt_Link148_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24Resp_main/DtpRxClkAdapt_llc_cfg7_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpRxClkAdapt_Link156_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151Resp_main/DtpRxClkAdapt_llc_cfg10_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147Resp_main/DtpRxClkAdapt_llc_cfg5_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141Resp_main/DtpRxClkAdapt_llc_cfg1_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148Resp_main/DtpRxClkAdapt_ate_cfg6_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpRxClkAdapt_Link58_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpRxClkAdapt_Link146_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpRxClkAdapt_Link142_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpRxClkAdapt_Link55_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpRxClkAdapt_Link162_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpRxClkAdapt_Link149_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpRxClkAdapt_Link152_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156Resp_main/DtpRxClkAdapt_llc_cfg14_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpRxClkAdapt_Link147_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpRxClkAdapt_Link157_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpRxClkAdapt_Link24_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160Resp_main/DtpRxClkAdapt_ctrl_cfg_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153Resp_main/DtpRxClkAdapt_llc_cfg11_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpRxClkAdapt_Link150_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpRxClkAdapt_Link92_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpRxClkAdapt_Link29_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92Resp_main/DtpRxClkAdapt_ate_cfg3_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145Resp_main/DtpRxClkAdapt_llc_cfg6_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150Resp_main/DtpRxClkAdapt_ate_cfg7_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158Resp_main/DtpRxClkAdapt_llc_cfg15_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58Resp_main/DtpRxClkAdapt_ate_cfg0_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpRxClkAdapt_Link158_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146Resp_main/DtpRxClkAdapt_ate_cfg4_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155Resp_main/DtpRxClkAdapt_llc_cfg12_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157Resp_main/DtpRxClkAdapt_llc_cfg13_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpRxClkAdapt_Link155_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25Resp_main/DtpRxClkAdapt_llc_cfg4_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpRxClkAdapt_Link143_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link162Resp_main/DtpRxClkAdapt_ate_cfg1_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg9_T_main/DtpRxClkAdapt_Link154_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link159Resp_main/DtpRxClkAdapt_dma_cfg_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link142Resp_main/DtpRxClkAdapt_llc_cfg2_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link152Resp_main/DtpRxClkAdapt_llc_cfg8_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/dma_cfg_T_main/DtpRxClkAdapt_Link159_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg11_T_main/DtpRxClkAdapt_Link153_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link149Resp_main/DtpRxClkAdapt_ate_cfg5_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link29Resp001_main/DtpRxClkAdapt_umm_cfg_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link144Resp_main/DtpRxClkAdapt_llc_cfg0_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg6_T_main/DtpRxClkAdapt_Link145_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg4_T_main/DtpRxClkAdapt_Link25_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link55Resp_main/DtpRxClkAdapt_ate_cfg2_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg0_T_main/DtpRxClkAdapt_Link144_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ctrl_cfg_T_main/DtpRxClkAdapt_Link160_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg10_T_main/DtpRxClkAdapt_Link151_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link143Resp_main/DtpRxClkAdapt_llc_cfg3_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link154Resp_main/DtpRxClkAdapt_llc_cfg9_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg1_T_main/DtpRxClkAdapt_Link141_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg6_T_main/DtpRxClkAdapt_Link148_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link24Resp_main/DtpRxClkAdapt_llc_cfg7_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg14_T_main/DtpRxClkAdapt_Link156_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link151Resp_main/DtpRxClkAdapt_llc_cfg10_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link147Resp_main/DtpRxClkAdapt_llc_cfg5_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link141Resp_main/DtpRxClkAdapt_llc_cfg1_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link148Resp_main/DtpRxClkAdapt_ate_cfg6_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg0_T_main/DtpRxClkAdapt_Link58_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg4_T_main/DtpRxClkAdapt_Link146_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg2_T_main/DtpRxClkAdapt_Link142_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg2_T_main/DtpRxClkAdapt_Link55_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg1_T_main/DtpRxClkAdapt_Link162_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg5_T_main/DtpRxClkAdapt_Link149_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg8_T_main/DtpRxClkAdapt_Link152_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link156Resp_main/DtpRxClkAdapt_llc_cfg14_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg5_T_main/DtpRxClkAdapt_Link147_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg13_T_main/DtpRxClkAdapt_Link157_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/llc_cfg7_T_main/DtpRxClkAdapt_Link24_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link160Resp_main/DtpRxClkAdapt_ctrl_cfg_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link153Resp_main/DtpRxClkAdapt_llc_cfg11_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/ate_cfg7_T_main/DtpRxClkAdapt_Link150_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/ate_cfg3_T_main/DtpRxClkAdapt_Link92_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/umm_cfg_T_main/DtpRxClkAdapt_Link29_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link92Resp_main/DtpRxClkAdapt_ate_cfg3_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link145Resp_main/DtpRxClkAdapt_llc_cfg6_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link150Resp_main/DtpRxClkAdapt_ate_cfg7_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link158Resp_main/DtpRxClkAdapt_llc_cfg15_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link58Resp_main/DtpRxClkAdapt_ate_cfg0_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg15_T_main/DtpRxClkAdapt_Link158_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link146Resp_main/DtpRxClkAdapt_ate_cfg4_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link155Resp_main/DtpRxClkAdapt_llc_cfg12_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/Link157Resp_main/DtpRxClkAdapt_llc_cfg13_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg12_T_main/DtpRxClkAdapt_Link155_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub0/Link25Resp_main/DtpRxClkAdapt_llc_cfg4_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}bound_sub1/llc_cfg3_T_main/DtpRxClkAdapt_Link143_Async/urs0/Isc0 true 
#max delay hbm
set CUSTOMER_HIERARCHY "u_noc_mp_ss_mp_noc_sub1_top/CACHE_TO_HBM*u_mp_cache_to_hbm_top/u_mp_cache_to_hbm/"
set_dont_touch ${CUSTOMER_HIERARCHY}clockGaters_hbm_s/ClockGater/usce4c71b1c0/instGaterCell true 
set_dont_touch ${CUSTOMER_HIERARCHY}clockGaters_Link58_main_Sys/ClockGater/usce4c71b1c0/instGaterCell true 
set_dont_touch ${CUSTOMER_HIERARCHY}clockGaters_ch_m_ch_m0/ClockGater/usce4c71b1c0/instGaterCell true 
set_dont_touch ${CUSTOMER_HIERARCHY}clockGaters_hbm_s_T/ClockGater/usce4c71b1c0/instGaterCell true 
set_dont_touch ${CUSTOMER_HIERARCHY}clockGaters_ch_m/ClockGater/usce4c71b1c0/instGaterCell true 
set_dont_touch ${CUSTOMER_HIERARCHY}clockGaters_Link58Resp001_main_Sys/ClockGater/usce4c71b1c0/instGaterCell true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpRxClkAdapt_Link58_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58Resp001_main/DtpRxClkAdapt_hbm_s_T_Async/urs0/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58_main/DtpTxClkAdapt_hbm_s_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpTxClkAdapt_Link58Resp001_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpRxClkAdapt_Link58_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58Resp001_main/DtpRxClkAdapt_hbm_s_T_Async/urs/Isc2 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58_main/DtpTxClkAdapt_hbm_s_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpTxClkAdapt_Link58Resp001_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpRxClkAdapt_Link58_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58Resp001_main/DtpRxClkAdapt_hbm_s_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58_main/DtpTxClkAdapt_hbm_s_T_Async/urs/Isc3 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpTxClkAdapt_Link58Resp001_Async/urs/Isc3 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpRxClkAdapt_Link58_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58Resp001_main/DtpRxClkAdapt_hbm_s_T_Async/urs/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpRxClkAdapt_Link58_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58Resp001_main/DtpRxClkAdapt_hbm_s_T_Async/urs0/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpRxClkAdapt_Link58_Async/urs/Isc3 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58Resp001_main/DtpRxClkAdapt_hbm_s_T_Async/urs/Isc3 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58_main/DtpTxClkAdapt_hbm_s_T_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpTxClkAdapt_Link58Resp001_Async/urs0/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpRxClkAdapt_Link58_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58Resp001_main/DtpRxClkAdapt_hbm_s_T_Async/urs2/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58_main/DtpTxClkAdapt_hbm_s_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpTxClkAdapt_Link58Resp001_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpRxClkAdapt_Link58_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58Resp001_main/DtpRxClkAdapt_hbm_s_T_Async/urs1/Isc0 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58_main/DtpTxClkAdapt_hbm_s_T_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpTxClkAdapt_Link58Resp001_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}hbm_s_T_main/DtpRxClkAdapt_Link58_Async/urs/Isc1 true 
set_dont_touch ${CUSTOMER_HIERARCHY}Link58Resp001_main/DtpRxClkAdapt_hbm_s_T_Async/urs/Isc1 true 
# inout delay
set_input_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports ate_cfg_if* -filter "direction == in"]

set_input_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports ate_cfg_if* -filter "direction == in"]

set_input_delay -clock CLK_CFG [expr ${clk_cfg_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports hbm_cfg_if.* -filter "direction == in"]

set_input_delay -clock CLK_CFG [expr ${clk_cfg_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports hbm_phy_cfg_if.* -filter "direction == in"]

set_input_delay -clock CLK_HBM [expr ${clk_hbm_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports hbm_s_if* -filter "direction == in"]

set_input_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports "i_MpNocRegime_Cm_root_Clk_En"]
set_input_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports "i_MpNocRegime_Cm_root_Clk_EnS"]
set_input_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports l2h_m_if* -filter "direction == in"]

set_input_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports llc_apb_if* -filter "direction == in"]

set_input_delay -clock CLK_CFG [expr ${clk_cfg_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports dp_Link8* -filter "direction == in"]
set_input_delay -clock CLK_CFG [expr ${MpCfgRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports "i_MpCfgRegime_Cm_root_Clk_En"]
set_input_delay -clock CLK_CFG [expr ${MpCfgRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports "i_MpCfgRegime_Cm_root_Clk_EnS"]

set_input_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports umm_cfg_if.* -filter "direction == in"]

set_input_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_internal_comb_ARRIVAL_PERCENT/100.0)] [get_ports dp_Link6* -filter "direction == in"]
set_input_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*($arteris_internal_comb_ARRIVAL_PERCENT/100.0)] [get_ports dp_Link7* -filter "direction == in"]

set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports ate_cfg_if* -filter "direction == out"]

set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports ate_s_if* -filter "direction == out"]

set_output_delay -clock CLK_CFG [expr ${clk_cfg_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports hbm_cfg_if.* -filter "direction == out"]

set_output_delay -clock CLK_CFG [expr ${clk_cfg_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports hbm_phy_cfg_if.* -filter "direction == out"]

set_output_delay -clock CLK_HBM [expr ${clk_hbm_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports hbm_s_if* -filter "direction == out"]

set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports "i_MpNocRegime_Cm_root_Pwr_Idle"]
set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports "i_MpNocRegime_Cm_root_Pwr_WakeUp"]
set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports l2h_m_if* -filter "direction == out"]

set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports llc_apb_if* -filter "direction == out"]

set_output_delay -clock CLK_CFG [expr ${clk_cfg_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports dp_Link8* -filter "direction == out"]
set_output_delay -clock CLK_CFG [expr ${MpCfgRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports "i_MpCfgRegime_Cm_root_Pwr_Idle"]
set_output_delay -clock CLK_CFG [expr ${MpCfgRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports "i_MpCfgRegime_Cm_root_Pwr_WakeUp"]

set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports umm_cfg_if.* -filter "direction == out"]

set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_internal_comb_REQUIRED_PERCENT/100.0))] [get_ports dp_Link6* -filter "direction == out"]
set_output_delay -clock CLK_NOC [expr ${MpNocRegime_Cm_root_P}*(1-($arteris_internal_comb_REQUIRED_PERCENT/100.0))] [get_ports dp_Link7* -filter "direction == out"]


set_input_delay -clock CLK_NOC [expr ${clk_noc_P}*3.0*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports *_addr_bd_* -filter "direction == in"]
set_output_delay -clock CLK_NOC [expr ${clk_noc_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports *_corpaddr1 -filter "direction == out"]
set_input_delay -clock CLK_NOC [expr ${clk_noc_P}*3.0*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports "hide_en"]
set_output_delay -clock CLK_NOC [expr ${clk_noc_P}*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports "dma_ack"]
set_input_delay -clock CLK_NOC [expr ${clk_noc_P}*2.0*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports irq_* -filter "direction == in"]
set_output_delay -clock CLK_NOC [expr ${clk_noc_P}*2.0*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports irq_* -filter "direction == out"]
set_output_delay -clock CLK_NOC [expr ${clk_noc_P}*1.0*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports dma_ack -filter "direction == out"]


#complete input/output delay setting on 2022/01/14
set_input_delay -clock CLK_NOC [expr ${clk_noc_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports ate_s_if* -filter "direction == in"]

set_input_delay -clock CLK_NOC [expr ${clk_noc_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports mp_pos*]
#set_input_delay -clock CLK_NOC [expr ${clk_noc_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports tm]
set_input_delay -clock CLK_NOC [expr ${clk_noc_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports rst_n_noc]
set_input_delay -clock CLK_HBM [expr ${clk_hbm_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports rst_n_hbm]

set_input_delay -clock CLK_NOC [expr ${clk_noc_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports i_MpNocRegime_Cm_root_Clk_RetRstN]
set_input_delay -clock CLK_NOC [expr ${clk_noc_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports i_MpNocRegime_Cm_root_Clk_RstN]
#set_input_delay -clock CLK_NOC [expr ${clk_noc_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports i_MpNocRegime_Cm_root_Clk_Tm]
set_input_delay -clock CLK_CFG [expr ${clk_cfg_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports i_MpCfgRegime_Cm_root_Clk_RetRstN]
set_input_delay -clock CLK_CFG [expr ${clk_cfg_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports i_MpCfgRegime_Cm_root_Clk_RstN]
#set_input_delay -clock CLK_CFG [expr ${clk_cfg_P}*($arteris_dflt_ARRIVAL_PERCENT/100.0)] [get_ports i_MpCfgRegime_Cm_root_Clk_Tm]

set_output_delay -clock CLK_NOC [expr ${clk_noc_P}*3.0*(1-($arteris_dflt_REQUIRED_PERCENT/100.0))] [get_ports gate_mode* -filter "direction == out"]
