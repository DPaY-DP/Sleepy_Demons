randomize();
global.envHP = 1000;


//enemy behavior
global.parties = [];

if (variable_global_exists("countRoom")) global.countRoom = 0;
if (variable_global_exists("countDoor")) global.countDoor = 0;
if (variable_global_exists("countEnv")) global.countEnv = 0;


//rooms
timerLoss = 0;