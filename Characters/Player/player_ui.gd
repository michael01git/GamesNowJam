extends Control

@onready var health_bar: ProgressBar = $VBoxContainer/HealthHBox/Panel/HealthBar
@onready var score_label: Label = $VBoxContainer/HealthHBox/Panel2/ScoreLabel


@onready var puke_panel: Panel = $VBoxContainer/HealthHBox/PukePanel
@onready var puke_bar: ProgressBar = $VBoxContainer/HealthHBox/PukePanel/PukeBar



func _ready() -> void:
	health_bar.max_value = PlayerStatsManager.get_base_stat("health")

func _process(_delta: float) -> void:
	update_ui()

func update_ui():
	health_bar.value = PlayerStatsManager.get_stat("health")
	score_label.text = str(PlayerStatsManager.get_stat("score"))
	
	if PlayerStatsManager.get_stat("pukecandies") != 0:
		puke_bar.modulate = Color.YELLOW
		puke_panel.modulate = Color.WHITE
		puke_bar.value = PlayerStatsManager.get_stat("pukecandies")
