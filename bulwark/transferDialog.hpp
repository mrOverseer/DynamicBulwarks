class transferBox_Dialog
{
    idd = 8888;
    movingEnabled = false;

    class controls
    {
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT transfer (by overseer, v1.063, #Vezoly)
        ////////////////////////////////////////////////////////

        class transferBox_rscPicture: RscPicture
        {
            idc = 2200;
            text = "#(argb,8,8,3)color(0.1,0.1,0.1,0.8)";
            x = 0.3 * safezoneW + safezoneX;
            y = 0.25 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h =  0.385 * safezoneH;
        };

        class transferBox_playerList: RscListbox
        {
            idc = 2500;
            x = 0.31 * safezoneW + safezoneX;
            y = 0.27 * safezoneH + safezoneY;
            w = 0.185 * safezoneW;
            h = 0.3 * safezoneH;
        };
		
        class transferBox_transferdButton: RscButton
        {
            idc = 2600;
            text = "Transfer points";
            x = 0.31 * safezoneW + safezoneX;
            y = 0.58 * safezoneH + safezoneY;
            w = 0.380 * safezoneW;
            h = 0.04 * safezoneH;
            action = "_nil=[]ExecVM ""bulwark\transfer.sqf""";
        };

        class transferBox_pointsLst: RscListbox
        {
            idc = 2501;
            x = 0.505 * safezoneW + safezoneX;
            y = 0.27 * safezoneH + safezoneY;
            w = 0.185 * safezoneW;
            h = 0.3 * safezoneH;
        };

        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////

  };
};
