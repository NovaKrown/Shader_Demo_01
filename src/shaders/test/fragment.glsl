varying vec2 vUv;
varying float vTime;

vec3 palette(float t)
{
vec3 a = vec3(0.5, 0.5, 0.5);
vec3 b = vec3(0.5, 0.5, 0.5);
vec3 c = vec3(1.0, 1.0, 1.0);
vec3 d = vec3(0.263, 0.416, 0.557);

return a + b*cos(6.28318*(c*t+d));
}

void main()
{
vec3 finalColor = vec3(0.0);
vec2 uv0 = vUv * 2.0 - 1.0;
vec2 centeredUv = vUv * 2.0 - 1.0;


for(float i = 0.0; i < 4.0; i++) {
centeredUv = fract((centeredUv) * 1.5) - 0.5;

float d = length(centeredUv) * exp(-length(uv0));
vec3 col = palette(length(uv0) + i * 0.4 + vTime * 0.4);

d = sin(d * 8.0 + vTime)/8.0;
d = abs(d);

d = pow(0.01 / d, 1.2);

finalColor += col * d;
}

gl_FragColor = vec4(finalColor, 1.0);



}

