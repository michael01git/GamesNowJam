extends Control

@onready var health_bar: ProgressBar = $VBoxContainer/HealthHBox/HealthBar
@onready var score_label: Label = $VBoxContainer/HealthHBox/ScoreLabel
@onready var puke_bar: ProgressBar = $VBoxContainer/PukeBar

func _ready() -> void:
	health_bar.max_value = PlayerStatsManager.get_stat("health")
	puke_bar.hide()

func _process(_delta: float) -> void:
	health_bar.value = PlayerStatsManager.get_stat("health")
	score_label.text = str(PlayerStatsManager.get_stat("score"))
