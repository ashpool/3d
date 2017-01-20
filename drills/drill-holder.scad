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

holes = [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10];
for(d = [0:13]) {
    translate ([sumArray(holes, d, 0) + d * 1, d % 2 ? -25 :-10, 20 + (-d * 0.9)]) cylinder(backHeight + 1, d = d);
    translate ([-2 + sumArray(holes, d, 0) + d * 1, d % 2 ? -35 :-10, 50]) text(text = str(holes[d]),font = "Arial", size = 3, valign = "center");
}

function sumArray(arr, i, sum) = i < 0 ? sum : sumArray(arr, i - 1, arr[i] + sum);

