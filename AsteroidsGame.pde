//your variable declarations here
Spaceship yoShip;
Star[] yoStar;
//Asteroid yoAsteroid;

public void setup() 
{
  fill(0);
  size(800, 600);
  yoShip = new Spaceship();
  yoStar = new Star[750];
  for(int i = 0; i < yoStar.length; i++)
  {
    yoStar[i]= new Star(); 
  }
//  yoAsteroid = new Asteroid [75];
//  for(int i = 0; i < yoAsteroid.length; i++)
//  {
//    yoAsteroid = new Asteroid(); 
//  }
}
public void draw() 
{
  background(0);
  yoShip.show();
  yoShip.move();
  for(int i = 0; i < yoStar.length; i++)
  {
    yoStar[i].show(); 
  }
//  for(int i = 0; i < yoAsteroid.length; i++)
//  {
//   yoAsteroid.show();
//   yoAsteroid.move(); 
//  }
}
public void keyPressed()
{
  if(key=='w')
    {
      yoShip.accelerate(0.3);
    }
  if(key=='s')
    {
      yoShip.accelerate(-0.3);
    }
  if(key=='a')
    {
      yoShip.rotate(-10);
    }
  if(key=='d')
    {
      yoShip.rotate(10);
    }
  if(key==' ')
  {
    yoShip.hyperspace();
  }
}

class Spaceship extends Floater  
{   
    public void setX(int x) {myCenterX = x;}
    public int getX() {return (int)myCenterX;}
    public void setY(int y) {myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) {x = myDirectionX;}
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY(double y) {y = myDirectionY;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}

    public Spaceship()
    {
        corners = 14;
        xCorners = new int [corners];
        yCorners = new int [corners];
        xCorners[0] = 24;
        xCorners[1] = 8;
        xCorners[2] = 4;
        xCorners[3] = -8;
        xCorners[4] = -8;
        xCorners[5] = -16;
        xCorners[6] = -28;
        xCorners[7] = -16;
        xCorners[8] = -28;
        xCorners[9] = -16;
        xCorners[10] = -8;
        xCorners[11] = -8;
        xCorners[12] = 4;
        xCorners[13] = 8;
        yCorners[0] = 0;
        yCorners[1] = 8;
        yCorners[2] = 16;
        yCorners[3] = 20;
        yCorners[4] = 12;
        yCorners[5] = 16;
        yCorners[6] = 8;
        yCorners[7] = 0;
        yCorners[8] = -8;
        yCorners[9] = -16;
        yCorners[10] = -12;
        yCorners[11] = -20;
        yCorners[12] = -16;
        yCorners[13] = -8;
        myColor = color(100,220,220);
        myCenterX = 400;
        myCenterY = 400;
        myDirectionX = 0;
        myDirectionY = 0;
        myPointDirection = 270;//degrees not radians
    }
    public void hyperspace()
    {
      yoShip.setX((int)(Math.random()*600));
      yoShip.setY((int)(Math.random()*600));
      yoShip.setPointDirection((int)(Math.random()*360));
      yoShip.setDirectionX(0);
      yoShip.setDirectionY(0);
    } 
}
class Star
{
  private int myX, myY;
  public Star()
  {
    myX = (int)(Math.random() * 800);
    myY = (int)(Math.random() * 800);
  }
  public void show()
  {
    fill((int)(Math.random()*25) + 230, 240, (int)(Math.random()*255));
    stroke(100);
    ellipse(myX, myY, 3, 3);
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
    double dRadians = myPointDirection*(Math.PI/180);     
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

    //wraps around screen    
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