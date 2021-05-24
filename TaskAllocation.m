% Task allocation start
% 3. genetic? Cooperative task 없으면 필요없을것이다 일단 greedy로
% 4. 총 시간 T minimize 해보기
% 5. plot 하기

close all
clear 
clc
% Select Stage = 1 ~ 16
stage_number = 5;

% map set
[map_factory,Task,STask,CTask,Robot] = LoadmapFromExcel(stage_number);

% node number set
number_r = size(Robot,2);
number_t = size(Task,2);
number_ct = size(CTask,2);
number_st = number_t - number_ct;

% path set
[CS_RT,CS_TT] = PathGeneration(map_factory,Robot,number_r,Task,number_t);

% Random Sequnece Set
[TA,CSol,ITra,CT_info] = RandomSequence(number_r,number_ct,number_st,Task,CTask,CS_RT,CS_TT);

% Solution of Trajectory Wait time
[SolTraWait, NSTW, ET] = RobotRunInMap(CSol,ITra);

% Path Conflict Check
SolTraWait = PathConflictCheck(CSol,ITra,SolTraWait,NSTW);  
        

    



%% Simulation Part (plot map)!!!!!
msize = size(map_factory);
Record = VideoWriter('TAtest.avi');
open(Record);
for i=1:msize(1)
    for j = 1:msize(2)
        if map_factory(i,j) == -1
            map_factory(i,j) = 60;
        elseif map_factory(i,j) == -2
            map_factory(i,j) = 0;
        elseif map_factory(i,j) >= 200
            map_factory(i,j) = 30;
        else
            map_factory(i,j) = 45;
        end
    end
end
image(map_factory);
grid on;
hold on;
%pause 
plot_r1 = plot(0,0);
plot_r2 = plot(0,0);
plot_r3 = plot(0,0);
for j=1:length(SolTraWait(1).SolTra)
    title(['Task Allocation in factory Simul -  ' num2str(j) ' CTime'])
    delete(plot_r1); delete(plot_r2); delete(plot_r3); 
    
    plot_r1 = plot(SolTraWait(1).SolTra(j).c(2),SolTraWait(1).SolTra(j).c(1),'-rs');
    plot_r2 = plot(SolTraWait(2).SolTra(j).c(2),SolTraWait(2).SolTra(j).c(1),'-go');
    plot_r3 = plot(SolTraWait(3).SolTra(j).c(2),SolTraWait(3).SolTra(j).c(1),'-wp');
    
    drawnow;
    pause(0.1)
    
    frame = getframe(gca);
    writeVideo(Record,frame);
    
end
close(Record);
% for j=1:length(SolTraWait(1).SolTra)
%      r1_xy(j,:) = [SolTraWait(1).SolTra(j).c(2),SolTraWait(1).SolTra(j).c(1)];
%      r2_xy(j,:) = [SolTraWait(2).SolTra(j).c(2),SolTraWait(2).SolTra(j).c(1)];
%      r3_xy(j,:) = [SolTraWait(3).SolTra(j).c(2),SolTraWait(3).SolTra(j).c(1)];
% end
%     plot(r1_xy(:,1),r1_xy(:,2),'-r');
%     plot(r1_xy(:,1),r1_xy(:,2),'-g');
%     plot(r1_xy(:,1),r1_xy(:,2),'-w');






