extends Control
'''
################esta en desarollo aun falta mucho pero vamos ##############

Etiqueta Descripción
0	Camiseta/top
1	Pantalón
2	Jersey
3	Vestido
4	Abrigo
5	Sandalia
6	Camisa
7	Zapatillas de deporte
8	Bolsa
9	Botín
'''
# Diccionario de etiquetas con su descripción
var etiquetas = {
	0: "Camiseta/top ",
	1: "Pantalón 👖",
	2: "Jersey",
	3: "Vestido 👗",
	4: "Abrigo 👕",
	5: "Sandalia",
	6: "Camisa 🧥",
	7: "Zapatillas de deporte 👟",
	8: "Bolsa 👜",
	9: "Botín 👢"
}

var inig = NeuralNetwork
var history = ""
var load_data
var image_paths = []
var tag = []
var tag_data = []
var dir_fashion = "C:/Users/Emabe/Desktop/entrena/fashion/train/"
var max = 100# para todo cargar imagen leer el cvs y mas 
var leer = max
var real_data
var fashion = "C:/Users/Emabe/Desktop/entrena/fashion/train.csv"

func _ready():
	''' solo ia '''
	randomize()
	var discriminator_structure = [784,1280,512,320,80,10]  # estructura de ejemplo 
	var use_bias = true
	
	#var gan = IMG.new(discriminator_structure, use_bias)
	#gan.load_gan("res://data/etiqueta_img_train.bin")

	
	
	
	
	''' archivo csv'''
	
	
	var file_path = fashion # Ruta al archivo CSV
	var file = FileAccess.open(file_path, FileAccess.READ)




	if file:
		while not file.eof_reached() :
			
			if leer <= 0:
				break
			var line = file.get_line()
			var columns = line.split(",")
			var first_value = columns[0]  # primer valor de la línea
			var last_value = columns[columns.size() - 1]  # ultimo valor de la línea
			print("primer valor: ", first_value.to_int(), ", ultimo valor: ", last_value.to_int())
			tag.append(last_value.to_int()) # genero el tag en el index de la imagen
			leer -= 1
		
		file.close()
	else:
		print("el archivo no existe: ", file_path)
		
	
	'''etiquetamos '''
	for i in range(tag.size()):
		#var etiqueta = i 
		var array = etiqueta(tag[i])
		tag_data.append(array)
		print("Etiqueta: ", etiquetas[tag[i]], " Array: ", array)
	
	
	''' cargamos los archivos '''
	
	
	
	
	
	var size = 28  # Tamaño de las imagenes
	'''dir no lee en orden '''
	#dir_contents(dir_fashion , max) # cargamos los archivos primero , cargamos todo ?? 
	dir_count(dir_fashion, max)
	
	while !load_data :
		load_data = load_training_images(image_paths, size)

	print("Datos cargados: ", load_data.size())
	prints("tag cargados: " ,tag_data.size())
	prints(tag_data)
	
	inig = NeuralNetwork.new("Sigmoid", 0.33, false)
	inig.add_layer(784,512) # Example: input layer with 2 inputs, 3 neurons
	inig.add_layer(512, 64)
	#nn.add_layer(20, 20)
	inig.add_layer(64, 10)
	#nn.add_layer(3, 3)
	#inig.add_layer(64, 10) # Hidden layer to output with 1 neuron
	#inig.set_loss_function(BNNET.LossFunctions.MAE)
	#inig.activation_to_string(BNNET.ActivationFunctions.softmax)
	#inig.use_Adam(0.01)
	#inig.use_Adadelta(0.5)
	#inig.set_loss_function(BNNET.LossFunctions.CCE)
	#inig.use_Rprop(0.9)
	#inig.set_batch_size(1)
	#inig.use_NAG(0.9,0.1)
	#inig.use_Yogi(0.1)
	
	
	''' entrenamiento '''
	for li in range(20):
		for i in range(10):
			#inig.load_data("res://data/etiqueta_img_train.bin")
			trai(1,inig,load_data,tag_data,i)

		
			#inig.save_binary("res://data/etiqueta_img_train.bin")
	prints("guardamos")
	
	
	
	#loss_tri(inig,load_data , tag_data)

	

''' solo cargamos y comprobamos '''











