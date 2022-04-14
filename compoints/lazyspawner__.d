import raylib;
import types;
import basic;
import gameplay;
import consants;

enum windowx=playfieldx;
enum windowy=playfieldy;

void main(){
	mixin(import("drawing.mix"));
	bigships bs;
	midships ms;
	smlships ss;
	enemybullets eb;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			bs.update(eb);
			draw(bs);
			ms.update(eb);
			draw(ms);
			ss.update(eb);
			draw(ss);
			eb.update;
			draw(eb);
			import lazyspawner;
			spawn(bs,ms,ss);
		EndDrawing();
	}
	CloseWindow();
}