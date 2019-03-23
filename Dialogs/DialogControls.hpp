class RscObject
{
	access = 0; 
	idc = -1;
	type = 82;
	model = "\a3\Ui_f\objects\Compass.p3d";
	scale = 0.5;
	shadow = 0;
	
	xBack = 0;
	yBack = 0;
	zBack = 0;
	enableZoom = 0;
	zoomDuration = 0;
	inBack = 0;
	direction[] = {1,0,0};
	up[] = {0,1,0};
	tooltip = "";
	tooltipColorShade[] = {0,0,0,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	onMouseMoving = "";
	onMouseHolding = "";
	onMouseDown = "";
     
};

class IntBaseDialog_DialogSurface : BOX
{
	idc = -1;
	text = "";
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 25 * GUI_GRID_H;
    colorBackground[] = { 0,0,0,0.5};
};

class IntBaseDialog_Header : RscText
{
	idc = 43;
	text = "Header";
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
	text = "Label";
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 26 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};

class IntBaseDialog_Button : RscButton
{
	idc = -1;
	text = "Hit me";
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = " hint ""Button pressed!""; ";
};

class IntBaseDialog_CloseButton : IntBaseDialog_Button
{
	idc = -1;
	text = "Close";
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = " closeDialog 0; ";
};

class IntBaseDialog_OkButton : IntBaseDialog_Button
{
	idc = -1;
	text = "OK";
	x = 35.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = " closeDialog 0; ";
};

class IntBaseDialog_CancelButton : IntBaseDialog_Button
{
	idc = -1;
	text = "Cancel";
	x = 30.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = " closeDialog 0; ";
};

class IntBaseDialog_ListBox : RscListBox
{
	id = 2200;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 19 * GUI_GRID_W;
	h = 19 * GUI_GRID_H;
	
	onLBSelChanged = "";
};

