shader_type spatial;

uniform sampler2D imgTexture;
uniform float road_witdh = 4.0;
uniform float texture_repeat =2.0;

void fragment() {
	vec2 mardefortaleza01_uv = vec2((1.0 -UV.y)*texture_repeat, UV.x * texture_repeat);
	vec4 color = texture(imgTexture, mardefortaleza01_uv);
	ALBEDO= color.rgb;
	METALLIC = 0.0;
	ROUGHNESS= 0.8;	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
