import raylib;
import types;
import basic;
import gameplay;
import consants;

enum windowx=400;
enum windowy=400;

void main(){
	import std;
	float rng_(int x,int y,int octive){
		return uniform01();}
	alias rng=memoize!rng_;
	float lerp(float b,float a, float f){
		return a*f+(1-f)*b;}
	float sample_(int octives,float scaling)(float x,float y){
		float o=0;
		float scale=1;
		float totalscale=0;
		foreach_reverse(i;0..octives){
			int octive=pow(2,i);
			int x_=(x.to!int/octive)*octive;
			int y_=(y.to!int/octive)*octive;
			float xf=(x-x_)/octive;
			float yf=(y-y_)/octive;
			float a=lerp(rng(x_,y_,octive),rng(x_+octive,y_,octive),xf);
			float b=lerp(rng(x_,y_+octive,octive),rng(x_+octive,y_+octive,octive),xf);
			o+=lerp(a,b,yf)*scale;
			
			totalscale+=scale;
			scale*=scaling;
		}
		return o/totalscale;
	}
	alias sample=sample_!(6,.5);
	
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	SetWindowPosition(1800,0);
	SetTargetFPS(60);
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			foreach(x;0..400){
			foreach(y;0..400){
				enum scale=10;
				float p=sample(x/float(scale),y/float(scale));
				if(p<.3){p=0;}
				if(p>.5){p=1;}
				ubyte p_=(p*255).to!ubyte;
				DrawPixel(x,y,Color(p_,p_,p_,255));
			}}
		EndDrawing();
	}
}