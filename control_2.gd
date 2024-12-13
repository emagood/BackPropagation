extends Control
#
#var x = [[0.0, 1.0], [0.1, 1.0], [0.2, 1.0], [0.3, 1.0], [0.4, 1.0],
	#[0.5, 1.0], [0.6, 1.0], [0.7, 1.0], [0.8, 1.0], [0.9, 1.0],
	#[1.0, 1.0], [0.0, 0.9], [0.1, 0.9], [0.2, 0.9], [0.3, 0.9],
	#[0.4, 0.9], [0.5, 0.9], [0.6, 0.9], [0.7, 0.9], [0.8, 0.9],
	#[0.9, 0.9], [1.0, 0.9], [0.0, 0.8], [0.1, 0.8], [0.2, 0.8],
	#[0.3, 0.8], [0.4, 0.8], [0.5, 0.8], [0.6, 0.8], [0.7, 0.8],
	#[0.8, 0.8], [0.9, 0.8], [1.0, 0.8], [0.0, 0.7], [0.1, 0.7],
	#[0.2, 0.7], [0.3, 0.7], [0.4, 0.7], [0.5, 0.7], [0.6, 0.7],
	#[0.7, 0.7], [0.8, 0.7], [0.9, 0.7], [1.0, 0.7], [0.0, 0.6],
	#[0.1, 0.6], [0.2, 0.6], [0.3, 0.6], [0.4, 0.6], [0.5, 0.6],
	#[0.6, 0.6], [0.7, 0.6], [0.8, 0.6], [0.9, 0.6], [1.0, 0.6],
	#[0.0, 0.5], [0.1, 0.5], [0.2, 0.5], [0.3, 0.5], [0.4, 0.5],
	#[0.5, 0.5], [0.6, 0.5], [0.7, 0.5], [0.8, 0.5], [0.9, 0.5],
	#[1.0, 0.5], [0.0, 0.4], [0.1, 0.4], [0.2, 0.4], [0.3, 0.4],
	#[0.4, 0.4], [0.5, 0.4], [0.6, 0.4], [0.7, 0.4], [0.8, 0.4],
	#[0.9, 0.4], [1.0, 0.4], [0.0, 0.3], [0.1, 0.3], [0.2, 0.3],
	#[0.3, 0.3], [0.4, 0.3], [0.5, 0.3], [0.6, 0.3], [0.7, 0.3],
	#[0.8, 0.3], [0.9, 0.3], [1.0, 0.3], [0.0, 0.2], [0.1, 0.2],
	#[0.2, 0.2], [0.3, 0.2], [0.4, 0.2], [0.5, 0.2], [0.6, 0.2],
	#[0.7, 0.2], [0.8, 0.2], [0.9, 0.2], [1.0, 0.2], [0.0, 0.1],
	#[0.1, 0.1], [0.2, 0.1], [0.3, 0.1], [0.4, 0.1], [0.5, 0.1],
	#[0.6, 0.1], [0.7, 0.1], [0.8, 0.1], [0.9, 0.1], [1.0, 0.1],
	#[0.0, 0.0], [0.1, 0.0], [0.2, 0.0], [0.3, 0.0], [0.4, 0.0],
	#[0.5, 0.0], [0.6, 0.0], [0.7, 0.0], [0.8, 0.0], [0.9, 0.0],
	#[1.0, 0.0]]
#
## 0 : normal    1 : coleccionable
#
#var y = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	#1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	#1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
	#0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0,
	#0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0,
	#0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0,
	#0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0,
	#0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0,
	#0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0,
	#0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0,
	#0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1]
#
#
#
#
#
#class RedNeuronal:
	#var x
	#var y
	#var pesos = []
	#var sesgos = []
	#var estructura = []
#
	#func _init(x, y, estructura):
		#self.x = x
		#self.y = y
		#self.estructura = estructura
