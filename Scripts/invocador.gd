extends CharacterBody2D
const muro = preload("uid://co4npl0wx61te")
const SPEED = 300.0

func _physics_process(delta: float) -> void:
	velocity.x = SPEED
	move_and_slide()

func _ready() -> void:
	$GenerarObstaculo.start()

func invocar():
	randomize()
	var num = randi_range(1,3)
	var e = muro.instantiate()
	var vec = Vector2(position.x-150,position.y-400+(100*num))
	e.iniciar(vec)
	get_tree().root.add_child.call_deferred(e)
	invocar2(num)

func invocar2(num):
	var e = muro.instantiate()
	var vec = Vector2(position.x-150,position.y+400+(100*num))
	e.iniciar(vec)
	get_tree().root.add_child.call_deferred(e)


func _on_generar_obstaculo_timeout() -> void:
	invocar()
