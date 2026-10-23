class_name Ship extends RigidBody2D


@export_range(200, 800, 5) var _speed : float = 600
@export_category("Shooting")
@export var bullet : PackedScene
@export var pivot : Node2D


func _init() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Shoot"):
		_shoot()
	var direction : Vector2 = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	linear_velocity = direction * _speed
	pass

func _take_dmg() -> void:
	print_debug("Ship Destroyed")
	queue_free() # Obj Destroyed
	pass

func _shoot() -> void:
	var _bullet_object = (bullet.instantiate() as Bullet)
	get_parent().add_child(_bullet_object)
	_bullet_object.global_position = pivot.global_position
	(_bullet_object as Bullet).linear_velocity = Vector2.UP * 100
	pass
