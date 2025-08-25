extends Node

var cena_carros = preload("res://cenas/carros.tscn");
var pistas_rapidas_Y = [104, 272, 488];
var pistas_lentas_Y = [160, 216, 324, 384, 438, 544, 600];
var score = 0;

func _ready() -> void:
	$HUD/Placar.text = str(score);
	$HUD/Mensagem.hide();
	$HUD/Button.hide();
	$AudioTema.play();
	randomize();


func _on_timer_carros_rapidos_timeout() -> void:
	var carro = cena_carros.instantiate();
	add_child(carro);
	var pista_y = pistas_rapidas_Y[randi_range(0 , pistas_rapidas_Y.size() - 1)]
	carro.position = Vector2(-10, pista_y)
	carro.set_linear_velocity(Vector2(randf_range(710.0, 720.0), 0))
	carro.set_linear_damp(0.0)


func _on_timer_carros_lentos_timeout() -> void:
	var carro = cena_carros.instantiate();
	add_child(carro);
	var pista_y = pistas_lentas_Y[randi_range(0, pistas_lentas_Y.size() - 1)]
	carro.position = Vector2(-10, pista_y);
	carro.set_linear_velocity(Vector2(randf_range(450.0, 500.0), 0))
	carro.set_linear_damp(0.0)


func _on_player_pontua() -> void:
	if score <= 10:
		score += 1
		$HUD/Placar.text = str(score);
		$AudioPonto.play();
	if score == 10:
		$HUD/Mensagem.show();
		$HUD/Button.show();
		$TimerCarrosLentos.stop();
		$TimerCarrosRapidos.stop();
		$AudioVitoria.play();
		$Player.speed = 0;


func _on_hud_reinicia() -> void:
	get_tree().reload_current_scene();
