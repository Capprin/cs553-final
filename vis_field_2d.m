% vis_field_2d.m
% selection of 2D scalar field visualizations
% inputs:
    % grid: ndgrid
    % field: scalar field defined over grid
    % method: visualization method; any of {contour, gradient, critical}

function f = vis_field_2d(grid, field, method)
    % figure setup
    f = figure(69);
    hold on;
    % sanitize
    if ~exist('method', 'var')
        method = 'contour';
    end
    % visualization techniques
    switch method
        case 'contour'
            % contour plot
            contour(field);
        case 'gradient'
            % gradient plot (rotate to respect meshgrid)
            image(1, 1, field, 'CdataMapping', 'scaled','Interpolation','bilinear');
            axis('on');
            colorbar;
        case 'critical'
            % critical points
            % actually requires bilinear interp. this is a pita so will
            % come later
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
end