int squ_X=10,squ_Y=23;
int squ=40;
int []hold={-1,0};
int [][]data_ini ={ {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9} };
             int []SS={1,2};
                 /* {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},
                    {9,9,9,9,9,9,9,9,9,9},*/
int [][]data=new int [squ_Y][squ_X];
int bloc_sum=4;
int [][][]data_t ={ { { 0, 0},{-1, 0},{ 1, 0},{ 2, 0},{100,} },  //I
                    { { 0, 0},{ 1, 0},{-1,-1},{-1, 0},{100,} },  //J
                    { { 0, 0},{-1, 0},{ 1,-1},{ 1, 0},{100,} },  //L
                    { { 0, 0},{-1, 0},{ 0,-1},{ 1,-1},{100,} },  //S
                    { { 0, 0},{-1,-1},{ 0,-1},{ 1, 0},{100,} },  //Z
                    { { 0, 0},{ 0,-1},{-1, 0},{ 1, 0},{100,} },  //T
                    { { 0, 0},{-1,-1},{ 0,-1},{-1, 0},{100,} } };//O 
                    
int [][]data_lev={{50,10},{40,20},{30,30},{20,40},{10,50},{6,60},{4,70},{3,80},{2,100} };                   
int data_lev_frame=0,data_lev_sumline=1;
int Next=7;            
int []next=new int [14];
int teto_ini[]={4,3,0};
int []teto= {4,1,0,0};   
int tet_X=0,tet_Y=1,tet_vc=2,tet=3;
int Fr=60,AA=1;
int line_count=0,fall_count,loop_count;
int Level=0;
int K=0;
void setup(){
  size(650,806);
  frameRate(Fr);
  colorMode(HSB,360,100,100);
  RESET();
  if(K==1)  println("stert");
}


void draw(){
  if(K==1)    println("draw");
 DRAW();
 if(AA==0){
    loop_count++;
    if(loop_count==0){
 //    println("loop_count==0  tet="+teto[tet]);
      NEXT_MINO();
      TETO_SET(teto[tet]);
    }
    if(teto[tet]!=-1 && loop_count>=0 && loop_count == fall_count){
      FALL();
      int L=0;
      while(data_lev[L][data_lev_sumline]<=line_count){
        L++;
      }
      Level=L;
      fall_count+=data_lev[Level][data_lev_frame];
    }
  }
}

void RESET(){
  if(K==1)    println("    3               ");
  for(int i=0;i<squ_Y;i++){
    for(int s=0;s<squ_X;s++){
      data[i][s]=data_ini[i][s];
    }
  }
  //MMM();
  NEXT_MINO_INI();
  SET_FIELD_MINO();
  hold[0]=-1;
  loop_count=-int(Fr*1.5);
  line_count=0;
  fall_count=data_lev[0][data_lev_frame];
  Level=0;
}
int INS(int x,int y,int r,int t){
  if(K==1)    println("   INS");
  //println("x="+x+"y="+y+"r=" +r+"t=" +t );
  //TETO_SET(9);
  for(int i=0;data_t[t][i][0]!=100;i++){
  if(K==1)    print("     ( i= "+i);
    int xx=XX(r,data_t[t][i][0],data_t[t][i][1]);
    int yy=YY(r,data_t[t][i][0],data_t[t][i][1]);
  if(K==1)    println("  XX= "+xx+"  YY= "+yy+" )");
    if(x+xx<0 || squ_X<=x+xx || y+yy<0 || squ_Y<=y+yy)  return 0;
    if(data[y+yy][x+xx]!=9) return 0;
  }
  return 1;
}

