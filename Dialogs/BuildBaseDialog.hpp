class IntBuildBaseDialog
{
    idd = -1;
    movingenable = false;

	class Controls
    {
		class IntProfessionDialog_DialogSurface : IntBaseDialog_BuildBaseDialogSurface {};
		
		class IntProfessionDialog_CancelButton : IntBaseDialog_CancelButton {
			action = "call Intrusion_Client_ProfessionDialog_OnCancelButtonPressed;";
		};
		
		class IntProfessionDialog_OkButton : IntBaseDialog_OkButton {
			action = "call Intrusion_Client_ProfessionDialog_OnOkButtonPressed;";
		};
		
		class IntProfessionDialog_Header : IntBaseDialog_Header
		{
			text = "Build Base";
		};
    };
};
