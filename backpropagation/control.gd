extends Control

@onready var ncar = $autos
var nodes = []
var total_entrenado = 0 
var red_neuronal
var epoca = 30
# Datos de 121 carros -> [Antigüedad, costo de salida al mercado]

var x : Array = [[0.0, 1.0], [0.1, 1.0], [0.2, 1.0], [0.3, 1.0], [0.4, 1.0],
	[0.5, 1.0], [0.6, 1.0], [0.7, 1.0], [0.8, 1.0], [0.9, 1.0],
	[1.0, 1.0], [0.0, 0.9], [0.1, 0.9], [0.2, 0.9], [0.3, 0.9],
	[0.4, 0.9], [0.5, 0.9], [0.6, 0.9], [0.7, 0.9], [0.8, 0.9],
	[0.9, 0.9], [1.0, 0.9], [0.0, 0.8], [0.1, 0.8], [0.2, 0.8],
	[0.3, 0.8], [0.4, 0.8], [0.5, 0.8], [0.6, 0.8], [0.7, 0.8],
	[0.8, 0.8], [0.9, 0.8], [1.0, 0.8], [0.0, 0.7], [0.1, 0.7],
	[0.2, 0.7], [0.3, 0.7], [0.4, 0.7], [0.5, 0.7], [0.6, 0.7],
	[0.7, 0.7], [0.8, 0.7], [0.9, 0.7], [1.0, 0.7], [0.0, 0.6],
	[0.1, 0.6], [0.2, 0.6], [0.3, 0.6], [0.4, 0.6], [0.5, 0.6],
	[0.6, 0.6], [0.7, 0.6], [0.8, 0.6], [0.9, 0.6], [1.0, 0.6],
	[0.0, 0.5], [0.1, 0.5], [0.2, 0.5], [0.3, 0.5], [0.4, 0.5],
	[0.5, 0.5], [0.6, 0.5], [0.7, 0.5], [0.8, 0.5], [0.9, 0.5],
	[1.0, 0.5], [0.0, 0.4], [0.1, 0.4], [0.2, 0.4], [0.3, 0.4],
	[0.4, 0.4], [0.5, 0.4], [0.6, 0.4], [0.7, 0.4], [0.8, 0.4],
	[0.9, 0.4], [1.0, 0.4], [0.0, 0.3], [0.1, 0.3], [0.2, 0.3],
	[0.3, 0.3], [0.4, 0.3], [0.5, 0.3], [0.6, 0.3], [0.7, 0.3],
	[0.8, 0.3], [0.9, 0.3], [1.0, 0.3], [0.0, 0.2], [0.1, 0.2],
	[0.2, 0.2], [0.3, 0.2], [0.4, 0.2], [0.5, 0.2], [0.6, 0.2],
	[0.7, 0.2], [0.8, 0.2], [0.9, 0.2], [1.0, 0.2], [0.0, 0.1],
	[0.1, 0.1], [0.2, 0.1], [0.3, 0.1], [0.4, 0.1], [0.5, 0.1],
	[0.6, 0.1], [0.7, 0.1], [0.8, 0.1], [0.9, 0.1], [1.0, 0.1],
	[0.0, 0.0], [0.1, 0.0], [0.2, 0.0], [0.3, 0.0], [0.4, 0.0],
	[0.5, 0.0], [0.6, 0.0], [0.7, 0.0], [0.8, 0.0], [0.9, 0.0],
	[1.0, 0.0]]

# 0 : normal    1 : coleccionable

var y = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0,
	0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0,
	0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0,
	0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0,
	0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0,
	0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0,
	0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0,
	0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1]
 #Los datos x y y no se incluyen aquí porque ya los tienes definidos.

func _ready():
	
	
	var long = 0
	for a in range(x.size()):
		for l in range(1):
			if y[long] == 1:
				var car = load("res://car/coleccion.tscn").instantiate()
				ncar.add_child(car)
				nodes.append(car)
			else:
				var car = load("res://car/comun.tscn").instantiate()
				ncar.add_child(car)
				nodes.append(car)
		long += 1
	
	
	
	
	
	
	
	
	randomize()
	#var x = [[0.0, 1.0], [0.1, 1.0], ...]  # Reemplaza con tu array de datos
	#var y = [0, 0, 0, ...]  # Reemplaza con tu array de etiquetas
	var n = randi()  % 100
	red_neuronal = RedNeuronal.new(x, y , epoca)
	prints(red_neuronal.clasificacion(x[n][0], x[n][1]))
	#red_neuronal.entrenamiento()
	#print("Entrenamiento completado")
	#
	#
	#for k in range(100):
		#var forward = red_neuronal.clasificacion(x[k][0], x[k][1])
		#var presicion = y[k]
		#var redondear = round(forward )
		#if redondear == presicion :
			#prints("la red acerto felicidades :)  redondeo ", redondear, " el dato :" ,y[k] , " la salida bruta : " ,forward)
		#else:
			#push_warning("la red erro prueba entrenar mas :)  redondeo ", redondear, " el dato :" ,y[k] , " la salida bruta : " ,forward)
			#pass


