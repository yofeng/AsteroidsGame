Spaceship yoyoship;
//your variable declarations here
public void setup() 
{
  size(700, 700);
  yoyoship = new Spaceship();
}
public void draw() 
{
  yoyoship.show();
}
class Spaceship extends Floater  
{   
    public void setX(int x) {x = myX;}
    public void getX() {return myX;}
    public void setY(int y) {y = myY;}
    public void getY() {return myY;}
    public void setDirectionX(double x) {x = myDirectionX;}
    public void getDirectionX() {return myDirectionX;}
    public void setDirectionY(double y) {y = myDirectionY;}
    public void getDirectionY() {return myDirectionY;}
    public void getPointDirection();
    public void setPointDirection(int degrees) {degrees = myPointDirection;}

    public Spaceship()
    {
        corners = 14;
        xCorners = new int [corners];
        yCorners = new int [corners];
        xCorners[0] = 6;
        xCorners[1] = 2;
        xCorners[2] = 1;
        xCorners[3] = -2;
        xCorners[4] = -2;
        xCorners[5] = -4;
        xCorners[6] = -7;
        xCorners[7] = -4;
        xCorners[8] = -7;
        xCorners[9] = -4;
        xCorners[10] = -2;
        xCorners[11] = -2;
        xCorners[12] = 1;
        xCorners[13] = 2;
        yCorners[0] = 0;
        yCorners[1] = 2;
        yCorners[2] = 4;
        yCorners[3] = 5;
        yCorners[4] = 3;
        yCorners[5] = 4;
        yCorners[6] = 2;
        yCorners[7] = 0;
        yCorners[8] = -2;
        yCorners[9] = -4;
        yCorners[10] = -3;
        yCorners[11] = -5;
        yCorners[12] = -4;
        yCorners[13] = -2;
        myColor = color(255);
        myCentery = 350;
        myCenterY = 350;
        myDirectionX = 0;
        myDirectionY = 0;
        myPointDirection = 270;//degrees not radians
    }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

