//Get ground position
var _groundTile = getTileAtPos(x, y);
if(_groundTile != undefined) {
	zPos = _groundTile[TILE.Z];
	logEvent("Spawned tree at x: " + string(x) + " y: " + string(y) + " with height " + string(zPos), SEVERITY.DEBUG);
}
else {
	zPos = 0;
	logEvent("Tree at x: " + string(x) + " y: " + string(y) + " has the wrong height.", SEVERITY.WARNING);
}