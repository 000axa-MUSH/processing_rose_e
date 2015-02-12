void setup() {
  colorMode(RGB, 1.0);
  size(600,600);
}
// SETUP *******************************
int patterns = 2;
int len = (600/2)-10;
int circles = 20;
int sgmt_wid_min = 2;
int sgmt_wid_max = 80;
int loop = 0;
int loops = 30;
int start = 0;
int start_record = 0;

segment[] rings = new segment[circles];
void draw() {
  if (start == 0) {
    strokeWeight(2);
    //noSmooth();
    
    // populate patterns
    float cr, cg, cb;
    color color_tmp;
    int int_tmp;
    for (int k = 0; k < circles; k++) {
      rings[k] = new segment();
    }
    start = 1;
  }
  // setup background
  noStroke();
  fill(#000000);
  
  rect(0,0,width,height);
  // here goes the main loop
  int spikes, latest;
  float a, b;
  int lopo;
  latest = 0;
  for (int j = 0; j < circles; j++) {
    spikes = rings[j].s_amt;
    latest += rings[j].s_height;
    fill(color(rings[j].s_colour));
    lopo = loop * rings[j].s_dir;
    for (int i = 0; i < spikes; i++) {
      a = (width/2)+(sin((TAU/spikes*i)+(TAU/spikes*lopo/loops))*latest);
      b = (width/2)+(cos((TAU/spikes*i)+(TAU/spikes*lopo/loops) )*latest);
      ellipse(a,b,rings[j].s_height,rings[j].s_height);
    }
  }
  if (loop < loops) {
    loop++;
  } else {
    loop = 1;
      start_record = 0;
    //noLoop();
  }
  if (start_record > 0) {
    if (start_record > 1) {
      save("z_" + loop + "_z.png");
      delay(400);
      int f = round(loop/loops);
      print(f + "% \n");
    }
    if (start_record == 1) {
      loop = 0;
      start_record = 2;
    }
  }
    
}
void mouseClicked() {
  start = 0;
}

void mouseWheel(MouseEvent event) {
  start_record = 1;
}
  
