
/*-------decorateur---------------*/
public interface  imput{
//class de basse 

   public abstract commande toucheappuyer();
    public abstract void changerdetouche();  
}
public abstract class DecorateurCommande implements imput {
    public imput imputhandle;  
     public abstract commande toucheappuyer();
      public abstract void changerdetouche();
}
public class demo extends DecorateurCommande
{  
   char curenttouche;
    int Intcurenttouche; 
    
    public demo (imput i,char k)
     {   super.imputhandle= i;   curenttouche=k;      
      
    }
     
     public  commande toucheappuyer(){
       genererunetoucheappuyer();
       return imputhandle.toucheappuyer();
     }
     
      public void genererunetoucheappuyer(){
         key=curenttouche;
        
     }
      public void changerdetouche(){
      int  permgenerated=0; 
      int nb;
        do {
            nb=int(random(1,5));
  
           if(nb!=Intcurenttouche){
              permgenerated=1;
              Intcurenttouche=nb;
            }
           

          }while(permgenerated==0);
        switch(Intcurenttouche)
        { case 1: curenttouche='w';
          break;
          case 2: curenttouche='a';
          break;
          case 3: curenttouche='s';
          break;
          case 4: curenttouche='d';
          break;
        
        }
    
    }
}

/*-------commande---------------*/
interface commande{ 
  
  public void bouger(Voiture car);
  
}


public abstract class A_inputhandler implements imput
{ public  void changerdetouche(){};}

class inputhandler  extends A_inputhandler{

commande flechehaut =new movehaut();
commande flechebas = new movebas (); 
commande flechegauche= new movegauche();
commande flechedroite= new movedroite();
   char lasttouche;
   public char keypresseds;
  public commande toucheappuyer()
{
       keypresseds=key;
    if (keypresseds == 'w')
    {  lasttouche=key;
      return flechehaut;
    }
    if (keypresseds == 's')
    {  lasttouche=key;
      return flechebas;
    }
    if (keypresseds == 'a')
    {  lasttouche=key;
      return flechegauche;
    }
    if (keypresseds == 'd')
    {  lasttouche=key;
      return flechedroite;
    }else{
    return null ;}
}

 

}
class movebas implements commande{
      PVector mouvement = new PVector(0,0.4);
     
  public void  bouger(Voiture car){   
  car.applyForce(mouvement);
 }
} 
class movehaut implements commande{
     PVector mouvement = new PVector(0,-0.4);
     
  public void  bouger(Voiture car){   
  car.applyForce(mouvement);
 }
}  
class movegauche implements commande{
      PVector mouvement = new PVector(-0.4,0);
     
  public void  bouger(Voiture car){   
  car.applyForce(mouvement);
 }
}  

class movedroite implements commande{
     PVector mouvement = new PVector(0.4,0);
     
  public void  bouger(Voiture car){   
  car.applyForce(mouvement);
 }
}  