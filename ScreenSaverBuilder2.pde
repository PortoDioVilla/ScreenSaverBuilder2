void setup(){
  size(1440, 900);
  PImage target = loadImage("target2.jpg"); 
  int remainder = 1440 - target.width;
  PImage statc= makeStatic(remainder / 2, target.height);
  PImage fin = combineStatics(target, statc);

  if ((fin.width == width) && (fin.height == height)){
  background(fin);}
  
  //FUCKED UP
  else{
    background(255);
    fill(0);
    text("target", 5,470);
    text("width  = "+target.width, 5,450);
    text("height = "+target.height,5,430);
    text("static", 5,400);
    text("width  = "+statc.width, 5,380);
    text("height = "+statc.height,5,360);
    text("total", 5,330);
    text("width  = "+fin.width, 5,310);
    text("height = "+fin.height,5,290);
  }
}
void draw(){
 
}
/** Makes an image of static, whitenoise etc using specified parameters*/
public PImage makeStatic(int x, int y){
  PImage result = createImage(x, y, ARGB);
  result.loadPixels();
  for(int i = 0; i<result.pixels.length; i++){
    result.pixels[i] = color(floor(random(255)),floor(random(255)),floor(random(255)),floor(random(255)));
  }
  result.updatePixels();
  return result;
}

public PImage combineStatics(PImage targetImg, PImage staticImg){
  targetImg.loadPixels(); staticImg.loadPixels();
  
  PImage concatenation = createImage(2*staticImg.width + targetImg.width, targetImg.height, ARGB);
  concatenation.loadPixels();
  
  //variables
  int lbound = staticImg.width;
  int rbound = concatenation.width - staticImg.width;
  
  for(int i = 0; i<concatenation.pixels.length; i++){
    
    int fX = i % concatenation.width;
    int fY = (i - fX) / concatenation.width;
    //left side: 
    if(fX < lbound){
      concatenation.pixels[i] = staticImg.get(fX, fY);
    }
    ///right side
    else if(fX >= rbound){
      concatenation.pixels[i] = staticImg.get(concatenation.width - fX, fY);
     }
    //middle
    else{
      concatenation.pixels[i] = targetImg.get(fX - staticImg.width, fY);
    }
    
  }
  concatenation.updatePixels();
  concatenation.save("result2.jpg");
  return concatenation;
}