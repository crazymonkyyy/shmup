struct ringarray(T,int n,bool hasdead=true){
	T[n] array;
	int index=0;
	int length=0;
	ref T opIndex(int i){
		return array[(i+index)%$];}
	auto opIndex(){
		struct range(S){
			S* parent;
			int start;
			int end;
			ref T front(){
				return (*parent)[start];}
			void popFront(){
				start++;
			}
			bool empty(){
				return start >= end;}
		}
		static if(hasdead){
			while(this[0].isdead && length >0){
				index++;length--;
				index%=n;
			}
			import std.algorithm;
			return range!(typeof(this))(&this,0,length).filter!(a=>!a.isdead);
		}else{
			return range!(typeof(this))(&this,0,length);
		}
	}
	void opOpAssign(string s:"~",S)(S a){
		if(length<n){
			this[length]=a;
			length++;
		} else {
			this[0]=a;
			index++;
		}
	}
	auto opDollar(){ return length;}
}
unittest{
	import std;
	struct deadint{
		int i; alias i this;
		bool isdead(){
			return i<0;}
	}
	ringarray!(deadint,10) foo;
	foo~=1;
	foo~=10;
	foreach(ref e;foo[]){
		e.writeln;
		e-=2;
	}
	"hi".writeln;
	foreach(ref e;foo[]){
		e.writeln;
	}
	foo.writeln;
	"what".writeln;
	foreach(ref e;foo[]){
		e.writeln;
	}
}