import consants;
import raylib;
alias vec2=Vector2;
enum top=playfieldy*(1.0/12);
enum bot=playfieldy*(11.0/12);
enum left=playfieldx*(1.0/8);
enum right=playfieldx*(7.0/8);
enum leftmid=playfieldx*(7.0/16);
enum rightmid=playfieldx*(9.0/16);

int where(vec2 v){
	if(v.y<top){return 1;}
	if(v.y>bot){return 2;}
	if(v.x<left){return 3;}
	if(v.x>right){return 4;}
	if(v.x>leftmid&&
		v.x<rightmid){
			return 5;}
	return 0;
}

void indexpointer2dwithcontainment(ref vec2 pos, vec2[][] zones, int zonesize, vec2[5] edges){
	ref whichzone(){
		if(where(pos)==0){
			import std.conv;
			return zones
				[pos.x.to!int/zonesize % $]
				[pos.y.to!int/zonesize % $];}
		return edges[where(pos)-1];
	}
	pos.x+=whichzone.x;
	pos.y+=whichzone.y;
}