import raylib;
import types;
import basic;
import gameplay;
import consants;
import dsl;

enum windowx=400;
enum windowy=400;

int cellsize=50;

Vector2[][][] program;

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
		program=randomarrayarrayarray;
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
			if(j%5==0){foreach(i;0..100){
				indexpointer2dseasonal(points[i],program,cellsize,j/5,30);
			}}
			foreach(i;0..100){
				DrawCircleV(points[i],5,Colors.BLUE);}
			j++;
		EndDrawing();
	}
}