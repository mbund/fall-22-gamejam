shader_type canvas_item;

uniform float scalex = 1.0;
uniform float t = 0.0;
const float thickness = 0.02;

void fragment() {
	//float mv = smoothstep(fract(sin(UV.y-UV.x)),1.,1.0-thickness);
	//mv = smoothstep(mv,thickness,1.);
	float mv = fract(UV.x*10.0*scalex+t)>0.5 ? 1.0 : 0.0;
	COLOR = vec4(0.0, 1.0, 1.0, mv*0.5);
}
