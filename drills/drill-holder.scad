$fs=0.6;
width = 100;
depth = 30;
frontHeight = 40;
backHeight = 50;

module mainBlock(width, depth, frontHeight, backHeight) {
    CubePoints = [
    [  0,  0,  0 ],  //0
    [ width,  0,  0 ],  //1
    [ width,  depth,  0 ],  //2
    [  0,  depth,  0 ],  //3
    [  0,  0,  frontHeight ],  //4
    [ width,  0,  frontHeight ],  //5
    [ width,  depth,  backHeight ],  //6
    [  0,  depth,  backHeight ]]; //7
  
    CubeFaces = [
    [0,1,2,3],  // bottom
    [4,5,1,0],  // front
    [7,6,5,4],  // top
    [5,6,2,1],  // right
    [6,7,3,2],  // back
    [7,4,0,3]]; // left
    
    polyhedron(CubePoints, CubeFaces);
}

mainBlock(width, depth, frontHeight, backHeight);

for(d = [1:12]) {
    translate ([((d * (d + 1)) / 2) + d * 1.5, -10, 0]) cylinder(backHeight + 1, d = d);
}
