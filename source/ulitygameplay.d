import types;
import raylib;
import std.algorithm;
import consants;
import basic;
import aiconsants;

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
void update(ref background b,ref player p){
	if(p.isdead){
		foreach(ref e;b.words){
			e=[];
		}
		b.words[7]="    you dead";
	}
}