int INS_W(int x,int y,int r,int t){
  if(K==1)    println("INS_W");
  //println("x="+x+"y="+y+"r=" +r+"t=" +t );
  //if(x<0 || squ_X<=x || y<0 || squ_Y<=y)  return 0;
  //if(data[y][x]!=9)   return 0;
  TETO_SET(9);
  for(int s=0;data_t[t][s][0]!=100;s++){
  if(K==1)    print("( s= "+s);
    int xx=XX(teto[tet_vc],data_t[t][s][0],data_t[t][s][1]);
    int yy=YY(teto[tet_vc],data_t[t][s][0],data_t[t][s][1]);
    int sx=XX(r,-xx,-yy);
    int sy=YY(r,-xx,-yy);
  if(K==1)    println("    xx= "+xx+"  yy= "+yy+"  sx= "+sx+"  sy= "+sy);
    if(INS(x+xx+sx,y+yy+sy,teto[tet_vc]+r,t)==1){
      teto[tet_X]+=xx+sx;
      teto[tet_Y]+=yy+sy;
  if(K==1)      println(" )  OK");
      return 1;
    }    
  if(K==1)      println(" )");
  }
  return 0;
}
void TETO_SET(int c){
  if(K==1)    println("  TETO_SET");
  for(int i=0;data_t[teto[tet]][i][0]!=100;i++){
    data[teto[tet_Y]+YY(teto[tet_vc],data_t[teto[tet]][i][0],data_t[teto[tet]][i][1])] [teto[tet_X]+XX(teto[tet_vc],data_t[teto[tet]][i][0],data_t[teto[tet]][i][1])]=c;  
  }
}
int XX(int r,int x,int y){
  //if(K==1)
  //  println("                   10");
   
   return x*int(cos(radians(r)))-y*int(sin(radians(r)));
}

int YY(int r,int x,int y){
  //if(K==1)
  //  println("                     11");
  //println("r=" +r+"t=" +t +"i=" +i);
   return x*int(sin(radians(r)))+y*int(cos(radians(r)));
}

void SET_FIELD_MINO(){
  if(K==1)    println("          5        ");
  teto[tet_X]=teto_ini[tet_X];
  teto[tet_Y]=teto_ini[tet_Y];
  teto[tet_vc]=teto_ini[tet_vc];
  teto[tet]=0;
}
void NEXT_MINO_INI(){
  if(K==1)    println("            6      ");
  MINO_BOX(0);
  MINO_BOX(7);
 // next[0]=SS[0];
  //next[1]=SS[1];
 // println("mino="+ next[0]);
}
void MINO_BOX(int a){
  int []jun={1,1,1,1,1,1,1};
  int S;
  for(int i=a;i<a+7;i++){
    S=MINO();
    if(jun[S]==1){
      jun[S]=0;
      next[i]=S;
    }
    else
      i--;  
  }
}

void NEXT_MINO(){
  if(K==1)    println("              7    ");
  teto[tet]=next[0];
  for(int i=0;i<13;i++){    next[i]=next[i+1]; }
  next[13]=-1;
  if(next[7]==-1)  MINO_BOX(7);
}
void FALL(){
  if(K==1)    println("                8  ");
  TETO_SET(9);
  if(INS(teto[tet_X],teto[tet_Y]+1,teto[tet_vc],teto[tet])==1){
    teto[tet_Y]++;
    TETO_SET(teto[tet]);
  }
  else{
    TETO_SET(teto[tet]);
    LINE();
   // SET_FIELD_MINO();
    if(INS(teto_ini[tet_X],teto_ini[tet_Y],teto_ini[tet_vc],next[0])==1){
      SET_FIELD_MINO();
      NEXT_MINO();
      TETO_SET(teto[tet]);
    }
    else{
      STOP();
    }
  }
}
int  MINO(){  return round(random(-0.5,6.49)); }
void STOP(){
    AA=1;
}

