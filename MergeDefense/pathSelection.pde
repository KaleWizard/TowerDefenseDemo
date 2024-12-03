// This file sets up and returns paths for new games
// it's set up to make adding more paths easier, if I have the time

Path[] paths;

void initializePaths() {
  paths = new Path[1];
  paths[0] = initializePath0();
}


Path getPath() {
  return paths[0];
}

Path initializePath0() {
  PathSegment[] segments = new PathSegment[9];
  segments[0] = new PathSegment(1, -1, 3, new PVector(150, 250));
  segments[1] = new PathSegment(1, 2, 2, new PVector(350, 250));
  segments[2] = new PathSegment(3, 1, 1, new PVector(350, 150));
  segments[3] = new PathSegment(3, 1, 6, new PVector(950, 150));
  segments[4] = new PathSegment(9, 1, 4, new PVector(950, 550));
  segments[5] = new PathSegment(4, 5, 5, new PVector(450, 550));
  segments[6] = new PathSegment(4, 5, 2, new PVector(450, 750));
  segments[7] = new PathSegment(4, 7, 3, new PVector(750, 750));
  segments[8] = new PathSegment(7, 7, 2, new PVector(750, 950));
  
  return new Path(segments, 9);
}
