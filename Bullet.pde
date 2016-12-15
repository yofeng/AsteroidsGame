class Bullet extends Floater
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
	
	public Bullet(Spaceship theShip)
	{
		myCenterX = yoShip.getX();
		myCenterY = yoShip.getY();
		myPointDirection = yoShip.getPointDirection();
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5 * Math.cos(dRadians) + myDirectionX;
		myDirectionY = 5 * Math.sin(dRadians) + myDirectionY;
	}
	public void show()
	{
		fill(255);
		ellipse(10, 10, 5, 5);
	}
}