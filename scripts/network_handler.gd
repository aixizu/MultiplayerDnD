extends Node

const IP_ADDRESS : String = "127.0.0.1"
const PORT: int = 15155

var peer : ENetMultiplayerPeer

func _ready() -> void:
	if OS.has_feature("server"):
		start_server()

func start_server() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer

func start_client(ip: String, port: int) -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(ip, port)
	multiplayer.multiplayer_peer = peer
