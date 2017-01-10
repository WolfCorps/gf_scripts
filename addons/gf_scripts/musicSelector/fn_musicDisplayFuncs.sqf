#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"
_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;
diag_log [__FILE__, "CALLED",_this];
switch _mode do {
	case "onLoad": {

		_display = _params select 0;
		_displayConfig = configfile >> _class;

		_ctrlBackground = _display displayctrl IDC_RSCDISPLAYATTRIBUTES_BACKGROUND;
		_ctrlTitle = _display displayctrl IDC_RSCDISPLAYATTRIBUTES_TITLE;
		_ctrlContent = _display displayctrl IDC_RSCDISPLAYATTRIBUTES_CONTENT;
		_ctrlButtonOK = _display displayctrl IDC_OK;
		_ctrlButtonCancel = _display displayctrl IDC_CANCEL;
		_ctrlButtonCustom = _display displayctrl IDC_RSCDISPLAYATTRIBUTES_BUTTONCUSTOM;

		_ctrlBackgroundPos = ctrlposition _ctrlBackground;
		_ctrlTitlePos = ctrlposition _ctrlTitle;
		_ctrlContentPos = ctrlposition _ctrlContent;
		_ctrlButtonOKPos = ctrlposition _ctrlButtonOK;
		_ctrlButtonCancelPos = ctrlposition _ctrlButtonCancel;
		_ctrlButtonCustomPos = ctrlposition _ctrlButtonCustom;

		_ctrlTitleOffsetY = (_ctrlBackgroundPos select 1) - (_ctrlTitlePos select 1) - (_ctrlTitlePos select 3);
		_ctrlContentOffsetY = (_ctrlContentPos select 1) - (_ctrlBackgroundPos select 1);

		//--- Show fake map in the background
		_ctrlMap = _display displayctrl IDC_RSCDISPLAYCURATOR_MAINMAP;
		_ctrlMap ctrlenable false;
		if (visiblemap) then {
			_ctrlCuratorMap = (finddisplay IDD_RSCDISPLAYCURATOR) displayctrl IDC_RSCDISPLAYCURATOR_MAINMAP;
			_ctrlMap ctrlmapanimadd [0,ctrlmapscale _ctrlCuratorMap,_ctrlCuratorMap ctrlmapscreentoworld [0.5,0.5]];
			ctrlmapanimcommit _ctrlMap;
		} else {
			_ctrlMap ctrlshow false;
		};

		//--- Load default attributes
		_attributes = if (getnumber (_displayConfig >> "filterAttributes") > 0) then {missionnamespace getvariable ["BIS_fnc_initCuratorAttributes_attributes",[]]} else {["%ALL"]};
		_allAttributes = "%ALL" in _attributes;

		//--- Initialize attributes
		_posY = _ctrlContentOffsetY;
		_contentControls = _displayConfig >> "Controls" >> "Content" >> "Controls";
		_enableDebugConsole = ["DebugConsole",getnumber (missionconfigfile >> "enableDebugConsole")] call bis_fnc_getParamValue;
		_enableAdmin = (_enableDebugConsole == 1 && (isserver || serverCommandAvailable "#shutdown")) || _enableDebugConsole == 2;
		for "_i" from 0 to (count _contentControls - 1) do {
			_cfgControl = _contentControls select _i;
			if (isclass _cfgControl) then {
				_idc = getnumber (_cfgControl >> "idc");
				_control = _display displayctrl _idc;

				//--- Admin specific attribute
				_show = if (getnumber (_cfgControl >> "adminOnly") > 0) then {_enableAdmin} else {true};

				if ((_allAttributes || {_x == configname _cfgControl} count _attributes > 0) && _show) then {
					_controlPos = ctrlposition _control;
					_controlPos set [0,0];
					_controlPos set [1,_posY];
					_control ctrlsetposition _controlPos;
					_control ctrlcommit 0;
					_posY = _posY + (_controlPos select 3) + 0.005;
					ctrlsetfocus _control;
				} else {
					_control ctrlsetposition [0,0,0,0];
					_control ctrlcommit 0;
					_control ctrlshow false;
				};
			};
		};
		_posH = ((_posY + _ctrlContentOffsetY) min 0.9) * 0.5;

		_target = missionnamespace getvariable ["BIS_fnc_initCuratorAttributes_target",objnull];
		_name = switch (typename _target) do {
			case (typename objnull): {gettext (configfile >> "cfgvehicles" >> typeof _target >> "displayname")};
			case (typename grpnull): {groupid _target};
			case (typename []): {format ["%1: %3 #%2",groupid (_target select 0),_target select 1,localize "str_a3_cfgmarkers_waypoint_0"]};
			case (typename ""): {markertext _target};
		};
		_ctrlTitle ctrlsettext format [ctrltext _ctrlTitle,toupper _name];

		_ctrlTitlePos set [1,(0.5 - _posH) - (_ctrlTitlePos select 3) - _ctrlTitleOffsetY];
		_ctrlTitle ctrlsetposition _ctrlTitlePos;
		_ctrlTitle ctrlcommit 0;

		_ctrlContentPos set [1,0.5 - _posH];
		_ctrlContentPos set [3,_posH * 2];
		_ctrlContent ctrlsetposition _ctrlContentPos;
		_ctrlContent ctrlcommit 0;

		_ctrlBackgroundPos set [1,0.5 - _posH];
		_ctrlBackgroundPos set [3,_posH * 2];
		_ctrlBackground ctrlsetposition _ctrlBackgroundPos;
		_ctrlBackground ctrlcommit 0;

		_ctrlButtonOKPos set [1,0.5 + _posH + _ctrlTitleOffsetY];
		_ctrlButtonOK ctrlsetposition _ctrlButtonOKPos;
		_ctrlButtonOK ctrlcommit 0;
		ctrlsetfocus _ctrlButtonOK;

		_ctrlButtonCancelPos set [1,0.5 + _posH + _ctrlTitleOffsetY];
		_ctrlButtonCancel ctrlsetposition _ctrlButtonCancelPos;
		_ctrlButtonCancel ctrlcommit 0;

		_ctrlButtonCustomPos set [1,0.5 + _posH + _ctrlTitleOffsetY];
		_ctrlButtonCustom ctrlsetposition _ctrlButtonCustomPos;
		_ctrlButtonCustom ctrlcommit 0;

		//--- Close the display when entity is altered
		//[_display] spawn {
		//	disableserialization;
		//	_display = _this select 0;
		//	_target = missionnamespace getvariable ["BIS_fnc_initCuratorAttributes_target",objnull];
		//	switch (typename _target) do {
		//		case (typename objnull): {
		//			_isAlive = alive _target;
		//			waituntil {isnull _display || (_isAlive && !alive _target)};
		//		};
		//		case (typename grpnull): {
		//			waituntil {isnull _display || isnull _target};
		//		};
		//		case (typename []): {
		//			_grp = _target select 0;
		//			_wpCount = count waypoints _grp;
		//			waituntil {isnull _display || (count waypoints _grp != _wpCount)};
		//		};
		//		case (typename ""): {
		//			waituntil {isnull _display || markertype _target == ""};
		//		};
		//	};
		//	_display closedisplay 2;
		//};
	};
};








































