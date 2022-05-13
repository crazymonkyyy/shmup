import consants;
import raylib;
struct player{
	int x=cast(int)(playfieldx*.5)-w/2;
	int y=cast(int)(playfieldy*.9);
	enum w=64;
	enum h=64;
	int hp=10;
	int shield=5;
	int maxshield=12;
	int lives;
	int firecd;
	int shieldcd=60*7;//mantain it in playergameplay
	bool isdead(){
		return hp==0;}
	enum box=shipbox[0];
}
struct bigship{
	Vector2 pos;
	int firecd;
	int type;
	int hp=30;
	bool isdead(){
		return hp==0;}
	Vector2 target=Vector2(float.init,float.init);//make constuctors?
	auto box(){
		return shipbox[type+1]+pos;}
}
struct midship{
	Vector2 pos;
	int firecd;
	int type;
	int hp=10;
	bool isdead(){
		return hp==0;}
	auto box(){
		return shipbox[type+4]+pos;}
}
struct smlship{
	Vector2 pos;
	int type;
	int hp=5;
	bool isdead(){
		return hp==0;}
	auto box(){
		return shipbox[type+16]+pos;} //todo verify
}
struct unspawned{
	int x;
	int y;
	int type;
}
struct turret{
	int x;
	int y;
	int firecd;
	int which;
	bool isdead(){
		return y>playfieldy+100;
	}
}
enum collectable{mine,life,power,hp}
struct collect{
	int x;
	int y;
	collectable type;
	bool isdead(){
		return y>playfieldy+100;
	}
}
struct bullet{
	int x;
	int y;
	int xv;
	int yv;
	int which;
	bool isdead(){
		return y>playfieldy+100||
		y<-100;
	}
	auto box(){
		return bulletbox[which]+Vector2(x,y);
	}
}
import ring;
alias bigships    =ringarray!(bigship,20);
alias midships    =ringarray!(midship,50);
alias smlships    =ringarray!(smlship,300);
alias turrets     =ringarray!(turret,50);
alias collectables=ringarray!(collect,100);
alias bullets     =ringarray!(bullet,100);
alias enemybullets=ringarray!(bullet,1500);
alias unspawneds  =unspawned[];
//alias sounds      =Sound[];
//----
alias tile=ubyte;
alias tilerow=tile[25];
//alias background=ringarray!(tilerow,playfieldy/32+2,false);
struct background{
	ringarray!(tilerow,playfieldy/32+2,false) tiles;
	string[playfieldy/48+2] words;
	int offset=32;
	void scroll(R)(ref R r,player p){
		offset--;
		if(offset<=0){
			tiles~=r.front;
			r.popFront;
			offset=32;
		}
		if(p.hp==0){//HACK
			words[$/2]="       ded";
		}
	}
}
struct sounds_(FRAME){
	FRAME main;
	ref opDispatch(string s)(){
		return mixin("main."~s);
	}
}