shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	
	COLOR = vec4(0.4, 0.6, 0.9, 1.0);
	COLOR = vec4(UV, 0.5, 1.0);
	COLOR = texture(TEXTURE, UV); // Read from texture again.
	if (COLOR.b > 0.8 && COLOR.r < 0.1)
	{	
		COLOR.r = 1.0;
		COLOR.b = 0.0;
		COLOR.g = 0.0;
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
