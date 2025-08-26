extends Chain

func _init():
	chain_type = GlobalConsts.FUNCTION
	chain_value = percentage
	text = "%"

func percentage(a):
	return float(a) / 100
