// Lilo Ortiz - TP2
// 93502/9 - Comisión 1

//Declaración de variables
//Imágenes
PImage img1, img2, img3, img4, img5, logo;
//Fuentes
PFont fuente1, fuente2;
//Texto
String texto1, texto2, texto3;
//Números enteros
int estadoPantalla, animacion, medidor, op;
//Colores
color cBotonInactivo, cBotonActivo;

void setup(){
  //Tamaño de la ventana
  size(640, 480);
  
  //Cargar imágenes
  img1 = loadImage("data/img1.jpg");
  img2 = loadImage("data/img2.jpg");
  img3 = loadImage("data/img3.jpg");
  img4 = loadImage("data/img4.jpg");
  img5 = loadImage("data/img5.jpg");
  logo = loadImage("data/avatar-logo.png");
  
  //Cargar fuentes
  fuente1=loadFont("data/Papyrus-Regular-24.vlw");
  fuente2=loadFont("data/ArialMT-14.vlw");
  
  //Iniciar variables
  estadoPantalla = 0;
  animacion=480;
  medidor=0;
  op=0;
  
  cBotonInactivo = color(0,109,165);
  cBotonActivo = color(0,199,255);
  
  
  texto1=("En un exuberante planeta llamado Pandora viven los Na'vi, seres que aparentan ser primitivos pero que en realidad son muy evolucionados. Debido a que el ambiente de Pandora es venenoso, los híbridos humanos/Na'vi, llamados Avatares, están relacionados con las mentes humanas, lo que les permite moverse libremente por Pandora. Jake Sully, un exinfante de marina paralítico se transforma a través de un Avatar, y se enamora de una mujer Na'vi.");
  texto2=("Actúan Zoe Saldaña como Neytiri, Sam Worthington como Jake Sully, Sigourney Weaver como Grace Augustine, Michelle Rodrif como Trudy Chacon, Joel Moore como Norm Spellman, Stephen Lang como el Coronel Miles, Wes Studi como Eytukan, CCH Pounder como Mo'at, entre muchos otros. A este reparte se le suman también los múltiples escenarios, animales y elementos modelados y animados en 3D de manera artificial. El trabajo de los actores se destaca particularmente por sus expresiones faciales, que luego debieron ser aplicadas a sus personajes de manera digital.");
  texto3=("Dirigida por James Cameron y estrenada en 2009, 'Avatar' fue pionera en la construcción estructural y cultural de su universo ficticio. Hace apenas dos años se dio a conocer que se trataría de una saga y se publicó su secuela. Actualmente hay dos películas más, anunciadas para el 2025 y el 2031.");
}

void draw(){
  
  //Pantalla de inicio
  if (estadoPantalla == 0){
    //Fondo y logo
    image(img1,0,0,640,480);
    noStroke();
    fill(0,0,0,200);
    rect(0,0,640,480);
    image(logo,120,140,400,100);
    
    textAlign(CENTER,CENTER);
    
    //Botón para empezar
    //El texto cambia de color cuando pasa el mouse x arriba
    if(mouseY>330 & mouseY<360 & mouseX>270 & mouseX<370 & estadoPantalla == 0){
      fill(cBotonActivo);
    }else{
      fill(cBotonInactivo);
    }
    textFont(fuente1);
    text("Empezar",320,340);
    
  //Pantalla 1
  }else if(estadoPantalla == 1){
    //Fondo
    image(img2,0,0,640,480);
    
    //Fondo del texto
    fill(0,0,0,150);
    rect(0,300,640,200);
    
    //Texto + animación
    textFont(fuente1);
    textSize(48);
    fill(255);
    text("Sinopsis",240,50);
    
    textFont(fuente2);
    textAlign(LEFT, CENTER);
    fill(255);
    text(texto1,100,animacion,440,140);
    if(animacion > 320){
      animacion --;
    }
    //variable en aumento para medir el tiempo porque tuve problemas con millis y frameRate
    else if(animacion <= 320 & medidor < 400){
      medidor++;
    }else if(medidor >= 400){
      estadoPantalla=2;
      medidor=0;
    }
    
  //Pantalla 2
  }else if(estadoPantalla==2){
    image(img3,0,0,640,480);
    
    textFont(fuente1);
    textSize(48);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Elenco",320,50);
    
    //Fondo del texto
    fill(0,0,0,150);
    noStroke();
    rect(0,300,640,200);
    
    //Elenco
    textFont(fuente2);
    textAlign(LEFT, CENTER);
    //La opacidad va en aumento
    fill(255,255,255,op);
    if(op < 400){
      op++;
    }
    text(texto2,100,320,440,140);
    if(op >= 400 & medidor < 300){
      medidor++;
    }else if(medidor >= 300){
      estadoPantalla=3;
      medidor=0;
      animacion=680;
    }
    
  //Pantalla 3
  }else if(estadoPantalla == 3){
    image(img4,0,0,640,480);
    
    textFont(fuente1);
    textSize(48);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Dirección y publicación",320,50);
    
    //Fondo del texto
    fill(0,0,0,150);
    noStroke();
    rect(0,200,640,100);
    
    //Texto que va pasando
    textFont(fuente2);
    fill(255);
    textAlign(LEFT, CENTER);
    text(texto3,animacion,250);
    if(animacion > -2000){
      animacion=animacion-2;
    }else if(animacion <= -2000){
      estadoPantalla = 4;
    }
  }
  
  //Pantalla final
  else{
    //Fondo y logo
    image(img5,0,0,640,480);
    noStroke();
    fill(0,0,0,200);
    rect(0,0,640,480);
    
    textAlign(CENTER,CENTER);
    
    //Botón para empezar
    //El texto cambia de color cuando pasa el mouse x arriba
    if(mouseY>330 & mouseY<360 & mouseX>270 & mouseX<370 & estadoPantalla == 4){
      fill(cBotonActivo);
    }else{
      fill(cBotonInactivo);
    }
    textFont(fuente1);
    text("Reiniciar",320,340);
    
  }
  

}

void mousePressed(){
  if(mouseY>330 & mouseY<360 & mouseX>270 & mouseX<370 & estadoPantalla == 0){
    estadoPantalla=1;
  }else if(mouseY>330 & mouseY<360 & mouseX>270 & mouseX<370 & estadoPantalla == 4){
    estadoPantalla=1;
    animacion=480;
    medidor=0;
    op=0;
  }
}
