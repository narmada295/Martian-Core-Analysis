% MATLAB code to generate a 3D visualization model of the Martian interior
% with a quarter cutout to show the crust, mantle, and liquid core using refined seismic calculations.

% Parameters
core_radius = 1800; % Updated radius of the Martian core in kilometers from seismic analysis
mantle_thickness = 1100; % Thickness of the mantle in kilometers, adjusted for clarity
crust_thickness = 400; % Thickness of the crust in kilometers
planet_radius = core_radius + mantle_thickness + crust_thickness; % Total radius of Mars

% Create a sphere for the crust
[x_crust, y_crust, z_crust] = sphere(100); 
x_crust = x_crust * planet_radius;
y_crust = y_crust * planet_radius;
z_crust = z_crust * planet_radius;

% Create a sphere for the mantle
[x_mantle, y_mantle, z_mantle] = sphere(100);
x_mantle = x_mantle * (core_radius + mantle_thickness);
y_mantle = y_mantle * (core_radius + mantle_thickness);
z_mantle = z_mantle * (core_radius + mantle_thickness);

% Create a sphere for the liquid core
[x_liquid_core, y_liquid_core, z_liquid_core] = sphere(100);
x_liquid_core = x_liquid_core * core_radius;
y_liquid_core = y_liquid_core * core_radius;
z_liquid_core = z_liquid_core * core_radius;

% Cut out a quarter of the spheres to show the interior
cut_condition = (x_crust > 0) & (y_crust > 0);
x_crust(cut_condition) = NaN;
y_crust(cut_condition) = NaN;
z_crust(cut_condition) = NaN;

x_mantle(cut_condition) = NaN;
y_mantle(cut_condition) = NaN;
z_mantle(cut_condition) = NaN;

x_liquid_core(cut_condition) = NaN;
y_liquid_core(cut_condition) = NaN;
z_liquid_core(cut_condition) = NaN;

% Create a figure
figure;
hold on;
axis equal;
grid on;
xlabel('X (km)');
ylabel('Y (km)');
zlabel('Z (km)');
title('3D Model of Martian Interior');

% Plot the crust with texture
mars_texture = imread('mars_texture.jpg');
warp(x_crust, y_crust, z_crust, mars_texture);

% Plot the mantle with a distinct color
surf(x_mantle, y_mantle, z_mantle, 'EdgeColor', 'none', 'FaceColor', [0.8, 0.4, 0.1], 'FaceAlpha', 0.9);

% Plot the liquid core with a visually appealing color
surf(x_liquid_core, y_liquid_core, z_liquid_core, 'EdgeColor', 'none', 'FaceColor', [0.1, 0.2, 0.9], 'FaceAlpha', 0.9);

% Add lighting to enhance the 3D effect
light('Position', [1, 1, 1], 'Style', 'infinite');
lighting gouraud;

% Adjust the view
view(27,-6);
rotate3d on;

% Add a legend
legend('Mars Surface (Texture)', 'Mantle', 'Liquid Core');

% Hold off to finish the plot
hold off;
