// https://github.com/teotm/hypnos-lullaby-source-code-archive/blob/main/assets/shaders/isotope/redAberration.frag

#define PI 3.14159265

uniform float time = 0.0;
uniform float intensity = 0.0;
uniform float initial = 0.0;

float sat(float t) {
    return clamp(t,0.0,1.0);
}

vec2 sat(vec2 t) {
    return clamp(t, 0.0, 1.0);
}

vec3 spectrum_offset(float t) {
    float to = 3.0 * t - 1.5;
    return clamp(vec3(-to, 1.0-abs(to), to), 0.0, 1.0);
}

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec2 uv = texture_coords.xy;
    float ofs = (initial / 1000) + (intensity / 1000);

    vec4 sum = vec4(0.0);
    vec3 wsum = vec3(0.0);
    const int samples = 4;
    const float sampleinverse = 1.0 / float(samples);
    for (int i = 0; i < samples; ++i) {
        float t = float(i) * sampleinverse;
        uv.x = sat(uv.x + ofs * t);
        vec4 sample = Texel(texture, uv);
        vec3 s = spectrum_offset(t);
        sample.rgb = sample.rgb * s;
        sum += sample;
        wsum += s;
    }

    sum.rgb /= wsum;
    sum.a *= sampleinverse;

    return sum;
}