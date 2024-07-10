//inherited values and behavior
vulnerable = false;

spd = 4 * 0.65;

slotsize = 1;

enemyHPCurrent = 0;
executable = false;
rangeFinisher = 60;

rangeDetection = 120;

hp = 0;
hpMax = 10;

executable = false;
rangeFinisher = 60;

rangeDetection = 120;

inRoom = instance_place(x, y, obj_room);

idParty = undefined;
myParty = undefined;
myLeader = undefined;
amLeader = undefined;


//non-unique values
event_inherited();