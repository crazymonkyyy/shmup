import raylib;
import types;
import basic;
import gameplay;
import consants;

enum windowx=playfieldx;
enum windowy=playfieldy;

string exe(string input){
	import std.process;
	auto config=Config.stderrPassThrough;
	return input.executeShell(null,config).output[0..$-1];
}
void main(){
	mixin(import("drawing.mix"));
	player p;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			drawui(p);
			p.update;
			if(IsKeyPressed(KeyboardKey.KEY_A)){
				import std.process;
				p.hp="zenity --entry".exe.to!int;
				p.shield="zenity --entry".exe.to!int;
				p.maxshield="zenity --entry".exe.to!int;
			}
		EndDrawing();
	}
	CloseWindow();
}