extends Control

@onready var health_bar: ProgressBar = $VBoxContainer/HealthHBox/HealthBar
@onready var score_label: Label = $VBoxContainer/HealthHBox/ScoreLabel
@onready var puke_bar: ProgressBar = $VBoxContainer/PukeBar

func _ready() -> void:
	health_bar.max_value = PlayerStatsManager.get_base_stat("health")

func _process(_delta: float) -> void:
	update_ui()

func update_ui():
	health_bar.value = PlayerStatsManager.get_stat("health")
	score_label.text = str(PlayerStatsManager.get_stat("score"))
	
	if PlayerStatsManager.get_stat("pukecandies") != 0:
		puke_bar.modulate = Color.WHITE
		puke_bar.value = PlayerStatsManager.get_stat("pukecandies")
