class particle {
  PVector position;
  PVector velocity;
  int type;

  particle() {
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    type = int(random(numTypes));
  }

  void display() {
    fill(type * colorStep, 100, 100);
    circle(position.x, position.y, 5);
  }

}