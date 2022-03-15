import basic;
import raylib;
float randomfloat(){
	return float(uniform(-3000,3000))/1000;}
Vector2 randomvec(){
	return Vector2(randomfloat,randomfloat);
}
Vector2[] randomarray(){
	Vector2[] o;
	foreach(i;0..uniform(4,7)){
		o~=randomvec;
	}
	return o;
}
Vector2[][] randomarrayarray(){
	Vector2[][] o;
	foreach(i;0..uniform(1,7)){
		o~=randomarray;
	}
	return o;
}
Vector2[][][] randomarrayarrayarray(){
	Vector2[][][] o;
	foreach(i;0..uniform(1,7)){
		o~=randomarrayarray;
	}
	return o;
}
Vector2[2] randompair(){
	return [randomvec,randomvec];
}
Vector2[2][] randompairarray(){
	Vector2[2][] o;
	foreach(i;0..uniform(1,7)){
		o~=randompair;
	}
	return o;
}
Vector2[2][][] randompairarrayarray(){
	Vector2[2][][] o;
	foreach(i;0..uniform(1,7)){
		o~=randompairarray;
	}
	return o;
}