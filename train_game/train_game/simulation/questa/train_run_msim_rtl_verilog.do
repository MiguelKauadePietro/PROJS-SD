transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/831397/Downloads/train_game/train_game {C:/Users/831397/Downloads/train_game/train_game/train.v}
vlog -vlog01compat -work work +incdir+C:/Users/831397/Downloads/train_game/train_game {C:/Users/831397/Downloads/train_game/train_game/vga_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/831397/Downloads/train_game/train_game {C:/Users/831397/Downloads/train_game/train_game/counter.v}
vcom -93 -work work {C:/Users/831397/Downloads/train_game/train_game/vga_sync.vhd}
vcom -93 -work work {C:/Users/831397/Downloads/train_game/train_game/video_pll.vhd}

