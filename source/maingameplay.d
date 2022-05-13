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
void update(ref bullets bs){
	foreach(ref b;bs[]){
		b.x+=b.xv;
		b.y+=b.yv;
	}
}