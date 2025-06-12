float K = 0.05;
float friction = 0.85;

class particle {
  PVector position;
  PVector velocity;
  int type;

  particle() {
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    type = int(random(numTypes));
  }

  void update() {
    PVector direction = new PVector(0, 0);
    PVector totalForce = new PVector(0, 0);
    PVector acceleration = new PVector(0, 0);
    float dis;
    for (particle p: swarm) {
      if (p != this) {
        direction.mult(0);
        direction = p.position.copy();
        direction.sub(position);
        if (direction.x > 0.5 * width) {
          direction.x -= width;
        }
        if (direction.x < -0.5 * width) {
          direction.x += width;
        }
        if (direction.y > 0.5 * height) {
          direction.y -= height;
        }
        if (direction.y < -0.5 * height) {
          direction.y += height;
        }
        dis = direction.mag();
        direction.normalize();
        if (dis < minDistances[type][p.type]) {
          PVector force = direction.copy();
          force.mult(abs(forces[type][p.type]) * (-3));
          force.mult(map(dis, 0, minDistances[type][p.type], 1, 0));
          force.mult(K);
          totalForce.add(force);
        }
        if(dis < radii[type][p.type]) {
          PVector force = direction.copy();
          force.mult(forces[type][p.type]);
          force.mult(map(dis, 0, radii[type][p.type], 1, 0));
          force.mult(K);
          totalForce.add(force);
        }
      }
    }
    acceleration.add(totalForce);
    velocity.add(acceleration);
    position.add(velocity);
    position.x = (position.x + width) % width;
    position.y = (position.y + height) % height;
    velocity.mult(friction);
  }


  void display() {
    fill(type * colorStep, 100, 100);
    circle(position.x, position.y, 5);
  }

}