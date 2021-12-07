% dim_reduce_example_2d.m
% does 2d->1d dimensionality reduction and visualization

% load data (produces grid, ccf_scalar field)
load('data_sysf_three_link_HighRe.mat');

% generate an 'interesting' subdomain
range = linspace(-2.5, 2.5);
grid_reduced = line_domain(range, deg2rad(35));
field_reduced = dim_reduce(grid, ccf_scalar, grid_reduced);

% visualize original field
figure(7);
clf;
colormap pink;
vis_field_2d(grid, ccf_scalar, 'contour');
vis_field_2d(grid, ccf_scalar, 'critical');
% show slice; scaled because of indexing hack in vis_field_2d
plot(grid_reduced{1}*31/5+31/2, grid_reduced{2}*31/5+31/2, '--k');
legend('Levels', 'Critical Points', 'Subdomain');

% visualize reduced field
figure(77);
clf;
plot(range, field_reduced, 'k');
xlabel('\alpha_{new}');
ylabel('Scalar Value');
title('1D Scalar Field Reduction');