import raylib;
import types;
import basic;
import gameplay;
import consants;

enum windowx=playfieldx;
enum windowy=playfieldy;

void main(){
	mixin(import("drawing.mix"));
	player player_;
	turrets turrets_;
	enemybullets enemybullets_;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			if(turrets_.length<10){
				turrets_~=turret(uniform(0,playfieldx),0,10,uniform(0,3));}
			turrets_.update(enemybullets_);
			enemybullets_.update;
			player_.update;
			draw(turrets_);
			draw(player_);
			draw(enemybullets_);
		EndDrawing();
	}
}