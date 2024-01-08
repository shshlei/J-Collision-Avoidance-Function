disp('J function');

Jpath = fileparts(mfilename('fullpath'));
addpath(Jpath);
J_functionpath = fullfile(Jpath, 'J_function');
if exist(J_functionpath, 'dir')
    addpath(J_functionpath);
end

examplespath = fullfile(Jpath, 'examples');
if exist(examplespath, 'dir')
    addpath(examplespath);
end

clear Jpath J_functionpath examplespath
