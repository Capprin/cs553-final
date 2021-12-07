% vis_field_2d.m
% selection of 2D scalar field visualizations
% inputs:
    % grid: ndgrid
    % field: scalar field defined over grid
    % method: visualization method; any of {contour, contourf, gradient, critical}

function f = vis_field_2d(grid, field, method, levels)
    % figure setup
    hold on;
    % sanitize
    if ~exist('method', 'var')
        method = 'contour';
    end
    if ~exist('levels','var')
        levels = 7;
    end
    % visualization techniques
    switch method
        case 'contour'
            % contour plot
            contour(field, levels);
        case 'contourf'
            % filled contour plot
            contourf(field, levels, 'LineStyle', 'none');
        case 'gradient'
            % gradient plot (rotate to respect meshgrid)
            image(1, 1, field, 'CdataMapping', 'scaled','Interpolation','bilinear');
            axis('on');
        case 'critical'
            % critical points
            % using area of many contours to determine max/min
            C = contourc(field, levels);
            % build list of contours, compute areas
            C_struct = get_contours(C);
            areas = zeros(1,length(C_struct));
            for i = 1:length(C_struct)
                % only use closed polygons
                if C_struct(i).x(1) == C_struct(i).x(end) &&...
                   C_struct(i).y(1) == C_struct(i).y(end)
                    areas(i) = polyarea(C_struct(i).x, C_struct(i).y);
                else
                    areas(i) = 0;
                end
                
            end
            % ignore lines (zero area)
            used = areas~=0;
            areas = areas(used);
            C_struct = C_struct(used);
            % get smallest contours, within some tolerance
            tol = 1/(levels);
            min_area = min(areas); 
            point_idxs = find(areas < min_area + tol*min_area);
            % get centerpoints
            points = zeros(2,length(point_idxs));
            for i = 1:length(points)
                points(1,i) = mean(C_struct(point_idxs(i)).x);
                points(2,i) = mean(C_struct(point_idxs(i)).y);
            end
            scatter(points(1,:), points(2,:), '.k');
    end
    % labels
    xlabel('\alpha_1');
    ylabel('\alpha_2');
    title('2D Scalar Field Visualization');
    xl = xlim;
    xticks(linspace(xl(1), xl(2), 7));
    xticklabels({'' '-2' '-1' '0' '1' '2' ''}); %lazy formatting, data known
    yl = ylim;
    yticks(linspace(yl(1), yl(2), 7));
    yticklabels({'' '-2' '-1' '0' '1' '2' ''});
    axis('equal')
    colorbar;
end