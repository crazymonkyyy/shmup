import raylib;
import consants;
Vector2[] generatepath(Vector2 start,Vector2 a,Vector2 b, int i){
	import basic;
	int x=start.x.to!int;
	int y=start.y.to!int;
	Vector2[] o;
	void add(){
		o~=Vector2(x,y);
		//o.writeln;
	}
	add;
	x+=a.x.to!int/2;
	y+=a.y.to!int/2;
	add;
	loop:
		x+=b.x.to!int;
		y+=b.y.to!int;
		if(i--==0){
			goto exit;
		}
		add;
		x+=a.x.to!int;
		y+=a.y.to!int;
		if(i--==0){
			goto exit;
		}
		add;
	goto loop;
	exit:
	return o;
}
unittest{
	import basic;
	"---".writeln;
	generatepath(Vector2(0,0),Vector2(10,-10),Vector2(10,10),19).writeln;
}
enum bigshippaths=[
	[Vector2(0,playfieldy*.3333),Vector2(playfieldx,playfieldy*.3333)],
	generatepath(Vector2(0,playfieldy*.2),Vector2(50,100),Vector2(50,-100),15)
		~generatepath(Vector2(playfieldx,playfieldy*.2),Vector2(-50,100),Vector2(-50,-100),15),
];
enum bigshipfirecd=[
	30,30,30];//TODO
enum bigshipbulletpattens=[
	[Vector2(0,5)],
	[Vector2(-2,2),Vector2(0,4),Vector2(2,2)],
];
enum midshippattern=[
	[
		[Vector2(0,1),Vector2(0,5)],
		[Vector2(0,5),Vector2(0,1)],
	],
	[
		[Vector2(-1,1),Vector2(1,1)],
		[Vector2(1,1),Vector2(-1,1)],
	],
];
enum midshipbounds=[
	[Vector2(0,1),Vector2(0,-1),Vector2(1,0),Vector2(-1,0),Vector2(0, 1),],
	[Vector2(0,1),Vector2(0,-1),Vector2(1,0),Vector2(-1,0),Vector2(0,-1),],
	[Vector2(0,0),Vector2(0, 0),Vector2(0,0),Vector2( 0,0),Vector2(0, 0),],
];
enum midshipfirecd=[
	30,30,30];//TODO
enum midshipfirepattern=[
	[Vector2(0,5)],
	[Vector2(-2,2),Vector2(0,4),Vector2(2,2)],
];
enum smlshippattern=[
	[
		[[Vector2(1,1),Vector2(-1,1)],[Vector2(-1,1),Vector2(1,1)]],
		[[Vector2(-1,1),Vector2(1,1)],[Vector2(1,1),Vector2(-1,1)]],
	],
	[
		[[Vector2(1,1),Vector2(-1,0)],[Vector2(-1,1),Vector2(1,0)]],
		[[Vector2(-1,1),Vector2(1,0)],[Vector2(1,1),Vector2(-1,0)]],
	],
];