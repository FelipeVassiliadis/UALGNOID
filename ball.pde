class Ball {
    float x, y;
    float Vx; // Componente X da velocidade
    float Vy = -5; // Componente Y da velocidade
    float radius = 10;
    boolean launched = false;

    // Construtor da classe Ball
    Ball(float x, float y) {
        this.x = x;
        this.y = y;
    }

    void ballLaunch() {
        launched = true;
        if (p.velocityX > 0) {
            Vx = cos(PI / 4); // Ângulo de 45º se o pad estiver se movendo para a direita
        } else if (p.velocityX < 0) {
            Vx = -cos(PI / 4); // Ângulo de -45º se o pad estiver se movendo para a esquerda
        } else {
            Vx = 0;
        }
        Vy = -5;
    }

    // Movimento da bola
    void movement() {
        if (launched) { // Se a bola foi lançada
            this.x += 5 * Vx;
            this.y += Vy;
        } else { // Caso contrário, segue o pad
            this.x = p.x + unity;
            this.y = p.y; // Ajuste para ficar um pouco acima do pad
        }
    }

    void collisionWithPad() {
        float padCenter = p.x + unity;

        // Calcula a posição relativa da bola em relação ao centro do pad
        float relativeImpactPosition = (x - padCenter) / unity;

        // Define um ângulo de deflexão máximo de 45 graus
        float deflectionAngle = relativeImpactPosition * (PI / 4);

        // Atualiza a velocidade da bola com base no ângulo de deflexão
        Vx = sin(deflectionAngle);
        Vy = -Vy;
    }

    void resetPlay() {
        numLives -= 1;
        b.launched = false;
        p.x = W_WIDTH / 2 - unity;
        p.y = W_HEIGHT - 2 * unity;
        b.x = p.x + unity;
        b.y = p.y;
    }

    // Detector de colisões da bola
    void collision() {
        if (this.x + radius >= W_WIDTH - unity / 2 || this.x - radius <= unity / 2) { // Colisão com as paredes
            Vx = -Vx;
            collisionSound.rewind(); // Rewind do som de colisão
            collisionSound.play(); 
        }

        if (y - radius <= 2.5 * unity) { // Colisão com o teto
            Vy = -Vy;
            collisionSound.rewind(); // Rewind do som de colisão
            collisionSound.play(); 
        }

        if (launched && Vy > 0 && (this.y + radius >= p.y) &&
            (this.x + radius >= p.x && this.x - radius <= p.x + 2 * unity)) { // Colisão com o pad
            collisionWithPad();
            collisionSound.rewind(); // Rewind do som de colisão
            collisionSound.play(); 
        }
        

        if (this.y + radius > (p.y + unity / 2) + 10 && numLives >= 0) { // Colisão com o chão
            resetPlay();
        }else if (numLives < 0){
          Vy = 0;
          Vx = 0;
        }
         
    }

    void update() {
        movement();
        if (launched) {
            collision();
        }
    }

    void draw() {
        update();
        fill(GREY);
        circle(x, y, 2 * radius);
    }
}
