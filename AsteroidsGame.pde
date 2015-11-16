SpaceShip ship= new SpaceShip(); 

Star[] starryNight= new Star[100];


  public void setup() 
  {
    
    size(500,500);
    
    noStroke();
    for (int i=0;i<starryNight.length;i++)
    {
        starryNight[i]= new Star();
    }
    
  }
  public void draw() 
  {
    background(0);
    ship.show();
    ship.move();
 for (int i=0;i<starryNight.length;i++)
    {
        starryNight[i].show();
    }
    
   
    
  }
   
   
  class SpaceShip extends Floater  
  {   
      public SpaceShip()
      {
          corners=3;
          xCorners= new int [corners];
          yCorners= new int [corners];
          xCorners[0]= -8;
          yCorners[0]=-8;
          xCorners[1]=16;
          yCorners[1]=0;
          xCorners[2]=-8;
          yCorners[2]=8;
          myCenterX=100;
          myCenterY=100;
          myDirectionX=0;
          myDirectionY=0;
          myPointDirection=90;
     
        myColor=color(254,189,197);
      }
      public void setX(int x){myCenterX=x;}
      public int getX(){return (int)myCenterX;}
      public void setY(int y){myCenterY=y;}
      public int getY(){return (int)myCenterY;}
      public void setDirectionX(double x){myDirectionX=x;}
      public double getDirectionX(){return myDirectionX;}
      public void setDirectionY(double y){myDirectionY=y;}
      public double getDirectionY(){return myDirectionY;}
      public void setPointDirection(int degrees){myPointDirection=degrees;}
      public double getPointDirection(){return myPointDirection;}   
 }
 
 
     class Star
{
    
   private int myX, myY;
    public Star()
    {
        myX= ((int)(Math.random()*495));
        myY= ((int)(Math.random()*495));
    }
    public void show ()
    {
        fill(255,190,127);
        ellipse(myX,myY,3,3);
    
    }
    
    
    }

  public void keyPressed ()
    {
      
        if (keyCode==UP)
        {
          ship.accelerate(1);
        }
        else if (keyCode==DOWN)
        {
            ship.accelerate(-1);
        }
        else if (keyCode==RIGHT)
        {
            ship.rotate(4);
        }
        else if (keyCode==LEFT)
        {
            ship.rotate(-4);
        } 
        else if (keyCode=='h' )//hyperspace
        
        {
            
            ship.setDirectionX(0);
            ship.setDirectionY(0);
            ship.setX((int)(Math.random()*350));
            ship.setY((int)(Math.random()*350));
            ship.setPointDirection((int)(Math.random()*360));
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
  

