//IMMUTABLE VALUES
sizeDefault = 0;
sizeMax = random_range(2.5, 3.5);
sizeChange = sizeMax - sizeDefault;

rotDefault = 2;
rotChange = -rotDefault;

intervalGrowth = 120 * dur;
intervalLife = 60 * dur;
intervalFade = 60 * dur;


//SETUP AND SPAWNING
var _placementOffset = 64;
x += _placementOffset - random(_placementOffset * 2);
y += _placementOffset - random(_placementOffset * 2);



//GAME VALUES
size = sizeDefault;
rot = rotDefault;

timer = 0;


//METHODS


//STATES