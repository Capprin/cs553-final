% dim_reduce_example_3d.m
% does 3d->2d dimensionality reduction and visualization

% load data (produces grid, ccf_scalar field)
load('data_sysf_four_link_HighRe.mat');

% set angles for plane
angle1 = 261;
angle2 = 141;
angle3 = 11;

% generate an 'interesting' subdomain
points = 31;
range_1d = linspace(-2.5, 2.5, points);
range = cell(1,2);
[range{:}] = ndgrid(range_1d);
grid_reduced = plane_domain(range, [deg2rad(angle1), deg2rad(angle2), deg2rad(angle3)]);
field_reduced = dim_reduce(grid, ccf_scalar, grid_reduced);
field_reduced = reshape(field_reduced, points, points);

% visualize original field
figure(9);
clf;
colormap pink;
vis_field_3d(grid, ccf_scalar);
% add plane visualization
bound_idxs = [1 points points^2-points+1 points^2];
plane_corners = cellfun(@(c) c(bound_idxs), grid_reduced, 'UniformOutput', false);
plane_corners = cell2mat(plane_corners);
plane_corners = [plane_corners(:,1:2), fliplr(plane_corners(:,3:4)), plane_corners(:,1)];
plot3(plane_corners(1,:), plane_corners(2,:), plane_corners(3,:), '--k');

% visualize reduced field
figure(99);
clf;
colormap pink;
vis_field_2d(range, field_reduced, 'contour');
xlabel('\alpha_{1, new}');
ylabel('\alpha_{2, new}');