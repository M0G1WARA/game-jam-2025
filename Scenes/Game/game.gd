extends Node2D


func decoration_show(data):
	$Decoration.show()
	$Decoration.set_data(data)
	$HUD.toggle()

func decoration_hide():
	$Decoration.hide()
	$HUD.toggle()
