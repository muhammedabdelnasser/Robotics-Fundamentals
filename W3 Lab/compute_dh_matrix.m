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