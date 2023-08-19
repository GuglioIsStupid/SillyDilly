uniform float distort = 0.0;

vec2 pincushionDistortion(in vec2 uv, float strength) {
    vec2 st = uv - 0.5;
    float uvA = atan(st.x, st.y);
    float uvD = dot(st, st);
    return 0.5 + vec2(sin(uvA), cos(uvA)) * sqrt(uvD) * (1.0 - strength * uvD);
}

vec4 effect(vec4 color_, Image texture, vec2 texture_coords, vec2 screen_coords) {
    float rChannel = Texel(texture, pincushionDistortion(texture_coords, 0.3 * distort)).r;
    float gChannel = Texel(texture, pincushionDistortion(texture_coords, 0.15 * distort)).g;
    float bChannel = Texel(texture, pincushionDistortion(texture_coords, 0.075 * distort)).b;
    return vec4(rChannel, gChannel, bChannel, 1.0);
}