public import collisiongameplay;
public import maingameplay;
public import playergameplay;
public import ulitygameplay;




/*

void update(ref enemyships es,ref enemybullets eb,ref bullets bs,ref sounds deathsounds){
	foreach(ref e;es){
		import aiconsants;
		e.x+=aimovement[e.type]
			[cast(ulong)(playfieldy-e.y/aimovementcell[e.type].y)%$]
			[cast(ulong)(e.x/aimovementcell[e.type].x)%$].x;
		e.y+=aimovement[e.type]
			[cast(ulong)(playfieldy-e.y/aimovementcell[e.type].y)%$]
			[cast(ulong)(e.x/aimovementcell[e.type].x)%$].y;
		if(e.firecd!=0){e.firecd--;}
		else{
			e.firecd=aifirerate[e.type];
			bullet b;
			b.x=e.x+16*(e.type<4?2:1);
			b.y=e.y+16*(e.type<4?2:1);
			b.x-=bulletoffset.x;
			b.y-=bulletoffset.y;
			b.xv=cast(int)aibullets[e.type]
				[cast(ulong)(playfieldy-e.y/aimovementcell[e.type].y)%$]
				[cast(ulong)(e.x/aimovementcell[e.type].x)%$].x;
			b.yv=cast(int)aibullets[e.type]
				[cast(ulong)(playfieldy-e.y/aimovementcell[e.type].y)%$]
				[cast(ulong)(e.x/aimovementcell[e.type].x)%$].y;
			eb~=b;
		}
		auto box=shipbox[e.type];
		box.x+=e.x;
		box.y+=e.y;
		foreach(ref b;bs){
			auto bbox=bulletbox[0];
			bbox.x+=b.x;
			bbox.y+=b.y;
			if(CheckCollisionRecs(box,bbox)){
				b.y-=3000;
				e.hp--;
				if(e.hp==0){
					e.hp=100;
					e.y+=3000;
					PlaySoundMulti(deathsounds[e.type/10]);//TODO
				}
			}
		}
	}
}
enemyship spawn(unspawned u){
	import aiconsants;
	int fcd=aifirerate[u.type];
	int hp=aihp[u.type];
	return enemyship(u.x,-100,u.type,fcd,hp);
}
void update(ref unspawneds u,int scroll,ref enemyships es){
	import std.stdio;
	//scroll.writeln;
	l:
	if(u.length==0){return;}
	if(u[0].y<scroll){
		u[0].writeln;
		es~=spawn(u[0]);
		u=u[1..$];
		goto l;
	}
}
*/