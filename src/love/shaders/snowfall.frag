uniform float intensity = 0.0;
uniform int amount = 200;
uniform float time = 0.0;

vec2 uv;
float rnd(float x) {
    return fract(sin(dot(vec2(x + 48, 38 / (x + 2.5)), vec2(13, 78))) * (43758));
}

float drawCircle(vec2 center, float radius) {
    return 1.0 - smoothstep(0.0, radius, length(uv - center));
}

vec4 effect(vec4 color_, Image texture, vec2 texture_coords, vec2 screen_coords) {
    uv = vec2(texture_coords.x * 2.0, texture_coords.y);
    vec4 color = Texel(texture, texture_coords);
    // set the rgb values to 1
    color.rgb = vec3(1.0);

    for(int i=0; i<amount; i++) {
        float j = float(i) * 2.0;
        float realIntensity = intensity * 1.0;
        float speed = (0.3+rnd(cos(j))*(0.7+0.5*cos(j/(float(amount)*0.25))));
        vec2 center = vec2(((0.5-uv.y)*realIntensity+rnd(j)+0.1*(cos(time+sin(j)))) * 2.0, mod(sin(j)+speed*(time*1.5*(0.1+realIntensity)), 1.0));
        color += vec4(0.45*drawCircle(center, 0.001+speed*(intensity/(0.2 / 1.5))*0.012));
    }

    return color;
}