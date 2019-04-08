public class CirclePendulum {

	float xPos;
	float yPos;

	float mass;
	float amplitude;
	float omega;
	float angleOffset;

	CirclePendulum(float x, float propConst, float m, float amp, float theta){
		this.xPos = x;
		this.omega = sqrt(propConst/m)/60.0;
		this.angleOffset = theta;
		this.mass = m;
		this.amplitude = amp;
	}

	void update(int timer){
		this.yPos = (height/2) + this.amplitude*sin(this.omega*timer+this.angleOffset);
	}

	void display(){
		fill(255,0,0);
		ellipse(this.xPos, this.yPos, 10, 10);
	}
}