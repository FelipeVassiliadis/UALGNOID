class Pad {
    float x, y;
    int delta = 0;
    int speed = unity / 5;
    int velocityX = 0;

    // Construtor da Classe Pad
    Pad(float x, float y) {
        this.x = x;
        this.y = y;
    }

    void keyPressed() {
        if (keyCode == RIGHT) {
            delta = speed;
        } else if (keyCode == LEFT) {
            delta = -speed;
        } else if (key == ' ' && !b.launched) {
            velocityX = delta;
            b.ballLaunch();
        }
    }

    void keyReleased() {
        if (keyCode == RIGHT || keyCode == LEFT) {
            delta = 0;
        }
    }

    // Limite esquerdo e direito do Pad em relação às Walls
    boolean limits() {
        return (this.x + delta >= unity / 2 && this.x + delta <= 11.5 * unity);
    }

    // Movimento do Pad
    void movement() {
        if (limits()) {
            this.x += delta;
        }
    }

    void draw() {
        movement();
        fill(YELLOW);
        rect(this.x, this.y, 2 * unity, unity / 2);
    }
}
