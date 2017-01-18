
int screenWidth = 600;
int screenHeight = 480;

Position camPosition = new Position(0,-2,0); //position of the camera

float direction = PI/8; //direction counter-clockwise around the Z-axis
float rotationY = 0;

float fov = PI/2; //field of view of the camera

float speed = 0.1;


Cube cube = new Cube(new Position(6, 0, 0), 2);

void setup(){
  size(600, 480);
}

void draw(){
  background(0,0,0);
  stroke(255);
  
  //turning with the mouse
  direction+=(pmouseX-mouseX)*2*fov/screenWidth*4;
  while(direction>=2*PI) direction-=2*PI;
  while(direction<2*PI) direction+=2*PI;
  
  rotationY-=(pmouseY-mouseY)*2*fov/screenHeight;
  if(rotationY>PI/2) rotationY=PI/2;
  if(rotationY<-PI/2) rotationY=-PI/2;
  
  if(keyPressed){
    switch(key){
    case 'w': camPosition.move(speed*cos(direction), speed*sin(direction), 0); break;
    case 's': camPosition.move(-speed*cos(direction), -speed*sin(direction), 0); break;
    case 'a': camPosition.move(-speed*sin(direction), speed*cos(direction), 0); break;
    case 'd': camPosition.move(speed*sin(direction), -speed*cos(direction), 0); break;
    }
  }
  
  //little crosshair
  line(screenWidth/2-5, screenHeight/2,screenWidth/2+5, screenHeight/2);
  line(screenWidth/2, screenHeight/2-5,screenWidth/2, screenHeight/2+5);
  
  //loop to draw all of our wires on the screen
  for(int i=0; i<cube.wires.length; i++){
    
    //wires end and start positions transformed to camera coordinates
    Position camPosStart = toCamCoords(cube.wires[i].start);
    Position camPosEnd = toCamCoords(cube.wires[i].end);
    
    //projection of start and endpoints to camera
    Position drawStart = pointOnCanvas(camPosStart);
    Position drawEnd = pointOnCanvas(camPosEnd);
    
    //drawing lines on screen
    line(drawStart.x, drawStart.y, drawEnd.x, drawEnd.y);
  }
  
}

//projectin point to camera "canvas"
Position pointOnCanvas(Position pos){
  
  float angleH = atan2(pos.y, pos.x);
  float angleV = atan2(pos.z, pos.x);
  
  angleH/=abs(cos(angleH));
  angleV/=abs(cos(angleV));
  
  return new Position(screenWidth/2-angleH*screenWidth/fov, screenHeight/2-angleV*screenWidth/fov, 0);
}

Position toCamCoords(Position pos){
  Position rPos = new Position(pos.x-camPosition.x, pos.y-camPosition.y, pos.z-camPosition.z);
  //calculating rotation
  float rx=rPos.x;
  float ry=rPos.y;
  float rz=rPos.z;
  
  //rotation z-axis
  rPos.x=rx*cos(-direction)-ry*sin(-direction);
  rPos.y=rx*sin(-direction)+ry*cos(-direction);
  
  //rotation y-axis
  rx=rPos.x;
  rz=rPos.z;
  rPos.x=rx*cos(-rotationY)+rz*sin(-rotationY);
  rPos.z=rz*cos(-rotationY)-rx*sin(-rotationY);
  
  return rPos;
}