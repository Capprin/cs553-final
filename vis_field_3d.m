% vis_field_3d.m
% 3D scalar field visualization function
% inputs:
    % grid: ndgrid
    % field: scalar field defined over grid
    % method: visualization method; any of {isosurface, critical}
    % levels: for isosurface visualization

function f = vis_field_3d(grid, field, method, levels)
    % figure setup
    f = figure(420);
    hold on;
    % sanitize
    if ~exist('method','var')
        method = 'isosurface';
    end
    if ~exist('levels','var')
        levels = 5;
    end
    % visualization techniques
    switch method
        case 'isosurface'
            % isosurface visualization
            % setup
            field_min = min(field,[],'all');
            field_max = max(field,[],'all');
            isovals = linspace(field_min, field_max, levels);
            alphas = linspace(0,0.7,levels);
            cmap = colormap(420);
            % turn ndgrid into meshgrid for visualization
            grid_mesh = cellfun(@(g) permute(g, [2 1 3]), grid, 'UniformOutput', false);
            % create isosurface at each level
            for i = 1:levels
                % generate surface as 3D polygon
                surf = isosurface(grid_mesh{:},field,isovals(i));
                poly = patch(surf);
                isonormals(grid_mesh{:}, field, poly); %might need samples
                % use current colormap for color
                c_i = floor(i/levels*size(cmap,1));
                set(poly,...
                    'FaceColor', cmap(c_i,:),...
                    'EdgeColor', 'none',...
                    'FaceAlpha', alphas(i));
            end
        case 'critical'
            % critical points
    end
    % labels
    xlabel('\alpha_1');
    ylabel('\alpha_2');
    zlabel('\alpha_3');
    title('3D Scalar Field Visualization');
    colorbar;
    daspect([1 1 1]);
    view(3);
    camlight;
    lighting gouraud;
end