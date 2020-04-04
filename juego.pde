float posX[];
float posY[];
float posA[];
float posB[];

int status [];
int status2 [];

// inializar
float dist = 0;
float dist2 = 0;
int score = 0;
int time;
PFont font;
PImage bg ;
PImage hamburger;
PImage home;
PImage donut;
int scene = 0;



void setup ()
{
  size (1024, 653);

  bg = loadImage("0.jpg");
  hamburger = loadImage("1.png");
  home = loadImage("2.jpg");
  donut =loadImage("D.png");
  font = loadFont("Calibri-BoldItalic-48.vlw");
  textFont(font);
  initialize();
}
void initialize(){
  
  println("ayudaaa");// prueba de imprimir a ver si ayuda esta monda :v


  posX = new float [100];
  posY = new float [100];
  status = new int [100];
  status2 = new int [100];
  posA= new float [100];
  posB= new float [100];
  
  
  for (int i=0; i<100; i++)
  {
    posX [i] = random (1694);
    posY [i] = random (500);
    posB [i] = random (400);
    posA [i] = random (1000);

    status [i] = 1;
    status2 [i] = 1;
  }
}

void draw ()
{
  println(posY[90]);
  if(posY[90] >=1024){
    initialize();
  }
  if (mousePressed==true) {
    if (scene==0) {
      scene=1;
    }
  }
  switch(scene)
  {
    //-------------------------------case 0------------------------------------
  case 0:

    background(255);
    fill(#323099);
    image(home, 0, 0, 1024, 653);
    text ("¡Empezar!", 390, 50);
  
    break;

    //-------------------------------case 1------------------------------------
  case 1:
    image(bg, 0, 0, 1024, 653);

    for (int i=0; i<100; i++)
    {
      posY[i] = posY[i] + random(1, 1);
       posB[i] = posB[i] + random(1, 1);    
 
     
    }


    //alimentos que caen

    for (int i=0; i<100; i++)
    {
      if (status2 [i] == 1)
      {
        image (hamburger, posA[i], posB[i], 30, 30);// hamburguesa
      }
    }

    for (int i=0; i<100; i++)
    {
      if (status [i] == 1)
      {
        image (donut, posX[i], posY[i], 30, 30); //dona
      }
    }

    for (int i=0; i<100; i++)
    {
      if (mousePressed)
      {
        dist = dist(mouseX, mouseY, posX[i], posY[i]);
        dist2 = dist(mouseX, mouseY, posA[i], posB[i]);
        if (dist <=30)
        {
          status [i] = 0;
        }
        if (dist2 <=30)
        {
          status2 [i] = 0;
        }
      }
    }
    
    fill (250, 250, 250);
    text ("SCORE: " + score, 30, 80);
    score = 0;
    for (int i=0; i<100; i++)
    {
      if (status[i] == 0)
      {
        score = score +1;
      }
      if (status2[i] == 0)
      {
        score = score +1;
      }
    }

    time = millis ()/1000;
    text("TIME: "+time, 740, 80);
  }
}
