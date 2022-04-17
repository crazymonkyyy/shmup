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
	bullets b;
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
			
			bs.update(b,sounds);
			sounds.playtempsound;
			spawn(bs,ms,ss);
		EndDrawing();
	}
	CloseWindow();
}