void keyPressed(){  
  if(K==1)   println("    keyPresse________________");
  int rgu=5;
  if(keyPressed==true && keyCode==TAB && fall_count>=0){
    if(AA==0){
    STOP();
    //noLoop();
    }
    else{
    AA=0;
    //loop();
    }
  }
  if(keyPressed==true && keyCode==CONTROL && AA==0 && fall_count>=0){
    if(hold[0]<0){
      TETO_SET(9);
      if(INS(teto[tet_X],teto[tet_Y],teto[tet_vc],next[0])==1){
        hold[0]=teto[tet];
        hold[1]=teto[tet_vc];
        NEXT_MINO();
        TETO_SET(teto[tet]);
      }
      else{
        TETO_SET(teto[tet]);
      }
    }
    else{
      TETO_SET(9);
      if(INS(teto[tet_X],teto[tet_Y],hold[1],hold[0])==1){
        int box=teto[tet];
        teto[tet]=hold[0];
        hold[0]=box;
        box=teto[tet_vc];
        teto[tet_vc]=hold[1];
        hold[1]=box;
        TETO_SET(teto[tet]);
      }
      else{
        TETO_SET(teto[tet]);
      }
    }
  }
  
  if(keyPressed==true && keyCode==UP && AA==0 && fall_count>=0 ){
    int z=0;
    TETO_SET(9);
    for(;INS(teto[tet_X],teto[tet_Y]+z+1,teto[tet_vc],teto[tet])==1;z++);
    teto[tet_Y]+=z;
    TETO_SET(teto[tet]);
    fall_count+=2*rgu;
  }
  if(keyPressed==true && key=='Z' || key=='z' && AA==0 && fall_count>=0 ){
   // TETO_SET(9);
  if(K==1)   println("     keyPresse Z_____________________________");
    if(INS_W(teto[tet_X],teto[tet_Y],-90,teto[tet])==1){
    teto[tet_vc]-=90;
    TETO_SET(teto[tet]);
    fall_count+=rgu;
    }  
    else{  TETO_SET(teto[tet]);  }
  }  if(keyPressed==true && key=='X' || key=='x' && AA==0 && fall_count>=0 ){
   // TETO_SET(9);
  if(K==1)   println("     keyPresse X_____________________________");
    if(INS_W(teto[tet_X],teto[tet_Y],90,teto[tet])==1){
    teto[tet_vc]+=90;
    TETO_SET(teto[tet]);
    fall_count+=rgu;
    }  
    else{  TETO_SET(teto[tet]);  }
  }
  if(keyPressed==true && keyCode==RIGHT && AA==0 && fall_count>=0 ){
    TETO_SET(9);
    if(INS(teto[tet_X]+1,teto[tet_Y],teto[tet_vc],teto[tet])==1){
    teto[tet_X]++;
    TETO_SET(teto[tet]);
    fall_count+=rgu;
    }  
    else{  TETO_SET(teto[tet]);  }
  }
  if(keyPressed==true && keyCode==LEFT && AA==0 && fall_count>=0 ){
    TETO_SET(9);
    if(INS(teto[tet_X]-1,teto[tet_Y],teto[tet_vc],teto[tet])==1){
      teto[tet_X]--;
      TETO_SET(teto[tet]);
      fall_count+=rgu;
    }  
    else{  TETO_SET(teto[tet]);  }
    
  }
  if(keyPressed==true && keyCode==DOWN && AA==0 && fall_count>=0 ){
    TETO_SET(9);
    if(INS(teto[tet_X],teto[tet_Y]+1,teto[tet_vc],teto[tet])==1){
      teto[tet_Y]++;
      TETO_SET(teto[tet]);
      //fall_count+=rgu;
    }
    else{  TETO_SET(teto[tet]);  }
  }
  
  if(keyPressed==true && AA!=0 && keyCode==SHIFT){
    if(loop_count>0){
  if(K==1)      println("                                                        AA");
      RESET();
    }
    else
      AA=0;
  }
}

  //------------------------------------------------------------------------------------------------------------------------------


void LINE(){
  if(K==1)  println("                       12");
  for(int i=squ_Y-1;i>=0;i--){
    int ans=1;
    for(int s=0;s<squ_X;s++){
      if(data[i][s]==9){
        ans=0;
        break;
      }
    }
    if(ans==1){
       for(int p=i;p>0;p--){
         for(int s=0;s<squ_X;s++){
           data[p][s]=data[p-1][s];
         }
       }
       line_count++;
       i++;
    }
  }
}

void COLOR(int c){
  strokeWeight(1.5);
  stroke(0,0,0);
  switch (c){
    case 0:    //みず
      fill(185,100,100);
      stroke(185,100,70);
      break;
    case 1:    //あお
      fill(240,100,100);
      stroke(240,100,70);
      break;
    case 2:    //オレンジ
      fill(40,100,100);
      stroke(40,100,70);
      break;
    case 3:    //グリーン
      fill(100,100,100);
      stroke(100,100,70);
      break;
    case 4:    //アカ
      fill(0,100,100);
      stroke(0,100,70);
      break;
    case 5:    //ピンク
      fill(300,100,100);
      stroke(300,100,70);
      break;
    case 6:    //キイ
      fill(57,100,100);
      stroke(57,100,70);
      break;
    case 8:    //うち
      fill(240,20,30);
      stroke(240,20,30);
      break;
    case 9:    //フルーム
      fill(195,84,75);
      stroke(195,84,75);
      break;
    case 10:    //背景
      background(195,84,75);
      break;
    case 11:    //回転軸
      fill(200.0,0,360);
      noStroke();
      break;
    
  }
}

