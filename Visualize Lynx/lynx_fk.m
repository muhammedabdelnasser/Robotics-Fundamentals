function [ pos ] = lynx_fk( theta1, theta2, theta3, theta4, theta5, g )
%LYNX_FK The input to the function will be the joint
%    angles of the robot in radians, and the distance between the gripper pads in inches.
%    The output must contain 10 positions of various points along the robot arm as specified
%    in the question.

    %% YOUR CODE GOES HERE
    
    pos = zeros(10, 3);
    %e = 1.125;
    A1 = compute_dh_matrix(0, -pi/2, 3, theta1);
    A2 = compute_dh_matrix(5.75, 0, 0, theta2-pi/2);
    A3 = compute_dh_matrix(7.375, 0, 0, theta3+pi/2);
    A4 = compute_dh_matrix(0, -pi/2, 0, theta4-pi/2);
    %A5 = compute_dh_matrix(0, 0, 3+e, theta5);
    
    f0 = [0 0 0 1]';
    pos(1,1:3) = f0(1:3);
    f1 = A1 * f0;
    pos(2,1:3) = f1(1:3);
    f2 = A1 * A2 * f0;
    pos(3,1:3) = f2(1:3);
    f3 = A1 * A2 * A3 * f0;
    pos(4,1:3) = f3(1:3);
    f4 = A1* A2 * A3 * A4 * f0;
    pos(5,1:3) = f4(1:3);
    
    e = -1.125;
    A5 = compute_dh_matrix(0, 0, 4.125+e, theta5);
    f5 = A1* A2 * A3 * A4 * A5 * f0;
    pos(6,1:3) = f5(1:3);
    
    A5 = compute_dh_matrix(g/2, 0, 4.125+e, theta5);
    f5 = A1* A2 * A3 * A4 * A5 * f0;
    pos(7,1:3) = f5(1:3);
    
    A5 = compute_dh_matrix(-g/2, 0, 4.125+e, theta5);
    f5 = A1* A2 * A3 * A4 * A5 * f0;
    pos(8,1:3) = f5(1:3);
    
    A5 = compute_dh_matrix(g/2, 0, 4.125, theta5);
    f5 = A1* A2 * A3 * A4 * A5 * f0;
    pos(9,1:3) = f5(1:3);
    
    A5 = compute_dh_matrix(-g/2, 0, 4.125, theta5);
    f5 = A1* A2 * A3 * A4 * A5 * f0;
    pos(10,1:3) = f5(1:3);
    
    

end

function A = compute_dh_matrix(r, alpha, d, theta)

    %% Your code goes here
    A = eye(4);
    
    c = cos(theta);
    s = sin(theta);
    s_alpha = sin(alpha);
    c_alpha = cos(alpha);
    
    A(1,1) = c;
    A(1,2) = -s * c_alpha;
    A(1,3) = s * s_alpha;
    A(1,4) = r * c;
    
    A(2,1) = s;
    A(2,2) = c * c_alpha;
    A(2,3) = -c * s_alpha;
    A(2,4) = r * s;
    
    A(3,1) = 0;
    A(3,2) = s_alpha;
    A(3,3) = c_alpha;
    A(3,4) = d;
    
    A(4,1:4) = [0 0 0 1];
end