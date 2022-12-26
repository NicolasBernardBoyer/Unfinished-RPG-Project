//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float strength;

void main()
{
	vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );

	////VERSION 1: Overly long:
	//float value = (base_col.r + base_col.g + base_col.b) / 3.0;
	//vec3 out_col = vec3(base_col.r * (1.0 - strength) + value * strength, base_col.g * (1.0 - strength) + value * strength, base_col.b * (1.0 - strength) + value * strength);
	
	////VERSION 2: combine vec & float:
	//float value = (base_col.r + base_col.g + base_col.b) / 3.0;
	//vec3 out_col = base_col.rgb * (1.0 - strength) + value * srength;
	
	////VERSION 3: Mix:
	//float value = (base_col.r + base_col.g + base_col.b) / 3.0;
	//vec3 out_col = mix(base_col.rgb, vec3(value), strength);
	
	// VERSION 4: Mix & MISC conversion:
	//float value = base_col.r * 0.299 + base_col.g * 0.587 + base_col.b * 0.114;
	//vec3 out_col = mix(base_col.rgb, vec3(value), strength);
	
	//VERSION 5: Mix, MISC & dot product:
	float value = dot(base_col.rgb, vec3(0.299, 0.587, 0.114));
	vec3 out_col = mix(base_col.rgb, vec3(value), strength);

    gl_FragColor = vec4(out_col, base_col.a);
}
