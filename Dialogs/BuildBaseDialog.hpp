class IntBaseDialog_PlaceButton : IntBaseDialog_Button
{
	idc = -1;
	text = "Place respawn point here";
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1.8 * GUI_GRID_H;
	action = " closeDialog 0; ";
};

class IntBuildBaseDialog
{
    idd = -1;
    movingenable = true;

	class Controls
    {
		class IntMoveBaseDialog_DialogSurface : IntBaseDialog_DialogSurface {};
		
		class IntMoveBaseDialog_Header : IntBaseDialog_Header
		{
			text = "Move Base";
			x = 1 * GUI_GRID_W + GUI_GRID_X;
		};
		
		class IntMoveBaseDialog_PlaceRespawnPointButton : IntBaseDialog_PlaceButton {
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			action = "call Intrusion_Client_MoveBaseDialog_OnRespawnButtonPressed;";
		};
		
		class IntMoveBaseDialog_PlaceVehiclesPointButton : IntBaseDialog_PlaceButton {
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			action = "hint ""Vehicles""";
		};
		
		class IntMoveBaseDialog_PlaceWeaponsPointButton : IntBaseDialog_PlaceButton {
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			action = "hint ""Weapons""";
		};
		
		class IntMoveBaseDialog_CancelButton : IntBaseDialog_CancelButton {
			text = "Cancel";
			action = "call Intrusion_Client_MoveBaseDialog_OnCancelButtonPressed;";
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
		};
		
		class IntMoveBaseDialog_OkButton : IntBaseDialog_OkButton {
			text = "Move base now";
			x = 32.5 * GUI_GRID_W + GUI_GRID_X;
			w = 7 * GUI_GRID_W;
			action = "call Intrusion_Client_MoveBaseDialog_OnOkButtonPressed;";
		};
    };
};