#
		## Inicialización de los pesos y sesgos para cada capa
		#for i in range(1, estructura.size()):
			#var capa_pesos = []
			#var capa_sesgos = []
			#for j in range(estructura[i]):
				#var neurona_pesos = []
				#for k in range(estructura[i - 1]):
					#neurona_pesos.append(randf())
				#capa_pesos.append(neurona_pesos)
				#capa_sesgos.append(randf())
			#self.pesos.append(capa_pesos)
			#self.sesgos.append(capa_sesgos)
#
	#func activacion(x):
		#return 1.0 / (1.0 + exp(-x))
#
	#func entrenamiento(tasa_aprendizaje = 0.1, epocas = 1000):
		#for k in range(epocas):
			#var error = 0.0
			#for i in range(self.x.size()):
				#var salida = self.propagacion_hacia_adelante(self.x[i])
				#var y_gorro = 0.0  # Declarar y_gorro aquí
				#if salida.size() > 0 and salida[-1].size() > 0:
					#y_gorro = salida[-1][0]
				#else:
					#push_error("Error: salida[-1] está vacío o no es un array")
					#continue
#
				## Cálculo del error cuadrático
				#error += (0.5) * pow(self.y[i] - y_gorro, 2)
#
				## Cálculo de los gradientes y actualización de pesos
				#self.retropropagacion(salida, y_gorro, self.y[i], tasa_aprendizaje)
#
			#print("Error en epoch ", k, ": ", error)
#
	#func propagacion_hacia_adelante(entrada):
		#var salida = []
		#var capa_entrada = entrada.duplicate()
		#salida.append(capa_entrada)
#
		#for i in range(self.pesos.size()):
			#var capa_salida = []
			#for j in range(self.pesos[i].size()):
				#var suma = self.sesgos[i][j]
				#print("Capa ", i, " Neurona ", j, " Tamaño de capa_entrada: ", capa_entrada.size(), " Tamaño de pesos: ", self.pesos[i][j].size())
				#if capa_entrada.size() == self.pesos[i][j].size():
					#for k in range(self.pesos[i][j].size()):
						#suma += capa_entrada[k] * self.pesos[i][j][k]
					#capa_salida.append(self.activacion(suma))
				#else:
					#push_error("Tamaño incompatible entre capa_entrada y pesos en la capa " + str(i))
					#return []  # Devolver lista vacía en caso de error
			#capa_entrada = capa_salida.duplicate()
			#salida.append(capa_entrada)
#
		#return salida
#
	#func retropropagacion(salida, y_gorro, y_verdadero, tasa_aprendizaje):
		#var deltas = []
		#var delta_final = (y_gorro - y_verdadero) * y_gorro * (1 - y_gorro)
		#deltas.insert(0, [delta_final])
#
		## Retropropagación de los deltas
		#for i in range(self.pesos.size() - 1, 0, -1):
			#var capa_deltas = []
			#for j in range(self.pesos[i - 1].size()):
				#var delta = 0.0
				#for k in range(self.pesos[i].size()):
					#if j < salida[i].size() and k < self.pesos[i][j].size():
						#delta += self.pesos[i][k][j] * deltas[0][k] * salida[i][j] * (1 - salida[i][j])
				#capa_deltas.append(delta)
			#deltas.insert(0, capa_deltas)
#
		## Actualización de los pesos y sesgos
		#for i in range(self.pesos.size()):
			#for j in range(self.pesos[i].size()):
				#for k in range(self.pesos[i][j].size()):
					#self.pesos[i][j][k] -= tasa_aprendizaje * deltas[i][j] * salida[i][k]
				#self.sesgos[i][j] -= tasa_aprendizaje * deltas[i][j]
#
	#func clasificacion(entrada):
		#var salida = self.propagacion_hacia_adelante(entrada)
		#var y_gorro = salida[-1][0]
		#return round(y_gorro)
#
#
#
#func _ready():
	#randomize()
	#var estructura = [12, 20, 20, 34, 50]
	#var red_neuronal = RedNeuronal.new(x, y, estructura)
	#red_neuronal.entrenamiento()
	#print("Entrenamiento completado")
