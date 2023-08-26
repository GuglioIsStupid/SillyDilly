uniform float interpolation = 0.5;

float threshold = 0.125;
mat2 dither_2 = mat2(0.,1.,1.,0.);

struct dither_tile {
    float height;
};

vec3[4] gb_colors() {
 	vec3 gb_colors[4];
    gb_colors[0] = vec3(8., 24., 32.) / 255.;
    gb_colors[1] = vec3(52., 104., 86.) / 255.;
    gb_colors[2] = vec3(136., 192., 112.) / 255.;
    gb_colors[3] = vec3(224., 248., 208.) / 255.;
    return gb_colors;
}

float[4] gb_colors_distance(vec3 color) {
    float distances[4];
    distances[0] = distance(color, gb_colors()[0]);
    distances[1] = distance(color, gb_colors()[1]);
    distances[2] = distance(color, gb_colors()[2]);
    distances[3] = distance(color, gb_colors()[3]);
    return distances;
}

vec3 closest_gb(vec3 color) {
    int best_i = 0;
    float best_d = 2.;
    
    vec3 gb_colors[4] = gb_colors();
    
    for (int i = 0; i < 4; i++) {
        float dis = distance(gb_colors[i], color);;
        if (dis < best_d) {
            best_d = dis;
            best_i = i;
        }
    }
    return gb_colors[best_i];
}

vec2 get_tile_sample(vec2 coords, vec2 res) {
    return floor(coords * res / 2.) * 2. / res;
}

vec3[2] gb_2_closest(vec3 color) {
 	float distances[4] = gb_colors_distance(color);
    
    int first_i = 0;
    float first_d = 2.;
    
    int second_i = 0;
    float second_d = 2.;
    
    for (int i = 0; i < distances.length(); i++) {
        float d = distances[i];
        if (distances[i] <= first_d) {
            second_i = first_i;
            second_d = first_d;
            first_i = i;
            first_d = d;
        } else if (distances[i] <= second_d) {
            second_i = i;
            second_d = d;
        }
    }
    vec3 colors[4] = gb_colors();
    vec3 result[2];
    if (first_i < second_i)
        result = vec3[2](colors[first_i], colors[second_i]);
    else
     	result = vec3[2](colors[second_i], colors[first_i]);   
    return result;
}

bool needs_dither(vec3 color) {
    float distances[4] = gb_colors_distance(color);
    
    int first_i = 0;
    float first_d = 2.;
    
    int second_i = 0;
    float second_d = 2.;
    
    for (int i = 0; i < distances.length(); i++) {
        float d = distances[i];
        if (d <= first_d) {
            second_i = first_i;
            second_d = first_d;
            first_i = i;
            first_d = d;
        } else if (d <= second_d) {
            second_i = i;
            second_d = d;
        }
    }
    return abs(first_d - second_d) <= threshold;
}

vec3 return_gbColor(vec3 sampleColor, vec2 texture_coords) {
    vec3 endColor;
    if (needs_dither(sampleColor)) {
        endColor = vec3(gb_2_closest(sampleColor)[int(dither_2[texture_coords.x][texture_coords.y])]);
    } else
        endColor = vec3(closest_gb(Texel(bitmap, texture_coords).xyz));
    return endColor;
}

vec3 buried_eye_color = vec3(255.0, 0.0, 0.0) / 255.0;
vec3 buried_grave_color = vec3(121.0, 133.0, 142.0) / 255.0;


vec4 effect(vec4 color_, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec4 color = Texel(texture, texture_coords);
    vec3 sampleColor = color.xyz;

    vec3 colors[4] = gb_colors();
    if color.a ~= 0.0 {
        vec3 colorA = sampleColor;
        vec3 colorB = return_gbColor(sampleColor, texture_coords);

        vec3 newColor;
        if (colorA == buried_eye_color) 
            colorA = colors[2];
        if (colorA == buried_grave_color)
            colorB = colors[2];
        newColor = mix(colorA, colorB, interpolation);
        return vec4(newColor, 1.0);
    } else
        return vec4(0,0,0,0);
}