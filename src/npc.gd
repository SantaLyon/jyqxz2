extends Sprite

onready var sprite = $sprite

func set_sprite(img_path):
	sprite.texture = load(img_path)
