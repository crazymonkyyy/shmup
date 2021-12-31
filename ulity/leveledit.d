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
void main(string[] s){
	s.writeln;
	auto buf=File(s[1],"r").byLineCopy;
	mixin(import("drawing.mix"));
	background bg;
	foreach(i;0..35){
		bg~=cast(tilerow)(buf.front.to!string.map!(a=>cast(ubyte)a).staticArray!25);
		buf.popFront;
	}
	int toolx,tooly;
	int tooltip;
	int[91-49] tools;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			drawbackground(bg,0);
			toolx=GetMouseX/32;
			tooly=(playfieldy-GetMouseY)/32;
			DrawRectangleLinesEx(Rectangle(toolx*32,playfieldy-((tooly+1)*32),32,32),4,Colors.GRAY);
			static foreach(key;49..91){ {
				enum i=key-49;
				if(IsKeyPressed(key)){
					if(i==tooltip){
						tools[i]="./tileselector".exe.to!int;
					} else {
						tooltip=i;
			}}}}
			if(IsMouseButtonDown(0)){
				bg[tooly%$][toolx%$]=cast(ubyte)tools[tooltip];
			}
			if(IsKeyDown(KeyboardKey.KEY_SPACE)){
				( cast(string)bg[0]).writeln;
				bg~=cast(tilerow)(buf.front.to!string.map!(a=>cast(ubyte)a).staticArray!25);
				buf.popFront;
			}
		EndDrawing();
	}
}