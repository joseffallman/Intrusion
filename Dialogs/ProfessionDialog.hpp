class IntProfessionDialog
{
    idd = -1;
    movingenable = false;

	class Controls
    {
		class IntProfessionDialog_DialogSurface : IntBaseDialog_DialogSurface {};
		
		class IntProfessionDialog_OkButton : IntBaseDialog_OkButton {
			action = "call Intrusion_Client_ProfessionDialog_OnOkButtonPressed;";
		};
		
		class IntProfessionDialog_Header : IntBaseDialog_Header
		{
			text = "Profession"; //--- ToDo: Localize;
		};
		
		class IntProfessionDialog_Label : IntBaseDialog_Label
		{
			text = "Select a profession"; //--- ToDo: Localize;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 26 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		
		class IntProfessionDialog_Combo : IntBaseDialog_Combo
		{
			idc = 2100;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
    };
};
