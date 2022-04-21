import types;
import raylib;
import std.algorithm;
import consants;
import basic;
import aiconsants;

void add(ref enemybullets b,Vector2 from, Vector2[] list){
	int which(Vector2 a){
		return 0;//TODO: make different bullets types
	}
	foreach(e;list){
		b~=bullet(
			from.x.to!int,
			from.y.to!int,
			e.x.to!int,
			e.y.to!int,
			which(e)
		);
}}


void update(ref bigships s,ref enemybullets b){
	import pathfollow;
	foreach(ref e;s){
		e.updatepath(bigshippaths[e.type]);//todo bug fix pathfollow
		if(e.firecd==0){
			e.firecd=bigshipfirecd[e.type];
			b.add(e.pos,bigshipbulletpattens[e.type]);
		}
		e.firecd--;
}}
void update(ref midships s,ref enemybullets b){
	import zonemovement;
	static int i;i++;
	foreach(ref e;s){
		enum temp=[
			[Vector2(1,1),Vector2(-1,1)],
			[Vector2(-1,1),Vector2(1,1)],
		];
		indexpointer2dwithcontainment(e.pos,temp,10,[Vector2(0,1),Vector2(0,-1),Vector2(1,0),Vector2(-1,0),Vector2(1,1)]);
		if(i%midshipfirecd[e.type]==0){
			b.add(e.pos,midshipfirepattern[e.type]);
		}
	}
}//todo update this to be more complex
void update(ref smlships s,ref enemybullets b){
	import dsl;
	static int i;
	i++;
	foreach(ref e;s){
		//enum temp=[
		//	[[Vector2(1,1),Vector2(-1,1)]],
		//	[[Vector2(-1,1),Vector2(1,1)]],
		//];
		indexpointer2dseasonal(e.pos,smlshippattern[e.type],10,i,30);
		if(i%30==0){
			b.add(e.pos,[Vector2(0,5)]);
		}
	}
}
void update(ref enemybullets bs){
	foreach(ref b;bs[]){
		b.x+=b.xv;
		b.y+=b.yv;
	}
}
void update(ref collectables c){
	foreach(ref e;c){
		e.y+=scrollspeed;
	}
}
void update(ref player p){
	enum speed=4;
	if (IsKeyDown(KeyboardKey.KEY_RIGHT)) p.x+=speed;
	if (IsKeyDown(KeyboardKey.KEY_LEFT) ) p.x-=speed; 
	if (IsKeyDown(KeyboardKey.KEY_UP)   ) p.y-=speed; 
	if (IsKeyDown(KeyboardKey.KEY_DOWN) ) p.y+=speed;
	p.x=min(playfieldx-p.w,max(0,p.x));
	p.y=min(playfieldy-p.h,max(0,p.y));
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
void update(ref player p, ref enemybullets b){
	auto box=shipbox[0];
	box.x+=p.x;
	box.y+=p.y;
	foreach(ref b_;b){
		auto bbox=bulletbox[b_.which];
		bbox.x+=b_.x;
		bbox.y+=b_.y;
		if(CheckCollisionRecs(box,bbox)){
			b_.x-=3000;
			"ded".writeln;
		}
	}
}
void update(ref player p, ref collectables c){
	auto box=Rectangle(p.x,p.y,100,100);//todo make a better collision box
	foreach(ref e;c){
		auto r=Rectangle(e.x,e.y,32,32);
		if(CheckCollisionRecs(box,r)){
			e.x=3000;
}}}
void update(ref turrets ts,ref enemybullets e){
	enum firecd=[25,8,14];
	enum bulletlist=[
		[Vector2(0,5)],
		[Vector2(0,8)],
		[Vector2(-2,4),Vector2(0,4),Vector2(2,4)],
	];
	enum offset=Vector2(8,8);
	foreach(ref t;ts){
		t.y+=scrollspeed;
		if(t.firecd--==0){
			t.firecd=firecd[t.which];
			e.add(Vector2(t.x,t.y)+offset,bulletlist[t.which]);
}}}
void update(ref background b,ref player p){
	if(p.isdead){
		foreach(ref e;b.words){
			e=[];
		}
		b.words[7]="    you dead";
	}
}
void update(A)(ref bigships bs,ref bullets b,ref sounds_!A s){
	//foreach(ref e;bs){
	//	foreach(ref f;b){
	//		
	//	}
	//}
	s.playtempsound;
}
/*
void update(ref bullets bs){
	foreach(ref b;bs[]){
		b.x+=b.xv;
		b.y+=b.yv;
	}
}

void update(ref enemyships es,ref enemybullets eb,ref bullets bs,ref sounds deathsounds){
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
					e.hp=100;
					e.y+=3000;
					PlaySoundMulti(deathsounds[e.type/10]);//TODO
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
*/