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
struct enemyship{
	int x;
	int y;
	int type;
	int firecd;
	int hp;
	bool isdead(){
		return y>playfieldy+100;
	}
	Rectangle boundingbox(){
		return shipbox[type];
	}
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
alias enemyships  =ringarray!(enemyship,100);
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