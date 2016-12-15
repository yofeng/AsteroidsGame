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
  	private int astRotSpeed = (int)(Math.random())-1;

  	public Asteroid()
	{
		corners = 6;
		xCorners = new int[corners];
		yCorners = new int[corners];
		xCorners[0] = -21;
		yCorners[0] = -18;
		xCorners[1] = 17;
		yCorners[1] = -18;
		xCorners[2] = 13;
		yCorners[2] = 0;
		xCorners[3] = 16;
		yCorners[3] = 15;
		xCorners[4] = -21;
		yCorners[4] = 18;
		xCorners[5] = -15;
		yCorners[5] = 0;
		myColor = color(80,52,52);
		myCenterX = (int)(Math.random()*800);
        myCenterY = (int)(Math.random()*600);
        myDirectionX = (int)(Math.random()*6-3);
        myDirectionY = (int)(Math.random()*6-3);
        myPointDirection = 270;//degrees not radians
	}

	public void move()
	{
		rotate(astRotSpeed);
		super.move();
	}
}
