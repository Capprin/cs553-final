% dim_reduce_example_2d.m
% does 2d->1d dimensionality reduction and visualization

% load data (produces grid, ccf_scalar field)
load('data_sysf_three_link_HighRe.mat');

% generate an 'interesting' subdomain
range = linspace(-2.5, 2.5);


max_auc = -1;
max_auc_angle = -1;

for i = 1:365
    angle = i;
    grid_reduced = line_domain(range, deg2rad(angle));
    field_reduced = dim_reduce(grid, ccf_scalar, grid_reduced);

    % visualize original field
    %vis_field_2d(grid, ccf_scalar, 'contour');
    
    % calculate auc
    auc = trapz(range, field_reduced);

    if auc > max_auc
        max_auc = auc;
        max_auc_angle = i;        
    end
end

max_auc
max_auc_angle