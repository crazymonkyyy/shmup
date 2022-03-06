import raylib;
import types;
import basic;
import gameplay;
import consants;
import dsl;

enum windowx=400;
enum windowy=400;

int cellsize=50;

Vector2[][] program=[
	[vec2(1,1),vec2(-1,1)],
	[vec2(0,1)],
	[vec2(-1,1),vec2(1,1),vec2(0,1)],
];

void main(){
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	SetWindowPosition(1800,0);
	SetTargetFPS(60);
	
	Vector2[100] points;
	void randompoints(){
		foreach(i;0..100){
			points[i].x=uniform(0,400);
			points[i].y=uniform(0,400);
		}
	}
	void randomprog(){
		import random;
		program=randomarrayarray;
	}
	randompoints;
	randomprog;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			if(IsKeyPressed(KeyboardKey.KEY_SPACE)){
				randompoints;
			}
			if(IsKeyPressed(KeyboardKey.KEY_ENTER)){
				randomprog;
				program.writeln;
				randompoints;
			}
			foreach(i;0..100){
				indexpointer2d(points[i],program,cellsize);
				DrawCircleV(points[i],5,Colors.BLUE);}
		EndDrawing();
	}
}