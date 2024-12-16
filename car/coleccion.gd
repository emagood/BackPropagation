extends TextureRect
@onready var mal = $mal
@onready var bien = $bien
var valor = 1
var obtenido = 0


func _on_button_pressed() -> void:
	prints("mi valor es : ",valor , " - obtuve el valor : ", obtenido )
	pass # Replace with function body.
