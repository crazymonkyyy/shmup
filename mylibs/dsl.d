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
	auto vel=which-pos;
	pos+=vel;
}