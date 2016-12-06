class Asteroid extends Floater
{
	public void setX(int x) {myCenterX = x;}
	public int getX() {return (int)myCenterX;}
	public void setY(int y) {myCenterY = y;}
	public int getY() {return (int)myCenterY;}
	public void setDirectionX(double x) {x = myDirectionX;}
	public double getDirectionX() {return = (double)myDirectionX;}  
  	public void setDirectionY(double y) {y = myDirectionY;}  
  	public double getDirectionY() {return = (double)myDirectionY;}   
  	public void setPointDirection(int degrees) {myPointDirection = degrees;}  
  	public double getPointDirection() {return myPointDirection;}
  	private int astSpeedRot = (int)(Math.random*2)-1;

  	public Asteroid()
	{

	}
}
