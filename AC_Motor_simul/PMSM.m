clc, clear all;

%% Motor Parameter
% parameter reference : https://www.researchgate.net/figure/Specifications-of-interior-permanent-magnet-synchronous-motor-IPMSM-used-in_tbl1_284710095

V_max = 212;            % [V], Motor's Max. voltage
I_max = 100;            % [A], Motor drive's stall current (assumed)
Wrpmref = 1000;         % [rpm], Speed reference
Rs = 0.44;              % [ohm], Stator resistance
Ld = 3.09*10^-3;        % [H], d-axis inductance
Lq = 5.47*10^-3;        % [H], q-axis inductance    
LAMpm = 0.0976;         % [wb], Flux linkage           
Pol = 6;                % Number of poles        
Jm = 0.00015;           % [kg*m^2], Equivalent rotor inertia         
Bm = 0.0001;            % [N*m*s/rad], Viscous friction coefficient        

%% controller
% current control
fcc = 5000;
wcc = 2*pi*fcc;
% id control
kpcd = Ld*wcc;
kicd = Rs*wcc;
kacd = 1/kpcd;
% iq control
kpcq = Lq*wcc;
kicq = Rs*wcc;
kacq = 1/kpcq;

% speed control
wcs = wcc/10;
Kt = 5*3*Pol/4;
kps = Jm*wcs/Kt;
kis = kps*wcs/5;
kas = 1/kps;
