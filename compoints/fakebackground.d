import raylib;
import types;
import basic;
import gameplay;
import consants;

enum windowx=playfieldx;
enum windowy=playfieldy;

void main(){
	mixin(import("drawing.mix"));
	background bg;
	int scroll=0;
	int bgoffset=32;
	tilerow water=ubyte(110);
	auto backgroundbuffer=water.repeat;
	foreach(i;0..35){
		bg.tiles~=backgroundbuffer.front;
		backgroundbuffer.popFront;
	}
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			draw(bg);bgoffset--;
			bg.scroll(backgroundbuffer);
		EndDrawing();
	}
	CloseWindow();
}