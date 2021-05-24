function [map, Task, STask, CTask, Robot] = LoadmapFromExcel(stage_number)
% Load Excel Map
% Set read option
% opts = 'sheet name'
%load_map_opts = detectImportOptions('MRTA_benchmarks.xlsx');
% Fx Set. change x for select map
disp('Map Loading Start . . .');
if stage_number == 1
    map_sheet = 'F1Map';
    task_sheet = 'F1Task';
    robot_sheet = 'F1Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:Q27');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D12');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 2
    map_sheet = 'F2Map';
    task_sheet = 'F2Task';
    robot_sheet = 'F2Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:V27');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D12');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 3
    map_sheet = 'F3Map';
    task_sheet = 'F3Task';
    robot_sheet = 'F3Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:S20');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D12');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 4
    map_sheet = 'F4Map';
    task_sheet = 'F4Task';
    robot_sheet = 'F4Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:AQ46');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D62');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 5
    map_sheet = 'F5Map';
    task_sheet = 'F5Task';
    robot_sheet = 'F5Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:AN32');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D37');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 6
    map_sheet = 'F6Map';
    task_sheet = 'F6Task';
    robot_sheet = 'F6Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:AF42');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D32');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 7
    map_sheet = 'F7Map';
    task_sheet = 'F7Task';
    robot_sheet = 'F7Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:AP32');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D32');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 8
    map_sheet = 'F8Map';
    task_sheet = 'F8Task';
    robot_sheet = 'F8Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:AP32');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D27');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 9
    map_sheet = 'F9Map';
    task_sheet = 'F9Task';
    robot_sheet = 'F9Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:BJ62');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D42');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 10
    map_sheet = 'F10Map';
    task_sheet = 'F10Task';
    robot_sheet = 'F10Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:AZ52');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D32');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 11
    map_sheet = 'F11Map';
    task_sheet = 'F11Task';
    robot_sheet = 'F11Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:BT42');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D37');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 12
    map_sheet = 'F12Map';
    task_sheet = 'F12Task';
    robot_sheet = 'F12Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:AZ52');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D42');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 13
    map_sheet = 'F13Map';
    task_sheet = 'F13Task';
    robot_sheet = 'F13Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:BT32');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D32');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C5');
elseif stage_number == 14
    map_sheet = 'F14Map';
    task_sheet = 'F14Task';
    robot_sheet = 'F14Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:AZ52');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D57');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C6');
elseif stage_number == 15
    map_sheet = 'F15Map';
    task_sheet = 'F15Task';
    robot_sheet = 'F15Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:AZ52');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D57');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C7');
elseif stage_number == 16
    map_sheet = 'F16Map';
    task_sheet = 'F16Task';
    robot_sheet = 'F16Robot';
    % map size Set. change Range for play
    map = readmatrix('MRTA_benchmarks.xlsx','Sheet',map_sheet,'Range','A1:BT42');
    task = readmatrix('MRTA_benchmarks.xlsx','Sheet',task_sheet,'Range','A3:D57');
    robot = readmatrix('MRTA_benchmarks.xlsx','Sheet',robot_sheet,'Range','A3:C8');
else
    disp('This M-Function is optimized for');
    disp('MRTA_benchmarks.xlsx');
    disp('Other excel files cannot be used, so look for that.');
end

disp('Map Loaded Successfully !');   

for i=1:length(robot(:,1))
    Robot(i).number = robot(i,1);
    Robot(i).x = robot(i,2);
    Robot(i).y = robot(i,3);
end
CTask_count = 1;
Task_switch = 1;
for i=1:length(task(:,1))
    if CTask_count > task(end)
        Task_switch = 2;
    end
    Task(i).number = task(i,1);
    Task(i).x = task(i,2);
    Task(i).y = task(i,3);
    if task(i,4) ~= 0
        Task(i).type = task(i,4);
    else 
        Task(i).type = task(i,4);
    end
    if task(i,4) > 0 && Task_switch == 1
        CTask(task(i,4),Task_switch) = Task(i);
        CTask_count = CTask_count + 1;
    elseif task(i,4) > 0 && Task_switch == 2
        CTask(task(i,4),Task_switch) = Task(i);
        CTask_count = CTask_count + 1;
    end
end

% 원하는대로 배열 조정하기
% 혹시라도 CTask가 5x2 배열로 필요할까봐 위를 보존하고 이걸 만들었다
CTask_temp = [CTask(:,1)'];
CTask_temp2 = [CTask(:,2)'];
for i =1:length(CTask)
    CTask_new(2*i-1) = CTask_temp(i);
    CTask_new(2*i) = CTask_temp2(i);
end
CTask = CTask_new;
for i=1:length(Task)
    if Task(i).type == 0 
        STask(i) = Task(i);
    end
end
%CTask = sort(CTask.type);
