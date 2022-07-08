PImage imgBg;
StringList cities = new StringList("Arlon", "Anvers", "Bruxelles", "Charleroi", "Gand", "Hasselt", "Liège", "Namur", "Ostende", "Tournai");  
String cityClicked = "Bruxelles";
int year = 2022;
String sexeClicked = "F";
int lineSexe = 0;
// FILE
Table table = loadTable("TA_POP_2009_F.csv", "header,csv");

void setup() {
  size(1200, 847);
  // The background image must be the same size as the size() method.
  imgBg = loadImage("Map-Belgium-1200x847.jpg");
}

void draw() {
  // Image BG
  background(imgBg);
  
  // Rect Date
  stroke(0);       // Color contour rectangle
  strokeWeight(5); // Épaisseur 
  fill(255);       // Remplissage
  rect(950, 20, 200, 100, 28);
  // Date
  textSize(90);
  fill(200,2,65);
  text(year, 960, 100);
  
  // Cities
  int cityY = 360;   // Pixel Y départ de la first city
  textSize(25);      // Taille Text
  for (String city : cities){
    if (cityClicked == city){
      fill(200,2,65);  // Color CityClicked
    }
    else{
        fill(0);       // color text city not click
    }
    text(city, 30, cityY);
    cityY = cityY+50;
  }
  
  // SEXE
  textSize(40);        // Taille Text
  fill(247, 121, 224); // color fille
  text("Filles", 1030, 700);
  fill(57, 125, 214); // color gars
  text("Garçons", 1030, 760);
  
  strokeWeight(2); // Épaisseur 
  if (sexeClicked == "M"){
    stroke(57, 125, 214);
    line(1010, 770, 1185, 770);
  }
  else {
    stroke(247, 121, 224);
    line(1010, 710, 1140, 710);
  }
  
}

// Clic Souris
void mousePressed() {
  // CLIC VILLES
  if (mouseX < 150) {
    println (mouseY);
    int cityClickY = 325;
    for (int i = 0; i <= cities.size(); i++){ 
      if (mouseY > cityClickY && mouseY < cityClickY+50){
        cityClicked = cities.get(i);
      }
      cityClickY = cityClickY + 50;
    }
  }
  
  // CLIC SEXE
  if (mouseX > 1000) {
    //cityClicked = mouseY;
    if (mouseY > 670 && mouseY < 710){
      sexeClicked = "F";
    }
    if (mouseY > 710 && mouseY < 775){
      sexeClicked = "M";
    }
  }
}
