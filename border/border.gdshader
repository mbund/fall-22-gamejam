shader_type canvas_item;

uniform float scalex;
uniform float t;
const float thickness = 0.02;

void fragment() {
	vec2 uv = UV;
	uv.x *= scalex;
	float mv = fract(uv.x*10.0+t)>0.5 ? 1.0 : 0.0;
	COLOR = vec4(0.0, 1.0, 1.0, mv*0.5);
}
