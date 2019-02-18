class IntOrderDialog_PlaceButton : IntBaseDialog_Button
{
	idc = -1;
	text = "Place respawn point here";
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1.8 * GUI_GRID_H;
	action = " closeDialog 0; ";
};

class IntOrderDialog
{
    idd = -1;
    movingenable = true;

	class Controls
    {
		class IntOrderDialog_DialogSurface : IntBaseDialog_DialogSurface {};
		
		class IntOrderDialog_Header : IntBaseDialog_Header
		{
			text = "Select Order";
			x = 1 * GUI_GRID_W + GUI_GRID_X;
		};
		
		class IntOrderDialog_ReconButton : IntOrderDialog_PlaceButton {
			text = "Recon";
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			action = "call Intrusion_Client_OrderDialog_OnReconButtonPressed;";
		};
		
		class IntOrderDialog_AttackButton : IntOrderDialog_PlaceButton {
			text = "Attack";
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			action = "call Intrusion_Client_OrderDialog_OnAttackButtonPressed;";
		};
		
		class IntOrderDialog_DefendButton : IntOrderDialog_PlaceButton {
			text = "Defend";
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			action = "call Intrusion_Client_OrderDialog_OnDefendButtonPressed;";
		};
		
		class IntOrderDialog_CancelButton : IntBaseDialog_CancelButton {
			text = "Cancel";
			action = "call Intrusion_Client_OrderDialog_OnCancelButtonPressed;";
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
		};
    };
};
