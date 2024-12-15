extends Node
class_name MLP

var armado : Array = []
var neurona : Array = []
var structure : Array = []
var pesos : PackedFloat32Array = []
var sesgos : PackedFloat32Array = []
var total_neurona : int = 0




func _init(structure : Array , sesgo : bool = false) -> void:
	
	for neuronas in range(structure.size()):
		total_neurona += structure[neuronas]
	
	#for armar in range(structure.size()):
		#if armar < structure.size():
			#armado
		
	prints(structure , " estructura ")
	prints("total neuronas " , total_neurona)
	
	pass
