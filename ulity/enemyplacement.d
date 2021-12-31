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
	enemyships ships;
	int[91-49] tools;
	int bgoffset=0;
	int fielddepeth=0;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			drawbackground(bg,bgoffset);
			toolx=GetMouseX;
			tooly=(playfieldy-GetMouseY);
			DrawRectangleLinesEx(Rectangle(toolx,playfieldy-tooly,32,32),4,Colors.GRAY);
			drawenemys(ships);
			static foreach(key;49..91){ {
				enum i=key-49;
				if(IsKeyPressed(key)){
					if(i==tooltip){
						tools[i]="./shipselector".exe.to!int;
					} else {
						tooltip=i;
			}}}}
			if(IsMouseButtonPressed(0)){
				ships~=enemyship(toolx,playfieldy-tooly,tools[tooltip]);
			}
			if(IsKeyDown(KeyboardKey.KEY_SPACE)){ foreach(i;0..10){
				bgoffset++;
				//( cast(string)bg[0]).writeln;
				if(bgoffset>=32){
					bg~=cast(tilerow)(buf.front.to!string.map!(a=>cast(ubyte)a).staticArray!25);
					buf.popFront;
					bgoffset=0;
				}
				foreach(ref e;ships){
					e.y+=1;
					if(e.y>=playfieldy){
						e.y=fielddepeth;
						e.write;",".write;
						e=ships[0];
						ships.index++;ships.length--;
					}
				}
				fielddepeth++;
			} }
		EndDrawing();
	}
}