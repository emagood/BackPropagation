extends RefCounted

class_name ActivationFunction

var activation_func : Callable
var derivative_func : Callable

func _init(types: String = "Sigmoid") -> void:
	# Por defecto usa la función Sigmoid
	if types == "Sigmoid":
		activation_func = Callable(self, "_sigmoid")
		derivative_func = Callable(self, "_dsigmoid")
	else:
		activation_func = Callable(self, "_sigmoid")
		derivative_func = Callable(self, "_dsigmoid")

func _sigmoid(x: float) -> float:
	return 1.0 / (1.0 + exp(-x))

# Derivada de la función Sigmoid en términos de salida (y)
func _dsigmoid(y: float) -> float:
	return y * (1.0 - y)
