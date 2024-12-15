extends Node



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
			print(j, inputs, actual_outputs, targets)
	
	# Calcular el error total
		var total_error = calculate_total_error(dataset)

		print("------------------------------")  # Puedes reemplazar esto con una constante STR_REPORT_BROADER si lo deseas
		print('Testing Finish. Error: ',(total_error))  # Muestra el error total


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
func _ready() -> void:
	prints("funca test 3")
	var nn = NeuralNetwork.new("Sigmoid", 0.4, false)
	nn.add_layer(2, 20) # Example: input layer with 2 inputs, 3 neurons
	#nn.add_layer(2, 2)
	#nn.add_layer(20, 20)
	#nn.add_layer(3, 3)
	#nn.add_layer(3, 3)
	nn.add_layer(20, 1) # Hidden layer to output with 1 neuron

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
	nn.train(dataset, 4000)
	nn.test(dataset)
