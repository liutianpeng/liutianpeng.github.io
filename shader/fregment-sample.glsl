precision mediump float;

uniform vec4 u_color;
uniform vec2 u_textureSize;
uniform sampler2D u_texture;

varying vec2 v_texCoord;

void main() {
  gl_FragColor = texture2D(u_texture, v_texCoord);
  // gl_FragColor = u_color;

 
}