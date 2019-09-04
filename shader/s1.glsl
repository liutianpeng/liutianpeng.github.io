
#iChannel2 "https://m.tuniucdn.com/filebroker/cdn/snc/99/9b/999bbbb1d1ab89a063bc769ac902e505_w800_h0_c0_t0.jpg"

const float PI = 3.1415926535;

vec2 oldPos(vec2 newPos, float time){
    float k = 10.0;
    float m = mod(newPos.y,1000.0)/1000.0;
    vec2 old = newPos;
    old.x = newPos.x-k*pow(time, 2.0) * (newPos.x+time*k*5.0)/1000.0;
    old.y = newPos.y-k*pow(time, 2.0) * (newPos.y+time*k*5.0)/1000.0;
    return old;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;
    float time = 0.0;

    vec2 pos = oldPos(fragCoord.xy, time)*2.0;
    if (pos.x>0.0 && pos.y>0.0 && pos.x<iResolution.x && pos.y<iResolution.y) {
        if (fract(pos.x)<0.01 && fract(pos.y)<0.01){
            fragColor = texture2D(iChannel2, pos/iResolution.xy,  1.0);
        }
    }
}