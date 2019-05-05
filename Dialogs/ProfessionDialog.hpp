class IntProfessionDialog
{
    idd = 2999;
    movingenable = false;

	class Controls
    {
	    class RscModel_2231 : RscPicture
			{
				idc = 2231;
				x = 0.5 * GUI_GRID_W + GUI_GRID_X;
				y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 26.5 * GUI_GRID_W;
				h = 9.5 * GUI_GRID_H;
			};
		
		class IntProfessionDialog_CancelButton : IntBaseDialog_CancelButton {
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			action = "call Intrusion_Client_ProfessionDialog_OnCancelButtonPressed;";
		};

		class IntProfessionDialog_OkButton : IntBaseDialog_OkButton {
			idc = 2210;
			x = 34.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "Select";
			action = "call Intrusion_Client_ProfessionDialog_OnOkButtonPressed;";
		};

		class IntProfessionDialog_Header : IntBaseDialog_Header
		{
			text = "Select group's profession.";
		};

		class IntProfessionDialog_ListBox : RscListBox
		{
			idc = 2200;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 19 * GUI_GRID_H;
			
			onLBSelChanged = "call Intrusion_Client_ProfessionDialog_OnListSelectChanged;";
		};

		class IntProfessionDialog_Description : RscStructuredText
		{
			idc = 2215;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 27.5 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
		};
    };
    
    
    class controlsBackground
    {
		class IntProfessionDialog_DialogSurface : IntBaseDialog_DialogSurface
		{
			
		};
    };

};