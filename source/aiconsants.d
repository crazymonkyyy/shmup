import raylib;
enum Vector2[][][24] aimovement=[
	[	//0
		[Vector2(-99,-99)]
	],
	[	//1
		[Vector2(0,6)],
		[Vector2(0,3)],
		[Vector2(0,2)],
		[Vector2(0,1)],
		[Vector2(0,0)]
	],
	[	//2
		[Vector2(0,2)]
	],
	[	//3
		[Vector2(0,3)]
	],
	[	//4
		[Vector2(0,4)]
	],
	
	[	//5
		[Vector2(0,5)]
	],
	[	//6
		[Vector2(0,0)]
	],
	[	//7
		[Vector2(0,0)]
	],
	[	//8
		[Vector2(0,0)]
	],
	[	//9
		[Vector2(0,0)]
	],
	
	[	//10
		[Vector2(0,0)]
	],
	[	//11
		[Vector2(1,3)],
		[Vector2(1,3)],
		[Vector2(1,3)],
		[Vector2(4,3)],
		[Vector2(-4,3)],
		[Vector2(-1,3)],
		[Vector2(-1,3)],
		[Vector2(-1,3)]
	],
	[	//12
		[Vector2(0,5)]
	],
	[	//13
		[Vector2(0,0)]
	],
	[	//14
		[Vector2(0,0)]
	],
	
	[	//15
		[Vector2(0,0)]
	],
	[	//16
		[Vector2(0,0)]
	],
	[	//17
		[Vector2(0,0)]
	],
	[	//18
		[Vector2(0,0)]
	],
	[	//19
		[Vector2(0,0)]
	],
	
	[	//20
		[Vector2(0,0)]
	],
	[	//21
		[Vector2(0,0)]
	],
	[	//22
		[Vector2(0,7)],
		[Vector2(0,7)],
		[Vector2(0,7)],
		[Vector2(0,7)],
		[Vector2(0,3)]
	],
	[	//23
		[Vector2(0,0)]
	]
];

enum aimovementcell=[
	Vector2(1,1),
	Vector2(1,250),
	Vector2(1,1),
	Vector2(1,1),
	Vector2(1,1),
	//5
	Vector2(1,1),
	Vector2(1,1),
	Vector2(1,1),
	Vector2(1,1),
	Vector2(1,1),
	//10
	Vector2(1,1),
	Vector2(1,30),
	Vector2(1,1),
	Vector2(1,1),
	Vector2(1,1),
	//15
	Vector2(1,1),
	Vector2(1,1),
	Vector2(1,1),
	Vector2(1,1),
	Vector2(1,1),
	//20
	Vector2(1,1),
	Vector2(1,1),
	Vector2(1,30),
	Vector2(1,1),
];
enum int[24] aihp=[
	7,
	7,
	7,
	7,
	7,
	//5
	7,
	7,
	7,
	7,
	7,
	//10
	7,
	7,
	7,
	7,
	7,
	//15
	7,
	7,
	7,
	7,
	7,
	//20
	7,
	7,
	7,
	7
];
enum int[24] aifirerate=[
	7,
	7,
	7,
	7,
	7,
	//5
	7,
	7,
	7,
	7,
	7,
	//10
	7,
	7,
	7,
	7,
	7,
	//15
	7,
	7,
	7,
	7,
	7,
	//20
	7,
	30,
	7,
	7
];
enum Vector2[][][24] aibullets=[
	[	//0
		[Vector2(0,5)]
	],
	[	//1
		[Vector2(0,5)]
	],
	[	//2
		[Vector2(0,5)]
	],
	[	//3
		[Vector2(0,5)]
	],
	[	//4
		[Vector2(0,5)]
	],
	
	[	//5
		[Vector2(0,5)]
	],
	[	//6
		[Vector2(0,5)]
	],
	[	//7
		[Vector2(0,5)]
	],
	[	//8
		[Vector2(0,5)]
	],
	[	//9
		[Vector2(0,5)]
	],
	
	[	//10
		[Vector2(0,5)]
	],
	[	//11
		[Vector2(0,5)]
	],
	[	//12
		[Vector2(0,5)]
	],
	[	//13
		[Vector2(0,5)]
	],
	[	//14
		[Vector2(0,5)]
	],
	
	[	//15
		[Vector2(0,5)]
	],
	[	//16
		[Vector2(0,5)]
	],
	[	//17
		[Vector2(0,5)]
	],
	[	//18
		[Vector2(0,5)]
	],
	[	//19
		[Vector2(0,5)]
	],
	
	[	//20
		[Vector2(0,5)]
	],
	[	//21
		[Vector2(0,5)]
	],
	[	//22
		[Vector2(0,10)]
	],
	[	//23
		[Vector2(0,5)]
	]
];