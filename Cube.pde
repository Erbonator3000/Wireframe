class Cube{
   Wire[] wires = new Wire[12];
  
Cube(Position pos, float size){
  wires[0] = new Wire(pos.relative(size/2, size/2, size/2), pos.relative(-size/2, size/2, size/2));
  wires[1] = new Wire(pos.relative(size/2, -size/2, size/2), pos.relative(-size/2, -size/2, size/2));
  wires[2] = new Wire(pos.relative(size/2, size/2, size/2), pos.relative(size/2, -size/2, size/2));
  wires[3] = new Wire(pos.relative(-size/2, size/2, size/2), pos.relative(-size/2, -size/2, size/2));
  wires[4] = new Wire(pos.relative(size/2, size/2, -size/2), pos.relative(-size/2, size/2, -size/2));
  wires[5] = new Wire(pos.relative(size/2, -size/2, -size/2), pos.relative(-size/2, -size/2, -size/2));
  wires[6] = new Wire(pos.relative(size/2, size/2, -size/2), pos.relative(size/2, -size/2, -size/2));
  wires[7] = new Wire(pos.relative(-size/2, size/2, -size/2), pos.relative(-size/2, -size/2, -size/2));  
  wires[8] = new Wire(pos.relative(size/2, size/2, size/2), pos.relative(size/2, size/2, -size/2));
  wires[9] = new Wire(pos.relative(size/2, -size/2, size/2), pos.relative(size/2, -size/2, -size/2));
  wires[10] = new Wire(pos.relative(-size/2, -size/2, size/2), pos.relative(-size/2, -size/2, -size/2));
  wires[11] = new Wire(pos.relative(-size/2, size/2, size/2), pos.relative(-size/2, size/2, -size/2));
}
  
}