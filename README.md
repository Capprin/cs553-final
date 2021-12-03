# cs553-final
Code and data for CS553 (Scientific Visualization) final project

### Dependencies
The Laboratory for Robotics and Applied Mechanics'
[sysplotter](https://github.com/OSU-LRAM/GeometricSystemPlotter),
used for source system files and algorithms.

### Scripts
`vis_field_2d.m`: Function for 2D visualization of scalar data. Based on the
supplied grid and field, can do a number of visualization techniques:
- Contour Plotting
- Filled Contours
- Gradient
- Critical Points
```
% contour plot with critical point estimation
clf;
vis_field_2d(grid, ccf_scalar, 'contour');
vis_field_2d(grid, ccf_scalar, 'critical');
```
> MATLAB's
[`colormap`](https://www.mathworks.com/help/matlab/ref/colormap.html)
function can be used to change the mapping.

`vis_field_3d.m`: Function for 3D visualization of scalar data. Techniques:
- Isosurface
- Critical Points
```
% isosurface plot with color mapping
figure(420); clf;
colormap hot; %must be run after figure init
vis_field_3d(grid, ccf_scalar, 'isosurface');
```

`generate_ccf.m`: Uses syplotter to do system initialization and compute
norms of CCF 2-forms. Saves results in data files.
> While this script is provided, all relevant information should be
present in the included data files.

### Data Files
There is a data file for each of three systems - a three-link, four-link, and
five-link swimmer. They contain:
- `grid`: an N-D grid of sampled joint angles
- `ccf_true`: A cell array of vector magnitudes in each basis direction, for
  every sample point
- `ccf_scalar`: A grid of scalar values (norm of every magnitude in `ccf_true`),
  for every sample point
> Although the range of the grid should be the same for each system, the
number of points in each dimension is not - higher dimensionality puts limits on
the number of points that can be computed.
