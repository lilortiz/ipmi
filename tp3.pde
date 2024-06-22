// Lilo Ortiz - TP2
// 93502/9 - Comisión 1
// Link al video: https://youtu.be/oEiMwWfUbS0

//Declaración de variables

//Números
int estado, tCuadrado;

//Imágenes
PImage imgRefe;

//colores
color cCuadradoClaro, cCuadradoOscuro, crBlanca, crRosa;

//funciones
void dibujarCuadrado(int posX, int posY, int t, color c1){
    //Primer cuadrado (claro)
    noStroke();
    fill(c1);
    rect(posX+400,posY,t,t);
}

void dibujarCruz(int posX, int posY, int t, color c){
    strokeWeight(2);
    stroke(c);
    line(posX,posY,posX+t,posY);
    line(posX+(t/2),posY-(t/2),posX+(t/2),posY-(t/2)+t);
}

void dibujarLineaCruces(int posXInicial, int posY, color c1, color c2){
    dibujarCruz(posXInicial,posY,5,c1);
    dibujarCruz(posXInicial+(25*1),posY,5,c2);
    dibujarCruz(posXInicial+(25*2),posY,5,c2);
    dibujarCruz(posXInicial+(25*3),posY,5,c1);
    dibujarCruz(posXInicial+(25*4),posY,5,c2);
    dibujarCruz(posXInicial+(25*5),posY,5,c1);
    dibujarCruz(posXInicial+(25*6),posY,5,c1);
    
    dibujarCruz(posXInicial+(25*7),posY,5,c1);
    dibujarCruz(posXInicial+(25*8),posY,5,c2);
    dibujarCruz(posXInicial+(25*9),posY,5,c2);
    dibujarCruz(posXInicial+(25*10),posY,5,c1);
    dibujarCruz(posXInicial+(25*11),posY,5,c2);
    dibujarCruz(posXInicial+(25*12),posY,5,c1);
    dibujarCruz(posXInicial+(25*13),posY,5,c1);
}

boolean botonPresionado(int posX, int posY, int ancho, int alto){
  if (mouseX > posX && mouseX < posX+ancho && mouseY > posY && mouseY < posY+alto) {
    return true;
  } else {
    return false;
  }
}

void setup(){
  //Tamaño de la ventana
  size(800, 400);
  
  //cargar imágenes
  imgRefe=loadImage("data/imagenRefe.png");
  
  //inicio de variables
  cCuadradoClaro=color(160,213,60);
  cCuadradoOscuro=color(76,188,129);
  crBlanca=color(255);
  crRosa=color(192,43,149);
  
  estado = 0;
  tCuadrado = 25;
}


void draw(){
  
    //mostrar imagen de referencia
    image(imgRefe,0,0,400,400);
    
    //dibujo de los cuadrados
    for(int inicioY = 0; inicioY < height; inicioY += 25){
      for(int inicioX = 0; inicioX < 16; inicioX += 1){
        if(inicioY%2==0){
          if(inicioX%2==0){
            dibujarCuadrado(inicioX*25,inicioY,tCuadrado,cCuadradoClaro);
          }else{
            dibujarCuadrado(inicioX*25,inicioY,tCuadrado,cCuadradoOscuro);
          }
      
        }else{
          if(inicioX%2==0){
            dibujarCuadrado(inicioX*25,inicioY,tCuadrado,cCuadradoOscuro);
          }else{
            dibujarCuadrado(inicioX*25,inicioY,tCuadrado,cCuadradoClaro);
          }
        
        }
      }
    }
    
    if(estado == 0){
      
      for(int inicioY = 25; inicioY < height; inicioY += 25){
        if(inicioY%2==0){
          dibujarLineaCruces(423,inicioY,crBlanca,crRosa);
        }else{
          dibujarLineaCruces(423,inicioY,crRosa,crBlanca);
        }
      }
      
      fill(0);
      rect(550,300,100,40);
      fill(255);
      textSize(20);
      textAlign(CENTER, CENTER);
      text("Comenzar",600,320);
      
      tCuadrado=25;
      
    }else{
      
      for(int inicioY = 25; inicioY < height; inicioY += 25){
        if(inicioY%2==0){
          dibujarLineaCruces(mouseX,inicioY,crBlanca,crRosa);
        }else{
          dibujarLineaCruces(mouseX,inicioY,crRosa,crBlanca);
        }
      }
      
      fill(255);
      rect(550,300,100,40);
      fill(0);
      textSize(20);
      textAlign(CENTER, CENTER);
      text("Reiniciar",600,320);
    }

}

void mousePressed(){  
  if(estado == 0 & botonPresionado(550,300,100,40) == true){
    estado = 1;
    crRosa=color(random(20,255),random(20,255),random(20,255));
  }else if(estado == 1 & botonPresionado(550,300,100,40) == true){
    estado = 0;
    crRosa=color(192,43,149);
  }
}
