import java.awt.Rectangle;
perlin Perlin;
MatriceCreation matricecreation;
maptuille map ; 
Tuile tile ;
Camera camera =new Camera();
imput impuhandler =new inputhandler();
commande Comande;
Voiture voiture;
Collision collision;

int modedemo =0; // 0 pas   1 demo 
int tileSize = 16;
int carreLargeur;
int carreHauteur;
double matriceLargeur;
double matriceHauteur;
int framecounter=0;
void setup() {
 size(1000, 650);
 //fullScreen();
 
 if (modedemo==1) // activation demo 
 {impuhandler= new demo(impuhandler,'w');
  impuhandler.changerdetouche();
 }
 
 carreLargeur=(ceil(width/tileSize))+2;
 carreHauteur=(ceil(height/tileSize))+2;
int x1,y1,res;
res=50;
x1=250;
y1=250;

 matriceLargeur=(x1-1)*tileSize;
  matriceHauteur=(y1-1)*tileSize;
  
  /* creation tuile */
  tile =new Tuile(tileSize);
  PImage img =loadImage("overworld.png");
  tile.setTileSetTexture (img);

Perlin =new perlin(x1,y1,res);
 map = new maptuille(x1,y1);
 
 matricecreation=new MatriceCreation(x1,y1,Perlin.bruit);
 matricecreation.Fillmaricetype();
 matricecreation.Fillmaricetuile();
 map.remplirTuile(matricecreation.Matricetuile, matricecreation.Matricedeco, matricecreation.Matricecollision);
 
 voiture = new Voiture(1.2,  int(random(32,255)), int(random(32,255)) );
 
 collision=new Collision(tileSize,tileSize);
 positiondedepart();
}




void draw() {
  

  
  update() ;
      
}
void  keyPressed(){
 Comande  =impuhandler.toucheappuyer();
   

}
//sélection une bonne position de départ sans collision 
void positiondedepart(){
     int  bonneposition=0; 
      int x;
      int y;
        do {
            x=int(random(1,400));
            y=int(random(1,400));
            
            voiture.location=new PVector (x,y);  
            
              int i;
              i= collision.verifie_colision(map,voiture);
           if(i==0){
              bonneposition=1;
            }
           

          }while(bonneposition==0);


}


 
void draw_maptuile(){

  PVector firstSquare;
 int firstX; 
 int firstY;
 PVector squareOffset; 
 int offsetX;
 int offsetY;
 Rectangle srcRect =new Rectangle();
  

 firstSquare = new PVector(
                                camera.getLocation().x / (float)tileSize,
                                camera.getLocation().y / (float)tileSize);
    firstX = (int) firstSquare.x;
    firstY = (int) firstSquare.y;
    
    /**
     * Calcul pour le décalage pour la camera pour les côtés
     */  
     
     
     squareOffset = new PVector(
                                camera.getLocation().x % tileSize,
                                camera.getLocation().y % tileSize);
     offsetX = (int)squareOffset.x;
     offsetY = (int)squareOffset.y;

for (int y = 0; y < carreHauteur; y++) {
  int positionY = (y * tileSize) - offsetY;

  for (int x = 0; x < carreLargeur; x++) {
    // Va chercher le rectangle de la tuile à afficher
     srcRect = tile.getSourceRectangle(map.Rows[y + firstY].coolones[x + firstX].GetNumtuille());

    image(tile.getTileSetTexture().get((int)srcRect.x, (int)srcRect.y,
        (int)srcRect.width, (int)srcRect.height), (float)(x * tileSize) - offsetX, (float)positionY);
        
        srcRect = tile.getSourceRectangle(map.Rows[y + firstY].coolones[x + firstX].GetNumtuilledeco());

    image(tile.getTileSetTexture().get((int)srcRect.x, (int)srcRect.y,
        (int)srcRect.width, (int)srcRect.height), (float)(x * tileSize) - offsetX, (float)positionY);
        
  
  }
 
}




}

// Calcul la position de la cammera qui est situer dans au point 0,0 del'ecran 
void calcul_positioncam(){
PVector location = new PVector(voiture.get_location().x,voiture.get_location().y);

  if ((location.x +voiture.get_size()) >((matriceLargeur)-(width/2))) {
      location.x = (float) (((matriceLargeur)-(width)));
    } else if (location.x < (width/2) ) {
      location.x = 1;
    }else{location.x= (location.x- (width/2));     }
    
     if (location.y >((matriceHauteur)-(height/2))) {
      location.y = (float)(((matriceHauteur)-(height)));
    } else if (location.y < (height/2) ) {
      location.y = 1;
    }else{location.y=( location.y- (height/2));     }
   camera.setLocation(location);
}

void ralentisement_voiture(){
  PVector mouvement = null;
     PVector direction = null;
    direction=voiture.get_velocity();
    mouvement =direction.copy();
  mouvement=  PVector.mult (mouvement, -0.1);
  voiture.applyForce(mouvement);
}
void update() {
  

  
  //execute au 5 frame 
  if(framecounter==0){
      if (modedemo==1){
      Comande  = impuhandler.toucheappuyer();
      } 
    
      if (Comande != null)
      {
      Comande.bouger(voiture);
      }
      Comande=null;
  
  
     ralentisement_voiture();
   
   // desine juste la map a tout les 5 frame
    draw_maptuile();
    voiture.display(matriceLargeur,matriceHauteur);
  }
  framecounter=framecounter+1;
  if(framecounter>=5){framecounter=0;}
  
  voiture.update();
  
  int i;
  i= collision.verifie_colision(map,voiture);
  if(i==1){ impuhandler.changerdetouche();}
  
  voiture.checkEdges(matriceLargeur,matriceHauteur);
  calcul_positioncam();
  

}