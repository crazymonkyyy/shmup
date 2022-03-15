import raylib;
import types;
import basic;
import gameplay;
import consants;

import zonemovement;

enum windowx=playfieldx;
enum windowy=playfieldy;

int cellsize=15;

Vector2[][] program;
Vector2[5] edges=[
	Vector2( 0, 1),
	Vector2( 0,-1),
	Vector2( 1, 0),
	Vector2(-1, 0),
	Vector2( 0.1, 1),
];

void main(){
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	SetWindowPosition(1800,0);
	SetTargetFPS(60);
	
	Vector2[100] points;
	void randompoints(){
		foreach(i;0..100){
			points[i].x=uniform(0,playfieldx);
			points[i].y=uniform(0,playfieldy);
		}
	}
	void randomprog(){
		import random;
		program=randomarrayarray;
		program.writeln;
	}
	randompoints;
	randomprog;
	
	
	int j;
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
			if(true){foreach(i;0..100){
				indexpointer2dwithcontainment(points[i],program,10,edges);
			}}
			foreach(i;0..100){
				DrawCircleV(points[i],5,Colors.BLUE);}
			j++;
		EndDrawing();
	}
}