void DRAW(){
 // if(K==1)  println("                         13");
  int w=(width-squ_X*squ)/2,b=3,h=w/6,e=h*4;
  int H=20;
  int N=Next+(7-Next)-1;
  DRAW_FREME(w,e,b,h,N);
  DRAW_NEXT_MINO(w,e,b,h,N);
  DRAW_HOLD_MINO(w,e,h);
  DRAW_TEXT(w,e,b,h);
  DRAW_EXPL(w,b,e);
  if(loop_count>=0){
    if(teto[tet]!=-1){
      DRAW_GAIDO_MINO(w,b,H);
    }
    DRAW_FIELD_MINO(w,b,H);
  }
}


void DRAW_FREME(int w,int e,int b,int h,int N){
  COLOR(10);
  COLOR(8);
  int r=b*2;
  int c=30,s=c/3*2;
  noStroke();
  rect(w,b,squ_X*squ,squ_Y*squ);
  beginShape();
    vertex(width-w+b,b+2*h);
    vertex(width-w+b,b+2*h+e*N-s);
    vertex(width-w+b+c,b+2*h+e*N);
    vertex(width-b,b+2*h+e*N);
    vertex(width-b,b+2*h+s);
    vertex(width-b-c,b+2*h);
  endShape();
  
  beginShape();
    vertex(width-w+b+r,height-b);
    vertex(width-w+b,height-b-r);
    vertex(width-w+b,2*b+2*h+e*N-s);
    vertex(width-w+b+c,2*b+2*h+e*N);
    vertex(width-b,2*b+2*h+e*N);
    vertex(width-b,height-b-r);
    vertex(width-b-r,height-b);
  endShape();
    e*=1.5;
  beginShape();
    vertex(b,b+2*h);
    vertex(b,b+2*h+e-s);
    vertex(b+c,b+2*h+e);
    vertex(w-b,b+2*h+e);
    vertex(w-b,b+2*h+s);
    vertex(w-b-c,b+2*h);
  endShape();
  
  beginShape();
    vertex(b+r,height-b);
    vertex(b,height-b-r);
    vertex(b,2*b+2*h+e-s);
    vertex(b+c,2*b+2*h+e);
    vertex(w-b,2*b+2*h+e);
    vertex(w-b,height-b-r);
    vertex(w-b-r,height-b);
  endShape();
}

void DRAW_NEXT_MINO(int w,int e,int b,int h,int N){
  for(int i=0;i<N;i++){
    int nx=width-w/2-h/3*2,ny=b+4*h+e*i;
    COLOR(next[i]);
    //rect(nx,ny,h,h);
    for(int s=0;data_t[next[i]][s][0]!=100;s++){
     rect(nx+data_t[next[i]][s][0]*h,ny+data_t[next[i]][s][1]*h,h,h);
    }
    COLOR(11);
    ellipse(nx+h/2+1,ny+h/2+1,4,4);
  }
}

void DRAW_HOLD_MINO(int w,int e,int h){
  int nx=w/2-h/3*2,ny=h*3+e/2;
  if(hold[0]>=0){
    COLOR(hold[0]);
    //rect(nx,ny,h,h);
    for(int s=0;data_t[hold[0]][s][0]!=100;s++){
      int x=XX(hold[1],data_t[hold[0]][s][0],data_t[hold[0]][s][1]);
      int y=YY(hold[1],data_t[hold[0]][s][0],data_t[hold[0]][s][1]);
      rect(nx+x*h,ny+y*h,h,h);
    }
    COLOR(11);
    ellipse(nx+h/2+1,ny+h/2+1,4,4);
  } 
}
void DRAW_TEXT(int w,int e,int b,int h){
  textAlign(CENTER);
  textSize(20);
  strokeWeight(b);
  fill(-1);
  text("NEXT",width-w/2,(b+3*h)/2);
  text("HOLD",w/2,(b+3*h)/2);
  text("LEVEL",w/2,3*e);
  text(Level+1,w/2,3.5*e);
  text("LINE",w/2-10,4.5*e);
  text(line_count,w/2+10,5*e);
}

