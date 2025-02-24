extends CharacterBody2D


var SPEED = 60
const JUMP_VELOCITY = -350.0
var dj_ready = false
const dash_range = 100
@onready var anim = $AnimatedSprite2D 
@onready var cold = $dash_cooldawn
var on_jump = false
var alive = true

func _ready() -> void:
	Global.white_room = true
	
	if Global.chap_choise != 0:
		Global.switch_skill = true
	else:
		Global.switch_skill = false
	
	
	if Global.chap_choise != 0 and Global.chap_choise != 1:
		Global.dable_jump_skill = true
	else:
		Global.dable_jump_skill = false


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	var sh := Input.is_key_pressed(KEY_SHIFT)
	if is_on_floor():
		on_jump = false
	else:
		on_jump = true
	
	if Input.is_action_just_pressed('w'):
		death()
	
	if alive:
		if Global.switch_skill:
			if Input.is_action_just_pressed("switch_color"):
				if Global.white_room:
					Global.white_room = false
				else:
					Global.white_room = true
					
				if $".".collision_layer == 2:
					$".".collision_layer = 1
					$".".collision_mask = 1
				else:
					$".".collision_layer = 2
					$".".collision_mask = 2
		

		if not is_on_floor():
			velocity += get_gravity() * delta

		if Input.is_action_just_pressed("jump") and is_on_floor(): # прыжок
			anim.play("jump")
			velocity.y = JUMP_VELOCITY
			dj_ready = true
				
		if Global.dable_jump_skill:
			if Input.is_action_just_pressed("jump") and not is_on_floor() and dj_ready: # двойной прыжок
				anim.play("jump")
				velocity.y = JUMP_VELOCITY * 0.9
				dj_ready = false
		

			
		if direction:
			if Global.dashing_skill:
				if Input.is_action_just_pressed("dash"): # dashing
					if cold.is_stopped():
						on_dash_effect()
						velocity.x = direction * 5200
						if not is_on_floor():
							velocity.y = JUMP_VELOCITY * 0.7
						cold.start()
			elif sh:
				velocity.x = direction * SPEED * 3. # run
			else:
				velocity.x = direction * SPEED # walk
			if velocity.y == 0:
				if not sh and not on_jump:
					anim.play("walk")
				else:
					anim.play('run')
		else: # idle
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if velocity.y == 0 and not on_jump:
				anim.play("idle")

		# в какую сторону смотрит игрок
		if direction == -1:
			anim.flip_h = true
		elif direction == 1:
			anim.flip_h = false

		move_and_slide()
		
func on_dash_effect():
	var PCN = $AnimatedSprite2D.duplicate()
	get_parent().add_child(PCN)
	PCN.global_position = global_position
	var animationTime = $dash_effect.wait_time / 3
	await get_tree().create_timer(animationTime + 0.15).timeout
	PCN.modulate.a = 0.8
	await get_tree().create_timer(animationTime).timeout
	PCN.modulate.a = 0.6
	await get_tree().create_timer(animationTime).timeout
	PCN.modulate.a = 0.3
	await get_tree().create_timer(animationTime).timeout
	PCN.modulate.a = 0.2
	await get_tree().create_timer(animationTime).timeout
	PCN.queue_free()


func death():
	alive = false
	anim.play('death')
	await anim.animation_finished
	get_tree().change_scene_to_file(Global.lvls[Global.chap_choise % len(Global.chapter_comp)])
