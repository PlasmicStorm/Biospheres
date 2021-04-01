// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function logEvent(_string, _severity){
	
	if(current_minute < 10)
		if(current_second < 10)
			var _date = string(current_hour) + ":0" + string(current_minute) + ":0" + string(current_second);
		else
			var _date = string(current_hour) + ":0" + string(current_minute) + ":" + string(current_second);
	else
		if(current_second < 10)
			var _date = string(current_hour) + ":" + string(current_minute) + ":0" + string(current_second);
		else
			var _date = string(current_hour) + ":" + string(current_minute) + ":" + string(current_second);
	
	switch(_severity) {
		default:
			show_debug_message(_date + " [DEBUG] " + _string)
			break;
		case SEVERITY.INFO:
			show_debug_message(_date + " [INFO] " + _string)
			break;
		case SEVERITY.WARNING:
			show_debug_message(_date + " [WARNING] " + _string)
			break;
		case SEVERITY.ERROR:
			show_debug_message(_date + " [ERROR] " + _string)
			break;
	}
}