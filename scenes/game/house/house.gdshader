shader_type canvas_item;

uniform float hue_shift = 0.95; // muda o matiz geral — ajuste até achar um vinho
uniform float saturation_scale = 1.2; // realça a cor
uniform float value_scale = 0.6; // escurece o resultado

vec3 rgb2hsv(vec3 c) {
	vec4 K = vec4(0.0, -1.0/3.0, 2.0/3.0, -1.0);
	vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
	vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

	float d = q.x - min(q.w, q.y);
	float e = 1.0e-10;
	return vec3(abs((q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c) {
	vec4 K = vec4(1.0, 2.0/3.0, 1.0/3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void fragment() {
	vec4 tex = texture(TEXTURE, UV);
	vec3 hsv = rgb2hsv(tex.rgb);
	
	// aplica transformação
	hsv.x = fract(hsv.x + hue_shift);
	hsv.y *= saturation_scale;
	hsv.z *= value_scale;

	vec3 final_color = hsv2rgb(hsv);
	COLOR = vec4(final_color, tex.a);
}
