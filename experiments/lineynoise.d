import raylib;
import types;
import basic;
import gameplay;
import consants;

enum windowx=400;
enum windowy=400;

void main(){
	import std;
	float lerp(float b,float a, float f){
		return a*f+(1-f)*b;}
	struct vec2{int x;int y;}
	int dis(vec2 a,vec2 b){
		int dis_(int a,int b){
			if(a>b) return a-b;
			return b-a;
		}
		int disx=dis_(a.x,b.x);
		int disy=dis_(a.y,b.y);
		return dis_(a.x,b.x)+dis_(a.y,b.y);
		//return min(dis_(a.x,b.x),dis_(a.y,b.y));
		//if(max(disx,disy)-min(disx,disy)<10){
		//	return min(disx,disy)-max(disx,disy)+10;
		//}
		//return disx+disy;
		//int a_=dis_(a.x,a.y);
		//int b_=dis_(b.x,b.y);
		//return max(a_,b_);
		//return abs(abs(a.x-b.x)+abs(a.y-b.y))+abs(abs(a.x-b.x)-abs(a.y-b.y));
	}
	vec2 sample_(int w,int h)(int x){
		return vec2(uniform(0,w),uniform(0,h/3));
	}
	alias sample=memoize!(sample_!(windowx,windowy));
	
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	SetWindowPosition(1800,0);
	SetTargetFPS(60);
	int j;
	vec2[] store;
	foreach(e;iota(0,22).map!sample.uniq){
		store~=e;
	}
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			foreach(x;0..400){
			foreach(y;0..400){
				enum scale=3;
				auto f(int i){
					return max(dis(vec2(x,y/scale),store[i]),2);}
				enum octive=0;
				auto mins=iota(0,20).map!f.array; mins.partialSort(octive+2);
				int p=mins[octive]/(mins[octive+1]-1);
				//if(min>100){p=1;}
				ubyte p_=min(p*255,255).to!ubyte;
				DrawPixel(x,y,Color(p_,p_,p_,255));
			}}
			foreach(i;0..20){
				DrawCircle(store[i].x,store[i].y*3,5,Colors.BLUE);}
		EndDrawing();
	}
}