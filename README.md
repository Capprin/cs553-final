# cs553-final
Code and data for CS553 (Scientific Visualization) final project

### Scripts
There are a number of custom functions in this project, which are mostly self-documenting. Most people should start with the example scripts:
- `dim_reduce_example_2d.m`: Dimensionality reduction of a 2D system, with corresponding visualizations.
- `dim_reduce_example_3d.m`: Dimensionality reduction of a 3D system, with corresponding visualizations.
- `opt_dim_reduce_example_2d.m`: Subdomain optimization for a 2D system.
- `opt_dim_reduce_example_3d.m`: Subdomain optimization for a 3D system.

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

### Dependencies
The Laboratory for Robotics and Applied Mechanics'
[sysplotter](https://github.com/OSU-LRAM/GeometricSystemPlotter),
used for source system files and algorithms. Only required to run `generate_ccf.m`.
> You shouldn't ever need this dependency, as all data is included.
