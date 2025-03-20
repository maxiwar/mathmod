model pr3
Real y11(start=23450);
Real y21(start=11250);
parameter Real a=0.312;
parameter Real b=0.741;
parameter Real c=0.36;
parameter Real h=0.591;

Real y12(start=23450);
Real y22(start=11250);
parameter Real a2=0.355;
parameter Real b2=0.799;
parameter Real c2=0.299;
parameter Real h2=0.566;

equation
  der(y11) = -a*y11 - b*y21 + abs(cos(time+2));
  der(y21) = -c*y11 - h*y21 + abs(sin(time+2));

equation
  der(y12) = -a2*y12 - b2*y22 + cos(time*2)+1;
  der(y22) = -c2*y12*y22 - h2*y22 + sin(time*10)+1;

end pr3;
