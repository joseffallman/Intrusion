class IntBaseDialog_DialogSurface : BOX
{
	idc = -1;
	text = "Text"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 25 * GUI_GRID_H;
    colorBackground[] = { 0,0,0,0.5};
};

class IntBaseDialog_Header : RscText
{
	idc = 43;
	text = "Header"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 39 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	colorBackground[] = {-1,-1,-1,0};
};

class IntBaseDialog_Combo: RscCombo
{
	idc = 2100;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 19 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};

class IntBaseDialog_Label: RscText
{
	idc = 1000;
	text = "Label"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 26 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};

class IntBaseDialog_Button : RscButton
{
	idc = -1;
	text = "Hit me"; //--- ToDo: Localize;
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = " hint ""Button pressed!""; ";
};

class IntBaseDialog_CloseButton : IntBaseDialog_Button
{
	idc = -1;
	text = "Close"; //--- ToDo: Localize;
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = " closeDialog 0; ";
};

class IntBaseDialog_OkButton : IntBaseDialog_Button
{
	idc = -1;
	text = "OK"; //--- ToDo: Localize;
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = " closeDialog 0; ";
};
