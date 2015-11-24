SpaceShip ship= new SpaceShip(); 
Asteroids rock= new Asteroids();

Star[] starryNight= new Star[100];
Asteroids[] bunchorocks= new Asteroids[2];

  public void setup() 
  {
    
    size(500,500);
    
    noStroke();
    for (int i=0;i<starryNight.length;i++)
    {
        starryNight[i]= new Star();
    }

    for (int i=0; i<bunchorocks.length; i++)
    {
      bunchorocks[i]= new Asteroids();
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

    for (int i=0; i<bunchorocks.length; i++)
    {
      bunchorocks[i].show();
      bunchorocks[i].move();
    } 

    rock.show();
    rock.move();
    
    

    
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
          myCenterX=150;
          myCenterY=200;
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
        color(255,190,127);
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
            ship.turn(4);
        }
        else if (keyCode==LEFT)
        {
            ship.turn(-4);

        } 
        else if (keyCode==' ' )
        
        {
            
            ship.setDirectionX(0);
            ship.setDirectionY(0);
            ship.setX((int)(Math.random()*350));
            ship.setY((int)(Math.random()*350));
            ship.setPointDirection((int)(Math.random()*360));
        }

      
    }

    class Asteroids extends Floater
    {
      private int rotSpeed;

      public Asteroids ()
      {
        corners=6;
        xCorners= new int[corners];
        yCorners= new int[corners];
        xCorners[0]= -11;
        yCorners[0]= -8;
        xCorners[1]= 7;
        yCorners[1]= -8;
        xCorners[2]= 13;
        yCorners[2]= 0;
        xCorners[3]= 6;
        yCorners[3]= 10;
        xCorners[4]= -11;
        yCorners[4]= 8;
        xCorners[5]= -5;
        yCorners[5]= 0;
        myCenterX=(int)(Math.random()*20);
        myCenterY=(int)(Math.random()*20);
        myDirectionX=(int)(Math.random()*5);
        myDirectionY=(int)(Math.random()*5);
        myPointDirection=90;
        myColor=color(95,78,67);
        rotSpeed=((int)(Math.random()*360))*Math.PI/180;  
      }


      public void move()
      {
         rotate(rotSpeed);
          super.move();
         
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
    public void turn (int nDegreesOfRotation)   
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
   


