% MATLAB Code: 3D Model of Martian Interior with Proper S-Wave Stopping

% Define planetary parameters based on seismic analysis
core_radius = 1800; % Martian liquid core radius in km
mantle_thickness = 1100; % Mantle thickness in km
crust_thickness = 400; % Crust thickness in km
planet_radius = core_radius + mantle_thickness + crust_thickness; % Total Mars radius
mantle_boundary = core_radius + mantle_thickness; % Mantle-core boundary

% Create a sphere for the crust
[x_crust, y_crust, z_crust] = sphere(100);
x_crust = x_crust * planet_radius;
y_crust = y_crust * planet_radius;
z_crust = z_crust * planet_radius;

% Create a sphere for the mantle
[x_mantle, y_mantle, z_mantle] = sphere(100);
x_mantle = x_mantle * mantle_boundary;
y_mantle = y_mantle * mantle_boundary;
z_mantle = z_mantle * mantle_boundary;

% Create a sphere for the liquid core
[x_liquid_core, y_liquid_core, z_liquid_core] = sphere(100);
x_liquid_core = x_liquid_core * core_radius;
y_liquid_core = y_liquid_core * core_radius;
z_liquid_core = z_liquid_core * core_radius;

% Cut out a quarter of the spheres to visualize internal layers
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

% Create the figure
figure;
hold on;
axis equal;
grid on;
xlabel('X (km)');
ylabel('Y (km)');
zlabel('Z (km)');
title('3D visualization of the Martian core and seismic wave propagation');

% Load Mars surface texture
mars_texture = imread('mars_texture.jpg');
warp(x_crust, y_crust, z_crust, mars_texture);

% Plot mantle with improved shading
surf(x_mantle, y_mantle, z_mantle, 'EdgeColor', 'none', 'FaceColor', [0.8, 0.4, 0.1], 'FaceAlpha', 0.5);

% Plot liquid core with enhanced visibility
surf(x_liquid_core, y_liquid_core, z_liquid_core, 'EdgeColor', 'none', 'FaceColor', [0.1, 0.2, 0.9], 'FaceAlpha', 0.85);

% Add lighting for better 3D effect
light('Position', [1, 1, 1], 'Style', 'infinite');
lighting gouraud;

% Define wave propagation parameters
num_frames = 100; % Number of animation frames
p_wave_speed = 8; % Speed of P-waves (km/s)
s_wave_speed = 4.5; % Speed of S-waves (km/s)
time_steps = linspace(0, 500, num_frames); % Animation time steps

% Define a random seismic epicenter above the mantle
theta_epicenter = rand() * 2 * pi;
phi_epicenter = (rand() * 0.5 + 0.5) * pi; 
epicenter_radius = mantle_boundary * 0.85;

% Convert to Cartesian coordinates
epicenter_x = epicenter_radius * sin(phi_epicenter) * cos(theta_epicenter);
epicenter_y = epicenter_radius * sin(phi_epicenter) * sin(theta_epicenter);
epicenter_z = epicenter_radius * cos(phi_epicenter);

% Mark the epicenter on the figure
plot3(epicenter_x, epicenter_y, epicenter_z, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g'); 

% Define wavefront properties
theta = linspace(0, 2*pi, 50);
phi = linspace(0, pi, 50);
[Theta, Phi] = meshgrid(theta, phi);

% Initialize wavefront handles
p_wave_handle = [];
s_wave_handle = [];

% Set the view angle to clearly see the cross-section
view(45, 30);

% Animation loop for seismic waves
for t = time_steps
    % Calculate P-wave radius (Green, propagates through all layers)
    p_wave_radius = p_wave_speed * t;
    if p_wave_radius <= planet_radius
        x_pwave = epicenter_x + p_wave_radius * sin(Phi) .* cos(Theta);
        y_pwave = epicenter_y + p_wave_radius * sin(Phi) .* sin(Theta);
        z_pwave = epicenter_z + p_wave_radius * cos(Phi);
        
        % Delete old P-wave and update
        if ishandle(p_wave_handle)
            delete(p_wave_handle);
        end
        p_wave_handle = surf(x_pwave, y_pwave, z_pwave, 'EdgeColor', 'none', 'FaceColor', [0, 1, 0], 'FaceAlpha', 0.3, 'Tag', 'P-wave');
    end

    % Calculate S-wave radius (Red, stops exactly at mantle-core boundary)
    s_wave_radius = s_wave_speed * t;
    if s_wave_radius + epicenter_radius <= mantle_boundary % Ensures S-wave stops at the core boundary
        x_swave = epicenter_x + s_wave_radius * sin(Phi) .* cos(Theta);
        y_swave = epicenter_y + s_wave_radius * sin(Phi) .* sin(Theta);
        z_swave = epicenter_z + s_wave_radius * cos(Phi);
        
        % Delete old S-wave and update
        if ishandle(s_wave_handle)
            delete(s_wave_handle);
        end
        s_wave_handle = surf(x_swave, y_swave, z_swave, 'EdgeColor', 'none', 'FaceColor', [1, 0, 0], 'FaceAlpha', 0.3, 'Tag', 'S-wave');
    end

    % Pause to create animation effect
    pause(0.05);
end

% Add legend with correct labels
legend('Mars Surface (Texture)', 'Mantle', 'Liquid Core', 'Seismic Epicenter', 'P-Wave (Green, Can Pass)', 'S-Wave (Red, Stops at Core)');

% Final adjustments
hold off;
