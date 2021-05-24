function [SolTraWait, NSTW, ET] = RobotRunInMap(CSol,ITra)
disp('Robot Run in Map Simulation Start . . . ');
% algorithm time index
CTime = 0;
% waiting time index
WTime(length(CSol)) = 0;
% finish index
FTime(length(CSol)) = 0;
% complete index
Complete_index = 0;
%loop start
while Complete_index == 0
    CTime = CTime + 1;
    
    path = 1;
    for i = 1:length(CSol)
        
        if FTime(i) == 0
            if ITra(i).initra(length(ITra(i).initra),:) == ITra(i).initra(CTime-WTime(i),:)
                if CTime >= length(ITra(i).initra)
                    FTime(i) = 1;
                end
            end
            
            if path == 1
                soltra(i,CTime).c = ITra(i).initra(CTime-WTime(i),:);
                soltra(i,CTime).t = CTime;
                solwait(i,CTime).w = 0;
                robot_now(i,:) =  soltra(i,CTime).c;
            elseif path == 0
                soltra(i,CTime).c = ITra(i).initra(CTime-WTime(i),:);
                soltra(i,CTime).t = CTime;
                WTime(i) = WTime(i) + 1;
                solwait(i,CTime).w = WTime(i);
                robot_now(i,:) =  soltra(i,CTime).c;
            end
            
        elseif FTime(i) == 1
            soltra(i,CTime).c = ITra(i).initra(length(ITra(i).initra),:);
            soltra(i,CTime).t = CTime;
            WTime(i) = WTime(i) + 1;
            solwait(i,CTime).w = WTime(i);
            robot_now(i,:) =  soltra(i,CTime).c;
        end
        
        
        SolTraWait(i).SolTra = soltra(i,:);
        SolTraWait(i).SolWait = solwait(i,:);
        ET(i) = length(SolTraWait(1).SolTra);
        NSTW(i) = ET(i) - solwait(i,end).w;
        
    end
    
    allcomplete = sum(FTime);
    
    if allcomplete == length(CSol)
        Complete_index = 1;
    end
end
disp('Robot Run in Map Simulation finished !');
%New_SolTraWait = PathConflictCheck(CSol,ITra,SolTraWait);
end