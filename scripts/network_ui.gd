extends Control

func _on_client_pressed() -> void:
	NetworkHandler.start_client()

func _on_server_pressed() -> void:
	NetworkHandler.start_server()
