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
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			bs.update;
			draw1(bs);
			ms.update;
			draw2(ms);
			ss.update;
			draw3(ss);
			int counter;
			enum magic=65;
			foreach(i;0..3){
				if(IsKeyPressed(magic+counter++)){
					foreach(j;0..5){
						bs~=bigship(Vector2(uniform(0,playfieldx),0),0,i);
					}
				}
			}
			foreach(i;0..12){
				if(IsKeyPressed(magic+counter++)){
					foreach(j;0..5){
						ms~=midship(Vector2(uniform(0,playfieldx),0),0,i);
					}
				}
			}
			foreach(i;0..8){
				if(IsKeyPressed(magic+counter++)){
					foreach(j;0..5){
						ss~=smlship(Vector2(uniform(0,playfieldx),0),i);
					}
				}
			}
		EndDrawing();
	}
}