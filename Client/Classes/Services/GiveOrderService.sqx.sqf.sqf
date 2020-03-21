
















cl_Intrusion_Client_GiveOrderService_IsRunning_PropIndex = 2; cl_Intrusion_Client_GiveOrderService_IsCancelling_PropIndex = 3; cl_Intrusion_Client_GiveOrderService_Initialize = { _this call cl_Sqx_Services_Service_Initialize }; cl_Intrusion_Client_GiveOrderService_RunAsync = { _this call cl_Sqx_Services_Service_RunAsync }; cl_Intrusion_Client_GiveOrderService_Cancel = { _this call cl_Sqx_Services_Service_Cancel };




cl_Intrusion_Client_GiveOrderService_constructor = { params ["_class_fields", "_this"]; diag_log ("TYPESQFLOG: " + (if (isNil "_this") then { "" } else { str _this }) + " Intrusion.Client.GiveOrderService.constructor"); params ["_missionTime", "_resourceLocationConfig", "_orderMarkersConfig"];

    ([_class_fields, []] call cl_Sqx_Services_Service_Constructor);

    _class_fields set [10, _missionTime];
    _class_fields set [11, _resourceLocationConfig];
    _class_fields set [4, _orderMarkersConfig];

    ([_class_fields, []] call cl_Intrusion_Client_GiveOrderService_Reset); _class_fields };



cl_Intrusion_Client_GiveOrderService_Reset = { params ["_class_fields", "_this"]; diag_log ("TYPESQFLOG: " + (if (isNil "_this") then { "" } else { str _this }) + " Intrusion.Client.GiveOrderService.Reset");
    _class_fields set [5, false];
    _class_fields set [6, []];
    _class_fields set [7, grpNull];
    _class_fields set [8, 1]; };



cl_Intrusion_Client_GiveOrderService_SendMapClick = { params ["_class_fields", "_this"]; diag_log ("TYPESQFLOG: " + (if (isNil "_this") then { "" } else { str _this }) + " Intrusion.Client.GiveOrderService.SendMapClick"); params ["_pos"];
    if ((_class_fields select 5)) then {
        _class_fields set [6, _pos];
        _class_fields set [5, false]; }; };




cl_Intrusion_Client_GiveOrderService_SendOrderType = { params ["_class_fields", "_this"]; diag_log ("TYPESQFLOG: " + (if (isNil "_this") then { "" } else { str _this }) + " Intrusion.Client.GiveOrderService.SendOrderType"); params ["_orderType", "_engageDetectedEnemies"];
    _class_fields set [8, _orderType];
    _class_fields set [9, _engageDetectedEnemies]; };



Intrusion_Client_GiveOrderService_FindClosestGroup = { diag_log ("TYPESQFLOG: " + (if (isNil "_this") then { "" } else { str _this }) + " Intrusion.Client.GiveOrderService.FindClosestGroup"); params ["_pos"];
    private ["_group"];
    private ["_closestDistance"];

    _group = group player;
    _closestDistance = vehicle player distance _pos;

    {
        if (side _x == side group player && vehicle leader _x distance _pos < _closestDistance) then {
            _closestDistance = vehicle leader _x distance _pos;
            _group = _x; };
    } forEach 
    allGroups;

    _group };



cl_Intrusion_Client_GiveOrderService_FindClosestResourceLocation = { params ["_class_fields", "_this"]; diag_log ("TYPESQFLOG: " + (if (isNil "_this") then { "" } else { str _this }) + " Intrusion.Client.GiveOrderService.FindClosestResourceLocation"); params ["_pos"];
    private ["_locationCollection"];

    _locationCollection = (call Intrusion_Communication_PublicVariableHandler_GetResourceLocationCollection) call { diag_log ("TYPESQFLOG: Intrusion.Communication.PublicVariableHandler.GetResourceLocationCollection returns: " + (if (isNil "_this") then { "nil" } else { str _this };)); _this };

    ((([_locationCollection, [_pos]] call cl_Intrusion_Common_ResourceLocationCollection_GetClosestResourceLocation)) call { diag_log ("TYPESQFLOG: Intrusion.Common.ResourceLocationCollection.GetClosestResourceLocation returns: " + (if (isNil "_this") then { "nil" } else { str _this };)); _this }) };