func trai(bucle ,inig,load_data , tag_data , idex):

	var count_index =  0
	
	
	for i in range(bucle):
		

		
		prints("entrenamiento en ronda 10 por : " , i , " de tantas : " , bucle )
		for j in range(1):
			for k in range(load_data.size()):
				var load_data2 = []
				var tag_data2 = []
				var array = etiqueta(idex)
				if tag_data[k] == array and array != null:
					count_index += 1
					load_data2.append(load_data[k])
					tag_data2.append(tag_data[k])
					prints(k)
				else:
					continue
			#inig.apply_gradients(0.01)
				for h in range(1):
					#inig.set_input( load_data2[0])
					#inig.set_target( tag_data2[0])
					#inig.propagate_forward()
					var train_new = []
					var data_pass = []
					#inig.apply_gradients(0.01)
					train_new.append(load_data2[0])
					train_new.append(tag_data2[0])
					data_pass.append(train_new)
					#prints(train_new)
					#inig.propagate_backward()
					inig.train(data_pass,1000)
					#inig.propagate_backward()
					if j % 2 == 0:
						loss_tri(inig,data_pass)
						print("✨✨✨entrenando la red idex -:",idex," Iteración✨✨: ", j ," %  ✨✨porciento✨✨ de: ", k , " :✨✨ bucles✨✨")
	prints("total index " , count_index ," en modo :" ,idex )


func loss_tri(nn,train):
	nn.test(train)

		#
		#print("Loss: ", nn.get_loss(load_data2, tag_data2) , "  imagen: " , hit,".png")
		#
		#
		#var array = etiqueta(tag[hit])
		#
		#print("😊Etiqueta😊: ", etiquetas[tag[hit]], "🌟 Array 🌟: ", array)
		#prints("🚀data out clasifi🚀: ",nn.get_output()," ⭐️data⭐️ :", tag_data[0])
		#prints("⭐️num aleatorio⭐️: " ,hit )
	pass







func load_training_images(image_paths: Array, size: int) -> Array:
	var loaded_data = []
	
	for path in image_paths:
		var image = Image.new()
		var error = image.load(path)
		
		if error != OK:
			print("Failed to load image: ", path)
			continue
		
		if image.get_width() != size or image.get_height() != size:
			print("Image size does not match. Width: ", image.get_width(), " Height: ", image.get_height(), " Expected: ", size)
			continue
		
		var image_data = []
		for y in range(size):
			for x in range(size):
				var color = image.get_pixel(x, y)
				var value = color.r  # Asumiendo escala de grises, usar solo el canal rojo
				image_data.append(value)
		
		loaded_data.append(image_data)
	
	return loaded_data


func dir_count(path, count):
	for i in range(count):
		var file_name = str(i) + ".png"
		prints(file_name)
		image_paths.append(path + "/" + file_name)
	

func dir_contents(path , max):
	
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "" and max > 0:
			max -= 1
			if dir.current_is_dir():
				print("⭐️DIRECTORIO ENCONTRADO⭐️ : " + file_name)
			else:
				print("⭐ARCHIVO ENCONTRADO⭐️ : " + file_name)
				print("f⭐️EXTENCION DEL ARCHIVO⭐️: " + file_name.get_extension())

				if file_name.get_extension() == "png" or file_name.get_extension() == "jpg":
					prints("estencion gd")
					image_paths.append(path + "/" + file_name)
					prints( "⭐️DIRECTORIO⭐️  ",path + "/" + file_name)
			file_name = dir.get_next()
	else:
		print("⭐️ EDITOR FALLO : An error occurred when trying to access the path ⭐️")






func etiqueta(etiqueta: int) -> Array:
	var array_resultado = Array()
	for i in range(10):
		if i == etiqueta:
			array_resultado.append(1)
		else:
			array_resultado.append(0)
	return array_resultado














