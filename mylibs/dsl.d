import raylib;
import basic;
alias vec2=Vector2;
void indexpointer2d(ref vec2 pos,vec2[][] zones,int zonesize){
	ref whichzone(){
		return zones
			[pos.x.to!int/zonesize % $]
			[pos.y.to!int/zonesize % $];}
	pos.x+=whichzone.x;
	pos.y+=whichzone.y;
}
float frac(float f){
	return f-floor(f);}
void indexpointer2dsubpixel(ref vec2 pos,vec2[2][][] zones,int zonesize){
	ref whichzone(){
		return zones
			[pos.x.to!int/zonesize % $]
			[pos.y.to!int/zonesize % $]
			[frac(pos.x)>.5]
	;}
	pos.x+=whichzone.x.to!int;
	pos.y+=whichzone.y;
	pos.x+=frac(pos.y);
}
void indexpointer2dseasonal(ref vec2 pos,vec2[][][] zones,int zonesize,int i,int seasonlength){
	ref whichzone(){
		return zones
			[pos.x.to!int/zonesize % $]
			[pos.y.to!int/zonesize % $]
			[i/seasonlength % $]
	;}
	pos.x+=whichzone.x;
	pos.y+=whichzone.y;
}
void avoidence(ref vec2 pos,vec2[][] repluser,int zonesize){
	ref which(){
		return repluser
			[pos.x.to!int/zonesize % $]
			[pos.y.to!int/zonesize % $]
		;}
	Vector2 near=which;
	near.x+=pos.x.to!int/zonesize*zonesize;
	near.y+=pos.y.to!int/zonesize*zonesize;
	auto vel=pos-near;
	pos+=Vector2Normalize(vel)*5;
}
void avoidencev2(ref vec2 pos,vec2[][] repluser,int zonesize){
	auto which(){
		return repluser
			[pos.x.to!int/zonesize % $]
			[pos.y.to!int/zonesize % $]
		;}
	auto zone(){
		return Vector2(
			pos.x.to!int/zonesize*zonesize,
			pos.y.to!int/zonesize*zonesize,
		);
	}
		
	Vector2 local;
	local.x=pos.x-zone.x;
	local.y=pos.y-zone.y;
	local.x/=zonesize;
	local.y/=zonesize;
	local.x-=.5;
	local.x-=.5;
	Vector2 store;
	store.x=local.x*which.x-local.y*which.y;
	store.y=local.x*which.y+local.y*which.x;
	store.x-=.5;
	store.y-=.5;
	//near.x+=pos.x.to!int/zonesize*zonesize;
	//near.y+=pos.y.to!int/zonesize*zonesize;
	auto vel=pos-store;
	pos+=Vector2Normalize(vel)*5;
	pos+=vel;
}