loadGame();

if (room != global.lastRoom) {
	room_goto(global.lastRoom);
}

x = global.lastCheckpointX;
y = global.lastCheckpointY;