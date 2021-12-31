
import types;
import basic;
import gameplay;
import consants;

enum windowx=playfieldx;
enum windowy=playfieldy;
string exe(string input){
	import std.process;
	auto config=Config.stderrPassThrough;
	return input.executeShell(null,config).output[0..$-1];
}
auto slide3(R)(R r){
	//auto r_=r.array;
	//alias R_=typeof(r_);
	struct s3{
		R range;
		int i;
		auto front(){
			return [range[max(0,i-1)],range[i],range[min($-1,i+1)]];}
		void popFront(){
			i++;}
		bool empty(){
			return i>=range.length;}
		auto opIndex(ulong j){
			j+=i;
			return [range[max(0,j-1)],range[j],range[min($-1,j+1)]];
		}
		auto length(){return range.length-i;}
	}
	return s3(r,0);
}
//unittest{
//	foreach(e;[1,2,3,4].slide3){
//		e.writeln;
//	}
//}
//auto convulision(R)(R r){
auto convulision(R)(R r){
	struct con{
		R range;
		auto yl(){return range.length;}
		auto xl(){return range[0].length;}
		int x;
		int y;
		void popFront(){
			x++;
			if(x>=xl){
				x=0;
				y++;
			}
		}
		bool empty(){
			return y>=yl;
		}
		ubyte[3][3] front(){//hack
			int x1=max(0,y-1);
			int x2=y;
			int x3=min(yl-1,y+1);
			int y1=max(0,x-1);
			int y2=x;
			int y3=min(xl-1,x+1);
			return [
				[range[x1][y1],range[x2][y1],range[x3][y1]],
				[range[x1][y2],range[x2][y2],range[x3][y2]],
				[range[x1][y3],range[x2][y3],range[x3][y3]]
			];
		}
	}
	return con(r,0,0);
}
void main(string[] s){
	auto buf=File(s[1],"r").byLineCopy
		.map!(a=>a.map!(a=>cast(ubyte)a).array).array;
	//auto buf=[[1,2,3,4,5],[11,22,33,44,55],[111,222,333,444,555]];
	ubyte[ubyte[3][3]] lookup;
	int[ubyte[3][3]] importance;
	foreach(e;buf.convulision){
		if(e !in importance){
			importance[e]=0;
		}
		importance[e]++;
	}
	
	foreach(i,e;buf.convulision.enumerate){ 
		if(i%25==24){writeln;};
		if(importance[e]>100 && e[1][1]!=42){
			if(e ! in lookup){
				exe("./drawsmall "~'"'~e.to!string~'"');
				lookup[e]="./tileselector".exe.to!ubyte;
			}
			(cast(char)lookup[e]).write;
		} else {
			(cast(char)e[1][1]).write;
	}}
}