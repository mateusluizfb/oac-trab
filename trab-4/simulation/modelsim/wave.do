onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /ula_vhd_tst/A
add wave -noupdate -radix decimal /ula_vhd_tst/B
add wave -noupdate -radix decimal /ula_vhd_tst/ULA_OP
add wave -noupdate -radix decimal /ula_vhd_tst/ula_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {9050 ps} {10050 ps}
