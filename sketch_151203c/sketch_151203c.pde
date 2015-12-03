int numX = 14;
int numY = 14;
int rW = 12;
int gap = 4;
Square[][] squares;  

int offSetX;
int offSetY;
int totalWidth;

color c1;
color c2;

void setup(){
    hint(ENABLE_STROKE_PURE);

  size(500,500);  
  noLoop();
  noStroke();
  totalWidth = (numX*(rW+gap)); 
  offSetX = width/2 - totalWidth/2;
  offSetY = offSetX;
   squares = new Square[numY][numX];
   c1 = color(204,204,204);
    c2 = color(204,204,204);
 }


void draw(){
  background(255);
  translate(offSetX,offSetY);
  
  for(int i=0; i<numX; i++){
   for(int j=0; j<numY; j++){
     squares[j][i] = new Square(rW, j*(rW+gap), i*(rW+gap));
     if(i==5 && j==5){
       fill(c2);
       squares[j][i].drawRotate();
     }else{
       fill(c1);
       squares[j][i].draw();
     }
     translate(rW+gap,0);
   }
   translate(-totalWidth,0);
   translate(0,rW+gap);
  } 
  save("squares.png");
}

class Square{
   int sw;
    int sox;
   int soy; 
   Square(int w, int ox, int oy){
     sw = w;
     sox = ox;
     soy = oy;
     
   }
   
   void draw(){
//     rect(sox, soy, sox+sw, sox+sw); 
      rect(0,0,sw,sw);
 }
   
   void drawRotate(){
     float howMuch = PI/15;
     rotate(howMuch);
     rect(0,0,sw,sw);
     rotate(-howMuch); 
   }
}   
