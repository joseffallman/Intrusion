class IntProfessionDialog
{
    idd = 2999;
    movingenable = false;
    
    class Objects 
    {
		class RscModel_2230 : RscObject
		{
			idc = 2230;
			scale = 0.5;
			z = 8.5;
			//model = "\A3\armor_f_beta\APC_Tracked_01\APC_Tracked_01_rcws_F.p3d";
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 27.5 * GUI_GRID_W;
			h = 10 * GUI_GRID_H;
		};
		
	};


	class Controls
    {
		
		class IntProfessionDialog_CancelButton : IntBaseDialog_CancelButton {
			x = 28.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			action = "call Intrusion_Client_ProfessionDialog_OnCancelButtonPressed;";
		};

		class IntProfessionDialog_OkButton : IntBaseDialog_OkButton {
			idc = 2210;
			x = 36 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
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
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 20 * GUI_GRID_H;
			
			onLBSelChanged = "call Intrusion_Client_ProfessionDialog_OnListSelectChanged;";
		};

		class RscText_2215: RscStructuredText
		{
			idc = 2215;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
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