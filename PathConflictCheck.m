function New_SolTraWait = PathConflictCheck(CSol,ITra,SolTraWait,NSTW)
% path conflict check case 1 : if location of two robots are same at same time,
% fix that
disp('Simulation Path Conflict Check&Fix Start . . . ');
SolTraWait_temp = SolTraWait;
WTime(length(NSTW)) = 0;
% path conflict check case 1
for j = 1:length(SolTraWait(1).SolWait)
    for i = 1:length(CSol)
        robot_now(i,:) =  RCell(j,SolTraWait(i).SolWait,SolTraWait(i).SolTra);
        %ITra(i).initra(CTime-WTime(i),:);
    end
    
    [robot_new,I,J] = unique(robot_now, 'rows', 'first');
    hasDuplicates = size(robot_new,1) < size(robot_now,1);
    ixDupRows2 = setdiff(1:size(robot_now,1), I);
    ixDupRows1 = J(ixDupRows2);
    %dupRowValues1 = robot_now(ixDupRows1,:);
    %dupRowValues2 = robot_now(ixDupRows2,:);
    
    if hasDuplicates
        if ITra(ixDupRows1).CTime >= ITra(ixDupRows2).CTime
            index_count = 0;
            for a = 1:1:NSTW(ixDupRows1)-1
                
                if SolTraWait(ixDupRows2).SolTra(j-a+1).c == SolTraWait(ixDupRows1).SolTra(j+a-1).c
                    index_count = index_count + 1;
                else
                    
                    for b = j:1:NSTW(ixDupRows2)+index_count
                        SolTraWait(ixDupRows2).SolTra(b).c = SolTraWait_temp(ixDupRows2).SolTra(b-index_count).c;
                        SolTraWait(ixDupRows2).SolWait(b).w = WTime(ixDupRows2);
                    end
                    
                    index_wait = j-a+1;
                    for c = index_wait:1:j
                        SolTraWait(ixDupRows2).SolTra(c).c = SolTraWait_temp(ixDupRows2).SolTra(j-a+1).c;
                        WTime(ixDupRows2) = WTime(ixDupRows2) + 1;
                        SolTraWait(ixDupRows2).SolWait(c).w = WTime(ixDupRows2);
                    end
                    break;
                end
            end
        elseif ITra(ixDupRows1).CTime < ITra(ixDupRows2).CTime
            index_count = 0;
            for a = 1:1:NSTW(ixDupRows2)-1
                
                if SolTraWait(ixDupRows1).SolTra(j-a+1).c == SolTraWait(ixDupRows2).SolTra(j+a-1).c
                    index_count = index_count + 1;
                else
                    
                    for b = j:1:NSTW(ixDupRows1)+index_count
                        SolTraWait(ixDupRows1).SolTra(b).c = SolTraWait_temp(ixDupRows1).SolTra(b-index_count).c;
                        SolTraWait(ixDupRows1).SolWait(b).w = WTime(ixDupRows1);
                    end
                    
                    index_wait = j-a+1;
                    for c = index_wait:1:j
                        SolTraWait(ixDupRows1).SolTra(c).c = SolTraWait_temp(ixDupRows1).SolTra(j-a+1).c;
                        WTime(ixDupRows1) = WTime(ixDupRows1) + 1;
                        SolTraWait(ixDupRows1).SolWait(c).w = WTime(ixDupRows1);
                    end
                    break;
                end
            end
        else
            disp("something error in pathconflictcheck")
        end
    end
end
% path conflict check case 2



New_SolTraWait = SolTraWait;
disp('Simulation Path Conflict Check&Fix Complete !');

end