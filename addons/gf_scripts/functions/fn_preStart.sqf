#include "script_component.hpp"
diag_log "preGF";





uinamespace setvariable [
			"rscdisplayfunctionsviewer_script",
			compileFinal ( preprocessfilelinenumbers QPATHTOF(functions\hack\rscdisplayfunctionsviewer.sqf))
		];
		
[] spawn {
sleep 5;
diag_log "spawnDone";		
		uinamespace setvariable [
			"rscdisplayfunctionsviewer_script",
			compileFinal ( preprocessfilelinenumbers QPATHTOF(functions\hack\rscdisplayfunctionsviewer.sqf))
		];};