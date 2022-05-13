import types;
import raylib;
import std.algorithm;
import consants;
import basic;
import aiconsants;

void shields(ref player p){ with(p){
	if(shield<maxshield){
		if(shieldcd==0){
			shieldcd=60*7;
			shield++;
		} else {
			shieldcd--;
		}
	} else {
		shieldcd=60*7;
	}
}}
void hit(ref player p){ with(p){
	if(shield>1){
		shield-=2;
	} else {
		hp--;
	}
}}
void update(ref player p){
	enum speed=4;
	if (IsKeyDown(KeyboardKey.KEY_RIGHT)) p.x+=speed;
	if (IsKeyDown(KeyboardKey.KEY_LEFT) ) p.x-=speed; 
	if (IsKeyDown(KeyboardKey.KEY_UP)   ) p.y-=speed; 
	if (IsKeyDown(KeyboardKey.KEY_DOWN) ) p.y+=speed;
	p.x=min(playfieldx-p.w,max(0,p.x));
	p.y=min(playfieldy-p.h,max(0,p.y));
	
	shields(p);
}
void update(ref player p,ref bullets b){
	if (IsKeyDown(KeyboardKey.KEY_Z)){
		auto temp=bullet(p.x,p.y,0,-15,0);
		temp.x+=32;
		temp.y+=32;
		temp.x-=bulletoffset.x;
		temp.y-=bulletoffset.y;
		b~=temp;
	}
}