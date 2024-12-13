extends Control
#
## Datos de 121 carros -> [Antigüedad, costo de salida al mercado]
#
#x = np.array([[0.0, 1.0], [0.1, 1.0], [0.2, 1.0], [0.3, 1.0], [0.4, 1.0],
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
			  #[1.0, 0.0]])
#
## 0 : normal    1 : coleccionable
#
#y = np.array([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			  #1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			  #1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
			  #0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0,
			  #0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0,
			  #0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			  #0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0,
			  #0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0,
			  #0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0,
			  #0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0,
			  #0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1])
#
#func _ready() -> void:
## Para reproducibilidad
#np.random.seed(0)
#
#class RedNeuronal:
  #def __init__(self, x, y):
	## datos de entrenamiento
	#self.x = x
	## clase asociada a los datos de entrenamiento
	#self.y = y
	## estructura de la red e inicialización aleatoria de los pesos
	#self.pesos1 = np.random.rand(4)
	#self.sesgos1 = np.random.rand(2)
	#self.pesos2 = np.random.rand(2)
	#self.sesgos2 = np.random.rand(1)
#
  #def entrenamiento(self, tasa_aprendizaje=0.1, epocas=1000):
	## entrenamiento por k epocas
	#for k in range(epocas):
	  #error = 0
	  ## Para cada epoca k:
	  ## 1) haz propagación hacia adelante con cada instancia i
	  ## 2) calcula el error cuadrático y los gradientes
	  ## 3) actualiza los pesos
	  #for i in range(self.x.shape[0]):
		## Entradas a las neuronas sigmoides ocultas
		#suma_o1 = self.x[i][0]*self.pesos1[0] + self.x[i][1]*self.pesos1[2] + self.sesgos1[0]
		#suma_o2 = self.x[i][0]*self.pesos1[1] + self.x[i][1]*self.pesos1[3] + self.sesgos1[1]
		## Salidas de las neuronas sigmoides ocultas
		#salida_o1 =  1/(1 + np.exp(-suma_o1))
		#salida_o2 = 1/(1 + np.exp(-suma_o2))
		## Entrada de la neurona sigmoide de la capa de salida
		#suma_s = salida_o1*self.pesos2[0] + salida_o2*self.pesos2[1] + self.sesgos2[0]
		## Salida de la red neuronal
		#y_gorro = 1/(1 + np.exp(-suma_s))
#
		## Cálculo del error cuadrático
		#error += (1/2)*(self.y[i] - y_gorro)**2
#
		## Cálculo de los gradientes
		#gradiente_p21 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * salida_o1
		#gradiente_p22 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * salida_o2
		#gradiente_sesgo21 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * 1
#
		#gradiente_p11 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * \
						 #self.pesos2[0] * (salida_o1 * (1 - salida_o1)) * self.x[i][0]
		#gradiente_p13 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * \
						 #self.pesos2[0] * (salida_o1 * (1 - salida_o1)) * self.x[i][1]
		#gradiente_sesgo11 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * \
							 #self.pesos2[0] * (salida_o1 * (1 - salida_o1)) * 1
#
		#gradiente_p12 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * \
						 #self.pesos2[1] * (salida_o2 * (1 - salida_o2)) * self.x[i][0]
		#gradiente_p14 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * \
						 #self.pesos2[1] * (salida_o2 * (1 - salida_o2)) * self.x[i][1]
		#gradiente_sesgo12 = (y_gorro - self.y[i]) * (y_gorro * (1 - y_gorro)) * \
							 #self.pesos2[1] * (salida_o2 * (1 - salida_o2)) * 1
#
		## Actualización de los pesos
		#self.pesos1[0] -= tasa_aprendizaje * gradiente_p11
		#self.pesos1[1] -= tasa_aprendizaje * gradiente_p12
		#self.pesos1[2] -= tasa_aprendizaje * gradiente_p13
		#self.pesos1[3] -= tasa_aprendizaje * gradiente_p14
		#self.sesgos1[0] -= tasa_aprendizaje * gradiente_sesgo11
		#self.sesgos1[1] -= tasa_aprendizaje * gradiente_sesgo12
		#self.pesos2[0] -= tasa_aprendizaje * gradiente_p21
		#self.pesos2[1] -= tasa_aprendizaje * gradiente_p22
		#self.sesgos2[0] -= tasa_aprendizaje * gradiente_sesgo21
	  #print(error)
#
  #def clasificacion(self, x1, x2):
	## Propagación hacia adelante con la nueva instancia (x1, x2) a evaluar
	#suma_o1 = x1*self.pesos1[0] + x2*self.pesos1[2] + self.sesgos1[0]
	#suma_o2 = x1*self.pesos1[1] + x2*self.pesos1[3] + self.sesgos1[1]
	#salida_o1 = 1/(1 + np.exp(-suma_o1))
	#salida_o2 = 1/(1 + np.exp(-suma_o2))
	#suma_s = salida_o1*self.pesos2[0] + salida_o2*self.pesos2[1] + self.sesgos2[0]
	#y_gorro = 1/(1 + np.exp(-suma_s))
	#return round(y_gorro)
#
## Crea una Red Neuronal Artificial
#red_neuronal = RedNeuronal(x, y)
#red_neuronal.entrenamiento()
#
	#prints( " hola neurona ")
