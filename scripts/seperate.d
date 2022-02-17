import basic;
string getstring(int x,int y){
	x*=32;
	y*=32;
	return "32x32+"~x.to!string~"+"~y.to!string;
}
unittest{
	getstring(1,2).writeln;
	getstring(0,0).writeln;
	getstring(3,4).writeln;
}

void main(){
	enum crop=false;
	foreach(i;0..24){
		if(crop){
			"convert -crop ".write;
			getstring(i%4,i/4).write;
			" ".write;
			"assets/ship.png ".write;
		} else {
			"convert -flip ".write;
			"temp/".write;
			i.write;
			".png ".write;
		}
		"temp/".write;
		i.write;
		".png".writeln;
	}
}

//montage temp/{0..23}.png -tile 4x8 -geometry 32x32+0+0 -background transparent snitched.png
//convert -crop 128x192 snitched.png snitched.png 
