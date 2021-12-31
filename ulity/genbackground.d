import raylib;
import types;
import basic;
import gameplay;
import consants;
import std;

enum windowx=playfieldx;
enum windowy=playfieldy;
string exe(string input){
	import std.process;
	auto config=Config.stderrPassThrough;
	return input.executeShell(null,config).output[0..$-1];
}
float rng_(int x,int y,int octive){
	return uniform01();}
alias rng=memoize!rng_;
float lerp(float b,float a, float f){
	return a*f+(1-f)*b;}
float sample_(int octives,float scaling)(float x,float y){//copied form perlin
	float o=0;
	float scale=1;
	float totalscale=0;
	foreach_reverse(i;0..octives){
		int octive=pow(2,i);
		int x_=(x.to!int/octive)*octive;
		int y_=(y.to!int/octive)*octive;
		float xf=(x-x_)/octive;
		float yf=(y-y_)/octive;
		float a=lerp(rng(x_,y_,octive),rng(x_+octive,y_,octive),xf);
		float b=lerp(rng(x_,y_+octive,octive),rng(x_+octive,y_+octive,octive),xf);
		o+=lerp(a,b,yf)*scale;
		
		totalscale+=scale;
		scale*=scaling;
	}
	return o/totalscale;
}
alias sample=sample_!(6,.3);
void main(){
	foreach(y;0..338){
	foreach(x;0..tilerow.length){
		enum scale=.25;
		enum scale2=1;
		float p=sample(x/float(scale),y/float(scale));
		float b=sample((x+1000)/float(scale2),y/float(scale2));
		bool b_=b>.5;
		int o=b_?56:50;
		if(p<.3||(b>.45 && b<.55)){o=42;}
		if(p>.80 ){o=b_?92:86;}
		(cast(char)o).write;
	}
	writeln;
	}
}