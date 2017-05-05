% rand(3,1) generates a random 3 by one column vector. We use this u to plot
u=rand(3,1)*2-1;

% plot the origin
plot3(0,0,0,'.k')

% axis setting
axis vis3d
axis off

%%%%% your code starts here %%%%%
% generate a random rotation matrix R
% Generating a random matric R from a random angle (theta) and random axis (w)
w = rand(3, 1)*2-1;
w = w/norm(w);
theta = rand() * pi;
J = [0 -1*w(3) w(2);
    w(3) 0 -1*w(1);
    -1*w(2) w(1) 0];
R = eye(3) + sin(theta)*J + (1-cos(theta))*J^2;

% plot the x axis 
plot3([0,1],[0,0],[0,0],'r');
text(1,0,0,'x')
hold on
% plot the y axis 
plot3([0,0],[1,0],[0,0],'g');
text(0,1,0,'y')

% plot the z axis 
plot3([0,0],[0,0],[1,0],'b');
text(0,0,1,'z')

% plot the original vector u
plot3([0,u(1)], [0,u(2)], [0,u(3)], 'k--')
text(u(1),u(2),u(3),['(',num2str(u(1),'%.3f'),',',num2str(u(2),'%.3f'),',',num2str(u(3),'%.3f'),')'])


% apply rotation and calcuate v plot the vector after rotation v
v = R*u;

% plot the new vector v
plot3([0,v(1)], [0,v(2)], [0,v(3)], 'k:')
text(v(1),v(2),v(3),['(',num2str(v(1),'%.3f'),',',num2str(v(2),'%.3f'),',',num2str(v(3),'%.3f'),')'])

%%%%% your code ends here %%%%%