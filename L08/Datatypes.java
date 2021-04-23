/*
    Shapes can be Rectangles and Circles

    Shapes have an area

*/
interface Shape {
	public Integer area ();
}

class Rectangle implements Shape {
	private Integer x,y;

	public Rectangle (Integer x, Integer y) {
		this.x = x;
		this.y = y;
	}

	@Override
	public Integer area (){
		return x*y;
	}

}

class Circle implements Shape {

	private Integer r;
	public Circle (Integer r) {
		this.r = r;
	}

	@Override
	public Integer area (){
		return 3*r*r;
	}

}


