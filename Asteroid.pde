class Asteroid extends Floater
{
	public void setX(int x) {myCenterX = x;}
	public int getX() {return (int)myCenterX;}
	public void setY(int y) {myCenterY = y;}
	public int getY() {return (int)myCenterY;}
	public void setDirectionX(double x) {x = myDirectionX;}
	public double getDirectionX() {return (double)myDirectionX;}  
  	public void setDirectionY(double y) {y = myDirectionY;}  
  	public double getDirectionY() {return (double)myDirectionY;}   
  	public void setPointDirection(int degrees) {myPointDirection = degrees;}  
  	public double getPointDirection() {return myPointDirection;}
  	private int astRotSpeed = (int)(Math.random()*2)-1;

  	public Asteroid()
	{
		corners = 6;
		xCorners = new int[corners];
		yCorners = new int[corners];
		xCorners[0] = -11;
		yCorners[0] = -8;
		xCorners[1] = 7;
		yCorners[1] = -8;
		xCorners[2] = 13;
		yCorners[2] = 0;
		xCorners[3] = 6;
		yCorners[3] = 10;
		xCorners[4] = -11;
		yCorners[4] = 8;
		xCorners[5] = -5;
		yCorners[5] = 0;
	}

	public void move()
	{
		rotate(astRotSpeed);
		super.move();
	}
}
