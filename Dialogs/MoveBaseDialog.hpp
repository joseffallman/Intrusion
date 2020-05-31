/*
 * Name:	IntMoveBaseDialog
 * Date:	2020-03-29
 * Version: 1.0
 * Author:  Josef
 *
 * Description:
 * The Move base dialog.
 */
 
class IntMoveBaseDialog : IntBaseDialog
{
	onUnload = "call Intrusion_Client_MoveBaseDialog_onUnload;";
	class Controls : Controls
	{
		class _CT_CONTROLS_GROUP
		{
			type = 15;
			idc = -1;
            style = 16;
			//x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			//y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			//w = 39.5 * GUI_GRID_W;
			//h = 17.5 * GUI_GRID_H;
            x = 0.5 * GUI_GRID_W + GUI_GRID_X;
            y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 39 * GUI_GRID_W;
			h = 17 * GUI_GRID_H;
            shadow = 0;
			
			onLBDrop = "call Intrusion_Client_MoveBaseDialog_OnMapDrop;";
			
			
			class ScrollBar
            {
                color[] = {1,1,1,0.6};
                colorActive[] = {1,1,1,1};
                colorDisabled[] = {1,1,1,0.3};
                thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
            };
            class VScrollbar: ScrollBar
            {
                width = 0.021;
                autoScrollSpeed = -1;
                autoScrollDelay = 5;
                autoScrollRewind = 0;
                shadow = 0;
            };
            class HScrollbar: ScrollBar
            {
                height = 0.028;
                shadow = 0;
            };
            
			class Controls
			{
				class Map : RscMapControl
				{
					idc = 2550;
					x = 0.5 * GUI_GRID_W;
					y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
					w = 26.5 * GUI_GRID_W;
					h = 16.5 * GUI_GRID_H;
					//scaleMin = 0.02;
					//scaleMax = 0.02;
					scaleDefault = 1; //0.02;
					onMouseButtonClick = "call Intrusion_Client_MoveBaseDialog_onMapClick;";
					
				};
				
				class ListBox : RscListBox 
				{
				
					idc = 2552;
					x = 27.5 * GUI_GRID_W + GUI_GRID_X;
					y = 0;
					w = 11.5 * GUI_GRID_W;
					h = 16 * GUI_GRID_H;
					canDrag = 1;
					onLBSelChanged = "call Intrusion_Client_MoveBaseDialog_OnListBoxSelectChanged;";
					onLBDrag = "call Intrusion_Client_MoveBaseDialog_OnListBoxDrag;";
				};

			};
		};
		
		class CancelButton : Base_CancelButton 
		{
			action = "call Intrusion_Client_MoveBaseDialog_OnCancelButtonPressed;";
		};
		
		class OKButton : Base_OkButton 
		{
			text = "Move Base";
			action = "call Intrusion_Client_MoveBaseDialog_OnOkButtonPressed;";
		};
		
		class Header : Base_Header 
		{
			text = "Move base dialog.";
		};
		
		
		
		class Description : Base_Description 
		{
			idc = 2553;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 27.5 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
			//colorBackground[] = {1,1,1,1};
		};
		
	};
};

class ContextMenu : RscListBox
{
	idc = 2560;
	type = CT_LISTBOX;
	style = ST_LEFT;
	x = 0.5 * GUI_GRID_W;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
	colorSelectBackground[] = {0.6,0.6,0.6,1};
  	colorSelectBackground2[] = {0.2,0.2,0.2,1};
  	onLBSelChanged = "call Intrusion_Client_MoveBaseContextMenu_OnListBoxSelectChanged;";
};
