import raylib;
import types;
import basic;
import gameplay;
import consants;
import dsl;

import pathfollow_;

enum windowx=400;
enum windowy=400;

int cellsize=15;

Vector2[] program;

void main(){
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	SetWindowPosition(1800,0);
	SetTargetFPS(60);
	
	pathfollow[100] points;
	void randompoints(){
		foreach(i;0..100){
			points[i].pos.x=uniform(0,400);
			points[i].pos.y=uniform(0,400);
			points[i].target.x=float.nan;
		}
	}
	void randomprog(){
		import random;
		program=randomarray;
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
				update(points[i],program);
			}}
			foreach(i;0..100){
				DrawCircleV(points[i].pos,5,Colors.BLUE);}
			j++;
		EndDrawing();
	}
}