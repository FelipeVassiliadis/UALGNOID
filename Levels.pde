class Levels {
    Block[][] blocks = new Block[15][13];
    boolean showLevelMessage = false;
    int displayTime = 3000;
    int numLevel;
    int startTime = -1;
    int numBlocks;
    boolean startedLevel = false;
   
    

    void loadLevel(String levelName) {
        String[] lines = loadStrings(levelName);
        for (int i = 0; i < lines.length; i++) {
            String[] tokens = split(lines[i], ",");
            for (int j = 0; j < tokens.length; j++) {
                float x = unity / 2 + j * unity;
                float y = 2 * unity + i * (unity / 2);
                y += 25;
                int blockType = Integer.parseInt(tokens[j]);

                switch (blockType) {
                    case 1:
                        blocks[i][j] = new Block(x, y, WHITE);
                        break;
                    case 2:
                        blocks[i][j] = new Block(x, y, ORANGE);
                        break;
                    case 3:
                        blocks[i][j] = new Block(x, y, CYAN);
                        break;
                    case 4:
                        blocks[i][j] = new Block(x, y, GREEN);
                        break;
                    case 5:
                        blocks[i][j] = new Block(x, y, RED);
                        break;
                    case 6:
                        blocks[i][j] = new Block(x, y, BLUE);
                        break;
                    case 7:
                        blocks[i][j] = new Block(x, y, PURPLE);
                        break;
                    case 8:
                        blocks[i][j] = new Block(x, y, SILVER);
                        break;
                    case 9:
                        blocks[i][j] = new Block(x, y, GOLD);
                        break;
                    default:
                        blocks[i][j] = null;
                        break;
                }
            }
        }
    }

    void startLevelTimer() {
        startTime = millis();
        showLevelMessage = true;
    }
     int countBlocks() {
         int count = 0;
        for (int i = 0; i < 15; i++) {
            for (int j = 0; j < 13; j++) {
                if (blocks[i][j] != null && blocks[i][j].visible) {
                    count+= 1;
                }
            }
        }
        return count;
    }
    void showLevel(int level) {
        fill(WHITE);
        textSize(50);
        text("Level: " + level, 250, height / 2);
    }

    void keyPressed() {
        if (key == '1') {
            loadLevel("level_1.lvl");
            startLevelTimer();
            numLevel = 1;
            numBlocks = countBlocks();
            startedLevel = true;
        } else if (key == '2') {
            loadLevel("level_2.lvl");
            startLevelTimer();
            numLevel = 2;
            numBlocks = countBlocks();
            startedLevel = true;
        } else if (key == '3') {
            loadLevel("level_3.lvl");
            startLevelTimer();
            numLevel = 3;
            numBlocks = countBlocks();
            startedLevel = true;
        } else if (key == '4') {
            loadLevel("level_4.lvl");
            startLevelTimer();
            numLevel = 4;
            numBlocks = countBlocks();
            startedLevel = true;
        } else if (key == '5') {
            loadLevel("level_5.lvl");
            startLevelTimer();
            numLevel = 5;
            numBlocks = countBlocks();
            startedLevel = true;
        }

        if (key >= '1' && key <= '5') {
            b.launched = false;
            p.x = W_WIDTH / 2 - unity;
            p.y = W_HEIGHT - 2 * unity;
            b.x = p.x + unity;
            b.y = p.y;
        }
    }

    void draw() {
      
        if (numLives >= 0) {
            for (int i = 0; i < 15; i++) {
                for (int j = 0; j < 13; j++) {
                    if (blocks[i][j] != null) {
                        blocks[i][j].draw();
                    }
                }
            }
            
        }
        if (showLevelMessage) {
            if (millis() - startTime < displayTime) {
                showLevel(numLevel);
            } else {
                showLevelMessage = false;
            }
        }
    }
}
