class IntTechnologyDialog : IntListBoxDialog
{
    idd = 2600;

	class Controls : Controls
    {

	    class IntListBoxDialog_VehiclePicture : Base_VehiclePicture
		{
		};
		
		class IntListBoxDialog_OkButton : Base_OkButton 
		{
		};

		class IntListBoxDialog_Header : Base_Header
		{
			text = "Intrusion Technology Information.";
		};

		class IntListBoxDialog_ListBox : Base_ListBox
		{
			onLBSelChanged = "call Intrusion_Client_TechnologyDialog_OnListSelectChanged;";
		};

		class IntListBoxDialog_Description : Base_Description
		{
		};
	};

};