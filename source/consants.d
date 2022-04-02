enum playfieldx=800;
enum playfieldy=1080;
enum scrollspeed=1;

//.type<4? : //magic if ship is big copypaste

import raylib;
Rectangle scaler(Rectangle r){
	r.x*=2;
	r.y*=2;
	r.h*=2;
	r.w*=2;
	return r;
}
enum Rectangle[24] shipbox=[
	scaler(Rectangle(11, 13, 10, 7)),
	scaler(Rectangle(1, 4, 30, 24)),
	scaler(Rectangle(0, 4, 32, 24)),
	scaler(Rectangle(0, 5, 32, 23)),
	Rectangle(4, 6, 24, 19),
	
	Rectangle(1, 6, 30, 19),
	Rectangle(5, 7, 22, 18),
	Rectangle(2, 4, 28, 23),//7
	Rectangle(3, 8, 26, 16),
	Rectangle(4, 7, 24, 17),
	
	Rectangle(6, 7, 20, 17),
	Rectangle(4, 7, 24, 17),
	Rectangle(0, 4, 32, 24),//12
	Rectangle(1, 4, 30, 24),
	Rectangle(0, 4, 32, 24),
	
	Rectangle(0, 5, 32, 23),
	Rectangle(4, 6, 24, 19),
	Rectangle(1, 6, 30, 19),
	Rectangle(5, 7, 22, 18),//18
	Rectangle(2, 4, 28, 23),

	Rectangle(3, 8, 26, 16),//20
	Rectangle(4, 7, 24, 17),
	Rectangle(6, 7, 20, 17),
	Rectangle(4, 7, 24, 17)
];
enum Vector2 bulletoffset=Vector2(8,8);
enum Rectangle[] bulletbox=[
	Rectangle(7, 3, 2, 10),
	Rectangle(7, 3, 2, 10),
	Rectangle(5, 5, 6, 6),
	Rectangle(3, 3, 10, 10),
	Rectangle(5, 5, 6, 6)
];
