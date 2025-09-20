extends Control

@onready var ip: LineEdit = $VBoxContainer/IP
@onready var status: Label = $VBoxContainer/Status

func _ready() -> void:
	if OS.has_feature("server"):
		self.queue_free();

func _on_client_pressed() -> void:
	status.text = "Status: Connecting..."
	var text = ip.text
	var parts = text.split(":")
	var hostname = ""
	var port = 0
	
	if parts.size() == 2:
		hostname = parts[0]
		port = int(parts[1])
	elif parts.size() == 1:
		status.text = "Status: hostname has no port !!"
		return;
	
	if not hostname.is_empty():
		NetworkHandler.start_client(hostname, port)
		status.text = "Status: Connected ?"
		return;
	else:
		status.text = "Status: no hostname !!"
		return;

func _on_server_pressed() -> void:
	NetworkHandler.start_server()
