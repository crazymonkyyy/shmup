import raylib;
import types;
import basic;
import gameplay;
import consants;

enum windowx=playfieldx;
enum windowy=playfieldy;

void main(){
	mixin(import("drawing.mix"));
	player p;
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
			p.update(b);
			draw(p);
			b.update;
			draw(b);
			import lazyspawner;
			
			bs.update(b,sounds);
			ms.update(b,sounds);
			ss.update(b,sounds);
			//sounds.playtempsound;
			spawn(bs,ms,ss);
		EndDrawing();
	}
	CloseWindow();
}