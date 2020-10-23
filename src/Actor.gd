extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL := Vector2.UP
export var speed := Vector2(300.0, 1000.0)
export var gravity := 50

var _velocity := Vector2.ZERO
