extends Node2D
class_name BattleEntity

@onready var health_manager : EntityHealthManager = $HealthManager
@onready var blink_anims : AnimationPlayer = $BlinkAnims

var is_dead : bool = false
var next_turn_intent : TurnIntent = null

func _ready():
	health_manager.hp_depleted.connect(on_hp_depleted)
	health_manager.initialize_hp()

func perform_attack(target : BattleEntity, damage : int):
	var jump_tween = create_tween()
	jump_tween.tween_property(self, "position:y", position.y - 80, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	jump_tween.tween_property(self, "position:y", position.y, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	
	target.receive_attack(damage)

func receive_attack(damage_dealt : int):
	var damage_taken = health_manager.deduct_hp(damage_dealt)
	if damage_taken > 0:
		blink_anims.play("blink")
		var recoil_tween = create_tween()
		
		if self is Enemy:
			recoil_tween.tween_property(self, "position:x", position.x + 40, 0.2).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
			recoil_tween.tween_property(self, "position:x", position.x, 0.1).set_trans(Tween.TRANS_LINEAR).set_delay(0.5)
		else:
			recoil_tween.tween_property(self, "position:x", position.x - 40, 0.2).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
			recoil_tween.tween_property(self, "position:x", position.x, 0.1).set_trans(Tween.TRANS_LINEAR).set_delay(0.5)


func on_hp_depleted():
	is_dead = true
	if self is Enemy:
		BattleInfo.enemies.erase(self)
	else:
		BattleInfo.player = null
	
	queue_free()
