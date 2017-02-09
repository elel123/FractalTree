private double fractionLength = .8; 
private double fractionWeight = .5;
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(73, 47, 22);
	strokeWeight(15);
	line(320,480,320,380);   
	drawBranches(320,380, 100, 3*Math.PI/2, 30);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle, double weight) 
{   
	//your code here  
	  
	double randomBranchAngle = branchAngle + (Math.random() * 0.3);
	double angle1 = angle + randomBranchAngle;
	double angle2 = angle - randomBranchAngle;
	branchLength *= fractionLength;
	weight *= fractionWeight;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	strokeWeight((float)(weight));
	stroke(0, 255, 0);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	stroke(0);
	point(x, y);
	if(branchLength > smallestBranch && branchLength < 50)
	{
		stroke(0, 255, 0);
		drawBranches(endX1, endY1, branchLength, angle1, weight);
		drawBranches(endX2, endY2, branchLength, angle2, weight);
		

	}
	
	else if(branchLength > smallestBranch && branchLength > 50)
	{
		stroke(0, 255, 0);
		drawBranches(endX1, endY1, branchLength, angle1, weight);
		drawBranches(endX2, endY2, branchLength, angle2, weight);
		
	}
	
} 
