shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

const vec4 original_colors[4] = vec4[4](
    vec4(0.098, 0.102, 0.094, 1.0),  // color 1
    vec4(0.302, 0.298, 0.271, 1.0),  // color 2
    vec4(0.6, 0.557, 0.541, 1.0),  // color 3
    vec4(0.949, 0.863, 0.878, 1.0)  // color 4
);

uniform vec4 replace_colors[4]: source_color;

const float precision = 0.1;

vec4 swap_color(vec4 color) {
	for (int i = 0; i < 4; i++) {
		if (distance(color, original_colors[i]) <= precision) {
			return replace_colors[i];
		}
	}
	return color;
}

void fragment() {
	COLOR = swap_color(texture(SCREEN_TEXTURE, SCREEN_UV));
}