func prueba(nn):
	var error = 0
	for k in range(121):
		var forward = nn.clasificacion(x[k][0], x[k][1])
		var presicion = y[k]
		var redondear = round(forward )
		if redondear == presicion :
			nodes[k].valor = presicion
			nodes[k].obtenido = forward
			nodes[k].mal.visible = false
			nodes[k].bien.visible = true
			prints("la red acerto felicidades :)  redondeo ", redondear, " el dato :" ,y[k] , " la salida bruta : " ,forward)
		else:
			nodes[k].valor = presicion
			nodes[k].obtenido = forward
			nodes[k].mal.visible = true
			nodes[k].bien.visible = false
			push_warning("la red erro prueba entrenar mas :)  redondeo ", redondear, " el dato :" ,y[k] , " la salida bruta : " ,forward)
			error += 1
	$Label.text = " total de errores de la prueba es de: ( " + str(error) + " ) , la precicion maxima es 6 "









class RedNeuronal:
	var x
	var y
	var pesos1 = []
	var sesgos1 = []
	var pesos2 = []
	var sesgos2 = []
	var epoca = 0
	func _init(x, y, epoca):
		self.x = x
		self.y = y
		self.epoca = epoca
		# Inicialización de los pesos y sesgos
		for i in range(4):
			self.pesos1.append(randf())
		for i in range(2):
			self.sesgos1.append(randf())
		for i in range(2):
			self.pesos2.append(randf())
		self.sesgos2.append(randf())

	func entrenamiento(tasa_aprendizaje = 0.4, epocas = epoca):
		var timer_local = Time.get_ticks_usec()
		for k in range(epocas):
			
			var error = 0.0
			for i in range(self.x.size()):
				# Entradas a las neuronas sigmoides ocultas
				var suma_o1 = self.x[i][0] * self.pesos1[0] + self.x[i][1] * self.pesos1[2] + self.sesgos1[0]
				var suma_o2 = self.x[i][0] * self.pesos1[1] + self.x[i][1] * self.pesos1[3] + self.sesgos1[1]
				
				# Salidas de las neuronas sigmoides ocultas
				var salida_o1 = 1.0 / (1.0 + exp(-suma_o1))
				var salida_o2 = 1.0 / (1.0 + exp(-suma_o2))
				
				# Entrada de la neurona sigmoide de la capa de salida
				var suma_s = salida_o1 * self.pesos2[0] + salida_o2 * self.pesos2[1] + self.sesgos2[0]
				
				# Salida de la red neuronal
				var y_gorro = 1.0 / (1.0 + exp(-suma_s))
				#var y_gorro = tanh(suma_s)
				#var y_gorro = 1 * (1 - suma_s)
				#var y_gorro = max(0.001, suma_s) # relu
				#var y_gorro = log(1 + exp(suma_s)) # softplus

				# Cálculo del error cuassdrático
				error += (0.5) * pow(self.y[i] - y_gorro, 2)
				
				# Cálculo de los gradientes
				var gradiente_p21 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * salida_o1
				var gradiente_p22 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * salida_o2
				var gradiente_sesgo21 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * 1.0

				var gradiente_p11 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * self.pesos2[0] * (salida_o1 * (1 - salida_o1)) * self.x[i][0]
				var gradiente_p13 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * self.pesos2[0] * (salida_o1 * (1 - salida_o1)) * self.x[i][1]
				var gradiente_sesgo11 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * self.pesos2[0] * (salida_o1 * (1 - salida_o1)) * 1.0

				var gradiente_p12 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * self.pesos2[1] * (salida_o2 * (1 - salida_o2)) * self.x[i][0]
				var gradiente_p14 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * self.pesos2[1] * (salida_o2 * (1 - salida_o2)) * self.x[i][1]
				var gradiente_sesgo12 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * self.pesos2[1] * (salida_o2 * (1 - salida_o2)) * 1.0

				# Actualización de los pesos
				for l in range(1):
					self.pesos1[0] -= tasa_aprendizaje * gradiente_p11
					self.pesos1[1] -= tasa_aprendizaje * gradiente_p12
					self.pesos1[2] -= tasa_aprendizaje * gradiente_p13
					self.pesos1[3] -= tasa_aprendizaje * gradiente_p14
					self.sesgos1[0] -= tasa_aprendizaje * gradiente_sesgo11
					self.sesgos1[1] -= tasa_aprendizaje * gradiente_sesgo12
					self.pesos2[0] -= tasa_aprendizaje * gradiente_p21
					self.pesos2[1] -= tasa_aprendizaje * gradiente_p22
					self.sesgos2[0] -= tasa_aprendizaje * gradiente_sesgo21
		prints(" el entrenamiento demoro  (" ,Time.get_ticks_usec() - timer_local,") usec en :" , epoca , " entenamientos")
			#print(error)

	func clasificacion(x1, x2):
		var suma_o1 = x1 * self.pesos1[0] + x2 * self.pesos1[2] + self.sesgos1[0]
		var suma_o2 = x1 * self.pesos1[1] + x2 * self.pesos1[3] + self.sesgos1[1]
		var salida_o1 = 1.0 / (1.0 + exp(-suma_o1))
		var salida_o2 = 1.0 / (1.0 + exp(-suma_o2))
		var suma_s = salida_o1 * self.pesos2[0] + salida_o2 * self.pesos2[1] + self.sesgos2[0]
		var y_gorro = 1.0 / (1.0 + exp(-suma_s))
		return y_gorro#round(y_gorro)





func _on_probar_pressed() -> void:
	if red_neuronal == null:
		prints("error no iniciado")
	prueba(red_neuronal)
	pass # Replace with function body.


func _on_entrenar_pressed() -> void:
	if red_neuronal == null:
		prints("error no iniciado")
	red_neuronal.entrenamiento()
	total_entrenado += epoca 
	$Label2.text = " total de entrenamientos : ( " + str(total_entrenado) + " ) "
	prueba(red_neuronal)
	pass # Replace with function body.
