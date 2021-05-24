function [CS_RT,CS_TT] = PathGeneration(map_factory,Robot,number_r,Task,number_t)
% robot to task
disp('Robot to Task Path generating . . .');
for i = 1:number_r
    for j = 1:number_t
        path_temp = Astar(abs(map_factory), Robot(i), Task(j));
        CS_RT(i,j).link = path_temp;
        CS_RT(i,j).Ctime = size(path_temp);
    end
end
% task to task
disp('Task to Task Path generating . . .');
for i = 1:number_t
    for j = 1:number_t
        if i == j
            CS_TT(i,j).link = 0;
            CS_TT(i,j).Ctime = 0;
        else
            path_temp = Astar(abs(map_factory), Task(i), Task(j));
            CS_TT(i,j).link = path_temp;
            CS_TT(i,j).Ctime = size(path_temp);
        end
    end
end
disp('Path generate Complete !');
end