class Block {
    float x, y, xMin, xMax, yMin, yMax;
    float collisionX, collisionY, distance;
    color c;
    boolean visible; // Estado do bloco
    int timesHit; // Contador de impactos
    boolean isCracked = false; // Indica se o bloco está rachado

    Block(float x, float y, color c) {
        this.xMin = x;
        this.xMax = x + unity;
        this.yMin = y;
        this.yMax = y + unity / 2;
        this.c = c;
        this.visible = true; // Inicialmente visível
        this.timesHit = 0; // Inicialmente sem impactos
    }

    void collisionPoint() {
        // Calculo da coordenada X do ponto de colisão
        if (b.x >= xMin && b.x <= xMax) collisionX = b.x;
        else if (b.x < xMin) collisionX = xMin;
        else if (b.x > xMax) collisionX = xMax;

        // Calculo da coordenada Y do ponto de colisão
        if (b.y >= yMin && b.y <= yMax) collisionY = b.y;
        else if (b.y < yMin) collisionY = yMin;
        else if (b.y > yMax) collisionY = yMax;
    }

    void collisionCheck() {
        distance = dist(collisionX, collisionY, b.x, b.y);
        if (distance <= b.radius && visible) {
            timesHit++;
            collisionSound.rewind(); 
            collisionSound.play(); 
            if (c == SILVER) {
                updateBallSpeed();
                if (timesHit == 1) {
                    isCracked = true; // Marca o bloco como rachado após a primeira colisão
                } else if (timesHit == 2) {
                    visible = false;
                    sum_of_points();
                }
            } else if (c != SILVER && c != GOLD) {
                visible = false;
                updateBallSpeed();
                sum_of_points();
            } else if (c == GOLD) {
                updateBallSpeed();
            }
        }
    }

    void updateBallSpeed() {
        if (collisionX == xMin && b.Vx > 0) b.Vx = -b.Vx;
        else if (collisionX == xMax && b.Vx < 0) b.Vx = -b.Vx;
        if (collisionY == yMin && b.Vy > 0) b.Vy = -b.Vy;
        else if (collisionY == yMax && b.Vy < 0) b.Vy = -b.Vy;
    }

    void sum_of_points() {
        if (c == WHITE) {
            points += 50;
        } else if (c == ORANGE) {
            points += 60;
        } else if (c == CYAN) {
            points += 70;
        } else if (c == GREEN) {
            points += 80;
        } else if (c == RED) {
            points += 90;
        } else if (c == BLUE) {
            points += 100;
        } else if (c == PURPLE) {
            points += 110;
        } else if (c == SILVER) {
            points += 200;
        } else {
            points += 0;
        }
    }

    void display() {
        // Desenhar o bloco com a cor
        fill(c);
        rect(xMin, yMin, unity, unity / 2, 5);
        
        if (isCracked) {
            stroke(0); // Definir a cor da rachadura (preta)
            line(xMin, yMin, xMax, yMax); // Desenhar uma linha diagonal
            line(xMin, yMax, xMax, yMin); // Desenhar outra linha diagonal
        }
    }

    void draw() {
        if (visible) {
            display();
            collisionPoint();
            collisionCheck();
        }
    }
}
