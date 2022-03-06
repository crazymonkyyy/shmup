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