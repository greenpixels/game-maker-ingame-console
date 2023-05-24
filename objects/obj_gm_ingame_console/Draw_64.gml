if(!is_open) return;
var _app_width = surface_get_width(application_surface);
var _app_height = surface_get_height(application_surface);

// Draw input box
draw_set_color(c_black)
draw_set_alpha(0.7);
draw_rectangle(0, 0, _app_width, _app_height, false);
draw_set_alpha(1);
draw_set_font(font); 
var _y = _app_height  - 5 -  string_height("W") + 1;
draw_rectangle(0, _y, _app_width, _y + string_height("W") + 1, false);

// Draw input text
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(8, _y + 1, input);

// Draw blinking input cursor
if(sin(current_time / 100) < .5) {
	draw_rectangle(8 + string_width(input) + 1, _y + 1, 8 + string_width(input) + 1, _y + string_height("W") - 1, false);	
}

//Draw command output
var _vertical_offset = 0;
draw_set_valign(fa_bottom);
for(var _i = array_length(output) - 1; _i >= 0; _i--) {
	var _log = output[_i];
	var _string = _log.message;
	var _height = string_height_ext(_log.message, -1, _app_width - 16);
	
	switch(_log.type) {
		case OUTPUT_TYPE.ERROR:
			draw_set_color(#FF3C24);
		break;
		
		case OUTPUT_TYPE.WARN:
			draw_set_color(#FFCE00);
		break;
		
		case OUTPUT_TYPE.ECHO:
			_string = $"> {_string}";
			draw_set_color(c_gray);
		break;
		
		default:
			draw_set_color(c_white);
		break;
	}
	
	draw_text_ext(8,_y - 5 - _vertical_offset, _string, -1, _app_width - 16);
	_vertical_offset += _height;
}