cl_Intrusion_Client_GiveOrderService_Run = { params ["_class_fields", "_this"]; diag_log ("TYPESQFLOG: " + (if (isNil "_this") then { "" } else { str _this }) + " Intrusion.Client.GiveOrderService.Run");
    private ["_orderResult", "_enoughWaitingTime", "_location", "_orderTimeoutTime", "_orderPos"];

    ([_class_fields, []] call cl_Intrusion_Client_GiveOrderService_Reset);

    _orderResult = "Ordering timed out and was cancelled.";


    openMap true;
    ["Select a squad by single clicking near it on the map."] call Intrusion_Client_ClientMessageHandler_ShowSubTitle;

    _class_fields set [5, true];
    _enoughWaitingTime = time + 30;
    waitUntil { !(_class_fields select 5) || time > _enoughWaitingTime };

    if (!(_class_fields select 5)) then {

        _orderPos = (_class_fields select 6);
        _class_fields set [7, ([(_class_fields select 6)] call Intrusion_Client_GiveOrderService_FindClosestGroup) call { diag_log ("TYPESQFLOG: Intrusion.Client.GiveOrderService.FindClosestGroup returns: " + (if (isNil "_this") then { "nil" } else { str _this };)); _this }];
        ["Squad '" + name leader (_class_fields select 7) + "' is selected."] call Intrusion_Client_ClientMessageHandler_ShowSubTitle;



        (call Intrusion_Client_OrderDialog_ShowDialog) call { diag_log ("TYPESQFLOG: Intrusion.Client.OrderDialog.ShowDialog returns: " + (if (isNil "_this") then { "nil" } else { str _this };)); _this };

        if ((_class_fields select 8) != 1) then {

            ["Single click anywhere on the map to select the order destination for squad " + name leader (_class_fields select 7) + "."] call Intrusion_Client_ClientMessageHandler_ShowSubTitle;

            _class_fields set [5, true];
            _enoughWaitingTime = time + 30;

            _orderTimeoutTime = 0;
            if ((_class_fields select 8) == 4) then {
                _orderTimeoutTime = ((([(_class_fields select 10), []] call compile ("_this call cl_" + (((_class_fields select 10) select 0) select 0) + "_GetMissionTime"))) call { diag_log ("TYPESQFLOG: Intrusion.Common.IMissionTime.GetMissionTime returns: " + (if (isNil "_this") then { "nil" } else { str _this };)); _this }) + 20 * 60; };


            waitUntil { !(_class_fields select 5) || time > _enoughWaitingTime };

            if (!(_class_fields select 5)) then {


                _location = (([_class_fields, [(_class_fields select 6)]] call cl_Intrusion_Client_GiveOrderService_FindClosestResourceLocation)) call { diag_log ("TYPESQFLOG: Intrusion.Client.GiveOrderService.FindClosestResourceLocation returns: " + (if (isNil "_this") then { "nil" } else { str _this };)); _this };

                _orderPos = (_class_fields select 6);
                if ((_class_fields select 6) distance getMarkerPos (_location select 1) > ((_class_fields select 11) select (call compile format ["cl_%1_AreaRadius_PropIndex", ((_class_fields select 11) select 0) select 0]))) then {
                    _location = ["null"]; };



                private _orderInfo = (([(_class_fields select 8)] call Intrusion_Common_OrderTypeMeta_ToString) call { diag_log ("TYPESQFLOG: Intrusion.Common.OrderTypeMeta.ToString returns: " + (if (isNil "_this") then { "nil" } else { str _this };)); _this });

                [(_class_fields select 6), _orderInfo] spawn {
                    params ["_targetPos", "_orderInfo"];
                    private ["_marker"];

                    _marker = [_targetPos, "mil_objective", "ColorRed", _orderInfo] call Sqx_Markers_Marker_CreateIconMarkerLocal;
                    ([_marker, [[0.5, 0.5]]] call cl_Sqx_Markers_Marker_SetSize);
                    sleep 0.4;
                    ([_marker, [0.4]] call cl_Sqx_Markers_Marker_StartBlinking);
                    sleep 2;
                    ([_marker, []] call cl_Sqx_Markers_Marker_StopBlinking);
                    ([_marker, []] call cl_Sqx_Markers_Marker_Show);
                    sleep 5;
                    ([_marker, []] call cl_Sqx_Markers_Marker_Hide); };


                if ((_class_fields select 9)) then {
                    _orderInfo = _orderInfo + "-Engage"; } else { 


                    _orderInfo = _orderInfo + "-Fast"; };


                _orderInfo = _orderInfo + "*";

                if (!(_location isEqualTo ["null"])) then {
                    _orderInfo = _orderInfo + " " + markerText (_location select 1); };


                (_class_fields select 7) setVariable ["IntrusionOrderInfo", _orderInfo, true];

                if (!(isPlayer leader (_class_fields select 7))) then {
                    ["ServerEventReciever.OnBrigadeLeaderGivingOrder", [([[["Intrusion_Common_Order", []]], [(_class_fields select 7), (_class_fields select 8), (_class_fields select 9), _orderPos, _location, _orderTimeoutTime]] call cl_Intrusion_Common_Order_constructor)]] call Intrusion_Communication_Remote_Invoke;
                    _orderResult = ("AI group '" + name leader (_class_fields select 7) + "' has a new order."); } else { 


                    ["ClientEventReciever.OnBrigadeLeaderGivingOrder", [([[["Intrusion_Common_Order", []]], [(_class_fields select 7), (_class_fields select 8), (_class_fields select 9), _orderPos, _location, _orderTimeoutTime]] call cl_Intrusion_Common_Order_constructor)]] call Intrusion_Communication_Remote_Invoke;
                    _orderResult = ("Human group '" + name leader (_class_fields select 7) + "' has a new order."); }; }; }; };





    [_orderResult] call Intrusion_Client_ClientMessageHandler_ShowSubTitle;

    ([_class_fields, []] call cl_Sqx_Services_Service_Run); };