String []data_s={"Right →","Left ←","Down ↓","Hard drop↑","Start SHIFT","Stop TAB","Hold CTRL","  X    ↻ ","  Z    ↺"};
void DRAW_EXPL(int w,int b,int e){
  textAlign(LEFT);
  textSize(15);
  strokeWeight(b);
  fill(-1);
  int x=width-w+2*b,y=7*e;
  for(int i=0;i<=3;i++){
    text(data_s[i],x,y+30*i,w-3*b);
  }
  x=2*b;
  for(int i=0;i<=4;i++){
    text(data_s[i+4],x,y+30*i,w-3*b);
  }
  //text("↑",width-w/2,(b+3*h)/2);
  
}

void DRAW_GAIDO_MINO(int w,int b,int H){
 // println("DRAW_GAIDO_MINO  tet"+teto[tet]);
  int z=1;
  TETO_SET(9);
  for(;INS(teto[tet_X],teto[tet_Y]+z,teto[tet_vc],teto[tet])==1;z++);
    z--;
  COLOR(teto[tet]);
  //text("Z=" + z,40,height-40);
  fill(0,0,80,100);
  //rect(w+squ*teto[tet_X],b+squ*(teto[tet_Y]-(squ_Y-H)+z),squ,squ);
  for(int i=0;data_t[teto[tet]][i][0]!=100;i++){
    rect(w+squ*(teto[tet_X]+XX(teto[tet_vc],data_t[teto[tet]][i][0],data_t[teto[tet]][i][1])),b+squ*(teto[tet_Y]-(squ_Y-H)+z+YY(teto[tet_vc],data_t[teto[tet]][i][0],data_t[teto[tet]][i][1])),squ,squ);
  }                                         
  TETO_SET(teto[tet]);
}

void DRAW_FIELD_MINO(int w,int b,int H){
//  println("DRAW_FIELD_MINO  tet"+teto[tet]);
  int c=round(squ/4);
  for(int i=squ_Y-1;i>=squ_Y-H;i--){
     for(int s=0;s<squ_X;s++){
       if(data[i][s]>6)    continue;
       COLOR(data[i][s]);
       strokeWeight(0.5);
       rect(w+squ*s,b+(i-(squ_Y-H))*squ,squ,squ);
       fill(-1);
       triangle(w+squ*s+0.5,b+(i-(squ_Y-H))*squ+0.5,w+squ*(s+1)-0.5,b+(i-(squ_Y-H))*squ+0.5,w+squ*(s+0.5),b+((i-(squ_Y-H))+0.5)*squ);
       fill(0,0,0,130);
       triangle(w+squ*s,b+(i-(squ_Y-H-1))*squ+0.5,w+squ*(s+1),b+(i-(squ_Y-H-1))*squ+0.5,w+squ*(s+0.5),b+((i-(squ_Y-H))+0.5)*squ);
       COLOR(data[i][s]);
       noStroke();
       rect(w+squ*s+c,b+(i-(squ_Y-H))*squ+c,squ-2*c,squ-2*c);
       stroke(0,0,0,30);
       strokeWeight(1);
       line(w+squ*s+c,b+(i-(squ_Y-H))*squ+c,w+squ*s+c,b+(i-(squ_Y-H-1))*squ-c);
       line(w+squ*(s+1)-c,b+(i-(squ_Y-H))*squ+c,w+squ*(s+1)-c,b+(i-(squ_Y-H-1))*squ-c);
     }
  }
  COLOR(11);
  ellipse(w+squ*(teto[tet_X]+0.5),b+squ*(teto[tet_Y]-(squ_Y-H)+0.5),5,5);
}

void MMM(){
  for(int i=0;i<squ_Y;i++){
    //if(i==squ_Y-1) println(" ");
    if( (i-1)%5==0){
    println(data[i][0]+" "+data[i][1]+" "+data[i][2]+" "+data[i][3]+" "+data[i][4]+" "+data[i][5]+" "+data[i][6]+" "+data[i][7]+" "+data[i][8]+" "+data[i][9]+ "  " + (i-1));     
    }
    else{
    println(data[i][0]+" "+data[i][1]+" "+data[i][2]+" "+data[i][3]+" "+data[i][4]+" "+data[i][5]+" "+data[i][6]+" "+data[i][7]+" "+data[i][8]+" "+data[i][9]);    
    }
  }
}
