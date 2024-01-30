extends Control

@onready var _statusText = $Panel/VBoxContainer/Status
@onready var _serverMessagesText = $Panel/VBoxContainer/MessagesFromServer
@onready var _nombreClient = $Panel/VBoxContainer/ClientConnected
@onready var _yourName = $Panel/VBoxContainer/YourName
@onready var nomText = $Panel/VBoxContainer/Nom
var nombre_client = 0
var player_id_name = {}

func _ready():
	if OS.has_feature("dedicated_server"):
		print("loading server...")
		startServeur()
	else:
		print("loading client...")
		startClient()
		
func startServeur():
	print("Starting Server...")
	
	multiplayer.peer_connected.connect(self._on_client_connected)
	multiplayer.peer_disconnected.connect(self._on_client_disconnected)
	
	var server = ENetMultiplayerPeer.new()
	server.create_server(1111,4)
	multiplayer.multiplayer_peer = server
	
func startClient():
	multiplayer.connected_to_server.connect(self.connected_to_server)
	multiplayer.server_disconnected.connect(self.disconnected_from_server)
	print("creating client...")
	_updateStatusText("starting Client...")
	
	var client = ENetMultiplayerPeer.new()
	client.create_client("54.37.40.235",1111)
	multiplayer.multiplayer_peer = client
	var ip = multiplayer.get_unique_id()
	
@rpc("any_peer") #0
func send_message_to_server(message):
	if multiplayer.is_server():
		send_message_to_client.rpc("Demande de connexion envoyé : " + str(message))
		modifieAffichageNom.rpc()

@rpc("authority") #1
func send_message_to_client(message:String):
	_updateServerMessageText(message)
	
@rpc("any_peer") #0
func afficher_nom(Nom):
	if multiplayer.is_server():
		modifieAffichageNom.rpc(Nom)

@rpc("authority") #1
func modifieAffichageNom(Nom):
	_modifieAffichageNom(str(Nom))

@rpc("any_peer") #0
func EnleverNombreClient(Nombre):
	if multiplayer.is_server():
		print(nombre_client)
		modifieNombreClient.rpc(Nombre)
		
@rpc("any_peer") #0
func AjouterNombreClient(Nombre):
	if multiplayer.is_server():
		print(nombre_client)
		modifieNombreClient.rpc(Nombre)
		
@rpc("authority") #1
func modifieNombreClient(Nombre):
	_modifieNombreClient(str(Nombre))
	
func connected_to_server():
	print("Connected to server...")
	_updateStatusText("Connected to server...")
	
func disconnected_from_server():
	print("disconnected from server...")
	
func _on_client_connected(clientId):
	nombre_client = nombre_client + 1
	AjouterNombreClient(nombre_client)
	
func _on_client_disconnected(clientId):
	nombre_client = nombre_client - 1
	EnleverNombreClient(nombre_client)
	
func _send_message_to_server():
	print("Connected")
	var NomActuel = nomText.text
	send_message_to_server.rpc(str(multiplayer.get_unique_id()))
	afficher_nom.rpc(str(NomActuel))
	
func _updateStatusText(statusText):
	_statusText.text = statusText

func _updateServerMessageText(message):
	_serverMessagesText.text = message
	
func _modifieAffichageNom(Nom):
	_yourName.text = "Pseudo : " + Nom
	
func _modifieNombreClient(Nombre):
	_nombreClient.text = "Nombre de clients : " + Nombre

func _on_return_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_start.tscn")
