import std;
template counter(){
	template access(int i){
		enum access=mixin("__LINE__");
	}
	template get_(int i,int sentinel){
		static if(access!(i)>sentinel){
			enum get_=i;
		} else {
			enum get_=get_!(i+1,sentinel);
	}}
	template get(int i=__LINE__){
		enum setty=mixin("__LINE__");
		alias get=get_!(0,setty);
	}
}
unittest{
	assert(counter!().get!()==0);
	assert(counter!().get!()==1);
	assert(counter!().get!()==2);
	static foreach(i;0..3){//oh no
		static assert(counter!().get!()==i+3);
	}
}