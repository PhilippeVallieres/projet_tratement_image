class perlin{
float bruit[][];
int perm[];
int x,y,res;
perlin(int x_,int y_,int res_){
x=x_;
y=y_;
res=res_;
 bruit=new float [x][y];
 perm=new int[400];
 GeneratePerm();
for (int x1 = 0; x1 < x; x1++) {
  for (int y1 = 0; y1 < y; y1++) {
  
   bruit[x1][y1] =int((get2DPerlinNoiseValue((float)x1,(float)y1,res)+1)*128);
   
  }
}
}

void GeneratePerm(){
int permprix[]=new int[256];
int permgenerated=0;
int nb=0;
for (int x1 = 0; x1 < 256; x1++) {
permprix[x1]=0;
}
for (int x1 = 0; x1 < 256; x1++) {
permgenerated=0; 
do {
   nb=int(random(-1,255)+1);
  
if(permprix[nb]==0){
 permprix[nb]=1;
 perm[x1]=nb;
 permgenerated=1;
}


}while(permgenerated==0);
}


}

float get2DPerlinNoiseValue(float x, float y, float res)
{
    float tempX,tempY;
    int x0,y0,ii,jj,gi0,gi1,gi2,gi3;
    float unit = 1.0f/sqrt(2);
    float tmp,s,t,u,v,Cx,Cy,Li1,Li2;
    PVector gradient2[];
    gradient2=new PVector[8];
   for (int x1 = 0; x1 < 8; x1++) {
   gradient2[x1]=new PVector();
   }
    
    gradient2[0].x =unit;    gradient2[0].y =unit;
    gradient2[1].x =-unit;   gradient2[1].y =unit;
    gradient2[2].x =unit;    gradient2[2].y =-unit;
    gradient2[3].x =-unit;   gradient2[3].y =-unit;
    gradient2[4].x =1;       gradient2[4].y =0;
    gradient2[5].x =-1;      gradient2[5].y =0;
    gradient2[6].x =0;       gradient2[6].y =-1;
    gradient2[7].x =-0;      gradient2[7].y =-1;
    
    //Adapter pour la résolution
    x /= res;
    y /= res;

    //On récupère les positions de la grille associée à (x,y)
    x0 = (int)(x);
    y0 = (int)(y);

    //Masquage
    ii = x0 & 255;
    jj = y0 & 255;

    //Pour récupérer les vecteurs
    gi0 = perm[ii + perm[jj]] % 8;
    gi1 = perm[ii + 1 + perm[jj]] % 8;
    gi2 = perm[ii + perm[jj + 1]] % 8;
    gi3 = perm[ii + 1 + perm[jj + 1]] % 8;

    //on récupère les vecteurs et on pondère
    tempX = x-x0;
    tempY = y-y0;
    s = gradient2[gi0].x *tempX + gradient2[gi0].y*tempY;

    tempX = x-(x0+1);
    tempY = y-y0;
    t = gradient2[gi1].x *tempX + gradient2[gi1].y*tempY;

    tempX = x-x0;
    tempY = y-(y0+1);
    u = gradient2[gi2].x *tempX + gradient2[gi2].y*tempY;

    tempX = x-(x0+1);
    tempY = y-(y0+1);
    v = gradient2[gi3].x *tempX + gradient2[gi3].y*tempY;


    //Lissage
    tmp = x-x0;
    Cx = 3 * tmp * tmp - 2 * tmp * tmp * tmp;

    Li1 = s + Cx*(t-s);
    Li2 = u + Cx*(v-u);

    tmp = y - y0;
    Cy = 3 * tmp * tmp - 2 * tmp * tmp * tmp;

    return Li1 + Cy*(Li2-Li1);
}



}