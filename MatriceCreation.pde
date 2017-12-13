class MatriceCreation{
int size_x;
int size_y;
float Matricebruit[][];
float MatriceType[][];  // 1 =eau   2 = terre   3=pelouse  4= montagne  
float Matricetuile[][];
float Matricecollision[][]; // 0 =non   1 =oui 
float Matricedeco[][];

MatriceCreation(int x,int y, float bruit[][]){
size_x=x;
size_y=y;
Matricebruit= bruit;
MatriceType=new float [size_x][size_y];
Matricetuile=new float [size_x][size_y];
Matricecollision=new float [size_x][size_y];
Matricedeco=new float [size_x][size_y];
}

void Fillmaricetype(){
  
  for (int x = 0; x < size_x; x++) {
  for (int y = 0; y < size_y; y++) {
  
   if(Perlin.bruit[x][y]>=180 )
  {MatriceType[x][y]=4;}
   if(Matricebruit[x][y]>=130 && Matricebruit[x][y]<180)
  {MatriceType[x][y]=3;}
  if(Matricebruit[x][y]>110 && Matricebruit[x][y]<130)
  {MatriceType[x][y]=2;}
  if(Matricebruit[x][y]<=110 )
  {MatriceType[x][y]=1;}

  }
}
int i= 1;
i=i+1;
}
void Fillmaricetuile(){
    // bordure roche
  for (int x = 0; x < size_x; x++) 
  {  
     MatriceType[x][0]=4; Matricecollision[x][0]=1; Matricetuile[x][0]=74;   Matricedeco[x][0]=104;
     MatriceType[x][size_y-1]=4; Matricecollision[x][size_y-1]=1; Matricetuile[x][size_y-1]=74; Matricedeco[x][size_y-1]=104;

  }  
  for (int y = 0; y < size_y; y++) 
  {  
     MatriceType[0][y]=4; Matricecollision[0][y]=1; Matricetuile[0][y]=74;   Matricedeco[0][y]=104;
     MatriceType[size_x-1][y]=4; Matricecollision[size_x-1][y]=1; Matricetuile[size_x-1][y]=74; Matricedeco[size_x-1][y]=104;
  
  }  
  
  for (int x = 1; x < size_x-1; x++) {
  for (int y = 1; y < size_y-1; y++) {
    Matricedeco[x][y]=104;
   if(MatriceType[x][y]==2 )
  {   Matricecollision[x][y]=0;
        // gestion eau 
        if(MatriceType[x-1][y]==1 && MatriceType[x+1][y]!=1 && MatriceType[x][y-1]==1  && MatriceType[x][y+1]!=1 )
        {  Matricetuile[x][y]=5; }
        if(MatriceType[x-1][y]!=1 && MatriceType[x+1][y]!=1 && MatriceType[x][y-1]==1  && MatriceType[x][y+1]!=1 )
        {  Matricetuile[x][y]=6; }
         if(MatriceType[x-1][y]!=1 && MatriceType[x+1][y]==1 && MatriceType[x][y-1]==1  && MatriceType[x][y+1]!=1 )
        {  Matricetuile[x][y]=7; }
       
        if(MatriceType[x-1][y]==1 && MatriceType[x+1][y]!=1 && MatriceType[x][y-1]!=1  && MatriceType[x][y+1]!=1 )
        {  Matricetuile[x][y]=26; }
        if(MatriceType[x-1][y]!=1 && MatriceType[x+1][y]!=1 && MatriceType[x][y-1]!=1  && MatriceType[x][y+1]!=1 )
        {  Matricetuile[x][y]=85; }
       
         if(MatriceType[x-1][y]!=1 && MatriceType[x+1][y]!=1 && MatriceType[x][y-1]!=1  && MatriceType[x][y+1]!=1 && MatriceType[x-1][y-1]==1  )
        {  Matricetuile[x][y]=90; }
         if(MatriceType[x-1][y]!=1 && MatriceType[x+1][y]!=1 && MatriceType[x][y-1]!=1  && MatriceType[x][y+1]!=1 && MatriceType[x-1][y+1]==1  )
        {  Matricetuile[x][y]=69; }
         if(MatriceType[x-1][y]!=1 && MatriceType[x+1][y]!=1 && MatriceType[x][y-1]!=1  && MatriceType[x][y+1]!=1 && MatriceType[x+1][y-1]==1  )
        {  Matricetuile[x][y]=89; }
          if(MatriceType[x-1][y]!=1 && MatriceType[x+1][y]!=1 && MatriceType[x][y-1]!=1  && MatriceType[x][y+1]!=1 && MatriceType[x+1][y+1]==1  )
        {  Matricetuile[x][y]=68; }
         if(MatriceType[x-1][y]!=1 && MatriceType[x+1][y]==1 && MatriceType[x][y-1]!=1  && MatriceType[x][y+1]!=1  )
        {  Matricetuile[x][y]=28; }
        
         if(MatriceType[x-1][y]==1 && MatriceType[x+1][y]!=1 && MatriceType[x][y-1]!=1  && MatriceType[x][y+1]==1 )
        {  Matricetuile[x][y]=47; }
        if(MatriceType[x-1][y]!=1 && MatriceType[x+1][y]!=1 && MatriceType[x][y-1]!=1  && MatriceType[x][y+1]==1 )
        {  Matricetuile[x][y]=48; }
         if(MatriceType[x-1][y]!=1 && MatriceType[x+1][y]==1 && MatriceType[x][y-1]!=1  && MatriceType[x][y+1]==1 )
        {  Matricetuile[x][y]=49; }
        
  }
  if(MatriceType[x][y]==1 )
  {   Matricecollision[x][y]=1;
      Matricetuile[x][y]=172;
  } 
  if(MatriceType[x][y]==3 )
  {   Matricecollision[x][y]=0;
      Matricetuile[x][y]=22;
      // pelouse terre  
        if(MatriceType[x-1][y]==2 && MatriceType[x+1][y]!=2 && MatriceType[x][y-1]==2  && MatriceType[x][y+1]!=2 )
        {  Matricetuile[x][y]=66; }
        if(MatriceType[x-1][y]!=2 && MatriceType[x+1][y]!=2 && MatriceType[x][y-1]==2  && MatriceType[x][y+1]!=2 )
        {  Matricetuile[x][y]=106; }
         if(MatriceType[x-1][y]!=2 && MatriceType[x+1][y]==2 && MatriceType[x][y-1]==2  && MatriceType[x][y+1]!=2 )
        {  Matricetuile[x][y]=67; }
       
        if(MatriceType[x-1][y]==2 && MatriceType[x+1][y]!=2 && MatriceType[x][y-1]!=2  && MatriceType[x][y+1]!=2 )
        {  Matricetuile[x][y]=86; }
        if(MatriceType[x-1][y]!=2 && MatriceType[x+1][y]!=2 && MatriceType[x][y-1]!=2  && MatriceType[x][y+1]!=2 )
        {  Matricetuile[x][y]=22; }
       
         if(MatriceType[x-1][y]!=2 && MatriceType[x+1][y]!=2 && MatriceType[x][y-1]!=2  && MatriceType[x][y+1]!=2 && MatriceType[x-1][y-1]==2  )
        {  Matricetuile[x][y]=107; }
         if(MatriceType[x-1][y]!=2 && MatriceType[x+1][y]!=2 && MatriceType[x][y-1]!=2  && MatriceType[x][y+1]!=2 && MatriceType[x-1][y+1]==2  )
        {  Matricetuile[x][y]=65; }
         if(MatriceType[x-1][y]!=2 && MatriceType[x+1][y]!=2 && MatriceType[x][y-1]!=2  && MatriceType[x][y+1]!=2 && MatriceType[x+1][y-1]==2  )
        {  Matricetuile[x][y]=105; }
          if(MatriceType[x-1][y]!=2 && MatriceType[x+1][y]!=2 && MatriceType[x][y-1]!=2  && MatriceType[x][y+1]!=2 && MatriceType[x+1][y+1]==1  )
        {  Matricetuile[x][y]=63; }
         if(MatriceType[x-1][y]!=2 && MatriceType[x+1][y]==2 && MatriceType[x][y-1]!=2  && MatriceType[x][y+1]!=2  )
        {  Matricetuile[x][y]=84; }
        
         if(MatriceType[x-1][y]==2 && MatriceType[x+1][y]!=2 && MatriceType[x][y-1]!=2  && MatriceType[x][y+1]==2 )
        {  Matricetuile[x][y]=87; }
        if(MatriceType[x-1][y]!=2 && MatriceType[x+1][y]!=2 && MatriceType[x][y-1]!=2  && MatriceType[x][y+1]==2 )
        {  Matricetuile[x][y]=64; }
         if(MatriceType[x-1][y]!=2 && MatriceType[x+1][y]==2 && MatriceType[x][y-1]!=2  && MatriceType[x][y+1]==2 )
        {  Matricetuile[x][y]=88; }
      
      
      
  } 
  
  if(MatriceType[x][y]==4 )
  {   Matricecollision[x][y]=1;
      Matricetuile[x][y]=74;
      
        if(MatriceType[x][y]==4 && MatriceType[x+1][y]!=4  )
        {  Matricedeco[x+1][y]=76; }
         if(MatriceType[x][y]==4 && MatriceType[x-1][y]!=4)
        {  Matricedeco[x-1][y]=73; }
         if(MatriceType[x][y]==4 && MatriceType[x][y-1]!=4  )
        {  Matricedeco[x][y-1]=54; }
          if(MatriceType[x][y]==4 && MatriceType[x][y+1]!=4 )
        {  Matricedeco[x][y+1]=179; }
        
  } 

  }
}


}







}