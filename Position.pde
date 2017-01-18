class Position{
float x;
float y;
float z;

Position(float X,float Y,float Z){
  x=X;
  y=Y;
  z=Z;
}

Position relative(float dx, float dy, float dz){
  return new Position(x+dx, y+dy, z+dz);
}

void move(float dx, float dy, float dz){
  x+=dx;
  y+=dy;
  z+=dz;
}
}