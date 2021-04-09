import java.util.*;


interface Function<A,B> {
	public B call (A a);
}

class PlusOne implements Function<Integer,Integer>{
	@Override
	public Integer call (Integer x){
		return x + 1;
	}
}


public class Curry {
	
	/* a different implementation of the function map in java

              
              input:  a function object
                      map2
              output: a function which takes a list (with elements of type A)
                      and it returns another list (with elements of type B)

	*/
 
	public static <A,B> Function<List<A>,List<B>> map2 (Function<A,B> f) {
		return new Function<List<A>,List<B>>(){
			@Override 
			public List<B> call (List<A> l){
				List<B> result = new LinkedList<B>();
				for (A elem:l){
					result.add(f.call(elem));
				}
				return result;
			}
		};
	}


	/* one implementation of the map function in java*/
	public static <A,B> List<B> map1 (Function<A,B> f, List<A> l){
		List<B> result = new LinkedList<B>();
		for (A elem:l){
			result.add(f.call(elem));
		}
		return result;
	}

	public static void main (String[] args){
		List<Integer> l = new LinkedList<Integer>();
	    l.add(1);l.add(2);l.add(3);

	    Function<Integer,Integer> plusOne = new PlusOne();
	    
	    //usage of map1:
	    List<Integer> test1 = map1(plusOne,l);
	    System.out.println(test1);

	    
	    Function<List<Integer>,List<Integer>> partial = map2(plusOne);

	    List<Integer> test2 = partial.call(l);
	    List<Integer> test3 = partial.call(test2);
	    
	    System.out.println(test2);
		System.out.println(test3);
		
		
	}
}