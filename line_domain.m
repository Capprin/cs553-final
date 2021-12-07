% line_domain.m
% generates a linear subdomain
% inputs:
    % range: 1d collection of points
    % angle: elevation angle in radians
% outputs:
    % grid: cell of rotated domain

function grid = line_domain(range, angle)
    % generate rotation matrix
    R = [cos(angle), -sin(angle); sin(angle), -cos(angle)];
    % rotate ea. pt
    range_vecs = [range; zeros(1, length(range))];
    range_rot = zeros(2, length(range));
    for i = 1:length(range)
        range_rot(:,i) = R * range_vecs(:,i);
    end
    % create return structure
    grid = mat2cell(range_rot, [1 1]);
end