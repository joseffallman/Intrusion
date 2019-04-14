class IntBaseDialog_DialogSurface : BOX
{
	idc = 1800;
	text = "Text";
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 25 * GUI_GRID_H;
    colorBackground[] = { 0,0,0,0.5};
};

class IntBaseDialog_Header : RscText
{
	idc = -1;
	text = "Header";
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 39 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	colorBackground[] = {-1,-1,-1,0};
};

class IntBaseDialog_Button : RscButton
{
	text = "Hit me";
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	colorDisabled[] = { 0, 0, 1, 0.7 }
	action = " hint ""Button pressed!""; ";
};

class IntBaseDialog_CloseButton : IntBaseDialog_Button
{
	text = "Close";
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = " closeDialog 0; ";
};
