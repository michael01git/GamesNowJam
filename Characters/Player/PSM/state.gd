extends Node
class_name State

var player: CharacterBody2D
var animated_sprite_2d: AnimatedSprite2D
var attack_area: Area2D

## The next state. StateMachine looks at this and if its not null changes to that state.
var next_state: State

## State process.
func state_process(delta: float):
	pass

func state_input(event: InputEvent):
	pass

## State enter and exit on change.
func on_exit():
	pass

func on_enter():
	pass
