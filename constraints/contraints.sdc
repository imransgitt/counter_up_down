
##clock creation
##creates a clock of period 10ns called design_clk which is mapped to the clk in the module which is i_clk
create_clock -period 10 -name design_clk [get_ports i_clk]

##clock latency-->accounts for delay due to clock network/path from the ideal clock source to the design 
set_clock_latency 1 design_clk

##clock uncertainity-->accounts for the jitter in the clock generated
set_clock_uncertainty 0.25 design_clk

##input propogation delays-->accounts for the delays the data might experiece before entering the module which affects the setup and hold considerations
set_input_delay -max 1.5 -clock [get_clocks design_clk] [get_ports i_rst]
set_input_delay -max 1.5 -clock [get_clocks design_clk] [get_ports i_en]
set_input_delay -max 1.5 -clock [get_clocks design_clk] [get_ports i_up_down]

set_input_delay -min 0.75 -clock [get_clocks design_clk] [get_ports i_rst]
set_input_delay -min 0.75 -clock [get_clocks design_clk] [get_ports i_en]
set_input_delay -min 0.75 -clock [get_clocks design_clk] [get_ports i_up_down]


##transition delays-->accounts for the transition time taken by the te inputs
set_input_transition -max 1.25 [get_ports i_rst]
set_input_transition -max 1.25 [get_ports i_en]
set_input_transition -max 1.25 [get_ports i_up_down]

set_input_transition -min 1 [get_ports i_rst]
set_input_transition -min 1 [get_ports i_en]
set_input_transition -min 1 [get_ports i_up_down]


set_output_delay -max 2 -clock [get_clocks design_clk] [get_ports o_Q]
set_output_delay -min 1 -clock [get_clocks design_clk] [get_ports o_Q]


set_load -max 1.5 [get_ports o_Q]
set_load -min 1 [get_ports o_Q]
