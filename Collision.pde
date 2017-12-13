class Collision{
int size_x;
int size_y;
Collision(int _x,int _y){
size_x=_x;
size_y=_y;

}

int verifie_colision(maptuille map, Voiture car ){
PVector loccation =car.get_location().copy();
 int tuilex=   floor( (loccation.x / 16));
 int tuiley=   floor( (loccation.y / 16));  
 
  int colision =  map.Rows[tuiley].coolones[tuilex].Getcollision();
  
   if(colision==1)
   { PVector forcecolision =car.get_velocity().copy();
     forcecolision= (forcecolision.mult(-1));
      car.applyForcecollsion(forcecolision);
      car.location= car.lastlocation;
       forcecolision= (forcecolision.mult(0.3));
       car.applyForcecollsion(forcecolision);
     return 1;
   }
   return 0;
   
}


}