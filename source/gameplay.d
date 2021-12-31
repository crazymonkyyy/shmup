import types;
import raylib;
import std.algorithm;
import consants;

void update(ref player p,ref bullets b){
	enum speed=4;
	if (IsKeyDown(KeyboardKey.KEY_RIGHT)) p.x+=speed;
	if (IsKeyDown(KeyboardKey.KEY_LEFT) ) p.x-=speed; 
	if (IsKeyDown(KeyboardKey.KEY_UP)   ) p.y-=speed; 
	if (IsKeyDown(KeyboardKey.KEY_DOWN) ) p.y+=speed;
	p.x=min(playfieldx-p.w,max(0,p.x));
	p.y=min(playfieldy-p.h,max(0,p.y));
	if (IsKeyDown(KeyboardKey.KEY_Z)){
		b~=bullet(p.x,p.y,0,-5,0);
	}
}
void update(ref bullets bs){
	foreach(ref b;bs[]){
		b.x+=b.xv;
		b.y+=b.yv;
	}
}
void update(ref enemyships es,ref enemybullets eb){
	foreach(ref e;es){
		switch(e.type){
			case 1:
			case 11:
			case 22:
				break;
			default: assert(0);
		}
	}
}