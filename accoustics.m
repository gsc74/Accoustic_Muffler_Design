%acoustics modeling of an Muffler
%Primary Frequency calculation Of Engine
S  = input('No of Strokes = ');
RPM = input('Maximum RPM of Engine = ');
RPM = linspace(0,RPM,20);
Piston = input('No of Pistons = ');
if S == 2
    freq = (RPM*Piston)/60;
else
end
if S == 4
    freq = (RPM*Piston)/120;
else
end
fprintf('Primary frequency of Engine = %f \n', freq);
[xx,yy] = meshgrid(RPM,freq);
zz = ((1.4*.287*(273e3+TEMP))^(1/2)*(1./yy));
figure
surf(xx,yy,zz);
colorbar
xlabel('RPM');
ylabel('Frequency(Hz)');
zlabel('Wavelength(considering Temp.)');
%Helmholtz resonator chamber
%calculation for Natural frequency of helmholtz resonator
fprintf('Choose Cross Section of Muffler\n');
fprintf('Enter 1 for Rectangular\n');
fprintf('Enter 2 for Circular\n');
fprintf('Enter 3 for elliptical\n');
choose = input('Enter Your Choice = ');
w0 = freq;
dens = input('Density of fluid(Air)(Kg/m^3) = ');
Temp = input('Temperature of fluid(C) = ');
dia = input('Diameter of Resonator(m) = ');
mass = input('Mass of Neck Of Resonator(Kg) = ');
% V = required volume of fluid
Area = (pi/4)*(dia).^2;
C = (1.4*.287e3*(273+Temp))^(1/2);
% V = 
V  = (dens*C.^2*Area.^2)/mass*w0(1,20)^.2;
VI  = (dens*C.^2*Area.^2)/mass*((w0(1,10)+w0(1,11))/2)^.2;
fprintf('Appropriate volume of Helmholtz Resonator(To Match natural frequency)(m^3)(@ Maximum RPM) = %f \n', V);
fprintf('Appropriate volume of Helmholtz Resonator(To Match natural frequency)(m^3)(@ Cruising RPM) = %f \n', VI);
if choose == 1
    width = input('width = ');
    height = input('height = ');
    length = V/(width*height);
    lengthI = VI/(width*height);
else 
end
if choose == 2
    dia  = input('input dia of Muffler = ');
    length = V/((pi/4)*dia.^2);
    lengthI = VI/((pi/4)*dia.^2);
else 
end
if choose == 3
    width = input('Length of Major axis = ');
    height = input('length of Minor Axis = ');
    length = V/(pi*width*height);
    lengthI = VI/(pi*width*height);
else 
end
fprintf('Length Of Helmholtz Resonator Chamber(@Max RPM)(m) = %f\n', length);
fprintf('Length Of Helmholtz Resonator Chamber(@Cruising RPM)(m) = %f\n', lengthI);



