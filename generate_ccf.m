% generate_ccf.m
% produces ccf data files for a number of systems

systems = {'sysf_three_link_HighRe',...
           'sysf_four_link_HighRe',...
           'sysf_five_link_HighRe'};
dim = 3; %only care about theta dim

disp('Generating CCF data...');
for i = 1:length(systems)
    tic;
    % calculate system details
    sysf = systems{i};
    sys_update(sysf,[]);
    load([sysf '_calc.mat'], 's');
    % pull out grid, CCF
    grid = s.grid.eval;
    ccf_true = s.DA_optimized(dim,:); %use optimal coordinates
    % compute norm of DA at ea. component
    ccf_scalar = zeros(size(grid{1}));
    for j = 1:size(ccf_true,2)
        ccf_scalar = ccf_scalar + ccf_true{j}.^2;
    end
    ccf_scalar = sqrt(ccf_scalar);
    % time
    time = toc;
    disp(['Generated CCF for ' sysf ' in ' num2str(time) ' seconds']);
    % save as data file
    save(['data_' sysf], 'grid', 'ccf_true', 'ccf_scalar');
end