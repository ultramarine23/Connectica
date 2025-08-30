extends ActionChainer

func _ready():
	super()
	accepting_links = [Consts.FUNCTION, Consts.NUMBER, Consts.OPERATION]

func add_link(link : Link):
	link.queue_free()
