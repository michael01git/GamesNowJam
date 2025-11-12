extends CharacterBody2D

func hurt():
	print("OUCH")
	PlayerStatsManager.add_to_stat("score", 100)
