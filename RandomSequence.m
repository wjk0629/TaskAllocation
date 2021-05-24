function [TA,CSol,ITra,CT_info] = RandomSequence(number_r,number_ct,number_st,Task,CTask,CS_RT,CS_TT)


% random initial
% cooperative task first
% random 뽑아서 제일 큰 값, 작은 값을 가진 두 로봇이 ct를 맡는다.
random_roullet = rand(number_r,number_ct);
for i = 1:number_ct/2
    [temp_num11,temp_num12] = max(random_roullet(:,i));
    [temp_num21,temp_num22] = min(random_roullet(:,i));
    TA(temp_num12,number_st+i) = 1;
    CT_info(i).Robot1 = temp_num12;
    CT_info(i).Task1 = number_st+i;
    TA(temp_num22,number_st+i+number_ct/2) = 1;
    CT_info(i).Robot2 = temp_num22;
    CT_info(i).Task2 = number_st+i+number_ct/2;
end
% single task second
% random 뽑아서 제일 큰 값인 로봇이 st를 맡는다.
random_roullet = rand(number_r,number_st);
for i = 1:number_st
    [temp_num11,temp_num12] = max(random_roullet(:,i));
    TA(temp_num12,i) = 1;
end   

% Make CSol
for i = 1:number_r
    CSol(i).sequence = find(TA(i,:));
    CSol(i).sequence = CSol(i).sequence(randperm(length(CSol(i).sequence)));
end

% CSol에 index 입혀주기 
for i =1:number_r
    CSol(i).index = [];
    for j = 1:length(CSol(i).sequence)
        if CSol(i).sequence(j) <= number_st
            CSol(i).index = [CSol(i).index, "ST"+CSol(i).sequence(j)];
        elseif CSol(i).sequence(j) > number_st
            CSol(i).index = [CSol(i).index, "CT"+i+Task(CSol(i).sequence(j)).type];
        end
    end
end


% CT_TA는 CT만 합친것.
CT_TA = TA(1:end,number_st:number_st+number_ct/2) + TA(1:end,number_st+number_ct/2:end);


% Schedule conflict check and fix
% Schedule Conflict Check
CSol = ScheduleConflictCheck(CSol,CT_info,number_r,number_st,number_ct);

% initial trajectory set
% ITra 는 경로 좌표
% Sequence는 일의 순서
for i = 1:number_r
    ITra(i).CTime = 0;
    for j = 1:length(CSol(i).sequence)
        if j == 1
            ITra(i).initra = CS_RT(i,CSol(i).sequence(j)).link;
            ITra(i).CTime = length(ITra(i).initra);
        elseif CSol(i).sequence(j) <= number_st
            ITra(i).initra = [ITra(i).initra; CS_TT((CSol(i).sequence(j-1)),CSol(i).sequence(j)).link];
            ITra(i).CTime = length(ITra(i).initra);
        elseif CSol(i).sequence(j) > number_st
            ITra(i).initra = [ITra(i).initra; CS_TT((CSol(i).sequence(j-1)),CSol(i).sequence(j)).link];
            ITra(i).CTime = length(ITra(i).initra);
        end
    end
end
