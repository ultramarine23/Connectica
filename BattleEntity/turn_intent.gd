extends Resource
class_name TurnIntent

var user : BattleEntity
var target : BattleEntity
var backup_targs : Array

var attack_intent = 0
var block_intent = 0
var draw_intent = 0

func _init(_user, _target, _backups):
	user = _user
	target = _target
	backup_targs = _backups


func execute_attack():
	# use a backup target if target is dead, or cancel attack if all are dead
	if not is_instance_valid(target):
		for backup in backup_targs:
			if is_instance_valid(backup):
				target = backup
				break
		
		# cancel the attack if all are dead
		return
	
	user.perform_attack(target, attack_intent)

func execute_block():
	user.health_manager.add_block(block_intent)

