

var _toRoom = irandom(global.countRooms - 1);
while (_toRoom == inRoom) _toRoom = irandom(global.countRooms - 1);

get_navmesh(inRoom, _toRoom);