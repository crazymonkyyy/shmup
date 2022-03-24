import consants;
import raylib;
struct player{
	int x;
	int y;
	enum w=64;
	enum h=64;
	int hp;
	int lives;
	int firecd;
}
struct bigship{
	Vector2 pos;
	int firecd;
	int type;
	int hp;
	enum isdead=false;//TODO:
	Vector2 target=Vector2(float.init,float.init);//make constuctors?
}
struct midship{
	Vector2 pos;
	int firecd;
	int type;
	enum isdead=false;//TODO
}
struct smlship{
	Vector2 pos;
	int type;
	enum isdead=false;//TODO
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
	bool tier;
	bool isdead(){
		return y>playfieldy+100;
	}
}
struct spike{
	int x;
	int y;
	bool isdead(){
		return y>playfieldy+100;
	}
}
struct powerup{
	int x;
	int y;
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
}
import ring;
//todo add shiparrays
alias bigships    =ringarray!(bigship,20);
alias midships    =ringarray!(midship,50);
alias smlships    =ringarray!(smlship,300);
alias turrets     =ringarray!(turret,50);
alias spikes      =ringarray!(spike,50);
alias powerups    =ringarray!(powerup,30);
alias bullets     =ringarray!(bullet,100);
alias enemybullets=ringarray!(bullet,1500);
alias unspawneds  =unspawned[];
alias sounds      =Sound[];
//----
alias tile=ubyte;
alias tilerow=tile[25];
alias background=ringarray!(tilerow,playfieldy/32+2,false);