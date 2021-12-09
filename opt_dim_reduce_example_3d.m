% dim_reduce_example_3d.m
% does 3d->2d dimensionality reduction and visualization

% load data (produces grid, ccf_scalar field)
load('data_sysf_four_link_HighRe.mat');

max_aus = -1;
max_angle1 = -1;
max_angle2 = -1;

aus_arr = zeros(360 * 180 *360, 3);

for i = 99:1:360
    fprintf('Looking at angle %d %s\n', i, datestr(now,'HH:MM:SS.FFF'))
    for n = 1:1:360
        for k = 1:1:360
            angle1 = i;
            angle2 = n;
            angle3 = k;

            % generate an 'interesting' subdomain
            points = 31;
            range_1d = linspace(-2.5, 2.5, points);
            range = cell(1,2);
            [range{:}] = ndgrid(range_1d);
            grid_reduced = plane_domain(range, [deg2rad(i), deg2rad(n), deg2rad(k)]);
            field_reduced = dim_reduce(grid, ccf_scalar, grid_reduced);
            field_reduced = reshape(field_reduced, points, points);

            % calculate area under surface
            aus = trapz(range_1d, trapz(range_1d,field_reduced,2));
            
            if aus > max_aus
                max_aus = aus;
                max_angle1 = i;  
                max_angle2 = n;
                max_angle3 = k;
            end
        end
    end
end

max_angle1
max_angle2
max_angle3
max_aus