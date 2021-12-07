% plane_domain.m
% generates a planar subdomain
% inputs:
    % range: 2d ndgrid of points
    % angles: 3-element vector of (y, p, r) aka (z, y, x) rotation angles
% outputs:
    % grid: cell of rotated domain points

function grid = plane_domain(range, angles)
    % generate rotation matrices
    angles_cell = num2cell(angles);
    [z, y, x] = deal(angles_cell{:});
    Rx = [1 0 0; 0 cos(x) -sin(x); 0 sin(x) cos(x)];
    Ry = [cos(y) 0 sin(y); 0 1 0; -sin(y) 0 cos(y)];
    Rz = [cos(z) -sin(z) 0; sin(z) cos(z) 0; 0 0 1];
    % rotate ea. pt
    range_rot = zeros(3, numel(range{1}));
    for i = 1:numel(range{1})
        vec = [range{1}(i); range{2}(i); 0];
        range_rot(:,i) = Rx * Ry * Rz * vec;
    end
    % create return structure
    grid = mat2cell(range_rot, [1 1 1]);
end