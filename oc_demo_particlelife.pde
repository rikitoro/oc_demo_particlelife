// see https://www.youtube.com/watch?v=xiUpAeos168

int numTypes = 6;
int colorStep = 360/numTypes;
int numParticles = 1000;
ArrayList<particle> swarm;

void setup() {
  size(800, 1000);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  swarm = new ArrayList<particle>();
  for (int i = 0; i < numParticles; i++) {
    swarm.add(new particle()); 
  }

}

void draw() {
  background(0);
  for (particle p: swarm) {
    p.display();
  }
}
