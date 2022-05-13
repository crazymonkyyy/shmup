import types;
import raylib;
import std.algorithm;
import consants;
import basic;
import aiconsants;

void update(A)(ref player p, ref enemybullets b,ref sounds_!A s){
	auto box=shipbox[0];
	box.x+=p.x;
	box.y+=p.y;
	foreach(ref b_;b){
		auto bbox=bulletbox[b_.which];
		bbox.x+=b_.x;
		bbox.y+=b_.y;
		if(CheckCollisionRecs(box,bbox)){
			b_.x-=3000;
			import playergameplay;
			hit(p);
			s.playtempsound;
}}}
void update(ref player p, ref collectables c){
	auto box=p.box;
	foreach(ref e;c){
		auto r=Rectangle(e.x,e.y,32,32);
		if(CheckCollisionRecs(box,r)){
			e.x=3000;
}}}
void update(A)(ref bigships bs,ref bullets b,ref sounds_!A s){
	foreach(ref e;bs){
		foreach(ref f;b){
			if(CheckCollisionRecs(e.box,f.box)){
				e.hp--;
				f.y=playfieldy+101;
				if(e.hp==0){
					s.playtempsound;
					e.pos.y=playfieldy+101;
}}}}}
void update(A)(ref midships bs,ref bullets b,ref sounds_!A s){
	foreach(ref e;bs){
		foreach(ref f;b){
			if(CheckCollisionRecs(e.box,f.box)){
				e.hp--;
				f.y=playfieldy+101;
				if(e.hp==0){
					s.playtempsound;
					e.pos.y=playfieldy+101;
}}}}}
void update(A)(ref smlships bs,ref bullets b,ref sounds_!A s){
	foreach(ref e;bs){
		foreach(ref f;b){
			if(CheckCollisionRecs(e.box,f.box)){
				e.hp--;
				f.y=playfieldy+101;
				if(e.hp==0){
					s.playtempsound;
					e.pos.y=playfieldy+101;
}}}}}
//consider grouping these