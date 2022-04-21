import types;
import raylib;
import std.algorithm;
import consants;
import basic;
import aiconsants;

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

void update(A)(ref bigships bs,ref bullets b,ref sounds_!A s){
	//foreach(ref e;bs){
	//	foreach(ref f;b){
	//		
	//	}
	//}
	s.playtempsound;
}