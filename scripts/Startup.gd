extends Control

@onready var _statusText = $Panel/InformationsStatus/StatusServeur
@onready var _yourName = $Panel/InformationsConnection/Pseudo
@onready var _connection = $Panel/BoutonsConnection/Connection
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
	
	var client = ENetMultiplayerPeer.new()
	client.create_client("54.37.40.235",1111)
	multiplayer.multiplayer_peer = client
	
@rpc("any_peer") #0
func infoConnectionsServer(info):
	if multiplayer.is_server():
		player_id_name[multiplayer.get_unique_id()] = str(info)
		player_id_name[info] = str(multiplayer.get_unique_id())
	
func connected_to_server():
	print("Connected to server...")
	
func disconnected_from_server():
	print("disconnected from server...")
	
func _on_client_connected(clientId):
	print(clientId + " : Connected")
	
func _on_client_disconnected(clientId):
	print(clientId + " : Deconnected")
	
func _appuyer_connection():
	var NomActuel = _yourName.text
	infoConnectionsServer.rpc(NomActuel)

func _on_bouton_retour_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_start.tscn")
