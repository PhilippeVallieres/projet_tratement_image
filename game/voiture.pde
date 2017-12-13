class Voiture {
  PVector location;
  PVector lastlocation;
  PVector velocity;
  PVector acceleration;
   int monte=0; 
   Rectangle colisionbox;
   int largeurhauteur;
  float topSpeed;
  float mass;
  
  Voiture () {
    
    this.location = new PVector (random (width), random (height));    
    this.velocity = new PVector (0, 0);
    this.acceleration = new PVector (0 , 0);
    this.largeurhauteur=10;
    this.mass = 1;

  }  
  
  Voiture (PVector loc, PVector vel) {
    this.location = loc;
    this.velocity = vel;
    this.acceleration = new PVector (0 , 0);
    
    this.topSpeed = 100;
  }
  
  Voiture (float m, float x, float y ) {
    mass = m;
    location = new PVector (x, y);
   
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void update () {
   
    velocity.add (acceleration);
    
    lastlocation= location.copy();
     
    location.add (velocity);

    acceleration.mult (0);
  }
 
  void checkEdges(double l ,double h) {
    if (location.x > l) {
      location.x = (int)(l-30);
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 20;
    }
    
    if (location.y > h) {
      velocity.y = (velocity.y* 0.9)*-1;
      location.y = (int)(h-30);
      monte=0;
    } else if(location.y < 0) {
      velocity.y *=  -1 ;
      location.y =20;
       monte=1;
    }
  }
  
  // place la voiture au bon endroit dans l'ecran et la desine 
  void display (double largeurmap,double hauteurmap) {
   
    int x;
    int y;
    stroke (0);
    fill (102, 133, 133, 127);
    PVector localisationtion = location.copy();
 
     if (localisationtion.x < (width/2) ) {
     x = int(localisationtion.x);
     }
     else if (localisationtion.x>((largeurmap)-(width/2)))
          {
            x = width- (int)(largeurmap- localisationtion.x);
          }
          else{x=(width/2);}
    
     if (localisationtion.y < (height/2) ) {
      y = int(localisationtion.y);
    }else if (localisationtion.y>((hauteurmap)-(height/2)))
          {
            y =  height- (int)(hauteurmap- localisationtion.y);
          }
          else{y=(height/2);}
    
    
    rect (x, y, 10, 10); 
  }
  
  // ralenti la voiture 
  void ralentisement_voiture(){
  PVector mouvement = null;
     PVector direction = null;
    direction=this.get_velocity();
    mouvement =direction.copy();
  mouvement=  PVector.mult (mouvement, -0.1);
  this.applyForce(mouvement);
}
  
  void applyForce (PVector force) {
    PVector f = PVector.div (force, mass);
   
    this.acceleration.add(f);
  }
  void applyForcecollsion (PVector force) {
      
    this.acceleration.add(force);
  }
  
  PVector get_velocity(){
    return this.velocity;
  
  }
  
   PVector get_location(){
    return this.location;
  
  }
  int get_size(){
    return this.largeurhauteur;
  
  }
}