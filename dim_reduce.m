% field_reduced.m
% does dimensionality reduction by querying an embedded subdomain
% inputs:
    % grid: ndgrid of original field
    % field: original field
    % grid_reduced: cell of subdomain query points
% outputs:
    % field_reduced: field defined over subdomain

function field_reduced = dim_reduce(grid, field, grid_reduced)
    % cubic interpolation
    F = griddedInterpolant(grid{:}, field, 'cubic');
    field_reduced = F(grid_reduced{:});
end