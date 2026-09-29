import ddf.minim.*;
Minim minim;
AudioPlayer collisionSound;
AudioPlayer loseSound;
AudioPlayer winSound;

final color WHITE = color(255,255,255);
final color GREEN = color(0,255,0);
final color DARK_GREEN = color(0,55,0);
final color RED = color(255,0,0);
final color YELLOW = color(255,255,0);
final color DARK_GREY = color(100,100,100);
final color GREY = color(200,200,200);
final color BLACK = color(0,0,0);
final color SILVER = color(192, 192, 192);
final color GOLD = color(255,215,0);
final color CYAN = color(0, 255, 255); 
final color ORANGE = color(255, 165, 0); 
final color PURPLE = color(128, 0, 128);
final color BLUE = color(0, 0, 255);
final int num_total_life = 3;
final int unity = 50;
final int W_WIDTH = unity*14;
final int W_HEIGHT = unity*18;

boolean showVictoryMessagem = false;
int displayTime; 
int startTime = -1; // Tempo inicial para começar a mostrar a mensagem de game over
boolean showGameOverMessage = false; // Indica se a mensagem de game over deve ser mostrada
int numLives = 3;// começa com 3 e vai decrementando 
int points;
Pad p;
Ball b;
Levels l;
ArrayList<PowerUp> powerUps;
PImage spaceImage;

void walls() {
    fill(YELLOW);
    rect(0, 2 * unity, unity / 2, 16 * unity);
    rect(13.5 * unity, 2 * unity, unity / 2, 16 * unity);
    rect(0, 2 * unity, 18 * unity, unity / 2);
}

void keyPressed() {
    p.keyPressed();
    l.keyPressed();
}

void keyReleased() {
    p.keyReleased();
}

void settings() {
    size(W_WIDTH, W_HEIGHT);
}

void setup() {
   spaceImage = loadImage("spaceImage.jpg"); 
    p = new Pad(W_WIDTH / 2 - unity, W_HEIGHT - 2 * unity);
    b = new Ball(W_WIDTH / 2, W_HEIGHT - 2 * unity);
    l = new Levels();
    minim = new Minim(this);
    collisionSound = minim.loadFile("colisao.mp3"); // Som de colisão
    loseSound = minim.loadFile("gameOver.mp3"); // Som de perda
    winSound = minim.loadFile("victory.mp3"); // Som de vitória
   
}
void gameOver(){
    
    fill(RED);
    textSize(60);
    text("Game Over!",200,W_HEIGHT/2);
    loseSound.play();
}
void startGameOverTimer() {
    startTime = millis();
    showGameOverMessage = true;
}
void startVictoryTimer(){
   startTime = millis();
   showVictoryMessagem = true;
}


void draw() {
    background(spaceImage);
    if(numLives >0){
      textSize(50);
      fill(CYAN);
      text("UALGANOID", 230, 50);
      fill(WHITE);
      textSize(30);
      text("Score:" + points, 0, 100);
      fill(WHITE);
      textSize(30);
      text("Lives:" + numLives, 600, 100);
      if(l.countBlocks() == 0 && l.startedLevel == true){
        displayTime = 5000;
        if (startTime == -1) {
            startVictoryTimer(); // Inicia o temporizador de game over
        }
        if (showVictoryMessagem) {
            if (millis() - startTime < displayTime) {
                fill(WHITE);
                textSize(100);
                text("Victory!", 200, 500);
                winSound.play();
            } else {
                showGameOverMessage = false; // Reseta a variável para não mostrar mais a mensagem
            }
        }
        
        
        b.launched = false;
        p.x = W_WIDTH / 2 - unity;
        p.y = W_HEIGHT - 2 * unity;
        b.x = p.x + unity;
        b.y = p.y;
      }
      walls();
      p.draw();
      b.draw();
      l.draw();
      
    }else{
      displayTime = 5000;
      if (startTime == -1) {
            startGameOverTimer(); // Inicia o temporizador de game over
        }
        
        // Verifica se deve mostrar a mensagem de game over
        if (showGameOverMessage) {
            if (millis() - startTime < displayTime) {
                gameOver();
            } else {
                showGameOverMessage = false; // Reseta a variável para não mostrar mais a mensagem
            }
        }
    }
    
}
