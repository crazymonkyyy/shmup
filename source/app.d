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
	auto backgroundbuffer=File("gen","r").byLineCopy;
	foreach(i;0..35){
		bg~=cast(tilerow)(backgroundbuffer.front.to!string.map!(a=>cast(ubyte)a).staticArray!25);
		backgroundbuffer.popFront;
	}
	player p;p.y=500;
	bullets b;
	enemyships es;
	enemybullets eb;
	int bgoffset=32;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			drawbackground(bg,-bgoffset);bgoffset--;
			if(bgoffset==0){
				bg~=cast(tilerow)(backgroundbuffer.front.to!string.map!(a=>cast(ubyte)a).staticArray!25);
				backgroundbuffer.popFront;
				bgoffset=32;
			}
			drawbullets(b);
			drawplayer(p);
			p.update(b);
			b.update;
			es.update(eb);
			DrawText("Hello, World!", 10,10, 20, Colors.WHITE);
			//DrawFPS(10,10);
		EndDrawing();
	}
	CloseWindow();
}