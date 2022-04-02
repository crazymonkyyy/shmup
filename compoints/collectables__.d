import raylib;
import types;
import basic;
import gameplay;
import consants;

enum windowx=playfieldx;
enum windowy=playfieldy;

void main(){
	mixin(import("drawing.mix"));
	collectables collectables_;
	player player_;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			collectables_~=collect(uniform(0,windowx),0,uniform!collectable);
			player_.update(collectables_);
			player_.update;
			collectables_.update;
			draw(collectables_);
			draw(player_);
		EndDrawing();
	}
}