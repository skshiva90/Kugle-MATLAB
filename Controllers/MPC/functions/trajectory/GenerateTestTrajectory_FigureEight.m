function [TrajectoryPoints, VisualizationLimits] = GenerateTestTrajectory_FigureEight()
    %% Generate test trajectory
    TrajectoryPoints = [];
    for (i = 0:((50+270+100+270+50)-1))
        if (i < 50) 
            p = [i, i]/5;
        elseif (i < 50+270)
            r = sqrt(10^2+10^2);
            diag = sqrt(r^2+r^2);
            p = [diag,0] + r*[cos(pi/2+pi/4-2*pi*(i-50)/360),sin(pi/2+pi/4-2*pi*(i-50)/360)];            
        elseif (i < 50+270+100) 
            p = [10,-10] + [-(i-50-270), (i-50-270)]/5;
        elseif (i < 50+270+100+270)
            r = sqrt(10^2+10^2);
            diag = sqrt(r^2+r^2);
            p = [-diag,0] + r*[cos(pi/4+2*pi*(i-50-270-100)/360),sin(pi/4+2*pi*(i-50-270-100)/360)];                                    
        elseif (i < 50+270+100+270+50) 
            p = [-10,-10] + [(i-50-270-100-270), (i-50-270-100-270)]/5;            
        end
        TrajectoryPoints = [TrajectoryPoints; p];
    end
    
    TrajectoryPoints = TrajectoryPoints / 10; % downscale trajectory
    
    VisualizationLimits.x_min = -6;
    VisualizationLimits.y_min = -2;
    VisualizationLimits.x_max = 6;
    VisualizationLimits.y_max = 2;       
end