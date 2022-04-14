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
	auto backgroundbuffer=File("gen","r").byLineCopy.map!(a=>cast(tilerow)(a.to!string.map!(a=>cast(ubyte)a).staticArray!25));
		foreach(i;0..35){
			bg.tiles~=backgroundbuffer.front;
			backgroundbuffer.popFront;
	}
	player p;
	bg.words[4]="HIIIII";
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			if(IsKeyPressed(KeyboardKey.KEY_A)){
				p.hp=0;
				"ded".writeln;
			}
			bg.update(p);
			//drawascii(1,100,100);
			//bg~=cast(tilerow)(backgroundbuffer.front.to!string.map!(a=>cast(ubyte)a).staticArray!25);
			draw(bg);bgoffset--;
			bg.scroll(backgroundbuffer);
		EndDrawing();
	}
	CloseWindow();
}