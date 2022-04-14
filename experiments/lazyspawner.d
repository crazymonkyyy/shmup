import raylib;
import types;
import basic;
import gameplay;
import consants;
void spawn(ref bigships b,ref midships m,ref smlships s){
	static int i=30;
	if(i!=0){
		i--;
		return;
	}
	i=30;
	switch(uniform(0,3)){
		case 0:
			b~=bigship(Vector2(uniform(0,playfieldx),0),0,uniform(0,2)); break;
		case 1:
			m~=midship(Vector2(uniform(0,playfieldx),0),0,uniform(0,2)); break;
		case 2:
			s~=smlship(Vector2(uniform(0,playfieldx),0),uniform(0,2)); break;
		default:
	}
}