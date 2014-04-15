function intf=adaptive_plotter_student_version(a,b,tol,Nmax)
    
    global meshpts
    
    format long
    
    meshpts = [];
    
    f = @(x) exp(x) ;
    g=@(x) sin(x);
    c=@(x) cos(pi/2 * x.^2);
    c=g;
    
    p0 = simpson(a,b, 2, c);
    
    [intf] = Simpson_adapt_student_version(a,b,tol,1,Nmax,p0,c);
    
    disp('The integral is')
    fprintf('%f\n',intf)
    
%     figure
    plot(meshpts,c(meshpts),'-.ob')
    