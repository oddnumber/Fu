int w;

int numX = 3;
int numY = 4;

Node nodes[];

void setup(){
  noLoop();
  smooth();
  size(700,500);
  background(255);
 
  w = 60;
}

void draw(){
  int inc=1;
 for(int ih=0; ih<numX; ih++){
   
    for(int jh=0; jh<numY; jh++){
       inc++;
      Inst ins = new Inst(jh*2*(w*1.4) + w + 20,ih*2*(w*1.4) + w + 20, inc, w);
      ins.draw();     
    }
  }
  save("connect.png");
}

class Inst{
 float cx;
 float cy;
 int w;
 
 int numPoints;

  Inst(float ix, float iy, int np, int iw){
   cx = ix;
   cy = iy;
   numPoints = np;
   w = iw;
  }
  
  void draw(){
    noFill();
   ellipse(cx,cy,w*2,w*2);
   nodes = new Node[numPoints];
   for(int i=0; i<numPoints; i++){
     float theta = i * ((2 * PI)/numPoints);
     nodes[i] = new Node( cx + cos(theta) * w, cy + sin(theta) * w );
     nodes[i].drawPoint(); 

   }
 
   for(int i=0; i<numPoints; i++){
    for(int j=0; j<numPoints; j++){
      if(i != j){
        line(nodes[i].getX(), nodes[i].getY(), nodes[j].getX(), nodes[j].getY());
      }
    } 
   }
 
  }
}

class Node{
  float x;
  float y;
   
  Node(float nx, float ny){
     x = nx;
     y = ny;
  } 
  
  void drawPoint(){
    fill(0);
    ellipse(x,y,6,6);
    
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
     return y; 
  }

}
