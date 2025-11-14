extends Node

var playerBaseStatsDict: Dictionary[String, int] = {"health": 10, "score": 0, "pukecandies": 0}
var player_stats: Dictionary = playerBaseStatsDict.duplicate()

## Reset the current player statistics to the base player statistics.
func reset_stats():
	player_stats = playerBaseStatsDict.duplicate()

## Add [value] to player statistic [stats_to_change]. Does nothing if stat does not exist.
func add_to_stat(stat_to_change: String, value: int):
	
	print(player_stats)
	
	var stat = player_stats.get(stat_to_change)
	if stat == null:
		printerr("No stat "+stat_to_change+" in dict")
	else:
		player_stats.set(stat_to_change, stat + value)

func _process(delta: float) -> void:
	print(player_stats)

## Get [stats_to_return] and return it. Returns 0 if no value exists.
func get_stat(stat_to_return: String) -> int:
	var stat = player_stats.get(stat_to_return)
	if stat == null:
		printerr("No stat "+stat_to_return+" in dict")
		return 0
	else:
		return stat

## Get [stats_to_return] from [playerBaseStatsDict] and return it. Returns 0 if no value exists.
func get_base_stat(stat_to_return: String) -> int:
	var stat = playerBaseStatsDict.get(stat_to_return)
	if stat == null:
		printerr("No stat "+stat_to_return+" in dict")
		return 0
	else:
		return stat
