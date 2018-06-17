transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Mateus Luiz/Documents/OAC/oac-trab/trab-6/mem_instrucoes.vhd}
vcom -93 -work work {C:/Users/Mateus Luiz/Documents/OAC/oac-trab/trab-6/pc_adder.vhd}
vcom -93 -work work {C:/Users/Mateus Luiz/Documents/OAC/oac-trab/trab-6/full_component.vhd}
vcom -93 -work work {C:/Users/Mateus Luiz/Documents/OAC/oac-trab/trab-6/pc_register.vhd}

vcom -93 -work work {C:/Users/Mateus Luiz/Documents/OAC/oac-trab/trab-6/full_component_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  full_component_test

add wave *
view structure
view signals
run -all
