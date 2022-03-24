import raylib;
import basic;
alias vec2=Vector2;
alias path=vec2[];
//struct pathfollow{
//	vec2 pos;
//	vec2 target;
//}
int processlocation(T)(T f,path p){
	if(f.target.x.isNaN){return 0;}
	int where=p.countUntil(f.target).to!int;
	if(where==-1){return 1;}
	return where+2;
}
vec2[2] findpath(T)(T f,path p){
	float myx=f.pos.x;
	bool last=myx>p[0].x;;
	bool next=true;
	int i=1;
	foreach(j;1..p.length){
		next=myx>p[j].x;
		if(last ^ next){
			i=j.to!int;
			break;
		}
		last=next;
	}
	return [p[i-1],p[1]];
}
float inverselerp(T)(T a,T b,T c){
	b-=a;
	c-=a;
	return c/b;
}
T lerp(T)(T a,T b,float f){
	a*=(1-f);
	b*=f;
	return a+b;
}
void picktarget(T)(ref T f,path p){
	int stage=processlocation(f,p);
	if(stage<2){
		vec2[2] v=findpath(f,p);
		if(stage==0){
			auto a=inverselerp(v[0].x,v[1].x,f.pos.x);
			//if(a<0 ||a >1){a=0;}
			f.target=lerp(v[0],v[1],a);
		}else{
			f.target=v[1];
		}
		return;
	}
	f.target=p[(stage-1)%$];
}
bool neartarget(T)(ref T f){
	if(f.target.x.isNaN){return true;}
	return Vector2Distance(f.pos,f.target)<1;
}
void updatepath(T)(ref T f,path p){
	if(neartarget(f)){
		picktarget(f,p);
	}
	auto a=f.target-f.pos;
	a=Vector2Normalize(a);
	f.pos+=a;
}
