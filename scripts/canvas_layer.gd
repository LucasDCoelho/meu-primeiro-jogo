extends CanvasLayer

signal modo_escolhido(modo)

func _ready():
	$VBoxContainer/Player_1.pressed.connect(_on_botao_player1_pressed)
	$VBoxContainer/Coop.pressed.connect(_on_botao_coop_pressed)

func _on_botao_player1_pressed():
	emit_signal("modo_escolhido", "p1")
	hide()

func _on_botao_coop_pressed():
	emit_signal("modo_escolhido", "coop")
	hide()
