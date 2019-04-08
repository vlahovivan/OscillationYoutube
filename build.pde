final int FPS = 60;
final int NUM_OF_CIRCLES = 120;

CirclePendulum[] circles;
float period;

void setup() {
	size(1220,640);
	frameRate(FPS);

	translate(0, height/2);
	ellipseMode(CENTER);

	fill(255,0,0);

	circles = new CirclePendulum[NUM_OF_CIRCLES];

	for(int i = 0; i < NUM_OF_CIRCLES; i++){
		circles[i] = new CirclePendulum(((i+1)*(width/NUM_OF_CIRCLES)), 5.0, 1.0, 0.35*height, i*1.2);
	}

	// (i+1)*(width/NUM_OF_CIRCLES) - distributes the circles across the whole width
	// 5.0 is an arbitrary proportionality constant
	// 1.0 is an arbitrary mass
	// 0.35*height is amplitude of the oscillation, the circles can't go higher than 0.35*height or lower than -0.35*height from the center of the screen
	// i*1.2 -> 1.2 is the angle (in radians) each circle is offset from the previous one


	period = 2*PI*sqrt(0.2); // time it takes a circle to do a full oscillation (in seconds)
}

void draw() {

	background(0);

	for(int i=0; i<NUM_OF_CIRCLES; i++){
		circles[i].update(frameCount);
		circles[i].display();
	}

	/*
	* REMOVE COMMENT IF YOU WANT TO SAVE ALL FRAMES
	*/

//	if((frameCount/60)<=period){
//		saveFrame("movie/frame-#####.png");
//	}

}

