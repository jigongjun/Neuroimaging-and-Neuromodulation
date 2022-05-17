%
% example script that runs a simple simnibs TMS simulation
% 
% G. Saturnino, A. Thielscher, 2018
%

%% General information

S = sim_struct('SESSION');
S.fnamehead = 'jgjtest.msh'; % head mesh, prodeced by headreco
S.pathfem = 'tms_minimal'; %Folder for the simulation output

%% Define TMS simulation
S.poslist{1} = sim_struct('TMSLIST');
S.poslist{1}.fnamecoil = 'Magstim_70mm_Fig8.nii.gz'; % Choose a coil in the ccd-files folder

%Define Position
Cord =[0 -16 122 1];
CordDirction = [-1 0 0; 0 1 0; 0 0 -1; 0 0 0] ;
S.poslist{1}.pos(1).matsimnibs = [CordDirction  Cord'];

% S.poslist{1}.pos(1).centre = 'CP3'; % Place it over C3
% S.poslist{1}.pos(1).pos_ydir = 'C3'; % Polongation of coil handle (see documentation)
% S.poslist{1}.pos(1).distance = 4; % 4 mm distance from coil surface to head surface


%% Run Simulation
name_mat = [tempname,'.mat'];
save(name_mat, 'S');
path_to_simnibs = '/home/FMRISoftWare/SimNIBS/bin/simnibs';

result = system([path_to_simnibs ' ' name_mat]);

%% Visualize Simulations
m = mesh_load_gmsh4(fullfile('tms_minimal', 'jgjtest_TMS_1-0001_Magstim_70mm_Fig8_nii_scalar.msh'));
mesh_show_surface(m);


%%
tms_opt=opt_struct('TMSoptimize') ;
tms_opt.fnamehead = 'jgjtest.msh';
tms_opt.pathfem='tms_optimization/';
tms_opt.fnamecoil='Magstim_70mm_Fig8.nii.gz';
tms_opt.target = [-7 15 75] ;
tms_opt.slover_option = 'pardiso';
run_simnibs(tms_opt)






