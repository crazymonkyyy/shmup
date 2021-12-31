import raylib;
import types;
import basic;
enum windowx=100;
enum windowy=100;
void main(string[] s){
	tile[3][3] foo=s[1].to!(tile[3][3]);
	mixin(import("drawing.mix"));
	while (!WindowShouldClose()){
		BeginDrawing();
			foreach(y;0..3){
			foreach(x;0..3){
				drawtile(foo[x][y],x*32,(2-y)*32,2);
			}}
		EndDrawing();
	}
}