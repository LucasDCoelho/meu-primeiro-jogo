extends Node

@onready var hud = $Menu

var cena_player1 = preload("res://cenas/player.tscn")
var cena_player2 = preload("res://cenas/player2.tscn")

func _ready():
	# conecta o HUD ao Main
	hud.modo_escolhido.connect(_on_modo_escolhido)

func _on_modo_escolhido(modo: String):
	match modo:
		"p1":
			_spawn_player1()
		"coop":
			_spawn_player1()
			_spawn_player2()

func _spawn_player1():
	var p1 = cena_player1.instantiate()
	p1.position = Vector2(200, 300)
	add_child(p1)

func _spawn_player2():
	var p2 = cena_player2.instantiate()
	p2.position = Vector2(400, 300)
	add_child(p2)
