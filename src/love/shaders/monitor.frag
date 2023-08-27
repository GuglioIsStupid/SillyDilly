float zoom = 1.1;

vec4 effect(vec4 color_, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec2 uv = texture_coords;
    uv = (uv-.5)*2.;
    uv *= zoom;

    uv.x *= 1. + pow(abs(uv.y/2.),3.);
    uv.y *= 1. + pow(abs(uv.x/2.),3.);
    uv = (uv + 1.)*.5;

    vec4 tex = vec4(
        Texel(texture, uv+.001).r,
        Texel(texture, uv).g,
        Texel(texture, uv-.001).b,
        1.0
    );

    tex *= smoothstep(uv.x,uv.x+0.01,1.)*smoothstep(uv.y,uv.y+0.01,1.)*smoothstep(-0.01,0.,uv.x)*smoothstep(-0.01,0.,uv.y);

    float avg = (tex.r+tex.g+tex.b)/3.;
    return tex + pow(avg,3.);
}