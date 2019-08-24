class platformCargo_Dialog
{
    idd = 7777;
    movingEnabled = false;

    class controls
    {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by overseer, v1.063, #Dejyhi)
		////////////////////////////////////////////////////////

		class platformCargo_rscPicture: RscPicture
		{
			idc = 7000;

			text = "#(argb,8,8,3)color(0.1,0.1,0.1,0.8)";
			x = 0.299479 * safezoneW + safezoneX;
			y = 0.247099 * safezoneH + safezoneY;
			w = 0.401042 * safezoneW;
			h = 0.406841 * safezoneH;
		};
		class platformCargo_panel4Frame: RscFrame
		{
			idc = 7410;
			x = 0.540104 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.148958 * safezoneW;
			h = 0.131949 * safezoneH;
		};
		class platformCargo_panel4HiddenCheckbox: RscCheckbox
		{
			idc = 7404;

			x = 0.574479 * safezoneW + safezoneX;
			y = 0.565974 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class platformCargo_panel4HiddenText: RscText
		{
			idc = 7403;

			text = "Hide"; //--- ToDo: Localize;
			x = 0.545833 * safezoneW + safezoneX;
			y = 0.57697 * safezoneH + safezoneY;
			w = 0.0229167 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class platformCargo_panel4RotateSlider: RscSlider
		{
			idc = 7402;
			x = 0.551563 * safezoneW + safezoneX;
			y = 0.532987 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class platformCargo_panel4Text: RscText
		{
			idc = 7401;

			text = "Panel 4"; //--- ToDo: Localize;
			x = 0.545833 * safezoneW + safezoneX;
			y = 0.489004 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class platformCargo_panel3Frame: RscFrame
		{
			idc = 7310;
			x = 0.310937 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.148958 * safezoneW;
			h = 0.131949 * safezoneH;
		};
		class platformCargo_panel3HiddenCheckbox: RscCheckbox
		{
			idc = 7304;

			x = 0.345313 * safezoneW + safezoneX;
			y = 0.565974 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class platformCargo_panel3HiddenText: RscText
		{
			idc = 7303;

			text = "Hide"; //--- ToDo: Localize;
			x = 0.316667 * safezoneW + safezoneX;
			y = 0.57697 * safezoneH + safezoneY;
			w = 0.0229167 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class platformCargo_panel3RotateSlider: RscSlider
		{
			idc = 7302;
			x = 0.322396 * safezoneW + safezoneX;
			y = 0.532987 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class platformCargo_panel3Text: RscText
		{
			idc = 7301;

			text = "Panel 3"; //--- ToDo: Localize;
			x = 0.316667 * safezoneW + safezoneX;
			y = 0.489004 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class platformCargo_panel2Frame: RscFrame
		{
			idc = 7210;
			x = 0.540104 * safezoneW + safezoneX;
			y = 0.26909 * safezoneH + safezoneY;
			w = 0.148958 * safezoneW;
			h = 0.131949 * safezoneH;
		};
		class platformCargo_panel2HiddenCheckbox: RscCheckbox
		{
			idc = 7204;

			x = 0.580208 * safezoneW + safezoneX;
			y = 0.335064 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class platformCargo_panel2HiddenText: RscText
		{
			idc = 7203;

			text = "Hide"; //--- ToDo: Localize;
			x = 0.551563 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.0229167 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class platformCargo_panel2RotateSlider: RscSlider
		{
			idc = 7202;
			x = 0.551563 * safezoneW + safezoneX;
			y = 0.302077 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class platformCargo_panel2Text: RscText
		{
			idc = 7201;

			text = "Panel 2"; //--- ToDo: Localize;
			x = 0.545833 * safezoneW + safezoneX;
			y = 0.258094 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class platformCargo_panel1Frame: RscFrame
		{
			idc = 7110;
			x = 0.310937 * safezoneW + safezoneX;
			y = 0.26909 * safezoneH + safezoneY;
			w = 0.148958 * safezoneW;
			h = 0.131949 * safezoneH;
		};
		class platformCargo_panel1HiddenCheckbox: RscCheckbox
		{
			idc = 7104;

			x = 0.345313 * safezoneW + safezoneX;
			y = 0.335064 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class platformCargo_panel1HiddenText: RscText
		{
			idc = 7103;

			text = "Hide"; //--- ToDo: Localize;
			x = 0.316667 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.0229167 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class platformCargo_panel1RotateSlider: RscSlider
		{
			idc = 7102;
			x = 0.322396 * safezoneW + safezoneX;
			y = 0.302077 * safezoneH + safezoneY;
			w = 0.126042 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class platformCargo_panel1Text: RscText
		{
			idc = 7101;

			text = "Panel 1"; //--- ToDo: Localize;
			x = 0.316667 * safezoneW + safezoneX;
			y = 0.258094 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		class platformCargo_elevatorDownButton: RscButton
		{
			idc = 7006;

			text = "Down"; //--- ToDo: Localize;
			x = 0.477083 * safezoneW + safezoneX;
			y = 0.489004 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
            action = "_nil=['elevator', 0]ExecVM ""platformCargo\action.sqf""";
		};
		class platformCargo_elevator75Button: RscButton
		{
			idc = 7005;

			text = "75%"; //--- ToDo: Localize;
			x = 0.534375 * safezoneW + safezoneX;
			y = 0.434026 * safezoneH + safezoneY;
			w = 0.034375 * safezoneW;
			h = 0.0329871 * safezoneH;
            action = "_nil=['elevator', 75]ExecVM ""platformCargo\action.sqf""";
		};
		class platformCargo_elevator50Button: RscButton
		{
			idc = 7004;

			text = "50%"; //--- ToDo: Localize;
			x = 0.482812 * safezoneW + safezoneX;
			y = 0.434026 * safezoneH + safezoneY;
			w = 0.034375 * safezoneW;
			h = 0.0329871 * safezoneH;
            action = "_nil=['elevator', 50]ExecVM ""platformCargo\action.sqf""";
		};
		class platformCargo_elevator25Button: RscButton
		{
			idc = 7003;

			text = "25%"; //--- ToDo: Localize;
			x = 0.43125 * safezoneW + safezoneX;
			y = 0.434026 * safezoneH + safezoneY;
			w = 0.034375 * safezoneW;
			h = 0.0329871 * safezoneH;
            action = "_nil=['elevator', 25]ExecVM ""platformCargo\action.sqf""";
		};
		class platformCargo_elevatorUpButton: RscButton
		{
			idc = 7002;

			text = "Up"; //--- ToDo: Localize;
			x = 0.477083 * safezoneW + safezoneX;
			y = 0.357056 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
            action = "_nil=['elevator', 100]ExecVM ""platformCargo\action.sqf""";
		};
		class platformCargo_elevatorText: RscText
		{
			idc = 7001;

			text = "Elevator"; //--- ToDo: Localize;
			x = 0.48052 * safezoneW + safezoneX;
			y = 0.297678 * safezoneH + safezoneY;
			w = 0.0458333 * safezoneW;
			h = 0.0549786 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

  };
};
