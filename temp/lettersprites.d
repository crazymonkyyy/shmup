import std;
void main(){
	//foreach(l;'A'..char('Z'+1)){
	//	"mv ".writeln("letter",l,".png ",l,".png");
	//}
	//foreach(l;'0'..char('9'+1)){
	//	"mv ".writeln("number",l,".png ",l,".png");
	//}
	int[] x;
	int[] y;
	foreach(s;File("sizes").byLine){
		x~=s[0..2].to!int;
		y~=s[3..5].to!int;
	}
	x.maxElement.writeln;
	y.maxElement.writeln;
}