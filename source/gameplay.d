import types;
import raylib;
import std.algorithm;
import consants;
import basic;

void update(ref player p,ref bullets b,ref enemybullets eb){
	enum speed=4;
	if (IsKeyDown(KeyboardKey.KEY_RIGHT)) p.x+=speed;
	if (IsKeyDown(KeyboardKey.KEY_LEFT) ) p.x-=speed; 
	if (IsKeyDown(KeyboardKey.KEY_UP)   ) p.y-=speed; 
	if (IsKeyDown(KeyboardKey.KEY_DOWN) ) p.y+=speed;
	p.x=min(playfieldx-p.w,max(0,p.x));
	p.y=min(playfieldy-p.h,max(0,p.y));
	if (IsKeyDown(KeyboardKey.KEY_Z)){
		auto temp=bullet(p.x,p.y,0,-15,0);
		temp.x+=32;
		temp.y+=32;
		temp.x-=bulletoffset.x;
		temp.y-=bulletoffset.y;
		b~=temp;
	}
	auto box=shipbox[0];
	box.x+=p.x;
	box.y+=p.y;
	foreach(ref b_;eb){
		auto bbox=bulletbox[b_.which];
		bbox.x+=b_.x;
		bbox.y+=b_.y;
		if(CheckCollisionRecs(box,bbox)){
			b_.x-=3000;
			//e.hp--;
			//if(e.hp==0){
			//	e.y+=3000;
			//}
			"ded".writeln;
		}
	}
}
void update(ref bullets bs){
	foreach(ref b;bs[]){
		b.x+=b.xv;
		b.y+=b.yv;
	}
}
void update(ref enemybullets bs){
	foreach(ref b;bs[]){
		b.x+=b.xv;
		b.y+=b.yv;
	}
}
void update(ref enemyships es,ref enemybullets eb,ref bullets bs){
	foreach(ref e;es){
		import aiconsants;
		e.x+=aimovement[e.type]
			[cast(ulong)(playfieldy-e.y/aimovementcell[e.type].y)%$]
			[cast(ulong)(e.x/aimovementcell[e.type].x)%$].x;
		e.y+=aimovement[e.type]
			[cast(ulong)(playfieldy-e.y/aimovementcell[e.type].y)%$]
			[cast(ulong)(e.x/aimovementcell[e.type].x)%$].y;
		if(e.firecd!=0){e.firecd--;}
		else{
			e.firecd=aifirerate[e.type];
			bullet b;
			b.x=e.x+16*(e.type<4?2:1);
			b.y=e.y+16*(e.type<4?2:1);
			b.x-=bulletoffset.x;
			b.y-=bulletoffset.y;
			b.xv=cast(int)aibullets[e.type]
				[cast(ulong)(playfieldy-e.y/aimovementcell[e.type].y)%$]
				[cast(ulong)(e.x/aimovementcell[e.type].x)%$].x;
			b.yv=cast(int)aibullets[e.type]
				[cast(ulong)(playfieldy-e.y/aimovementcell[e.type].y)%$]
				[cast(ulong)(e.x/aimovementcell[e.type].x)%$].y;
			eb~=b;
		}
		auto box=shipbox[e.type];
		box.x+=e.x;
		box.y+=e.y;
		foreach(ref b;bs){
			auto bbox=bulletbox[0];
			bbox.x+=b.x;
			bbox.y+=b.y;
			if(CheckCollisionRecs(box,bbox)){
				b.y-=3000;
				e.hp--;
				if(e.hp==0){
					e.y+=3000;
				}
			}
		}
	}
}
enemyship spawn(unspawned u){
	import aiconsants;
	int fcd=aifirerate[u.type];
	int hp=aihp[u.type];
	return enemyship(u.x,-100,u.type,fcd,hp);
}
void update(ref unspawneds u,int scroll,ref enemyships es){
	import std.stdio;
	//scroll.writeln;
	l:
	if(u.length==0){return;}
	if(u[0].y<scroll){
		u[0].writeln;
		es~=spawn(u[0]);
		u=u[1..$];
		goto l;
	}
}