_mode = _this select 0;
_params = _this select 1;

switch _mode do {
	case "onLoad": {
		
		_display = _params select 0;
		_displayConfig = configfile >> "GF_RscDisplayAttributesModuleMusic";

		_ctrlBackground = _display displayctrl IDC_RSCDISPLAYATTRIBUTES_BACKGROUND;
		_ctrlTitle = _display displayctrl IDC_RSCDISPLAYATTRIBUTES_TITLE;
		_ctrlContent = _display displayctrl IDC_RSCDISPLAYATTRIBUTES_CONTENT;
		_ctrlButtonOK = _display displayctrl IDC_OK;
		_ctrlButtonCancel = _display displayctrl IDC_CANCEL;
		_ctrlButtonCustom = _display displayctrl IDC_RSCDISPLAYATTRIBUTES_BUTTONCUSTOM;

		_ctrlBackgroundPos = ctrlposition _ctrlBackground;
		_ctrlTitlePos = ctrlposition _ctrlTitle;
		_ctrlContentPos = ctrlposition _ctrlContent;
		_ctrlButtonOKPos = ctrlposition _ctrlButtonOK;
		_ctrlButtonCancelPos = ctrlposition _ctrlButtonCancel;
		_ctrlButtonCustomPos = ctrlposition _ctrlButtonCustom;

		_ctrlTitleOffsetY = (_ctrlBackgroundPos select 1) - (_ctrlTitlePos select 1) - (_ctrlTitlePos select 3);
		_ctrlContentOffsetY = (_ctrlContentPos select 1) - (_ctrlBackgroundPos select 1);

		//--- Show fake map in the background
		//_ctrlMap = _display displayctrl IDC_RSCDISPLAYCURATOR_MAINMAP;
		//_ctrlMap ctrlenable false;
		//if (visiblemap) then {
		//	_ctrlCuratorMap = (finddisplay IDD_RSCDISPLAYCURATOR) displayctrl IDC_RSCDISPLAYCURATOR_MAINMAP;
		//	_ctrlMap ctrlmapanimadd [0,ctrlmapscale _ctrlCuratorMap,_ctrlCuratorMap ctrlmapscreentoworld [0.5,0.5]];
		//	ctrlmapanimcommit _ctrlMap;
		//} else {
		//	_ctrlMap ctrlshow false;
		//};

		//--- Load default attributes
		_attributes = if (getnumber (_displayConfig >> "filterAttributes") > 0) then {missionnamespace getvariable ["BIS_fnc_initCuratorAttributes_attributes",[]]} else {["%ALL"]};
		_allAttributes = "%ALL" in _attributes;

		//--- Initialize attributes
		_posY = _ctrlContentOffsetY;
		_contentControls = _displayConfig >> "Controls" >> "Content" >> "Controls";
		_enableDebugConsole = ["DebugConsole",getnumber (missionconfigfile >> "enableDebugConsole")] call bis_fnc_getParamValue;
		_enableAdmin = (_enableDebugConsole == 1 && (isserver || serverCommandAvailable "#shutdown")) || _enableDebugConsole == 2;
		for "_i" from 0 to (count _contentControls - 1) do {
			_cfgControl = _contentControls select _i;
			if (isclass _cfgControl) then {
				_idc = getnumber (_cfgControl >> "idc");
				_control = _display displayctrl _idc;

				//--- Admin specific attribute
				_show = if (getnumber (_cfgControl >> "adminOnly") > 0) then {_enableAdmin} else {true};

				if ((_allAttributes || {_x == configname _cfgControl} count _attributes > 0) && _show) then {
					_controlPos = ctrlposition _control;
					_controlPos set [0,0];
					_controlPos set [1,_posY];
					_control ctrlsetposition _controlPos;
					_control ctrlcommit 0;
					_posY = _posY + (_controlPos select 3) + 0.005;
					ctrlsetfocus _control;
				} else {
					_control ctrlsetposition [0,0,0,0];
					_control ctrlcommit 0;
					_control ctrlshow false;
				};
			};
		};
		_posH = ((_posY + _ctrlContentOffsetY) min 0.9) * 0.5;

		_target = missionnamespace getvariable ["BIS_fnc_initCuratorAttributes_target",objnull];
		_name = switch (typename _target) do {
			case (typename objnull): {gettext (configfile >> "cfgvehicles" >> typeof _target >> "displayname")};
			case (typename grpnull): {groupid _target};
			case (typename []): {format ["%1: %3 #%2",groupid (_target select 0),_target select 1,localize "str_a3_cfgmarkers_waypoint_0"]};
			case (typename ""): {markertext _target};
		};
		_ctrlTitle ctrlsettext format [ctrltext _ctrlTitle,toupper _name];

		_ctrlTitlePos set [1,(0.5 - _posH) - (_ctrlTitlePos select 3) - _ctrlTitleOffsetY];
		_ctrlTitle ctrlsetposition _ctrlTitlePos;
		_ctrlTitle ctrlcommit 0;

		_ctrlContentPos set [1,0.5 - _posH];
		_ctrlContentPos set [3,_posH * 2];
		_ctrlContent ctrlsetposition _ctrlContentPos;
		_ctrlContent ctrlcommit 0;

		_ctrlBackgroundPos set [1,0.5 - _posH];
		_ctrlBackgroundPos set [3,_posH * 2];
		_ctrlBackground ctrlsetposition _ctrlBackgroundPos;
		_ctrlBackground ctrlcommit 0;

		_ctrlButtonOKPos set [1,0.5 + _posH + _ctrlTitleOffsetY];
		_ctrlButtonOK ctrlsetposition _ctrlButtonOKPos;
		_ctrlButtonOK ctrlcommit 0;
		ctrlsetfocus _ctrlButtonOK;

		_ctrlButtonCancelPos set [1,0.5 + _posH + _ctrlTitleOffsetY];
		_ctrlButtonCancel ctrlsetposition _ctrlButtonCancelPos;
		_ctrlButtonCancel ctrlcommit 0;

		_ctrlButtonCustomPos set [1,0.5 + _posH + _ctrlTitleOffsetY];
		_ctrlButtonCustom ctrlsetposition _ctrlButtonCustomPos;
		_ctrlButtonCustom ctrlcommit 0;

		//--- Close the display when entity is altered
		[_display] spawn {
			disableserialization;
			_display = _this select 0;
			_target = missionnamespace getvariable ["BIS_fnc_initCuratorAttributes_target",objnull];
			switch (typename _target) do {
				case (typename objnull): {
					_isAlive = alive _target;
					waituntil {isnull _display || (_isAlive && !alive _target)};
				};
				case (typename grpnull): {
					waituntil {isnull _display || isnull _target};
				};
				case (typename []): {
					_grp = _target select 0;
					_wpCount = count waypoints _grp;
					waituntil {isnull _display || (count waypoints _grp != _wpCount)};
				};
				case (typename ""): {
					waituntil {isnull _display || markertype _target == ""};
				};
			};
			_display closedisplay 2;
		};
	//};
		
		
		
		
		
		
		
		
		
		
		
		
		
		_display = _params select 0;
		_ctrlValue = _display displayctrl IDC_RSCATTRIBUTEMUSIC_VALUE;
		_ctrlValue ctrladdeventhandler ["treeselchanged","['treeSelChanged',_this] call GF_fnc_musicDisplayFuncs;"];
		_musicClasses = [];
		_textRandom = format ["<%1>",localize "str_a3_bis_fnc_respawnmenuposition_random"];
		tvClear  _display;
		
		{
			_tvClass = _ctrlValue tvadd [[],gettext (_x >> "displayName")];
			_musicClasses set [count _musicClasses,tolower configname _x];

			_tvMusicClass = _ctrlValue tvadd [[_tvClass],_textRandom];
			_ctrlValue tvsetdata [[_tvClass,_tvMusicClass],configname _x];
			_ctrlValue tvsetvalue [[_tvClass,_tvMusicClass],-1];
		} foreach ((configfile >> "cfgMusicClasses") call bis_fnc_returnchildren);

		{
			_name = gettext (_x >> "name");
			_tvClass = _musicClasses find (tolower gettext (_x >> "musicClass"));
			if (_name != "" && _tvClass >= 0) then {
				_duration = getnumber (_x >> "duration");
				_durationText = [_duration / 60,"HH:MM"] call bis_fnc_timetostring;
				_tvMusic = _ctrlValue tvadd [[_tvClass],format ["(%2) %1",_name,_durationText]];
				_ctrlValue tvsetdata [[_tvClass,_tvMusic],configname _x];
				_ctrlValue tvsetvalue [[_tvClass,_tvMusic],_duration];
			};
		} foreach ((configfile >> "cfgMusic") call bis_fnc_returnchildren);

		for "_i" from 0 to (count _musicClasses - 1) do {
			_ctrlValue tvsortbyvalue [[_i],true];
		};

		_ctrlValue tvsetcursel [];//(uinamespace getvariable ["RscAttributeMusic_selected",[]]);
		//_unit setvariable ["RscAttributeMusic",nil];
	};
	case "confirmed": {
		_display = _params;
		_ctrlValue = _display displayctrl IDC_RSCATTRIBUTEMUSIC_VALUE;
		_music = _ctrlValue tvdata tvcursel _ctrlValue;
		_music remoteExec ["GF_fnc_playMusic",allPlayers];
		// [-1, {}] call CBA_fnc_globalExecute;
		
		//_music call GF_fnc_playMusic;
		
		//playmusic _music;
		
		//#AddExecute
		
		//_unit setvariable ["RscAttributeMusic",_music,true];
	};
	case "canceled": {
		_display = _params select 0;
		_display closeDisplay 2;
	};
	case "onUnload": {
		//if (isnil {_unit getvariable "RscAttributeMusic"}) then {
			playmusic "";
		//};
	};
	case "treeSelChanged": {
		_ctrlValue = _params select 0;
		_cursel = _params select 1;
		if (count _cursel == 2) then {
			_duration = _ctrlValue tvvalue _cursel;
			if (_duration < 0) then {
				_musicClass = _cursel select 0;
				_ctrlValue tvsetcursel [_musicClass,1 + floor random ((_ctrlValue tvcount [_musicClass]) - 1)];
			} else {
				_music = _ctrlValue tvdata _cursel;
				playMusic _music;
				//RscAttributeMusic_selected = _cursel;
			};
		};
	};
};