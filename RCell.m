function RCell = RCell(CTime,SolWait,SolTra)
%RCell(1,SolTraWait.SolWait,SolTraWait.SolTra)
% RCell() returns the path cell of a robot in a specific time.
% For example, RCell(CTime,SolWait,SolTra) returns the path cell 
% of R in CTime
for i = 1:length([SolTra.t])
    if (SolTra(i).t) == CTime
        RCell = SolTra(i).c;
    end
end

end