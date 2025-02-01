set scenario turbo.ss0p6125c_WC.RC_MAX
set ip [remove_from_collection [all_inputs] [get_ports gclk]]

if {[shell_is_in_topographical_mode]} {
	create_scenario $scenario
	create_clock -name MAIN -period 1.666 [get_ports gclk]
	set_input_delay 0.75 -clock MAIN [get_ports -all_inputs]
	set_output_delay 0.75 -clock MAIN [get_ports -all_outputs]
	set_load 0.004 [get_pins -all_outputs]
	set_max_fanout 200 [current_design]
	set_max_capacitance 100[current_design]
	set_max_transition 0.1[current_design]
	set_voltage 0.6 -object_list VDD
	set_voltage 0.72 -object_list VDDH  
	set_voltage 0.0 -object_list VSS
	set_operating_conditions -max ss0.6v125c
	set_tluplus_files -max_tluplus /home1/14_nmts/14_nmts/tech/star_rc/max/saed14nm_1p9m_Cmax.tluplus -tech2itf_map /home1/14_nmts/14_nmts/tech/star_rc/max/saed14nm_tf_itf_tluplus.map
	check_tlu_plus_files
	set_scenario_option -scenario turbo.ss0.6v125c -setup true -hold false -leakage_power false
	report_scenario_options
} else {
	create_clock -name MAIN -period 1.666 [get_ports gclk]
	set_input_delay 0.75 -clock MAIN [get_ports [all_inputs]]
	set_output_delay 0.75 -clock MAIN [get_ports [all_outputs]]
	set_load 0.004 [get_ports [all_outputs]]
	set_max_fanout 200 [current_design]
	set_max_capacitance 100 [current_design]
	set_max_transition 0.1 [current_design]
	set_voltage 0.6 -object_list VDD
	set_voltage 0.72 -object_list VDDH
	set_voltage 0.0 -object_list VSS
	set_operating_conditions -max ss0p6v125c
}
