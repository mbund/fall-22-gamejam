shader_type canvas_item;

const int OCTAVE = 3;

uniform vec2 pos;

float rand(vec2 input){
	return fract(sin(dot(input,vec2(23.53,44.0)))*42350.45);
}

float perlin(vec2 input){
	vec2 i = floor(input);
	vec2 j = fract(input);
	vec2 coord = smoothstep(0.,1.,j);
	
	float a = rand(i);
	float b = rand(i+vec2(1.0,0.0));
	float c = rand(i+vec2(0.0,1.0));
	float d = rand(i+vec2(1.0,1.0));

	return mix(mix(a,b,coord.x),mix(c,d,coord.x),coord.y);
}

float fbm(vec2 input){
	float value = 0.0;
	float scale = 0.5;
	
	for(int i = 0; i < OCTAVE; i++){
		value += perlin(input)*scale;
		input*=2.0;
		scale*=0.5;
	}
	return value;
}

float fbmCloud(vec2 input, float minimum){
	float value = 0.0;
	float scale = 0.5;
	
	for(int i = 0; i < OCTAVE; i++){
		value += perlin(input)*scale;
		input*=2.0;
		scale*=0.5;
	}
	return smoothstep(0.,1.,(smoothstep(minimum,1.,value)-minimum)/(1.0-minimum));
}

//vec3 layer(vec2 input) {
//	vec3 col = fbmCloud(input*7.0, 0.1) * vec3(0.2, 0.2, 0.4);
//	col += fbmCloud(input*7.0+vec2(10,5), 0.1) * vec3(0.4, 0.2, 0.2);
//	col += fbmCloud(input*7.0+vec2(5, 10), 0.1) * vec3(0.2, 0.4, 0.2);
//	return col * 0.2;
//}

void fragment() {
	vec2 ps = SCREEN_PIXEL_SIZE;
    vec2 ratio = (ps.x > ps.y) ? vec2(ps.y / ps.x, 1) : vec2(1, ps.x / ps.y);
	vec2 uv = UV * ratio;
	vec3 col = fbmCloud((uv+pos*0.001)*7.0, 0.1) * vec3(0.2, 0.2, 0.4) * 0.5;
	col += fbmCloud((uv+pos*0.0005)*7.0+vec2(10,20), 0.1) * vec3(0.2, 0.4, 0.2) * 0.5;
	col += fbmCloud((uv+pos*0.00025)*7.0+vec2(-20,10), 0.1) * vec3(0.4, 0.2, 0.2) * 0.5;
	COLOR = vec4(col, 1.0);
}