import basic;
import raylib;
float randomfloat(){
	return uniform(-5,4)+float(uniform(0,1000))/1000;}
Vector2 randomvec(){
	return Vector2(randomfloat,randomfloat);
}
Vector2[] randomarray(){
	Vector2[] o;
	foreach(i;0..uniform(1,7)){
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