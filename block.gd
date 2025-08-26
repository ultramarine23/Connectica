extends Chain

func _init():
	chain_type = GlobalConsts.BLOCK
	chain_value = randi_range(1, 6)

func _ready():
	text = str(chain_value)
	super()
