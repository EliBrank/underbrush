extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var color_rect = $CanvasLayer/ColorRect
	var root_node = get_tree().current_scene
	if root_node and "replace_colors" in root_node:
		var replace_colors = root_node.replace_colors
		if color_rect and color_rect.material:
			var shader_material = color_rect.material as ShaderMaterial
			shader_material.set_shader_parameter("replace_colors", replace_colors)
