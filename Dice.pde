Die[][] diceGrid;
int gridRows = 3;
int gridCols = 3;
int dieSize = 60;
int padding = 20;
int total;

void setup() {
  size(300, 300);
  noLoop();
  initializeDice();
}

void draw() {
  background(200);
  total = 0;

  for (int i = 0; i < gridRows; i++) {
    for (int j = 0; j < gridCols; j++) {
      diceGrid[i][j].show();
      total += diceGrid[i][j].value;
    }
  }

  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Total: " + total, width / 2, height - padding);
}

// Initializing the grid of dice
void initializeDice() {
  diceGrid = new Die[gridRows][gridCols];
  for (int i = 0; i < gridRows; i++) {
    for (int j = 0; j < gridCols; j++) {
      int x = padding + j * (dieSize + padding);
      int y = padding + i * (dieSize + padding);
      diceGrid[i][j] = new Die(x, y, dieSize);
      diceGrid[i][j].roll();
    }
  }
}

void mousePressed() {
  for (int i = 0; i < gridRows; i++) {
    for (int j = 0; j < gridCols; j++) {
      diceGrid[i][j].roll();
    }
  }
  redraw();
}

class Die {
  int x;
  int y;
  int size;
  int value;

  Die(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.value = 1;
  }

  void roll() {
    this.value = (int) (Math.random() * 6) + 1;
  }

  void show() {
    fill(255);
    stroke(0);
    rect(x, y, size, size, 10);

    fill(0);
    int dotSize = size / 8;

    // calculating positions for dots
    int offset = size / 4;
    int left = x + offset;
    int right = x + size - offset;
    int center = x + size / 2;
    int top = y + offset;
    int middle = y + size / 2;
    int bottom = y + size - offset;

    // drawing the dots based on the die's value
    switch (value) {
      case 1:
        ellipse(center, middle, dotSize, dotSize);
        break;
      case 2:
        ellipse(left, top, dotSize, dotSize);
        ellipse(right, bottom, dotSize, dotSize);
        break;
      case 3:
        ellipse(left, top, dotSize, dotSize);
        ellipse(center, middle, dotSize, dotSize);
        ellipse(right, bottom, dotSize, dotSize);
        break;
      case 4:
        ellipse(left, top, dotSize, dotSize);
        ellipse(right, top, dotSize, dotSize);
        ellipse(left, bottom, dotSize, dotSize);
        ellipse(right, bottom, dotSize, dotSize);
        break;
      case 5:
        ellipse(left, top, dotSize, dotSize);
        ellipse(right, top, dotSize, dotSize);
        ellipse(center, middle, dotSize, dotSize);
        ellipse(left, bottom, dotSize, dotSize);
        ellipse(right, bottom, dotSize, dotSize);
        break;
      case 6:
        ellipse(left, top, dotSize, dotSize);
        ellipse(right, top, dotSize, dotSize);
        ellipse(left, middle, dotSize, dotSize);
        ellipse(right, middle, dotSize, dotSize);
        ellipse(left, bottom, dotSize, dotSize);
        ellipse(right, bottom, dotSize, dotSize);
        break;
      default:
        break;
    }
  }
}
