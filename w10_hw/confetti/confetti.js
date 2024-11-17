// class Confetti {

class Confetti {

    // float[] pos;
    // float[] vel;
    // float[] size;
    // int colour;
    // float ang;
    // float angVel;

    // Confetti(float x, float y,
    //   float w, float h,
    //   int colour,
    //   float force, float angForce) {
    //   pos = new float[2];
    //   vel = new float[2];
    //   size = new float[2];
    //   init(x, y, w, h, colour, force, angForce);
    // }

    constructor(x, y, w, h, colour, force, angForce) {
        this.pos = [x, y];
        this.vel = [0, 0];
        this.size = [w, h];
        this.colour = colour;
        this.init(x, y, w, h, colour, force, angForce);
    }

    // void init(float x, float y,
    //   float w, float h,
    //   int colour,
    //   float force, float angForce) {
    //       pos[0] = x;
    //       pos[1] = y;
    //       size[0] = w;
    //       size[1] = h;
    //       this.colour = colour;
    //       float randomDir = radians(random(360));
    //       vel[0] = force * cos(randomDir);
    //       vel[1] = force * sin(randomDir);
    //       ang = radians(random(360));
    //       angVel = radians(angForce);
    //     }
    
    init = (x, y, w, h, colour, force, angForce) => {
        this.pos[0] = x;
        this.pos[1] = y;
        this.size[0] = w;
        this.size[1] = h;
        this.colour = colour;
        let randomDir = radians(random(360));
        this.vel[0] = force * cos(randomDir);
        this.vel[1] = force * sin(randomDir);
        this.ang = radians(random(360));
        this.angVel = radians(angForce);
}

    // void update(float[] force, float friction) {
    //   for (int idx = 0; idx < 2; idx++) {
    //     vel[idx] += force[idx];
    //     pos[idx] += vel[idx];
    //     vel[idx] *= friction;
    //   }
    //   ang += angVel;
    //   angVel *= friction;
    // }

    update = (force, friction) => {
        for (let idx = 0; idx < 2; idx++) {
            this.vel[idx] += force[idx];
            this.pos[idx] += this.vel[idx];
            this.vel[idx] *= friction;
        }
        this.ang += this.angVel;
        this.angVel *= friction;
    }
  
    // void display() {
    //   push();
    //   rectMode(CENTER);
    //   translate(pos[0], pos[1]);
    //   rotate(ang);
    //   noStroke();
    //   fill(colour);
    //   rect(0, 0, size[0], size[1]);
    //   pop();
    // }

    display = () => {
        push();
        rectMode(CENTER);
        translate(this.pos[0], this.pos[1]);
        rotate(this.ang);
        noStroke();
        fill(this.colour);
        rect(0, 0, this.size[0], this.size[1]);
        pop();
    }
    
    // float getDiagonal() {
    //   float sumSquare = pow(size[0] * 0.5, 2) + pow(size[1] * 0.5, 2);
    //   return sqrt(sumSquare);
    // }

    getDiagonal = () => {
        let sumSquare = pow(this.size[0] * 0.5, 2) + pow(this.size[1] * 0.5, 2);
        return sqrt(sumSquare);
    }
    
//     boolean isOutOfScreen() {
//       return pos[0] < -getDiagonal()
//         || pos[0] > width + getDiagonal()
//         || pos[1] < -getDiagonal()
//         || pos[1] > height + getDiagonal();
//     }
//   }

    isOutOfScreen = () => {
        return this.pos[0] < -this.getDiagonal()
            || this.pos[0] > width + this.getDiagonal()
            || this.pos[1] < -this.getDiagonal()
            || this.pos[1] > height + this.getDiagonal();
    }
}