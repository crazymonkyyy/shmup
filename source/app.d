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
	player p;
	bigships bs;
	midships ms;
	smlships ss;
	enemybullets eb;
	bullets b;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			draw(bg);bgoffset--;
			bg.scroll(backgroundbuffer,p);
			bs.update(eb);
			draw(bs);
			ms.update(eb);
			draw(ms);
			ss.update(eb);
			draw(ss);
			eb.update;
			draw(eb);
			p.update;
			p.update(b);
			p.update(eb,sounds);
			draw(p);
			b.update;
			draw(b);
			drawui(p);
			
			bs.update(b,sounds);
			ms.update(b,sounds);
			ss.update(b,sounds);
			//sounds.playtempsound;

			
			import lazyspawner;
			spawn(bs,ms,ss);
		EndDrawing();
	}
	CloseWindow();
}