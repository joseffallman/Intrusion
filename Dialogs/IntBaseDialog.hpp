/*
 * Name:	IntBaseDialog
 * Date:	2020-03-29
 * Version: 1.0
 * Author:  Josef
 *
 * Description:
 * The dialog parent. Inherit from this class to your dialogs.
 */

class IntBaseDialog
{
    idd = 2500;
    movingenable = false;

	class Controls
    {
	    class Base_Picture : RscPicture
		{
			idc = 2550;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 26.5 * GUI_GRID_W;
			h = 9.5 * GUI_GRID_H;
		};
		
		class Base_CancelButton : IntBaseDialog_CancelButton 
		{
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};

		class Base_OkButton : IntBaseDialog_OkButton 
		{
			idc = 2551;
			x = 34.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			text = "Ok";
			action = " closeDialog 0; ";
		};

		class Base_Header : IntBaseDialog_Header
		{
			text = "Set Header Text.";
		};

		class Base_ListBox : RscListBox
		{
			idc = 2552;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 19 * GUI_GRID_H;
			
		};

		class Base_Description : RscStructuredText
		{
			idc = 2553;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 27.5 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
		};
    };
    
    
    class controlsBackground
    {
		class IntBaseDialog_Background : IntBaseDialog_DialogSurface
		{
			
		};
    };

};
