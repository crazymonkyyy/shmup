import raylib;
import types;
import basic;
void main(string[] s){
	int xcount=s[1].to!int;
	int ycount=s[2].to!int;
	int width=s[3].to!int;
	int height=s[4].to!int;
	string name_=s[5];
	int which=s[6].to!int;
	int scale=8;
	int windowx=scale*width;
	int windowy=scale*height;
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	Texture2D image=LoadTexture(("assets/"~name_~".png").toStringz);
	SetWindowPosition(1800,0);
	SetTargetFPS(60);
	int toolx;
	int tooly;
	int toolxlast;
	int toolylast;
	Rectangle toolr;
	while (!WindowShouldClose()){
		BeginDrawing();
			ClearBackground(Colors.BLACK);
			Rectangle getrect(int i){
				assert(i<=xcount*ycount);
				return Rectangle(
					(i%xcount)*width,
					(i/xcount)*height,
					width,
					height);
			}
			Rectangle scaler(Rectangle r){
				r.x*=scale;
				r.y*=scale;
				r.h*=scale;
				r.w*=scale;
				return r;
			}
			toolx=(GetMouseX+5)/scale;
			tooly=(GetMouseY+5)/scale;
			if(IsMouseButtonPressed(0)){
				toolr=Rectangle(toolxlast,toolylast,toolx-toolxlast,tooly-toolylast);
				toolxlast=toolx;
				toolylast=tooly;
				toolr.writeln; Vector2(toolx,tooly).writeln;
			}
			DrawTextureTiled(image,getrect(which),Rectangle(0,0,width*scale,height*scale),
				Vector2(0,0),0,scale,Colors.WHITE);
			DrawRectangleLinesEx(scaler(toolr),1,Colors.RED);
		EndDrawing();
	}
}