# NeuralNetwork Class
class NeuralNetwork:
	var activ_func
	var layers = []
	var learning_rate
	var debug
	
	func _init(activation_func = "Sigmoid", learning_rate = 0.01, debug = true):
		self.activ_func = ActivationFunction.new(activation_func)
		self.learning_rate = learning_rate
		self.debug = debug
	
	func add_layer(n_inputs: int, n_neurons: int):
		var layer = NeuralLayer.new(n_inputs, n_neurons, self.activ_func)
		layers.append(layer)
	
	func feed_forward(inputs: Array) -> Array:
		for i in range(len(layers)):
			inputs = layers[i].feed_forward(inputs)
			if debug:
				print("Layer %d, Output: %s" % [i+1, inputs])
		return inputs
	
	func feed_backward(targets: Array):
		if len(targets) != len(layers[-1].neurons):
			push_error("Wrong target numbers")
		
		# Calculate deltas for output layer
		for j in range(len(layers[-1].neurons)):
			var error = -(targets[j] - layers[-1].neurons[j].output)
			layers[-1].neurons[j].calculate_delta(error)
		
		if debug:
			print("Output Layer Deltas: ", layers[-1].get_deltas())
		
		# Backpropagation for hidden layers
		for l in range(len(layers) - 2, -1, -1):
			var curr_layer = layers[l]
			var next_layer = layers[l + 1]
			for i in range(len(curr_layer.neurons)):
				var total_error = 0.0
				for j in range(len(next_layer.neurons)):
					total_error += next_layer.neurons[j].delta * next_layer.neurons[j].weights[i]
				curr_layer.neurons[i].calculate_delta(total_error)
			if debug:
				print("Layer %d Deltas: %s" % [l+1, curr_layer.get_deltas()])
	
	func update_weights():
		for layer in layers:
			layer.update_weights(learning_rate)
	
	func calculate_total_error(dataset: Array) -> float:
		var total_error = 0.0
		for data in dataset:
			var inputs = data[0]
			var targets = data[1]
			var outputs = feed_forward(inputs)
			for i in range(len(targets)):
				total_error += pow(targets[i] - outputs[i], 2)
		return total_error / len(dataset)
	
	func train(dataset: Array, iterations: int = 100):
		print("\n> Training...")
		for i in range(iterations):
			for data in dataset:
				var inputs = data[0]
				var targets = data[1]
				feed_forward(inputs)
				feed_backward(targets)
				update_weights()
			var error = calculate_total_error(dataset)
			#print("Iteration %d, Error: %f" % [i+1, error])
		print("> Training Complete!")
	
		
		
	func test(dataset : Array) -> void:
		var tag_2 = 0
		print('\n> Testing...')
		print("------------------------------")  # Puedes reemplazar esto con una constante STR_REPORT_BROADER si lo deseas

	# Iterar sobre cada dato de entrada en el dataset
		for j in range(len(dataset)):
			var inputs = dataset[j][0]
			var targets = dataset[j][1]
			if debug:
				print('\n>>> data #{}'.format(j + 1))
		
		# Realizar la propagación hacia adelante para obtener los resultados
			var actual_outputs = feed_forward(inputs)
			
			if round(actual_outputs[0]) == targets[0]:
				prints("acerto")
			else:
				push_error("error la red es tonta ")
				tag_2 += 1
			print(j, inputs, actual_outputs, targets)
	
	# Calcular el error total
		var total_error = calculate_total_error(dataset)

		print("------------------------------")  # Puedes reemplazar esto con una constante STR_REPORT_BROADER si lo deseas
		print('Testing Finish. Error: ',(total_error))  # Muestra el error total
		prints("error tantas :", tag_2)


# NeuralLayer Class
class NeuralLayer:
	var neurons = []
	
	func _init(n_inputs: int, n_neurons: int, activ_func):
		for _i in range(n_neurons):
			neurons.append(Neuron.new(n_inputs, activ_func))
	
	func feed_forward(inputs: Array) -> Array:
		var outputs = []
		for neuron in neurons:
			outputs.append(neuron.calculate_output(inputs))
		return outputs
	
	func update_weights(learning_rate: float):
		for neuron in neurons:
			neuron.update_weights(learning_rate)
	
	func get_deltas():
		var deltas = []
		for neuron in neurons:
			deltas.append(neuron.delta)
		return deltas




class Neuron:

	var weights = []
	var bias = 1.0
	var output = 0.0
	var delta = 0.0
	var inputs = []
	var activation_function : ActivationFunction

	func _init(n_weights: int, activ_func: ActivationFunction) -> void:
		self.weights = []
		for _i in range(n_weights):
			weights.append(randf()) # Inicializa pesos aleatorios
		self.activation_function = activ_func

	func calculate_output(inputs: Array) -> float:
		self.inputs = inputs
		var total = bias
		for i in range(len(inputs)):
			total += inputs[i] * weights[i]
		output = activation_function.activation_func.call(total)  # Llama correctamente a la función de activación
		return output

	func calculate_delta(error: float) -> void:
		delta = error * activation_function.derivative_func.call(output)  # Llama correctamente a la derivada

	func update_weights(learning_rate: float) -> void:
		for i in range(len(weights)):
			weights[i] -= learning_rate * delta * inputs[i]
		bias -= learning_rate * delta



#
func _ready3() -> void:
	
	
	var data_new = []
	prints("funca test 3")
	var nn = NeuralNetwork.new("Sigmoid", 0.3, false)
	nn.add_layer(2, 2) # Example: input layer with 2 inputs, 3 neurons
	#nn.add_layer(2, 3)
	#nn.add_layer(20, 20)
	#nn.add_layer(3, 4)
	#nn.add_layer(3, 3)
	nn.add_layer(2, 1) # Hidden layer to output with 1 neuron
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
	for i in range(x.size()):
		data_new.append([x[i] , [y[i]]])
	var dataset = [
		[[0, 0], [0]],
		[[0, 1], [1]],
		[[1, 0], [1]],
		[[1, 1], [0]],
		[[0, 0], [0]],
		[[0, 1], [1]],
		[[1, 0], [1]],
		[[1, 1], [0]],
]
	nn.train(data_new, 900)
	nn.test(data_new)
