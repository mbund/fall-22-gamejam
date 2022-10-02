shader_type canvas_item;

uniform float size = 1000.0;
const float thickness = 0.02;

void fragment() {
	vec2 uv = vec2(UV.x*size, UV.y);
	float y = uv.x/1000.0;
	float mv = smoothstep(fract(sin(uv.y-y)),1.,1.0-thickness);
	mv = smoothstep(mv,thickness,1.);
	COLOR = vec4(0.0, 1.0, 1.0, mv);
}
