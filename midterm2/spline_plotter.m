function spline_plotter(lambda,dx)

% lambda is the frequency of the function you are trying to approximate
% dx is the step size of your interpolatory mesh 

interp_mesh = 0:dx:1; % Interpolatory mesh
fine_mesh = 0:.05:1; % Fine mesh used for error analysis 

f = @(x) sin(lambda.*x) + cos(lambda.^2.*x); % Put in the function you want to approximate here.  

[aa,bb,cc,dd] = cubic_spline(interp_mesh,f(interp_mesh)); % Compute the coefficients used in the spline approximation. 

spline_plot = zeros(length(fine_mesh),1); % Build an array for storing the values of your spline evaluated over the fine mesh.  

for jj=1:length(fine_mesh)-1
   
    spline_index = 1;
    stop_now = 0;
    
    while(stop_now == 0)
    
        %i(x) < fine_mesh(jj) < i(x+1)
        if(interp_mesh(spline_index) <= fine_mesh(jj) && fine_mesh(jj) < interp_mesh(spline_index+1)) 
            % You need to add logic which determines for a given element of the fine mesh 
             % which two elements of the interpolatory mesh the fine mesh element is between.
        
            stop_now = 1; % If you are between two inerpolation points, you should stop the while statement.  
        
        else
        
            spline_index = spline_index+1; % If you are not between two interpolation points yet, you should increase the index.
        
        end
        
    end
    
    step = fine_mesh(jj) - interp_mesh(spline_index); % This computes the value x-x_j. 
    
    
    spline_plot(jj) = aa(spline_index) + bb(spline_index)*(step) + cc(spline_index)*(step)^2 + dd(spline_index)*(step)^3;
    % Here is where you need to actually compute the appropriate spline at a fine mesh point.  
    % This is where you need to use arrays aa, bb, cc, and dd.  
end

figure
subplot(1,2,1);
xrange=fine_mesh(1:end-1);
fvals=f(fine_mesh);
fvals=fvals(1:end-1);
aprxvals=spline_plot(1:end-1);
plot(xrange,aprxvals,'black',xrange,fvals,'red') % Plot the spline approximation in black and plot the actual function in red. 

subplot(1,2,2);


actual=fvals;
approx=aprxvals';
f_err= abs(actual -  approx);
plot(xrange,f_err);


