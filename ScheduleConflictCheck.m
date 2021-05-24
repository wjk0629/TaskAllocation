function New_CSol = ScheduleConflictCheck(CSol,CT_info,number_r,number_st,number_ct)

Switch = 0;

for i =1:number_r
    for j = 1:length(CSol(i).sequence)
        if CSol(i).sequence(j) > number_st
            C_test = CSol(i).sequence(j);
            idx = find(C_test==[CT_info.Task1]);
            idx2 = find(C_test==[CT_info.Task2]);
            
            if idx ~= 0
                ego_robot = i;
                other_robot = CT_info(idx).Robot2;
            elseif idx2 ~= 0
                ego_robot = i;
                other_robot = CT_info(idx2).Robot1;
            end
            
            EgoPlusOther = ego_robot+other_robot;
            EgoMinusOther = ego_robot-other_robot;
            if ego_robot > other_robot
                Switch = 0;
            elseif ego_robot < other_robot
                Switch = 1;
            end
            for k =1:number_ct/2
                if C_test <= number_st + number_ct/2
                    if (CT_info(k).Robot1+CT_info(k).Robot2) == EgoPlusOther ...
                            && CT_info(k).Task1 ~= C_test && Switch == 0
                        if (CT_info(k).Robot1-CT_info(k).Robot2) == EgoMinusOther
                            ego_other_task = CT_info(k).Task1;
                            ego_switch = abs(number_ct/2);
                        elseif (CT_info(k).Robot1-CT_info(k).Robot2) == -1*EgoMinusOther
                            ego_other_task = CT_info(k).Task2;
                            ego_switch = -1*abs(number_ct/2);
                        end
                        if find(ego_other_task==CSol(i).sequence) < find(C_test==CSol(i).sequence) ...
                                && find(ego_other_task+ego_switch==CSol(other_robot).sequence) > find(C_test+number_ct/2==CSol(other_robot).sequence)
                            fix_sequence = [CSol(other_robot).sequence];
                            fix_sequence([find(ego_other_task+ego_switch==CSol(other_robot).sequence), find(C_test+number_ct/2==CSol(other_robot).sequence)]) ...
                                = fix_sequence([find(C_test+number_ct/2==CSol(other_robot).sequence), find(ego_other_task+ego_switch==CSol(other_robot).sequence)]);
                            CSol(other_robot).sequence = fix_sequence;
                            disp('Path Change is complete1');
                        elseif find(ego_other_task==CSol(i).sequence) > find(C_test==CSol(i).sequence) ...
                                && find(ego_other_task+ego_switch==CSol(other_robot).sequence) < find(C_test+number_ct/2==CSol(other_robot).sequence)
                            fix_sequence = [CSol(other_robot).sequence];
                            fix_sequence([find(ego_other_task+ego_switch==CSol(other_robot).sequence), find(C_test+number_ct/2==CSol(other_robot).sequence)]) ...
                                = fix_sequence([find(C_test+number_ct/2==CSol(other_robot).sequence), find(ego_other_task+ego_switch==CSol(other_robot).sequence)]);
                            CSol(other_robot).sequence = fix_sequence;
                            disp('Path Change is complete2');
                        end
                    elseif (CT_info(k).Robot1+CT_info(k).Robot2) == EgoPlusOther ...
                            && CT_info(k).Task1 ~= C_test && Switch == 1
                        if (CT_info(k).Robot1-CT_info(k).Robot2) == EgoMinusOther
                            ego_other_task = CT_info(k).Task1;
                            ego_switch = abs(number_ct/2);
                        elseif (CT_info(k).Robot1-CT_info(k).Robot2) == -1*EgoMinusOther
                            ego_other_task = CT_info(k).Task2;
                            ego_switch = -1*abs(number_ct/2);
                        end
                        if find(ego_other_task==CSol(i).sequence) < find(C_test==CSol(i).sequence) ...
                                && find(ego_other_task+ego_switch==CSol(other_robot).sequence) > find(C_test+number_ct/2==CSol(other_robot).sequence)
                            fix_sequence = [CSol(other_robot).sequence];
                            fix_sequence([find(ego_other_task+ego_switch==CSol(other_robot).sequence), find(C_test+number_ct/2==CSol(other_robot).sequence)]) ...
                                = fix_sequence([find(C_test+number_ct/2==CSol(other_robot).sequence), find(ego_other_task+ego_switch==CSol(other_robot).sequence)]);
                            CSol(other_robot).sequence = fix_sequence;
                            disp('Path Change is complete3');
                        elseif find(ego_other_task==CSol(i).sequence) > find(C_test==CSol(i).sequence) ...
                                && find(ego_other_task+ego_switch==CSol(other_robot).sequence) < find(C_test+number_ct/2==CSol(other_robot).sequence)
                            fix_sequence = [CSol(other_robot).sequence];
                            fix_sequence([find(ego_other_task+ego_switch==CSol(other_robot).sequence), find(C_test+number_ct/2==CSol(other_robot).sequence)]) ...
                                = fix_sequence([find(C_test+number_ct/2==CSol(other_robot).sequence), find(ego_other_task+ego_switch==CSol(other_robot).sequence)]);
                            CSol(other_robot).sequence = fix_sequence;
                            disp('Path Change is complete4');
                        end
                    end
                    
                    
                elseif C_test > number_st + number_ct/2
                    if (CT_info(k).Robot1+CT_info(k).Robot2) == EgoPlusOther ...
                            && CT_info(k).Task2 ~= C_test && Switch == 0
                        if (CT_info(k).Robot1-CT_info(k).Robot2) == EgoMinusOther
                            ego_other_task = CT_info(k).Task1;
                            ego_switch = abs(number_ct/2);
                        elseif (CT_info(k).Robot1-CT_info(k).Robot2) == -1*EgoMinusOther
                            ego_other_task = CT_info(k).Task2;
                            ego_switch = -1*abs(number_ct/2);
                        end
                        if find(ego_other_task==CSol(i).sequence) < find(C_test==CSol(i).sequence) ...
                                && find(ego_other_task+ego_switch==CSol(other_robot).sequence) > find(C_test-number_ct/2==CSol(other_robot).sequence)
                            fix_sequence = [CSol(other_robot).sequence];
                            fix_sequence([find(ego_other_task+ego_switch==CSol(other_robot).sequence), find(C_test-number_ct/2==CSol(other_robot).sequence)]) ...
                                = fix_sequence([find(C_test-number_ct/2==CSol(other_robot).sequence), find(ego_other_task+ego_switch==CSol(other_robot).sequence)]);
                            CSol(other_robot).sequence = fix_sequence;
                            disp('Path Change is complete5');
                        elseif find(ego_other_task==CSol(i).sequence) > find(C_test==CSol(i).sequence) ...
                                && find(ego_other_task+ego_switch==CSol(other_robot).sequence) < find(C_test-number_ct/2==CSol(other_robot).sequence)
                            fix_sequence = [CSol(other_robot).sequence];
                            fix_sequence([find(ego_other_task+ego_switch==CSol(other_robot).sequence), find(C_test-number_ct/2==CSol(other_robot).sequence)]) ...
                                = fix_sequence([find(C_test-number_ct/2==CSol(other_robot).sequence), find(ego_other_task+ego_switch==CSol(other_robot).sequence)]);
                            CSol(other_robot).sequence = fix_sequence;
                            disp('Path Change is complete6');
                        end
                    elseif (CT_info(k).Robot1+CT_info(k).Robot2) == EgoPlusOther ...
                            && CT_info(k).Task2 ~= C_test && Switch == 1
                        if (CT_info(k).Robot1-CT_info(k).Robot2) == EgoMinusOther
                            ego_other_task = CT_info(k).Task1;
                            ego_switch = abs(number_ct/2);
                        elseif (CT_info(k).Robot1-CT_info(k).Robot2) == -1*EgoMinusOther
                            ego_other_task = CT_info(k).Task2;
                            ego_switch = -1*abs(number_ct/2);
                        end
                        if find(ego_other_task==CSol(i).sequence) < find(C_test==CSol(i).sequence) ...
                                && find(ego_other_task+ego_switch==CSol(other_robot).sequence) > find(C_test-number_ct/2==CSol(other_robot).sequence)
                            fix_sequence = [CSol(other_robot).sequence];
                            fix_sequence([find(ego_other_task+ego_switch==CSol(other_robot).sequence), find(C_test-number_ct/2==CSol(other_robot).sequence)]) ...
                                = fix_sequence([find(C_test-number_ct/2==CSol(other_robot).sequence), find(ego_other_task+ego_switch==CSol(other_robot).sequence)]);
                            CSol(other_robot).sequence = fix_sequence;
                            disp('Path Change is complete7');
                        elseif find(ego_other_task==CSol(i).sequence) > find(C_test==CSol(i).sequence) ...
                                && find(ego_other_task+ego_switch==CSol(other_robot).sequence) < find(C_test-number_ct/2==CSol(other_robot).sequence)
                            fix_sequence = [CSol(other_robot).sequence];
                            fix_sequence([find(ego_other_task+ego_switch==CSol(other_robot).sequence), find(C_test-number_ct/2==CSol(other_robot).sequence)]) ...
                                = fix_sequence([find(C_test-number_ct/2==CSol(other_robot).sequence), find(ego_other_task+ego_switch==CSol(other_robot).sequence)]);
                            CSol(other_robot).sequence = fix_sequence;
                            disp('Path Change is complete8'); 
                        end
                    end
                end
                
            end
        end
    end
end
New_CSol = CSol;
end