class segment {
  color s_colour;
  float s_width;
  int s_height;
  int s_amt; // number of segments
  int s_dir; // direction of spin
  segment() {
    s_width = random(0,1);
    s_height = round(random(1,30));
    s_amt = round(random(sgmt_wid_min/2,sgmt_wid_max/2))*2;
    s_dir = (round(random(0,1))*2)-1;
    s_dir = round(s_dir*round(random(1,3)));
    float cr = random(0,1);
    float cb = random(cr/2,cr*2)%1; //random(0,1); //cg;
    float cg = random(0,cb); //abs(random(0,cr)-cr);
    s_colour = color(cr,cg,cb);
  }
}
