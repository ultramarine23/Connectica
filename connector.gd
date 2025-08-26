extends Chain

func _init():
	chain_type = GlobalConsts.CONNECTOR
	chain_value = sum


func sum(a, b):
	return float(a) + float(b)

func product(a, b):
	return float(a) * float(b)

func quotient(a, b):
	return float(a) / float(b)

func difference(a, b):
	return float(a) - float(b)
