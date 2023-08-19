uniform float aberration = 1.0;
uniform float effectTime = 0.0;
uniform vec2 gameSize = vec2(1280.0, 720.0);

vec4 effect(vec4 color_, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec2 uv = texture_coords.xy;
    vec2 ndcPos = uv * 2.0 - 1.0;
    float aspect = gameSize.x / gameSize.y;

    float u_angle = -2.4 * sin(effectTime * 2.0);

    float eye_angle = abs(u_angle);
    float half_angle = eye_angle / 2.0;
    float half_dist = tan(half_angle);

    vec2 vp_scale = vec2(aspect, 1.0);
    vec2 P = ndcPos * vp_scale;

    float vp_dia = length(vp_scale);
    vec2 rel_P = normalize(P) / normalize(vp_scale);

    vec2 pos_prj = ndcPos;

    float beta = abs(atan((length(P)/vp_dia) * half_dist) * -abs(cos(effectTime - 0.25 + 0.5)));
    pos_prj = rel_P * beta / half_angle;

    vec2 uv_prj = (pos_prj * 0.5 + 0.5);

    vec2 trueAberation = aberration * pow((uv_prj.st - 0.5), vec2(3.0,3.0));

    return vec4(
        texture2D(texture, uv_prj + trueAberation).r,
        texture2D(texture, uv_prj).g,
        texture2D(texture, uv_prj - trueAberation).b,
        1.0
    );
}