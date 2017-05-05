% In this script, you need to convert the rotation matrix R into axis-angle form
% Your final solution for the vector in axis-angle representation of R must be stored in vec
% Your final solution for the angle in axis-angle representation of R must be stored in theta

% Note: A rotation matrix R can have two sets of solutions: 
%    (vec, theta) or (-vec, -theta). These solutions are equivalent.
% In this task, we will only test for theta in [0, pi], so you can ignore the other solution.
% You also need to handle two singularity cases, theta = 0 and theta = +pi (as noted above, we ignore -pi).
% theta = 0 represents no rotation, and there are infinite solutions for this. So vec must be [NaN NaN NaN] in this case.
% theta = pi has two equivalent solutions. In this case, vec must be 2x3 matrix containing both solutions.
% For all other cases, vec will be a 1x3 matrix containing a single solution.
% theta is always a 1x1 matrix

task3_solution = zeros(40, 4);
sol_num = 1;

% Test code for 20 different rotation matrices
for i = 1:20

    R = genRotationMatrix(i); % Generates a random rotation matrix and stores it in R
    
    %% Your code starts here

    theta = acos((trace(R)-1) / 2);
    if theta == 0
        vec = [NaN NaN NaN];
    elseif theta == pi
        c = cos(theta);
        v = 1 - c;
        r1 = [sqrt((R(1,1)-c) / v) sqrt((R(2,2)-c) / v) sqrt((R(3,3)-c) / v)];
        vec = [r1; -r1];
    else
        vec = (1/(2*sin(theta))) * [R(3,2)-R(2,3) R(1,3)-R(3,1) R(2,1)-R(1,2)];
    end
    
    % Your solution for vec must be a 1x3 or 2x3 matrix where each row is of the form [x, y, z] if rotation vector is xi + yj + zk
    
    
    % Your solution for theta must be 1x1 matrix where the rotation angle is in radians
    %theta = 0;

    %% Your code ends here
    
    %% Storing answer for auto-grading
    
    if size(vec, 2) ~= 3 || (size(vec, 1) ~= 1 && size(vec, 1) ~= 2)
        error('vec must be a 3x1 or 3x2 matrix')
    end
    
    if ~isequal(size(theta), [1 1])
        error('theta must be a 1x1 matrix')
    end
    
    if size(vec, 1) == 2
       
        if abs(vec(1,1)) > 0.001
            
            if sign(vec(1,1)) == 1
                
                task3_solution(sol_num, :) = [vec(1,:), theta];
                task3_solution(sol_num+1, :) = [vec(2, :), theta];
                
            else
        
                task3_solution(sol_num, :) = [vec(2,:), theta];
                task3_solution(sol_num+1, :) = [vec(1, :), theta];
                
            end
            
        elseif abs(vec(1,2)) > 0.001
            
            if sign(vec(1,2)) == 1
                
                task3_solution(sol_num, :) = [vec(1,:), theta];
                task3_solution(sol_num+1, :) = [vec(2, :), theta];
                
            else
        
                task3_solution(sol_num, :) = [vec(2,:), theta];
                task3_solution(sol_num+1, :) = [vec(1, :), theta];
                
            end
            
        else
            
            if sign(vec(1,3)) == 1
                
                task3_solution(sol_num, :) = [vec(1,:), theta];
                task3_solution(sol_num+1, :) = [vec(2, :), theta];
                
            else
        
                task3_solution(sol_num, :) = [vec(2,:), theta];
                task3_solution(sol_num+1, :) = [vec(1, :), theta];
                
            end
            
        end
        
        sol_num = sol_num + 2;
        
    else
        
        task3_solution(sol_num, :) = [vec, theta];
        sol_num = sol_num + 1;
        
    end

end