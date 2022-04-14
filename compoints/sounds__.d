import raylib;
import types;
import basic;
import gameplay;
import consants;

enum windowx=playfieldx;
enum windowy=playfieldy;

void main(){
	mixin(import("drawing.mix"));
	sounds sounds_;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			if(IsKeyPressed(KeyboardKey.KEY_A)){
				
			}
		EndDrawing();
	}
	CloseWindow();
}