import java.awt.Rectangle;
abstract class A_MapCell implements Cloneable  {

int numdetuille;
int numdetuilledeco;
int collision;
 
 public A_MapCell clone() {
         try 
        {
          return (A_MapCell) super.clone();
        }
        catch (CloneNotSupportedException e)
        {
            return null;
        }

    }
A_MapCell(int num){
numdetuille =num;

}

int GetNumtuille(){
return numdetuille;
} 
void SetNumtuille(int num){
numdetuille =num;
}

int GetNumtuilledeco(){
return numdetuilledeco;
} 
void SetNumtuilledeco(int num){
numdetuilledeco =num;
}
int Getcollision(){
return collision;
} 
void Setcollision(int colli){
collision =colli;
}

}


class MapCell extends A_MapCell  {


 
  @Override
    public A_MapCell clone() {
        
         return super.clone();
     
    }
MapCell(int num){
super(num);

}

}

class MapRow{
A_MapCell coolones[];

MapRow(int x){
coolones=new MapCell[x];

}
 A_MapCell GetCell(int index){
 return coolones[index];
 }
}




class maptuille{
MapRow Rows[];

int LargeurMap;
int HauteurMap;
MapCell PrototypeMAPCELL;
maptuille(int largeur, int hauteur){ 
  LargeurMap=largeur;
  HauteurMap=hauteur;
  PrototypeMAPCELL=new MapCell(0);
  Rows=new MapRow[HauteurMap];
  MapRow nouvelleranger;
 for (int y = 0; y < HauteurMap ; y++) {
      
   nouvelleranger = new MapRow(LargeurMap);
   
    for (int x = 0; x < LargeurMap; x++) {
        nouvelleranger.coolones[x]=PrototypeMAPCELL.clone();
    }
      
      Rows[y]=nouvelleranger;
  }


}


 public void remplirTuile(float Matricetuile[][],float Matricedeco[][],float Matricecollision[][]) {
   for (int y = 0; y < HauteurMap ; y++) {
      for (int x = 0; x < LargeurMap; x++) {
       Rows[y].coolones[x].SetNumtuille(int(Matricetuile[x][y]));
       Rows[y].coolones[x].SetNumtuilledeco(int(Matricedeco[x][y]));
       Rows[y].coolones[x].Setcollision(int(Matricecollision[x][y]));
      }
  } 

 }
}

public  class Tuile {
  
 int DimmensionTuile ;
  PImage  TextureTuile;
  
  Tuile (int t){
  DimmensionTuile=t;
  }
  
   Rectangle getSourceRectangle(int tileIndex) {
   int row = tileIndex/21; 
   int collumn= tileIndex%21;  
     
    return new Rectangle(collumn * DimmensionTuile, row* DimmensionTuile, DimmensionTuile, DimmensionTuile);
    
  }

  public PImage getTileSetTexture() {
    return TextureTuile;
  }

  public  void setTileSetTexture(PImage tileSetTexture) {
    this.TextureTuile = tileSetTexture;
  }
}

class Camera {
   PVector location = new PVector(0,0);
   
   PVector getLocation() {
    return location;
  }
   void setLocation(PVector loc) {
    location=loc;
  }
  void changeLocation(float x ,float y) {
    location.add(x,y);
  }
}