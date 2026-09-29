class PowerUp {
    float x, y;
    float size = 20;
    float speed = 2;
    char type; // 'm' para multiplicação, 'f' para fogo
    boolean active = true;

    PowerUp(float x, float y, char type) {
        this.x = x;
        this.y = y;
        this.type = type;
    }

    void update() {
        if (active) {
            y += speed;
            if (y > height) {
                active = false;
            }
        }
    }

    void draw() {
        if (active) {
            if (type == 'm') {
                fill(0, 0, 255); // Azul para multiplicação
                rect(x, y, size, size);
                fill(255, 0, 0); // Letra 'm' vermelha
                textSize(size);
                textAlign(CENTER, CENTER);
                text('m', x + size / 2, y + size / 2);
            } else if (type == 'f') {
                fill(255, 0, 0); // Vermelho para fogo
                rect(x, y, size, size);
                fill(0, 0, 255); // Letra 'f' azul
                textSize(size);
                textAlign(CENTER, CENTER);
                text('f', x + size / 2, y + size / 2);
            }
        }
    }

    boolean checkCollisionWithPad(Pad pad) {
        if (active && x > pad.x && x < pad.x + 2 * unity && y + size / 2 > pad.y && y - size / 2 < pad.y + unity / 2) {
            active = false;
            return true;
        }
        return false;
    }
}
