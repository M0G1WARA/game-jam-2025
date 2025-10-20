extends Node2D


func decoration_show():
	$Decoration.show()
	$HUD.toggle()

func decoration_hide():
	$Decoration.hide()
	$HUD.toggle()
