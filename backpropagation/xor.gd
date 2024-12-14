extends Control

var x = [[0.0,0.0], [1.0,0.0], [0.0,1.0], [1.0,1.0]]
var y = [0, 1, 1, 0]


func _ready():
	randomize()
	#var x = [[0.0, 1.0], [0.1, 1.0], ...]  # Reemplaza con tu array de datos
	#var y = [0, 0, 0, ...]  # Reemplaza con tu array de etiquetas
	var n = randi()  % 4
	var red_neuronal = RedNeuronal.new(x, y)
	prints(red_neuronal.clasificacion(x[n][0], x[n][1]))
	red_neuronal.entrenamiento()
	print("Entrenamiento completado")
	
	
	for k in range(4):
	
		var forward = red_neuronal.clasificacion(x[k][0], x[k][1])
		var presicion = y[k]
		var redondear = round(forward )
		if redondear == presicion :
			prints(k,"la red acerto felicidades :)  redondeo ", redondear, " el dato :" ,y[k] , " la salida bruta : " ,forward)
		else:
			push_warning("la red erro prueba entrenar mas :)  redondeo ", redondear, " el dato :" ,y[k] , " la salida bruta : " ,forward)
			pass





class RedNeuronal:
	var x
	var y
	var pesos1 = []
	var sesgos1 = []
	var pesos2 = []
	var sesgos2 = []

	func _init(x, y):
		self.x = x
		self.y = y

		# Inicialización de los pesos y sesgos
		for i in range(4):
			self.pesos1.append(randf())
		for i in range(2):
			self.sesgos1.append(randf())
		for i in range(2):
			self.pesos2.append(randf())
		self.sesgos2.append(randf())

	func entrenamiento(tasa_aprendizaje = 0.3, epocas = 4000):
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

				# Cálculo del error cuadrático
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
				self.pesos1[0] -= tasa_aprendizaje * gradiente_p11
				self.pesos1[1] -= tasa_aprendizaje * gradiente_p12
				self.pesos1[2] -= tasa_aprendizaje * gradiente_p13
				self.pesos1[3] -= tasa_aprendizaje * gradiente_p14
				self.sesgos1[0] -= tasa_aprendizaje * gradiente_sesgo11
				self.sesgos1[1] -= tasa_aprendizaje * gradiente_sesgo12
				self.pesos2[0] -= tasa_aprendizaje * gradiente_p21
				self.pesos2[1] -= tasa_aprendizaje * gradiente_p22
				self.sesgos2[0] -= tasa_aprendizaje * gradiente_sesgo21
			
			#print(error)

	func clasificacion(x1, x2):
		var suma_o1 = x1 * self.pesos1[0] + x2 * self.pesos1[2] + self.sesgos1[0]
		var suma_o2 = x1 * self.pesos1[1] + x2 * self.pesos1[3] + self.sesgos1[1]
		var salida_o1 = 1.0 / (1.0 + exp(-suma_o1))
		var salida_o2 = 1.0 / (1.0 + exp(-suma_o2))
		var suma_s = salida_o1 * self.pesos2[0] + salida_o2 * self.pesos2[1] + self.sesgos2[0]
		var y_gorro = 1.0 / (1.0 + exp(-suma_s))
		return y_gorro#round(y_gorro)
